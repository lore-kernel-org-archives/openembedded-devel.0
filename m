Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVXM-0003jK-Vp for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:50:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVWl-0001Of-HJ for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:50:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:50:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Sep 2010 08:46:43 +0200
Message-ID: <i622oj$jp9$2@dough.gmane.org>
References: <201009030248.15592.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <201009030248.15592.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/5] clutter: clean builds for clutter 1.0
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
X-List-Received-Date: Mon, 06 Sep 2010 06:50:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-09-10 02:48, Andreas Mueller wrote:
> 
> * all 0.9 recipes (are actually 1.0rc) & files referenced were removed
> * all 0.8 recipes were renamed to clutter*-0.8 to ensure parallel
>   installation with later versions
> * clutter-common.inc as container for helpers was created (also from
>   clutter-fpu.inc)
> * clutter-1.0_1.0.10.bb was renamed to clutter_1.0.10.bb
> * clutter-gst_1.2.0.bb introduced the first ever buildable in GLES
>   environment without further effords
> * clutter-gtk_0.10.2.bb is the latest version which supports clutter 1.0.x
>   (later ones complain on configure for clutter 1.2.x)
> * clutter* examples / tests are build properly and packed in extra
>   packages. For clutter-interactive tests menu entries (graphics) are added /
>   test-conformance-run runs all conformance tests (crashing tests do not abort)
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Acked-by: Koen Kooi <k-kooi@ti.com>


