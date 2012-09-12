Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TBmHp-0003Jw-SH
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 14:43:22 +0200
Received: by iaky10 with SMTP id y10so1305640iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=m9dR/0wSFZUSMxG04vk7Ho8f/4wvWLm8IvjWFsPRvjY=;
	b=lwNCrHmkaL9vTt+vpuH4vAFF0TkaUYl1uuzvg4lQzQLiJK8cO0eiARu53nlKyt7FQ0
	ET76NwtHyeuqUIk+rRsT0MFlth0GIC7GTRGMQ3TaNGnS0E1ptBcf7WFXc2bndPaLA14O
	StPuDU1SUPrdbiglGSi9kU1ncB7oX7b6wbKpiB0mVdWNZo5g5ZoorAqzypf4ufbeZYkh
	s+lwrWN41zcfIh0IARZRtNlu2HUuYwuGv5OFLfTOQKEJm4fI7hcQpX1bLYQt6OmSdC1q
	VHy0hPplMzJVRjvPSpVHOnjpy96M1yHN8sUvZbTk0VjqXnmSnaXRTEwp5uB4Z/6uhCuB
	/LJA==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr20927654igc.50.1347453049036;
	Wed, 12 Sep 2012 05:30:49 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Wed, 12 Sep 2012 05:30:49 -0700 (PDT)
