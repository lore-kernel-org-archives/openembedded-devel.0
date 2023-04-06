Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63A9C77B6C
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 06:54:33 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.152552.1680764068687098403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 23:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o3gPLTpw;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id ja10so36698942plb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680764068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+g5crCwGTTKIxL/03OFkI6vt/W8joOHCJKeuTv0/VA=;
        b=o3gPLTpwEZyNngK6/6+YJuIXHEmIv8Pm5/GQmyAtCyvCwP0CPyh/0DqByg88cSQ1Tp
         Es8Np5y7AiM8yhWsewwMTE4UOM/x5LX6Tt0iFm7/Ei/xnjkq2utKeRuM2W4vwH/pmjst
         oPdFeXcod3CVhJRQ9NSmnJ+7XitLHoVhlTFQk6swfFFL0Qwuf9emhuL6Fop/baNqrygR
         eRE3Cdkj5NChNoDJ3F3lJk7F+yWyVfwI/wx4vRnKqBbHFMoWsrkwcTdAT4joEvIzWTlW
         aPE5xHLcZPhHRZho1GoIg/WVXT+6vec7Bq5ySr0nXd/+D2QtpPdvUJiiX3PZrMMPFDw+
         3TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+g5crCwGTTKIxL/03OFkI6vt/W8joOHCJKeuTv0/VA=;
        b=jLBBgF+ULBBXXplzNaL4IYIsC+Sz6dA4LRq9660rjSVr9GBTm/0ZLUEQKcE6zW3xdD
         iXY3g95oD5qOBXqQQi4RQMAz/GbhE43luDVJZsmIXSp54RgtaZR21exvZIqhCWARfUHX
         C/K5SjPSev+NIHu++D3MjYM+vggglG54RETNSXomla2XkvZJz+HwZ8ucyUGb8XBV3Ve9
         7UDc87MSMSK8jX5eOzFtO0NUw7d/uSnpL6Bd7b/YdTC3haUrgOIyN83Oz4NCT8IEQBkT
         Lg84UnxHiCNybDbkzgUEmqoFWycVWZaZq59jrN7IZ1kPAm97voOvTunInJ9wL+PY0H66
         ++Lw==
X-Gm-Message-State: AAQBX9fMbLuNo8LD3LLY97xFWLULKLK6hfwu4vqAOjUjkV3kZSmqlKDW
	SUO3pbXtzVx5NM/pl9X1eDceGmjaVYpIgQ==
X-Google-Smtp-Source: AKy350ZsNsnnlQ7O/3dvrFyk6oFsWeUPXGArnek+TAcsasF/oEUlKs6bnzG1D6bQWWGk0XdKgKPcwQ==
X-Received: by 2002:a17:903:283:b0:1a2:63af:e980 with SMTP id j3-20020a170903028300b001a263afe980mr10705970plr.13.1680764067872;
        Wed, 05 Apr 2023 23:54:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm648703pll.86.2023.04.05.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:54:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] minifi-cpp: Always use stat on 64bit linux
Date: Wed,  5 Apr 2023 23:54:21 -0700
Message-Id: <20230406065421.767010-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406065421.767010-1-raj.khem@gmail.com>
References: <20230406065421.767010-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 06:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101970

stat64 is an alias to stat on 64bit linux moreover this makes it work
with musl where LFS64 functions are deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-use-LFS64-functions-on-linux-musl.patch | 35 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
new file mode 100644
index 0000000000..29f5b94a04
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
@@ -0,0 +1,35 @@
+From 6690e7fe566445e20fec178e9e209e5f9f2fdde3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Apr 2023 23:33:46 -0700
+Subject: [PATCH] Do not use LFS64 functions on linux/musl
+
+On musl, off_t is 64bit always ( even on 32bit platforms ), therefore using
+LFS64 funcitons is not needed on such platforms. Moreover, musl has stopped
+providing aliases for these functions [1] which means it wont compile on
+newer musl systems. Therefore only use it on 32bit glibc/linux platforms
+and exclude musl like cygwin or OSX
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
+
+Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ thirdparty/spdlog-20170710/include/spdlog/details/os.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/thirdparty/spdlog-20170710/include/spdlog/details/os.h b/thirdparty/spdlog-20170710/include/spdlog/details/os.h
+index 735f60147..639b07a79 100644
+--- a/thirdparty/spdlog-20170710/include/spdlog/details/os.h
++++ b/thirdparty/spdlog-20170710/include/spdlog/details/os.h
+@@ -237,7 +237,7 @@ inline size_t filesize(FILE *f)
+ #else // unix
+     int fd = fileno(f);
+     //64 bits(but not in osx, where fstat64 is deprecated)
+-#if !defined(__FreeBSD__) && !defined(__APPLE__) && (defined(__x86_64__) || defined(__ppc64__))
++#if !defined(__FreeBSD__) && !defined(__APPLE__) && ((defined(__x86_64__) || defined(__ppc64__)) && (!defined(__linux__)))
+     struct stat64 st;
+     if (fstat64(fd, &st) == 0)
+         return static_cast<size_t>(st.st_size);
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 1bf99d4907..b76f120ee1 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=ht
             file://0001-Fix-build-with-libc.patch \
             file://0001-civetweb-Disable-lto.patch \
             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.40.0


