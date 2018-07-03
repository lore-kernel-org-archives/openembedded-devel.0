Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 805A47553C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 18:13:03 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id s23-v6so1653503vks.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 11:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gDcWTwZCgbtaUdGIlmT+RJA9lKUmZv9mwu06Q1zPyVI=;
	b=VvRJcqWtBWZOZJZA2uU309bzyTIyPnwtS2pcgZzi3TiNunUgUui8FjcynDkovtwl8N
	+z3mKl4pmOIj1/pAwr4tQxzj5++u51Hi3RzvDMH/2OklTTY9nLgr8a5gh7JulXsAI7W1
	CV64KeQfgTUNayHMeOUOYOpv4USlC5rUNf65nyo48vXKLyTWh+bponcLhISWaC/wPnRh
	QExtvuG4J2d3dNFVWuneT+JrEU4ElGgAJA8YQb308vl9vVwQ0kUEbmgXO3/7hqtQ6BDx
	Dxc6aRrzy82UfckdswekwbmLIWI//ITyfGKEZfEDz2s7mA1C0fVyEOqjyttlIENgKI/f
	gnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gDcWTwZCgbtaUdGIlmT+RJA9lKUmZv9mwu06Q1zPyVI=;
	b=NDkoi9N5BpZTqhiEcNKAtt+h0KZF3oIG2/V07T6efZOgX91JLFAq4zZQysmNE22Qd+
	eanKXTlOIiBsnQZQf71O2/x2ktTwEmeB/7q4msMgXuL+h0iAtNnDP6PBXdxaJwhyETFJ
	aSU/hs4MGbFcwmOQvcjrBxc/wjC5zQcvqZV/iRL0ZVDRLkXjyajOF/EAZ8yDgeV2Mf8N
	2B9Gnjcn/yWFcAnGN4s5pB/fn9PsbwE57InYbLJU67UeKaPgLmY28ZO57p8/ikG1L0aN
	DDmJVfhLWhl3BjIj1sdmMCFtCddIQPAmwMp6u9Xe6fFIXVUKqJHKNlW5xhVIHJ0Bjrpi
	9/tw==
X-Gm-Message-State: APt69E0644MF21ET4Q6sTgU8e4oCOEekNna9GgBB8aTXbiZgZlqmqfgH
	u8TG9t8VKII9a7TC129P6fIV8e8coN/f5/eXXpU=
X-Google-Smtp-Source: AAOMgpema2pz0BElBsK2AzLnSHRPQr32YAOZl6flm0Qih134ZCcJRvAtm3bI/UgA9kh3eVB7Hbr0qABvzcjaj6tpsi8=
X-Received: by 2002:a1f:7c4:: with SMTP id
	187-v6mr17764010vkh.60.1530641583736; 
	Tue, 03 Jul 2018 11:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20180621075845.5422-1-kai.kang@windriver.com>
	<20180621075845.5422-2-kai.kang@windriver.com>
	<38fa69a5-e34a-4eae-ae74-5fa5066e40d4@gmail.com>
	<b550f031-050f-eb5e-d872-b690cf91f064@windriver.com>
