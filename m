Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFDEC54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:29:30 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.22383.1673440166980668683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 04:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=lfYCYRFc;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=i71CVINmfg//rvbDtanQ0rcGklWEjQBgp8OzBGJRuGc=; b=lfYCYRFcRPkK7g6RK9Vy7AjvNG
	YmOfv/L2+FozmtmcYmexgm5jLKjgcR/uVK/M591f9Tzle2zkO17go0X89pkIJr6uZb59LFMNAfK+K
	uYpiR/BEjfG9qje8WtvqbQM8MqaUcvqrFX4gvj+yROhJd2QsgNBVc2/q9nW51EYhGCP+FI537FIhS
	Hk/aGmrP9DKyOYj2t5LcwTHrrFB9v4ljxjp05XLSfddFhODCX1P/Vil0KUz36imMrJ8xXFEYlF81T
	CjcThdnTd08OWqVhg9bca6uKEM6vSf3muNsNIjqxF6FmyIbJ0T3y614sPntAreALsvHkGuQ+HEJ91
	Ar7IWJaQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:42038 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pFaET-00033h-Bz;
	Wed, 11 Jan 2023 14:29:26 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-astroid: Upgrade 2.12.13 -> 2.13.2
Date: Wed, 11 Jan 2023 14:29:14 +0200
Message-Id: <20230111122914.1175681-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111122914.1175681-1-leon.anavi@konsulko.com>
References: <20230111122914.1175681-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 12:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100547

Upgrade to release 2.13.2:

- Removed version conditions on typing_extensions dependency.
- Removed typing_extensions from our tests requirements as it was
  preventing issues to appear in our continuous integration.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...astroid_2.12.13.bb => python3-astroid_2.13.2.bb} | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.13.bb => python3-astroid_2.13.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb b/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
index ca87ff013..fa22080d3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
@@ -4,11 +4,18 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1493fe8bd3dfd73dc35bd53c9d5b6e49ead98497c47b2307662556a5692d29d7"
+SRC_URI[sha256sum] = "3bc7834720e1a24ca797fd785d77efb14f7a28ee8e635ef040b6e2d80ccb3303"
 
-inherit pypi setuptools3
+SRC_URI += " \
+    file://0001-pyproject.toml-Replace-with.patch \
+"
+
+inherit pypi python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+DEPENDS += "\
+    ${PYTHON_PN}-pytest-runner-native \
+    ${PYTHON_PN}-wheel-native \
+"
 
 PACKAGES =+ "${PN}-tests"
 
-- 
2.30.2


