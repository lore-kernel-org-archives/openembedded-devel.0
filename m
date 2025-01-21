Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D485FC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 18:31:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.23202.1737484306849810641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 10:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5hyliWW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso505775e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 10:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737484305; x=1738089105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/APBb2q/AqCfEO+JT1Q+/Y+2hQMGowRnoBEY08AELk=;
        b=E5hyliWWP5yDOO5ctcjR8tH7fOlVwYOFNC09jc8P2tAxQtlwwDUpMmdmQjpDwdwyE5
         Dicrr9QCK46RuxGDRGL1BWH14zbXf3Qp0uTEj+RurW/8vKsSo5a30y5llCmyzxHCf/gF
         wArWR9gWwj5XD19GWc9N6S1G43z/7g/Lpyoyz6jzIs3ViGa+sggIZzeN1Twb3smGkthP
         GwzCf/ZY2yfNd44ykkx8hmlt2q18ORzRN2+hiyHOEzQbAY+VxrxKJoECPzjKs9f8goUs
         yamHJAf/pDWodTYDF/C48WrmxHckjyukDaoI0xLlp/BCDnBV9AGVinduDuS+2fV0CyuT
         pXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484305; x=1738089105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/APBb2q/AqCfEO+JT1Q+/Y+2hQMGowRnoBEY08AELk=;
        b=NrvGOgCC+8RzdBEh2cWY5YA1hbaJmgi1J7eVxGnoYzQhQv6K1cEfGyamkVk7FWcnwA
         tARL0C5MTdMn0bKsKnxEkfnnkWKVf/Squ8t9iKNpr3sJ5fUF9TshlNBJ5ME0V/8XORyx
         I62JCk34YiH+hzr9TdQYgURyglgn7UjaB13/9lKQ12Wj77QbMgJhJNo0hftoo+2ghdRu
         h9XGv+JSI+pGcCeAmimvkSePQ9d1oPXI9tqT/uBfGY6biScemCrKFnhkxOO37RJEHJxp
         iia7LIgtn/fKbBd2KRe76ZB3Be94AFpdmuOxzAGx0suFARqdpsQ16Kl0lPTbfzFPGK9a
         3rDA==
X-Gm-Message-State: AOJu0YyzswF0VWtypwZBpAPSV8HkEHU5TgdcJxV/rE5GlrmNjg5uoQJ3
	8Av2NqSzxVTqBNafxQf/c8ai8IJBQDqY34KEg02lh5k3d3QeuPMGx0BebQ==
X-Gm-Gg: ASbGncvNTV3OAVhitRAcwrvgUzP3KjLVDowakjXRgHOvzGxnBzDJDumGi2Px1wy4Slz
	l869LZMJo/Jk2xyNuwFCfQzHHQFme5UonzSBKDPeBkERBT7ONZ38iZyDiCTbX3YoX6y5QB1ptq/
	I3Clcec3gB4U9w+uF3rJY5RUsuJWC3Tzv/G1Y4AaGOasj9vtvmOkNZvrsWUX8LCMx+OMPN7ZONr
	uKYbzuIdXwCRMHYQ/rKIWvFrX/GgKFeZpwzmUfrcwL718XFjrpB1jfWPNDj9af1GV/XZn4j+JoQ
	xr8UaRH8MX+tvsJnawJoXKsnZNg=
X-Google-Smtp-Source: AGHT+IElnUYJVzCubf49pX3x5QzL8Zo0pFzLGhbhnHl2YHddptKeHm0UpcLeadmrUreGb3CwIModiA==
X-Received: by 2002:a05:600c:1e29:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-437c6b7b184mr239322115e9.2.1737484304990;
        Tue, 21 Jan 2025 10:31:44 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-437c753cc1fsm252778375e9.39.2025.01.21.10.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 10:31:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: peng.zhang1.cn@windriver.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] lapack: fix buildpaths in ptest also when CBLAS is enabled
Date: Tue, 21 Jan 2025 19:31:32 +0100
Message-ID: <20250121183133.23102-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121183133.23102-1-martin.jansa@gmail.com>
References: <20250121183133.23102-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 18:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115008

ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue:
File /usr/lib/lapack/ptest/bin/xccblat3 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xdcblat3 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xdcblat1 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xscblat1 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xccblat2 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xzcblat2 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xzcblat1 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xccblat1 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xdcblat2 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xscblat2 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xscblat3 in package lapack-ptest contains reference to TMPDIR
File /usr/lib/lapack/ptest/bin/xzcblat3 in package lapack-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index aafcdef681..4845d34106 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -35,7 +35,12 @@ inherit cmake pkgconfig ptest
 EXCLUDE_FROM_WORLD = "1"
 
 # The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the options
-# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfortran does not support them.
+# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfortran does
+# not support them. And we cannot easily change CMake to use relative paths, because
+# it will convert them to absolute paths when generating Unix Makefiles or Ninja:
+# https://gitlab.kitware.com/cmake/community/-/wikis/FAQ#why-does-cmake-use-full-paths-or-can-i-copy-my-build-tree
+# https://gitlab.kitware.com/cmake/cmake/-/issues/13894
+#
 # To address this issue, we manually replace the absolute path with a relative path
 # in the generated `build.make` file.
 #
@@ -46,7 +51,7 @@ EXCLUDE_FROM_WORLD = "1"
 # of `xerbla.f` to a relative path. The steps are as follows:
 #
 # 1. Locate all `build.make` files after the `do_configure` step is completed.
-# 2. Compute the relative path for `xerbla.f` based on the current build directory.
+# 2. Compute the relative path for various `*.f` files based on the current build directory.
 # 3. Replace the absolute path with the calculated relative path in the `build.make` files
 #
 # Additionally, when ptests are enabled, apply a simpler workaround for ptest code:
@@ -54,11 +59,17 @@ EXCLUDE_FROM_WORLD = "1"
 #   the MATGEN subdirectory, with a relative path prefix of `"../../.."`.
 do_configure:append(){
     for file in `find ${B} -name build.make`; do
-        sed -i -e "s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbla\.f' $file | awk -F'cd ' '{print $2}'| \
-            awk '{src=$1; sub(/.*-c /, ""); sub(/xerbla\.f.*/, ""); obj=$0; print src, obj}' | \
-            while read src obj; do echo "$(realpath --relative-to="$src" "$obj")"; done)\2#g" $file
+        # Replacing all .f files found with:
+        # for f in $(find ${S} -name \*.f -printf " %f" | sort -u); do
+        # would be more reliable with other optional PACKAGECONFIGs, but also very slow as there are
+        # ~ 3500 of them and this loop takes around 20 minutes
+        for f in xerbla c_cblat1 c_cblat2 c_cblat3 c_dblat1 c_dblat2 c_dblat3 c_sblat1 c_sblat2 c_sblat3 c_zblat1 c_zblat2 c_zblat3; do
+            sed -i -e "s#\(.*-c \).*\(/$f\.f \)#\1$(grep "\-c .*$f\.f" $file | awk -F'cd ' '{print $2}'| \
+                awk "{src=\$1; sub(/.*-c /, \"\"); sub(/$f\.f.*/, \"\"); obj=\$0; print src, obj}" | \
+                while read src obj; do echo "$(realpath --relative-to="$src" "$obj")"; done)\2#g" $file
+         done
     done
-    if (${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)});then
+    if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)} ; then
         for file in `find . -name build.make -path '*TESTING*' -not -path '*MATGEN*'`; do
             sed -i -e "s#\(.*-c \)\(${WORKDIR}\)\(.*.[f|F] \)#\1../../..\3#g" $file
         done
-- 
2.48.1


