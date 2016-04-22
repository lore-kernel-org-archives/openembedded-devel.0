Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7134662133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 09:36:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M9aMW5012566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 02:36:22 -0700 (PDT)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Apr 2016 02:36:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Apr 2016 17:36:14 +0800
Message-ID: <1461317774-19137-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] icedtea7-native: skip the already-stripped test
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
X-List-Received-Date: Fri, 22 Apr 2016 09:36:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libfreetype.so.6 is copied from STAGING_LIBDIR and
binaries/libraries in sysroot are already stripped
since the following commit in oe-core:
"30f3774 staging: Strip files in sysroot"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 0ffe5d5..2dad84d 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -43,6 +43,10 @@ B = "${S}/build"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 
+# libfreetype.so.6 is copied from STAGING_LIBDIR
+# which is already stripped.
+INSANE_SKIP_${PN} = "already-stripped"
+
 # OpenJDK supports parallel compilation but uses a plain number for this.
 # In OE we have PARALLEL_MAKE which is the actual option passed to make,
 # e.g. "-j 4".
-- 
2.7.4


