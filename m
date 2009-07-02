Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MMCoL-00056d-Hf
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 05:18:09 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM4009GQWM8CL98@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 22:06:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8D84014AF5F; Wed,
	01 Jul 2009 23:06:08 -0400 (EDT)
Date: Wed, 01 Jul 2009 23:06:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090702030608.GM20815@denix.org>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
	<1246474518-16737-1-git-send-email-marcin@juszkiewicz.com.pl>
	<h2gdab$e8d$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h2gdab$e8d$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 077/125] kexecboot: require	../linux/linux.inc, not recipes/linux/linux.inc.
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
X-List-Received-Date: Thu, 02 Jul 2009 03:18:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 09:27:06PM +0200, Koen Kooi wrote:
> On 01-07-09 20:54, Marcin Juszkiewicz wrote:
>> From: Chris Larson<clarson@mvista.com>
>>
>> linux-kexecboot.inc does a 'require recipes/linux/linux.inc', but it 
>> really
>> depends on how the upstream OpenEmbedded linux/linux.inc behaves, not 
>> whatever
>> the first one it finds in BBPATH does.  This broke builds for me combining
>> upstream OpenEmbedded with some local collections that do different things
>> with their kernels.
>>
>> Signed-off-by: Chris Larson<clarson@mvista.com>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/kexecboot/linux-kexecboot.inc |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/kexecboot/linux-kexecboot.inc 
>> b/recipes/kexecboot/linux-kexecboot.inc
>> index 31b6377..eba5d66 100644
>> --- a/recipes/kexecboot/linux-kexecboot.inc
>> +++ b/recipes/kexecboot/linux-kexecboot.inc
>> @@ -6,7 +6,7 @@ SRC_URI = "file://defconfig"
>>   LOGO_SIZE = '${@base_conditional("GUI_MACHINE_CLASS", "bigscreen", 
>> "vga", "qvga", d)}'
>>   SRC_URI += "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
>>
>> -require recipes/linux/linux.inc
>> +require ../linux/linux.inc
>>
>>   DONT_CHECK_KERNELSIZE = ""
>>   INITRAMFS_IMAGE = "initramfs-kexecboot-image"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


