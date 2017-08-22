Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD4978237
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 04:36:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M4aEP4000136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:36:14 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 21 Aug 2017 21:36:12 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 12:36:56 +0800
Message-ID: <1503376616-14240-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] postgresql: update to 9.4.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2017 04:36:14 -0000
Content-Type: text/plain

Fixed three security vulnerabilities:

CVE-2017-7546: Empty password accepted in some authentication methods
CVE-2017-7547: The "pg_user_mappings" catalog view discloses passwords
to users lacking server privileges
CVE-2017-7548: lo_put() function ignores ACLs

See release note:
https://www.postgresql.org/docs/9.4/static/release-9-4-13.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postgresql/{postgresql_9.4.11.bb => postgresql_9.4.13.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.11.bb => postgresql_9.4.13.bb} (67%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
similarity index 67%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
index 7043b27..bf97cad 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
@@ -11,5 +11,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "2fee03f2034034dbfcb3321a0bb0f829"
-SRC_URI[sha256sum] = "e3eb51d045c180b03d2de1f0c3af9356e10be49448e966ca01dfc2c6d1cc9d23"
+SRC_URI[md5sum] = "dbdb9fbe1b9a394b9ac19d3113b73944"
+SRC_URI[sha256sum] = "0080f55d65194de8b96a2dab153443f8248ff2b2b10e6ab4cda2dcadcac7f2ab"
-- 
2.7.4


