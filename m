Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KjIx3-0005xJ-DC
	for openembedded-devel@openembedded.org; Fri, 26 Sep 2008 21:26:05 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KjItO-00045s-IZ
	for openembedded-devel@openembedded.org; Fri, 26 Sep 2008 19:22:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 26 Sep 2008 19:22:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Sep 2008 19:22:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 26 Sep 2008 21:22:09 +0200
Message-ID: <gbjcp1$mqv$1@ger.gmane.org>
References: <20080925042321.GC4510@denix.org>
	<20080926173901.GA16384@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <20080926173901.GA16384@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: base.bbclass problem? Was: package-stagefile-shell() breaks if DEPLOY_DIR is outside of TMPDIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Sep 2008 19:26:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-09-2008 19:39, Denys Dmytriyenko wrote:
> Does anybody have any comments? Am I doing something totally wrong? Or is it
> too low-level so nobody wants to touch it? Please let me know. Thanks.


package_stagefile_shell is there to manually mark files that need to get 
revived to make a build work, which as it happens is with bootloaders 
and kernel images :)
I don't think it's limited to deploy, but your patch is a step in the 
right direction.

regards,

Koen


> On Thu, Sep 25, 2008 at 12:23:21AM -0400, Denys Dmytriyenko wrote:
>> Hi,
>>
>> I just submitted a bug report #4580, but wanted to follow up here as my
>> description/fix maybe controversial or at least touches the low-level stuff.
>>
>> Here is the description from the ticket:
>>
>> When DEPLOY_DIR is configured to be outside of TMPDIR, building a kernel
>> breaks, as "cp" cannot copy a file into itself:
>>
>> cp: `/OE/deploy/glibc/images/omap3evm/uImage.bin' and `/OE/deploy/glibc/images/omap3evm/uImage.bin' are the same file
>>
>> What happens is inside the do_deploy() function of the kernel.bbclass it calls
>> package-stagefile-shell() with the uImage binary in DEPLOY_DIR as a parameter:
>>
>> package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>>
>> That function is supposed to save a copy of the file in the staging directory
>> (packaged-staging magic):
>>
>> package_stagefile_shell() {
>>          if [ "$PSTAGING_ACTIVE" = "1" ]; then
>>                  srcfile=$1
>>                  destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`
>>                  destdir=`dirname $destfile`
>>                  mkdir -p $destdir
>>                  cp -dp $srcfile $destfile
>>          fi
>> }
>>
>> The problem there is it substitutes (sed) TMPDIR with PSTAGE_TMPDIR_STAGE in
>> file's path. It works if DEPLOY_DIR is inside TMPDIR, but the path remains the
>> same if otherwise, leading to the mentioned error.
>>
>> The function above is a shell counterpart of the python package_stagefile(). I
>> grepped both of them and it appears the python function is used inside the
>> package.bbclass to do some actual staging, while the shell function is only
>> used in recipes for kernels and bootloaders (u-boot, x-load) and is always
>> called with files in DEPLOY_DIR.
>>
>> So, changing above sed command to:
>>
>> sed s#${DEPLOY_DIR}#${PSTAGE_TMPDIR_STAGE}#`
>>
>> makes it work and doesn't seem to break anything else for me. I think the
>> function maybe renamed to package_stagefile_deploy() to reflect its purpose,
>> but that would require changes in several recipes.
>>
>> I'm attaching the actual patch for review. It works for me, but I'm not sure
>> how correct it is, so I'm asking here. Thanks.
>>
>> --
>> Denys
>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index 540b891..1172b8f 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -389,7 +389,7 @@ def package_stagefile(file, d):
>>   package_stagefile_shell() {
>>   	if [ "$PSTAGING_ACTIVE" = "1" ]; then
>>   		srcfile=$1
>> -		destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`
>> +		destfile=`echo $srcfile | sed s#${DEPLOY_DIR}#${PSTAGE_TMPDIR_STAGE}#`
>>   		destdir=`dirname $destfile`
>>   		mkdir -p $destdir
>>   		cp -dp $srcfile $destfile




