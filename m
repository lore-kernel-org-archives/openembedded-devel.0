Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C1AC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 10:48:40 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.61073.1672742919715140602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 02:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=p9YTVh+B;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gxmAHtrrt/mc0BFsIYF3ZJHJJKWY5Hx2J8zTQxzsegk=; b=p9YTVh+BBaiHs9ktXX2BUFVJJi
	wq0aBdP5GeZLwWBT6OTQkDGS0DIbKaKZ0Xa4p4rkfu6Kjfbdd2uyWm42ZyZef+T3J0yV5daDOE2av
	lKFaTiCuXLefqLMzdGSZ0Kr5Gr/leM6TT+8lAUidjGgsaSJwSBPWapohYRlvoeqxuKhrRby358roU
	msJKmxFePDjpsxMcqNt79SsG7Zdyumt0/DDJZBqHrlD45Zdfbhh3djg2gB3P7Wwvk22yvrm/Gf6ET
	I3Uy+zUSSKtU0X8zWF2WrUN06GY6/DyttpVpNra7I6mQ60jUz4stSg39GQNwEN3ThqFUatErdwB5e
	KJ6lasYA==;
Received: from lan.nucleusys.com ([92.247.61.126]:60722 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pCer6-0009mZ-2J;
	Tue, 03 Jan 2023 12:48:37 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-watchdog: Upgrade 2.2.0 -> 2.2.1
Date: Tue,  3 Jan 2023 12:48:25 +0200
Message-Id: <20230103104827.1211241-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 10:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100361

Upgrade to release 2.2.1:

- Enable mypy to discover type hints as specified in PEP 561
- [ci] Set the expected Python version when building release files
- [ci] Update actions versions in use
- [watchmedo] [regression] Fix usage of missing signal.SIGHUP
  attribute on non-Unix OSes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.2.0.bb => python3-watchdog_2.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.2.0.bb => python3-watchdog_2.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
index 12adaf9f7..b76c6de0e 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01"
+SRC_URI[sha256sum] = "cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f"
 
 inherit pypi setuptools3
 
-- 
2.30.2


