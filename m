Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25F2C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:27:30 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.10000.1672914443302621418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 02:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Wy1kS5Cs;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xWGUCecNeqX2Rp1mEcpZs9lKaRkn90Jqr08f4kpic8Y=; b=Wy1kS5CsH58R8ALOJce/SDaglb
	GTXkKjdURsOfwO9rx2KhCkqedBhRvfQekc0AvNN6belnjVxd5/6mn65ztgAnoRSVeXPg5VNBLb17y
	NKWBque6OBUXbQbUGr9VI7g6t8Uzdk1odcJDLYRS3Vac8fnRs5op7iL/YbMT2A20xHeNJXHGlYM05
	etTkc0lJCNDH+ia/XiwEPwYc0j4+GSjuuS4/6+nlaMe7uYWphOFHeOCvgqX000DChlspaFOvysxkz
	/c58lo3mtpTDsUJXMheZdqZimoD6qN894BGXTDwbulhJauRc2LCwY0MZfcn2TUFK1XeYjNIxhTBKz
	7pM2JdDw==;
Received: from lan.nucleusys.com ([92.247.61.126]:57110 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pDNTk-000BqI-QA;
	Thu, 05 Jan 2023 12:27:22 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-marshmallow: Upgrade 3.18.0 -> 3.19.0
Date: Thu,  5 Jan 2023 12:27:09 +0200
Message-Id: <20230105102710.166099-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230105102710.166099-1-leon.anavi@konsulko.com>
References: <20230105102710.166099-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 10:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100411

Upgrade to release 3.19.0:

- Add timestamp and timestamp_ms formats to fields.DateTime

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-marshmallow_3.18.0.bb => python3-marshmallow_3.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.18.0.bb => python3-marshmallow_3.19.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.18.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.18.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
index c52ff30fd..91f6462b3 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "2805f32461fc7801a5f7b6d83facf7cbb8bca278"
+SRCREV = "78edf5582ee325bba99f097cb7167ef73b6f84d8"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


