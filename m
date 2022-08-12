Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E17C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:24:16 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.10485.1660310654704401772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=TpknHRpu;
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
	bh=bq6NXCmc8AfThff4DgXqcXi/zRUDnVLZGtSVd5euAjY=; b=TpknHRpuIcqXCzLlVpjOFPVwIU
	D7lArpqo09IZ8Nmgaj1qWenSphDOTUXIG7RhEiEYS4Tmz7ByAj1w0D3g/R06Lw3UmuMuimwvnCsrE
	07BWP0YzFk13RT+YsqSlFbXHD8B9NbSoYx9GX0x1g1RI77aMUBfuwG8nJBcTGKHfIWax1PLXKV12g
	2J7sxp0Y8DA7YKevIjVTuGA8mSNKVnM7AIaiqEKigPQwnTYl2tj0bZ1ok3sc5vdQoJU6RhSnwxxTb
	DbwUpGt3ISg9aARpAQWhWBZmQaTURWRMlCK7pdBRhM+DhrWBneuI/laOj5xl2+L1D3AdOSnjNk53y
	Et/SqGIg==;
Received: from lan.nucleusys.com ([92.247.61.126]:37172 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oMUfH-000B58-R2;
	Fri, 12 Aug 2022 16:24:14 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-networkx: Upgrade 2.8.4 -> 2.8.5
Date: Fri, 12 Aug 2022 16:23:54 +0300
Message-Id: <20220812132354.1588599-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220812132354.1588599-1-leon.anavi@konsulko.com>
References: <20220812132354.1588599-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 13:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98216

Upgrade to release 2.8.5:

- Check that nodes have "pos" attribute in geometric_edges
- Correct louvain formula, solve infinite loops
- Add more comprehensive tests for pydot
- Move factory attributes to the class instead of instance
- make lazy_import private and remove its internal use

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.8.4.bb => python3-networkx_2.8.5.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.8.4.bb => python3-networkx_2.8.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.8.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.8.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-networkx_2.8.4.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.8.5.bb
index 8181d90c0..8d0b8dbb3 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.8.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "5e53f027c0d567cf1f884dbb283224df525644e43afd1145d64c9d88a3584762"
+SRC_URI[sha256sum] = "15a7b81a360791c458c55a417418ea136c13378cfdc06a2dcdc12bd2f9cf09c1"
 
 inherit pypi setuptools3
 
@@ -16,4 +16,6 @@ RDEPENDS:${PN} += "\
                    ${PYTHON_PN}-html \
                    ${PYTHON_PN}-xml \
                    ${PYTHON_PN}-json \
+                   ${PYTHON_PN}-profile \
+                   ${PYTHON_PN}-threading \
                    "
-- 
2.30.2


