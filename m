Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BABCCCA483
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:13:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.37568.1658211224149122882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TmSllbjI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211222; i=@fujitsu.com;
	bh=3G0DtQYnfn2+AMQFI365pW9O8SVRDzMjZULhc5pHBQs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TmSllbjIlqrZMcb0kkeJzZ3SHFU6qBiyayjSR+nDPF9cGPGbwHoZL+ZrkMa5C3vTq
	 hyt0emk5WhF7mXPDHYlPr2FcWhocwyH6fStPHjeblphFaGqBmi1ByfIHnGOkPos1AV
	 KRxLNodI9EcMntsee5bQDxkAygky5cuR30oZepM8/KbMbWHqTT1aIqPv8AlE/ztIxK
	 asKdmVSsKsJuISOSUxQ3S98JOHVU0DtN1W3d4n+ThkE80o4GuSG47C+6XoXnDo7mfk
	 /2J1oiOfuy8bL1SdMj7zqAHRtL4z5h9X8YJt4o3f3947yMt3NJ9Fy1M9zItbG6k6V+
	 8fbt3X/+LVDYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8OxWXea97U
  kg1O3hSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owTa/6yFdzhqNjdlNTA+JO9i5GLQ0jgIaNE
  /559TBDOZSaJUwfbmCGcPYwSC++dAMpwcrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CrR1dEBZrMIqEq8O9DICGLzCjhK7O9rBotLCChITHn4HqyXU8BJon3ad7AaIaCaB6/uMU
  PUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZszYxgZhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJ1UlJmeUZKbmJmja2hgoGtoaKprbKRraGSml1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmb
  nJOil5dasokRGMYpxQp1Oxivrfypd4hRkoNJSZR3qua1JCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvBc8gXKCRanpqRVpmTnAmIJJS3DwKInwpjkDpXmLCxJzizPTIVKnGC05ps7+t5+ZYzmYnP
  m17QCzEEtefl6qlDhvoRdQgwBIQ0ZpHtw4WNxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
  MywAyhSczrwRu6yugg5iADprkdAXkoJJEhJRUA1OL+8bPPCncEyccUlRdfWc/f8zutUsyBSab
  vmoreuDitHvuk1Zp8f9dyy95OljaTv+9Y86c5f++nHpylyPR6vqulyFTn4qmTWOeW8ubdP3J9
  V47kR9e+V5PjzRsscvPf1HM8LnA9NwrsVd7HCYyL9c7Usa0itW95OK10jmHbkTyB5675Pysuq
  JO38PgeFfMwWUnrOs8uE6lPJD0fCFVIna0UtTnZbtbDcc35V1b5fnn9mZcTryfrPk9xqtg4n3
  H63sEc/Z2OK7UK7s3eb/N4y1HGWNOfm28saO2KfSzT/q+vrNOcacmeM77kLEz9pwzg5FTm7L+
  sTu7env9l2wQvVnw8wd7sPs0temVAi9y1v9XYinOSDTUYi4qTgQANfMItHYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-548.messagelabs.com!1658211222!26256!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10473 invoked from network); 19 Jul 2022 06:13:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:13:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 082A4142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:42 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EFB5B7C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:13:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libgsf: upgrade 1.14.49 -> 1.14.50
Date: Tue, 19 Jul 2022 14:13:19 +0800
Message-ID: <1658211200-2891-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
References: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97889

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgsf/{libgsf_1.14.49.bb => libgsf_1.14.50.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.49.bb => libgsf_1.14.50.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
index f663141bd5..d2486a0352 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
@@ -9,7 +9,7 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
 
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "e9ebe36688f010c9e6e40c8903f3732948deb8aca032578d07d0751bd82cf857"
+SRC_URI[archive.sha256sum] = "6e6c20d0778339069d583c0d63759d297e817ea10d0d897ebbe965f16e2e8e52"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.25.1


