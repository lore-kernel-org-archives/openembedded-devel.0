Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251F8CD8C9B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 16:13:00 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27871.1763050376063570816
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 08:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lk+ZPw+B;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d71bcac45so9621227b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763050375; x=1763655175; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0BrK84RHmUuYHZ3IBA/eoJ3n3UlBsxfWfA/KCn2HX4=;
        b=Lk+ZPw+B85kfczKyUNLassjAJcMPOXA/rvE6/Bjrh549FsALD+FSwq/W4blLUGrOJI
         locUqy6bIqVZMjFpFiiOjxP8jCm4vSBhZJgx/JmrQ2f0oGF9nin/ZNf0NczbTKh6hKj4
         E7pWuDGYbx/hn8aQTxJV5/QLixnqN1PyRnJX4xFjB1MMAe/msfgY+pPwRofJdWHXZETz
         KFLuG2v+/ujuMiLchlEFPO7pEpdYBtUskdXnQSnMGyFSQLXWD0eyF1gf/KbfcxXcxKQo
         Lr28swCHHeugSLlfbUblu6kGCxb4eTBmfmPGKP3D9ATgArbJqbTsLbRMMisTXUUXdEl2
         sl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763050375; x=1763655175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0BrK84RHmUuYHZ3IBA/eoJ3n3UlBsxfWfA/KCn2HX4=;
        b=VT0GDruwB8F57OAgpWVMw3nSdfIz+mfqO5oV90L7KySNGSspgQd4NezoMs3lQrKkwJ
         CeNXmyI2oxk94oYfXSA/t6R8ZJGS0ySuWxiRB0oV9mKkD+vgAg0vtQSZui/278GnA5F8
         hDPrsDdGiOOuvT2inM7M0RuFtHi8gvsm0nuGk3PZ0aeHOMDhSwggCzRSbN4Hzt2CsY1/
         nJcioyCI4DFp0cC0JqRvFrG8jRVV5Y8OKmkxRWrf0yHtmvdcKAQy1mNZGI1eIIDYLLsQ
         a4nqn/7RTUGXszfNFJqsRa4XoHHntZEpqbzZqN/SUxCfqbEFWDW7V2k2Obl5n68rcmKn
         14BA==
X-Gm-Message-State: AOJu0YwAlvvqWLG+AP4+UVuV7ejPK1J6B7WioFr+cTZIEwqEPZhWagJi
	TL3w6WIGDsr7WrstBIrSG3VnJL+ZrKNeaq483oemlZiEu632LjxtewraGx8PI68SobHRX/eZ2kG
	g44k5esUDgjXR37G5lt5EcJEH4fExZ+0=
X-Gm-Gg: ASbGnctg/b4EwbaED1Mo6Tz9jYX3VD3pfeXeMjymIpf/oVcEB2xwyeAWFu1g3aOp69T
	08aqDS4DKeaHHGdY2YfkHv2lJk7izSe3+9gpHqi0bcrV2tZLpQd2TQby2DRC8VJBP3Ny6kR4df1
	B/kUVkBniq+NGveNJXPTwf6Omz9d/tsm9PTR+lXne/yD9kiiPY/wdBFVjzWIPKrlL63sucHrOs4
	1eTRrwY4AL+9pp7+7nGxTBF60dyXPM05Wns1a+z5xOGSIPlLbEdnhxhoSlhnbQguLNpSktZO0TB
	AOXGJLCYQu/TTF/oViaFEf6vP/8UQP6evQyWYOuXMxR64EGdWswt/oIJG/BEnHuZBXLvt/41sIv
	22CG+8g7sHmkwzMfSvVaIeeevCEM=
X-Google-Smtp-Source: AGHT+IE84PXyWWJXX8O1sNf0mSi1t/Qvn4o/mt9OK9TGk8RbQo7FRTi0TL5vTlRZ4IdiFTX5BrSVk3r81jzzv0hTVa8=
X-Received: by 2002:a05:690c:6c09:b0:787:d2d1:af50 with SMTP id
 00721157ae682-788136e19d6mr58359527b3.64.1763050374921; Thu, 13 Nov 2025
 08:12:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763038144.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1763038144.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 08:12:27 -0800
X-Gm-Features: AWmQ_bk3i-UjltIHE-Gp91r61h4Fz7YSfyli8FX4TovSAyBPrinhLQ_CR_9rSCk
Message-ID: <CAMKF1spc92o3prvWLfhCOeZcZb9QeXO_cACjMxMxwaHND2U6pA@mail.gmail.com>
Subject: Re: [PATCH 00/59] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051833306437c27e1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 16:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121653

--00000000000051833306437c27e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied now. Thanks Anuj

