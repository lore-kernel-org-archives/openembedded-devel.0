Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEEAC5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24401.1786747630364763364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=efgEIy4j;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1466704a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747630; x=1787352430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAX6kjqWkL1ywycTyZp5NAuEpperXQ5nR9LcJmz8nz4=;
        b=efgEIy4jWMR+luYX6uB2nwuEJ2n/Jz+XU4DJzzePuhibpbDn3LMXbjznLttVXTLvUy
         eePe5PaAE86rDh84NWxVb9Pq/+KabJSWbTxrNWuBOKGzK87LtytN0l7Nm9DrB2FpMTPk
         BVJOBL3qkX20nXELdcF6rbFJ0o14VmiQzIG6DdvS0C6jqiTxNpUtKAW8yOej8CgPTIsm
         Pyo0jgYX5/zubpNjJI+ZuPJO7kTSCGNlKG0Yx82TREUCzWLeSLarh2IznL20HL8fRiJu
         p3cs/vrfypw+uoFKiR6NWexOC5+qAk0HhLQLA89m1YXESIzLUUGyKYxGaIMr6ijDcvAR
         /mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747630; x=1787352430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAX6kjqWkL1ywycTyZp5NAuEpperXQ5nR9LcJmz8nz4=;
        b=Ujz4PxzpSD4/fiKNP+frBibK2wA1vLSX7xCtHkmbdOjPLi0cwHTNPhIPq99BjOAYSl
         W3BmWaFXX0U9v+01+bp57eIVcc3ONHfpumS8vZLXWEvO7QsNjCMDNkg+785pschbHc3D
         kbt3/qMsAOGzeUtbhC6g9B8nF9C4h0Jxk80rx4zd5YPnS8eqq7z/ycfpz8j1xO21lHns
         T/j8W1DVx6ZdTbi5IREYAMp+sVX9wEK6B8DaqQw+5q3Di1ck99kpcO7VjZxXYFKmrTch
         wNUqXiE+RQmyanayfLSxguAFP3fHD5QAjRS7DH8/rVNSs8UVKjuRwKccmyT1eNakYVgO
         0lcw==
X-Gm-Message-State: AOJu0YyoyzMhIA7Ry8R0/diZ8mdU4+ug8ulKWFfW2CWFhLm0VTcz8gab
	mS9nHBUTirkKjFfXPcRKulqLWxoteYi+JsXZzGatQCM3ryqfVAcsyyRCyKav9Pcv
X-Gm-Gg: AR+sD10h6YpiDOGiuw8nIrGyXQQSdkev/zr82cCbcvFIsJWf52RWIjepwEDFDkR020x
	VvNAz3Ljs8ndLEldGx/qDkqAj9yRoY+Ax16aucsPpMJi5oLdxEQRxDJpYN1YbxTuCPhxepoI1WX
	2d0tpbLb1HqffNroyrz+nnPS/ySfjBsJbmWmPoqKwOSZC/bY7Wy3AIiGG/JQMvriXigO3nm24y4
	GxE3kE9brEqzBrUqSecT5W+uIYEAupQQyXLlXgOSuojYgP4zGrBzIsWZTTjR/aJIyipb5nCG+Zd
	l5lzmWPUBnuIB8Y/VOjtyyxxw72rEBV6MZSHySsxr7eiVNsVtMveNA0GU3bvZIVNfnyFQfonWXj
	0apdWF3U4AJh+U+j4MtCq4/S1HKixH0DrUB9NyxJwQ2slLcyrxYvhUTbcsS/1/zltJuSjI2wCkn
	XIN/tUPHmHRoL/E+sE2zIPuH0E5SUPAiyLkA+DMDBhDNR7h3AuVaHbn/ip+spnUym0+2euzwUw5
	FQTETS2zrhrNVO2MQZST5Jo/EJxRNnQvmONwQXOcA1vOR+JL0hivLDGzoaeGc7Y5oIPjF2SxdBn
	OAM7Q7mtNz9xzPSBUchrpPeNXVE4rVVb51khCMl2p3uvi1/zDElLgfmkjU218aa/b150QfuCVnp
	Lfo2F6btjO6NpIt3yFjxZ5HlghZttuzUuO55sKH9BAqv8wQ==
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr11018039a91.19.1786747629632;
        Fri, 14 Aug 2026 15:47:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 077/109] minizip-ng: upgrade 4.0.10 -> 4.2.2
Date: Fri, 14 Aug 2026 15:45:03 -0700
Message-ID: <20260814224539.1523174-77-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129141

Minor release. MZ_PPMD (new default-on feature since 4.2.x) git-clones
ip7z/7zip over the network at configure time via CMake FetchContent;
disabled it, there's no network access in the build sandbox and nothing in
this recipe needs it. do_install:append's post-install sed also needed
retargeting: 4.2.x renamed the generated cmake config file from
minizip.cmake to minizip-config.cmake.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{minizip-ng_4.0.10.bb => minizip-ng_4.2.2.bb}     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/minizip-ng/{minizip-ng_4.0.10.bb => minizip-ng_4.2.2.bb} (73%)

diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.2.2.bb
similarity index 73%
rename from meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
rename to meta-oe/recipes-core/minizip-ng/minizip-ng_4.2.2.bb
index 2e7f438821..84ab08e981 100644
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.2.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master
            file://run-ptest \
 "
 
-SRCREV = "f3ed731e27a97e30dffe076ed5e0537daae5c1bd"
+SRCREV = "7b2387161c542fa9f427352dcdef76097d0d692b"
 
 
 RCONFLICTS:${PN} += "minizip"
@@ -19,8 +19,12 @@ DEPENDS = "xz openssl bzip2"
 
 inherit cmake pkgconfig ptest
 
+# MZ_PPMD (new default-on feature since 4.2.x) git-clones ip7z/7zip over the
+# network at configure time via CMake FetchContent; disable it, there's no
+# network access in the build sandbox and nothing in this recipe needs it.
 EXTRA_OECMAKE = "-DMZ_FORCE_FETCH_LIBS=OFF \
                  -DBUILD_SHARED_LIBS=ON \
+                 -DMZ_PPMD=OFF \
 "
 
 PACKAGECONFIG ??= "zlib ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'test', '', d)}"
@@ -30,8 +34,9 @@ PACKAGECONFIG[test] = "-DMZ_BUILD_TESTS=ON -DMZ_BUILD_UNIT_TESTS=ON, -DMZ_BUILD_
 
 
 do_install:append () {
-    # remove absolute paths
-    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/minizip.cmake
+    # remove absolute paths (4.2.x renamed this generated file from
+    # minizip.cmake to minizip-config.cmake)
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/minizip-config.cmake
 }
 
 do_install_ptest() {

