Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6909C7ED76
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:35:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6A2ZUZ4007263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Jul 2019 19:35:30 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 9 Jul 2019 19:35:30 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Jul 2019 22:35:25 -0400
Message-ID: <20190710023525.25506-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] libvncserver: update to latest commit 1354f7f
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
X-List-Received-Date: Wed, 10 Jul 2019 02:35:30 -0000
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
 .../{libvncserver_git.bb => libvncserver_0.9.12.bb}           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libvncserver/{libvncserver_git.bb => libvncserver_0.9.12.bb} (92%)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
similarity index 92%
rename from meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
index bc47a3f15..683a29f94 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
@@ -31,7 +31,9 @@ FILES_libvncclient = "${libdir}/libvncclient.*"
 inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
-SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
+SRCREV = "1354f7f1bb6962dab209eddb9d6aac1f03408110"
 PV = "0.9.12+git${SRCPV}"
 
 S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
-- 
2.20.0


