Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.4253.1616909938320534390
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Mar 2021 22:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IbhVU7oQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id i6so157750pgs.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Mar 2021 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vV7GzyXCzkaYZi8qgsbxGVk62lr16f9nCnKv6GzLjFE=;
        b=IbhVU7oQr4qMyW2BveqDjOzYdVBrmsQ2uHQ4cJsyiT25htKWLU5vPVvLJ6Vtw70Zwz
         IcM/xkXfOpQ4SKibtZs7piDIGWrY5TBqn9o9NX4CxxLk51Kol8bTjcmDid9PQGvGTz2S
         gV6O+nGJwT52pfpK7RFgx6/iSEdHrlOm0h5Wz4fvcJkG+2rvrdxccOkIaqQYaz8T5kUG
         hRmt8WJz+cc7SM5df9xsf6ZASKpEwnyFq6Hw+OulCgFMqvu4gwMoXUZcItpnLxvHDrXE
         meQCAMmc5HLrjpiEMijd02OZ5E4z0FISpB5SDWuDcXVUD3acknMiNGNE6/DeteoNd+s6
         1kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vV7GzyXCzkaYZi8qgsbxGVk62lr16f9nCnKv6GzLjFE=;
        b=k1Hoy1Y1aJV+fCqWa6imkLS8scto/0XsXpO350rL4Vv3AILWSLVoSThKxv8D8WVL0l
         VNmYb6QJN78CIsM93Vh9DW75SpP+hc65hR8Kvwj9gKvUVgBCQOm1Y5MGK0KSZWQY/2ir
         MxoqQNVJkxpCmBRUmphyf5eNVE+RCZ8nbvMpY48bPDsinIz5zqZ0jBsa9Oq4UJMwpXCX
         81RIAASq9MbFfbRmCz1eLeJPWv8ex8Cri55o56OBLNK4laYEwzyiToyE2Gw/S2WECgNK
         8I4fu3L0KYK2C8VC50tH3V+nPDwf2X6h51x8dmUDRvo9J33fu0jGwuwNfzXWyvbXIM35
         VY9w==
X-Gm-Message-State: AOAM532tuf9J6EuM6z+AYTgS1DIBITquwXJXoZRB73tZcNJkmeaJTLDF
	eRXDSI9FiACXghoRj64hpD6PoYbLiu1l+Q==
X-Google-Smtp-Source: ABdhPJwiFAb0B3q1yuDrWp13gz83N/VT0zh0emCcPpmH8SKv5RiLt7nUVK3/lMzv5BrgEn2mn8a+/w==
X-Received: by 2002:a62:e404:0:b029:1f1:5cea:afbd with SMTP id r4-20020a62e4040000b02901f15ceaafbdmr20288834pfh.5.1616909937486;
        Sat, 27 Mar 2021 22:38:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id s28sm13982212pfd.155.2021.03.27.22.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 22:38:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] sysdig: Upgrade to 0.27.1
Date: Sat, 27 Mar 2021 22:38:52 -0700
Message-Id: <20210328053853.1287969-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210328053853.1287969-1-raj.khem@gmail.com>
References: <20210328053853.1287969-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...usl-backtrace-APIs-are-glibc-specifi.patch | 49 -------------------
 .../sysdig/sysdig/fix-uint64-const.patch      | 16 ------
 meta-oe/recipes-extended/sysdig/sysdig_git.bb |  6 +--
 3 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
deleted file mode 100644
index cb80611578..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 290703a5d21f34ea5ec23efc815a9f4df241e7e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 23 Oct 2015 00:33:32 -0700
-Subject: [PATCH] Fix build with musl, backtrace() APIs are glibc specific
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- userspace/libsinsp/utils.cpp | 4 +++-
- userspace/libsinsp/utils.h   | 2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
---- a/userspace/libsinsp/utils.cpp
-+++ b/userspace/libsinsp/utils.cpp
-@@ -22,7 +22,7 @@ limitations under the License.
- #include <limits.h>
- #include <stdlib.h>
- #include <sys/time.h>
--#ifndef CYGWING_AGENT
-+#if !defined(CYGWING_AGENT) || defined(__GLIBC__)
- #include <execinfo.h>
- #endif
- #include <unistd.h>
-@@ -780,6 +780,7 @@ bool sinsp_utils::glob_match(const char
- 
- #ifndef CYGWING_AGENT
- #ifndef _WIN32
-+#ifdef __GLIBC__
- void sinsp_utils::bt(void)
- {
- 	static const char start[] = "BACKTRACE ------------";
-@@ -801,6 +802,7 @@ void sinsp_utils::bt(void)
- 
- 	free(bt_syms);
- }
-+#endif // Glibc
- #endif // _WIN32
- #endif // CYGWING_AGENT
- 
---- a/userspace/libsinsp/utils.h
-+++ b/userspace/libsinsp/utils.h
-@@ -104,7 +104,7 @@ public:
- 
- 	static bool glob_match(const char *pattern, const char *string);
- 
--#ifndef _WIN32
-+#if not defined(_WIN32) && defined(__GLIBC__)
- 	//
- 	// Print the call stack
- 	//
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch b/meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch
deleted file mode 100644
index 5c756294b9..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix x86 build
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/userspace/libsinsp/cgroup_limits.cpp
-+++ b/userspace/libsinsp/cgroup_limits.cpp
-@@ -9,7 +9,7 @@ namespace {
- // This reports extremely large values (e.g. almost-but-not-quite 9EiB as set by k8s) as unlimited.
- // Note: we use the same maximum value for cpu shares/quotas as well; the typical values are much lower
- // and so should never exceed CGROUP_VAL_MAX either
--constexpr const int64_t CGROUP_VAL_MAX = (1UL << 42u) - 1;
-+constexpr const int64_t CGROUP_VAL_MAX = (1ULL << 42u) - 1;
- 
- /**
-  * \brief Read a single int64_t value from cgroupfs
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 04a022af4f..bb9f2da7c3 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -20,12 +20,10 @@ RDEPENDS_${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev \
            file://0001-fix-build-with-LuaJIT-2.1-betas.patch \
-           file://0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch \
-           file://fix-uint64-const.patch \
            file://aarch64.patch \
           "
-SRCREV = "8daeef8da752c5f07f439391bc20c5948eb11470"
-PV = "0.26.6"
+SRCREV = "67833b2aca06bd9d11cff7cb29f04fbf4ef96cad"
+PV = "0.27.1"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.0

