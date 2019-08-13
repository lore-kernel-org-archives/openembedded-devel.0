Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D02860017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9NC44027688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:22 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:01 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:12 -0400
Message-ID: <20190813092118.113213-11-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 10/16] xfce4-dev-tools: 4.13.0 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-dev-tools_4.13.0.bb => xfce4-dev-tools_4.14.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.13.0.bb => xfce4-dev-tools_4.14.0.bb} (79%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.13.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.14.0.bb
similarity index 79%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.13.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.14.0.bb
index bfa93c3bd..0b1196619 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.13.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.14.0.bb
@@ -10,8 +10,8 @@ inherit autotools pkgconfig
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "dc7ce082ed0fb9a8f2c0953a939b8d42"
-SRC_URI[sha256sum] = "d24d4db2151a35324c672d4596a6a256f7d92727fe6a9d23648ab53f5207ba3b"
+SRC_URI[md5sum] = "5f8fc8af73819c08d9e4c26a3ac457e7"
+SRC_URI[sha256sum] = "2c9eb8e0fe23e47dc31411a93b683fd1b7a49140e9163f0aab9e94a3d8a0b5fd"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-- 
2.20.0


