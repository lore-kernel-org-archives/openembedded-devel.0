Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBE1C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:16:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.191024.1673939808356550912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JQ0V2c8w;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939806; i=@fujitsu.com;
	bh=/urQlbAw3efDsetHAqi1Rj4NW4FLILxCvIrLc5ripHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JQ0V2c8wnji6iCF+N04z6c5m0ajVYVhPktaOaIWNok9xhtnCLSOQrzYh9D6GrGjM+
	 OVdvptqBq5pgbmxpb6N2dpIv3nSQ1Oi+Fbk735/6hDt7ucic2qGe9wyrkduzaI+pER
	 UGa9sIXmM7p1EhC4EzZKsq95dawTXAeXMZgO5Wx7pqOqW1MRi1jLHubMVLIlNs2bKm
	 H9bpFqVga7QbWghhg1Rby5M8g3MdaE+LKW5LMMmy8HAreMEpxUfXzMOMjbFS4ek5Fa
	 ME3Hz/m4HGPLkXEsLe5m9Tai7LI3d/tw6UHApgUMTiCzuXyP9gFDXdNxv/gnF+qPrO
	 Ub/C5DX/Yb2XQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqBvnfSz
  ZYPV3douLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPq5SOsBS94K779uM/WwLiKp4uRi0NI4Amj
  xImTy9kgnBtMEpsazrJ2MXICOXsZJa4u1wCx2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhZwlljYfQTMZhFQldj9/AFTFyMHB6+Ak8TaQ4IgYQkBBYkpD98zg4Q5gcrb3ppBbHKSeD
  KtD2wrr4CgxMmZT1ggpktIHHzxghmiVVFi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRtPi1KKy1CJdS72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwU
  vbzUkk2MwLBNKVZX3cF4btkfvUOMkhxMSqK8J02PJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  D3lBZQTLEpNT61Iy8wBxhBMWoKDR0mEN9wSKM1bXJCYW5yZDpE6xagoJc4bCdInAJLIKM2Da4
  PF7SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxPPICm8GTmlcBNfwW0mAlosUfJUZDFJYk
  IKakGpqVTfjKZSmyfq7fpuIHSFanXVVsbfG1iP30MMcm5sShThq1ob0aNcLIGx8aKi9vPLPhV
  2VzcIroqi+2S2qJHM113LjDjXDF7u/TBigbxO0wqjYpStyVd6s5c+27MIRueyPjs6iHT5UcXb
  DWJNt1+/qHVZfPDcyyc1wSv1V7Wkd2f92zKkyK/gD9eqsetluyTWpPNV7tTyPCaos3TLSfdOY
  49L2g5wLG1SM+Of9LmAiutB3du3LHdt+j7l/iTAvHCrLr7Jsnb7t7+JT/70xWJRJ7PaqtXxe5
  IkbwcwNY7+/b7Xb0am5m++cg2J+dXbPhvmPVwTsi5HZ736/iW/N2//ODjxerBl/Z8cQ9SWjaL
  m0uJpTgj0VCLuag4EQDWCwlbVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1673939805!404023!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3714 invoked from network); 17 Jan 2023 07:16:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:16:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D0F80100194
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:16:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C43FB100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:16:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:16:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libnma: upgrade 1.10.4 -> 1.10.6
Date: Tue, 17 Jan 2023 15:16:22 +0800
Message-ID: <1673939785-20072-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
References: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100600

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix the path and translation domains of GSchema files.
* Removed strings that don't match our conscious language standards from
  the translation files.
* Added autoptr support.
* Fix translations of country and territory names in the mobile broadband
  dialog.
* Honor explicitly set APN if provider was not present in the mobile
  broadband dialog.
* Make sure Kosovar operators are ordered properly in the mobile broadband
  dialog.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnma/{libnma_1.10.4.bb => libnma_1.10.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/libnma/{libnma_1.10.4.bb => libnma_1.10.6.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
rename to meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
index 6adb7ec29..bff9a3360 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
@@ -10,7 +10,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)} opengl"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "79e730dda19f9b34886f4064aa170f1a2326b08329d655d80b67e906c7f78b7c"
+SRC_URI[archive.sha256sum] = "53a6fb2b190ad37c5986caed3e98bede7c3c602399ee4f93c8fc054303d76dab"
 
 PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
 PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
-- 
2.25.1


