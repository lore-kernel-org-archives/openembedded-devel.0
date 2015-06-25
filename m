Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B599605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 06:36:53 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so46842416pdc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 23:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=qqSh2/3xeSnz19el4JCv9O6LXVL5t4UJDeKIZ8i5FBQ=;
	b=gsu+LoitkMp5bjK/wcmaSHmfFrJjHnJpjXemZOu1xHi/DtP3cRADSGWPc7Jhy/3KPS
	h5GeI4UsNtP9Ph4g+p4yFwe1fmb629DX1eGStbkHpIX3wEaYb5zzAKwZE/ZXqzOjKjgT
	VcPJF8Im3J9ZSRsrJqV9FXkCfergVEpqbzuo4IT/plTb3oPt0sd80Bcz/X0ocqSB4xVP
	PnryTduXj3bn4NoiRc5h8EVJvjPk4aVE9K99/NiT5Nws+gEictAv9TE/XEnYgNLFjlrr
	1xULc0dif70Gg4z0qUr27FAg/8jnoTogloUv0TH02fknjpabuaOqh3eG+TrIwFcnY2HI
	POsA==
MIME-Version: 1.0
X-Received: by 10.70.47.9 with SMTP id z9mr88589935pdm.69.1435214215423; Wed,
	24 Jun 2015 23:36:55 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Wed, 24 Jun 2015 23:36:55 -0700 (PDT)
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E87390AF66@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1435197618-1621-2-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CALbNGRQU9+M1aQMWRtW8p02esF8K9COy=LPM6R8=wSZB4xY_dA@mail.gmail.com>
	<A8FC939F80655644A89BB21CCD3741E87390AF66@G08CNEXMBPEKD02.g08.fujitsu.local>
