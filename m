Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.1577.1614975758754262636
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 12:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGhz39Q8;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id h4so2121472pgf.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kp4/aiasKf91JtEsRnf7NTIA023sP+2HY/U5iavcLXs=;
        b=pGhz39Q84DipwMXpUPM94r3cmEsZoq23rmzLyHQtgKOe8wqY6BXfL6v5a9irGQ5v/X
         8UpRNH9Td52AF3Unn5kGpGPQ0cJGIo4Nl5TuFWMRsLQvcv5Df0HOzBO8j3pluw9tR/g7
         5dFq58+T8M3egki92rKKlJenZixO80GAxfZ2q7vZ7F3HJu3WPr2jUG5Yziy5nR9OPFyx
         s4lpt/QZ45htc52IYxV9994bnFYYOhBMU4qH3Cx8zyOeNTCYzoovdv5yrDp8+krRcCXL
         kLb3HIATg78wIRcxQIMx6Jh40c8XSgmvhp3dqPLC18LgruKqarEkgHBHLuMicK0x3s8J
         LvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kp4/aiasKf91JtEsRnf7NTIA023sP+2HY/U5iavcLXs=;
        b=oxdvqYyEYudon6AjKJevL3KxB/vcysq15FhIIplSfwEPthsc7DTdwO1Dpoe+2sJvri
         RBP9cMgkJhqnPr/Dz0gWmQh7U4wrzGGnOGtMABuME5iJ9HIDmeqPbFi5jHyT2lztdMJK
         ZUw8nxbY54W6I6Pu2XM0YHzbblLhf/2Vu7dymvfUgrzQUOpY/4S6zxqBhoOcqeKaW9rS
         vLo7V7jJYri1cMajhqHCsqKYySVHc5Cqvs7B0B8ndWC064gRdNhCLBi282mc77h5hbEQ
         oQl4yq/OO3zU77PUBQp0Jv9Urc26pCFpUKplFu3lVSE3hBu52qun63DytR6fSZi1Z7aC
         K9eg==
X-Gm-Message-State: AOAM531HdNNk4FYsuuOqOISNErRBLnFBtY7TdYWXNqdnAtRQ5TVnZGJq
	yIkdI6yrkkywquzJGk30HawUh0Dv/jLdRQ==
X-Google-Smtp-Source: ABdhPJyky6PHTBTkNbCSPwTG6124kJJiR4AfA7qT0+nDOCZM4jk9FBLPF1YnUBkyfAjyOazofIceYg==
X-Received: by 2002:a63:2f03:: with SMTP id v3mr10174946pgv.408.1614975757937;
        Fri, 05 Mar 2021 12:22:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id c6sm3340218pfc.94.2021.03.05.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:22:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] open-vm-tools: Do not use volatile qualifier
Date: Fri,  5 Mar 2021 12:22:34 -0800
Message-Id: <20210305202234.139391-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305202234.139391-1-raj.khem@gmail.com>
References: <20210305202234.139391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc 11 has started to error on it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-pollGtk-Drop-volatile-qualifier.patch | 32 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
new file mode 100644
index 0000000000..adc6571f7e
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-pollGtk-Drop-volatile-qualifier.patch
@@ -0,0 +1,32 @@
+From 7bd280f3cc07208760759c98bbfbac3f9d28f77c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Mar 2021 08:58:29 -0800
+Subject: [PATCH] pollGtk: Drop volatile qualifier
+
+glib-2.0 has changed the function interfaces as well and do not expect
+it to be volatile. GCC 11 complains about it
+
+glib/gatomic.h:112:5: error: argument 2 of '__atomic_load' discards 'volatile' qualifier [-Werror=incompatible-pointer-types]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/pollGtk/pollGtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/lib/pollGtk/pollGtk.c b/open-vm-tools/lib/pollGtk/pollGtk.c
+index 6d95bf01..a941e7a7 100644
+--- a/open-vm-tools/lib/pollGtk/pollGtk.c
++++ b/open-vm-tools/lib/pollGtk/pollGtk.c
+@@ -1473,7 +1473,7 @@ PollGtkBasicCallback(gpointer data) // IN: The eventEntry
+ void
+ Poll_InitGtk(void)
+ {
+-   static volatile gsize inited = 0;
++   static gsize inited = 0;
+ 
+    static const PollImpl gtkImpl =
+    {
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 34a81d21f0..69ef6056d7 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
     file://0001-utilBacktrace-Ignore-Warray-bounds.patch;patchdir=.. \
     file://0001-hgfsmounter-Makefile.am-support-usrmerge.patch;patchdir=.. \
+    file://0001-pollGtk-Drop-volatile-qualifier.patch;patchdir=.. \
 "
 
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
-- 
2.30.1

