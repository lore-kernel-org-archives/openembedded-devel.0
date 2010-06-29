Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OTg4P-0003iF-8E
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 21:02:11 +0200
Received: by ewy7 with SMTP id 7so473912ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 11:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=uf+uN2FbdimxQV4N8gM95eugUeE9Jwpy7SCUjRKBUeU=;
	b=sFq0/mm6rUBwtwqUO6bGmZNDI3JIWk/5OX11gdnBdC1lDYM9lR5TNuj9Fm9Mi42tq2
	27puSVGfeh+G9Z1gM5Zz3wmyfjDmO6Ujh402rwxdhcXZRNAQWN4k+JQS9eRCd9EpF4Hm
	3EBiTxQoj+bhQA2fcfF5y9UD1soPqgGnLp+mo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=jCql0pmJKHO2IweaTQA8++8S0RIIkqu2k7H1yz/wJVrmveKayR7NH7drACyU55Vwd9
	7RvYMgTswscYuL6xJS/gJSyk9bamg0+kOW7OJZHkjvwZ1dMAasCZgpxUusyxAUVasSDi
	AmVtt/BN+/4k7bLm6v3m1GVsomYmiQvBRreqs=
Received: by 10.213.31.133 with SMTP id y5mr2328329ebc.6.1277837847970; Tue, 
	29 Jun 2010 11:57:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Tue, 29 Jun 2010 11:57:07 -0700 (PDT)
In-Reply-To: <201006291747.12761.schnitzeltony@gmx.de>
References: <201006291747.12761.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jun 2010 11:57:07 -0700
Message-ID: <AANLkTik4-4SVUrW3hTk-ugZRHn04z4EW32cvfz0MuUVu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems bumping clutter recipes
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
X-List-Received-Date: Tue, 29 Jun 2010 19:02:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2010 at 8:47 AM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
> I am working on building clutter recipes (clutter / clutter-box2d / clutt=
er-gtk / clutter-gst). Since none of the recipes worked - most crashed alre=
ady during patching - I decided to rework these
> recipes and bump to latest stable versions. With clutter / clutter-box2d =
/ clutter-gtk I had success so far but now I am in trouble with clutter-gst=
.
>
> The modifications I made:
>
> -------------------------------------------------------------------------=
----------------------------------------------------------------
> From 503e5976ff638b278511d232c69058c03e4a2cea Mon Sep 17 00:00:00 2001
> From: Andreas Mueller <schnitzeltony@gmx.de>
> Date: Tue, 29 Jun 2010 16:25:31 +0200
> Subject: [PATCH] Bump clutter recipes to latest stable versions
>
> Note: clutter-gst fails during compile at overo environment!
>
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
> =A0recipes/clutter/clutter-box2d.inc =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/clutter/clutter-box2d_0.10.0_git.bb | =A0 13 +++++++++++++
> =A0recipes/clutter/clutter-gst.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 13 +----=
--------
> =A0recipes/clutter/clutter-gst_1.0.0.bb =A0 =A0 =A0 =A0| =A0 12 +++++++++=
+++
> =A0recipes/clutter/clutter-gtk_0.10.4.bb =A0 =A0 =A0 | =A0 12 +++++++++++=
+
> =A0recipes/clutter/clutter.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02=
 +-