In-Reply-To: <b550f031-050f-eb5e-d872-b690cf91f064@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jul 2018 11:12:37 -0700
Message-ID: <CAMKF1spryTnonVcRU+SW7K9oUvMPWY7UubT=-HnQNtucE02vLg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mozjs17: exclude mips64 from COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 03 Jul 2018 18:13:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2018 at 7:03 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2018=E5=B9=B406=E6=9C=8822=E6=97=A5 07:22, Khem Raj wrote:
> > Hi Kai
> >
> > On 6/21/18 12:58 AM, kai.kang@windriver.com wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> The latest stable version of package polkit is 0.113 which requires
> >> mozjs 17. mozjs 17 doesn't support mips64. mips64 has been supported
> >> from mozjs 45.
> >>
> >> https://bugzilla.mozilla.org/show_bug.cgi?id=3D1140954
> >>
> >> Exclude mips64 from COMPATIBLE_HOST for mozjs, polkit and packages whi=
ch
> >> depend on polkit directly or indirectly. And remove 'polkit' from
> >> PACKAGECONFIG of modemmanager for mips64.
> >>
> >
> > I would suggest that we consider the option of upgrading mozjs to 45+
> > and also upgrade polkit to 0.114 which was released few months ago.
>
> Sorry, I forgot to write more about it in cover letter.
> According to file 'NEWS' in polkit repo, version 0.114 is a development
> release.
>
> https://cgit.freedesktop.org/polkit/log/NEWS
>
> --------------
> polkit 0.114
> --------------
>
> WARNING WARNING WARNING: This is a prerelease on the road to polkit
> 1.0. Public API might change and certain parts of the code still needs
> some security review. Use at your own risk.
>
> So I suppose we should not upgrade to 0.114 and the follwing 0.115. And
> it seems
> version 1.0 will not be released soon, that why I send this
> COMPATIBALE_HOST patch.
>

I checked that few other distros, archlinux and fedora are already using
0.114, I am still leaning towards the update if you are ok with it.
Chances are we forget
the masks when they would need to be unmasked.

