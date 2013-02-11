Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U52Rk-0000Ja-9F
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 00:06:05 +0100
Received: by mail-ea0-f171.google.com with SMTP id c13so3008924eaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=anRGAeEJoFjPzL7MnRABMJCOfF+vdKu9IuEw2EYzftE=;
	b=gV2abP559/850NZZL5ND+Nia28T+Ewb/mLFly6pnaAZ9igqb/DidJCev7BjFrlRE70
	DYwPm8PSY7z4nP1/nDYvyHAZidSE2wXwc7fKNDKKhsYhHzbzh3g4gHzMzJmE6GVj02O+
	dvfMC3XI5G44i1qCw/VzNXBNVLCK0ptEM7lbaUlVJjQ+nAWy1Vjt9iwaPllbzCDekuNV
	Y0K26gWmdEwjuHLGV3p8zwYdsPkSv1iGMS0sCqahYWiAJAWIr6GEyRMIXzIE/cZZWehh
	u6Dz+aRA033SrpXlFfihyvwTaz7lNiER4OoKn3V1Pxd6v05yD/StQyVLpStb/aIBKf3V
	zpsg==
X-Received: by 10.14.183.67 with SMTP id p43mr54858700eem.10.1360623001988;
	Mon, 11 Feb 2013 14:50:01 -0800 (PST)
Received: from localhost.localdomain (p4FDF102E.dip.t-dialin.net.
	[79.223.16.46])
	by mx.google.com with ESMTPS id l8sm30910395een.10.2013.02.11.14.50.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:50:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 23:49:38 +0100
Message-Id: <1360622979-16426-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 2/3] update-fonts.bbclass: remove - we now use oe-core's fontcache.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 23:06:06 -0000
X-List-Received-Date: Mon, 11 Feb 2013 23:06:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/update-fonts.bbclass |   40 ----------------------------------
 1 files changed, 0 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/classes/update-fonts.bbclass

diff --git a/meta-oe/classes/update-fonts.bbclass b/meta-oe/classes/update-fonts.bbclass
deleted file mode 100644
index db2e814..0000000
--- a/meta-oe/classes/update-fonts.bbclass
+++ /dev/null
@@ -1,40 +0,0 @@
-
-update_fonts_postinst() {
-    if [ -z "$D" ]; then
-        update-fonts
-    fi
-}
-
-# the same but keep it separate for now
-update_fonts_postrm() {
-    if [ -z "$D" ]; then
-        update-fonts
-    fi
-}
-
-python populate_packages_append () {
-    update_fonts_pkgs = d.getVar('UPDATE_FONTS_PACKAGES', True).split()
-
-    for pkg in update_fonts_pkgs:
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
-        if not postinst:
-            postinst = '#!/bin/sh\n'
-        postinst += d.getVar('update_fonts_postinst', True)
-        d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
-        if not postrm:
-            postrm = '#!/bin/sh\n'
-        postrm += d.getVar('update_fonts_postrm', True)
-        d.setVar('pkg_postrm_%s' % pkg, postrm)
-
-        d.appendVar('RDEPENDS_%s' % pkg, ' font-update-common')
-}
-
-python __anonymous() {
-    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        updatefonts_check = d.getVar('UPDATE_FONTS_PACKAGES')
-        if not updatefonts_check:
-            bb_filename = d.getVar('FILE')
-            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits update-fonts but doesn't set UPDATE_FONTS_PACKAGES" % bb_filename
-}
-- 
1.7.4.4



