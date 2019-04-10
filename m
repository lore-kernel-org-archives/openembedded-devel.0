Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id B795A7D875
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 01:36:31 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id g7so410456lfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 18:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=nJkTrAOrOSmQOWdfxCq2fcSKsV2W6K/vqOLfnCYZKi8=;
	b=FQ8dfsSD04A9cNMkzoEKd3z7+h7VZIxB0/DLIZO/iVlv939UiWgBpqvrRNR5/f+Y8O
	C6Gvy1f0Ip34HGnOtRJA68GCiTshedZR24W4SAi3q7fEJg3Klt50wwwcOD9AsJKW/2s0
	LVHZaN7wYKTycw8osH2AgVwRKEmL3ZNVn3G/b7wDVZdy3UrK6AkmNNW5oY+wEItFtI9O
	vGS9X/3uKBqD6QGDH1Rjw7rLOZrltCMKY+DTO4BzQnkgqsygwgSMwV0RuSWIWWqIoqt9
	qZ4icgSexFtl8vSi6PkiRT8awEYlB8Olia4de0lr8hoL97iHKsVcql9+D5QPblSeReax
	3I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nJkTrAOrOSmQOWdfxCq2fcSKsV2W6K/vqOLfnCYZKi8=;
	b=LRjsfwFSxTnPXGTPDZjMn+glWwSpGQTON7CrsiWClvsPMtZ+k0mNvmNOoo/AX7azME
	fBAGrsR8rGZANiTYOtRgkKaHM4deKsbD7Sk9UZMUuQZTSNYBVmGCn8Y/yjs+4mHMgIyA
	0kwkdZALPBf26PGE2slee9cL4iFQFWryTADl5huJj+3o/6t+a/Ar7YTDe1MGl/HoErFB
	F7kkXY/s7GQKXYsqyZRxDjDqRpDTZk1Ps622qnCWs4qdRBdbt4zAON5gkyVDXounf5w2
	2DPecor4I6sdkjyostadDaiFbCF0Nc70E6xwEX5Ibbsp4lslz+i5/5/tYmYUuj6rtao3
	GOWw==
X-Gm-Message-State: APjAAAWtrZSTZIaOJHNiIVU2xwoTWCVWAksgfXbxkk4ADYi3nUe0+PjB
	1iB9iGWzCsUUMNebs8zwPmHNmFxbo3w=
X-Google-Smtp-Source: APXvYqwKXCVvs8bIpWhLSz5R7iy7qAM/PHxtjlWmAOC30p0u/zJlWm6ihG+JMA/srgagSgIh+dZmGw==
X-Received: by 2002:ac2:4186:: with SMTP id z6mr22137529lfh.50.1554860191802; 
	Tue, 09 Apr 2019 18:36:31 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n6sm1904363lfh.6.2019.04.09.18.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 18:36:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2019 03:36:24 +0200
Message-Id: <20190410013624.19749-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] chrony: update to 3.4
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
X-List-Received-Date: Wed, 10 Apr 2019 01:36:32 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-Fix-compilation-with-musl.patch      | 29 +++++++++++++++++++
 .../chrony/{chrony_3.3.bb => chrony_3.4.bb}   |  9 ++++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
 rename meta-networking/recipes-support/chrony/{chrony_3.3.bb => chrony_3.4.bb} (96%)

diff --git a/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch b/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
new file mode 100644
index 000000000..17b635352
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
@@ -0,0 +1,29 @@
+From 11ec10cdb5ab4b94c5999e018a9c854419997761 Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Wed, 10 Apr 2019 03:18:17 +0200
+Subject: [PATCH] Fix compilation with musl
+
+Fixes:
+../hash_intmd5.c:58: undefined reference to `MIN'
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+---
+ hash_intmd5.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hash_intmd5.c b/hash_intmd5.c
+index 49da1cf..47efe4c 100644
+--- a/hash_intmd5.c
++++ b/hash_intmd5.c
+@@ -33,6 +33,8 @@
+ 
+ #include "md5.c"
+ 
++#include <sys/param.h>
++
+ static MD5_CTX ctx;
+ 
+ int
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/chrony/chrony_3.3.bb b/meta-networking/recipes-support/chrony/chrony_3.4.bb
similarity index 96%
rename from meta-networking/recipes-support/chrony/chrony_3.3.bb
rename to meta-networking/recipes-support/chrony/chrony_3.4.bb
index 2586370fa..f6898c0b7 100644
--- a/meta-networking/recipes-support/chrony/chrony_3.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_3.4.bb
@@ -35,8 +35,13 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chronyd \
     file://arm_eabi.patch \
 "
-SRC_URI[md5sum] = "81ab62cf5d60b4b3fa8cd2c1b267ffd9"
-SRC_URI[sha256sum] = "0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128"
+
+SRC_URI_append_libc-musl = " \
+    file://0001-Fix-compilation-with-musl.patch \
+"
+
+SRC_URI[md5sum] = "7170e750469c198fc6784047d6f71144"
+SRC_URI[sha256sum] = "af77e47c2610a7e55c8af5b89a8aeff52d9a867dd5983d848b52d374bc0e6b9f"
 
 DEPENDS = "pps-tools"
 
-- 
2.17.1


