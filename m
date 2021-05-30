Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.34935.1622399675843790776
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cRSkZhSH;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id k15so1021842pfp.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BkKeOxrFr/B0BZ+EMJ8YQ4AygFgc4595irTGK9LkT5A=;
        b=cRSkZhSH0gYM56uQ0bBDRHieDs1G7D+4HPGWuBT02nY99sH1D4aG/23IRglgAHo7Yk
         b8ic+8nNkQYPDi/BvwgGShsRt7IznKjOMJP6hNshW4Xlfo488FSkSQz3JBFeUj5FBE2i
         qHxIAX8VBHgGWEoQq84RYEW24/xUFWrecxb5SG+aO/lyK3YCJ9SdLfA7k6F4d9ATipwH
         avJ+x/q6FWafIdoxmTZYkLGssc5sc7yUt50n0G+6IKv1j92XXPdHO3O7KmbYvcpni+fU
         Tt4uvZOzMiKbfZPb9LKY/gYzxiHaEzBAyGszu756dda9Gw1BFOWSk7+5a9MrfSP8YibQ
         VUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BkKeOxrFr/B0BZ+EMJ8YQ4AygFgc4595irTGK9LkT5A=;
        b=gLOoLILoY4RzyyqZYsBBbbX8H3bvzyDKz/daTIdfGyxFK5UWpfMalwRJZ5dTOqknP6
         PRLEQcmMJYlMt0NnHo7I7uP5Muwz56iL3FWIO0lIvpPDVNfes7B2gCoKQIC3+/r2ZU74
         aO0psn4oUI0XUoNRBebdZc21mwuX/AWOKq8AGgHJEvg1raYRJgRTgB/GUa5c+3NjDSPg
         DEr8xG5h8E/7+6MaW9zGj1mONlMii/EHz8mfeROBB1os0fj1CMoUeA45BLj/V4pYjHCb
         yFz1IdCXk9wfd14V61HHbrgVZMXHEaLbavEqWmegDA7A1b62gsUlY8Dy3LTPw5VroIv2
         xSHQ==
X-Gm-Message-State: AOAM530bR8rlHnhXHpSZFKIwg2SoPSr/wy9AnBkf0kikrN3kh3lqaz3M
	gnuQC31D4HNnFMXJhUGXSKAW+W4j94e3Ig==
X-Google-Smtp-Source: ABdhPJw25ucrFYOPFbX8qcoIgjAtJ113COQ0Z78NCYY9N5LqV2EHU3C1g9xKl0HnpWNCATZAFkIFUw==
X-Received: by 2002:a63:696:: with SMTP id 144mr3824743pgg.75.1622399675279;
        Sun, 30 May 2021 11:34:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/12] exiv2: Fix CVE-2021-29458
Date: Sun, 30 May 2021 11:34:12 -0700
Message-Id: <6990c93dbd685f0b093fb65906f9471f63e4c635.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

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

