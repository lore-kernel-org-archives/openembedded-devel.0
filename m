Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ADAC25B77
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 00:57:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2337.1715302655769541912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 17:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0io6yoO;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso12161035ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 17:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715302655; x=1715907455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14AyMDm+bIeOJwA/szehquSb6b7E6iig6l3ax8xByFY=;
        b=g0io6yoORgzdFlxasiUhjpOfpR5CaQTV+Yrlc4K9W4kRpNjCyE84fKRpAfETJctS39
         RU5iu7Q8DGUB1THMqGFl0o6S/cr+/AeGRLGZus/gcS9tn+kqT70E4KYRsIEZB5OfGl7n
         8Pd+u4VY4QCPLmIRMcf+sXeQMyDJSb6LCI42cJaxNgyrsCBetVm5SfK5kUQnN9kPyFue
         iFKK+qlNM3fISW9jMidYB31XiIsrs/4bRHar6HGxCHFbTg+YMt8Tz83y8q/3vbTaduT4
         TEkZDgu2OuDIAr3ZRuGUO3SPIDgNTnHrFCKP5LWHAegxSyz2SPzLlwjMr/R22VTSQsIG
         GDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715302655; x=1715907455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14AyMDm+bIeOJwA/szehquSb6b7E6iig6l3ax8xByFY=;
        b=tYbA5aZgflkH5m1f7sOECC9Guj8WsitVD0Lt5VxZv7PNPZv1tKKh3PLJ/tT5wMOmwr
         chqIvPg4/0d5rzzW43xzEW00l1nyEILzeB3KaEttUaILg9muXTLF7XzlSqsekM855DxW
         2wFb3HgTU/BlXrSykiw1A5h0uhyJ+uuCh7nk/99Wa9Kio/G118/xw/UjpP0hrHWt9nmx
         OICMzR4PFxeZurD6tVU2ThUR3AyzKAIONHyCLcbaaE1Qw6D/jxaaOGk8gHpLOhe0ydpq
         OPWNqsaNSMxtRaShVqyxwc0VJ/UttQ3ciNhpMEpGSlYYDz4sD/06b3jO5EFWPX9K0QXa
         QtnQ==
X-Gm-Message-State: AOJu0YxJvi9NP9WlSB4qMYutB0qXm83xalz5YYSqf+2nkQg+XIhlq4Aw
	EPj6xON5/oIByWkFvsJUxYxP6+l9H7ZudMDCJamA3XfhBl3ovaJQ+NQFyPfbisY=
X-Google-Smtp-Source: AGHT+IEEznH5jpNTRkg5q0UWyufdjVrclgbdQqtMtiTbbv9mbgEpzPnK9rRevoCmY5GUsC7zEMnS8Q==
X-Received: by 2002:a17:902:ce8b:b0:1ee:b23b:64cb with SMTP id d9443c01a7336-1ef44059aafmr14793975ad.63.1715302654957;
        Thu, 09 May 2024 17:57:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13823asm20508605ad.263.2024.05.09.17.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 17:57:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-wxgtk4: Fix build with gcc-14
Date: Thu,  9 May 2024 17:57:29 -0700
Message-ID: <20240510005731.2074507-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510005731.2074507-1-raj.khem@gmail.com>
References: <20240510005731.2074507-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 00:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110301

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-sip-Fix-build-with-gcc-14.patch      | 31 +++++++++++++++++++
 .../python3-wxgtk4/python3-wxgtk4_4.2.1.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..4782e74ef3
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch
@@ -0,0 +1,31 @@
+From 5234a454a1b9f11f83e59909fb2972176497e02c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 May 2024 17:35:11 -0700
+Subject: [PATCH] sip: Fix build with gcc-14
+
+Fixes -Wincompatible-pointer-types
+sip/siplib/siplib.c:3900:20: error: assignment to 'sipSimpleWrapper *' {aka 'struct _sipSimpleWrapper *'} from incompatible pointer type 'PyObject *' {aka 'struct _object *'} [-Wincompatible-pointer-types]
+|  3900 |             *selfp = va_arg(va, PyObject *);
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sip/siplib/siplib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sip/siplib/siplib.c b/sip/siplib/siplib.c
+index 95563e5c..ae3fac60 100644
+--- a/sip/siplib/siplib.c
++++ b/sip/siplib/siplib.c
+@@ -3897,7 +3897,7 @@ static int parsePass1(PyObject **parseErrp, sipSimpleWrapper **selfp,
+     {
+     case '#':
+             /* A ctor has an argument with the /Transfer/ annotation. */
+-            *selfp = va_arg(va, PyObject *);
++            *selfp = (sipSimpleWrapper *)va_arg(va, PyObject *);
+             break;
+ 
+     case 'B':
+-- 
+2.45.0
+
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
index fb011cb71b..cc6b6cef67 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://add-back-option-build-base.patch \
            file://wxgtk-fixup-build-scripts.patch \
            file://not-overwrite-cflags-cxxflags.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
+           file://0001-sip-Fix-build-with-gcc-14.patch \
            "
 SRC_URI[sha256sum] = "e48de211a6606bf072ec3fa778771d6b746c00b7f4b970eb58728ddf56d13d5c"
 
-- 
2.45.0


