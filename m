Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8207FC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:13:37 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36286.1782483214598834069
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=EWWAGCod;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id 599081C4AA
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 16:13:32 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.237.60]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wd7JA-3EKg650; Fri, 26 Jun 2026 16:13:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] flatpak: update 1.17.6 -> 1.18.0
Date: Fri, 26 Jun 2026 16:13:17 +0200
Message-ID: <20260626141317.56506-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1782483208-2B7FDB4F-BD84FA5E/0/0 CLEAN NORMAL
X-TOI-MSGID: 3eed97da-adc0-4c71-a131-5a41be84887e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782483212; i=f_l_k@t-online.de;
	bh=uTr0Eadhj15MDaxijfWKZXGOWC9An+zMu1C8FqY5cYM=;
	h=From:To:Subject:Date;
	b=EWWAGCodNZQFXFKC5Ryr2/nN7HAJphIpHZZHGQO7r6+zfva+fByge43ossKOFZrWT
	 e2c2KJIgjVCFsAaKbdmPNZUCLsWXJurbQoRMHfycQ6auKuyRqcC0KWXbXGF4ZJnwg2
	 A9oLMst06RF1aeo/8NLmVzTLJP3aBrxa5WwYCXMFf/gR34t6/GxNQgtg3BvCShc0Os
	 z+eBC2N2Dhs3Dokxeau6jVdbSWFam9iOz+3A1vdUU4cf2AipNIooeoA9iXRENx9cyL
	 ylI13oBoeVMrm/kckLk7zk8FPkrX1pQ8PbarsErYxSm+66bd7zIw2+eOJ9u5kKAi/4
	 E9KNXNSmKEwzg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 14:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127796

Changes in 1.18.0
~~~~~~~~~~~~~~~~~
Released: 2026-06-08

Enhancements:

* Improve error handling and printed output of `flatpak-coredumpctl` (#66=
49,
  #6680)

* Support the AMD vendor specific compute interface (`/dev/kfd`) via the =
DRI
  device permission (#6648)

* Improve the output of `flatpak update` with failure causes (#6657)

* Improve startup time for fish shell integration (#6635)

* Translation updates: =E2=80=8Ezh_CN (#6671)

Bug fixes:

* Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined =
(#6652)

* Ignore system bus failures in parental controls check (#6663)

* Fix some return values and replace deprecated `GTimeVal` with
  `g_get_real_time()` (#6646)

* Suppress an unused-result warning in the tests (#6655)

Changes in 1.17.7
~~~~~~~~~~~~~~~~~~
Released: 2026-05-06

Enhancements:

* Add the new permission conditionals `has-usb-device` and `has-usb-porta=
l` to
  allow apps to drop --device=3Dall and --device=3Dusb permissions (#6560=
)

* Always send the `Flatpak-Upgrade-From` header when updating instead of
  freshly installing, to improve the quality of statistics (#6626)

* Improve how the absence of the system repo is handled (#6621)

* Changes to repos are now more atomic which helps to avoid them being in=
 an
  invalid state. This could be observed when importing the GPG key failed=
,
  because the system clock was wrong. (#6547)

* A function to report the age of the configuration was added to libflatp=
ak,
  which will help GNOME Software to prevent unnecessary work (#6532)

* Improvements to the build system (#6614, #6610)

* Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)

* Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)

Bug fixes:

* Fix a regression in handling of the fallback-x11 permission, which was
  affecting overrides from Flatseal (#6632)

* Fix a memory leak in the Flatpak portal (#6613)

* Install SELinux configuration files to the right directory (#6622)

* Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.17.6.bb =3D> flatpak_1.18.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.6.bb =3D> flatpak_=
1.18.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.18.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
index 1512b7239f..879455f63c 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "9b21874f1a175a9b7c79175a221fa043e202ca73"
+SRCREV =3D "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
=20
=20
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
--=20
2.54.0