In-Reply-To: <1346690580-26040-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346690580-26040-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 12 Sep 2012 14:30:49 +0200
Message-ID: <CALbNGRR1LvzRtjCVHmkGJz2tc_6fJyN5VP67vDn9mcfA2h9_Hg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lxdm: initial add 1.22_git
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
X-List-Received-Date: Wed, 12 Sep 2012 12:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 3, 2012 at 6:43 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> * use git version since 1.21 missing escape button and bugfixes
> * no init-scripts (I am working with systemd -> testing causes huge effor=
ts ->
>   subsequent patches)
> * run tested on overo/xfce
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...conf.in-blacklist-root-for-release-images.patch |   29 +++++++++++
>  ...001-pam-use-common-instead-of-system-auth.patch |   35 +++++++++++++
>  meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf       |    4 ++
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   51 ++++++++++++++=
++++++
>  .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 ++++
>  .../recipes-graphics/lxdm/lxdm_git.bbappend        |   16 ++++++
>  6 files changed, 145 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-=
blacklist-root-for-release-images.patch
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-commo=
n-instead-of-system-auth.patch
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
>  create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm_git.bb
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.=
service.in
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.b=
bappend
>
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blackli=
st-root-for-release-images.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-=
lxdm.conf.in-blacklist-root-for-release-images.patch
> new file mode 100644
> index 0000000..49ecdb8
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root=
-for-release-images.patch
> @@ -0,0 +1,29 @@
> +From 5038c49c0b61e057dec44c932f02c4bf99cee96e Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Mon, 3 Sep 2012 10:02:51 +0200
> +Subject: [PATCH] lxdm.conf.in: blacklist root for release images
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + data/lxdm.conf.in |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/data/lxdm.conf.in b/data/lxdm.conf.in
> +index defc082..759e6e5 100644
> +--- a/data/lxdm.conf.in
> ++++ b/data/lxdm.conf.in
> +@@ -58,5 +58,5 @@ disable=3D0
> + white=3D
> +
> + ## blacklist user
> +-black=3D
> ++black=3Droot
> +
> +--
> +1.7.4.4
> +
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-common-inste=
ad-of-system-auth.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-c=
ommon-instead-of-system-auth.patch
> new file mode 100644
> index 0000000..b128928
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-common-instead-of-s=
ystem-auth.patch
> @@ -0,0 +1,35 @@
> +From 1e40c03c44de9d985c40f103ec3d4e5251d26cb2 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Wed, 20 Jun 2012 11:51:28 +0200
> +Subject: [PATCH] pam: use common-* instead of system-auth
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +Inappropriate [build system specific change]
> +
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + pam/lxdm |    6 +++---
> + 1 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/pam/lxdm b/pam/lxdm
> +index cffd07b..3e49fc5 100644
> +--- a/pam/lxdm
> ++++ b/pam/lxdm
> +@@ -1,9 +1,9 @@
> + #%PAM-1.0
> +-auth       substack   system-auth
> ++auth       substack   common-auth
> + auth       optional   pam_gnome_keyring.so
> +-account    include    system-auth
> ++account    include    common-account
> + session    optional   pam_keyinit.so force revoke
> +-session    include    system-auth
> ++session    include    common-session
> + session    required   pam_loginuid.so
> + session    optional   pam_console.so
> + session    optional   pam_gnome_keyring.so auto_start
> +--
> +1.7.6.5
> +
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf b/meta-oe/recip=
es-graphics/lxdm/lxdm/lxdm.conf
> new file mode 100644
> index 0000000..0a6e672
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
> @@ -0,0 +1,4 @@
> +[base]
> +last_session=3D
> +last_lang=3D
> +last_langs=3D
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-=
graphics/lxdm/lxdm_git.bb
> new file mode 100644
> index 0000000..a7261fd
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION =3D "LXDM is the lightweight display manager"
> +HOMEPAGE =3D "http://blog.lxde.org/?p=3D531"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +SRC_URI =3D " \
> +       git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};protocol=3Dgit=
;branch=3Dmaster \
> +       file://0001-pam-use-common-instead-of-system-auth.patch \
> +       ${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.co=
nf.in-blacklist-root-for-release-images.patch",d)} \
> +       file://lxdm.conf \
> +"
> +
> +SRCREV =3D "4f9ec27acc7f1f92b20a6ec64a50ac86aa7a5fc6"
> +PV =3D "0.4.2+git${SRCPV}"
> +
> +DEPENDS =3D "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx=
11 libxcb pango"
> +
> +DISTRO_TYPE ?=3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "de=
bug", "",d)}"
> +
> +inherit autotools gettext
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile_append() {
> +       # default background configured not available
> +       sed -i -e 's,bg=3D,# bg=3D,g' ${S}/data/lxdm.conf.in
> +       # add default configuration
> +       oe_runmake -C ${S}/data lxdm.conf
> +}
> +
> +do_install_append() {
> +       install -d ${D}${localstatedir}/lib/lxdm
> +       install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
> +}
> +
> +pkg_postinst_${PN} () {
> +if [ "x$D" !=3D "x" ]; then
> +    exit 1
> +fi
> +langs=3D""
> +for lang in `find ${libdir}/locale -maxdepth 1 | grep _ | sort`; do
> +    lang=3D`basename $lang`
> +    if [ "x$langs" =3D "x" ]; then
> +        langs=3D"$lang"
> +    else
> +        langs=3D"$langs $lang"
> +    fi
> +done
> +sed -i "s:last_langs=3D.*$:last_langs=3D$langs:g" ${localstatedir}/lib/l=
xdm/lxdm.conf
> +}
> +
> +RDEPENDS_${PN} =3D "pam-plugin-loginuid"
> diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service=
.in b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
> new file mode 100644
> index 0000000..0bc6774
> --- /dev/null
> +++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DLXDE Display Manager
> +After=3Dsystemd-user-sessions.service
> +
> +[Service]
> +ExecStart=3D%sbindir%/lxdm
> +StandardOutput=3Dsyslog
> +
> +[Install]
> +Alias=3Ddisplay-manager.service
> diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend=
 b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
> new file mode 100644
> index 0000000..e4cf44d
> --- /dev/null
> +++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
> @@ -0,0 +1,16 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +PRINC :=3D "${@int(PRINC) + 1}"
> +
> +inherit systemd
> +
> +SRC_URI +=3D "file://lxdm.service.in"
> +
> +do_install_append() {
> +       install -d ${D}${systemd_unitdir}/system
> +       sed -e 's,%sbindir%,${sbindir},g' \
> +               < ${WORKDIR}/lxdm.service.in \
> +               > ${D}${systemd_unitdir}/system/lxdm.service
> +}
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "lxdm.service"
> --
> 1.7.4.4
>
ping


