Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4F46C397
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 08:42:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so4812756wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WIIfS6PQAghtoS8J/q8aTsZvvfjmIjib4DSBSsFmo4s=;
	b=EdvcAii2fgmu1n4lPuv8uF9J+LYAbiQWYthbETMt43PrdNS9WL2NpKzSsvJaBoYZ/s
	u8orexRpLxMEfd5XzatADbBmK9hE2iT7RnTdb6wBjrKxOBlCyJT7VUcPmqNgLxQUPSkO
	Q6rpBehheEt0qmdPTcc7cNYNv9gUwTSmTp9qf/PvixgEZ0lqG1OKsl6yrhWERYd6mDsx
	ij8oPpFpuhJekYhQ0wNQp5x48IyGK70RZxJmglLvALwHE858Uovew/u6PM5q+e6NzU7T
	Toopk62P6S3bC1K8x72NbWfCuVi4u/J0SqTvG50PnqAs5HiFIy5hdDF5dIqiNbWqDiAm
	wcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WIIfS6PQAghtoS8J/q8aTsZvvfjmIjib4DSBSsFmo4s=;
	b=j5zDm0GgP4mXbV2Leatjz6u4kzUEP4eE11+HkAKK6FjFmtIsk0dLB1IcKP6DLp1ZUd
	T7ow0vZQWbnpLF5KwiaVnsTMW5qDxNmsiypnn9l862ouKazSOsuN2IRMjKnGqgy1n+i/
	vPF8YXsxJlc7rT1iTg2H+hKhv0jXx3X2+ePKFZ3Qbim7DxtfCPRG5Cs1k1/S7yoqTZQy
	34mh5YrPaWdx0PfyhMlQi0CaGlUsRp3y7laQDX1BdvvW3XK2I6Hn4mEVjUZQnsjWotJE
	BiDxk67eaeFeJOyeKw08DRbjSb1WEFUOj5ADCiuieJWpAHu/GpvxeZqHDYm27zvfGGU2
	Q0UA==
X-Gm-Message-State: APjAAAU9+pLYI36wMK/G0c4zgYPg1bP7CNWAccqe7d45btgJFEhNxw9W
	VBJZ29+SROmmEA4EXFXTKfdeSAmzFqQ=
X-Google-Smtp-Source: APXvYqxeqSj57s1RTt9rZ6CzQFhPGVwWboqBg7RqS1oSxHgPartKqKvvbpQXobnzqmz/lup7iokusA==
X-Received: by 2002:a1c:a909:: with SMTP id s9mr2857515wme.20.1562834542894;
	Thu, 11 Jul 2019 01:42:22 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id 4sm7853621wro.78.2019.07.11.01.42.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 01:42:22 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jul 2019 09:42:19 +0100
Message-Id: <20190711084219.84500-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] iwd: update to 0.18
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
X-List-Received-Date: Thu, 11 Jul 2019 08:42:22 -0000

Also add RRECOMMENDS for asymmetric crypto modules.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../iwd/{iwd_0.14.bb => iwd_0.18.bb}                   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_0.14.bb => iwd_0.18.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.18.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_0.18.bb
index 1dfbed9fd48a..f56c88b821e1 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.18.bb
@@ -7,7 +7,7 @@ inherit autotools pkgconfig systemd
 DEPENDS = "ell readline dbus"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "f87159964cf8fd9f85b0699d50e4a051d4f7c948"
+SRCREV = "c923448bacf8a855b40017fe53ba2edcd062eec1"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
@@ -26,6 +26,12 @@ do_install_append() {
     install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
 }
 
-FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN} += "${datadir}/dbus-1 ${libdir}/modules-load.d"
 
 SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
+
+RRECOMMENDS_${PN} = "\
+    kernel-module-pkcs7-message \
+    kernel-module-pkcs8-key-parser \
+    kernel-module-x509-key-parser \
+"
-- 
2.17.1


