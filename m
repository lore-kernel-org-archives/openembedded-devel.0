Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB61D611D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 08:28:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0258S1Md018065
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Mar 2020 00:28:01 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.487.0; Thu, 5 Mar 2020 00:28:00 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Mar 2020 16:27:59 +0800
Message-ID: <1583396879-334238-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsdump: fix do patch error
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
X-List-Received-Date: Thu, 05 Mar 2020 08:28:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

update patch to fix do_patch error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-xfsdump-support-usrmerge.patch      | 26 +++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
index 04ec7b3..bfb25e8 100644
--- a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
@@ -1,44 +1,48 @@
-From 2da4cfe17b994d7f10017561ca8efe6b6bd5f3cf Mon Sep 17 00:00:00 2001
+From fea8c4634469784c16211e2597411c18c72dfa4a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 5 Sep 2019 11:17:15 +0800
+Date: Thu, 5 Mar 2020 14:36:14 +0800
 Subject: [PATCH] xfsdump: support usrmerge
 
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- dump/Makefile    | 4 +---
- restore/Makefile | 4 +---
- 2 files changed, 2 insertions(+), 6 deletions(-)
+ dump/Makefile    | 6 +-----
+ restore/Makefile | 6 +-----
+ 2 files changed, 2 insertions(+), 10 deletions(-)
 
 diff --git a/dump/Makefile b/dump/Makefile
-index 97879fa..14da664 100644
+index 66f00d3..cc2d973 100644
 --- a/dump/Makefile
 +++ b/dump/Makefile
-@@ -97,10 +97,8 @@ default: depend $(LTCOMMAND)
+@@ -97,12 +97,8 @@ default: depend $(LTCOMMAND)
  include $(BUILDRULES)
  
  install: default
 -	$(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
 -	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
  	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
--	$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
+-	# skip symlink when /sbin is alread symlinked to /usr/sbin, like on Fedora
+-	test $(PKG_ROOT_SBIN_DIR) -ef $(PKG_SBIN_DIR) || \
+-		$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
 +	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
  install-dev:
  
  .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
 diff --git a/restore/Makefile b/restore/Makefile
-index c6f3f25..7835ecc 100644
+index ac3f8c8..3c46394 100644
 --- a/restore/Makefile
 +++ b/restore/Makefile
-@@ -107,10 +107,8 @@ default: depend $(LTCOMMAND)
+@@ -111,12 +111,8 @@ default: depend $(LTCOMMAND)
  include $(BUILDRULES)
  
  install: default
 -	$(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
 -	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
  	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
--	$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
+-	# skip symlink when /sbin is alread symlinked to /usr/sbin, like on Fedora
+-	test $(PKG_ROOT_SBIN_DIR) -ef $(PKG_SBIN_DIR) || \
+-		$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
 +	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
  install-dev:
  
-- 
2.7.4


