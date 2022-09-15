Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AECBC6FA8B
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:33:14 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.10953.1663252386862942688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=GVacZZmF;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OSp57injp4W3nhq4M7TYPFeSLp2fP0oy61Hfo0MKt0M=; b=GVacZZmF2BX1Y0lMOQ5SUqXAg5
	G3P+m9l5iYfvrZJTLorhv2DbdRWIg+SiGaNfJH04Fq1xJ+MYLPRsKp8MVfARCaBUE8GlTA+wJQhWG
	AGRJGLYfnxElVGsEQ8e62Xs6Oj873xz/xdAYgiFR75L94m/bIjrQ0FqFrs5rjGovTouWCNlek/BbN
	NFh8GrHPqxYs3hmG6wcQY62cWReavUu3DEIiGZ6BylTxuBdgLOHSabyPFPSvU5aEI4Rj2sNha5qoc
	LpKn33LOxjzKwCqcrm+FZ8uGDGXUgtFrFug+2CiZpDJ3zPk1n9LWFm5O5aDFnXnE64wXBZxEWrZEu
	9lEerBqw==;
Received: from lan.nucleusys.com ([92.247.61.126]:44644 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYpvP-00022M-M1;
	Thu, 15 Sep 2022 17:33:05 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-soupsieve: Upgrade 2.3.1 ->
 2.3.2.post1
Date: Thu, 15 Sep 2022 17:32:54 +0300
Message-Id: <20220915143255.258714-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 14:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98821

Upgrade to release 2.3.2.post1:

- FIX: Documentation for installation from source is outdated.
- FIX: Fix some typos in error messages.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-soupsieve_2.3.1.bb => python3-soupsieve_2.3.2.post1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.3.1.bb => python3-soupsieve_2.3.2.post1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.2.post1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.3.2.post1.bb
index 7cb76b426..99b6f7c04 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.2.post1.bb
@@ -2,11 +2,11 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
 HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c7a2acf04248c0d02dac4c82ee8a7f56"
 
-SRC_URI[sha256sum] = "b8d49b1cd4f037c7082a9683dfa1801aa2597fb11c3a1155b7a5b94829b4f1f9"
+SRC_URI[sha256sum] = "fc53893b3da2c33de295667a0e19f078c14bf86544af307354de5fcf12a3f30d"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_hatchling python_setuptools_build_meta ptest
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.30.2


