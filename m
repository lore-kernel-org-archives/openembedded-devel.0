Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E84FC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 12:37:41 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.940.1637239058397736509
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 04:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=OYLa+nj0;
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
	bh=GAjCiBPIzNEAROVU3pzNxO6n2FYaaCu/K0NNkVrlitY=; b=OYLa+nj0xcRxk+MAS0uAugYvLS
	IK9nt+gPK+DXPBX2TVmXr8/4+GyIWYw9bnmIEbCVdNmMSI7gtx4jAwrPIDO4421F2THxYFkeHpVI8
	QMiO6jpxxA0BM0HCbmwF46DFE86/VCQpNMT4Mesr3r8CEZdRwaGxXkxdWw2lrpWmGNrIURGLVJZ9j
	D78w8v5iHRcwInZY4M/5PYv2p7iw57LB2+sIULq9byTq+LjqLdqZuaijNPPV7NTIK+DQ5Jwylcnlm
	oMjGwHmlWmgt37lZ39QnZl1BVy8TJz1RDl2vZtb0s1voQyefce7SaV1vaFNxHTt0D5z44ZwQZCN5I
	xRSswSuw==;
Received: from lan.nucleusys.com ([92.247.61.126]:60154
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnenO-0007sV-U6; Thu, 18 Nov 2021 14:37:35 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-deprecated: Upgrade 1.2.12 -> 1.2.13
Date: Thu, 18 Nov 2021 14:37:25 +0200
Message-Id: <20211118123727.45056-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
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
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 12:37:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94023

Upgrade to release 1.2.13:

- Change the signature of the :func:~deprecated.sphinx.deprecated
  decorator to reflect the valid use cases.
- Fix versionadded and versionchanged decorators: do not return a
  decorator factory, but a Wrapt adapter.
- Fix configuration for AppVeyor: simplify the test scripts and
  set the version format to match the current version.
- Change configuration for Tox: run unit tests on Wrapt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-deprecated_1.2.12.bb => python3-deprecated_1.2.13.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-deprecated_1.2.12.bb => python3-deprecated_1.2.13.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.2.13.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb
rename to meta-python/recipes-devtools/python/python3-deprecated_1.2.13.bb
index 4651a8ae3..6ea47f429 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.2.13.bb
@@ -4,6 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
 
 PYPI_PACKAGE = "Deprecated"
-SRC_URI[sha256sum] = "6d2de2de7931a968874481ef30208fd4e08da39177d61d3d4ebdf4366e7dbca1"
+SRC_URI[sha256sum] = "43ac5335da90c31c24ba028af536a91d41d53f9e6901ddb021bcc572ce44e38d"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-wrapt \
+"
-- 
2.20.1


