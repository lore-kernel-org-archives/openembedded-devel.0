Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.15426.1591949898242733485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 01:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05C8IGGh002885
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 01:18:17 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.131) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 12 Jun 2020 01:18:09 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python2][PATCH] python: update RRECOMMENDS for multilib
Date: Fri, 12 Jun 2020 16:16:38 +0800
Message-ID: <20200612081638.2467372-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There is a qa issue because of oe-core commit b3fda05 which updates
multilib mechanism:

| ERROR: lib32-python-2.7.18-r0 do_package: QA Issue: lib32-python package
    lib32-python-crypt - suspicious values 'openssl' in RRECOMMENDS [multilib]

Prepend ${MLPREFIX} to RRECOMMENDS to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-devtools/python/python_2.7.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index be7c6d2..0945cb3 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -153,7 +153,7 @@ PACKAGES_remove = "${PN}"
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
-RRECOMMENDS_${PN}-crypt = "openssl"
+RRECOMMENDS_${PN}-crypt = "${MLPREFIX}openssl"
 
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
-- 
2.25.1

