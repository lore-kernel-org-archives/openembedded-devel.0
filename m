Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B09C17ED40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:21:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9LvkS016982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:21:57 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:21:57 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:04 -0400
Message-ID: <20190813092118.113213-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 02/16] xfconf: 4.13.8 -> 4.14.1
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
X-List-Received-Date: Tue, 13 Aug 2019 09:21:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfconf/{xfconf_4.13.8.bb => xfconf_4.14.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.8.bb => xfconf_4.14.1.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.8.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.13.8.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
index 54d051c6f..8da96a420 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.8.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "5d48e8d50f7bfadd31e804ce602a5cf3"
-SRC_URI[sha256sum] = "55e2441c4ff78a7006fabb59647f7bc1f190cbb82327b93ba063ff624a896591"
+SRC_URI[md5sum] = "cb51a59e2a89d05232f825ad8c74a7c0"
+SRC_URI[sha256sum] = "b893e0a329aee00902fec2f0509f56916c9dcc7844e1b1f9e3c7399458290d59"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.20.0


