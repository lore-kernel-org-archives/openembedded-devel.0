Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27201C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 16:32:00 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.33885.1641832317491488816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 08:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=quvODxVN;
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
	bh=lIYaGBol4VUIaL8Jp+TeAMylX/BlxnJId0Ta+rw9hFQ=; b=quvODxVNnggMiHBQ+bmc5O5QBZ
	I0eURWr0ld3CiIEaphXJp7Wd42c25mUhXH1fmoz9zsdfCIkqgt+AMwBurb2sH+WUEnlYRrcyKVZpS
	lJ0ooF9qQFqsJ7PuesCZPXO7GNhkgK+PWgnhr5jbzXWTfPIkcBmVh+Jhgj7MJlHONvanN9cXc4Olc
	LxmeWhkDRRsDqbT52SFyDCJvPZGSnZm0T9FkDq87fxUCtQ0z4NLp0hU2ep8aXG5xf8OTO+lsWxdpt
	RkqPa4dcqKBlziP4DvAN72NPfFymR8YPIErSwxrjP7kLJMKlAEzhmiH9YJz7GUAq6aEBc71U6p0sD
	SM1LtSGQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:51272 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n6xc7-0009ij-P4; Mon, 10 Jan 2022 18:31:56 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-diskcache: Upgrade 5.3.0 -> 5.4.0
Date: Mon, 10 Jan 2022 18:31:42 +0200
Message-Id: <20220110163146.40024-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 16:32:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94718

Upgrade to release 5.4.0:

- Run isort
- Remove unused imports
- Update tests for Django 3.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...diskcache_5.3.0.bb => python3-diskcache_5.4.0.bb} | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.3.0.bb => python3-diskcache_5.4.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
index 55829bd1e..84d42e572 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.4.0.bb
@@ -3,10 +3,20 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "3f1fa30b29fdff26cfddcb3ee7d61376903f82c769ea2907a2b82a5bfb8abbe2"
+SRC_URI[sha256sum] = "8879eb8c9b4a2509a5e633d2008634fb2b0b35c2b36192d89655dbde02419644"
 
 PYPI_PACKAGE = "diskcache"
 
 inherit pypi setuptools3
 
+RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-sqlite3 \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-threading \
+"
+
 CLEANBROKEN = "1"
-- 
2.30.2


