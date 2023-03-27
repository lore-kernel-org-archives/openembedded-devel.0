Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A66C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 05:09:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.28071.1679893745169084611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 22:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout01.t-online.de (Postfix) with SMTP id 6344BD670;
	Mon, 27 Mar 2023 07:09:02 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.42.31]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgf6L-2gJq1g0; Mon, 27 Mar 2023 07:09:01 +0200
Message-ID: <c44bceba-2618-81de-c6d6-d3017f3be7a0@t-online.de>
Date: Mon, 27 Mar 2023 07:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-gnome][PATCH 21/32] gnome-terminal: update 3.46.7 ->
 3.48.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230325080256.923752-1-f_l_k@t-online.de>
 <20230325080256.923752-21-f_l_k@t-online.de>
 <CAMKF1sr9-1O5dykVWq_iXdKF0eNZbrXz-ftWMv7+9yejkX7tGw@mail.gmail.com>
 <CAMKF1soLh_HUhFts+y2-A=-=o+KFcTSWMbRp_7CDE1JJPMhEdw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <CAMKF1soLh_HUhFts+y2-A=-=o+KFcTSWMbRp_7CDE1JJPMhEdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1679893741-EEFFAC53-21D49BB8/0/0 CLEAN NORMAL
X-TOI-MSGID: 48929240-77c1-461b-9079-78c02e2338ac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101775

yes. I already sent this to oe-core but it was rejected so far because=20
there was still an issue with multilib installation that I wasn't able=20
to reproduce yet. This is how I currently build vte. (Enabled vala=20
support because it would be needed for building blackbox terminal)

SUMMARY =3D "Virtual terminal emulator GTK+ widget library"
DESCRIPTION =3D "VTE provides a virtual terminal widget for GTK applicati=
ons."
HOMEPAGE =3D "https://wiki.gnome.org/Apps/Terminal/VTE"
BUGTRACKER =3D "https://bugzilla.gnome.org/buglist.cgi?product=3Dvte"
LICENSE =3D "GPL-3.0-only & LGPL-3.0-or-later & MIT"
LICENSE:libvte =3D "LGPL-3.0-or-later"

LIC_FILES_CHKSUM =3D " \
 =C2=A0=C2=A0=C2=A0 file://COPYING.GPL3;md5=3Dcc702cf3444d1f19680c794cc61=
948f9 \
 =C2=A0=C2=A0=C2=A0 file://COPYING.LGPL3;md5=3Db52f2d57d10c4f7ee67a7eb961=
5d5d24 \
 =C2=A0=C2=A0=C2=A0 file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e0420=
30f057 \
"

DEPENDS =3D "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native=20
icu pango zlib"

GNOMEBASEBUILDCLASS =3D "meson"
GIR_MESON_OPTION =3D 'gir'
GIDOCGEN_MESON_OPTION =3D "docs"

inherit gnomebase gi-docgen features_check upstream-version-is-even=20
gobject-introspection vala

# vapigen.m4 is required when vala is not present (but the one from vala=20
should be used normally)
SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patc=
h"
SRC_URI[archive.sha256sum] =3D=20
"40fe914d6c70db34176c922725b6c6ea15d5f3cb2a9b44c57e200a5f950a6736"

ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"

# Package additional files
FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"

PACKAGECONFIG:class-target ??=3D " \
 =C2=A0=C2=A0=C2=A0 gnutls \
 =C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'gir =
vala', '', d)} \
 =C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gt=
k4', '', d)} \
"
PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
PACKAGECONFIG[gir] =3D "-Dgir=3Dtrue,-Dgir=3Dfalse"
PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd"

CFLAGS +=3D "-D_GNU_SOURCE"

PACKAGES =3D+ "libvte ${PN}-prompt"
FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
FILES:${PN}-prompt =3D " \
 =C2=A0=C2=A0=C2=A0 ${sysconfdir}/profile.d \
 =C2=A0=C2=A0=C2=A0 ${libexecdir}/vte-urlencode-cwd \
"

FILES:${PN}-dev +=3D "${datadir}/glade/"

BBCLASSEXTEND =3D "native nativesdk"


Am 27.03.23 um 07:04 schrieb Khem Raj:
> it needs latest vte 0.72.0+ I sent a recipe upgrade for oe-core for tha=
t

