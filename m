Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id F13406E6CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:32:04 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so42845824pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 22:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=z4jw266ThX5DQGu37LFcwWE4fmvgmxbaV4YKcRVCcnQ=;
	b=MNx+kH5lJENzLxOybZkAHGMw61+E/5hh3nscrZJcq/iUmVUKfVGMS+Iyw56nwJTywL
	JE5LjIPZnEGz5Ikq1NgjwRE/Haq28k/46pKT0c3M36q4e8SInINjYYEogrJLWhPjN64X
	qtHtWw25oiaiX33TTmhfWlOxm3FyDlZzSCxz8E6k/oSPsAprNSTLtKsPsm9XecAUEDd4
	32dsoqFA/nmNmEALTPkVylmv+O7OLTMe/djiFokimVPESTUXFiqYhx80j9ElInJZdpus
	ZRvzntyjZQx6t9Oa5XMoQ2gefJMahsK6bkHz8ZgO9v8YkeZct79qfByc8a8UrRF9OZIE
	kBMA==
MIME-Version: 1.0
X-Received: by 10.66.222.103 with SMTP id ql7mr86071491pac.144.1435210325798; 
	Wed, 24 Jun 2015 22:32:05 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Wed, 24 Jun 2015 22:32:05 -0700 (PDT)
In-Reply-To: <1435197618-1621-2-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1435197618-1621-2-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Thu, 25 Jun 2015 07:32:05 +0200
Message-ID: <CALbNGRQU9+M1aQMWRtW8p02esF8K9COy=LPM6R8=wSZB4xY_dA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] networkmanager: upgrade from 0.9.8.10 to 1.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 05:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 4:00 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> 1) remove 0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch=
,
> it is not needed any more.
>
> 2) set NetworkManager.service auto disable,otherwise,the Root file system
> using the method of NFS mount can't boot successfully.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ----------------=
------
>  ...manager_0.9.8.10.bb =3D> networkmanager_1.0.2.bb} | 16 +++++-------
>  2 files changed, 7 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkma=
nager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
>  rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8=
.10.bb =3D> networkmanager_1.0.2.bb} (87%)
>
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0=
001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta-oe/re=
cipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-on=
ly-for-libsystemd-not-libsystem.patch
> deleted file mode 100644
> index e356e9b..0000000
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-con=
figure.ac-Check-only-for-libsystemd-not-libsystem.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 10427a19302e871daeeb245581e930dc58195492 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Thu, 27 Feb 2014 12:59:03 +0100
> -Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-=
login
> -
> -* they were merged into libsystemd in systemd-209
> -
> -Upstream-Status: Pending (it would need to be conditional on systemd ver=
sion for upstream to accept this)
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index cc66e9b..3fe958e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -283,7 +283,7 @@ AS_IF([! (echo "$with_session_tracking" | grep -q -E=
 "^(systemd|consolekit|no)$"
> - AM_CONDITIONAL(SESSION_TRACKING_CK, test "$with_session_tracking" =3D "=
consolekit")
> - AM_CONDITIONAL(SESSION_TRACKING_SYSTEMD, test "xwith_session_tracking" =
=3D "systemd")
> - if test "$with_session_tracking" =3D "systemd"; then
> --      PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login])
> -+      PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd])
> -       AC_SUBST(SYSTEMD_LOGIN_CFLAGS)
> -       AC_SUBST(SYSTEMD_LOGIN_LIBS)
> - fi
> ---
> -1.9.0
> -
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0=
.9.8.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0=
.2.bb
> similarity index 87%
> rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_0.=
9.8.10.bb
> rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
2.bb
> index 8d37c98..fb8efaf 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10=
.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
> @@ -4,18 +4,16 @@ SECTION =3D "net/misc"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a48=
23b"
>
> -DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp=
"
> +DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp=
 libndp"
>
>  inherit gnome gettext systemd
>
>  SRC_URI =3D " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
>      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.pat=
ch \
> -    file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.pat=
ch \
>  "
> -SRC_URI[md5sum] =3D "aad2558887e25417c52eb2deaade2f85"
> -SRC_URI[sha256sum] =3D "064d27223d3824859df12e1fb25b787fec1c68bbc864dc52=
a0289b9211c4c972"
> -
> +SRC_URI[md5sum] =3D "5a4899f89edcbdd1ac46d2d947e8d6eb"
> +SRC_URI[sha256sum] =3D "359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a470=
55c71e96439508ff"
>
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
>
> @@ -47,7 +45,6 @@ PACKAGECONFIG[concheck] =3D "--enable-concheck,--disabl=
e-concheck,libsoup-2.4"
>  do_install_prepend() {
>      sed -i 's:deny send_destination:allow send_destination:g' ${S}/src/o=
rg.freedesktop.NetworkManager.conf
>      sed -i 's:deny send_destination:allow send_destination:g' ${S}/callo=
uts/nm-dispatcher.conf
> -    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callo=
uts/nm-dhcp-client.conf
>      sed -i 's:deny send_destination:allow send_destination:g' ${S}/callo=
uts/nm-avahi-autoipd.conf
>  }
>
> @@ -55,8 +52,7 @@ do_install_append () {
>      install -d ${D}${sysconfdir}/dbus-1/event.d
>      # Additional test binaries
>      install -d ${D}${bindir}
> -    install -m 0755 ${B}/test/.libs/libnm* ${D}${bindir}
> -
> +    install -m 0755 ${B}/libnm-glib/libnm-glib-test ${D}${bindir}
>      # Install an empty VPN folder as nm-connection-editor will happily s=
egfault without it :o.
>      # With or without VPN support built in ;).
>      install -d ${D}${sysconfdir}/NetworkManager/VPN
> @@ -78,7 +74,7 @@ FILES_${PN} +=3D " \
>      ${datadir}/polkit-1 \
>      ${datadir}/dbus-1 \
>      ${base_libdir}/udev/* \
> -    ${systemd_unitdir}/system/NetworkManager-wait-online.service \
> +    ${systemd_unitdir}/system/* \
>  "
>
>  RRECOMMENDS_${PN} +=3D "iptables dnsmasq"
> @@ -87,6 +83,7 @@ RDEPENDS_${PN} =3D " \
>      wpa-supplicant \
>      dhcp-client \
>      ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
> +    libndp \
>  "
>
>  FILES_${PN}-dbg +=3D " \
> @@ -109,3 +106,4 @@ FILES_${PN}-tests =3D " \
>  FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
>
>  SYSTEMD_SERVICE_${PN} =3D "NetworkManager.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
What is this for?

Otherwise: Have same her under test for a while and am fine with it.

Have you an update for networkmanager applet - if not I can send out
the patch for it

Andreas

