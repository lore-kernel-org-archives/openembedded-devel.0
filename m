Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A29C4332F
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 10:28:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.7030.1637317675480737840
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=KF7QMw3K;
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
	bh=qPytkhVkqhefme0FK/3ug086wQWtaBP0IubrSw8ZvHs=; b=KF7QMw3K2tPtA3goROwnl2Vjf1
	kF6lsFQXoTFEFhGBZigtzSyhUG3LFDZ+s0Rkjqf19RwDByA3kaSw1ypyfy/cTX30Xg1B8vP8qxuCC
	MddkU+hiY57oIHlGa9K+EAzfpF6owVPPHXlyX3okSwwk3lEnGJ4QIQBnO2Ey6mfKhCf/TH4qJPpP2
	ROXNm5KspKUmRxXqv6dhSIKCVa2n9yHaz6RmI0cU1I2C9ZDFMRVlc8VEWtlqvlXgyEBCUnpZDnP/+
	YWuPORRayG+1i0Pb9MlKfCB0yrbm0snwYVCWMLT74dgllg55/Urgn+Qi56yi38G1fSXTtYBC1M/gz
	BVQOsoQg==;
Received: from lan.nucleusys.com ([92.247.61.126]:34090
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnzFV-0008o5-BQ; Fri, 19 Nov 2021 12:27:53 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cmd2: Upgrade 2.3.0 -> 2.3.1
Date: Fri, 19 Nov 2021 12:27:38 +0200
Message-Id: <20211119102740.2676-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211119102740.2676-1-leon.anavi@konsulko.com>
References: <20211119102740.2676-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 10:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94059

Upgrade to release 2.3.1:

- Fixed issue introduced in 2.3.0 with AlternatingTable,
  BorderedTable, and SimpleTable that caused header alignment
  settings to be overridden by data alignment settings.
- CompletionItems now saves the original object from which it
  creates a string.
- Using CompletionItems as argparse choices is fully supported.
  cmd2 patched argparse to compare input to the original value
  instead of the CompletionItems instance.
- ArgparseCompleter now does the following if a list of
  CompletionItems was created with numerical types:
  * Sorts completion hints numerically
  * Right-aligns the left-most column in completion hint table

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.3.0.bb => python3-cmd2_2.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.3.0.bb => python3-cmd2_2.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.3.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.3.1.bb
index 0cc8e9ce5..8167d2050 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c527bcb481233ebcb803de975f42701"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "2493ab8e5baab3d1a0325ea50920674a63de41bee4c63a634ac5cb42bfd63c1b"
+SRC_URI[sha256sum] = "44f9d93bbcd90c6dda70e73db722d6b27b551d98bef28bd82fd14ccbe88d18ea"
 
 inherit pypi setuptools3
 
-- 
2.20.1


