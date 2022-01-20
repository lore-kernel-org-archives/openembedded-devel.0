Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEFBC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 11:40:40 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.10524.1642678837225160637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 03:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Efb2oyWO;
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
	bh=fBpbXrm6cZY4V2of3tRB5qV0irIE46PzNOSPtlYS6fo=; b=Efb2oyWOl6/WKbP3kBFfcPJNkN
	Vgo0eIx6/Ni1EyFiSnAYD5YHt0xF8fdeLgqoxNzyA8zQ/7rmO8po+BAgrA11+bHQEYebIXQv6m1WA
	1EyM3y+lc95dOUbNTWH9M5FWh9D/Y5eXORfR8pb1J+9gAlhFAeiR5KuRI4rk+FFC9UVw9BOaWDcJY
	6YcVoHTwLVhlhJ7gDUkH0H/L+vy0l8J35N2iKiEVQdjy55vTq/nVieuCYeoRe5Uadl697m0lgM368
	FsN67SXkdbmUM/mxpaVbRX+hDCEfFcnP9Vq9Nr30DIJ1uXAOuyozHyN3N+LdlF4NizdMRA2WABElk
	jcV7Svqg==;
Received: from lan.nucleusys.com ([92.247.61.126]:48770 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nAVnt-00098G-1B; Thu, 20 Jan 2022 13:40:35 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-simpleeval: Upgrade 0.9.10 -> 0.9.12
Date: Thu, 20 Jan 2022 13:40:26 +0200
Message-Id: <20220120114027.1857045-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 11:40:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94956

Upgrade to release 0.9.12:

- Remove Cyclic references (memory leak)
- Add left & right shift operations (<< and >>)
- Switch to GH actions & CodeCov.io for CI tests
- Add extra contributors details
- Reformat w/ Black + isort, and have linting of those in CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...simpleeval_0.9.10.bb => python3-simpleeval_0.9.12.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simpleeval_0.9.10.bb => python3-simpleeval_0.9.12.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
rename to meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
index 36512cba9..8ad6acc87 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/simpleeval/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=dc9277482effe59b734b004cbcc1fee7"
 
-SRC_URI[md5sum] = "f175fc12d408487ca26fa3905e0a6691"
-SRC_URI[sha256sum] = "692055488c2864637f6c2edb5fa48175978a2a07318009e7cf03c9790ca17bea"
+SRC_URI[sha256sum] = "3e0be507486d4e21cf9d08847c7e57dd61a1603950399985f7c5a0be7fd33e36"
 
 inherit pypi setuptools3 ptest
 
@@ -14,12 +13,18 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-math \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
+
 do_configure:prepend() {
 	sed -i -e "/use_2to3=True,/d" ${S}/setup.py
 }
+
 do_install_ptest() {
 	cp -f ${S}/test_simpleeval.py ${D}${PTEST_PATH}/
 }
-- 
2.30.2


