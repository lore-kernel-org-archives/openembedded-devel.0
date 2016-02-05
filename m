Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2666277331
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 02:17:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u152HiPY024578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 18:17:44 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 4 Feb 2016 18:17:43 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2016 10:17:00 +0800
Message-ID: <e638487a144cf5dba9ba2ae4440d24b669595943.1454638380.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454638380.git.jackie.huang@windriver.com>
References: <cover.1454638380.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 4/5] jlex: fix the license and add JLEX license file
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
X-List-Received-Date: Fri, 05 Feb 2016 02:17:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The license statement is in the middle of source file
Main.java, it's not correct to referrence the COREBASE
MIT license in LIC_FILES_CHKSUM.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 licenses/JLEX                   | 19 +++++++++++++++++++
 recipes-core/jlex/jlex_1.2.6.bb |  4 +---
 2 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 licenses/JLEX

diff --git a/licenses/JLEX b/licenses/JLEX
new file mode 100644
index 0000000..df0648e
--- /dev/null
+++ b/licenses/JLEX
@@ -0,0 +1,19 @@
+       JLEX COPYRIGHT NOTICE, LICENSE, AND DISCLAIMER
+  Copyright 1996-2000 by Elliot Joel Berk and C. Scott Ananian 
+
+  Permission to use, copy, modify, and distribute this software and its
+  documentation for any purpose and without fee is hereby granted,
+  provided that the above copyright notice appear in all copies and that
+  both the copyright notice and this permission notice and warranty
+  disclaimer appear in supporting documentation, and that the name of
+  the authors or their employers not be used in advertising or publicity
+  pertaining to distribution of the software without specific, written
+  prior permission.
+
+  The authors and their employers disclaim all warranties with regard to
+  this software, including all implied warranties of merchantability and
+  fitness. In no event shall the authors or their employers be liable
+  for any special, indirect or consequential damages or any damages
+  whatsoever resulting from loss of use, data or profits, whether in an
+  action of contract, negligence or other tortious action, arising out
+  of or in connection with the use or performance of this software.
diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
index 4dbe63e..bb67a46 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -1,9 +1,7 @@
 DESCRIPTION = "Lexical analyzer generator for Java"
 AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
 LICENSE = "JLEX"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
-                   "
+LIC_FILES_CHKSUM = "file://Main.java;beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
 
 RDEPENDS_${PN} = "java2-runtime"
 RDEPENDS_${PN}_virtclass-native = ""
-- 
1.9.1