> ---
>  .../clutter/clutter-0.8/enable-tests-r2990.patch   |   50 ++++++++++++
>  recipes/clutter/clutter-0.8_git.bb                 |   15 ++++
>  recipes/clutter/clutter-0.9_git.bb                 |   23 ------
>  recipes/clutter/clutter-1.0_1.0.10.bb              |   22 -----
>  recipes/clutter/clutter-box2d.inc                  |   21 ++++--
>  .../clutter-box2d/example-data-location.patch      |   11 +++
>  recipes/clutter/clutter-box2d_0.10.0.bb            |    3 +
>  recipes/clutter/clutter-common.inc                 |   28 +++++++
>  recipes/clutter/clutter-fpu.inc                    |    6 --
>  recipes/clutter/clutter-gst-0.9_git.bb             |   13 ---
>  recipes/clutter/clutter-gst.inc                    |   40 ++++++++--
>  recipes/clutter/clutter-gst_1.2.0.bb               |    9 ++
>  .../clutter-gtk-0.10.2/gtk-deprecated.patch        |   29 +++++++
>  recipes/clutter/clutter-gtk.inc                    |   26 +++++-
>  recipes/clutter/clutter-gtk_0.10.2.bb              |   13 +++
>  recipes/clutter/clutter-gtk_git.bb                 |   11 ---
>  recipes/clutter/clutter.inc                        |   82 ++++++++++++++++----
>  recipes/clutter/clutter/enable-tests-r2990.patch   |   50 ------------
>  recipes/clutter/clutter/sample.desktop             |    9 ++
>  recipes/clutter/clutter/test-conformance-run       |    8 ++
>  recipes/clutter/clutter_0.8+git.bb                 |   15 ----
>  recipes/clutter/clutter_1.0.10.bb                  |   29 +++++++
>  recipes/clutter/files/enable_tests.patch           |   32 --------
>  23 files changed, 338 insertions(+), 207 deletions(-)
>  create mode 100644 recipes/clutter/clutter-0.8/enable-tests-r2990.patch
>  create mode 100644 recipes/clutter/clutter-0.8_git.bb
>  delete mode 100644 recipes/clutter/clutter-0.9_git.bb
>  delete mode 100644 recipes/clutter/clutter-1.0_1.0.10.bb
>  create mode 100644 recipes/clutter/clutter-box2d/example-data-location.patch
>  create mode 100644 recipes/clutter/clutter-common.inc
>  delete mode 100644 recipes/clutter/clutter-fpu.inc
>  delete mode 100644 recipes/clutter/clutter-gst-0.9_git.bb
>  create mode 100644 recipes/clutter/clutter-gst_1.2.0.bb
>  create mode 100644 recipes/clutter/clutter-gtk-0.10.2/gtk-deprecated.patch
>  create mode 100644 recipes/clutter/clutter-gtk_0.10.2.bb
>  delete mode 100644 recipes/clutter/clutter-gtk_git.bb
>  delete mode 100644 recipes/clutter/clutter/enable-tests-r2990.patch
>  create mode 100644 recipes/clutter/clutter/sample.desktop
>  create mode 100755 recipes/clutter/clutter/test-conformance-run
>  delete mode 100644 recipes/clutter/clutter_0.8+git.bb
>  create mode 100644 recipes/clutter/clutter_1.0.10.bb
>  delete mode 100644 recipes/clutter/files/enable_tests.patch
> 
> diff --git a/recipes/clutter/clutter-0.8/enable-tests-r2990.patch b/recipes/clutter/clutter-0.8/enable-tests-r2990.patch
> new file mode 100644
> index 0000000..4f449b1
> --- /dev/null
> +++ b/recipes/clutter/clutter-0.8/enable-tests-r2990.patch
> @@ -0,0 +1,50 @@
> +---
> + tests/Makefile.am   |    7 ++++++-
> + tests/test-actors.c |    2 +-
> + tests/test-text.c   |    2 +-
> + 3 files changed, 8 insertions(+), 3 deletions(-)
> +
> +Index: clutter/tests/Makefile.am
> +===================================================================
> +--- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
> ++++ clutter/tests/Makefile.am	2008-06-26 16:46:50.000000000 +0100
> +@@ -1,4 +1,4 @@
> +-noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
> ++bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
> +                   test-actors test-behave test-text test-entry test-project \
> + 		  test-perspective test-rotate test-depth \
> + 		  test-threads test-timeline test-timeline-dup-frames \
> +@@ -17,8 +17,8 @@
> + 		  test-invariants
> + 
> + if X11_TESTS
> +-noinst_PROGRAMS += test-pixmap
> +-noinst_PROGRAMS += test-devices
> ++bin_PROGRAMS += test-pixmap
> ++bin_PROGRAMS += test-devices
> + endif
> + 
> + INCLUDES = -I$(top_srcdir)/ -I$(top_srcdir)/clutter -I$(top_builddir)/clutter
> +@@ -73,4 +73,9 @@
> + test_invariants_SOURCES           = test-invariants.c
> + test_devices_SOURCES              = test-devices.c
> + 
> ++test_textdir           = $(pkgdatadir)
> ++test_text_DATA         = test-text.c
> ++test_actorsdir         = $(pkgdatadir)
> ++test_actors_DATA       = redhand.png
> ++
> + EXTRA_DIST = redhand.png test-script.json
> +Index: clutter/tests/test-actors.c
> +===================================================================
> +--- clutter.orig/tests/test-actors.c	2008-06-26 16:46:26.000000000 +0100
> ++++ clutter/tests/test-actors.c	2008-06-26 16:46:31.000000000 +0100
> +@@ -195,7 +195,7 @@
> +       /* Create a texture from file, then clone in to same resources */
> +       if (i == 0)
> + 	{
> +-	  if ((oh->hand[i] = clutter_texture_new_from_file ("redhand.png",
> ++	  if ((oh->hand[i] = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png",
> + 							    &error)) == NULL)
> + 	    {
> + 	      g_error ("image load failed: %s", error->message);
> diff --git a/recipes/clutter/clutter-0.8_git.bb b/recipes/clutter/clutter-0.8_git.bb
> new file mode 100644
> index 0000000..692154d
> --- /dev/null
> +++ b/recipes/clutter/clutter-0.8_git.bb
> @@ -0,0 +1,15 @@
> +require clutter.inc
> +
> +CLUTTER_REV = "af16378899699376fe7e84c7c11eb3bb5c4668cd"
> +
> +PV = "0.8.8"
> +PR = "${INC_PR}.0"
> +PR_append = "+gitr${CLUTTER_REV}"
> +
> +SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git;branch=clutter-0-8;rev=${CLUTTER_REV} \
> +           file://enable-tests-r2990.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +
> +ARM_INSTRUCTION_SET = "arm"
> diff --git a/recipes/clutter/clutter-0.9_git.bb b/recipes/clutter/clutter-0.9_git.bb
> deleted file mode 100644
> index 5bbd8a8..0000000
> --- a/recipes/clutter/clutter-0.9_git.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -require clutter.inc
> -
> -SRCREV = "13e055a351f83c56b895b131566a6e842d24ed2a"
> -
> -PV = "1.1.0"
> -PR = "${INC_PR}.0"
> -PR_append = "+git${SRCREV}"
> -
> -SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git \
> -           file://enable_tests.patch "
> -S = "${WORKDIR}/git"
> -
> -BASE_CONF += "--disable-introspection"
> -
> -PARALLEL_MAKE = ""
> -
> -do_compile_prepend() {
> -	for i in $(find ${S} -name Makefile) ; do
> -		sed -i -e s:-Werror::g $i
> -	done
> -    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i ; done )
> -}
> -
> diff --git a/recipes/clutter/clutter-1.0_1.0.10.bb b/recipes/clutter/clutter-1.0_1.0.10.bb
> deleted file mode 100644
> index 93fb893..0000000
> --- a/recipes/clutter/clutter-1.0_1.0.10.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -require clutter.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI = "http://source.clutter-project.org/sources/clutter/1.0/clutter-${PV}.tar.bz2 \
> -"
> -SRC_URI[md5sum] = "bf48e85291cba33f3f149f4eefe759f0"
> -SRC_URI[sha256sum] = "6fb98dc4d16a3a98be734cf0a6cc4f8d8179800603c3e41011c414eeaf1f456b"
> -
> -S = "${WORKDIR}/clutter-${PV}"
> -
> -BASE_CONF += "--disable-introspection"
> -
> -PARALLEL_MAKE = ""
> -
> -do_compile_prepend() {
> -	for i in $(find ${S} -name Makefile) ; do
> -		sed -i -e s:-Werror::g $i
> -	done
> -    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i ; done )
> -}
> -
> diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-box2d.inc
> index 2b39916..7541335 100644
> --- a/recipes/clutter/clutter-box2d.inc
> +++ b/recipes/clutter/clutter-box2d.inc
> @@ -1,17 +1,26 @@
> -DESCRIPTION = "Clutter Box2D"
> +DESCRIPTION = "Clutter Box2D physics engine integration"
>  HOMEPAGE = "http://www.clutter-project.org/"
> -LICENSE = "GPLv2"
> +LICENSE = "LGPLv2.1"
>  
> -DEPENDS = "clutter-1.0"
> +DEPENDS = "clutter"
> +
> +INC_PR = "r1"
>  
>  # The main clutter lib is machine specific so we need to be too
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit autotools pkgconfig gtk-doc
>  
> -EXTRA_OECONF += "--disable-introspection"
> +require clutter-common.inc
> +
> +do_configure_prepend() {
> +	make_all_execs_installable
> +}
>  
>  do_install_append () {
> -	install -d ${D}${bindir}
> -	install ${S}/examples/.libs/blockbox ${D}${bindir}
> +	install -m 755 -d ${D}${datadir}/${PN}-examples
> +	install -m 755 ${S}/examples/redhand.png ${D}${datadir}/${PN}-examples
>  }
> +
> +PACKAGES =+ "${PN}-examples"
> +FILES_${PN}-examples = "${bindir}/* ${datadir}/${PN}-examples"
> diff --git a/recipes/clutter/clutter-box2d/example-data-location.patch b/recipes/clutter/clutter-box2d/example-data-location.patch
> new file mode 100644
> index 0000000..3aaab54
> --- /dev/null
> +++ b/recipes/clutter/clutter-box2d/example-data-location.patch
> @@ -0,0 +1,11 @@
> +--- a/examples/blockbox.h.old	2010-07-20 15:05:30.000000000 +0200
> ++++ b/examples/blockbox.h	2010-08-23 18:20:03.000000000 +0200
> +@@ -8,7 +8,7 @@
> + #include "scenes.h"
> + #include "util.h"
> + 
> +-#define ASSETS_DIR "./"
> ++#define ASSETS_DIR "/usr/share/clutter-box2d-examples/"
> + extern gboolean simulating;
> + 
> + #endif
> diff --git a/recipes/clutter/clutter-box2d_0.10.0.bb b/recipes/clutter/clutter-box2d_0.10.0.bb
> index 5f3a063..28dfeb3 100644
> --- a/recipes/clutter/clutter-box2d_0.10.0.bb
> +++ b/recipes/clutter/clutter-box2d_0.10.0.bb
> @@ -1,7 +1,10 @@
>  require clutter-box2d.inc
>  
> +PR = "${INC_PR}.0"
> +
>  SRC_URI = "http://source.clutter-project.org/sources/clutter-box2d/0.10/clutter-box2d-${PV}.tar.bz2 \
>             file://introspection.diff \
> +           file://example-data-location.patch \
>  "
>  
>  SRC_URI[md5sum] = "51618976ca6a5d536c4eac5f0e120d9d"
> diff --git a/recipes/clutter/clutter-common.inc b/recipes/clutter/clutter-common.inc
> new file mode 100644
> index 0000000..65b490a
> --- /dev/null
> +++ b/recipes/clutter/clutter-common.inc
> @@ -0,0 +1,28 @@
> +# common functions for all clutter-libraries
> +
> +# all .debug stuff goes to clutter*-dbg
> +FILES_${PN}-dbg += "${bindir}/.debug"
> +
> +# helper for (git)-recipes which do not have gtk-doc.make
> +copy_gtk_doc_make() {
> +	if [ -e ${WORKDIR}/gtk-doc.make ] ; then
> +		cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
> +	else
> +		touch ${S}/gtk-doc.make
> +	fi
> +}
> +
> +# clutter packs assume building and target are the same
> +# for us they are definitely not
> +make_all_execs_installable() {
> +	for i in $(find ${S} -name Makefile.am) ; do
> +		sed -i -e s:noinst_PROGRAMS:bin_PROGRAMS:g $i
> +	done
> +}
> +
> +#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
> +def get_clutter_fpu_setting(bb, d):
> +	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> +		return "--without-fpu"
> +	return ""
> +
> diff --git a/recipes/clutter/clutter-fpu.inc b/recipes/clutter/clutter-fpu.inc
> deleted file mode 100644
> index 21a16fe..0000000
> --- a/recipes/clutter/clutter-fpu.inc
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -
> -def get_clutter_fpu_setting(bb, d):
> -	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> -		return "--without-fpu"
> -	return ""
> -
> diff --git a/recipes/clutter/clutter-gst-0.9_git.bb b/recipes/clutter/clutter-gst-0.9_git.bb
> deleted file mode 100644
> index 3bf7d48..0000000
> --- a/recipes/clutter/clutter-gst-0.9_git.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require clutter-gst.inc
> -
> -DEPENDS = "clutter-0.9 gstreamer gst-plugins-base"
> -
> -SRCREV = "379b63b013af463210e54470693aedfa9009f4dc"
> -PV = "0.9.0"
> -PR = "r4"
> -PR_append = "+git${SRCREV}"
> -
> -SRC_URI = "git://git.clutter-project.org/clutter-gst.git;protocol=git \
> -           file://gtk-doc.make"
> -
> -S = "${WORKDIR}/git"
> diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.inc
> index 8fa30b4..b25f31e 100644
> --- a/recipes/clutter/clutter-gst.inc
> +++ b/recipes/clutter/clutter-gst.inc
> @@ -1,19 +1,41 @@
> -DESCRIPTION = "Clutter GStreamer"
> +DESCRIPTION = "Clutter GStreamer integration library"
>  HOMEPAGE = "http://www.clutter-project.org/"
> -LICENSE = "LGPL"
> +LICENSE = "LGPLv2.1"
> +
> +INC_PR = "r1"
>  
>  DEPENDS = "clutter gstreamer gst-plugins-base"
>  
> -PACKAGES =+ "${PN}-examples"
> -FILES_${PN}-examples = "${bindir}/video-player ${bindir}/video-sink ${bindir}/audio"
> +require clutter-common.inc
>  
>  inherit autotools pkgconfig
>  
> +align_examples_data_location() {
> +	for full_name in $(find ${S}/examples -name *.png) ; do
> +		data_name=${full_name##*/}
> +		for i in $(find ${S}/examples -name *.c) ; do
> +			sed -i -e s:${data_name}:${datadir}/${PN}-examples/${data_name}:g $i
> +		done
> +	done
> +}
> +
>  do_configure_prepend() {
> -	if [ -e ${WORKDIR}/gtk-doc.make ] ; then
> -		cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
> -	else
> -		touch ${S}/gtk-doc.make
> -	fi
> +	copy_gtk_doc_make
> +	make_all_execs_installable
> +	align_examples_data_location
> +}
> +
> +do_install_append () {
> +	install -m 755 -d ${D}${datadir}/${PN}-examples
> +	for i in $(find ${S}/examples -name *.png) ; do
> +		install -m 755 ${i} ${D}${datadir}/${PN}-examples
> +	done
>  }
>  
> +PACKAGES =+ "${PN}-examples"
> +FILES_${PN}-examples = "${bindir}/video-* ${datadir}/${PN}-examples"
> +
> +PACKAGES =+ "${PN}-tests"
> +FILES_${PN}-tests = "${bindir}/test-*"
> +
> +
> diff --git a/recipes/clutter/clutter-gst_1.2.0.bb b/recipes/clutter/clutter-gst_1.2.0.bb
> new file mode 100644
> index 0000000..d7f7f02
> --- /dev/null
> +++ b/recipes/clutter/clutter-gst_1.2.0.bb
> @@ -0,0 +1,9 @@
> +require clutter-gst.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.2/clutter-gst-${PV}.tar.bz2 \
> +          "
> +
> +SRC_URI[md5sum] = "1048815f0c9152edbfdc59a94d0e3b87"
> +SRC_URI[sha256sum] = "ed3357c10fe82727091616296abd53c752e15c816a4030474f1919c0d347e5d3"
> diff --git a/recipes/clutter/clutter-gtk-0.10.2/gtk-deprecated.patch b/recipes/clutter/clutter-gtk-0.10.2/gtk-deprecated.patch
> new file mode 100644
> index 0000000..93eb6a9
> --- /dev/null
> +++ b/recipes/clutter/clutter-gtk-0.10.2/gtk-deprecated.patch
> @@ -0,0 +1,29 @@
> +--- a/clutter-gtk/gtk-clutter-embed.c.old	2009-06-27 16:21:06.000000000 +0200
> ++++ b/clutter-gtk/gtk-clutter-embed.c	2010-09-01 12:46:25.000000000 +0200
> +@@ -131,7 +131,7 @@
> + {
> +   GtkClutterEmbedPrivate *priv = GTK_CLUTTER_EMBED (widget)->priv;
> + 
> +-  if (GTK_WIDGET_REALIZED (widget))
> ++  if (gtk_widget_get_realized (widget))
> +     clutter_actor_show (priv->stage);
> + 
> +   GTK_WIDGET_CLASS (gtk_clutter_embed_parent_class)->show (widget);
> +@@ -222,7 +222,7 @@
> + 
> +   clutter_actor_realize (priv->stage);
> + 
> +-  if (GTK_WIDGET_VISIBLE (widget))
> ++  if (gtk_widget_get_visible (widget))
> +     clutter_actor_show (priv->stage);
> + 
> +   gtk_clutter_embed_send_configure (GTK_CLUTTER_EMBED (widget));
> +@@ -246,7 +246,7 @@
> + 
> +   widget->allocation = *allocation;
> + 
> +-  if (GTK_WIDGET_REALIZED (widget))
> ++  if (gtk_widget_get_realized (widget))
> +     {
> +       gdk_window_move_resize (widget->window,
> +                               allocation->x, allocation->y,
> diff --git a/recipes/clutter/clutter-gtk.inc b/recipes/clutter/clutter-gtk.inc
> index d9b01ca..6e624c5 100644
> --- a/recipes/clutter/clutter-gtk.inc
> +++ b/recipes/clutter/clutter-gtk.inc
> @@ -1,11 +1,27 @@
> -DESCRIPTION = "Clutter GTK+"
> +DESCRIPTION = "Clutter GTK+ integration library"
>  HOMEPAGE = "http://www.clutter-project.org/"
> -LICENSE = "LGPL"
> +LICENSE = "LGPLv2.1"
>  
> -DEPENDS = "gtk+"
> +INC_PR = "r1"
>  
> -PACKAGES =+ "${PN}-examples"
> -FILES_${PN}-examples = "${bindir}/gtk-clutter-test ${bindir}/gtk-clutter-events ${bindir}/gtk-clutter-multistage"
> +DEPENDS = "gtk+ clutter"
> +require clutter-common.inc
>  
>  inherit autotools pkgconfig gtk-doc
>  
> +do_configure_prepend() {
> +	make_all_execs_installable
> +
> +	# Align the examples data location
> +	for i in $(find ${S}/examples -name *.c) ; do
> +		sed -i -e 's:\"redhand.png\":\"${datadir}/${PN}-examples/redhand.png\":g' $i
> +	done
> +}
> +
> +do_install_append () {
> +	install -m 755 -d ${D}${datadir}/${PN}-examples
> +	install -m 755 ${S}/examples/redhand.png ${D}${datadir}/${PN}-examples
> +}
> +
> +PACKAGES =+ "${PN}-examples"
> +FILES_${PN}-examples = "${bindir}/* ${datadir}/${PN}-examples"
> diff --git a/recipes/clutter/clutter-gtk_0.10.2.bb b/recipes/clutter/clutter-gtk_0.10.2.bb
> new file mode 100644
> index 0000000..4f3d570
> --- /dev/null
> +++ b/recipes/clutter/clutter-gtk_0.10.2.bb
> @@ -0,0 +1,13 @@
> +# NOTE: This is the last version configuring properly with clutter-1.0.x
> +
> +require clutter-gtk.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI = "http://source.clutter-project.org/sources/clutter-gtk/0.10/clutter-gtk-${PV}.tar.bz2 \
> +           file://gtk-deprecated.patch \
> +          "
> +
> +SRC_URI[md5sum] = "bb275b07f722631ff1764dd212843d11"
> +SRC_URI[sha256sum] = "de2af20d44d2237811f27ee081b9df999a0af30ee0d410cd7c2872622386b0c9"
> +
> diff --git a/recipes/clutter/clutter-gtk_git.bb b/recipes/clutter/clutter-gtk_git.bb
> deleted file mode 100644
> index c3e3d49..0000000
> --- a/recipes/clutter/clutter-gtk_git.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require clutter-gst.inc
> -
> -SRCREV = "70f4b0cbd568dfa265484a03be3bd08ad15ed12e"
> -PV = "0.9.0+git${SRCREV}"
> -PR = "r0"
> -
> -SRC_URI = "git://git.clutter-project.org/clutter-gtk.git;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -DEPENDS = "clutter"
> diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
> index 0c7eaa8..e29164f 100644
> --- a/recipes/clutter/clutter.inc
> +++ b/recipes/clutter/clutter.inc
> @@ -1,11 +1,17 @@
>  DESCRIPTION = "Clutter graphics library"
>  HOMEPAGE = "http://www.clutter-project.org/"
> -LICENSE = "LGPL"
> +LICENSE = "LGPLv2.1"
> +
> +INC_SRC_URI = "file://sample.desktop \
> +               file://test-conformance-run \
> +              "
> +
> +PARALLEL_MAKE = ""
>  
>  COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|overo|
> omap3evm|omap5912osk)"
>  
>  STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
> -BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
> +BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
>  
>  DEPENDS = "${STDDEPENDS} virtual/libgl"
>  EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
> @@ -37,24 +43,70 @@ EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
>  PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
>  LDFLAGS_append_mx31ads = " -lpvrNULLWSEGL -lstdc++ "
>  
> -INC_PR = "r1"
> +INC_PR = "r2"
>  
>  inherit autotools pkgconfig gtk-doc
>  
> -PACKAGES =+ "clutter-examples"
> -FILES_clutter-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
> +PACKAGES =+ "${PN}-tests"
> +FILES_${PN}-tests = "${bindir}/test-* \
> +                     ${datadir}/applications/test-* \
> +                     ${datadir}/${PN}-tests"
> +
> +# cally is part of clutter since 1.3.8 (c0f753d108b7a2ad23dbf5a5b596f80175442927)
> +PACKAGES =+ "${PN}-cally-examples"
> +FILES_${PN}-cally-examples = "${bindir}/cally-*-example"
>  
> -#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
> -require clutter-fpu.inc
> +require clutter-common.inc
>  
> -#Fix up some weirdness in the docs
>  do_configure_prepend() {
> -    if [ -e ${WORKDIR}/gtk-doc.make ] ; then
> -        cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
> -    else
> -        touch ${S}/gtk-doc.make
> -    fi
> -    sed -i s:doc/reference/Makefile::g ${S}/configure.ac
> -    sed -i s:doc::g ${S}/Makefile.am
> +	# Fix up some weirdness in the docs
> +	copy_gtk_doc_make
> +
> +	# Fix up 'Requires' entries in *.pc.in to prevent from "NOTE: couldn't find pkgconfig module '${requires}' in any package"
> +	for i in $(find ${S} -name '*.pc.in') ; do
> +		sed -i s:'${requires}':'@CLUTTER_REQUIRES@':g $i
> +	done
> +	
> +	make_all_execs_installable
> +}
> +
> +# helper to (re)build shader source files from *.glsl	
> +rebuild_shader_sources() {
> +	if [ $# == 1 ] && [ $1 ] &&  [ -d $1 ] ; then
> +		glespath=$1
> +		for i in ${glespath}/*.glsl ; do 
> +			# *.h
> +			sh ${glespath}/stringify.sh -h $i > "${i%.glsl}.h"
> +			# *.c
> +			sh ${glespath}/stringify.sh $i > "${i%.glsl}.c"
> +		done
> +	else
> +		echo Warning: "clutter.inc::rebuild_shader_sources: called with invalid parameter ${1}!"
> +	fi
>  }
>  
> +# tests are not prepared for installation - some helpers
> +install_tests() {
> +	install -m 755 -d ${D}${bindir}/
> +	install -m 755 -d ${D}${datadir}/applications
> +
> +	# conformance tests script
> +	install -m 0755 ${WORKDIR}/test-conformance-run ${D}${bindir}
> +
> +	# interactive tests desktop entries
> +	for i in ${S}/tests/interactive/*.o ; do 
> +		test_path=`echo ${i} | sed -e 's:\.o::' -e 's:test_interactive-::'`
> +		test_name=`echo ${test_path} | sed 's:.*/::'`
> +		if [ -e ${test_path} ] ; then 
> +			sed -e s:NAME:${test_name}: \
> +			    -e "s:EXEC:${bindir}/test-interactive ${test_name}:" \
> +			     ${WORKDIR}/sample.desktop > ${D}${datadir}/applications/${test_name}.desktop
> +		fi
> +	done
> +
> +	# test data
> +	install -m 755 -d ${D}${datadir}/${PN}-tests
> +	for i in $(find ${S}/tests/data -name *.png -o -name *.json ) ; do
> +		install -m 0755 ${i} ${D}${datadir}/${PN}-tests/
> +	done
> +}
> diff --git a/recipes/clutter/clutter/enable-tests-r2990.patch b/recipes/clutter/clutter/enable-tests-r2990.patch
> deleted file mode 100644
> index 4f449b1..0000000
> --- a/recipes/clutter/clutter/enable-tests-r2990.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> ----
> - tests/Makefile.am   |    7 ++++++-
> - tests/test-actors.c |    2 +-
> - tests/test-text.c   |    2 +-
> - 3 files changed, 8 insertions(+), 3 deletions(-)
> -
> -Index: clutter/tests/Makefile.am
> -===================================================================
> ---- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
> -+++ clutter/tests/Makefile.am	2008-06-26 16:46:50.000000000 +0100
> -@@ -1,4 +1,4 @@
> --noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
> -+bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
> -                   test-actors test-behave test-text test-entry test-project \
> - 		  test-perspective test-rotate test-depth \
> - 		  test-threads test-timeline test-timeline-dup-frames \
> -@@ -17,8 +17,8 @@
> - 		  test-invariants
> - 
> - if X11_TESTS
> --noinst_PROGRAMS += test-pixmap
> --noinst_PROGRAMS += test-devices
> -+bin_PROGRAMS += test-pixmap
> -+bin_PROGRAMS += test-devices
> - endif
> - 
> - INCLUDES = -I$(top_srcdir)/ -I$(top_srcdir)/clutter -I$(top_builddir)/clutter
> -@@ -73,4 +73,9 @@
> - test_invariants_SOURCES           = test-invariants.c
> - test_devices_SOURCES              = test-devices.c
> - 
> -+test_textdir           = $(pkgdatadir)
> -+test_text_DATA         = test-text.c
> -+test_actorsdir         = $(pkgdatadir)
> -+test_actors_DATA       = redhand.png
> -+
> - EXTRA_DIST = redhand.png test-script.json
> -Index: clutter/tests/test-actors.c
> -===================================================================
> ---- clutter.orig/tests/test-actors.c	2008-06-26 16:46:26.000000000 +0100
> -+++ clutter/tests/test-actors.c	2008-06-26 16:46:31.000000000 +0100
> -@@ -195,7 +195,7 @@
> -       /* Create a texture from file, then clone in to same resources */
> -       if (i == 0)
> - 	{
> --	  if ((oh->hand[i] = clutter_texture_new_from_file ("redhand.png",
> -+	  if ((oh->hand[i] = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png",
> - 							    &error)) == NULL)
> - 	    {
> - 	      g_error ("image load failed: %s", error->message);
> diff --git a/recipes/clutter/clutter/sample.desktop b/recipes/clutter/clutter/sample.desktop
> new file mode 100644
> index 0000000..34dec2b
> --- /dev/null
> +++ b/recipes/clutter/clutter/sample.desktop
> @@ -0,0 +1,9 @@
> +[Desktop Entry]
> +Version=1.0
> +Name=NAME
> +Comment=Clutter Test
> +Exec=EXEC
> +Icon=star
> +Type=Application
> +Categories=Graphics;
> +
> diff --git a/recipes/clutter/clutter/test-conformance-run b/recipes/clutter/clutter/test-conformance-run
> new file mode 100755
> index 0000000..7efd896
> --- /dev/null
> +++ b/recipes/clutter/clutter/test-conformance-run
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +# Simple script to run all conformance tests. 
> +# Works around abortion on crash
> +for i in `test-conformance -l` ; do
> +	test-conformance $@ -p $i
> +done
> +
> diff --git a/recipes/clutter/clutter_0.8+git.bb b/recipes/clutter/clutter_0.8+git.bb
> deleted file mode 100644
> index 692154d..0000000
> --- a/recipes/clutter/clutter_0.8+git.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require clutter.inc
> -
> -CLUTTER_REV = "af16378899699376fe7e84c7c11eb3bb5c4668cd"
> -
> -PV = "0.8.8"
> -PR = "${INC_PR}.0"
> -PR_append = "+gitr${CLUTTER_REV}"
> -
> -SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git;branch=clutter-0-8;rev=${CLUTTER_REV} \
> -           file://enable-tests-r2990.patch"
> -
> -S = "${WORKDIR}/git"
> -
> -
> -ARM_INSTRUCTION_SET = "arm"
> diff --git a/recipes/clutter/clutter_1.0.10.bb b/recipes/clutter/clutter_1.0.10.bb
> new file mode 100644
> index 0000000..020ebf2
> --- /dev/null
> +++ b/recipes/clutter/clutter_1.0.10.bb
> @@ -0,0 +1,29 @@
> +require clutter.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI = "http://source.clutter-project.org/sources/clutter/1.0/clutter-${PV}.tar.bz2 \
> +           ${INC_SRC_URI} \
> +          "
> +
> +# recommended for --clutter-debug / --cogl-debug params
> +BASE_CONF += " --enable-debug"
> +
> +do_compile_prepend() {
> +	rebuild_shader_sources ${S}/clutter/cogl/cogl/driver/gles
> +	# align test data location
> +	for full_name in $(find ${S}/tests/data -name *.png -o -name *.json) ; do
> +		data_name=${full_name##*/}
> +		for i in $(find ${S}/tests -name *.c -o -name *.json) ; do
> +			sed -i -e s:${data_name}:${datadir}/${PN}-tests/${data_name}:g $i
> +		done
> +	done
> +}
> +
> +do_install() {
> +	autotools_do_install
> +	install_tests
> +}
> +
> +SRC_URI[md5sum] = "bf48e85291cba33f3f149f4eefe759f0"
> +SRC_URI[sha256sum] = "6fb98dc4d16a3a98be734cf0a6cc4f8d8179800603c3e41011c414eeaf1f456b"
> diff --git a/recipes/clutter/files/enable_tests.patch b/recipes/clutter/files/enable_tests.patch
> deleted file mode 100644
> index 953edf6..0000000
> --- a/recipes/clutter/files/enable_tests.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> ----
> - tests/Makefile.am   |    7 ++++++-
> - tests/test-actors.c |    2 +-
> - tests/test-text.c   |    2 +-
> - 3 files changed, 8 insertions(+), 3 deletions(-)
> -
> -Index: git/tests/interactive/Makefile.am
> -===================================================================
> ---- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
> -+++ git/tests/interactive/Makefile.am	2009-03-12 11:04:12.000000000 +0000
> -@@ -77,7 +77,7 @@
> - AM_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
> - AM_LDFLAGS = $(CLUTTER_LIBS)
> - 
> --noinst_PROGRAMS = test-interactive
> -+bin_PROGRAMS = test-interactive
> - 
> - test_interactive_SOURCES = \
> - 	test-main.c \
> -Index: git/tests/interactive/test-actors.c
> -===================================================================
> ---- git.orig/tests/interactive/test-actors.c	2009-03-12 11:01:36.000000000 +0000
> -+++ git/tests/interactive/test-actors.c	2009-03-12 11:06:32.000000000 +0000
> -@@ -182,7 +182,7 @@
> -   oh->scaler_1 = clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0);
> -   oh->scaler_2 = clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5);
> - 
> --  real_hand = clutter_texture_new_from_file ("redhand.png", &error);
> -+  real_hand = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png", &error);
> -   if (real_hand == NULL)
> -     {
> -       g_error ("image load failed: %s", error->message);

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMhI5TMkyGM64RGpERAoeXAJ9VIJjA9OwgMs5rEuGwuTFo+xYiyQCcDiww
zUQupGL2L8LCNxklDKeRR+s=
=mcmJ
-----END PGP SIGNATURE-----



