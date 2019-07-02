Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50E807D32D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:30:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x621UB3t023643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:30:11 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:30:10 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:07 -0400
Message-ID: <20190702012913.7163-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 05/11] xfce4-dev-tools: 4.12.0 -> 4.13.0
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
X-List-Received-Date: Tue, 02 Jul 2019 01:30:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-dev-tools_4.12.0.bb => xfce4-dev-tools_4.13.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.12.0.bb => xfce4-dev-tools_4.13.0.bb} (79%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.13.0.bb
similarity index 79%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.13.0.bb
index 5557f6df9..bfa93c3bd 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.13.0.bb
@@ -10,8 +10,8 @@ inherit autotools pkgconfig
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "559202c4d9650e23696c44aa94cfc5a9"
-SRC_URI[sha256sum] = "e2e3a654fe9110df81f8c2483c9cbfa6d656fed15d5e5e717d6ef10bd0f5b5cb"
+SRC_URI[md5sum] = "dc7ce082ed0fb9a8f2c0953a939b8d42"
+SRC_URI[sha256sum] = "d24d4db2151a35324c672d4596a6a256f7d92727fe6a9d23648ab53f5207ba3b"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-- 
2.20.0