> Thanks,
> Kai
>
> >
> >
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   .../network-manager-applet/network-manager-applet_1.8.10.bb  | 5 +++=
++
> >>   meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb               | 5 +++=
++
> >>   meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb                 | 3 +++
> >>   .../networkmanager/networkmanager-openvpn_1.2.8.bb           | 5 +++=
++
> >>   .../networkmanager/networkmanager_1.10.6.bb                  | 3 +++
> >>   .../python-networkmanager/python-networkmanager_2.0.1.bb     | 5 +++=
++
> >>   .../modemmanager/modemmanager_1.7.991.bb                     | 2 ++
> >>   meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb               | 3 +++
> >>   meta-oe/recipes-extended/polkit/polkit-group-rule.inc        | 3 +++
> >>   meta-oe/recipes-extended/polkit/polkit_0.113.bb              | 3 +++
> >>   meta-oe/recipes-support/udisks/udisks2_2.7.6.bb              | 3 +++
> >>   meta-oe/recipes-support/udisks/udisks_1.0.5.bb               | 3 +++
> >>   meta-oe/recipes-support/upower/upower_0.99.7.bb              | 3 +++
> >>   meta-xfce/classes/thunar-plugin.bbclass                      | 5 +++=
++
> >>   meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb        | 3 +++
> >>   meta-xfce/recipes-core/images/core-image-minimal-xfce.bb     | 5 +++=
++
> >>   .../systemload/xfce4-systemload-plugin_1.2.1.bb              | 5 +++=
++
> >>   .../weather/xfce4-weather-plugin_0.8.10.bb                   | 5 +++=
++
> >>   .../recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb      | 5 +++=
++
> >>   .../recipes-xfce/packagegroups/packagegroup-xfce-base.bb     | 4 +++=
+
> >>   .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 4 +++=
+
> >>   meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb                | 5 +++=
++
> >>   .../xfce4-power-manager/xfce4-power-manager_1.6.1.bb         | 5 +++=
++
> >>   meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb | 3 +++
> >>   meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb  | 5 +++=
++
> >>   meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb         | 5 +++=
++
> >>   26 files changed, 105 insertions(+)
> >>
> >> diff --git
> >> a/meta-gnome/recipes-connectivity/network-manager-applet/network-manag=
er-applet_1.8.10.bb
> >> b/meta-gnome/recipes-connectivity/network-manager-applet/network-manag=
er-applet_1.8.10.bb
> >>
> >> index 91ae8b740..581243354 100644
> >> ---
> >> a/meta-gnome/recipes-connectivity/network-manager-applet/network-manag=
er-applet_1.8.10.bb
> >> +++
> >> b/meta-gnome/recipes-connectivity/network-manager-applet/network-manag=
er-applet_1.8.10.bb
> >> @@ -14,6 +14,11 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
> >>   SRC_URI[archive.md5sum] =3D "eae3be75e77ff1a7ea3174be25e62d03"
> >>   SRC_URI[archive.sha256sum] =3D
> >> "0adc4bfae8b49f7a1d929c22ef20933bd41fb4a8b458280f44c65f9e45b4c9c3"
> >>   +# dependency chain:
> >> +# networkmanager -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   PACKAGECONFIG[modemmanager] =3D
> >> "--with-wwan,--without-wwan,modemmanager"
> >>   PACKAGECONFIG ??=3D ""
> >>   diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> >> b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> >> index ba425ad6b..bd8e51c59 100644
> >> --- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> >> +++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> >> @@ -22,6 +22,11 @@ SRC_URI[archive.md5sum] =3D
> >> "e1eecb0a92a1a363b3d375ec5ac0fb3b"
> >>   SRC_URI[archive.sha256sum] =3D
> >> "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
> >>   GNOME_COMPRESS_TYPE=3D"bz2"
> >>   +# dependency chain:
> >> +# gvfs -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   EXTRA_OECONF =3D "--disable-scrollkeeper \
> >>                   --enable-gvfs-metadata"
> >>   diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
> >> b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
> >> index 5f7391285..641253204 100644
> >> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
> >> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
> >> @@ -16,6 +16,9 @@ do_configure_prepend() {
> >>       touch ${S}/ABOUT-NLS
> >>   }
> >>   +# polkit depends on mozjs17 which not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   EXTRA_OECONF =3D " \
> >>       --disable-gdu \
> >>       --enable-udisks2 \
> >> diff --git
> >> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-o=
penvpn_1.2.8.bb
> >> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-o=
penvpn_1.2.8.bb
> >>
> >> index 1b604ad52..4b013ad76 100644
> >> ---
> >> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-o=
penvpn_1.2.8.bb
> >> +++
> >> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-o=
penvpn_1.2.8.bb
> >> @@ -14,6 +14,11 @@ SRC_URI[sha256sum] =3D
> >> "3e0b4007f248d96df4b8eb5d0f937536044af7053debbbf525e67c9bc5
> >>     S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
> >>   +# dependency chain:
> >> +# networkmanager -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome"
> >>     do_install_append () {
> >> diff --git
> >> a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.10.6.bb
> >> b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.10.6.bb
> >>
> >> index 605d371b1..10e22c773 100644
> >> ---
> >> a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.10.6.bb
> >> +++
> >> b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.10.6.bb
> >> @@ -43,6 +43,9 @@ SRC_URI[sha256sum] =3D
> >> "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad1648
> >>     S =3D "${WORKDIR}/NetworkManager-${PV}"
> >>   +# polkit depends on mozjs17 which not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   EXTRA_OECONF =3D " \
> >>       --disable-ifcfg-rh \
> >>       --disable-ifnet \
> >> diff --git
> >> a/meta-networking/recipes-connectivity/python-networkmanager/python-ne=
tworkmanager_2.0.1.bb
> >> b/meta-networking/recipes-connectivity/python-networkmanager/python-ne=
tworkmanager_2.0.1.bb
> >>
> >> index 4e41aa576..9e583b2ef 100644
> >> ---
> >> a/meta-networking/recipes-connectivity/python-networkmanager/python-ne=
tworkmanager_2.0.1.bb
> >> +++
> >> b/meta-networking/recipes-connectivity/python-networkmanager/python-ne=
tworkmanager_2.0.1.bb
> >> @@ -10,4 +10,9 @@ SRC_URI[sha256sum] =3D
> >> "bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515
> >>   PYPI_PACKAGE =3D "python-networkmanager"
> >>   inherit pypi setuptools
> >>   +# dependency chain:
> >> +# networkmanager -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   RDEPENDS_${PN} =3D "networkmanager python-dbus python-six"
> >> diff --git
> >> a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
> >> b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
> >> index 26b56d17d..9f5be637e 100644
> >> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.b=
b
> >> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.b=
b
> >> @@ -23,6 +23,8 @@ S =3D "${WORKDIR}/ModemManager-${PV}"
> >>   PACKAGECONFIG ??=3D "mbim qmi polkit \
> >>       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >>   "
> >> +# polkit depends on mozjs which not support mips64
> >> +PACKAGECONFIG_remove_mips64 =3D "polkit"
> >>     PACKAGECONFIG[systemd] =3D
> >> "--with-systemdsystemunitdir=3D${systemd_unitdir}/system/,,"
> >>   PACKAGECONFIG[polkit] =3D "--with-polkit=3Dyes,--with-polkit=3Dno,po=
lkit"
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> >> b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> >> index 49b7f156e..7f8f0529b 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> >> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> >> @@ -50,6 +50,9 @@ EXTRA_OECONF_append_armv4 =3D " \
> >>   PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)=
}"
> >>   PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR}
> >> --x-libraries=3D${STAGING_LIBDIR},--without-x,virtual/libx11"
> >>   +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   # mozjs requires autoreconf 2.13
> >>   do_configure() {
> >>       export HOST_CFLAGS=3D"${BUILD_CFLAGS}"
> >> diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> >> b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> >> index 40e400542..d4befc8bb 100644
> >> --- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> >> +++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> >> @@ -1,6 +1,9 @@
> >>   # polkit must prepare polkitd group
> >>   DEPENDS +=3D "polkit"
> >>   +# polkit depends on mozjs17 which not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   inherit useradd
> >>     do_install_prepend() {
> >> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
> >> b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
> >> index f34928fe3..f9c3cdf75 100644
> >> --- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
> >> +++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
> >> @@ -27,6 +27,9 @@ SRC_URI =3D
> >> "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
> >>   SRC_URI[md5sum] =3D "4b77776c9e4f897dcfe03b2c34198edf"
> >>   SRC_URI[sha256sum] =3D
> >> "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
> >>   +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   EXTRA_OECONF =3D "--with-os-type=3Dmoblin --disable-man-pages"
> >>     do_compile_prepend () {
> >> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
> >> b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
> >> index 4d22afd0d..1340074c5 100644
> >> --- a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
> >> +++ b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
> >> @@ -28,6 +28,9 @@ S =3D "${WORKDIR}/git"
> >>     CVE_PRODUCT =3D "udisks"
> >>   +# polkit depends on mozjs17 which does NOT support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   inherit autotools systemd gtk-doc gobject-introspection
> >>     EXTRA_OECONF =3D "--disable-man --disable-gtk-doc"
> >> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> >> b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> >> index e33266001..a80238392 100644
> >> --- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> >> +++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
> >> @@ -22,6 +22,9 @@ SRC_URI =3D " \
> >>   SRC_URI[udisks.md5sum] =3D "70d48dcfe523a74cd7c7fbbc2847fcdd"
> >>   SRC_URI[udisks.sha256sum] =3D
> >> "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
> >>   +# polkit depends on mozjs17 which does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   inherit autotools-brokensep systemd gtk-doc
> >>     PACKAGECONFIG ??=3D "libdevmapper"
> >> diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb
> >> b/meta-oe/recipes-support/upower/upower_0.99.7.bb
> >> index 973fbe771..27f1a70b6 100644
> >> --- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
> >> +++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
> >> @@ -8,6 +8,9 @@ SRC_URI =3D
> >> "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> >>   SRC_URI[md5sum] =3D "236bb439d9ff1151450b3d8582399532"
> >>   SRC_URI[sha256sum] =3D
> >> "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
> >>   +# polkit depends on mozjs17 which does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   inherit autotools pkgconfig gettext gobject-introspection systemd
> >>     PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES',
> >> 'systemd', d)}"
> >> diff --git a/meta-xfce/classes/thunar-plugin.bbclass
> >> b/meta-xfce/classes/thunar-plugin.bbclass
> >> index 692f121d8..2f6216ba3 100644
> >> --- a/meta-xfce/classes/thunar-plugin.bbclass
> >> +++ b/meta-xfce/classes/thunar-plugin.bbclass
> >> @@ -4,6 +4,11 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
> >>     DEPENDS +=3D "thunar"
> >>   +# dependency chain:
> >> +# thunar -> gvfs -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   SRC_URI =3D
> >> "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${=
BPN}-${PV}.tar.bz2"
> >>     FILES_${PN} +=3D "${libdir}/thunarx-3/*.so"
> >> diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> >> b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> >> index 54bf7c752..2fa5300f1 100644
> >> --- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> >> +++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> >> @@ -12,3 +12,6 @@ SRC_URI =3D " \
> >>   "
> >>   SRCREV =3D "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
> >>   S =3D "${WORKDIR}/git"
> >> +
> >> +# polkit depends on mozjs17 which not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> >> b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> >> index 21930ba14..99ce78cb5 100644
> >> --- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> >> +++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> >> @@ -16,3 +16,8 @@ LICENSE =3D "MIT"
> >>   export IMAGE_BASENAME =3D "core-image-minimal-xfce"
> >>     inherit core-image
> >> +
> >> +# dependency chain:
> >> +# packagegroup-xfce-base -> xfce4-session -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> diff --git
> >> a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1=
.2.1.bb
> >> b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1=
.2.1.bb
> >>
> >> index eeb451863..c95d59eee 100644
> >> ---
> >> a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1=
.2.1.bb
> >> +++
> >> b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1=
.2.1.bb
> >> @@ -9,3 +9,8 @@ DEPENDS +=3D "upower"
> >>     SRC_URI[md5sum] =3D "550277af9886c47005117110f6e7ec0d"
> >>   SRC_URI[sha256sum] =3D
> >> "2bf7d0802534a1eb2e9f251af2bb97abc3f58608c1f01511d302c06111d34812"
> >> +
> >> +# dependency chain:
> >> +# upower -> polkit -> mozjs17
> >> +# polkit depends on mozjs17 which not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> diff --git
> >> a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.=
bb
> >> b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.=
bb
> >> index 649eaaafb..f3468ed7a 100644
> >> ---
> >> a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.=
bb
> >> +++
> >> b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.=
bb
> >> @@ -10,4 +10,9 @@ DEPENDS +=3D "libsoup-2.4 dbus-glib upower"
> >>   SRC_URI[md5sum] =3D "bba7f750b97c8fc3656715268edad792"
> >>   SRC_URI[sha256sum] =3D
> >> "ee6d43c444904631c240470e15e96215c2ce451158bfdbf234bce892bf60eab8"
> >>   +# dependency chain:
> >> +# upower -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   FILES_${PN} +=3D "${datadir}/xfce4/weather"
> >> diff --git
> >> a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
> >> b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
> >> index 8ee374035..26289443f 100644
> >> --- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
> >> +++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
> >> @@ -14,3 +14,8 @@ DEPENDS +=3D "libxklavier libwnck3 librsvg garcon"
> >>   FILES_${PN} +=3D "${datadir}/xfce4/xkb"
> >>     RDEPENDS_${PN} =3D "xfce4-settings"
> >> +
> >> +# dependency chain:
> >> +# xfce4-settings -> upower -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> diff --git
> >> a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> >> b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> >> index 140de416b..6b169a0c4 100644
> >> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> >> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> >> @@ -8,6 +8,10 @@ inherit packagegroup distro_features_check
> >>     REQUIRED_DISTRO_FEATURES =3D "x11"
> >>   +# some core packages such as thunar, xfdesktop and xfce4-session
> >> fininally
> >> +# depend on polkit with depends on mozjs. But mozjs17 does not
> >> support mips64.
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   RDEPENDS_${PN} =3D " \
> >>       xfwm4 \
> >>       xfce4-session \
> >> diff --git
> >> a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> >> b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> >> index 2e0f7f5b4..477335f36 100644
> >> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.=
bb
> >> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.=
bb
> >> @@ -9,6 +9,10 @@ inherit packagegroup distro_features_check
> >>     REQUIRED_DISTRO_FEATURES =3D "x11"
> >>   +# some core packages in packagegroup-xfce-base finally depend on
> >> polkit which
> >> +# depend on mozjs but mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   # mandatory
> >>   RDEPENDS_${PN} =3D " \
> >>       packagegroup-xfce-base \
> >> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> index f03fd63e0..6ba5b6c3f 100644
> >> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
> >> @@ -14,6 +14,11 @@ SRC_URI[sha256sum] =3D
> >> "acf151bceedb20aed45a6da61d7bb85a4a03964090c80454e72e61e7fc
> >>     S =3D "${WORKDIR}/Thunar-${PV}/"
> >>   +# dependency chain:
> >> +# gvfs -> polkit -> mozjs17
> >> +# polkit depends on mozjs17 which not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   PACKAGECONFIG ??=3D ""
> >>   PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
> >>   diff --git
> >> a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1=
.bb
> >> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1=
.bb
> >>
> >> index ed117b0a6..3be7336fc 100644
> >> ---
> >> a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1=
.bb
> >> +++
> >> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1=
.bb
> >> @@ -15,6 +15,11 @@ DEPENDS +=3D "gtk+3 glib-2.0 dbus-glib xfconf
> >> libxfce4ui libxfce4util libnotify \
> >>   SRC_URI[md5sum] =3D "17f0e6464ad6b3bc6a657f595bf91430"
> >>   SRC_URI[sha256sum] =3D
> >> "1ea825452343b895566068018b6d5078608f8f46ce8075ba6bbb4b848f48656b"
> >>   +# dependency chain:
> >> +# upower -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   EXTRA_OECONF =3D " \
> >>       --enable-network-manager \
> >>       --enable-panel-plugins \
> >> diff --git
> >> a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> >> b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> >> index 899edbf0a..75931d361 100644
> >> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> >> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
> >> @@ -15,6 +15,9 @@ SRC_URI +=3D " \
> >>       file://0001-configure.in-hard-code-path-to-iceauth.patch \
> >>   "
> >>   +# polkit depends on mozjs17 which does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   ALTERNATIVE_${PN} =3D "x-session-manager"
> >>   ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
> >>   ALTERNATIVE_PRIORITY_${PN} =3D "100"
> >> diff --git
> >> a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> index d937653fa..d5b1bc5af 100644
> >> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> @@ -21,6 +21,11 @@ SRCREV =3D "b701ac8b66b83c17469dd5009da51eeb59eba44=
2"
> >>   S =3D "${WORKDIR}/git"
> >>   PV =3D "4.12.3+git${SRCPV}"
> >>   +# dependency chain:
> >> +# upower -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
> >>     PACKAGECONFIG ??=3D " \
> >> diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
> >> b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
> >> index d9cbe7196..e53f15265 100644
> >> --- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
> >> +++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
> >> @@ -11,6 +11,11 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
> >>   SRC_URI[md5sum] =3D "7571889368be72df185ce2d470f37198"
> >>   SRC_URI[sha256sum] =3D
> >> "098a35510562907e1431d5adbfa8307484a235c1dec6a43e2d58d2ac4241f1cb"
> >>   +# dependency chain:
> >> +# thunar -> gvfs -> polkit -> mozjs17
> >> +# mozjs17 does not support mips64
> >> +COMPATIBLE_HOST =3D "^(?!mips64).*"
> >> +
> >>   PACKAGECONFIG ??=3D ""
> >>   PACKAGECONFIG[notify] =3D
> >> "--enable-notifications,--disable-notifications,libnotify"
> >>
> >
>
> --
> Regards,
> Neil | Kai Kang
>

