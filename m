Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C01D57002B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:58:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L5wKhX003124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:58:20 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 22:58:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Sep 2016 13:41:02 +0800
Message-ID: <7153ab32f1b63b9dda24816b4547c156096f69e6.1474435724.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474435724.git.jackie.huang@windriver.com>
References: <cover.1474435724.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/8 v2] libtalloc: fix for LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 21 Sep 2016 05:58:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use the source files instead of common-licenses

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
index 7c85ab3..483dbda 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPL-3.0+ & GPL-3.0+"
 DEPENDS += "libaio libbsd"
 
 SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
+                    file://pytalloc.h;beginline=1;endline=18;md5=2c498cc6f2263672483237b20f46b43d"
 
 SRC_URI[md5sum] = "6fb70af4174330e4cc139ea63b07c9e9"
 SRC_URI[sha256sum] = "22d14911164d4de67ff76b5269fa5250d01f78c955bc77e28615350996877130"
-- 
2.8.3


