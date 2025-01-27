Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288ABC0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:54:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.47382.1737968063693823550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 00:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lArZJcCq;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa689a37dd4so840445366b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 00:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737968062; x=1738572862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/APBb2q/AqCfEO+JT1Q+/Y+2hQMGowRnoBEY08AELk=;
        b=lArZJcCqMpbWbJ+KZwYlVNUm/mVsLp2J1JUWu/uyCGhSxrNtcsIfbDSlwTYr9RCkPG
         OfZmx3nxwCf9JBeNHonEDyfjYNWtWbESPStZj4WSrvD5mXW8sSokMDXOIhzxhU06wall
         diPtAvQnSPavr1Le2TYz2c1RGmZj9BVWUWqkupeHjbfcFlPNHpRRSA2eyAsimNW+hSQX
         Nxass3dFXl7jFgCi1esbNPKqZuNpy56ydrsTfD5Y6yni/ry2uNJlY9xRkMh+jQgm83u1
         RXRPAotKzPYqW14zPaeFuIh7pQaVWAnj/NtYJLHtlVwjf7srr91FlOnOgResz67oOpye
         RJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968062; x=1738572862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/APBb2q/AqCfEO+JT1Q+/Y+2hQMGowRnoBEY08AELk=;
        b=l1nlpLYLM/cz1lvuNwaYASS82oI70T8O3khpkL2fQQqc18OoEYKJ6fFZPgrsNzQMae
         6yy+eDPEgOFpEjz9MblZidcM7LgS/cR0As8hGMqzfdHoUsQmo2IHp4AOdvOV+1ubP9W2
         FGyWTghGAaKQWNsXBciwgCxIGr3sI9Mvi3M9IuaVObAh3NEs0tPboLId1449X6NMaYl6
         UJhV+sVRVVivxy6n8K8YIB+/jvJ9yxU0I2iYjce9VUrvbue3HLYllluC4V7ON1vBKz/k
         f72aKVRbw40o/x1nzawx6ByMGuAASHLd9Tml90pb6Q4n4dDSUyl4rS1gP6N9v1Uzb2Kg
         NzIA==
X-Gm-Message-State: AOJu0YwWZHr4dPK9OtIHBbuh0sez7NGY7I3hDP1fd4XCCxF5gvnhNriQ
	pZ5qkL3taM2fhRFkqQbVeRuyiF5iWxEzExn5CzZA4FTNQoJtwmBjk6MOEg==
X-Gm-Gg: ASbGncva1E0jGFiPa2id8FkV9+CzgrUGuXX8Q4VOrNoggf/z0JcL++O/32IXEu05592
	gjcuT/1xIaTVISTAzAzYqbkLynLJyLG7IudAi08hc3kef9+b9q5ixQtFehHkRRLGpQa4V0+xEUF
	iRxcuSV0iW+xStBy+PIIjAp9QYwhWHhJsNmbDNDBdpTxl3wy7my/9h03PJMQWBX6wUr4p+NW+bu
	pCEs/LSTvIm+8Q/IFXMqMZP/o9RM2ieKXIQ699Pt6ptMNURnPCnyg2KYSCY4Uby0B9/5LoEV98T
	LNUOW+/djuPl0iAI/xy+nPfnyPgoKlsZ6PpQSQ==
X-Google-Smtp-Source: AGHT+IEKIQPQDYIVcTNDi/AsoOWo0gI9q1OMzYVCeFUqumZ9IoWNTk3PByVEY3ap1kFXViz3Hhj34w==
X-Received: by 2002:a17:907:7e95:b0:aa6:7354:e926 with SMTP id a640c23a62f3a-ab38b42b49cmr3626225866b.36.1737968061770;
        Mon, 27 Jan 2025 00:54:21 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab6760b7788sm542642166b.119.2025.01.27.00.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:54:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][styhead][PATCH 2/2] lapack: fix buildpaths in ptest also when CBLAS is enabled
Date: Mon, 27 Jan 2025 09:54:14 +0100
Message-ID: <20250127085414.54529-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127085414.54529-1-martin.jansa@gmail.com>
References: <20250127085414.54529-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 08:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115105

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


