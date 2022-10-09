Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F847C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:34:36 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.9572.1665275668740343359
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pYx+NSGu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275666; i=@fujitsu.com;
	bh=+eggcwD8w7DbawX2T7g20DaeqCL3a4JCHtFGFjiwp88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pYx+NSGuC1youfg7RuUKq9dn6e3zBVlPCchvEGpo0ODDA/2m10K7f3OptejjJGzHe
	 JALviWrS1QNKRvM4AWcwGOk+J3dtVb0JggaYo2kJqttC+ClL1y+V8qZt8h+YYU89Wb
	 TVWDOPA3kPxgug045CvFbeo+vUkMF805IOlse2ZN3GI6nPX3MS6uUn1k67iMM67mfa
	 yygUVHL2ewlK5T9KXZkJteuWr485JRVJQQHGxd+b/aKhKZtLWlD+jUIO8jNjx41cbr
	 nxomv4IElJkuEfQr8pHZf7T2luLXXys1kyCeKR/SDkITNlQV+3yib+PT0ANWXFTPTm
	 S877fWBvx0FTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqCso7pR
  ssKbXxOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfjfdZG14ABHxaSF99kaGD+wdzFycQgJPGGU
  aFt6jBnCuc4kcePJRChnN6NEX+9Spi5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4BG
  sXBISzgLtE2OQUkzAIU7jl5mQXE5hVwkvj6cQU7iC0hoCAx5eF7sFZOAWeJzqfTGEFahYBqfi
  /3hygXlDg58wkLxHQJiYMvXjBDtCpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVom1SUmZ5RkpuYmaNraGCga2hoCqSNdA1NjfUSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECAzmlOG3mDsYt+37pHWKU5GBSEuV9utUhWYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IErxO7U7KQYFFqempFWmYOMKpg0hIcPEoivGH/HJOFeIsLEnOLM9MhUqcYFaXEeWOFgf
  oEQBIZpXlwbbBIvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPeDANAUnsy8Erjpr4AWMwE
  ttnpoB7K4JBEhJdXAtHbneyfm9Rv1/+6qSj02a3PGFUtehaKHC1gnPnE6z8K9oMP87MKW0yq2
  /T/+rJy6yP7FwkOOs7L+NDXfPPmqXnPd5t/7wpgKeKU4Gqyb7X5f9LVIKHmVkit8ZcWaZnHdz
  3YOotePPFi8pFdfcX6q7a7fbzkKrj9xWBh518GjK/m9Tmah3OP5py2Tp9Z+OzOV5eZh/acXp6
  m8edDxNLPY5nj3U6+vgv92nb/btqSIV9BUrWt1WVaffbnEp60ndqox1tkrVSUa8fO1cp/5Z7T
  koZq35aWsB6mzJSSjvu79VlN0reu/tbGD6PabK91XZ3EVTLPiUxDc6juhdMpvMSPXV3eS43/U
  XdT59/DocqeKECWW4oxEQy3mouJEALTWSotfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-732.messagelabs.com!1665275665!180535!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20063 invoked from network); 9 Oct 2022 00:34:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:34:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 49EBF100197
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:34:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3E10A100043
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:34:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:34:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.34 -> 1.35
Date: Sun, 9 Oct 2022 08:33:25 +0800
Message-ID: <1665275606-29112-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
References: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:34:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99102

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.34.bb => libnet-dns-perl_1.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.34.bb => libnet-dns-perl_1.35.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.34.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.35.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.34.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.35.bb
index 69afe6eef2..5df586da1c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.34.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.35.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "de756e3fb6addbd32beafc869c4dd1c6a0b3783c5ef56dbefc6809443a4b1d15"
+SRC_URI[sha256sum] = "f1a1478e4acbdb6b96de63070b35050dec9b9fce6c95bb2215bfc64a2d98e167"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


