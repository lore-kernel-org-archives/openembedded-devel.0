Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JWELz-00088n-03
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 18:21:51 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JWEKn-0003Od-PS
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 11:20:18 -0600
Message-ID: <47CC3350.8010209@dls.net>
Date: Mon, 03 Mar 2008 11:20:16 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1204303564.8126.38.camel@dax.rpnet.com>
In-Reply-To: <1204303564.8126.38.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 216.145.245.197
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2008 17:22:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Richard Purdie wrote:
> Hi,
>
> OE.dev is now just about ready to switch to using sysroot. The compilers
> have been updated to activate sysroot and the fixes I/Poky have for
> various pkgconfig issues have been committed....

Unslung now fails when building gcc-cross.  I presume this is a result 
of this activity (it build before the Feb 28 commits), but I do not 
understand the issues about sysroot and all well enough to even begin to 
be able to troubleshoot.  Is the patch attached to this original email 
supposed to fix this?  Is there something broken in the recipe, as 
implied by this thread, that I need to fix?  If so, what would that be?

[skipping over the normal compilation output in the logs...]
gcc -DIN_GCC -DHAVE_CONFIG_H 
-isystem/stuff/slug/unslung/tmp/staging/i686-linux/include -O2 -DIN_GCC 
-DCROSS_\
COMPILE -W -Wall -Wwrite-strings -Wstrict-prototypes 
-Wmissing-prototypes -pedantic -Wno-long-long -Wno-error\
 -DHAVE_CONFIG_H -DGENERATOR_FILE 
-isystem/stuff/slug/unslung/tmp/staging/i686-linux/include -W -Wall -Wwrite\
-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic 
-Wno-long-long  -Wno-error -I. -I.. -I/stuff/slug\
/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/gcc/fixinc 
-I/stuff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/g\
cc-3.4.4/gcc/fixinc/.. 
-I/stuff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/gcc/fixinc/../config 
-I/st\
uff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/gcc/fixinc/../../include  
-o fixincl fixincl.o fixtest\
s.o fixfixes.o server.o procopen.o fixlib.o 
/stuff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/build.i\
686-linux.armeb-linux/gcc/../libiberty/libiberty.a
echo timestamp > full-stamp
./fixincl -v < /dev/null
'fixincl version 1.1'
chmod 755 ../fixinc.sh
make[4]: Leaving directory 
`/stuff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/build.i686-linux.armeb-\
linux/gcc/fixinc'
The directory that should contain system headers does not exist:
  /stuff/slug/unslung/tmp/staging/armeb-linux/usr/include
make[3]: *** [stmp-fixinc] Error 1
make[3]: Leaving directory 
`/stuff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/build.i686-linux.armeb-\
linux/gcc'
make[2]: *** [all-gcc] Error 2
make[2]: Leaving directory 
`/stuff/slug/unslung/tmp/work/gcc-cross-3.4.4-r8/gcc-3.4.4/build.i686-linux.armeb-\
linux'
FATAL: oe_runmake failed



In particular, note the error message which claims that the 
...gcc-3.4.4/usr/include file does not exist.  No, it does not -- it's 
at ...gcc-3.4.4/include instead.

Thanks,
Mike (mwester)


