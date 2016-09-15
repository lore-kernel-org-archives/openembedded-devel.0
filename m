Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 37B01700F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:39:38 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l132so4447934wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZNMDP6Cl+EeCQ06CM6bZNXhQ+ifIGR+w5ZfnumvanOg=;
	b=RLhTYzg9ooyHfgL8ib7B8tX1ux1fIu/wkVWyUI+0HHqjr+pI7nGN+N1LP7lJZgACDh
	O5cEsoUdyWqJoLjLgpm7cP5Hw8ZCBS3V7sqkpPXYKvjoCqtlu690IoyHzFF0VjHik5lo
	ShivYR/Wyd0EaTfInQVGGeBGf+PaHlRHb5WTPmCf04UEUzFU4cf0mpLiULBFrAuPt6Oq
	PJtMo/8k6ywLRmWwPmryz/lYVmqo3Xyei1sXKuOomoV6WAru4SVQmx33eesMjidBMZZv
	G8O234N/TQRl8/dJmFs9wDnyoxqwHcFaEIEyLQR6FrO2rL0dyq97EGjQTCeZTr2QG0WK
	Lagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZNMDP6Cl+EeCQ06CM6bZNXhQ+ifIGR+w5ZfnumvanOg=;
	b=bAfbFHNxnsKBAuvw3w7GHVspLHndqnnKnGMDK8Am3oEukmi1r7rhD/VyE9PrVhkGjf
	AUbE+WUmsxZEBx7WMoEdsf1sA/rJASgLNtkSCk69HHdQiVdD5b1GhuKlLxnvd31LZHAh
	dl3UEhQEaMYPvUQR900qGjSpEUqHN2DPc1G1BqaqK9ZElxEHU6N8kh4pU4Q0TNNhWufv
	pPksnPWMyOiI/NLFdSCEDut985hzMo+ChzaxvhsdPXWej4Q6pcNrO9NzPh9TEnWtRWt6
	STWNyWSlTL/MFfeN2iw3AvbtOGtbIs53j1WJKxZ7XX/rdGuvQvPIk9cR4aQzKwcTcnPd
	PQww==
X-Gm-Message-State: AE9vXwMQlNGpzEtTikRyniXrgD1jXZexuLYXTwAVGT+kgevQ0y1P2g1hIkwgP5zxetP5CN4Nsfbug/BGkrchrg==
X-Received: by 10.194.141.163 with SMTP id rp3mr10714500wjb.124.1473971979089; 
	Thu, 15 Sep 2016 13:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.137.202 with HTTP; Thu, 15 Sep 2016 13:39:38 -0700 (PDT)
In-Reply-To: <1473970910-2046-1-git-send-email-ross.burton@intel.com>
References: <1473970910-2046-1-git-send-email-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2016 22:39:38 +0200
Message-ID: <CA+chaQfXzaqCyQMZ-ou+p7m4_vFg4pvSa2Sm60t3MX6TL8yraw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] portaudio: upgrade to latest release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 20:39:39 -0000
Content-Type: text/plain; charset=UTF-8

This PV change looks like a downgrade as old recipe had SRCREV = "1387" and
new PV indicates 1919.

On Thu, Sep 15, 2016 at 10:21 PM, Ross Burton <ross.burton@intel.com> wrote:

