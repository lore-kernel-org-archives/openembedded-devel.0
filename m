Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfSa0-00038b-94 for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:35:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfSZM-0006z9-Vb for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:35:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:35:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:35:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 19 Jan 2011 08:23:31 +0100
Message-ID: <ih63hj$6lr$2@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>	<ih0tpc$ra$2@dough.gmane.org>
	<1295264891.4844.57.camel@mattotaupa>	<ih1f00$lhs$1@dough.gmane.org>
	<1295393495.32079.49.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295393495.32079.49.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] libomxil-bellagio: remove/delete unused versions 0.9.{0, 1, 2}
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
X-List-Received-Date: Wed, 19 Jan 2011 07:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-01-11 00:31, Paul Menzel wrote:
> Date: Tue Jan 18 16:55:14 2011 +0100
> 
> These version are not used anymore and 0.9.{0,1} do not even build with current FFmpeg [1].
> 
> 	$ zless minimal-dev/work/armv7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/temp/log.do_compile.16833
> 	[…]
> 	/bin/sh ../../../arm-oe-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -m
> 	no-thumb -DHAVE_CONFIG_H -I. -I../../..   -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -I/oe/build-minimal-eglibc/m
> 	inimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr//include   -I../../../include -I../../../src -I../../../src/base -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/arm
> 	v7a-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pthread -g -Wall -MT libomxffmpeg_la-omx_ffmpeg_colorconv_component.lo -MD -
> 	MP -MF .deps/libomxffmpeg_la-omx_ffmpeg_colorconv_component.Tpo -c -o libomxffmpeg_la-omx_ffmpeg_colorconv_component.lo `test -f 'omx_ffmpeg_colorconv_component.c' || echo './'`omx
> 	_ffmpeg_colorconv_component.c
> 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I..
> 	/../.. -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -I/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux
> 	-gnueabi/usr//include -I../../../include -I../../../src -I../../../src/base -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -fex
> 	pensive-optimizations -fomit-frame-pointer -frename-registers -Os -pthread -g -Wall -MT libomxffmpeg_la-omx_ffmpeg_colorconv_component.lo -MD -MP -MF .deps/libomxffmpeg_la-omx_ffmp
> 	eg_colorconv_component.Tpo -c omx_ffmpeg_colorconv_component.c  -fPIC -DPIC -o .libs/libomxffmpeg_la-omx_ffmpeg_colorconv_component.o
> 	omx_ffmpeg_colorconv_component.c: In function 'find_ffmpeg_pxlfmt':
> 	omx_ffmpeg_colorconv_component.c:72:23: error: 'PIX_FMT_RGBA32' undeclared (first use in this function)
> 	omx_ffmpeg_colorconv_component.c:72:23: note: each undeclared identifier is reported only once for each function it appears in
> 	omx_ffmpeg_colorconv_component.c: In function 'omx_ffmpeg_colorconv_component_BufferMgmtCallback':
> 	omx_ffmpeg_colorconv_component.c:799:13: warning: passing argument 2 of 'sws_scale' from incompatible pointer type
> 	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include/libswscale/swscale.h:195:5: note: expected 'const uint8_t * const*' but argument is of type 'uint8_t **'
> 	make[4]: *** [libomxffmpeg_la-omx_ffmpeg_colorconv_component.lo] Error 1
> 	make[4]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0/src/components/ffmpeg'
> 	make[3]: *** [all-recursive] Error 1
> 	make[3]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0/src/components'
> 	make[2]: *** [all-recursive] Error 1
> 	make[2]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0/src'
> 	make[1]: *** [all-recursive] Error 1
> 	make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0'
> 	make: *** [all] Error 2
> 	FATAL: oe_runmake failed
> 	ERROR: Function do_compile failed
> 
> 0.9.2 probably would build with a similar as [2]. Furthermore 0.9.2.1 has been around for over a year (77195e32 [2]).
> 
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/028804.html
> [2] http://patches.openembedded.org/patch/315/
> [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=77195e32400dd86facc038f61190139d38f14b31
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>  recipes/openmax/libomxil-bellagio_0.9.0.bb |    6 ------
>  recipes/openmax/libomxil-bellagio_0.9.1.bb |    6 ------
>  recipes/openmax/libomxil-bellagio_0.9.2.bb |    6 ------
>  3 files changed, 0 insertions(+), 18 deletions(-)
>  delete mode 100644 recipes/openmax/libomxil-bellagio_0.9.0.bb
>  delete mode 100644 recipes/openmax/libomxil-bellagio_0.9.1.bb
>  delete mode 100644 recipes/openmax/libomxil-bellagio_0.9.2.bb
> 
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.0.bb b/recipes/openmax/libomxil-bellagio_0.9.0.bb
> deleted file mode 100644
> index 70a0583..0000000
> --- a/recipes/openmax/libomxil-bellagio_0.9.0.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require ${PN}.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "6d6b6a75bc8751a7421b5e739c53ef6e"
> -SRC_URI[sha256sum] = "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d33040803cdaf0997e442c"
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.1.bb b/recipes/openmax/libomxil-bellagio_0.9.1.bb
> deleted file mode 100644
> index e738a9d..0000000
> --- a/recipes/openmax/libomxil-bellagio_0.9.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require ${PN}.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "757371e21e4f3653ce4d12d3ba0be1e0"
> -SRC_URI[sha256sum] = "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6d47909287a353a"
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.bb b/recipes/openmax/libomxil-bellagio_0.9.2.bb
> deleted file mode 100644
> index 98876ea..0000000
> --- a/recipes/openmax/libomxil-bellagio_0.9.2.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require ${PN}.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "42ab7383c4ca4093000ec7062289112b"
> -SRC_URI[sha256sum] = "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3e92a6a279c38fc"
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNNpFzMkyGM64RGpERAoYVAJ400uLWCTfU8OW1cO/i2gQ9ag0p7ACgonK8
KH+P/ckW6/ikyKTL2pOCTW4=
=Rrf1
-----END PGP SIGNATURE-----



