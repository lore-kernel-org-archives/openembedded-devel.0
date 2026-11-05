Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5093.1793909173997087841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Utdhm5Bh;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so33302c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 12:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909173; x=1794513973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzK/GcssTXrpUDQaCDfhx0bFanW0XUz8u95RSnWXkYE=;
        b=Utdhm5BhMkF5t9BbxpNP3QaJnTVxP1H1qCGKA7SEZyXXys9aimaONVda7CfjBf29z8
         cwiexuaDtswNtXEFj1Io+ZI8OZ3EQqT5xmIS90IH8k2ZJxq8/UFiirObFcdhyygs7/01
         qMwjSmieVCbeoc34KuAHe0nookc897NFX3v9+ppINWowM2dguupdjbxqF5GcWhtKLcM3
         ZaSB5AatAfilAr4emKmrKOfbVWYHa7HzhHNP+elQE2GnohHhr1K2q1pY2IGVR7fsu0Sy
         5UQGHKHhmulZNAoUsNF/aRXevqUfGX1IAVcQKvjENpC0W1FomswQYE+OKq1atsE37cfV
         CWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909173; x=1794513973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzK/GcssTXrpUDQaCDfhx0bFanW0XUz8u95RSnWXkYE=;
        b=UtbA1TbVJWdp22w18Vc0vmWU1HyX1RcISR5WduxmfhmFYdoCSuYA1DiQczHQHpZnj/
         Md4x/wAqqRu/qrIsfj9jOvdr6a9hqTman6SZ0zp3Wi1CyizeZER9QkGE5YsN/74ggN7m
         QmhUJIh52ac+PASBKGgWYFuIymuinXSIKEZAXLN65+woIv9hrF4HqduAx1VFDC+GzV93
         833ts/3PA2KjXb2ScS9dwyDa3GFOLZR7KVAEUJY8YbUc02XpPdCJa/8TfzX7f+prlG4n
         qLsl6Ea4KW5Zubrvn+bww7qQ2mm/QrO319pQbSTFJYtW4a+IG83R3PxjHMvLmfZ6d391
         Z8jA==
X-Gm-Message-State: APuU4Z/Jo7YH0hRzEpROLuupwFyJJjDSj2AE9ZcsxBvShob8U2lc6/NC
	zk9zz6fw7XmU/7sZ8/nUNEPHLBw1/6dzxTR0oCGSmvufVM473mcAU3vHlVLuPg==
X-Gm-Gg: AYBFou1J5LJMnp6yYRmnX1NQeoU4HU0R32kRfMUbev2saHK5lASQ0QmCKbRPewLXtQm
	gassqf0aYTyauNuIgpByjWeaaX05VZbegNbUoWzL78zm+3DgEuZ9FfKSNMOAUj1iagkwLvg7i32
	7aiimaevyAcfb06hg4dfhZ9bIGBkitXfyA3rA30e13ItH3KR/huA4oqKBjFMeD19/28EZdrRjWE
	sguUn63aaPqkVdoHnrhq3q0Gl8cX9wL3Uq8sYOnVQbtHW0kokAgZ8xeksxTiH360hGJMDRYdBBJ
	W70K+hE6tZlbe2sfp4DxH5gAkCfI62VFpZ+6PCdaxw30Gp/RTHKR6EkTlv6acCUaBvvTwPbfwZW
	2/22A5cjwdSWNSDhhxHHEotm0exCb+tdxj6S4OrRXEvJ/z+JYolPk2s8AiSgrqX4j5+X4sYvf21
	5aTzx/BdkuT0kYKdaa1LPY4OIfiesQVn+xaPCqyDDAW59Ak13YnOjkZ3SzOOAy3ts6nHh+i3oo6
	OYO/68vH8Y/Iby/uzfbaoo/+tv5exkC7cP3fS3vmffBghR9DQqRvOMqZRCs1pw4PK67DVgPzwn7
	RT6N9feAjkIXTjiRDynQJnTT2dVg2zn7C+lBUZq6P7VXUVeeTcHeFfrH5Xe/gQ==
X-Received: by 2002:a05:701b:42d0:20b0:190:b2de:1549 with SMTP id a92af1059eb24-1b25d294017mr109945c88.1.1793909173255;
        Thu, 05 Nov 2026 12:06:13 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm21837691c88.22.2026.11.05.12.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:06:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/9] libgphoto2: patch CVE-2026-120451
Date: Fri,  6 Nov 2026 09:05:51 +1300
Message-ID: <20261105200552.81303-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
References: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 20:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131936
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120451

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-120451.patch  | 43 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.34.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
new file mode 100644
index 0000000000..7addb4d566
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
@@ -0,0 +1,43 @@
+From 5924549b4750f0b17369f82e98959b779880400a Mon Sep 17 00:00:00 2001
+From: TheProtagonist07 <63047129+TheProtagonist07@users.noreply.github.com>
+Date: Wed, 28 Oct 2026 18:51:05 +0530
+Subject: [PATCH] jl2005c: reject an allocation table that does not fit the
+ buffers
+
+jl2005c_init() computes alloc_table_size from the entry count reported by
+the camera and then reads that many bytes into the 0x4020 byte info[] stack
+buffer and copies them into priv->table[0x4000]. For nb_entries >= 1022 both
+operations write past the end of their destination.
+
+Return GP_ERROR_CORRUPTED_DATA if the table would not fit.
+
+Addresses findings 1 and 2 of #1326.
+
+(cherry picked from commit 6a3393dd996502457ab965432cf0b2035278825e)
+
+CVE: CVE-2026-120451
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/6a3393dd996502457ab965432cf0b2035278825e]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ camlibs/jl2005c/jl2005c.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/camlibs/jl2005c/jl2005c.c b/camlibs/jl2005c/jl2005c.c
+index c447a2300..12c106acb 100644
+--- a/camlibs/jl2005c/jl2005c.c
++++ b/camlibs/jl2005c/jl2005c.c
+@@ -144,6 +144,14 @@ restart:
+ 	alloc_table_size = priv->nb_entries * 0x10 + 0x30;
+ 	if (alloc_table_size%0x200)
+ 		alloc_table_size += 0x200 - (alloc_table_size%0x200);
++	/* nb_entries comes from the camera. The table has to fit into the
++	 * local info buffer as well as into priv->table. */
++	if ((size_t)alloc_table_size > sizeof(info) ||
++	    (size_t)alloc_table_size - 0x30 > sizeof(priv->table)) {
++		GP_DEBUG("alloc_table_size 0x%x is too large for %d entries\n",
++			 alloc_table_size, priv->nb_entries);
++		return GP_ERROR_CORRUPTED_DATA;
++	}
+ 	/* However, we have already just now downloaded 0x200 bytes, so
+ 	 * when downloading the rest of the table we correct for that and
+ 	 * just download whatever remains of the information block.
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
index fca158fe11..488364b542 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
@@ -12,6 +12,7 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
+           file://CVE-2026-120451.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a"
 
