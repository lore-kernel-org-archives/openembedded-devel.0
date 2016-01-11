Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.mail.online.nl (smtp01.mail.online.nl [194.134.25.71])
	by mail.openembedded.org (Postfix) with ESMTP id 2B256731D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:54:11 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp01.mail.online.nl (Postfix) with ESMTP id F196240036;
	Mon, 11 Jan 2016 18:54:07 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:53:52 +0100
Message-Id: <1452534832-3203-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Subject: [meta-networking][PATCH] recipes-connectivity/samba: Only rmdir directories that exist
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
X-List-Received-Date: Mon, 11 Jan 2016 17:54:12 -0000

Depending on PACKAGECONFIG selection, the /run/samba directory may not
have been created. Make the do_install_append handle both situations
by checking whether these directories exist before attempting to remove
them.

This fixes do_install failing with an error like this:
 rmdir: failed to remove '/.../samba/4.1.12-r0/image/run/samba': No such file or directory

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index a51d31f..8e89e49 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -104,8 +104,12 @@ EXTRA_OECONF += "--enable-fhs \
 LDFLAGS += "-Wl,-z,relro,-z,now"
 
 do_install_append() {
-    rmdir --ignore-fail-on-non-empty "${D}/run/samba"
-    rmdir --ignore-fail-on-non-empty "${D}/run"
+    if [ -d "${D}/run" ]; then
+        if [ -d "${D}/run/samba" ]; then
+            rmdir --ignore-fail-on-non-empty "${D}/run/samba"
+        fi
+        rmdir --ignore-fail-on-non-empty "${D}/run"
+    fi
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-- 
2.1.4


