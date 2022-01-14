Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FBCC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:27:21 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.10070.1642181239844087151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JsEv9scM;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso22780157pjm.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SYwafie6ku8AJjIyMTUh0JSXykiwbABL/Wvyy7JUgnk=;
        b=JsEv9scM5pHydm2IeRbVya5ECsfoajtq4o5xq8gKZ0B9O+TU5Eu+Nlw2n0WS71gfhx
         1MjlsINgMyXhQvYoN1Fbq64FZdq8cJ2EFW+x9a2xdsFmpc6rA/yWPif6BZGzXUJx9FDs
         vOHNqMwXmKbaAEr1LQBFrvGFzHi1z7c41LCMKM17Wu4s6vdroP14o0IbGFHsxICtYJ4I
         QzfmvD+KQJUebeR8XNq2qRkSxgvSJioLdIR5KfzXhYn7+aHFEEu9XbDxzvU/E/9uG+BO
         VNBm9k0z1PrgHIRR1TGY58K57nEqXJleHePKRNnM8GkHkFNvo5uCgMvmfxr3t7P6h+vY
         Scog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SYwafie6ku8AJjIyMTUh0JSXykiwbABL/Wvyy7JUgnk=;
        b=vcG9tEM1ACWdMuIzvi/aQB6j5hQ3WAc7gofd3Kl9XL/UvuednoEllvGfVD4zw97BNV
         qDOwuqu2nwO5BkwV/Nqhz4LGtDnCWuYG8QdvGOKfDo/PbyrNWh/MBWmAuIh6DXvOQdfe
         ApE4TtfZP7ysYvB/Uve9am1RaY4WLWYIelHH8Ikbjut16dblZgGDR4D5O9Jj6wRdC8Q9
         /iFzRQGQiwbKxsjXW5haaPMJDm8ntmA0hHk+dH3smDVAdEkmKYktIoOqGG81DpCrwpw2
         tKaMOFTzm1tJYeYc6pQwYDXJO/B1JkUsenDtwyy1T+45nquZ56SgOGdPX1GqsN5Ak16u
         hvNg==
X-Gm-Message-State: AOAM533coZxTabhemID5mIjJEre9ul9ZkpEVzRui0jHLcHJe1jhJ7Px3
	FKPE/wyKFxqplYCiBbAn5UPZsSlKvX8rbQ==
X-Google-Smtp-Source: 
 ABdhPJx5sjxhxfAiIDmLPQ0vfzLjPLJ0VbV3EqkR5Ecnr376NjrzRhywo+27eFTi3FBtgEpAURRRgw==
X-Received: by 2002:a17:902:b218:b0:149:936b:8306 with SMTP id
 t24-20020a170902b21800b00149936b8306mr10495642plr.134.1642181239036;
        Fri, 14 Jan 2022 09:27:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 t25sm5103265pgv.9.2022.01.14.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 09:27:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [meta-networking][PATCH] tnftp: Add missing header stdc-predef.h
Date: Fri, 14 Jan 2022 09:27:15 -0800
Message-Id: <20220114172715.827811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 17:27:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94845

musl highlights this problem

Fixes
| ../../tnftp-20210827/libedit/chartype.h:47:3: error: wchar_t must store ISO 10646 characters
|         #error wchar_t must store ISO 10646 characters                                             |          ^
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Yi Zhao <yi.zhao@windriver.com>
---
 ...Include-missing-header-stdc-predef.h.patch | 31 +++++++++++++++++++
 .../recipes-support/tnftp/tnftp_20210827.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/tnftp/tnftp/0001-libedit-Include-missing-header-stdc-predef.h.patch

diff --git a/meta-networking/recipes-support/tnftp/tnftp/0001-libedit-Include-missing-header-stdc-predef.h.patch b/meta-networking/recipes-support/tnftp/tnftp/0001-libedit-Include-missing-header-stdc-predef.h.patch
new file mode 100644
index 0000000000..07a3c739b8
--- /dev/null
+++ b/meta-networking/recipes-support/tnftp/tnftp/0001-libedit-Include-missing-header-stdc-predef.h.patch
@@ -0,0 +1,31 @@
+From 9f2797d1ab8557b44a1f8d6d4d0b6de368d55e80 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jan 2022 09:22:59 -0800
+Subject: [PATCH] libedit: Include missing header stdc-predef.h
+
+__STDC_ISO_10646__ is defined in stdc-predef.h instead of expecting
+every other file including this header, add it here
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libedit/chartype.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libedit/chartype.h b/libedit/chartype.h
+index 319be30..2d3e20c 100644
+--- a/libedit/chartype.h
++++ b/libedit/chartype.h
+@@ -30,6 +30,9 @@
+ #ifndef _h_chartype_f
+ #define _h_chartype_f
+ 
++/*  for __STDC_ISO_10646__ */
++#include <stdc-predef.h>
++
+ /* Ideally we should also test the value of the define to see if it
+  * supports non-BMP code points without requiring UTF-16, but nothing
+  * seems to actually advertise this properly, despite Unicode 3.1 having
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
index 111a63d297..8c5892668d 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
@@ -15,6 +15,7 @@ LICENSE = "BSD-4-Clause"
 DEPENDS = "ncurses"
 
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
+           file://0001-libedit-Include-missing-header-stdc-predef.h.patch \
 "
 
 inherit autotools update-alternatives pkgconfig
-- 
2.34.1


