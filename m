Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44EA87E8B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:20:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E3KkwH005438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:20:46 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 13 Jun 2019 20:20:45 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Jun 2019 11:20:41 +0800
Message-ID: <1560482443-5210-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-webserver][PATCH 1/3] fcgi: upgrade 2.4.1+git -> 2.4.2
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
X-List-Received-Date: Fri, 14 Jun 2019 03:20:45 -0000
Content-Type: text/plain

Remove add_foreign_to_AM_INIT_AUTOMAKE.patch as the issue had been fixed
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch    | 18 ------------------
 meta-webserver/recipes-support/fcgi/fcgi_git.bb        |  7 +++----
 2 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch

diff --git a/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
deleted file mode 100644
index eec9dd7..0000000
--- a/meta-webserver/recipes-support/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-use automake options "foreign" to set the strictness as appropriate
-
-Signed-off-by: Yang Haibo <b40869@freescale.com>
---- fcgi-ori/configure.in	2014-08-05 14:58:35.000000000 +0800
-+++ fcgi-2.4.0/configure.in	2014-08-05 14:59:08.000000000 +0800
-@@ -4,8 +4,8 @@
- dnl     generate the file "configure", which is run during the build
- dnl     to configure the system for the local environment.
- 
--AC_INIT
--AM_INIT_AUTOMAKE(fcgi, 2.4.1-SNAP-0910052249)
-+AC_INIT([fcgi], [2.4.1-SNAP-0910052249])
-+AM_INIT_AUTOMAKE([foreign])
- 
- AM_CONFIG_HEADER(fcgi_config.h)
- 
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
index a17e70f..6df58ad 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
 LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRCREV = "68100b5b8cb26f04b784778ed19ccef4fe389f57"
-PV = "2.4.1+git${SRCPV}"
+SRCREV = "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
+PV = "2.4.2"
 
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https \
-           file://add_foreign_to_AM_INIT_AUTOMAKE.patch \
-"
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