On Thu, Nov 13, 2025 at 5:08=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes for scarthgap. Tested on autobuilder and
> locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1075
>
> My access to contrib has not been set up correctly yet so this is
> currently on GitHub. Sorry about this.
>
> The following changes since commit
> 15e18246dd0c0585cd1515a0be8ee5e2016d1329:
>
>   python3-django: upgrade 4.2.18 -> 4.2.20 (2025-10-30 15:13:43 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/anujm1/meta-openembedded anujm/scarthgap
>   https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap
>
> Anil Dongare (2):
>   python3-django 5.0.11: ignore CVE-2025-27556
>   python3-django 5.0.11: Fix CVE-2025-26699
>
> Ankur Tyagi (9):
>   neatvnc: upgrade 0.8.0 -> 0.8.1
>   mercurial: set CVE_PRODUCT to "mercurial-scm:mercurial"
>   postfix: upgrade 3.8.9 -> 3.8.12
>   proftpd: upgrade 1.3.7c -> 1.3.7f
>   iscsi-initiator-utils: upgrade 2.1.8 -> 2.1.9
>   arno-iptables-firewall: upgrade 2.1.1 -> 2.1.1a
>   frr: upgrade 9.1 -> 9.1.3
>   freeradius: upgrade 3.2.5 -> 3.2.6
>   squid: upgrade 6.12 -> 6.14
>
> Chaitanya Vadrevu (1):
>   samba: Run populate-volatile.sh update in postinst
>
> Etienne Cordonnier (1):
>   fsverity-utils: fix SRC_URI
>
> Gianfranco Costamagna (1):
>   mosquitto: bump to 2.0.22
>
> Gyorgy Sarvari (24):
>   pyxdg: update SRC_URI
>   libvdpau: update SRC_URI
>   pcp: update SRC_URI
>   zabbix: fix SRC_URI
>   zabbix: upgrade 6.2.7 -> 6.2.9
>   xf86-video-armsoc: fix SRC_URI
>   netsniff-ng: fix SRC_URI branch
>   spriv-shader-generator: fix SRC_URI branch
>   xmlsec1: fix SRC_URI
>   gnome-chess: fix SRC_URI branch
>   http-parser: fix SRC_URI branch
>   breakpad: correct SRC_URI branch
>   hiawatha: fix SRC_URI
>   transmission: update SRC_URI branch
>   smarty: fix SRC_URI branch
>   id3lib: update remote patch SRC_URI
>   wifi-test-suite: correct SRC_URI
>   python3-behave: update SRC_URI branch
>   iksemel: fix SRC_URI branch
>   consolation: fix SRC_URI protocol
>   ncftp: fix SRC_URI
>   cmpi-bindings: fix SRC_URI branch
>   mbedtls: update SRC_URI branch
>   unbound: fix SRC_URI
>
> Khem Raj (2):
>   unicode-ucd: Updates due to license.txt updates
>   unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts
>
> Leonard Anderweit (1):
>   cockpit: fix build error
>
> Louis Rannou (1):
>   mosquitto: bump to 2.0.21
>
> Martin Schwan (1):
>   kronosnet: Fetch version tag with BB_GIT_SHALLOW_EXTRA_REFS
>
> Patrick Vogelaar (1):
>   unbound: patch CVE-2024-33655 and CVE-2025-11411
>
> Paul Le Guen de Kerneizon (1):
>   cockpit: remove deprecated packages
>
> Peter Marko (4):
>   hostapd: patch CVE-2022-37660
>   squid: Upgrade to 6.10
>   squid: upgrade 6.10 -> 6.12
>   squid: download from github
>
> Randolph Sapp (1):
>   glm: add nativesdk to BBCLASSEXTEND
>
> Ross Burton (1):
>   pureftp: fix autoreconf
>
> Vijay Anusuri (3):
>   libssh: Fix CVE-2025-8277
>   wireshark: Upgrade 4.2.12 -> 4.2.14
>   wireshark: Fix CVE-2025-9817
>
> Wang Mingyu (1):
>   pure-ftpd: upgrade 1.0.51 -> 1.0.52
>
> Yi Zhao (4):
>   libldb: upgrade 2.8.1 -> 2.8.2
>   samba: upgrade 4.19.8 -> 4.19.9
>   postfix: upgrade 3.8.6 -> 3.8.9
>   yaffs2-utils: update SRC_URI
>
>  .../yaffs2/yaffs2-utils_git.bb                |   3 +-
>  .../gnome-chess/gnome-chess_46.0.bb           |   2 +-
>  .../0008-libtool-do-not-use-jlibtool.patch    | 105 ++-
>  ...reeradius_3.2.5.bb =3D> freeradius_3.2.6.bb} |   2 +-
>  .../mbedtls/mbedtls_2.28.10.bb                |   2 +-
>  .../mosquitto/files/2895.patch                |  17 +-
>  ...osquitto_2.0.20.bb =3D> mosquitto_2.0.22.bb} |   2 +-
>  .../{samba_4.19.8.bb =3D> samba_4.19.9.bb}      |   8 +-
>  ....1.8.bb =3D> iscsi-initiator-utils_2.1.9.bb} |   2 +-
>  .../recipes-daemons/ncftp/ncftp_3.2.7.bb      |   4 +-
>  ...0006-postfix-add-preliminary-setting.patch |  31 -
>  .../{postfix_3.8.6.bb =3D> postfix_3.8.12.bb}   |   3 +-
>  .../{proftpd_1.3.7c.bb =3D> proftpd_1.3.7f.bb}  |   2 +-
>  .../pure-ftpd/pure-ftpd/nostrip.patch         |   7 +-
>  ...ure-ftpd_1.0.51.bb =3D> pure-ftpd_1.0.52.bb} |   6 +-
>  ...e-reference-to-nonexisting-directory.patch |  55 ++
>  .../files/Skip-AC_RUN_IFELSE-tests.patch      |   2 +-
>  .../squid/{squid_6.9.bb =3D> squid_6.14.bb}     |  15 +-
>  .../kronosnet/kronosnet_1.24.bb               |   2 +
>  ....1.bb =3D> arno-iptables-firewall_2.1.1a.bb} |   2 +-
>  .../frr/frr/CVE-2024-31948.patch              | 130 ---
>  .../frr/frr/CVE-2024-31949.patch              | 163 ----
>  .../frr/frr/CVE-2024-31950.patch              |  68 --
>  .../frr/frr/CVE-2024-31951.patch              | 110 ---
>  .../frr/frr/CVE-2024-34088.patch              |  83 --
>  .../frr/frr/CVE-2024-44070.patch              |  54 --
>  .../frr/{frr_9.1.bb =3D> frr_9.1.3.bb}          |   8 +-
>  .../http-parser/http-parser_2.9.4.bb          |   2 +-
>  .../{libldb_2.8.1.bb =3D> libldb_2.8.2.bb}      |   4 +-
>  .../netsniff-ng/netsniff-ng_0.6.8.bb          |   2 +-
>  .../unbound/unbound/CVE-2024-33655.patch      | 792 ++++++++++++++++++
>  .../unbound/unbound/CVE-2025-11411.patch      |  48 ++
>  .../recipes-support/unbound/unbound_1.19.3.bb |   4 +-
>  .../wireshark/files/CVE-2025-9817.patch       |  32 +
>  ...ireshark_4.2.12.bb =3D> wireshark_4.2.14.bb} |   3 +-
>  .../hostapd/hostapd/CVE-2022-37660-01.patch   | 249 ++++++
>  .../hostapd/hostapd/CVE-2022-37660-02.patch   | 111 +++
>  .../hostapd/hostapd/CVE-2022-37660-03.patch   | 762 +++++++++++++++++
>  .../hostapd/hostapd/CVE-2022-37660-04.patch   |  85 ++
>  .../hostapd/hostapd_2.10.bb                   |   4 +
>  .../transmission/transmission_git.bb          |   2 +-
>  .../wifi-test-suite_10.10.1.bb                |   2 +-
>  .../{zabbix_6.2.7.bb =3D> zabbix_6.2.9.bb}      |   4 +-
>  .../fsverity-utils/fsverity-utils_1.5.bb      |   2 +-
>  .../breakpad/breakpad_2023.06.01.bb           |   2 +-
>  .../mercurial/mercurial_6.5.bb                |   1 +
>  .../cmpi-bindings/cmpi-bindings_1.0.4.bb      |   2 +-
>  meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb     |   2 +-
>  meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb   |   2 +-
>  .../{neatvnc_0.8.0.bb =3D> neatvnc_0.8.1.bb}    |   4 +-
>  .../spir/spirv-shader-generator_git.bb        |   2 +-
>  .../recipes-graphics/vdpau/libvdpau_1.5.bb    |   2 +-
>  .../xorg-driver/xf86-video-armsoc_1.4.1.bb    |   2 +-
>  .../recipes-multimedia/id3lib/id3lib_3.8.3.bb |   6 +-
>  .../consolation/consolation_0.0.9.bb          |   2 +-
>  .../recipes-support/iksemel/iksemel_1.5.bb    |   2 +-
>  .../libssh/libssh/CVE-2025-8277-1.patch       |  40 +
>  .../libssh/libssh/CVE-2025-8277-2.patch       |  94 +++
>  .../libssh/libssh/CVE-2025-8277-3.patch       |  48 ++
>  .../libssh/libssh/CVE-2025-8277-4.patch       |  48 ++
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   4 +
>  meta-oe/recipes-support/pcp/pcp.inc           |   6 +-
>  .../recipes-support/smarty/smarty_4.4.1.bb    |   2 +-
>  .../unicode-ucd/unicode-ucd_14.0.0.bb         |   6 +-
>  .../recipes-support/xmlsec1/xmlsec1_1.3.4.bb  |   2 +-
>  .../python/python3-behave_1.2.6.bb            |   2 +-
>  .../python3-django/CVE-2025-26699.patch       | 100 +++
>  .../python/python3-django_5.0.11.bb           |   5 +
>  .../recipes-httpd/hiawatha/hiawatha_10.12.bb  |   2 +-
>  .../recipes-webadmin/cockpit/cockpit_304.bb   |  11 +-
>  ...sing-src-common-directory-in-build-t.patch |  32 +
>  71 files changed, 2681 insertions(+), 746 deletions(-)
>  rename meta-networking/recipes-connectivity/freeradius/{
> freeradius_3.2.5.bb =3D> freeradius_3.2.6.bb} (99%)
>  rename meta-networking/recipes-connectivity/mosquitto/{
> mosquitto_2.0.20.bb =3D> mosquitto_2.0.22.bb} (97%)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.19.8.bb =3D>
> samba_4.19.9.bb} (98%)
>  rename meta-networking/recipes-daemons/iscsi-initiator-utils/{
> iscsi-initiator-utils_2.1.8.bb =3D> iscsi-initiator-utils_2.1.9.bb} (98%)
>  delete mode 100644
> meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminar=
y-setting.patch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.8.6.bb =3D>
> postfix_3.8.12.bb} (98%)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.7c.bb =3D>
> proftpd_1.3.7f.bb} (99%)
>  rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.51.bb =
=3D>
> pure-ftpd_1.0.52.bb} (79%)
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference=
-to-nonexisting-directory.patch
>  rename meta-networking/recipes-daemons/squid/{squid_6.9.bb =3D>
> squid_6.14.bb} (91%)
>  rename meta-networking/recipes-filter/arno-iptables-firewall/{
> arno-iptables-firewall_2.1.1.bb =3D> arno-iptables-firewall_2.1.1a.bb} (9=
7%)
>  delete mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
>  delete mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
>  delete mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
>  delete mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
>  delete mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
>  delete mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
>  rename meta-networking/recipes-protocols/frr/{frr_9.1.bb =3D> frr_9.1.3.=
bb}
> (94%)
>  rename meta-networking/recipes-support/libldb/{libldb_2.8.1.bb =3D>
> libldb_2.8.2.bb} (95%)
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2024-33655.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2025-11411.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_4.2.12.bb =
=3D>
> wireshark_4.2.14.bb} (96%)
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-01.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-02.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-03.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2022-37660-04.patch
>  rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.7.bb =3D>
> zabbix_6.2.9.bb} (94%)
>  rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb =3D>
> neatvnc_0.8.1.bb} (89%)
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-4.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
>  create mode 100644
> meta-webserver/recipes-webadmin/cockpit/files/0001-build-Create-missing-s=
rc-common-directory-in-build-t.patch
>
> --
> 2.51.2
>
>

