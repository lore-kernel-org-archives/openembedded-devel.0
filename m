Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6749.1793913791915156241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UfdQiQtf;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1adbf62dd31so62316c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913791; x=1794518591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diq69kAIacw//G/YXzdwAdhD8qqDVnetdHKiTdqIw5E=;
        b=UfdQiQtfiGKELlBkmHaYjIF7yUjGYBnw1W0w0++gPWYRviYKHOBuAdf1LebjE86YkF
         dVQ9fxm37JPNHSa8nfyrwf9yz17AJkCaftJPZe+ziKr+FYYDJ9AAAZoZ6ufqPXFl6lmM
         LVmQrBaOw8iF1znavy+QGIuhIINlndzy2B+ZNMk0Lt+cjRV5AGxSt/XLDwNVmC2Vb3A9
         4sbmwC8b4xBYsirF5agEHAXypF0jEatUL4qEL2RfNPiXsOa0E9SZ07zy18CNjdhDosnK
         /1S2mRIOO4Y9pBEZq2y3I3H0N4o0QayYx5nPHOETq4g/zgI5aKsJM2+wh7YHF99VNJ2G
         hFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913791; x=1794518591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=diq69kAIacw//G/YXzdwAdhD8qqDVnetdHKiTdqIw5E=;
        b=Cx0K6+i9ME6i1J1Ckxfmkn6YwsNdJrMfuJfHd7YWplNI2Kxndxw0bBMbBVXmINPj/F
         eHpP6UKwOhhcC/V5sCVi3aTRRQKHBjPUt5x1Q7saXtN23tqiqnn93E9xuNWaaKPhmk3I
         5lDJilM5nyci7y60wqFWIbKDCFS0Gk1+R+DLqS13sxfoH4uvlycKip7XO0JLO2G0YClm
         cWEFETNUVyhSNIj70iJ56uSFr+KSnf1yKLZuVqj5fKhqpOKlmi+5odv6E9XpAz2MZZgC
         U+Y/D2f+9GnUepoPL2fDnhHQsLYkXUMB2m3WSf8uFVbYdlu6PH3mm1zuyvhZmp5Denp2
         DzEA==
X-Gm-Message-State: APuU4Z8xrgavROAAxCjvd7z/KC/sWEgFQO1S9AnstKLhieJ6Cs0Bvexg
	itTha0Id6BVctjggEw1F76EknBezABH2B4Oe1IOWi26mptDZy+SFZ0WON2RZ8A==
X-Gm-Gg: AYBFou1LYOQBrvCZA30X65pT3EaKF5KJ2ihsG4wWJIis3d2IWrSHM3kqTWiM6X9XdcP
	Jmf83X6C2yHMV3g4htTStDurT2+t4Y2QmB5hcjJVK7lgmK440hbJ9HjJdgOCyteuagydCYqXu3w
	MvP6NH4P8xDo/OFMlI02HFqO5+R7qJhoqlGxi3sfv8UgyGh1wxQWR1A6egIWa9nQ3xu9hS+qgib
	bWrAqO2W/qITIBhrfBcEXqM0MeRZ1DGCrI3v582ZQ5bRc1qyqekd4/YWO8nu4uNemnSpvQ7+ytU
	R3uon3cbuHciDLoOw+e31xEZzrlV3e9MtaRmg+gwn+tCQgmHUSb4d4YMpNBG1/q79T1qiv867Oj
	WD8w0lk0x8cALkfWNl2ggteA65Zw/eviPH1+uXZK2dowO3z+/gBZHZUBQDl0fySB8h8K7Fd4/tG
	EYVvTKAn+1sLuKrKZXYh0Q0yGCxsvizJJ0h3+0QLJILm46ijrf8OQCRc6jDAjmwZeAq1kwqkGpA
	oIsbImwY1iXj3d51g4RgvVq4rAxnzt/vna1U30ZrWneIf2StrvMXeBwOTtjPyGww6v0w1PwoGgh
	Uzrh94AxS4pxunddQkHy7x7vsLLM31BnUCnsnrGf+dO1tNtItNbRTVueBNqNVQ==
X-Received: by 2002:a05:7300:f58b:b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36f75e295e2mr525350eec.20.1793913790890;
        Thu, 05 Nov 2026 13:23:10 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/14] libgphoto2: patch CVE-2026-120451
Date: Fri,  6 Nov 2026 10:22:44 +1300
Message-ID: <20261105212250.490188-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131945
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120451

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-120451.patch  | 43 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
new file mode 100644
index 0000000000..bee9033aac
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
@@ -0,0 +1,43 @@
+From 021b03a90b744321bb237f66b1052fea58e91224 Mon Sep 17 00:00:00 2001
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
+index c447a23..12c106a 100644
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
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 04c4786f84..5f1aba6e9c 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40339.patch \
            file://CVE-2026-40340.patch \
            file://CVE-2026-40341.patch \
+           file://CVE-2026-120451.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 
