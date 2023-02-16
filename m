Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B5C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:33:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.5661.1676536424774858049
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ip5oj9Qh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536423; i=@fujitsu.com;
	bh=mXAD5yQAyjYfP8ao4Xg15qu78yVDHiab/JLBf7NP+WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ip5oj9QhdabeGAnIw2keOhGhlboO0UotmeDSzo2kgOUi7QJ1TKG7t3nomGm3zUFQN
	 PHAcY5l+DXMIbysYCsWt7Al65v/fOWryQmS4QZ3In4/EAx0Zw0fcRgZnQNM1qcAa1K
	 iTCQKDTONSaxbCSUwfAEeyq+GIf62JApFfqoWx8dj0c+whvglR/ysCuzvajGOlTS09
	 tHDO6phBVuNjRzm0uzM1ARgmA4atm0ZyeRxmocZRNrFad3lgzJoPrNQHIIZbXIIGcX
	 Nnj+77zI4AtDVLCIMUTXWoc7bCK7UqrqBM0s4trAQC37swNYUqn5oOfRocQ86SbIS5
	 3guPGNBBq8BLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpJv26m2
  ywcEDahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bDqy9ZCxYKVez8t5u1gfEDfxcjF4eQwENG
  iVuLHrJDOFeZJG6/74Ry9jJK/H69g7mLkZODTUBK4sb9/2wgtoiAvsTS2XvA4swCKhIvfvewg
  9jCAvYS9z6eAKthEVCV+LzsChOIzSvgJLF59z5WEFtCQEFiysP3YL2cAs4S2zasYOli5ABa5i
  Qx/U00RLmgxMmZT1ggxktIHHzxghmiVVFi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRrPi1KKy1CJdQ0u9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OSc
  FL281JJNjMDgTSlmPb6DcVbfX71DjJIcTEqivMW6b5OF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fBueAaUEyxKTU+tSMvMAUYSTFqCg0dJhFfwClCat7ggMbc4Mx0idYpRl+PqlSt7mYVY8vLzUq
  XEeZe+ACoSACnKKM2DGwGL6kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmjQabwZOaVwG1
  6BXQEE9ARC5jBjihJREhJNTAxCm65rLRt8Zfrf0UfOQVe+/LhycPYjpP1y9jF10WbHfrn0+L3
  v9xKTGqqbvqS8JOeuqu5lOIzd5jxS+6Sil4aEXeyn3Nlcsujs6+26Sft4Ej4fWpBPAPb20PGe
  jmLQ34afEiNufzk9fq2d8X+83La1h3bteb827PbZl5mcVi8XX/b448FPO97Lmgsz1Fd26Y9s+
  L95PsP4vTUg8oLtYw3LmlTO2qrqjtZuDzELHPJcnsV7lLHB++D43bxdL7V2vgq6YKggJYd32a
  tnR2X3Pfk3GphnLmFR8OzVd4go+Lx4j/P+2ZEC6bd/e0Zsi7/rFzm7GXs9fP+Jk6YLut91k4/
  LlpO4sXp2+e6X2iuMGJVYinOSDTUYi4qTgQAziS4b2UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1676536422!90953!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24630 invoked from network); 16 Feb 2023 08:33:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:33:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3E3F01B6
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 320D21B5
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:33:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] geoclue: upgrade 2.6.0 -> 2.7.0
Date: Thu, 16 Feb 2023 16:33:21 +0800
Message-ID: <1676536403-14449-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
References: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101092

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Multiple config files named *.conf are now read from the config directory at @sysconfdir@/geoclue/conf.d,
- HTTP requests are now made via libsoup3.0 instead of libsoup2.4,
- A static location can now be set in @sysconfdir@/geolocation for immobile systems,
- Web source requests are now submitted with combined WiFi and 3GPP tower data,
- Web source now checks connectivity in a way that allows location and submission servers running on localhost,
- Web source submissions are now made using /v2/geosubmit API,
- Web source cell tower submissions now have the correct radio type,
- Web source requests now submit the BSS age property,
- Web source submissions now contain the location speed,
- Web source cache now respects WiFi signal tolerance strictly,
- NMEA source now supports both '\n' and '\r' NMEA delimiters,
- NMEA source can now be made the Web source submit source,
- ModemManager now use signaled calls to get cached location information to avoid performing explicit modem query,
- Location description now contains information about its source,
- GSettings backend no longer complains about being run from a read-only filesystem,
- Many small improvements and fixes, some memory safety related.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../geoclue/{geoclue_2.6.0.bb => geoclue_2.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.6.0.bb => geoclue_2.7.0.bb} (97%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
similarity index 97%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
index 798a9c16b..f7039b591 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
 
-SRCREV = "becfa5837cfafa064219a5ab2c2a4eaf35b24c0b"
+SRCREV = "bbfb6289dedb88cb8155d9f6868787d5432e1f90"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;nobranch=1"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


