Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A94C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 22:27:50 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.3988.1646260068355922181
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 14:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=tD2kbob0;
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
	bh=mq7cNvV4bGN8J7NLbBzgxMudBZEHdsAJsJdYbpVrnMI=; b=tD2kbob0Gmr4Z2wc9ft26ZGtLC
	QV4q1h0bKS4zV/WKny2TSVPF/iGsKw5fdp7OmysADW9jer5j08lb1J7tpzeWTLAdVGb4UGgXSFQ0j
	Ic8bySTq17IrHosX5J0olAd29cmV5RSwYgjWS4NWbrzHsAhNf0S4bN/VoqI5OxWzR/B9T52VGgoLZ
	5LzD9+PxvJYjlykB1HEziVIz35M5MsVfPXMbC6AhvdP2oXBmUYRAK2rTPlX1n5z++6KyLHCeobpFK
	qNjQ9FClcIb3mGZ5FIT7cCtdYxxAjTqG6bA/t/Q1+kAAbO1S1YhPUORew91gPlOWCF5EMET3LThfe
	NKcwuBSw==;
Received: from lan.nucleusys.com ([92.247.61.126]:32944 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nPXRr-000BsC-Jn; Thu, 03 Mar 2022 00:27:48 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-semantic-version: Upgrade 2.8.5 ->
 2.9.0
Date: Thu,  3 Mar 2022 00:27:34 +0200
Message-Id: <20220302222738.1047918-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 22:27:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95714

Upgrade to release 2.9.0:

- Add support for Django 3.1, 3.2, 4.0
- Add support for Python 3.7 / 3.8 / 3.9 / 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...antic-version_2.8.5.bb => python3-semantic-version_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-semantic-version_2.8.5.bb => python3-semantic-version_2.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb b/meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
rename to meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb
index b8541ff57..ee635871b 100644
--- a/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
 
-SRC_URI[sha256sum] = "d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54"
+SRC_URI[sha256sum] = "abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b59dcf214006a12b2"
 
 PYPI_PACKAGE = "semantic_version"
 inherit pypi setuptools3
-- 
2.30.2


