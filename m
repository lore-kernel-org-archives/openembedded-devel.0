Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0251F72F39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 21:04:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s186so5853575qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TokWpc5tdezXuoVI6ucaKIt/KF4rSbBO9ccPBbFg4jE=;
	b=oTkeU7ZOFtDOu8nh8oPjb0/0b7VqCwHSbqyRC9J3ytefHhKrNbZyO3fhJqYct3d/Vc
	H2e1gsc8zlI1wcX7/aY34IfJo8DaPzgEy6zHhZkImLYB1AHek8bpIb8r2kzBRTKcBzMO
	WD9IqEVLCDT64BplQoZublVrfi7+xgE4x1ygxcFbuS/GvP/Z/GpLKL/CseqJvBBFz1nQ
	zy5fM/eDDztdEdn8hjvCEMA4kE1RIMjvaMHdCjSfUSXPfWMtcl6Ee8l9nYNx5y+dHSYr
	3EPAiGnSFMw2IjCWxAm2Q7JT5cfmwLE1P9WsmVQLcXmvkcfAspMgr9ozrT5kxj4Fpti9
	EAag==
X-Gm-Message-State: AMke39mS/DI6qkC5tnPfwpoY+l/JF+H+R18D8otGR+VKOuYUiyzU4rpmXZp1sIXGcHb5zw==
X-Received: by 10.200.45.135 with SMTP id p7mr5258518qta.141.1488315874961;
	Tue, 28 Feb 2017 13:04:34 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	q66sm1734554qkd.69.2017.02.28.13.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 13:04:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 16:04:17 -0500
Message-Id: <1488315857-20167-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCHv2] efivar: unblacklist package and those that depend on it
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
X-List-Received-Date: Tue, 28 Feb 2017 21:04:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 4 ----
 meta-oe/recipes-extended/efivar/efivar_0.24.bb         | 5 ++---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index f2b9454..b25cfca 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -25,7 +25,3 @@ EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cf
 do_install () {
     install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
 }
-
-
-
-PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
index 4c7793f..be04def 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 DEPENDS = "popt"
 DEPENDS_append_class-target = " efivar-native"
 
+inherit pkgconfig
+
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
@@ -40,6 +42,3 @@ do_install_append_class-native() {
 }
 
 BBCLASSEXTEND = "native"
-
-
-PNBLACKLIST[efivar] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132821/"
-- 
2.7.4


