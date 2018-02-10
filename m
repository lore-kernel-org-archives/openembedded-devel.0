Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A162E700F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 14:12:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f18so13861767qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 06:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nGqrQdDfpwF/ELK4psxLp6IfJ7CrYrKVfv4i6+sf+G0=;
	b=S/hC135sLj1W/EVuO+N09O/LBfoqi+d6cwGGvzq7jKzSrpw6rlH5F4SmZJfxM67MfR
	3MBQS2bGh8xl/jK7g9dsC2U/9CH+pU/mj4+4rhp+KFhGyh64zRhzwX3DycKLXLPN1+a6
	jy0qkFzWCedyDesh9hKo2ODFwMdX6OICf7gYfGfpSvXbRpU/iSTk6qHPFV8RnKPvX/XZ
	fyq1PnvTnwiyFcSSDi4lg0/VgczoYAOpzlpoCpgRa0xvPWtyMCKqOM4GMlxmze7uFVuZ
	nrcTdGcJGWMqocUuMATaXKbDn/iYM/56T9+MiF7ChrxNvNWcuSVTuSjRYKh6tMIXbzDs
	3AKQ==
X-Gm-Message-State: APf1xPAyDJY1U+YKXiw2UXkDaZfArOrd3wGpKlg2c0hNhjELHqLofZj4
	IcAgb++KsGa/J8gQcVSByDOnOveL
X-Google-Smtp-Source: AH8x227CCuyAQ4+s68G9/8JW1aX9tR4Vm/3D0GCHX2JX57nrHfex8yMokOF6it2zRT+yeMHtfX7byA==
X-Received: by 10.237.37.168 with SMTP id x37mr9768743qtc.78.1518271934279;
	Sat, 10 Feb 2018 06:12:14 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b22sm3620954qta.25.2018.02.10.06.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Feb 2018 06:12:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Feb 2018 09:11:48 -0500
Message-Id: <1518271908-29119-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-smbus: remove sed to replace i2c path
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
X-List-Received-Date: Sat, 10 Feb 2018 14:12:14 -0000

The i2c-dev file is now installed in the standard location, so
the sed to change the path can be removed.  Add a PR value to
ensure that if the sed already ran, the build can succeed.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-smbus.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
index 0bca58f..f472a57 100644
--- a/meta-python/recipes-devtools/python/python-smbus.inc
+++ b/meta-python/recipes-devtools/python/python-smbus.inc
@@ -1,6 +1,7 @@
 SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
 SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
@@ -9,9 +10,3 @@ SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f07
 DEPENDS += "i2c-tools"
 
 S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
-
-do_configure_prepend() {
-    # Adjust for OE header rename
-    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
-    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
-}
-- 
2.7.4


