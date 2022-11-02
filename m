Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0384C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:55:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.7267.1667400899732620494
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 07:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=DqFdHne3;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vuDlpoOcRrvurRvPDSHBERH/N2lRvxjoW7deQuBuWmQ=; b=DqFdHne3g0YOY8Pd5jUrCyE7mZ
	C6QKGCiP22MVhHrpxCAdw1Du0+v4kN7wvLTye3+vjiOQpEgfE+mzfkZ1EhUPv3WYcVbTDJaF6Qyca
	Z29gsnKwyEZUXnZ1iqqNG+tr6sJPFJesJKiOvP/ea9jwbdhMUeTOA4iilUxkzA6z68sLuPzHiB/se
	b+kxSCQh27cqSKNqi1rxwv5atLZNdPEjVpL210zR9vAaD21lz1hqop9lINv8erRxtSf7/cRftZ9ZI
	I7FPsr1hLOHWMasReOkxlWlvcOxIn37LpSYo3uZFQgmqa1sGD0F0X60UbYgplXO405S8s8vlyUbm/
	HwT1oeyA==;
Received: from lan.nucleusys.com ([92.247.61.126]:44148 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oqFAN-0004Ql-IK;
	Wed, 02 Nov 2022 16:54:59 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-twisted: Upgrade 22.8.0 -> 22.10.0
Date: Wed,  2 Nov 2022 16:54:41 +0200
Message-Id: <20221102145441.3101891-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221102145441.3101891-1-leon.anavi@konsulko.com>
References: <20221102145441.3101891-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 14:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99422

Upgrade to release 22.10.0:

- The systemd: endpoint parser now supports "named" file
  descriptors. This is a more reliable mechanism for choosing
  among several inherited descriptors.
- The systemd endpoint parser's index parameter is now documented
  as leading to non-deterministic results in which descriptor is
  selected. The new name parameter is now documented as preferred.
- The implementers of Zope interfaces are once more displayed in
  the documentations.
- twisted.protocols.dict, which was deprecated in 17.9, has been
  removed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-twisted_22.8.0.bb => python3-twisted_22.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_22.8.0.bb => python3-twisted_22.10.0.bb} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.8.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted_22.8.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
index f40c5f080..17e76d12a 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f8d67f84b6e178c92d471011b2245fc"
 
-SRC_URI[sha256sum] = "e5b60de39f2d1da153fbe1874d885fe3fcbdb21fcc446fa759a53e8fc3513bed"
+SRC_URI[sha256sum] = "32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7a059048f2d4d31"
 
 PYPI_PACKAGE = "Twisted"
 
-- 
2.30.2