Date: Thu, 25 Jun 2015 08:36:55 +0200
Message-ID: <CALbNGRR_yo9RC0TTvoK8SjLKowvQm12FD+_xE1r+shm+M2iWKA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
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
X-List-Received-Date: Thu, 25 Jun 2015 06:36:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 8:34 AM, Li, Xin <lixin.fnst@cn.fujitsu.com> wrote:
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Andreas M=C3=BCller
>> Sent: Thursday, June 25, 2015 1:32 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH 1/2] networkmanager: upgrade from 0.9.=
8.10 to
>> 1.0.2
>>
>> On Thu, Jun 25, 2015 at 4:00 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrot=
e:
>> > 1) remove
>> > 0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch,
>> > it is not needed any more.
>> >
>> > 2) set NetworkManager.service auto disable,otherwise,the Root file
>> > system using the method of NFS mount can't boot successfully.
>> >
>> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>> > ---
>> >  ...c-Check-only-for-libsystemd-not-libsystem.patch | 30
>> > ----------------------  ...manager_0.9.8.10.bb =3D>
>> > networkmanager_1.0.2.bb} | 16 +++++-------
>> >  2 files changed, 7 insertions(+), 39 deletions(-)  delete mode 100644
>> > meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-config
>> > ure.ac-Check-only-for-libsystemd-not-libsystem.patch
>> >  rename
>> > meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.b
>> > b =3D> networkmanager_1.0.2.bb} (87%)
>> >
>> > diff --git
>> > a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-conf
>> > igure.ac-Check-only-for-libsystemd-not-libsystem.patch
>> > b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-conf
>> > igure.ac-Check-only-for-libsystemd-not-libsystem.patch
>> > deleted file mode 100644
>> > index e356e9b..0000000
>> > ---
>> > a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-conf
>> > igure.ac-Check-only-for-libsystemd-not-libsystem.patch
>> > +++ /dev/null
>> > @@ -1,30 +0,0 @@
>> > -From 10427a19302e871daeeb245581e930dc58195492 Mon Sep 17 00:00:00
>> > 2001
>> > -From: Martin Jansa <Martin.Jansa@gmail.com>
>> > -Date: Thu, 27 Feb 2014 12:59:03 +0100
>> > -Subject: [PATCH] configure.ac: Check only for libsystemd not
>> > libsystemd-login
>> > -
>> > -* they were merged into libsystemd in systemd-209
>> > -
>> > -Upstream-Status: Pending (it would need to be conditional on systemd
>> > version for upstream to accept this)
>> > -
>> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ----
>> > - configure.ac | 2 +-
>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > -
>> > -diff --git a/configure.ac b/configure.ac -index cc66e9b..3fe958e
>> > 100644
>> > ---- a/configure.ac
>> > -+++ b/configure.ac
>> > -@@ -283,7 +283,7 @@ AS_IF([! (echo "$with_session_tracking" | grep -q=
 -E
>> "^(systemd|consolekit|no)$"
>> > - AM_CONDITIONAL(SESSION_TRACKING_CK, test "$with_session_tracking" =
=3D
>> > "consolekit")
>> > - AM_CONDITIONAL(SESSION_TRACKING_SYSTEMD, test
>> > "xwith_session_tracking" =3D "systemd")
>> > - if test "$with_session_tracking" =3D "systemd"; then
>> > --      PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login])
>> > -+      PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd])
>> > -       AC_SUBST(SYSTEMD_LOGIN_CFLAGS)
>> > -       AC_SUBST(SYSTEMD_LOGIN_LIBS)
>> > - fi
>> > ---
>> > -1.9.0
>> > -
>> > diff --git
>> > a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.
>> > bb
>> > b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
>> > similarity index 87%
>> > rename from
>> > meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
>> > rename to
>> > meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2.bb
>> > index 8d37c98..fb8efaf 100644
>> > ---
>> > a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.
>> > bb
>> > +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.2
>> > +++ .bb
>> > @@ -4,18 +4,16 @@ SECTION =3D "net/misc"
>> >  LICENSE =3D "GPLv2+"
>> >  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Dcbbffd568227ada506640fe950a4823b"
>> >
>> > -DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools nss util-linux =
ppp"
>> > +DEPENDS =3D "libnl dbus dbus-glib udev wireless-tools nss util-linux =
ppp libndp"
>> >
>> >  inherit gnome gettext systemd
>> >
>> >  SRC_URI =3D " \
>> >
>> ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana
>> ger-${PV}.tar.xz \
>> >      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.=
patch \
>> > -    file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.=
patch \
>> >  "
>> > -SRC_URI[md5sum] =3D "aad2558887e25417c52eb2deaade2f85"
>> > -SRC_URI[sha256sum] =3D
>> "064d27223d3824859df12e1fb25b787fec1c68bbc864dc52a0289b9211c4c972"
>> > -
>> > +SRC_URI[md5sum] =3D "5a4899f89edcbdd1ac46d2d947e8d6eb"
>> > +SRC_URI[sha256sum] =3D
>> "359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a47055c71e96439508ff"
>> >
>> >  S =3D "${WORKDIR}/NetworkManager-${PV}"
>> >
>> > @@ -47,7 +45,6 @@ PACKAGECONFIG[concheck] =3D
>> "--enable-concheck,--disable-concheck,libsoup-2.4"
>> >  do_install_prepend() {
>> >      sed -i 's:deny send_destination:allow send_destination:g'
>> ${S}/src/org.freedesktop.NetworkManager.conf
>> >      sed -i 's:deny send_destination:allow send_destination:g'
>> ${S}/callouts/nm-dispatcher.conf
>> > -    sed -i 's:deny send_destination:allow send_destination:g'
>> ${S}/callouts/nm-dhcp-client.conf
>> >      sed -i 's:deny send_destination:allow send_destination:g'
>> > ${S}/callouts/nm-avahi-autoipd.conf
>> >  }
>> >
>> > @@ -55,8 +52,7 @@ do_install_append () {
>> >      install -d ${D}${sysconfdir}/dbus-1/event.d
>> >      # Additional test binaries
>> >      install -d ${D}${bindir}
>> > -    install -m 0755 ${B}/test/.libs/libnm* ${D}${bindir}
>> > -
>> > +    install -m 0755 ${B}/libnm-glib/libnm-glib-test ${D}${bindir}
>> >      # Install an empty VPN folder as nm-connection-editor will happil=
y segfault
>> without it :o.
>> >      # With or without VPN support built in ;).
>> >      install -d ${D}${sysconfdir}/NetworkManager/VPN
>> > @@ -78,7 +74,7 @@ FILES_${PN} +=3D " \
>> >      ${datadir}/polkit-1 \
>> >      ${datadir}/dbus-1 \
>> >      ${base_libdir}/udev/* \
>> > -    ${systemd_unitdir}/system/NetworkManager-wait-online.service \
>> > +    ${systemd_unitdir}/system/* \
>> >  "
>> >
>> >  RRECOMMENDS_${PN} +=3D "iptables dnsmasq"
>> > @@ -87,6 +83,7 @@ RDEPENDS_${PN} =3D " \
>> >      wpa-supplicant \
>> >      dhcp-client \
>> >      ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
>> > +    libndp \
>> >  "
>> >
>> >  FILES_${PN}-dbg +=3D " \
>> > @@ -109,3 +106,4 @@ FILES_${PN}-tests =3D " \
>> > FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
>> >
>> >  SYSTEMD_SERVICE_${PN} =3D "NetworkManager.service"
>> > +SYSTEMD_AUTO_ENABLE =3D "disable"
>> What is this for?
>>
>> Otherwise: Have same her under test for a while and am fine with it.
>>
> Thanks for your reply.
>
> After setting "SYSTEMD_AUTO_ENABLE =3D "disable"", the NetworkManager.ser=
vice will not
> Be started when the system starts.
> And we did test about this.
Yes and how is it started?

Andreas

