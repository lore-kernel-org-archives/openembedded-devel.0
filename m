Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6261E60065
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 01:36:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s761anWa029538
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Aug 2014 18:36:50 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 18:36:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Aug 2014 18:36:48 -0700
Message-ID: <1407289008-6759-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] syslog-ng: update configure.patch for older patch tool
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
X-List-Received-Date: Wed, 06 Aug 2014 01:36:52 -0000
Content-Type: text/plain

The previous configure.patch can't be applied by older "patch" tool
since the line number is incorrect, for example, the "patch 2.5.4" on
CentOS 5.10.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../syslog-ng/files/configure.patch                |   12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.patch b/meta-oe/recipes-support/syslog-ng/files/configure.patch
index 136bb5e..109f58c 100644
--- a/meta-oe/recipes-support/syslog-ng/files/configure.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/configure.patch
@@ -2,7 +2,7 @@ Index: syslog-ng-3.5.4.1/configure.ac
 ===================================================================
 --- syslog-ng-3.5.4.1.orig/configure.ac	2014-07-18 13:49:36.794141441 +0000
 +++ syslog-ng-3.5.4.1/configure.ac	2014-07-18 14:23:57.738197606 +0000
-@@ -8,15 +8,16 @@
+@@ -8,7 +8,8 @@ dnl SNAPSHOT_VERSION   - snapshot version to add to version number
  dnl BINARY_BRANCH      - the value is added to all source/binary packages
  dnl SOURCE_REVISION    - Revision of the source-tree, will added to the version string
  dnl
@@ -12,15 +12,7 @@ Index: syslog-ng-3.5.4.1/configure.ac
  AC_CONFIG_MACRO_DIR([m4])
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
  
- dnl ***************************************************************************
- dnl definitions
- 
- PACKAGE="syslog-ng"
- VERSION="`cat $srcdir/VERSION`"
- 
- dnl ***************************************************************************
- dnl dependencies
-@@ -53,7 +56,7 @@
+@@ -53,7 +54,7 @@ else
          CURRDATE=`date +"%a, %d %b %Y %H:%M:%S %Z"`
  fi
  
-- 
1.7.9.5


