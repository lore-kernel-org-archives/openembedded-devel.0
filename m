Return-Path: <stefan@agner.ch>
X-Greylist: delayed 584 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Jan 2020 17:09:08 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5E08C7F687
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 17:09:08 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 020765C6602;
	Thu, 23 Jan 2020 17:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579798765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=UaaIC8qX5/OndXl3z+gYEMMLiSMZy0A7UZDbK8H93KA=;
	b=cjA6OE6g0o8PfHdHAd1K86cvOj/xlg2XGhCIGzdXiheT7y54T11548muer5feUVE6Pn4NZ
	zPQ8smVqfA0Tpqn3Suj4wdK9GLOjob07RI8TVFS3bCFdq+QCzrDQZhRAqXWGxBYse4ZiTa
	eyL3GUyJc+GiWX0gUJRh3GYDwJF2xPs=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 16:59:13 +0000
Message-Id: <20200123165913.28403-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] plymouth: fix usrmerge
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
X-List-Received-Date: Thu, 23 Jan 2020 17:09:08 -0000

From: Stefan Agner <stefan.agner@toradex.com>

When usrmerge is enabled plymouth still tries to install to /bin and
/lib leading to the following build error:
ERROR: plymouth-git-r0 do_package: QA Issue: plymouth: Files/directories
were installed but not shipped in any package:
  /sbin/plymouthd
  /lib/libply.so.5
  /lib/libply.so
  /lib/libply.so.5.0.0
  /lib/libply-splash-core.so
  /lib/libply-splash-core.so.5.0.0
  /lib/libply-splash-core.so.5
  /bin/plymouth

There is a configuration flag --with-system-root-install which controls
where the binaries get installed. The flag is currently tied to the
systemd distro feature, however, this seems wrong.

Use the flag to control where binaries get installed depending on
whether usrmerge is used.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
index 305977e5e..8b71c2bd6 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
@@ -26,7 +26,8 @@ SRC_URI[sha256sum] = "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
     --with-logo=${LOGO} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge','--without-system-root-install','--with-system-root-install',d)} \
 "
 
 PACKAGECONFIG ??= "pango initrd"
-- 
2.17.1


