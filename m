Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KleuZ-0001mZ-UR
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 09:17:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KleqO-00074d-QL
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 07:12:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 07:12:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 07:12:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 03 Oct 2008 09:12:42 +0200
Message-ID: <gc4gla$8ho$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>
	<1222986336.5190.33.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <1222986336.5190.33.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Fri, 03 Oct 2008 07:17:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-10-2008 00:25, Richard Purdie wrote:
> Hi,
>
> On Thu, 2008-10-02 at 20:53 +0200, Koen Kooi wrote:
>> The changed described in
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-July/005819.html
>> are about to get committed.
>>
>> The patch can be previewed at
>> http://dominion.thruhere.net/koen/OE/staging-patch.txt
>
> I had a quick glance through that patch and you should probably rethink
> the bits below:
>
> +BUILDSDK_CPPFLAGS = "-isystem${STAGING_INCDIR}"
>   export CPPFLAGS = "${TARGET_CPPFLAGS}"
>   export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${layout_includedir}"
>
>   export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
> +BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>   export CFLAGS = "${TARGET_CFLAGS}"
>   export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
>
>
> These SDK things are a bit nuts and I suspect should be removed. I added
> them to fix some problem in Poky and I think they may not be needed now
> but I'm not 100% and need to find time to check. OE probably doesn't
> want them, at least yet.

OK

>
> @@ -404,7 +414,7 @@ FULL_OPTIMIZATION = "-fexpensive-optimiz
>   ##################################################################
>
>   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> -DEBUG_OPTIMIZATION = "-O -g"
> +DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
>
>
> I think OE changed this for a reason and Poky never merged that change?
> Maybe I don't remember right though?

AIUI you need -fno-omit-frame-pointer on ARM to do profiling, right?

regards,

Koen




