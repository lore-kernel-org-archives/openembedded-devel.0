Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F49B73E36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9HNn9014248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:23 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:23 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:55 +0800
Message-ID: <43b1730c834c25745826a1b87a11af639ff5ebab.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 8/9] xdotool: pass correct libdir to make
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:22 -0000
Content-Type: text/plain

When MACHINE=qemux86-64 and enable multilib:
ERROR: QA Issue: xdotool: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libxdo.so
  /usr/lib/libxdo.so.1
  /usr/lib/.debug
  /usr/lib/.debug/libxdo.so.1
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Pass the correct libdir to make, otherwise it assumes $prefix/lib even
on multilib.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../xdotool/xdotool_1.20100416.2809.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
index 43e6fda..474d298 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://semicomplete.googlecode.com/files/xdotool-${PV}.tar.gz"
 SRC_URI[md5sum] = "1d5be641e512c343abfe5f78b39e6f19"
 SRC_URI[sha256sum] = "42d7271fbc796e53db71bb221f311b9ff3c51d90a71c9487a9bd3101ca39894f"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLMAN=${mandir}"
+EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir}"
 
 do_install() {
     oe_runmake -e install DESTDIR=${D} PREFIX=${prefix}
-- 
1.7.9.5


