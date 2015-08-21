Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2AE76ABE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:47:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6l0rx027080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:47:00 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:46:59 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:43 +0800
Message-ID: <3847dc7746d7cebb44648f5946419ba34db33004.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 2/8] libssh: upgrade 0.6.4 -> 0.7.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Aug 2015 06:47:00 -0000
Content-Type: text/plain

Set the correct LIB_SUFFIX to fix QA issue for multilib:
ERROR: QA Issue: libssh: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libssh.so
  /usr/lib/libssh_threads.so.4.5.0
  /usr/lib/libssh.so.4
  /usr/lib/libssh_threads.so.4
  /usr/lib/libssh_threads.so
  [snip]
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.  [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libssh/{libssh_git.bb => libssh_0.7.1.bb}      |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_git.bb => libssh_0.7.1.bb} (79%)

diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recipes-support/libssh/libssh_0.7.1.bb
similarity index 79%
rename from meta-oe/recipes-support/libssh/libssh_git.bb
rename to meta-oe/recipes-support/libssh/libssh_0.7.1.bb
index 47fb39a..371e1ab 100644
--- a/meta-oe/recipes-support/libssh/libssh_git.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.1.bb
@@ -7,17 +7,16 @@ DEPENDS = "zlib openssl libgcrypt"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-6"
-SRCREV = "3880a8ed80a4b1e2c052bd62f328bba2f869d5ae"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-7"
+SRCREV = "053f72c671a83b32238dc01b56a66752fb15b7ec"
 S = "${WORKDIR}/git"
 
-PV = "0.6.4+git${SRCPV}"
-
 EXTRA_OECMAKE = " \
     -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
+    -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')} \
     "
 
 PACKAGECONFIG ??=""
-- 
1.7.9.5


