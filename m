Received: from [72.167.82.86] (helo=p3plsmtpa01-06.prod.phx3.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1MXSQd-0000vQ-S1
	for openembedded-devel@openembedded.org; Sun, 02 Aug 2009 06:12:12 +0200
Received: (qmail 17852 invoked from network); 2 Aug 2009 03:56:52 -0000
Received: from unknown (75.49.209.3)
	by p3plsmtpa01-06.prod.phx3.secureserver.net (72.167.82.86) with ESMTP;
	02 Aug 2009 03:56:51 -0000
Message-ID: <4A750E80.2020704@mwester.net>
Date: Sat, 01 Aug 2009 22:56:48 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.22) Gecko/20090605 Thunderbird/2.0.0.22 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>	<1244144325.6678.0.camel@port4>	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>	<1244206438.6643.46.camel@port4>	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>	<1244635240.28486.7.camel@hammer.suse.cz>	<20090730105711.GA29595@zlo.nu>	<1248952464.21030.110.camel@hammer.suse.cz>	<4A73D370.3050104@mwester.net>
	<4A74ECAA.6020308@mwester.net>
In-Reply-To: <4A74ECAA.6020308@mwester.net>
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's do_configure [PATCH]
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
X-List-Received-Date: Sun, 02 Aug 2009 04:12:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mike Westerhof wrote:
> [top-posting] Any thoughts, anyone?  Should I revert the original change
> (and the follow-on)?  Or is this unique to SlugOS again, and I should
> add an override to the change?  Or might anyone who knows libtool and
> libltdl have any suggestions on where to look?  It would even be helpful
> if anyone else can tell me if libgphoto2 and pulseaudio build correctly
> for their distro!

And I think the answer is no, it doesn't build correctly for anybody.
 The following line seems to be incorrect in the original patch:

+               export ac_cv_path_SED=${ac_cv_path_GREP=/bin/sed}
                                                   ^^^^

Mike (mwester)


> Thanks.
> Mike (mwester)
> 
> 
> Mike Westerhof wrote:
>> Stanislav Brabec wrote:
>>> Marc Olzheim wrote:
>>>> I'm not sure how you tested this, but there are quotes missing, so that
>>>> the "-E" argument to "grep" is passed to "export" instead. I guess some
>>>> shells have a "-E" flag to "export", so it is silently ignored, but mine
>>>> don't.
>>> I tried both versions - quoted and unquoted - before the commit. Both
>>> worked for me, that is why I committed the shorter one.
>>>
>>> Well, adding quotes is safe. Can you check your configure output and
>>> host shell version?
>>>
>>> My configure output:
>>>
>>> checking for a sed that does not truncate output... (cached) /bin/sed
>>> checking for grep that handles long lines and -e... (cached) /bin/sed
>>> checking for egrep... (cached) /bin/grep -E
>>> checking for fgrep... (cached) /bin/grep -F
>>>
>>> It indicates, that it worked correctly.
>>>
>>> My native shell is:
>>>
>>> /OE/openembedded/build> sh --version
>>> GNU bash, version 4.0.24(1)-release (x86_64-suse-linux-gnu)
>>>
>> The original commit seems to break libltdl.so as well (which was not
>> fixed by the subsequent patch to add quotes).  Libtool builds, but
>> certain dependencies fail.  Host platforms affected include Fedora and
>> Ubuntu, and neither uses dash.
>>
>> Failing packages fail in do_configure, with a missing symbol in libltdl:
>> logs from the nslu2 autobuilder are up on tinderbox:
>>
>> http://tinderbox.openembedded.net/public/logs/task/2207578.txt
>>
>> Here's the message in config.log from that build:
>>
>> configure:16081: checking for lt_dlinit in -lltdl
>> configure:16116: arm-linux-gnueabi-gcc -march=armv5te -mtune=xscale
>> -mno-thumb-interwork -mno-thumb -mno-thumb-interwork -mno-thumb -o
>> conftest
>> -isystem/home/slug/slugos/tmp/staging/armv5te-linux-gnueabi/usr/include
>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
>> -Wall -Wmissing-declarations -Wmissing-prototypes
>> -isystem/home/slug/slugos/tmp/staging/armv5te-linux-gnueabi/usr/include
>> -I$(top_srcdir) -I$(top_builddir) -I$(top_srcdir)/libgphoto2_port
>> -I$(top_srcdir)/libgphoto2 -I$(top_builddir)/libgphoto2
>> -isystem/home/slug/slugos/tmp/staging/armv5te-linux-gnueabi/usr/include
>> -Wall -g -D_GPHOTO2_INTERNAL_CODE
>> -L/home/slug/slugos/tmp/staging/armv5te-linux-gnueabi/usr/lib
>> -Wl,-rpath-link,/home/slug/slugos/tmp/staging/armv5te-linux-gnueabi/usr/lib
>> -Wl,-O1 -Wl,--hash-style=gnu conftest.c -lltdl   >&5
>> /home/slug/slugos/tmp/staging/armv5te-linux-gnueabi/usr/lib/libltdl.so:
>> undefined reference to `lt_libltdl_LTX_preloaded_symbols'
>> collect2: ld returned 1 exit status
>> configure:16122: $? = 1
>>
>>
>> Mike (mwester)
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 



