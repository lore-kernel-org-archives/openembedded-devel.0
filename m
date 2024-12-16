Return-Path: <miroslav.nagy@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C794E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 11:44:39 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.54800.1734349471060975720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 03:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.nagy@siemens.com header.s=fm2 header.b=czu2C9cx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1328341-202412161144279e031c6eb2adac2c51-l1fjws@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202412161144279e031c6eb2adac2c51
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 16 Dec 2024 12:44:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=miroslav.nagy@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Caey4q+FZj2TmyPrJN6J37xp5jpo8tdkwiujPzs5Njk=;
 b=czu2C9cxsCXCBPJV87H38dGLXtc0bbOwehN6qBpp1CYLA7bIe4BTMzWBdUzHlylPBI1ShZ
 Knio+ssMOjNqTI8IHThsNUX5uc0Tn98xRkVHA/Cxos3tkpE5V8P5t6fJfWa/3RK8thJzGzng
 R7viJ7vgyk/Z+t0yA3TSVysTdDh92zSwC9O6wTadpjDGRlQbtFDqB+cfjQTRV8Y+9723ev3a
 gFBfSRMVVt9tGDN3x2kXswpCI6mcSGkmPszBtANrIOnBtpPJDUJWYBWRM/9Sb/Pg/XPGBUJV
 dZrqtSmLUVRLy4pX5LNJIzzziKQHpuDgBxFnCe1qE7A3YFU3qkr/jzVg==;
From: "miroslav.nagy" <miroslav.nagy@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: "miroslav.nagy" <miroslav.nagy@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] 7-zip: add new recipe
Date: Mon, 16 Dec 2024 12:43:49 +0100
Message-Id: <20241216114349.125642-1-miroslav.nagy@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328341:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 11:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114331

From: Miroslav Nagy <miroslav.nagy@siemens.com>

This recipe should eventually replace p7zip recipe.
p7zip is very old and not updated with unfixed security vulnerabilities.
Using real upstream package should solve this.

Signed-off-by: Miroslav Nagy <miroslav.nagy@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/7-zip/7-zip_24.09.bb | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/7-zip/7-zip_24.09.bb

diff --git a/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb b/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb
new file mode 100644
index 000000000..6e8d0ba77
--- /dev/null
+++ b/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb
@@ -0,0 +1,28 @@
+SUMMARY = "7-Zip is a file archiver with a high compression ratio."
+HOMEPAGE = "https://www.7-zip.org"
+LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & unRAR"
+LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=b0d181292c99cf9bb2ae9166dd3a0239 \
+                    file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
+                    file://DOC/License.txt;md5=8bfe22e0285a3043b61ea408d234c55d"
+CVE_PRODUCT = "7-zip 7zip"
+
+PV_WITHOUT_DOT = "${@d.getVar('PV').replace('.', '')}"
+
+SRC_URI = "https://www.7-zip.org/a/7z${PV_WITHOUT_DOT}-src.tar.xz;subdir=${BP}"
+SRC_URI[sha256sum] = "49c05169f49572c1128453579af1632a952409ced028259381dac30726b6133a"
+
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE += 'LDFLAGS="${LDFLAGS}" LFLAGS_STRIP="" O="${B}"'
+
+do_compile() {
+    cd ${S}/CPP/7zip/Bundles/Alone2
+    oe_runmake --file makefile.gcc
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/7zz ${D}${bindir}/7zz
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


