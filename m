Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFCAC7002B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:58:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8L5wMdB007069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:58:22 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 20 Sep 2016 22:58:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Sep 2016 13:41:03 +0800
Message-ID: <a82e9511345379b3f854bd90ed7b2b2bcd9940eb.1474435724.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474435724.git.jackie.huang@windriver.com>
References: <cover.1474435724.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/8 v2] libtevent: fix for LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 21 Sep 2016 05:58:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use the source file instead of common-licenses

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
index 6acdeb5..222a22a 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
@@ -7,7 +7,7 @@ DEPENDS += "libaio libbsd libtalloc"
 RDEPENDS_python-tevent = "python"
 
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"
+LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
 SRC_URI[md5sum] = "4372c1430a1ecb7ea0adddfdf21c0d55"
 SRC_URI[sha256sum] = "a4f519b0bbb718fe2175bee9011ee4d199675f28c2ef80531be38e7bbaa1c42b"
-- 
2.8.3