--00000000000051833306437c27e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">applied now. Thanks Anuj</div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov =
13, 2025 at 5:08=E2=80=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@o=
ss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Please merge these changes for=
 scarthgap. Tested on autobuilder and<br>
locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1075" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1075</a><br>
<br>
My access to contrib has not been set up correctly yet so this is<br>
currently on GitHub. Sorry about this.<br>
<br>
The following changes since commit 15e18246dd0c0585cd1515a0be8ee5e2016d1329=
:<br>
<br>
=C2=A0 python3-django: upgrade 4.2.18 -&gt; 4.2.20 (2025-10-30 15:13:43 +08=
00)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://github.com/anujm1/meta-openembedded" rel=3D"noref=
errer" target=3D"_blank">https://github.com/anujm1/meta-openembedded</a> an=
ujm/scarthgap<br>
=C2=A0 <a href=3D"https://github.com/anujm1/meta-openembedded/tree/anujm/sc=
arthgap" rel=3D"noreferrer" target=3D"_blank">https://github.com/anujm1/met=
a-openembedded/tree/anujm/scarthgap</a><br>
<br>
Anil Dongare (2):<br>
=C2=A0 python3-django 5.0.11: ignore CVE-2025-27556<br>
=C2=A0 python3-django 5.0.11: Fix CVE-2025-26699<br>
<br>
Ankur Tyagi (9):<br>
=C2=A0 neatvnc: upgrade 0.8.0 -&gt; 0.8.1<br>
=C2=A0 mercurial: set CVE_PRODUCT to &quot;mercurial-scm:mercurial&quot;<br=
>
=C2=A0 postfix: upgrade 3.8.9 -&gt; 3.8.12<br>
=C2=A0 proftpd: upgrade 1.3.7c -&gt; 1.3.7f<br>
=C2=A0 iscsi-initiator-utils: upgrade 2.1.8 -&gt; 2.1.9<br>
=C2=A0 arno-iptables-firewall: upgrade 2.1.1 -&gt; 2.1.1a<br>
=C2=A0 frr: upgrade 9.1 -&gt; 9.1.3<br>
=C2=A0 freeradius: upgrade 3.2.5 -&gt; 3.2.6<br>
=C2=A0 squid: upgrade 6.12 -&gt; 6.14<br>
<br>
Chaitanya Vadrevu (1):<br>
=C2=A0 samba: Run populate-volatile.sh update in postinst<br>
<br>
Etienne Cordonnier (1):<br>
=C2=A0 fsverity-utils: fix SRC_URI<br>
<br>
Gianfranco Costamagna (1):<br>
=C2=A0 mosquitto: bump to 2.0.22<br>
<br>
Gyorgy Sarvari (24):<br>
=C2=A0 pyxdg: update SRC_URI<br>
=C2=A0 libvdpau: update SRC_URI<br>
=C2=A0 pcp: update SRC_URI<br>
=C2=A0 zabbix: fix SRC_URI<br>
=C2=A0 zabbix: upgrade 6.2.7 -&gt; 6.2.9<br>
=C2=A0 xf86-video-armsoc: fix SRC_URI<br>
=C2=A0 netsniff-ng: fix SRC_URI branch<br>
=C2=A0 spriv-shader-generator: fix SRC_URI branch<br>
=C2=A0 xmlsec1: fix SRC_URI<br>
=C2=A0 gnome-chess: fix SRC_URI branch<br>
=C2=A0 http-parser: fix SRC_URI branch<br>
=C2=A0 breakpad: correct SRC_URI branch<br>
=C2=A0 hiawatha: fix SRC_URI<br>
=C2=A0 transmission: update SRC_URI branch<br>
=C2=A0 smarty: fix SRC_URI branch<br>
=C2=A0 id3lib: update remote patch SRC_URI<br>
=C2=A0 wifi-test-suite: correct SRC_URI<br>
=C2=A0 python3-behave: update SRC_URI branch<br>
=C2=A0 iksemel: fix SRC_URI branch<br>
=C2=A0 consolation: fix SRC_URI protocol<br>
=C2=A0 ncftp: fix SRC_URI<br>
=C2=A0 cmpi-bindings: fix SRC_URI branch<br>
=C2=A0 mbedtls: update SRC_URI branch<br>
=C2=A0 unbound: fix SRC_URI<br>
<br>
Khem Raj (2):<br>
=C2=A0 unicode-ucd: Updates due to license.txt updates<br>
=C2=A0 unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts<br>
<br>
Leonard Anderweit (1):<br>
=C2=A0 cockpit: fix build error<br>
<br>
Louis Rannou (1):<br>
=C2=A0 mosquitto: bump to 2.0.21<br>
<br>
Martin Schwan (1):<br>
=C2=A0 kronosnet: Fetch version tag with BB_GIT_SHALLOW_EXTRA_REFS<br>
<br>
Patrick Vogelaar (1):<br>
=C2=A0 unbound: patch CVE-2024-33655 and CVE-2025-11411<br>
<br>
Paul Le Guen de Kerneizon (1):<br>
=C2=A0 cockpit: remove deprecated packages<br>
<br>
Peter Marko (4):<br>
=C2=A0 hostapd: patch CVE-2022-37660<br>
=C2=A0 squid: Upgrade to 6.10<br>
=C2=A0 squid: upgrade 6.10 -&gt; 6.12<br>
=C2=A0 squid: download from github<br>
<br>
Randolph Sapp (1):<br>
=C2=A0 glm: add nativesdk to BBCLASSEXTEND<br>
<br>
Ross Burton (1):<br>
=C2=A0 pureftp: fix autoreconf<br>
<br>
Vijay Anusuri (3):<br>
=C2=A0 libssh: Fix CVE-2025-8277<br>
=C2=A0 wireshark: Upgrade 4.2.12 -&gt; 4.2.14<br>
=C2=A0 wireshark: Fix CVE-2025-9817<br>
<br>
Wang Mingyu (1):<br>
=C2=A0 pure-ftpd: upgrade 1.0.51 -&gt; 1.0.52<br>
<br>
Yi Zhao (4):<br>
=C2=A0 libldb: upgrade 2.8.1 -&gt; 2.8.2<br>
=C2=A0 samba: upgrade 4.19.8 -&gt; 4.19.9<br>
=C2=A0 postfix: upgrade 3.8.6 -&gt; 3.8.9<br>
=C2=A0 yaffs2-utils: update SRC_URI<br>
<br>
=C2=A0.../yaffs2/<a href=3D"http://yaffs2-utils_git.bb" rel=3D"noreferrer" =
target=3D"_blank">yaffs2-utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0.../gnome-chess/<a href=3D"http://gnome-chess_46.0.bb" rel=3D"norefer=
rer" target=3D"_blank">gnome-chess_46.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../0008-libtool-do-not-use-jlibtool.patch=C2=A0 =C2=A0 | 105 ++-<br>
=C2=A0...<a href=3D"http://reeradius_3.2.5.bb" rel=3D"noreferrer" target=3D=
"_blank">reeradius_3.2.5.bb</a> =3D&gt; <a href=3D"http://freeradius_3.2.6.=
bb" rel=3D"noreferrer" target=3D"_blank">freeradius_3.2.6.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" =
target=3D"_blank">mbedtls_2.28.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../mosquitto/files/2895.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
=C2=A0...<a href=3D"http://osquitto_2.0.20.bb" rel=3D"noreferrer" target=3D=
"_blank">osquitto_2.0.20.bb</a> =3D&gt; <a href=3D"http://mosquitto_2.0.22.=
bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.22.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://samba_4.19.8.bb" rel=3D"noreferrer" target=3D"=
_blank">samba_4.19.8.bb</a> =3D&gt; <a href=3D"http://samba_4.19.9.bb" rel=
=3D"noreferrer" target=3D"_blank">samba_4.19.9.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A08 +-<br>
=C2=A0....<a href=3D"http://1.8.bb" rel=3D"noreferrer" target=3D"_blank">1.=
8.bb</a> =3D&gt; <a href=3D"http://iscsi-initiator-utils_2.1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">iscsi-initiator-utils_2.1.9.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../recipes-daemons/ncftp/<a href=3D"http://ncftp_3.2.7.bb" rel=3D"no=
referrer" target=3D"_blank">ncftp_3.2.7.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...0006-postfix-add-preliminary-setting.patch |=C2=A0 31 -<br>
=C2=A0.../{<a href=3D"http://postfix_3.8.6.bb" rel=3D"noreferrer" target=3D=
"_blank">postfix_3.8.6.bb</a> =3D&gt; <a href=3D"http://postfix_3.8.12.bb" =
rel=3D"noreferrer" target=3D"_blank">postfix_3.8.12.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://proftpd_1.3.7c.bb" rel=3D"noreferrer" target=
=3D"_blank">proftpd_1.3.7c.bb</a> =3D&gt; <a href=3D"http://proftpd_1.3.7f.=
bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7f.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../pure-ftpd/pure-ftpd/nostrip.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0...<a href=3D"http://ure-ftpd_1.0.51.bb" rel=3D"noreferrer" target=3D=
"_blank">ure-ftpd_1.0.51.bb</a> =3D&gt; <a href=3D"http://pure-ftpd_1.0.52.=
bb" rel=3D"noreferrer" target=3D"_blank">pure-ftpd_1.0.52.bb</a>} |=C2=A0 =
=C2=A06 +-<br>
=C2=A0...e-reference-to-nonexisting-directory.patch |=C2=A0 55 ++<br>
=C2=A0.../files/Skip-AC_RUN_IFELSE-tests.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../squid/{<a href=3D"http://squid_6.9.bb" rel=3D"noreferrer" target=
=3D"_blank">squid_6.9.bb</a> =3D&gt; <a href=3D"http://squid_6.14.bb" rel=
=3D"noreferrer" target=3D"_blank">squid_6.14.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 15 +-<br>
=C2=A0.../kronosnet/<a href=3D"http://kronosnet_1.24.bb" rel=3D"noreferrer"=
 target=3D"_blank">kronosnet_1.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0....<a href=3D"http://1.bb" rel=3D"noreferrer" target=3D"_blank">1.bb=
</a> =3D&gt; <a href=3D"http://arno-iptables-firewall_2.1.1a.bb" rel=3D"nor=
eferrer" target=3D"_blank">arno-iptables-firewall_2.1.1a.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../frr/frr/CVE-2024-31948.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 130 ---<br>
=C2=A0.../frr/frr/CVE-2024-31949.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 163 ----<br>
=C2=A0.../frr/frr/CVE-2024-31950.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 68 --<br>
=C2=A0.../frr/frr/CVE-2024-31951.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 110 ---<br>
=C2=A0.../frr/frr/CVE-2024-34088.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 83 --<br>
=C2=A0.../frr/frr/CVE-2024-44070.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 54 --<br>
=C2=A0.../frr/{<a href=3D"http://frr_9.1.bb" rel=3D"noreferrer" target=3D"_=
blank">frr_9.1.bb</a> =3D&gt; <a href=3D"http://frr_9.1.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">frr_9.1.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A08 +-<br>
=C2=A0.../http-parser/<a href=3D"http://http-parser_2.9.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">http-parser_2.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libldb_2.8.1.bb" rel=3D"noreferrer" target=3D"=
_blank">libldb_2.8.1.bb</a> =3D&gt; <a href=3D"http://libldb_2.8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libldb_2.8.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +-<br>
=C2=A0.../netsniff-ng/<a href=3D"http://netsniff-ng_0.6.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">netsniff-ng_0.6.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../unbound/unbound/CVE-2024-33655.patch=C2=A0 =C2=A0 =C2=A0 | 792 ++=
++++++++++++++++<br>
=C2=A0.../unbound/unbound/CVE-2025-11411.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
48 ++<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.19.3.bb" rel=
=3D"noreferrer" target=3D"_blank">unbound_1.19.3.bb</a> |=C2=A0 =C2=A04 +-<=
br>
=C2=A0.../wireshark/files/CVE-2025-9817.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 32 +<br>
=C2=A0...<a href=3D"http://ireshark_4.2.12.bb" rel=3D"noreferrer" target=3D=
"_blank">ireshark_4.2.12.bb</a> =3D&gt; <a href=3D"http://wireshark_4.2.14.=
bb" rel=3D"noreferrer" target=3D"_blank">wireshark_4.2.14.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-01.patch=C2=A0 =C2=A0| 249 ++++++<=
br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-02.patch=C2=A0 =C2=A0| 111 +++<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-03.patch=C2=A0 =C2=A0| 762 +++++++=
++++++++++<br>
=C2=A0.../hostapd/hostapd/CVE-2022-37660-04.patch=C2=A0 =C2=A0|=C2=A0 85 ++=
<br>
=C2=A0.../hostapd/<a href=3D"http://hostapd_2.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">hostapd_2.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0.../transmission/<a href=3D"http://transmission_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">transmission_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../<a href=3D"http://wifi-test-suite_10.10.1.bb" rel=3D"noreferrer" =
target=3D"_blank">wifi-test-suite_10.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://zabbix_6.2.7.bb" rel=3D"noreferrer" target=3D"=
_blank">zabbix_6.2.7.bb</a> =3D&gt; <a href=3D"http://zabbix_6.2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">zabbix_6.2.9.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +-<br>
=C2=A0.../fsverity-utils/<a href=3D"http://fsverity-utils_1.5.bb" rel=3D"no=
referrer" target=3D"_blank">fsverity-utils_1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../breakpad/<a href=3D"http://breakpad_2023.06.01.bb" rel=3D"norefer=
rer" target=3D"_blank">breakpad_2023.06.01.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../mercurial/<a href=3D"http://mercurial_6.5.bb" rel=3D"noreferrer" =
target=3D"_blank">mercurial_6.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../cmpi-bindings/<a href=3D"http://cmpi-bindings_1.0.4.bb" rel=3D"no=
referrer" target=3D"_blank">cmpi-bindings_1.0.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-gnome/pyxdg/<a href=3D"http://pyxdg_0.28.bb" rel=3D"n=
oreferrer" target=3D"_blank">pyxdg_0.28.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.8.bb" rel=3D=
"noreferrer" target=3D"_blank">glm_0.9.9.8.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../{<a href=3D"http://neatvnc_0.8.0.bb" rel=3D"noreferrer" target=3D=
"_blank">neatvnc_0.8.0.bb</a> =3D&gt; <a href=3D"http://neatvnc_0.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">neatvnc_0.8.1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../spir/<a href=3D"http://spirv-shader-generator_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">spirv-shader-generator_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-graphics/vdpau/<a href=3D"http://libvdpau_1.5.bb" rel=3D"=
noreferrer" target=3D"_blank">libvdpau_1.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../xorg-driver/<a href=3D"http://xf86-video-armsoc_1.4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">xf86-video-armsoc_1.4.1.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-multimedia/id3lib/<a href=3D"http://id3lib_3.8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">id3lib_3.8.3.bb</a> |=C2=A0 =C2=A06 +-<br=
>
=C2=A0.../consolation/<a href=3D"http://consolation_0.0.9.bb" rel=3D"norefe=
rrer" target=3D"_blank">consolation_0.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-support/iksemel/<a href=3D"http://iksemel_1.5.bb" rel=3D"=
noreferrer" target=3D"_blank">iksemel_1.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 40 +<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 94 +++<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 48 ++<br>
=C2=A0.../libssh/libssh/CVE-2025-8277-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 48 ++<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0meta-oe/recipes-support/pcp/pcp.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0.../recipes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">smarty_4.4.1.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../unicode-ucd/<a href=3D"http://unicode-ucd_14.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">unicode-ucd_14.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0.../recipes-support/xmlsec1/<a href=3D"http://xmlsec1_1.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">xmlsec1_1.3.4.bb</a>=C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-behave_1.2.6.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-behave_1.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python3-django/CVE-2025-26699.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
00 +++<br>
=C2=A0.../python/<a href=3D"http://python3-django_5.0.11.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_5.0.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0.../recipes-httpd/hiawatha/<a href=3D"http://hiawatha_10.12.bb" rel=
=3D"noreferrer" target=3D"_blank">hiawatha_10.12.bb</a>=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../recipes-webadmin/cockpit/<a href=3D"http://cockpit_304.bb" rel=3D=
"noreferrer" target=3D"_blank">cockpit_304.bb</a>=C2=A0 =C2=A0|=C2=A0 11 +-=
<br>
=C2=A0...sing-src-common-directory-in-build-t.patch |=C2=A0 32 +<br>
=C2=A071 files changed, 2681 insertions(+), 746 deletions(-)<br>
=C2=A0rename meta-networking/recipes-connectivity/freeradius/{<a href=3D"ht=
tp://freeradius_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank">freeradius_3=
.2.5.bb</a> =3D&gt; <a href=3D"http://freeradius_3.2.6.bb" rel=3D"noreferre=
r" target=3D"_blank">freeradius_3.2.6.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-connectivity/mosquitto/{<a href=3D"htt=
p://mosquitto_2.0.20.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0=
.20.bb</a> =3D&gt; <a href=3D"http://mosquitto_2.0.22.bb" rel=3D"noreferrer=
" target=3D"_blank">mosquitto_2.0.22.bb</a>} (97%)<br>
=C2=A0rename meta-networking/recipes-connectivity/samba/{<a href=3D"http://=
samba_4.19.8.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.19.8.bb</a> =
=3D&gt; <a href=3D"http://samba_4.19.9.bb" rel=3D"noreferrer" target=3D"_bl=
ank">samba_4.19.9.bb</a>} (98%)<br>
=C2=A0rename meta-networking/recipes-daemons/iscsi-initiator-utils/{<a href=
=3D"http://iscsi-initiator-utils_2.1.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">iscsi-initiator-utils_2.1.8.bb</a> =3D&gt; <a href=3D"http://iscsi-ini=
tiator-utils_2.1.9.bb" rel=3D"noreferrer" target=3D"_blank">iscsi-initiator=
-utils_2.1.9.bb</a>} (98%)<br>
=C2=A0delete mode 100644 meta-networking/recipes-daemons/postfix/files/0006=
-postfix-add-preliminary-setting.patch<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.8.6.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.6.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.8.12.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.8.12.bb</a>} (98%)<br>
=C2=A0rename meta-networking/recipes-daemons/proftpd/{<a href=3D"http://pro=
ftpd_1.3.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> =
=3D&gt; <a href=3D"http://proftpd_1.3.7f.bb" rel=3D"noreferrer" target=3D"_=
blank">proftpd_1.3.7f.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-daemons/pure-ftpd/{<a href=3D"http://p=
ure-ftpd_1.0.51.bb" rel=3D"noreferrer" target=3D"_blank">pure-ftpd_1.0.51.b=
b</a> =3D&gt; <a href=3D"http://pure-ftpd_1.0.52.bb" rel=3D"noreferrer" tar=
get=3D"_blank">pure-ftpd_1.0.52.bb</a>} (79%)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/0001-l=
ibltdl-remove-reference-to-nonexisting-directory.patch<br>
=C2=A0rename meta-networking/recipes-daemons/squid/{<a href=3D"http://squid=
_6.9.bb" rel=3D"noreferrer" target=3D"_blank">squid_6.9.bb</a> =3D&gt; <a h=
ref=3D"http://squid_6.14.bb" rel=3D"noreferrer" target=3D"_blank">squid_6.1=
4.bb</a>} (91%)<br>
=C2=A0rename meta-networking/recipes-filter/arno-iptables-firewall/{<a href=
=3D"http://arno-iptables-firewall_2.1.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">arno-iptables-firewall_2.1.1.bb</a> =3D&gt; <a href=3D"http://arno-ip=
tables-firewall_2.1.1a.bb" rel=3D"noreferrer" target=3D"_blank">arno-iptabl=
es-firewall_2.1.1a.bb</a>} (97%)<br>
=C2=A0delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-31948.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-31949.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-31950.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-31951.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-34088.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024=
-44070.patch<br>
=C2=A0rename meta-networking/recipes-protocols/frr/{<a href=3D"http://frr_9=
.1.bb" rel=3D"noreferrer" target=3D"_blank">frr_9.1.bb</a> =3D&gt; <a href=
=3D"http://frr_9.1.3.bb" rel=3D"noreferrer" target=3D"_blank">frr_9.1.3.bb<=
/a>} (94%)<br>
=C2=A0rename meta-networking/recipes-support/libldb/{<a href=3D"http://libl=
db_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libldb_2.8.1.bb</a> =3D&g=
t; <a href=3D"http://libldb_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">=
libldb_2.8.2.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2024-33655.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2025-11411.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2025-9817.patch<br>
=C2=A0rename meta-networking/recipes-support/wireshark/{<a href=3D"http://w=
ireshark_4.2.12.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_4.2.12.b=
b</a> =3D&gt; <a href=3D"http://wireshark_4.2.14.bb" rel=3D"noreferrer" tar=
get=3D"_blank">wireshark_4.2.14.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-03.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
022-37660-04.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/zabbix/{<a href=3D"http://zabbix_=
6.2.7.bb" rel=3D"noreferrer" target=3D"_blank">zabbix_6.2.7.bb</a> =3D&gt; =
<a href=3D"http://zabbix_6.2.9.bb" rel=3D"noreferrer" target=3D"_blank">zab=
bix_6.2.9.bb</a>} (94%)<br>
=C2=A0rename meta-oe/recipes-graphics/neatvnc/{<a href=3D"http://neatvnc_0.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">neatvnc_0.8.0.bb</a> =3D&gt; <=
a href=3D"http://neatvnc_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">nea=
tvnc_0.8.1.bb</a>} (89%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-827=
7-4.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2025-26699.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001=
-build-Create-missing-src-common-directory-in-build-t.patch<br>
<br>
-- <br>
2.51.2<br>
<br>
</blockquote></div>

--00000000000051833306437c27e1--