> =A0recipes/clutter/clutter_1.2.10.bb =A0 =A0 =A0 =A0 =A0 | =A0 18 +++++++=
+++++++++++
> =A07 files changed, 58 insertions(+), 14 deletions(-)
> =A0create mode 100644 recipes/clutter/clutter-box2d_0.10.0_git.bb
> =A0create mode 100644 recipes/clutter/clutter-gst_1.0.0.bb
> =A0create mode 100644 recipes/clutter/clutter-gtk_0.10.4.bb
> =A0create mode 100644 recipes/clutter/clutter_1.2.10.bb
>
> diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-=
box2d.inc
> index 8189d12..bb4f1b6 100644
> --- a/recipes/clutter/clutter-box2d.inc
> +++ b/recipes/clutter/clutter-box2d.inc
> @@ -5,7 +5,7 @@ LICENSE =3D "GPLv2"
> =A0DEPENDS =3D "clutter"
>
> =A0# The main clutter lib is machine specific so we need to be too
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +#PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> =A0inherit autotools pkgconfig gtk-doc
>
> diff --git a/recipes/clutter/clutter-box2d_0.10.0_git.bb b/recipes/clutte=
r/clutter-box2d_0.10.0_git.bb
> new file mode 100644
> index 0000000..6417a7d
> --- /dev/null
> +++ b/recipes/clutter/clutter-box2d_0.10.0_git.bb
> @@ -0,0 +1,13 @@
> +require clutter-box2d.inc
> +
> +SRCREV =3D "dae84a82efe22b284cba8ca1985ce14bb4e86c99"
> +
> +PV =3D "0.10.0"
> +PR =3D "r0"
> +PR_append =3D "+git${SRCREV}"
> +
> +SRC_URI =3D "git://git.clutter-project.org/clutter-box2d.git;protocol=3D=
git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +
> diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gs=
t.inc
> index fa8f810..262f033 100644
> --- a/recipes/clutter/clutter-gst.inc
> +++ b/recipes/clutter/clutter-gst.inc
> @@ -7,17 +7,6 @@ DEPENDS =3D "clutter gstreamer gst-plugins-base"
> =A0PACKAGES =3D+ "${PN}-examples"
> =A0FILES_${PN}-examples =3D "${bindir}/video-player ${bindir}/video-sink =
${bindir}/audio"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig gtk-doc
>
> -do_configure_prepend() {
> - =A0 =A0 =A0 if [ -e ${WORKDIR}/gtk-doc.make ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.mak=
e
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 touch ${S}/gtk-doc.make
> - =A0 =A0 =A0 fi
> -}
> -
> -do_stage () {
> - =A0 =A0 =A0 =A0autotools_stage_all
> -}
>
> diff --git a/recipes/clutter/clutter-gst_1.0.0.bb b/recipes/clutter/clutt=
er-gst_1.0.0.bb
> new file mode 100644
> index 0000000..ef6589f
> --- /dev/null
> +++ b/recipes/clutter/clutter-gst_1.0.0.bb
> @@ -0,0 +1,12 @@
> +require clutter-gst.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gst/1.0/c=
lutter-gst-${PV}.tar.bz2 \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +# The main clutter lib is machine specific so we need to be too
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +SRC_URI[md5sum] =3D "673e9548172698ebd48713ebedff500c"
> +SRC_URI[sha256sum] =3D "ae6ec048b570157130e9f9069f2495caf0da9eefa8d7f3b1=
789f3346fb16f696"
> diff --git a/recipes/clutter/clutter-gtk_0.10.4.bb b/recipes/clutter/clut=
ter-gtk_0.10.4.bb
> new file mode 100644
> index 0000000..8f4e6a8
> --- /dev/null
> +++ b/recipes/clutter/clutter-gtk_0.10.4.bb
> @@ -0,0 +1,12 @@
> +require clutter-gtk.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gtk/0.10/=
clutter-gtk-${PV}.tar.bz2 \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +DEPENDS =3D "clutter"
> +
> +SRC_URI[md5sum] =3D "fd015e8080e1212dacc95d0e3d776d0d"
> +SRC_URI[sha256sum] =3D "0134a8de202c518e231f340f5f2f3e988350105de9fadd0e=
849f08d95ac1b912"
> +
> diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
> index fce3236..8f38419 100644
> --- a/recipes/clutter/clutter.inc
> +++ b/recipes/clutter/clutter.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "LGPL"
>
> =A0COMPATIBLE_MACHINE =3D "(zylonite|mx31litekit|omap-3430ldp|omap-3430sd=
p|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm3730-am3715-evm|beagleboar=
d|overo|omap3evm|
> omap5912osk)"
>
> -STDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes g=
tk+"
> +STDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes g=
tk+ cairo"
> =A0BASE_CONF =3D "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
>
> =A0DEPENDS =3D "${STDDEPENDS} virtual/libgl"
> diff --git a/recipes/clutter/clutter_1.2.10.bb b/recipes/clutter/clutter_=
1.2.10.bb
> new file mode 100644
> index 0000000..298972d
> --- /dev/null
> +++ b/recipes/clutter/clutter_1.2.10.bb
> @@ -0,0 +1,18 @@
> +require clutter.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI =3D "http://source.clutter-project.org/sources/clutter/1.2/clutt=
er-${PV}.tar.bz2 \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +PARALLEL_MAKE =3D ""
> +
> +do_compile_prepend() {
> + =A0 =A0 =A0 for i in $(find ${S} -name Makefile) ; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e s:-Werror::g $i
> + =A0 =A0 =A0 done
> + =A0 =A0( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h=
 $i ; done )
> +}
> +
> +SRC_URI[md5sum] =3D "ca8dbc4a65c55720779872c13eac86ba"
> +SRC_URI[sha256sum] =3D "26cdee7a528eb1346553d16ae8d8d87f35a8a46c0a86829e=
abd227067e84da5d"
> --
> 1.5.3.4
> -------------------------------------------------------------------------=
----------------------------------------------------------------
>
> Some comments of what I did:
>
> 1. clutter-box2d does use latest git because the stable version is missin=
g HAVE_INTROSPECTION (see
> http://git.clutter-project.org/clutter-box2d/commit/?id=3Ddae84a82efe22b2=
84cba8ca1985ce14bb4e86c99)
> 2. In clutter-box2d.inc I removed PACKAGE_ARCH =3D "${MACHINE_ARCH}" beca=
use I had the feeling that this caused OE build an empty image.
> 3. To get clutter-gst I did several attempts:
> =A0 =A0 =A0 =A0- With or without PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =A0 =A0 =A0 =A0- Checked poky recipes
> =A0 =A0 =A0 =A0- Tried with latest git version
>
> All compiling attempts lead to a bunch of warnings like
>
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/gstreamer-0.10/gst/gstmessage.h: In function 'gst_message_ref'=
:
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/gstreamer-0.10/gst/gstmessage.h:306: warning: cast increases r=
equired alignment of target type
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/gstreamer-0.10/gst/gstmessage.h: In function 'gst_message_copy=
':
> | /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/gstreamer-0.10/gst/gstmessage.h:344: warning: cast increases r=
equired alignment of target type
>
> and ends up in error
>
> | ./clutter-gst-video-sink.c:138: error: expected ')' before 'GLUNIFORM1I=
PROC'
> | ./clutter-gst-video-sink.c:140: error: expected ')' before 'GLGENPROGRA=
MSPROC'
> | ./clutter-gst-video-sink.c:141: error: expected ')' before 'GLBINDPROGR=
AMPROC'
> | ./clutter-gst-video-sink.c:142: error: expected ')' before 'GLPROGRAMST=
RINGPROC'
> | ./clutter-gst-video-sink.c:147: error: expected specifier-qualifier-lis=
t before 'GLGENPROGRAMSPROC'
>
> The code found from clutter-gst-video-sink.c:138 is
>
> typedef void (APIENTRYP GLUNIFORM1IPROC)(GLint location, GLint value);
> /* GL_ARB_fragment_program */
> typedef void (APIENTRYP GLGENPROGRAMSPROC)(GLsizei n, GLuint *programs);
> typedef void (APIENTRYP GLBINDPROGRAMPROC)(GLenum target, GLuint program)=
;
> typedef void (APIENTRYP GLPROGRAMSTRINGPROC)(GLenum target, GLenum format=
,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 GLsizei len, const void *string);
>
> I seems that APIENTRYP is not defined. APIENTRYP is found in <OEDir>/tmp/=
sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GL/gl.h the mesa OpenGL =
header which is not to be included
> here. The header of interest which is coming from libgles-omap3 in <OEDir=
>/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GLES2/gl2.h does n=
ot define APIENTRYP.
>
> OK these are the symthoms.
>
> What is a good solution? Creating a patch which adds APIENTRYP (and other=
s) to GLES2/gl2.h? I am afraid that this is not the solution because the wa=
rnings make me feel that it might leed to a
> successful build but will the code work as expected? To me it seems that =
there is some configure/automake option not properly feeded - especially if=
 you take a look on clutter-gst-video-sink.c:
> It seems there is code to feed shaders (do we have any on omap3?). Is pos=
sible that clutter-gst is not suitable for omap3 or did it ever build?
>
> I would be very pleased to get some suggestions on this...
>
>

what it seems to me is that you need
to bump some of dependency versions too
it could be a long list of recipes or
short if you are lucky

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


