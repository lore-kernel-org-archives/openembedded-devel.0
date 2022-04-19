Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001B8C47086
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.4018.1650374046992126415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 06:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=RU+o1+OF;
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
	bh=SiQ+sK0uZIg6jD3gZODkeyd8kyTXTVOT4nGPm7equdk=; b=RU+o1+OFfvOSxdgpJEO/tpGRvc
	ZlUHSjRhF7qDR41y4G4MDda0YlQH+eC7fOe4ik7mb4HdKuIMZPBi9taIZRAbttJth97QsTOMlHE9Y
	HavNJLJytp3amrtZZYf7bTjovEgMaZLGQVRfDATnBDPZ1Q+7die3y6/c+/Fsw3JHHP3xqe2/U9Zmx
	CHZ0jgmGrG/JFfUdqqPh7zF6m0Et0/o/eKcwujcJaSp+toS/jqftS7LfIS4VLm7oIvlkMJ1KMAMps
	qsv99kqEwtVNbiF87uh8UcyG1qDOoD96bt+xJK1CHDt0wZo0ISI/CSiC9zpk82RM9KwLmrc7tmQog
	h0XeagJg==;
Received: from lan.nucleusys.com ([92.247.61.126]:53650 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ngnh3-0001vU-3s; Tue, 19 Apr 2022 16:14:05 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-bitstruct: Upgrade 8.13.0 -> 8.14.0
Date: Tue, 19 Apr 2022 16:13:53 +0300
Message-Id: <20220419131354.2593158-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
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
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96692

Upgrade to release 8.14.0:
- C implementation: allow partial decoding of truncated data
- Python implementation: allow partial decoding of truncated data
- fix segmentation faults on CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-bitstruct_8.13.0.bb => python3-bitstruct_8.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.13.0.bb => python3-bitstruct_8.14.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.13.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.14.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.13.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.14.0.bb
index 954c9ab46..f0aa32123 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "7b87d9e41ff552a8cae06ea2368c3772b6f3102bdab4b65e793be7590d69f03b"
+SRC_URI[sha256sum] = "230c191c75f1526f6922cdb08eab6f52c055452e2239bf5638f02e9cfd382c91"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.30.2


