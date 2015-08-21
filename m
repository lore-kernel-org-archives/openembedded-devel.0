Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14AD960557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:46:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6kvA3007974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:46:57 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:46:56 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:42 +0800
Message-ID: <cb06e085a8cd5f4a6251d8c0e4168c022fda564e.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/8] tomoyo-tools: pass correct libdir to make
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
X-List-Received-Date: Fri, 21 Aug 2015 06:46:57 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: tomoyo-tools: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libtomoyotools.so.3.0.2
  /usr/lib/libtomoyotools.so.3
  /usr/lib/.debug
  /usr/lib/tomoyo
  /usr/lib/.debug/libtomoyotools.so.3.0.2
  /usr/lib/tomoyo/init_policy
  [snip]
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.  [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
index adb538b..ac8593c 100644
--- a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -18,7 +18,8 @@ FILES_${PN}     += "${libdir}/tomoyo"
 FILES_${PN}-dbg += "${libdir}/tomoyo/.debug"
 
 DEPENDS = "linux-libc-headers ncurses"
-CFLAGS_append += "-D_GNU_SOURCE"
+
+EXTRA_OEMAKE = "-e USRLIBDIR=${libdir}"
 
 do_compile () {
 	oe_runmake 'CC=${CC}'
-- 
1.7.9.5


