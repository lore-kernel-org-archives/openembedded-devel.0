Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10669.1794762003037207887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RS+bD0J8;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so4506349eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762002; x=1795366802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hXSVkxkZtDWYXHp1zqZNRqbzz5/mBBczlIv1iT6WGo=;
        b=RS+bD0J8DNTocNTupk7WA0wy8QCKLI2eXBqyNThz3kS9B7bjdFEiESwpVdWI+Kd4En
         IKOwotTnsUZ2xzzEeUCirf0oD/dYMUBzv8V/2XNkv5ByujGTuRm9++/VyDyeG3JPMtyv
         IRngNFypf8YecN0lsD+uxQ97NNIkYkYSbcYTXZkKaYS8NnFFnI8/Wy4IbN0n7rXV1Xze
         KBUUhni4FltnzQEI3eLZlsghli/4ZDjTvq6jZP90QBEB2JrFdYUzNBahmVAWGiClDyPM
         9wngUw5wQdF+ePrVrQ5h5bummzF2yhcGBoYySTmvAtpd+0+TV1pBbtlaE4evL4JCC9Uj
         6tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762002; x=1795366802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hXSVkxkZtDWYXHp1zqZNRqbzz5/mBBczlIv1iT6WGo=;
        b=jbvBv5Fv4623KLELdbF1ZyCBw2LOBMle6GFgnD//qkx+oyEalE+bS6nosWU3KMBbtB
         rxECCja90v/iD1U4Jfp60Na5eAV+LKU4d88oCS7MWb3sossGVZg0yRp32FmElBXAJGU2
         nLrirjecR8y8h3DVCaifeaYOjRnQ8/7+1c6ug9eJ+a68vTYxHlKQrN6XSTglcEu8KChp
         rr2Ykbyv9K2j5v/5B/E9ozcQH06x3hZCTdX9b95yd/7Id8rf4p6tYnoukfwks1H1yeQq
         OUXeowqGIt2GVqSa/MDokYbU+GFLTuBlbc8iINY9fpYZI5DPwFAyUgYJfIEX8i6JIpU0
         UC/w==
X-Gm-Message-State: APuU4Z8uC62+jwWnz2IL5H4+IPnFmK3rmDSUq99nD2DhL8IOfY+9uSlK
	1rpvdL9sxjzdi8VpaRvPOu/v1v4eYm+Qeuy8aXqm1w6FdG3rNWVzzBcZ3/uHLNt2
X-Gm-Gg: AYBFou2g1EdfNn71LGRYthG1Xn4la3QjYiaYzAxuDjPMdB1pl8jtAQPyj6Gk9rwrHeJ
	tfuVHh9zt1MuVc8HDIozlJNhO6CxI5emc17Pn07EAQrhv45MLlNjiNSg1e4cjD3sZSTgRlEepku
	NOHLI26WsjjsgDCDoLYCN09ILEJZexQEHg1cDRK9soVxUnxSADD+c1oC9P92W+FQTZyeNCrvpG3
	TPsIazY2LHQpnMxN3zDkyhc/VwrGl9AyvXq7Gy37jDS8BM9wTD8GERha18bmXuPQn5IdhDJ6bLN
	r7kgvtOL7LolIxm2LkHOEGzQrOVQtv8CgR4XsEfFv/Q9hUS4kn8UOHQNYP//VzIoIE3lJXQJZ+8
	JoaVi/+xtFZRbjN+y8G50U132u+rrYy9wQ2c/JKLBRrUTD2zj5LIGPbk5Pk615VWV0cSAdDDcin
	0Bo1SYmV4oKnXvCmq2TIuEAT5gcendZb66fWWEkQn1X3lGaMkIKE+0LoVQjz0wecDzjfUC1WYZi
	nJZ/HTf4l1xInwBUriCfDPRQympLwhsZcQetlDjn9P90OB9oMC+NeFeQnK+vWle9IdCgiBxK1xB
	/idOx9TDXeQKCJA8RBJq+Zy7lpDDO2rzYVGVAH3I33dkkMa/x0VTHZVPUGd0p4hulH9385BCO8k
	WBC/mPf8HWEg9Ju1CWvUUkv+wBs3bSfVbOJnRYxI1P6YdAdCmlxv/HsTyYhaysT0zQPxaviclTK
	l9mucSgVpD+PFENnYKGO5jU71QJMVwxJrS26bu4BdlBuSZBzWhUZc6LXqf9LCek8BbKetJHbdxh
	XpP/KfzYXemZ7NxKqRzbeUPvtq7FVITnYpoiTle+/pAeH7cbFer2Il0lcraAJJj2k9p/ub+wOZt
	9Zft
