Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0687A7D7A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 06:32:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F6WcB7029929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Apr 2019 23:32:38 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 14 Apr 2019 23:32:38 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Apr 2019 02:32:33 -0400
Message-ID: <20190415063233.119684-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] gvfs: fix typo libexec
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
X-List-Received-Date: Mon, 15 Apr 2019 06:32:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

I believe ${libexec} is a typo here which should be ${libexecdir}.
Otherwise, the execute bit of ${datadir}/polkit-1/rules.d will be set
and previous workaround which chmod ${datadir}/polkit-1/rules.d does not
work.

Replace tab with spaces at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index 8fed9e825..35367ae11 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -63,14 +63,14 @@ PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
 do_install_append() {
     # Fix up permissions on polkit rules.d to work with rpm4 constraints
-	chmod 700 ${D}/${datadir}/polkit-1/rules.d
-	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+    chmod 700 ${D}/${datadir}/polkit-1/rules.d
+    chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
 
     # After rebuilds (not from scracth) it can happen that the executables in
     # libexec ar missing executable permission flag. Not sure but it came up
     # during transition to meson. Looked into build files and logs but could
     # not find suspicious
-    for exe in `find ${D}/${libexec}`; do
+    for exe in `find ${D}/${libexecdir}`; do
        chmod +x $exe
     done
 
-- 
2.20.0


