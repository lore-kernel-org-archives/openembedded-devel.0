Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A849C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 13:03:04 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.10728.1664283782292373137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 06:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=DcUCNzNn;
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
	bh=szDP3AAhabFIymrOSjAAP6+ZlaCTJGRrhNepadHut+o=; b=DcUCNzNnVp8uBMI9OfUYamb2TR
	cD9GJn5lwdUc9ySsUcQC6aLLsV2iQ7aROGnwOF515PvGlSFAWL9V0iWsBlMQEGYt9T0hSQ7n2nHf8
	Q12E9N7z59vm8aaSOp3HIzbJcDsEFfmeKsVNt11DFYlt9kguNrwCxw2SxiydgsEp0+IW1mFLtdld6
	hzG974KSGx+wE7Aywe52Xe5+hmBCnHfHnI6T+q72qXd+ij//TryrSdZQ2A3C01VPUuqqSCMsRRqbm
	OFm+VzUYoJyVobbs5s5dPhBef50c+XaIN+ECgi7rGkKR5TBlFeyAkz9rWxGG/Uvu28i+3EkOZFK8x
	20XnSbCw==;
Received: from lan.nucleusys.com ([92.247.61.126]:39898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1odAFh-0003Fp-T6;
	Tue, 27 Sep 2022 16:03:01 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-license-expression: Upgrade 21.6.14
 -> 30.0.0
Date: Tue, 27 Sep 2022 16:02:50 +0300
Message-Id: <20220927130250.2221578-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927130250.2221578-1-leon.anavi@konsulko.com>
References: <20220927130250.2221578-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 13:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98992

Upgrade to release 30.0.0:

- Use latest skeleton (and updated configure script)
- Drop using calver
- Improve error checking when combining licenses

License-Update: Fix merge error in LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on_21.6.14.bb => python3-license-expression_30.0.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-license-expression_21.6.14.bb => python3-license-expression_30.0.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb b/meta-python/recipes-devtools/python/python3-license-expression_30.0.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
rename to meta-python/recipes-devtools/python/python3-license-expression_30.0.0.bb
index 2ee4909bd..eeb91723e 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_21.6.14.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_30.0.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Utility library to parse, compare, simplify and normalize license exp
 HOMEPAGE = "https://github.com/nexB/license-expression"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=9429839cdc4b292ff46e88b524c6e0c9"
+LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "9de87a427c9a449eee7913472fb9ed03b63036295547369fdbf95f76a8b924b2"
+SRC_URI[sha256sum] = "ad638292aa8493f84354909b517922cb823582c2ce2c4d880e42544a86bea8dd"
 
 inherit pypi ptest python_setuptools_build_meta
 
@@ -12,6 +12,10 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-booleanpy \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-logging \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


