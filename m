Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B202B1075270
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:15:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1400.1773940498854997558
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GalBzUXm;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so15618625e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773940497; x=1774545297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvYVZCyVKBqs266KWRAnpdc5ZJySfZtGpvHZdFhLc2M=;
        b=GalBzUXm16ur46N4pUvNFQpOWesF9q/mJ+Ze/Xrt+8JIAJJU8rMpFEUcJS6b1GNreo
         C2uBrY5O+ih+u9rmC09lGOTq71Gcb63+ti9aW+0/ABcNXo7LVDUu7DdO3hZkniWCGYfY
         GN7rdhmbV80dPwsBYICShQqSgleywG+Mi1mzWvJIDTDzocwgsJk03+J/Yp0I+41CZdyA
         SH/YvLndMfahiBM2+SxndYZ7Ga4pDkMX5yvZEZccB2q3C0+kGmiGFFv7G8OaHePZOeJi
         D/52S1Ie+il9xFrE5QEtDsgWW2vXx1YhkO3UMkmubu8nRADSP/Oc4jEDX6BvuZM5BJNh
         dbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773940497; x=1774545297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvYVZCyVKBqs266KWRAnpdc5ZJySfZtGpvHZdFhLc2M=;
        b=qbv1K/7sp6156c0sCGV8lXiKBlZw5nLJYAgYMM6NoUSCSCiXbrVpMqs2aY47Leu9VA
         ZtUsWCeHeIf/ONCp04ju9apl2hV4ChhOw2I/TOzKY0cVoYG+sknAawKVmR26wP7Fpnuy
         ZB+9xdrz7+OkfoBWatEurZQ3uwxDQHS5W+TIbSc0TUPGZpaY8zrkUoVKWG+ZS25ur9F3
         8eqFIMRzCL4ca/HZWxS+x/rB57vhNPs52i+WHOE2YCU0YfNOWptBw7xv52Hl5BPYSRGK
         H/w8XadV5SBWxhrx8kBeF/dkEu0L8yODW91cHKu/BsN87YRc+KiQwPz+uzBRh/fS43gB
         5uwQ==
X-Gm-Message-State: AOJu0YwwhUqmdvkq/EtDApYPOsGHsxkaXYtEDfFkywWm+mtkvvPAbwMQ
	/MGHxcrKq5FgmVYYO3kQ9h/M5qQj/G1lj/94llOOF5z3m1Ll+s7n7N/70SzQtA==
X-Gm-Gg: ATEYQzz29KSfsbCWSSRn070M2xfNMXyFn3BZyMxNBZzm5jJlNd7k0Z9hebgy45uauvH
	hv4CCJkxLCpUnuPPg3IKH/Ry2otuSBgrir/i9pndB+4k8L8MhYjCrmmo3FRRzcArwfve+uaGm7b
	X1foFgJ95ZM1cfTZIiHsx760pO8Ebpnzaxv+LMyZ+IM1Wv59SvlKIJdUjDFVZ5gIzYROPMMWeuy
	pK5Ja/qeCzZncBy6R9rsvcTmiQ9vvNM3xmEkwQ8HUToRAKTq/d3kTsm4XvurMztc/zZHIJ/U3DI
	oOPgBrjq9maTbmCI8yVk99ng91T2NsCCzb8bD8u3MEfNzE+2ZtcOdJMc0hrv1/g43PTdshsOGKP
	BezozfNx0XpRdDFadp/SPPnPWOeOYDGsfFTSs4salW0Ih9B23uTp5xM4HaU6nryFlm4EhvhnNDh
	AgwUVUc2KbP/8oiwHu+tC7
X-Received: by 2002:a05:600c:1f13:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-486f446cfd6mr140771075e9.17.1773940496899;
        Thu, 19 Mar 2026 10:14:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe809792sm2862915e9.1.2026.03.19.10.14.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 10:14:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] qad: add patch to build with glibc 2.43
Date: Thu, 19 Mar 2026 18:14:55 +0100
Message-ID: <20260319171455.3012731-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125411

As the subject says. Fixes compilation error:

| ../sources/qad-0.0+git/src/server.c:212:22: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
|   212 |   char *pLastSlash = strrchr(url, '/');

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0001-fix-compilation-with-glibc-2.43.patch | 30 +++++++++++++++++++
 meta-oe/recipes-extended/qad/qad_git.bb       |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/qad/qad/0001-fix-compilation-with-glibc-2.43.patch

diff --git a/meta-oe/recipes-extended/qad/qad/0001-fix-compilation-with-glibc-2.43.patch b/meta-oe/recipes-extended/qad/qad/0001-fix-compilation-with-glibc-2.43.patch
new file mode 100644
index 0000000000..3bebcc1b11
--- /dev/null
+++ b/meta-oe/recipes-extended/qad/qad/0001-fix-compilation-with-glibc-2.43.patch
@@ -0,0 +1,30 @@
+From 030b4983e3515b214f4faa61ce1b7c552c007340 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 19 Mar 2026 18:05:00 +0100
+Subject: [PATCH] fix compilation with glibc 2.43
+
+Fioxes compilation error:
+| ../sources/qad-0.0+git/src/server.c:212:22: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+|   212 |   char *pLastSlash = strrchr(url, '/');
+
+Upstream-Status: Submitted [https://gitlab.com/CodethinkLabs/qad/qad/-/merge_requests/56]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/server.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/server.c b/src/server.c
+index 648fb46..11ec114 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -307,8 +307,8 @@ void qad_text(const char *post_data, int post_data_size, qad_backend_t *backend,
+ void qad_screenshot(struct MHD_Connection *connection, const char *url,
+                     qad_backend_t *backend, connection_info_struct_t *con_info,
+                     char *error) {
+-  char *pLastSlash = strrchr(url, '/');
+-  char *screenName = pLastSlash ? pLastSlash + 1 : NULL;
++  const char *pLastSlash = strrchr(url, '/');
++  const char *screenName = pLastSlash ? pLastSlash + 1 : NULL;
+   int screenNumber = -1;
+ 
+   if (screenName && *screenName != '\0') {
diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-extended/qad/qad_git.bb
index 189d2f9d15..4a80b6738f 100644
--- a/meta-oe/recipes-extended/qad/qad_git.bb
+++ b/meta-oe/recipes-extended/qad/qad_git.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=402cce7fbcb6ea9ab5a0378dd7f40806 \
                     file://openqa/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
 SRC_URI = "git://gitlab.com/CodethinkLabs/qad/qad;branch=main;protocol=https \
-           file://0001-Fix-warnings-found-by-clang-compiler.patch"
+           file://0001-Fix-warnings-found-by-clang-compiler.patch \
+           file://0001-fix-compilation-with-glibc-2.43.patch"
 
 SRCREV = "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
 

