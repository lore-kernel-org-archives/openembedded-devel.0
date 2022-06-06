Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0CECCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:25:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.31184.1654518316233525809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Cc4VJe/B;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518314; i=@fujitsu.com;
	bh=3bgIJ7ekoZD245N5eNHzMSi7QuoGr1VYsRZfNOt114o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Cc4VJe/BEk1jWaDkuRc9Iljzi4G+rr86tEIyc7M88CjtpZtrIfKzdaZEZS9DMyA4w
	 vhvMTwFe31DlcZpD793Re7gsQYGn2SjmxK31+ooDSRlVOtsDqMSQt6N2GqkWJ4b/SJ
	 1ZumV8uadLTMIeFSLDcOTnSx1jeN3EMihH0iNl9i8oqepNuoihcHhNNhDQk2WP3DPm
	 CR1wb90ZpNCQyhjw6mZOEXBPCcm2CvDVa+sKfvKoG0nYEr84cnFIDXFKhpBfJLsK/I
	 A8hEGXhLWFwtcZp2W2ZlnxctfVviCSGLhs8NlYPSw37eIYUv88Jw+4HQXmqxj66/ow
	 1eC9gC1uViFEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSVfr09w
  kg44ZfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a/5+sZC95zVDRdW8XawNjO0cXIxSEk8IRR
  Yu+yc4wQzgUmiTcPdzJBOLsZJT4ufQWU4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBO4se/2WA2C1B88YSdbCA2r4CjxNrFJ1lAbAkBBYkpD9+D9XIKOEl8b70LViMEVLP18T
  p2iHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNUHMqJGbM2MYGYatJXD23iXkCo+AsJO2zkLQvYGR
  axWiVVJSZnlGSm5iZo2toYKBraGiqa6hrZGiul1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmb
  nJOil5dasokRGMYpxYw3dzC29v3UO8QoycGkJMprf21ukhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3roPQDnBotT01Iq0zBxgTMGkJTh4lER4rd8BpXmLCxJzizPTIVKnGBWlxHmPg/QJgCQySv
  Pg2mBxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8DkCk8mXklcNNfAS1mAlrs82AOyOK
  SRISUVAOTufnMXJmk4gOh3qVNLQbRjJEN5vlFdzcGa3m9+bQ0aI+z0JG701gvmk191dh9hjNr
  Uf6i12I/tis8Kyo1dHqhGMK8wSF89lKmvBr+ap8nB48rvfBfoSn51XfRh/167mVyk8+KnSwOK
  9lS+T7V48xJ6w3NGdOlf/Na3FR2LUwuq9ZlDP6w9K5n8M117umPPpWV5t0/sW3pp52d7hfFfL
  aHRFVVb+XpvfV0zyp21Rfnz338kZ3477beC+5TzlXBPn2pJ1Nama9lhLBuq3EK49/yarXR8m8
  N5vFqK/x7Qw9ylhQV+fSuC5hxzinVr7tkZvjEjEz9+fdf//EX5GRLrIj9piOTOPFiuGGAcGLO
  byWW4oxEQy3mouJEALNLPOheAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1654518313!414997!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3906 invoked from network); 6 Jun 2022 12:25:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:25:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BAA501009B8
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:25:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A16211009B2
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:25:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:24:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.0.4 -> 6.0.5
Date: Mon, 6 Jun 2022 20:24:40 +0800
Message-ID: <1654518280-9166-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518280-9166-1-git-send-email-wangmy@fujitsu.com>
References: <1654518280-9166-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97427

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.0.4.bb => zabbix_6.0.5.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.0.4.bb => zabbix_6.0.5.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.4.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.5.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.0.4.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.0.5.bb
index 583ebac0a..2deaea268 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.4.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.5.bb
@@ -28,8 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.0/${BPN}-${PV}.tar.gz
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "a4f60d529c18c1332354bddd402b561b"
-SRC_URI[sha256sum] = "5743b6cc2e29d9bd242aa88b2835f3ded0be177509000d84db74e1159c5afa75"
+SRC_URI[sha256sum] = "3eeb7063efc5dad56f84dfdcf9aeb781044be712e11e83f66d043da55f33bdc2"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1


