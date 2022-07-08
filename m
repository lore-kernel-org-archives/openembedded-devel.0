Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA922C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:20:15 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7332.1657286405426516661
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=ozWboH1/;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fNZwrgEF0AMa4mg7lziaYQaJZiGti6brrjLOwg+uRN8=; b=ozWboH1/9//66YPGTZJIX+v7jU
	3jfhadibnBuDUvJyBBnKHzITo9jL1xH5FjpflOJEh3jKwIdT2Jw57p7SEhRPEfZwNdqlGBzXacBDC
	OtIBD0AtWYj6jrh3ur1ELk15Ypm4P41VnL4fcBSwzL70Md6v+Adi6k19fQ6C62BQ/5lj/mcCsLTpF
	/ocWxl8ShoWTXToJZM4EZdjjD8GNoGoU0qpJYQ/Kez4VC1SkvanmvkFIMZmqfMEtu+kgSVdL2hrHF
	Y1UQ9P3uZiJAcZK4QgeJPmlxQvkEIOUGUEePnfOdi5avxhc8iVV/k72bInHeLy+VJ8UnFHSIuQh1B
	RNhXo1sQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:50708 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9nv3-00083b-51;
	Fri, 08 Jul 2022 16:20:04 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-unidiff: Upgrade 0.7.3 -> 0.7.4
Date: Fri,  8 Jul 2022 16:19:49 +0300
Message-Id: <20220708131949.48129-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708131949.48129-1-leon.anavi@konsulko.com>
References: <20220708131949.48129-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 13:20:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97789

Upgrade to release 0.7.4:

- Fixed git diff parsing issues (filename with spaces, only one
  added/deleted file).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-unidiff_0.7.3.bb => python3-unidiff_0.7.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.7.3.bb => python3-unidiff_0.7.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.3.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.7.3.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.7.4.bb
index dd5b0c3eb..3f6d2850f 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[sha256sum] = "d5f2e53a9a00db3224a8c36349b5380e0e22d1aec6c694b14fb9483ee93c6205"
+SRC_URI[sha256sum] = "2bbcbc986e1fb97f04b1d7b864aa6002ab02f4d8a996bf03aa6e5a81447d1fc5"
 
 inherit pypi setuptools3 ptest
 
-- 
2.30.2


