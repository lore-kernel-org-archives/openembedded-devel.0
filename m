Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E95BC0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:54:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.47420.1737968084595706857
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 00:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNXdp2OY;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso666770866b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 00:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737968083; x=1738572883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/APBb2q/AqCfEO+JT1Q+/Y+2hQMGowRnoBEY08AELk=;
        b=FNXdp2OYTUNDuPHOTRva5P/fcYvla0xBdDh9OCU0wuPYhNIXl1sEoVBN5iC5RN0u+B
         fjbGzlDYe0V8w1Xo59z/FlD2uu44qZTtmM1o+UAHS+Hr61t5ANwL9cuoujJdgWx5c/Kj
         6+NyOyGL2U2cGYYzxE700rdnOw0cbC7lPuq1LxVYCUp2Cy48tj9qVaU3VlMruvwtkFyS
         0bYY607/sebm3bM5+SW8l/iKcr+E+YmBP397VaP+Sj0Z451qEl3cgIzcY4qU+i0ZkOFU
         JQTVTX+CP9ght8FbD8UfGvayBYeuvCku3zf6fECjNfoU63YGrnXQAjI4cllh5exfkOm+
         CeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968083; x=1738572883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/APBb2q/AqCfEO+JT1Q+/Y+2hQMGowRnoBEY08AELk=;
        b=a9nYKKARNR41hLGobr69h/5/VGY6w8bD5FFDvpouq9p6Y+l687EtNmvQZZ8CwFKKt4
         sFdXSBColYgiuKm8IV2J7r+CgAVSvTOjAInFIHWa7FtDDdNxmpredl9wd2eb11XtK2jd
         +aeLHmQvlWil6tpuMcaM/1GsRncJwui1YyCWbNL438kRudDi9vi/uviWzP5oAgqO6c5u
         0VpqvOKewSweUtWHZmHqm1lT4GQ9BFCIJltabWobDZSnM45lPTclyH6eIejIggBA/2+s
         59Y+2YIVj/kRAs4PeoMgEjUYdgPp6x/dut1lGUzJ9JtXrtWk4fUcpFxHHMMAJnLdgX7R
         j4Bg==
X-Gm-Message-State: AOJu0YzsUX7CAGHiuicJXLU4ZzuzPD095cf/q0OfNqgeLi2VL7rwLapQ
	IxzB9/Lpeo2Tdgq6z53P/10PtVQY0IFyYOeaKag+rDC8TLOxXQpHROx+iw==
X-Gm-Gg: ASbGncuPjI05JDlPvGuTR3BwDkjuwHBDetfFWuxdNfcNRaJHAd2g4v8w9710JET/wlm
	gaeGDcxTJEdrNYUzmxVHfddK8PxmjL/UGJNfkfiAD/yYmbrt49PjB2JV3SGUSBhox8Pz+dCNb0E
	PhAHN8ybwFsQ6CyJCsvNxdLfQ/gr2swZT1NPh3+EZ3Qgqg/HXoANXAFVQ8Ol7fEgsCBEmcEqzPj
	hych8zlMqqANu8zkGz0C+ff5PAQDTUqWtMQU4PR3wl3whT9t5ExdflkonB6WuepsGz1SzX33gfh
	Vkd818CPd9sWBBbZmEWsz4YVZVOAAVm4nCgKRQ==
X-Google-Smtp-Source: AGHT+IEmYKgyHVy3Mhty32ao9amLJzldUvsC0UjDg0CqSvcm+lR6qV0yNmOh/Nx88JgzPJgdj52ZLw==
X-Received: by 2002:a17:907:da6:b0:ab6:5413:fb13 with SMTP id a640c23a62f3a-ab65413fbb1mr2014823066b.23.1737968082864;
        Mon, 27 Jan 2025 00:54:42 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab6760fbbbasm550008066b.146.2025.01.27.00.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:54:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 3/3] lapack: fix buildpaths in ptest also when CBLAS is enabled
Date: Mon, 27 Jan 2025 09:54:37 +0100
Message-ID: <20250127085437.54643-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127085437.54643-1-martin.jansa@gmail.com>
References: <20250127085437.54643-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 08:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115108

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


