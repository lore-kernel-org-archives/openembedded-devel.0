Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 092107D278
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:41:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x686ex0S005925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:41:10 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:40:49 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:38:54 +0800
Message-ID: <20190708063901.13914-2-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 2/9] keyutils: Fix build with usrmerge
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
X-List-Received-Date: Mon, 08 Jul 2019 06:41:19 -0000
Content-Type: text/plain

From: Alex Kiernan <alex.kiernan@gmail.com>

Update BINDIR and SBINDIR so keyutils builds with usrmerge

ERROR: keyutils-1.5.10-r0 do_package: QA Issue: keyutils: Files/directories were installed but not shipped in any package:
  /sbin/key.dns_resolver
  /sbin/request-key
  /bin/keyctl
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
keyutils: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 keyutils_1.5.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/keyutils_1.5.10.bb b/keyutils_1.5.10.bb
index 2ead8fa19..a4222b9e9 100644
--- a/keyutils_1.5.10.bb
+++ b/keyutils_1.5.10.bb
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] = "115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c
 
 EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     NO_ARLIB=1 \
+    BINDIR=${base_bindir} \
+    SBINDIR=${base_sbindir} \
     LIBDIR=${base_libdir} \
     USRLIBDIR=${base_libdir} \
     BUILDFOR=${SITEINFO_BITS}-bit \
-- 
2.14.4


