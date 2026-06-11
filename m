Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF07CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:08:55 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42062.1781172524779612276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=E/nhENiH;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd97.aul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout04.t-online.de (Postfix) with SMTP id A5A4E5A3
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:08:42 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXcL4-0RTVys0; Thu, 11 Jun 2026 12:08:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] webkitgtk3: add PACKAGECONFIG for librice
Date: Thu, 11 Jun 2026 12:08:36 +0200
Message-ID: <20260611100836.603126-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611100836.603126-1-f_l_k@t-online.de>
References: <20260611100836.603126-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781172522-3CFF7561-5DFC74F4/0/0 CLEAN NORMAL
X-TOI-MSGID: 60937745-88ea-4b4d-8f5c-0e19e6fa8837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781172522; i=f_l_k@t-online.de;
	bh=GTFjRl6iHK5h09WUcL1AwDsmjjABzpqDmdXUp5e4kw8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=E/nhENiHQi1v0BaJSaPFS8qICmqtVkozsilgk6yU96p/S6J8zhHm1TKBik+eROkMA
	 Rh+YKky1z7TX1aMVIwm9ReYRI9yhzHuO7Xj4yShM9/o7S/2N9klnglwLbaUBraBzln
	 QrJFucw3xIuYGuAR68UQm1mARbaxgfmsmYjqZVx0/I9wUFMJUOmRS0SosOYbHKHcH7
	 txCDqLFIMN2j7d72pR099mnq0dY8EsmqJmhM02K0B4slU4QxuWaWTWRMo9rZzYmkfI
	 dEnfJ5F6wZfdDZW5CEhkMtUo4gUXzgQ/1Ot0x7xvroWOoNWadI5aBiIBT2Pv9GaQNH
	 V/3GhqCdhZJzw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127524

webkitgtk3 enables librice support by default, thus build fails.
Add a PACKAGECONFIG for librice to handle this but disable by
default to not change our dependencies. librice requires clang-native
to build bindgen.

todo: enable this PACKAGECONFIG by default?

- add missing 'flite' dependency
| -- The following Flite libraries were not found:
| --  flite (required)
| --  flite_usenglish (required)
| --  flite_cmu_grapheme_lang (required)
| --  flite_cmu_grapheme_lex (required)
| --  flite_cmu_indic_lang (required)
| --  flite_cmu_indic_lex (required)
| --  flite_cmulex (required)
| --  flite_cmu_time_awb (required)
| --  flite_cmu_us_awb (required)
| --  flite_cmu_us_kal16 (required)
| --  flite_cmu_us_kal (required)
| --  flite_cmu_us_rms (required)
| --  flite_cmu_us_slt (required)
| -- Could NOT find Flite (missing: Flite_INCLUDE_DIR Flite_LIBRARY) (Req=
uired is at least version "2.2")

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
index 4486450595..7daaf2583a 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
@@ -37,6 +37,7 @@ DEPENDS +=3D " \
           gperf-native \
           unifdef-native \
           cairo \
+          flite \
           harfbuzz \
           jpeg \
           atk \
@@ -87,7 +88,7 @@ PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENAB=
LE_WEB_RTC=3DOFF"
 PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON -DBWRAP_=
EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus=
-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy"
 PACKAGECONFIG[backtrace] =3D "-DUSE_LIBBACKTRACE=3DON,-DUSE_LIBBACKTRACE=
=3DOFF,libbacktrace"
 PACKAGECONFIG[sysprof-capture] =3D "-DUSE_SYSTEM_SYSPROF_CAPTURE=3DYES,-=
DUSE_SYSTEM_SYSPROF_CAPTURE=3DNO,sysprof"
-PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3DON,-DENABLE_SPEEC=
H_SYNTHESIS=3DOFF,flite"
+PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DYES,-DUSE_LIBRICE=3DNO,libri=
ce flite"
=20
 EXTRA_OECMAKE =3D " \
 	-DPORT=3DGTK \
--=20
2.54.0


