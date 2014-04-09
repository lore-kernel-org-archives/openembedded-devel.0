Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D48B65DED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:26:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s396QNWh027472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 23:26:23 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 23:26:22 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 14:27:09 +0800
Message-ID: <d548095ff29cf093d3e6df22594476873a34a67c.1397024315.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397024315.git.jackie.huang@windriver.com>
References: <cover.1397024315.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] eject: Fix wrong return value
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
X-List-Received-Date: Wed, 09 Apr 2014 06:26:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Remove the unnecessary return(1) from function usage(), so that eject -h
can return the right value.

Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../eject/eject/eject-2.1.5-error-return.patch     |   10 ++++++++++
 meta-oe/recipes-support/eject/eject_2.1.5.bb       |    4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch

diff --git a/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
new file mode 100644
index 0000000..2cce3c3
--- /dev/null
+++ b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
@@ -0,0 +1,10 @@
+Upstream-Status: Pending
+
+--- eject/eject.c.orig	2013-09-11 18:08:36.000000000 +0800
++++ eject/eject.c	2013-09-11 18:09:05.000000000 +0800
+@@ -207,7 +207,6 @@
+ "If omitted, name defaults to `%s'.\n"
+ "By default tries -r, -s, -f, and -q in order until success.\n"),
+ 			DEFAULTDEVICE);
+-  exit(1);
+ }
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 98319a3..c47c653 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 inherit autotools gettext update-alternatives
 
-SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz"
+SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
+           file://eject-2.1.5-error-return.patch \
+"
 
 SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
 SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
-- 
1.7.9.5


