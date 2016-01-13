Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.mail.online.nl (smtp03.mail.online.nl [194.134.25.73])
	by mail.openembedded.org (Postfix) with ESMTP id 4820C731A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 17:17:51 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp03.mail.online.nl (Postfix) with ESMTP id 8ABAF1C0006;
	Wed, 13 Jan 2016 18:17:49 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2016 18:17:45 +0100
Message-Id: <1452705465-6616-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1D770D53-86F4-45AA-9515-0A2F9538575F@gmail.com>
References: <1452534832-3203-1-git-send-email-mike.looijmans@topic.nl>
Subject: [meta-networking][PATCH v2] recipes-connectivity/samba: Remove /run directory tree
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
X-List-Received-Date: Wed, 13 Jan 2016 17:17:54 -0000

Depending on PACKAGECONFIG selection, the /run/samba directory may not
have been created, causing build errors.

Since the /run directory is volatile on target, anything installed
there will vanish anyway, so just remove the /run tree if it exists.

This fixes do_install failing with an error like this:
 rmdir: failed to remove '/.../samba/4.1.12-r0/image/run/samba': No such file or directory
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
Alternative patch that just removes /run unconditionally.

 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index e51f518..49df0f4 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -104,8 +104,7 @@ EXTRA_OECONF += "--enable-fhs \
 LDFLAGS += "-Wl,-z,relro,-z,now"
 
 do_install_append() {
-    rmdir --ignore-fail-on-non-empty "${D}/run/samba"
-    rmdir --ignore-fail-on-non-empty "${D}/run"
+    rm -rf "${D}/run"
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-- 
2.1.4


