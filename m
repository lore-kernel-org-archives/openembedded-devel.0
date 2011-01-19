Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfSV9-00031B-Hq for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:30:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfSUW-00056h-8c for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:30:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:30:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:30:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 19 Jan 2011 08:24:33 +0100
Message-ID: <ih63jh$6lr$4@dough.gmane.org>
References: <1295394843.32079.62.camel@mattotaupa>
	<1295395744.32079.63.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295395744.32079.63.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] gst-openmax: do not use `-Werror` in `CFLAGS` to fix build
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
X-List-Received-Date: Wed, 19 Jan 2011 07:30:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-01-11 01:09, Paul Menzel wrote:
> Date: Tue, 18 Jan 2011 16:34:51 +0100
> 
> Task `compile` fails with the following error using `angstrom-2008.1` for `MACHINE = "beagleboard"`.
> 
> 	arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I.. -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I./headers -I../gst-libs -I../gst-libs -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -Wall -Werror -g -DGST_DISABLE_DEPRECATED -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/includ
e -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -I../util -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -MT libgstomx_la-gstomx_base_videoenc.lo -MD -MP -MF .deps/libgstomx_la-gstomx_base_videoenc.Tpo -c gstomx_base_videoenc.c  -fPIC -DPIC -o .libs/libgstomx_la-gstomx_base_videoenc.o
> 	cc1: warnings being treated as errors
> 	gstomx_base_videoenc.c: In function 'sink_setcaps':
> 	gstomx_base_videoenc.c:239: error: implicit declaration of function 'free'
> 	gstomx_base_videoenc.c:239: error: incompatible implicit declaration of built-in function 'free'
> 	gstomx_base_videoenc.c: In function 'omx_setup':
> 	gstomx_base_videoenc.c:326: error: incompatible implicit declaration of built-in function 'free'
> 	cc1: warnings being treated as errors
> 	gstomx_base_filter.c: In function 'setup_ports':
> 	gstomx_base_filter.c:65: error: implicit declaration of function 'free'
> 	gstomx_base_filter.c:65: error: incompatible implicit declaration of built-in function 'free'
> 	gstomx_base_filter.c: In function 'output_loop':
> 	gstomx_base_filter.c:387: error: format '%d' expects type 'int', but argument 8 has type 'OMX_U32'
> 	gstomx_base_filter.c: In function 'pad_chain':
> 	gstomx_base_filter.c:476: error: format '%lu' expects type 'long unsigned int', but argument 8 has type 'guint'
> 	make[2]: *** [libgstomx_la-gstomx_base_videoenc.lo] Error 1
> 	make[2]: *** Waiting for unfinished jobs....
> 	cc1: warnings being treated as errors
> 	gstomx_base_videodec.c: In function 'settings_changed_cb':
> 	gstomx_base_videodec.c:111: error: implicit declaration of function 'calloc'
> 	gstomx_base_videodec.c:111: error: incompatible implicit declaration of built-in function 'calloc'
> 	gstomx_base_videodec.c:135: error: implicit declaration of function 'free'
> 	gstomx_base_videodec.c:135: error: incompatible implicit declaration of built-in function 'free'
> 	gstomx_base_videodec.c: In function 'sink_setcaps':
> 	gstomx_base_videodec.c:179: error: incompatible implicit declaration of built-in function 'calloc'
> 	gstomx_base_videodec.c:208: error: incompatible implicit declaration of built-in function 'free'
> 	gstomx_base_videodec.c: In function 'omx_setup':
> 	gstomx_base_videodec.c:229: error: incompatible implicit declaration of built-in function 'calloc'
> 	gstomx_base_videodec.c:291: error: incompatible implicit declaration of built-in function 'free'
> 	make[2]: *** [libgstomx_la-gstomx_base_filter.lo] Error 1
> 	make[2]: *** [libgstomx_la-gstomx_base_videodec.lo] Error 1
> 	arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I.. -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I./headers -I../gst-libs -I../gst-libs -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -Wall -Werror -g -DGST_DISABLE_DEPRECATED -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/includ
e -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2 -I../util -isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -MT libgstomx_la-gstomx.lo -MD -MP -MF .deps/libgstomx_la-gstomx.Tpo -c gstomx.c -o libgstomx_la-gstomx.o >/dev/null 2>&1
> 	mv -f .deps/libgstomx_la-gstomx.Tpo .deps/libgstomx_la-gstomx.Plo
> 	make[2]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gst-openmax-0.10.0.4-r0/gst-openmax-0.10.0.4/omx'
> 	make[1]: *** [all-recursive] Error 1
> 	make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gst-openmax-0.10.0.4-r0/gst-openmax-0.10.0.4'
> 	make: *** [all] Error 2
> 	FATAL: oe_runmake failed
> 	ERROR: Function do_compile failed
> 
> `configure.ac` contains
> 
> 	dnl These flags can be overridden at make time:
> 	dnl make ERROR_CFLAGS=
> 	AC_DEFUN([AG_GST_SET_ERROR_CFLAGS],
> 	[
> 		AC_REQUIRE([AC_PROG_CC])
> 		AC_REQUIRE([AS_COMPILER_FLAG])
> 
> 		[…]
> 
> 		dnl if asked for, add -Werror if supported
> 		if test "x$1" != "xno"
> 		then
> 		  AS_COMPILER_FLAG(-Werror, ERROR_CFLAGS="$ERROR_CFLAGS -Werror")
> 
> and so set `ERROR_FLAGS` only to `-Wall`. This fixes the build.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>


Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/openmax/gst-openmax_0.10.0.4.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/openmax/gst-openmax_0.10.0.4.bb b/recipes/openmax/gst-openmax_0.10.0.4.bb
> index b05b65f..66a8e47 100644
> --- a/recipes/openmax/gst-openmax_0.10.0.4.bb
> +++ b/recipes/openmax/gst-openmax_0.10.0.4.bb
> @@ -7,6 +7,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/pre/gst-openmax-${PV
>  
>  inherit autotools
>  
> +EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wall'"
> +
>  FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
>  FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
>  FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.*a"
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNNpGxMkyGM64RGpERAkexAJ0dnEExJEP//i1O7p7S+Bgtn8zAwgCglcv3
CDgB+u7RBQy53EsKWsMs+ZM=
=4uKq
-----END PGP SIGNATURE-----



