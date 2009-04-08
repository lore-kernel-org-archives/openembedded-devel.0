Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LrNtP-0005si-Uw
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 04:52:02 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>)
	id 1LrNqU-0006fU-7y; Tue, 07 Apr 2009 21:48:58 -0500
Message-ID: <49DC10A0.5020007@dls.net>
Date: Tue, 07 Apr 2009 21:49:04 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1239036480-19478-1-git-send-email-jeremy.laine@bolloretelecom.eu>
In-Reply-To: <1239036480-19478-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 216.145.245.198
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@m4x.org>
Subject: Re: [STABLE][PATCH] flite-1.3: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Wed, 08 Apr 2009 02:52:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jeremy Lainé wrote:
> From: Jeremy Lainé <jeremy.laine@m4x.org>
> 
> 
> Signed-off-by: Jeremy Lainé <jeremy.laine@m4x.org>
> ---
>  recipes/flite/flite-1.3/flite-1.3-Makefile.patch |    3 ++-
>  recipes/flite/flite_1.3.bb                       |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/flite/flite-1.3/flite-1.3-Makefile.patch b/recipes/flite/flite-1.3/flite-1.3-Makefile.patch
> index 9a1a82e..5b532fd 100644
> --- a/recipes/flite/flite-1.3/flite-1.3-Makefile.patch
> +++ b/recipes/flite/flite-1.3/flite-1.3-Makefile.patch
> @@ -317,9 +317,10 @@ Index: config/common_make_rules
>   	@ rm -rf shared_os && mkdir shared_os
>   	@ rm -f $@ $(LIBDIR)/$@.${PROJECT_VERSION} $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION} 
>   	@ (cd shared_os && ar x ../$<)
> - 	@ (cd shared_os && $(CC) -shared -Wl,-soname,$@.${PROJECT_SHLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os)
> +-	@ (cd shared_os && $(CC) -shared -Wl,-soname,$@.${PROJECT_SHLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os)
>  -	@ ln -s $(LIBDIR)/$@.${PROJECT_VERSION} $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION}
>  -	@ ln -s $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION} $(LIBDIR)/$@
> ++	@ (cd shared_os && $(CC) $(LDFLAGS) -shared -Wl,-soname,$@.${PROJECT_SHLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os)
>  +	#@ ln -s $(LIBDIR)/$@.${PROJECT_VERSION} $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION}
>  +	#@ ln -s $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION} $(LIBDIR)/$@
>  +	@ ln -s $@.${PROJECT_VERSION} $@.${PROJECT_SHLIB_VERSION}
> diff --git a/recipes/flite/flite_1.3.bb b/recipes/flite/flite_1.3.bb
> index 360ccb0..b553689 100644
> --- a/recipes/flite/flite_1.3.bb
> +++ b/recipes/flite/flite_1.3.bb
> @@ -1,6 +1,6 @@
>  require flite.inc
>  
> -PR = "r3"
> +PR = "r4"
>  
>  EXTRA_OECONF = "--with-audio=oss --enable-shared"
>  

Results in:

NOTE: make INSTALLBINDIR=/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/bin INSTALLLIBDIR=/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/lib INSTALLINCDIR=/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/include install
Installing
mkdir -p /u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/bin
mkdir -p /u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/lib
mkdir -p /u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/include
/u/slug/slugos/tmp/staging/i686-linux/usr/bin/install -c -m 644 include/*.h /u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/flite-1.3-r4/image/usr/include
`../build/armeb-linux-gnueabi/lib/libflite.a' -> `./libflite.a'
`../build/armeb-linux-gnueabi/lib/libflite.shared.a' -> `./libflite.shared.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmu_time_awb.a' -> `./libflite_cmu_time_awb.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmu_time_awb.shared.a' -> `./libflite_cmu_time_awb.shared.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmu_us_kal.a' -> `./libflite_cmu_us_kal.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmu_us_kal.shared.a' -> `./libflite_cmu_us_kal.shared.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmu_us_kal16.a' -> `./libflite_cmu_us_kal16.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmu_us_kal16.shared.a' -> `./libflite_cmu_us_kal16.shared.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmulex.a' -> `./libflite_cmulex.a'
`../build/armeb-linux-gnueabi/lib/libflite_cmulex.shared.a' -> `./libflite_cmulex.shared.a'
`../build/armeb-linux-gnueabi/lib/libflite_usenglish.a' -> `./libflite_usenglish.a'
`../build/armeb-linux-gnueabi/lib/libflite_usenglish.shared.a' -> `./libflite_usenglish.shared.a'
making libflite.so
/u/slug/slugos/tmp/cross/armv5teb/lib/gcc/armeb-linux-gnueabi/4.2.4/../../../../armeb-linux-gnueabi/bin/ld: cannot find -lflite
collect2: ld returned 1 exit status
make[2]: *** [libflite.so] Error 1
make[1]: *** [install] Error 2
make: *** [install] Error 2
FATAL: oe_runmake failed


