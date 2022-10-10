Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9093C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 14:43:35 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.6922.1665413013215586837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=JL8tCqlW;
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
	bh=xYY43HCY0BT7Jd612j4CSlUU7PoMlhTArKtu+xk7LOc=; b=JL8tCqlWMBMyspsDeGMtALVjEm
	qNYvTmGkw+L1w20uxKWFMAJHESk5gyZAzEmHRzB1ds3xSgGS177d9QYjoZ2zLjmtmAF2xw6jWYqsp
	G8ou7Qz5HmOI447lciTmJMDe75BbPQ7e/saz3sdpO8pqYGICvUV7KColvzPl+bhcuJteBvRBLkUwv
	H/qnC62KXf/IrAu/anHEQezRqHHbgUsBHTMDeQoq8ppjMsz0J/ewRcGFhvPxAyvjCIUmReo9Q1+Uw
	BIgmKNkKWZfk4DfmwAR4kEYelvN8DyCtWQ3Y9hxolZ9ore8fHidGFl0WNHb87tdF7comdzDTLSXP9
	z4I+tFNg==;
Received: from lan.nucleusys.com ([92.247.61.126]:49634 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ohu0R-0000vn-FQ;
	Mon, 10 Oct 2022 17:43:32 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-jsonref: Upgrade 0.2 -> 0.3.0
Date: Mon, 10 Oct 2022 17:43:20 +0300
Message-Id: <20221010144320.3908330-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221010144320.3908330-1-leon.anavi@konsulko.com>
References: <20221010144320.3908330-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 14:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99131

Upgrade to release 0.3.0:

- Add documentation for the JsonRefError class
- Drop python 2 support
- Switch to GitHub Actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonref_0.2.bb => python3-jsonref_0.3.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python-jsonref/{python3-jsonref_0.2.bb => python3-jsonref_0.3.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
index 45deb09c7..4daaf521f 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
@@ -3,9 +3,14 @@ HOMEPAGE = "https://github.com/gazpachoking/jsonref"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
 
-SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
-SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
+SRC_URI[sha256sum] = "68b330c6815dc0d490dbb3d65ccda265ddde9f7856fd2f3322f971d456ea7549"
 
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-json \
+	${PYTHON_PN}-netclient \
+"
-- 
2.30.2


