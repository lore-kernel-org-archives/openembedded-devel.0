Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1664.1792738465070215854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qklGjWZ0;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso236606a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738464; x=1793343264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sir140WenQ7DHoK4uPYYpYWCBuBxOpC/Tgl6hvLg9qc=;
        b=qklGjWZ0VYodciULluRa7/mc7p/M7feLgoETiGn/35W3aqxZHU8xsmlssXTb0rAVjv
         /3rF7tjCKwifzAYUKfDyyMYMTdFl00MQyyQOzwYkvxV4zQUXDbPhorvFpkrVZ2VEz5rd
         jBm1VNzK2qW1d4LrCEH6KFBQrGI9HRFbLVYGiq2WKYkO8a4B1HmQtpNtmjLCd55p2KWp
         UYj0/gJyWRpUaCO70g/8evaCsPFVhZrJPjh6mDEv6opIBIrsAaXiN/XBJFFrbfvQiYSU
         UltnIVDXiWoZ0VND5hMb5hZIg8jZZZYy7CVgczvYMRaszl7jveY+mlPAaG1KYm5AdVzM
         DHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738464; x=1793343264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sir140WenQ7DHoK4uPYYpYWCBuBxOpC/Tgl6hvLg9qc=;
        b=sWrq63mHTCUomJDk9OiYSxEbDWp+I+bKxRS9i5iaMWrUP2+y6r3y5EL3V1RzCZha9f
         Nalc8cLqJUpD9xu2J63isG/gx3RnEwaKddxOljg38vZdpcxo/P8chibaQ5+bPCI+sx2L
         yKV6teBmxSdC3kGVwN0aMIrVtD/oWK9uPplb1GkEFPSVvYc2IuAepQy3uTYY6naAppar
         cdEGvE3PvI7FR2lcFx336yXgg0mx5Dns1y+1RcFERmX9xqsxQsGDiYyYZh/4sMcL8QmK
         u26bsJYndBi+bg0gJw9HjMAln5JRwZp5rbk7Kjq+CN55pv/ztr69vapUbxXOMbT0xD4S
         x8Zw==
X-Gm-Message-State: AFq9FYI0bceu4XNs5rEROpb4VsG9Oqsh3fP1F3bxD1Yj5yn3X89+xWJ8
	KxcU0qhqLaYshqLfE1X1Rw0o8XyIvhuAo9aK4wqXmo+54ubL4LFzg9+/XkkKCp7rJx0=
X-Gm-Gg: AYBFou0A9QoBWWKSFfDHRiFdIbl7XWDz1X3ve/StslAeYkUPgoJn929v3B1zHPnzE7k
	WNBK0jcuwm/bQ5DfSz/X/P+eNUa5rGno+0Pzb8JlUyVFJhj1zkCkaBpfRpaP5wEIGbzfk55ehxk
	c+tfOWZbQERmrKCoPDytpVjfY2yChJBsYFnpskCt/S05VH6HV6yRlUz1QXJAv5vX2YlEoh3K+c0
	KOIse2Llxg13yqIDxuxcjfr6T0GNZ+EsdKqI9oj+IlHqqaXvkbJzFNNDO/B6pZ1WBoR3FNLK+JY
	PUf0W2IUbGJ3RYxumyxDeQokrpCMywWMGEpdSylMJZlanSwGoOX4li/exP5z0JzgTfcU8sTx5zs
	DEmBWfVZYil+Ax4+MSCpt5mm/FlkfhNtNka9vF1aV1oEjblfL1w5js2FmQeQ0HjZ0F27DVnHImr
	PQVMkO2tvlPgoZQM0S4GtjEfiVUJ9O2edG48xIPh9tThNaQ3yqYRfwyw3Zh4YBqrH67+htbwTM1
	jIz6mctxv3WUQF2tMTDrli6Hbm5giPsq75SZ/C1wljwPHooM0rHZK8RrLeNK0sSl7w/Y/kzXOxe
	92+XcYPgyNcbzISg0jWl45SaW7aEhlwvS6QkR4pSe3khx2+4Fm/6RjCyOvLNP2bmmOp04GESooH
	8dclMyDLnY0xWBAVEyENa5QxOjNtylYstA1Pfr5XVCZNqX1qS9qp8++1sb8tIi5hMCF00EKu73a
	oTfj6QFl0x2dlAKQJ9NkHHhpQqSCWdw8XWFkkZYJXi89ijeVRj6TViNOiBIg0TvdKCrX0/v4m02
	av48yVe9wlEIg17h1Kr48Fma7CUE+I=
X-Received: by 2002:a05:6300:189:b0:3e2:90da:9587 with SMTP id adf61e73a8af0-3e36a0d1bbemr794640637.21.1792738464370;
        Thu, 22 Oct 2026 23:54:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 26/29] gthumb: Include stdbool.h for bool
Date: Thu, 22 Oct 2026 23:53:47 -0700
Message-ID: <20261023065350.3228996-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131350
Content-Type: text/plain; charset="utf-8"

src/lib/util.h uses bool without including stdbool.h, which fails to
build where no other header pulls it in, e.g. with clang on riscv32
musl:

  src/lib/util.h:68:1: error: unknown type name 'bool'

Add a patch that includes it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...01-util.h-Include-stdbool.h-for-bool.patch | 29 +++++++++++++++++++
 meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb/0001-util.h-Include-stdbool.h-for-bool.patch

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb/0001-util.h-Include-stdbool.h-for-bool.patch b/meta-gnome/recipes-gnome/gthumb/gthumb/0001-util.h-Include-stdbool.h-for-bool.patch
new file mode 100644
index 0000000000..8b5c9d8474
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb/0001-util.h-Include-stdbool.h-for-bool.patch
@@ -0,0 +1,29 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 19:00:00 -0700
+Subject: [PATCH] util.h: Include stdbool.h for bool
+
+util.h declares _g_parse_exif_date() returning bool, but relies on
+another header to include stdbool.h. Before C23, bool is not a keyword,
+so where none of them does, e.g. with clang and musl on riscv32, the
+build fails:
+
+  src/lib/util.h:68:1: error: unknown type name 'bool'
+
+Include stdbool.h directly.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gthumb/-/merge_requests/64]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/lib/util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/lib/util.h
++++ b/src/lib/util.h
+@@ -2,6 +2,7 @@
+ #define LIB_UTIL_H
+
+ #include <math.h>
++#include <stdbool.h>
+ #include <glib.h>
+ #include <glib/gi18n-lib.h>
+ #include <gio/gio.h>
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
index f534d5f1f4..c3340551aa 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
@@ -33,6 +33,7 @@ inherit gnomebase gsettings gtk-icon-cache mime-xdg vala features_check

 REQUIRED_DISTRO_FEATURES = "opengl"

+SRC_URI += "file://0001-util.h-Include-stdbool.h-for-bool.patch"
 SRC_URI[archive.sha256sum] = "a24aaa72b5637f49097dedc9c141a33615da770d029315f3285ebf2156cf7b61"

 FILES:${PN} += "${datadir}/metainfo"