X-Received: by 2002:a05:701b:2044:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b5031152c3mr8426061c88.28.1794762002209;
        Sun, 15 Nov 2026 09:00:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 03/15] faac: upgrade 1.29.9.2 -> 2.2
Date: Sun, 15 Nov 2026 08:59:42 -0800
Message-ID: <20261115165955.3485789-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132369
Content-Type: text/plain; charset="utf-8"

FAAC moved to GitHub and the meson build system. COPYING is now the
LGPL-2.1 text and the source headers say LGPL-2.1-or-later, so update
LICENSE accordingly. The library soname changes to libfaac.so.2.

LTO is disabled since meson defaults it to on in this project.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/faac/faac_1.29.9.2.bb  | 27 -------------------
 .../recipes-multimedia/faac/faac_2.2.bb       | 25 +++++++++++++++++
 2 files changed, 25 insertions(+), 27 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
 create mode 100644 meta-multimedia/recipes-multimedia/faac/faac_2.2.bb

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
deleted file mode 100644
index 1663548b22..0000000000
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
-SECTION = "libs"
-LICENSE = "LGPL-2.0-or-later"
-HOMEPAGE = "http://www.audiocoding.com/faac.html"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
-
-LICENSE_FLAGS = "commercial"
-
-inherit autotools
-
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
-"
-
-SRC_URI[md5sum] = "2b58d621fad8fda879f07b7cad8bfe10"
-SRC_URI[sha256sum] = "d45f209d837c49dae6deebcdd87b8cc3b04ea290880358faecf5e7737740c771"
-
-PACKAGES =+ "lib${BPN} lib${BPN}-dev"
-
-FILES:${PN} = " ${bindir}/faac "
-FILES:lib${BPN} = " ${libdir}/*.so.*"
-FILES:lib${BPN}-dev = " \
-    ${includedir} \
-    ${libdir}/*.so \
-    ${libdir}/*.la \
-"
diff --git a/meta-multimedia/recipes-multimedia/faac/faac_2.2.bb b/meta-multimedia/recipes-multimedia/faac/faac_2.2.bb
new file mode 100644
index 0000000000..20d014bb3c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/faac_2.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
+SECTION = "libs"
+LICENSE = "LGPL-2.1-or-later"
+HOMEPAGE = "https://github.com/knik0/faac"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://libfaac/coder.h;beginline=5;endline=13;md5=75c08ee73fa8cdd35281fdcbe8874ff5"
+
+LICENSE_FLAGS = "commercial"
+
+SRC_URI = "git://github.com/knik0/faac.git;protocol=https;branch=master;tag=${BP}"
+SRCREV = "6acbe23ac9318d8f731ef38e0a56365f70af4797"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Db_lto=false"
+
+PACKAGES =+ "lib${BPN} lib${BPN}-dev"
+
+FILES:${PN} = " ${bindir}/faac "
+FILES:lib${BPN} = " ${libdir}/*.so.*"
+FILES:lib${BPN}-dev = " \
+    ${includedir} \
+    ${libdir}/*.so \
+    ${libdir}/pkgconfig \
+"
