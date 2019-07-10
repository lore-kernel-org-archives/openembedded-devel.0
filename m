Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E384C7D27B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:28:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6A3SBGe011000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2019 20:28:27 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 9 Jul 2019 20:28:03 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 23:28:00 -0400
Message-ID: <20190710032800.97661-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] libvncserver: update to latest commit 1354f7f
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
X-List-Received-Date: Wed, 10 Jul 2019 03:28:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update libvncserver to latest git commit 1354f7f which could help to fix
do_package error when multilib is enabled:

| Files/directories were installed but not shipped in any package:
|   /usr/lib/libvncclient.so.0.9.12
|   /usr/lib/libvncclient.so.1
|   /usr/lib/libvncclient.so
|   /usr/lib/libvncserver.so.0.9.12
|   /usr/lib/libvncserver.so.1
|   /usr/lib/libvncserver.so
|   /usr/lib/pkgconfig
|   /usr/lib/pkgconfig/libvncserver.pc
|   /usr/lib/pkgconfig/libvncclient.pc

Rename recipe name from _git.bb to _${version}.bb as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libvncserver_git.bb => libvncserver_0.9.12.bb}         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libvncserver/{libvncserver_git.bb => libvncserver_0.9.12.bb} (90%)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
similarity index 90%
rename from meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
index bc47a3f15..4e4acb835 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
@@ -31,7 +31,9 @@ FILES_libvncclient = "${libdir}/libvncclient.*"
 inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
-SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
-PV = "0.9.12+git${SRCPV}"
+SRCREV = "1354f7f1bb6962dab209eddb9d6aac1f03408110"
+PV .= "+git${SRCPV}"
 
 S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
-- 
2.20.0


