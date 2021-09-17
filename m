Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.444.1631920383678321358
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 16:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18HND2BM004245
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Sep 2021 16:13:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18HND1Ca029363
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Sep 2021 16:13:02 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 16:13:00 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 17 Sep 2021 16:13:00 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 17 Sep 2021 16:13:00 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] bats: source files from correct directory
Date: Fri, 17 Sep 2021 19:13:00 -0400
Message-ID: <20210917231300.40778-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Files are installed in ${baselib} directory when multilib is
enabled and not in the hardcoded lib directory making it fail
to source bats-core files.

Parameterize the libdir such that the files are sources correctly.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-test/bats/bats_1.4.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-test/bats/bats_1.4.1.bb b/meta-oe/recipes-test/bats/bats_1.4.1.bb
index b30055549..30e83457c 100644
--- a/meta-oe/recipes-test/bats/bats_1.4.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.4.1.bb
@@ -14,6 +14,12 @@ SRCREV = "54e965fa9d269c2b3ff9036d81f32bac3df0edea"
 
 S = "${WORKDIR}/git"
 
+do_configure:prepend() {
+	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats
+	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-file
+	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-test
+}
+
 do_install() {
 	# Just a bunch of bash scripts to install
 	${S}/install.sh ${D}${prefix} ${baselib}
-- 
2.33.0