> PortAudio has moved from Subversion to Git, so the SRC_URI needs to be
> updated.
> They also have stable tarballs so instead of taking a random git hash use
> the
> latest release.  This was svn revision 1919 so to keep the version order
> correct
> hard-code this into the PV.
>
> The license is in fact MIT, so use that in LICENSE instead of PortAudio
> (which
> wasn't defined anywhere, resulting in QA warnings).
>
> Add a patch to pass LDFLAGS to all the compiles.
>
> Remove the useless assignment to TESTS.  Install the test suite manually
> using
> libtool so that we don't install the wrapper scripts.
>
> Explicitly disable ASIHPI to avoid floating dependencies.
>
> Remove redundant commented-out lines.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-support/portaudio/files/ldflags.patch  | 51
> ++++++++++++++++++++++
>  .../portaudio/portaudio-v19_20140130.bb            | 32 ++++++++++++++
>  .../recipes-support/portaudio/portaudio-v19_svn.bb | 32 --------------
>  3 files changed, 83 insertions(+), 32 deletions(-)
>  create mode 100644 meta-oe/recipes-support/portaudio/files/ldflags.patch
>  create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_
> 20140130.bb
>  delete mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
>
> diff --git a/meta-oe/recipes-support/portaudio/files/ldflags.patch
> b/meta-oe/recipes-support/portaudio/files/ldflags.patch
> new file mode 100644
> index 0000000..aca93a5
> --- /dev/null
> +++ b/meta-oe/recipes-support/portaudio/files/ldflags.patch
> @@ -0,0 +1,51 @@
> +Upstream forgot to pass LDFLAGS to everything apart from the main library.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 5e1a764..61ecdd1 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -171,20 +171,20 @@ lib/$(PALIB): lib-stamp $(LTOBJS) $(MAKEFILE)
> $(PAINC)
> +       @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX)
> $(PA_LDFLAGS) -o lib/$(PALIB) $(LTOBJS) $(DLL_LIBS)
> +
> + $(ALL_TESTS): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) test/%.c
> +-      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
> +-      @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(LDFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
> +
> + $(EXAMPLES): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) examples/%.c
> +-      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
> +-      @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(LDFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
> +
> + $(SELFTESTS): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) qa/%.c
> +-      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
> +-      @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(LDFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
> +
> + bin/paloopback: lib/$(PALIB) $(MAKEFILE) $(PAINC) $(LOOPBACK_OBJS)
> +-      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
> +-      @WITH_ASIO_TRUE@ $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS)  $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS)
> $(LDFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
> ++      @WITH_ASIO_TRUE@ $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@
> $(CXXFLAGS) $(LDFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
> +
> + install: lib/$(PALIB) portaudio-2.0.pc
> +       $(INSTALL) -d $(DESTDIR)$(libdir)
> +@@ -224,10 +224,10 @@ distclean: clean
> +       $(CC) -c $(CFLAGS) $< -o $@
> +
> + %.lo: %.c $(MAKEFILE) $(PAINC)
> +-      $(LIBTOOL) --mode=compile $(CC) -c $(CFLAGS) $< -o $@
> ++      $(LIBTOOL) --mode=compile $(CC) -c $(CFLAGS) $(LDFLAGS) $< -o $@
> +
> + %.lo: %.cpp $(MAKEFILE) $(PAINC)
> +-      $(LIBTOOL) --mode=compile --tag=CXX $(CXX) -c $(CXXFLAGS) $< -o $@
> ++      $(LIBTOOL) --mode=compile --tag=CXX $(CXX) -c $(CXXFLAGS)
> $(LDFLAGS) $< -o $@
> +
> + %.o: %.cpp $(MAKEFILE) $(PAINC)
> +       $(CXX) -c $(CXXFLAGS) $< -o $@
> diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
> b/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
> new file mode 100644
> index 0000000..8f2b0db
> --- /dev/null
> +++ b/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "A portable audio library"
> +SECTION = "libs/multimedia"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02
> df"
> +
> +PV = "v19+svnr1919"
> +
> +SRC_URI = "http://www.portaudio.com/archives/pa_stable_v19_20140130.tgz \
> +           file://ldflags.patch"
> +SRC_URI[md5sum] = "7f220406902af9dca009668e198cbd23"
> +SRC_URI[sha256sum] = "8fe024a5f0681e112c6979808f684c
> 3516061cc51d3acc0b726af98fc96c8d57"
> +
> +S = "${WORKDIR}/portaudio"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG ??= "alsa jack"
> +PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
> +PACKAGECONFIG[jack] = "--with-jack, --without-jack, jack,"
> +
> +EXTRA_OECONF = "--without-oss --without-asihpi"
> +
> +do_install_append() {
> +    mkdir --parents ${D}${bindir}
> +    for b in ${B}/bin/pa*; do
> +        # Bit nasty, should always work
> +        ${B}/*-libtool --mode install install $b ${D}${bindir}
> +    done
> +}
> +
> +PACKAGES += "portaudio-examples"
> +FILES_portaudio-examples = "${bindir}"
> diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
> b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
> deleted file mode 100644
> index c8d7378..0000000
> --- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SUMMARY = "A portable audio library"
> -SECTION = "libs/multimedia"
> -LICENSE = "PortAudio"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02
> df"
> -
> -PV = "v19+svnr${SRCPV}"
> -
> -SRCREV = "1387"
> -SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;
> module=trunk;protocol=http"
> -S = "${WORKDIR}/trunk"
> -
> -inherit autotools pkgconfig
> -
> -PACKAGECONFIG ??= "alsa jack"
> -PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
> -PACKAGECONFIG[jack] = "--with-jack, --without-jack, jack,"
> -
> -EXTRA_OECONF = "--without-oss"
> -
> -TESTS = "  pa_devs patest1      patest_hang patest_many
>  patest_prime patest_sine patest_stop     patest_write_sine        \
> -pa_fuzz    patest_buffer        patest_in_overflow  patest_maxsines
>  patest_read_record  patest_sine8         patest_sync              \
> -pa_minlat  patest_callbackstop  patest_latency      patest_multi_sine
>  patest_record       patest_sine_formats  patest_toomanysines      \
> -paqa_devs  patest_clip          patest_leftright    patest_out_underflow
> patest_ringmix      patest_sine_time     patest_underflow         \
> -paqa_errs  patest_dither        patest_longsine     patest_pink
>  patest_saw          patest_start_stop    patest_wire"
> -
> -# DEFINES = PA_USE_OSS=1 HAVE_LIBPTHREAD=1
> -# DEFINES += PA_LITTLE_ENDIAN
> -
> -# INCLUDEPATH = ../pa_common
> -
> -PACKAGES += "portaudio-examples"
> -FILES_portaudio-examples = "${bindir}"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

