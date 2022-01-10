Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0F1C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 19:38:36 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.37081.1641843515345224687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=cONYuyrg;
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
	bh=npxdBJ6RylV1JGMd963mwOafL3eI86RTQn6WW+glm+8=; b=cONYuyrgFBkBKFBCnaKdrcgSQq
	BB1LFR2fLcf8QDuThlfaj3Cp6XlcIulRegnmmFwwJBDQXouJmVzkBSJqDV/YCkrkCgCN3YGiow/Jy
	jfv6ZjUHcrhAQQ0tdcWLUYTUIr3EyTQGxNfLt6dqxwH2+8qQxnJ/mytzxi+WR5/GGD08uvJtBKeMa
	AhCApXBvEvXU3Kfm+FolpNna1mJGRfmG4JMQ5BKOU7WvdPtMucbXcasAyQ9Gw/bY6DoM3kIuW8JbX
	rKFXWQeiecha6HlQEn72NiGhhy4Yky3IsCuRSNjcdlY9fFfJSL+Nc//kBc5ThN8By4g1M/1qNKPNv
	8P/S9r7A==;
Received: from lan.nucleusys.com ([92.247.61.126]:51302 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n70Wl-0009id-Rz; Mon, 10 Jan 2022 21:38:36 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-rdflib: Upgrade 6.0.2 -> 6.1.1
Date: Mon, 10 Jan 2022 21:38:14 +0200
Message-Id: <20220110193815.103592-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110193815.103592-1-leon.anavi@konsulko.com>
References: <20220110193815.103592-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 19:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94723

Upgrade to release 6.1.1:

- add support for Python 3.10
- updates the test suite to pytest (from nose)
- tidies up a lot of continuous integration
- gets more tests tested, not skipped
- implements lots of mypy tests
- updates several parsers and serializers
- supports the new HexTuples format!
- many bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rdflib_6.0.2.bb => python3-rdflib_6.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.0.2.bb => python3-rdflib_6.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.0.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.0.2.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.1.1.bb
index 49e6d33ab..27f65dced 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.1.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6cde159c801514e0e45a40cf0a9d3d9"
 
-SRC_URI[sha256sum] = "6136ae056001474ee2aff5fc5b956e62a11c3a9c66bb0f3d9c0aaa5fbb56854e"
+SRC_URI[sha256sum] = "8dbfa0af2990b98471dacbc936d6494c997ede92fd8ed693fb84ee700ef6f754"
 
 inherit pypi setuptools3
 
-- 
2.30.2


