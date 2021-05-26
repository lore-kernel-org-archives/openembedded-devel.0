Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.6315.1622029976718968230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FbDWEt+4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id t11so666974pjm.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P0ot+RkO0hgk8vWX+ICS6YsbdaRYB2larXoqFZI+geI=;
        b=FbDWEt+4dQ21mr7WEqcNCPLtNpMi4eBVZFsVnGK1C1k3G6utwATrwOrjEWEkbTsCqP
         Y4lB9x+Ogotqq9uUlyocRWjDSFzVe8IeWXDtvkv/Mck45antRTOMBExKZ7k/2JBdsa67
         AS/Sv9ZUjRzvmWCjfeQQx7gmrjH/gVGV3laaY1z3cPrZJ/KST3O7v35EceADrA6hLjmi
         KXVdu4QDetbXeDNRMJGPn9qbyGREiHq24G6uFjJnr2bY1TlUx+pBfE3+MV/37im13+g4
         0smyhGWTKPx6nZ6eBA2f1/+T/ePU52WWb7yjIvvCo+swUP+gJj/mbTVz+8grjGZDywpB
         ZVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P0ot+RkO0hgk8vWX+ICS6YsbdaRYB2larXoqFZI+geI=;
        b=aLPWbBeRx+/Fw3KGqqNwp8pM5YcGw7RzFdnjAWwwzrkOzff9G6FSPlS8IpjwxiJ2fs
         iOUr2DqQorh6c/pAOf2jan/b08fBf0Prh7Ss68E8FF1Q8nFnRLuujGZeMeIKHe6Z5K0K
         7z4UOLq0BPeN2661/jVappOZCshu/my9Lehk6XB+gxGRtVj8Qx4msJudcSSGJSFC59Eh
         vdHKlunrPraIgzJbsbui6sPUrkLB/4wxnd5POMHUdGu5qUGVVPAWqO78ydO51Zg7Fl3O
         X58gMMNBg2A/7F9kzWnOvP0y4Rc6m2awXO/uonMyDzrf0lw9vyTYrdQXduS4jnFByC8K
         8F1A==
X-Gm-Message-State: AOAM533ykj0t6HYT0y6/r2tBuLv7mWpxcNlBa04tAXVscUU/US7LwYls
	AqTR8phUYNNgEWLysvXzAz0pd06X6xwyRw==
X-Google-Smtp-Source: ABdhPJxcZ8N7rqikaGmGCM6w9RrsuNKcOayWO++TLyoc03LF/VtLMdidKw0oIFPjLRKx4Kyg42NxBg==
X-Received: by 2002:a17:90b:3b82:: with SMTP id pc2mr4441362pjb.235.1622029976079;
        Wed, 26 May 2021 04:52:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 08/23] exiv2: Fix CVE-2021-29457
Date: Wed, 26 May 2021 04:52:23 -0700
Message-Id: <52455c3047e9ff63e8dbe17d9830201132fa5063.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

  References
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29457

  The heap overflow is triggered when Exiv2 is used to write metadata into a crafted image file.
  An attacker could potentially exploit the vulnerability to gain code execution, if they can
  trick the victim into running Exiv2 on a crafted image file.

  Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e07ce6e66d1ebdf22]
  CVE: CVE-2021-29457

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5be72693096cef671bf54bf1dd6ee8125614d064)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29457.patch          | 26 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
new file mode 100644
index 0000000000..e5d069487c
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
@@ -0,0 +1,26 @@
+From 13e5a3e02339b746abcaee6408893ca2fd8e289d Mon Sep 17 00:00:00 2001
+From: Pydera <pydera@mailbox.org>
+Date: Thu, 8 Apr 2021 17:36:16 +0200
+Subject: [PATCH] Fix out of buffer access in #1529
+
+---
+ src/jp2image.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 88ab9b2d6..12025f966 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -776,9 +776,10 @@ static void boxes_check(size_t b,size_t m)
+ #endif
+                 box.length = (uint32_t) (io_->size() - io_->tell() + 8);
+             }
+-            if (box.length == 1)
++            if (box.length < 8)
+             {
+-                // FIXME. Special case. the real box size is given in another place.
++                // box is broken, so there is nothing we can do here
++                throw Error(kerCorruptedMetadata);
+             }
+ 
+             // Read whole box : Box header + Box data (not fixed size - can be null).
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index ed1e8de5c2..a13db42edd 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -9,7 +9,8 @@ SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
 inherit dos2unix
-SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch"
+SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
+            file://CVE-2021-29457.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.17.1

