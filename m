Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.6302.1622029977495010148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BnTAOilN;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso242805pjb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BkKeOxrFr/B0BZ+EMJ8YQ4AygFgc4595irTGK9LkT5A=;
        b=BnTAOilNF35iU4qaVI89oLPFj2oe73j5G8FoQoVQQ0v3Pt7cp7+7lkRl4jUjnME1HL
         vZMrLr/eR6+TUMSLoY6VTT2tVwu+arUv/4z7UlDV55K8sI89rZKGT03Sdn+OcVDsr8r7
         3p8+VorB4bDl/+o+6SWV8Hlz/QXinMHBa7PFF/eZ039vE2m8d9NvAFY3IslxPoHXUrba
         fffkzOyCdqJAh1GjtMb6/rLi1yhdx/mQ3nHNoukFnXAZT+SXcRSzsk3hg3ZMHJlgzT9g
         O/1ilgV6gAuQVvFpuLoKdHA7YrtiYTXxAHj8mNLKww1HDLykC6qDc4nAJTCd3s2pA4nz
         uEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BkKeOxrFr/B0BZ+EMJ8YQ4AygFgc4595irTGK9LkT5A=;
        b=N6avGDxkHALumCJa/WpsmxtdAXbz/VZE6fUn5QHDOf1TU8+uxV6zdhD8TWu2e7Dwp0
         4pYkgrvFs/FLBrSGcAaLx3xAhNbXtwkDAAwq3dRcrqOqi7mMXTPXZTEItnVPESViFSOE
         x16Jka5K0LQIGbjHpwoxK8P5s2f2cuQV/Xi/Jgiu84b4shQ53UBVd5S1887CwwEsxN/X
         w+FAUkAPzdTHdMqbolaez/f4iCvA7G3OYoGau8/IrHrDeQJOQ+i/P6ktvCh0FL+nj4Rq
         HClf9zZVY05pUqh4DCwhRrbU6foYpCoO0UNE3eGzf+eK/WHHJdC1YAX9iHdssD9GEn/i
         j/tQ==
X-Gm-Message-State: AOAM5309jqRPXixGFvo3XxYvpmeLE5utM6magfY+nIBOX/6gA/pdkdK4
	19j79spvHERqNawcog2hg38dAkjKPlpBBg==
X-Google-Smtp-Source: ABdhPJxLqoT483aJqWt4l/qOidVYD4YTgO0Q+fNbfakDNYEd3FXaCSfRM/gjON8IUyieaK9DQ9T9oA==
X-Received: by 2002:a17:90a:bb06:: with SMTP id u6mr34963856pjr.201.1622029976931;
        Wed, 26 May 2021 04:52:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:56 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 09/23] exiv2: Fix CVE-2021-29458
Date: Wed, 26 May 2021 04:52:24 -0700
Message-Id: <8355be5c641d18df607c0b1eec9129f15d318220.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29458

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1536/commits/06d2db6e5fd2fcca9c060e95fc97f8a5b5d4c22d]
      CVE: CVE-2021-29458

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f0d83c14d9064ce1ee19b92d95c8daf790fe7488)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29458.patch          | 37 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
new file mode 100644
index 0000000000..285f6fe4ce
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
@@ -0,0 +1,37 @@
+From 9b7a19f957af53304655ed1efe32253a1b11a8d0 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 9 Apr 2021 13:37:48 +0100
+Subject: [PATCH] Fix integer overflow.
+---
+ src/crwimage_int.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index aefaf22..2e3e507 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -559,7 +559,7 @@ namespace Exiv2 {
+     void CiffComponent::setValue(DataBuf buf)
+     {
+         if (isAllocated_) {
+-            delete pData_;
++            delete[] pData_;
+             pData_ = 0;
+             size_ = 0;
+         }
+@@ -1167,7 +1167,11 @@ namespace Exiv2 {
+                                                  pCrwMapping->crwDir_);
+         if (edX != edEnd || edY != edEnd || edO != edEnd) {
+             uint32_t size = 28;
+-            if (cc && cc->size() > size) size = cc->size();
++            if (cc) {
++              if (cc->size() < size)
++                throw Error(kerCorruptedMetadata);
++              size = cc->size();
++            }
+             DataBuf buf(size);
+             std::memset(buf.pData_, 0x0, buf.size_);
+             if (cc) std::memcpy(buf.pData_ + 8, cc->pData() + 8, cc->size() - 8);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index a13db42edd..1dc909eeb0 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -10,7 +10,8 @@ SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
 inherit dos2unix
 SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
-            file://CVE-2021-29457.patch"
+            file://CVE-2021-29457.patch \
+            file://CVE-2021-29458.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.17.1

