Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6B2C43217
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:03:41 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.2868.1667322218063514979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=lwzF8RPc;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H0WHcybRjJ16UeeDg/BKjd/DBefe7LYZtRzmWC9La3U=; b=lwzF8RPcwpQrrLtlKT8KQjrNjh
	/UInt+jwbB/q7ifzQABZK1zE12RplAwYAAUYTNiP5/XuSWu92T1r6w+UgBYtGnm4PQClJkjGOIidn
	lsQ9+GP3avVquzgpGvLhQITAUGo6HKIPNgOQQbCUx0GjUUBNnbRgkUD+gXF5uThVW7xpQNhof2mOv
	RqSKwXRwRZkwzdNQ2hxi8fJEQ2rYM+O4YKnoxegbUUZKWVJXAjx4ScieVTbzVTaVzYcnKgLIaVM82
	wjiC9ebZSj/TkezfCas6DYVlxvH+2mw9jdBkCH2F2XW4z/r0sV7S6srDBwpeLgzm/fTAsWb93mgKR
	fgT6Ln5g==;
Received: from lan.nucleusys.com ([92.247.61.126]:40108 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1opuhF-0005Qa-HL;
	Tue, 01 Nov 2022 19:03:37 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-zeroconf: Upgrade 0.39.2 -> 0.39.4
Date: Tue,  1 Nov 2022 19:03:25 +0200
Message-Id: <20221101170327.1911161-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 17:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99396

Upgrade to release 0.39.4:

- Fix IP changes being missed by ServiceInfo
- Fix port changes not being seen by ServiceInfo

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-zeroconf_0.39.2.bb => python3-zeroconf_0.39.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.39.2.bb => python3-zeroconf_0.39.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.39.4.bb
index 53642c630..8d6290e5a 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "629d2a0dd7a2b9af5bc5eb0c8402755e87a2d00f7015c72834fc0958ccda2835"
+SRC_URI[sha256sum] = "701e4d697f89fe952aa9c13a512ed6bf472dcf4f0a6d275e71085604b3882295"
 
 inherit pypi setuptools3
 
-- 
2.30.2


