Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD9FCAC5AA
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.17320.1758290380553801542
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gNYtDpaH;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso6085781a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290379; x=1758895179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIxa+2WmBouUoM6rL6uhJ45c5Ut+QjqEG8f266mFxbw=;
        b=gNYtDpaHLEeS0TBVgCT4TT/GzHwVg0H/qFsozJ7Zb1KjdCUEy6duDEwUDR5eBNjKqW
         tZcZe6oxJyWzvYN2TPXMBQy1cwUgMb8amvFxLCWZO02p7OKWfnt4l8oMvPcG1lXlMFwb
         l6IR/32QeDjrxlTF1oNUGp1y11HwNQTTe013o/YTlXqMdM0/xBqiqim/n1OH0v85kq+6
         AXCJ+XtcI+kjXy2fw9UsY22g+QELKdX3dIM97OmOBiDTRcW+atuHQoNuQb1To09XaDRc
         OkSwg5S7O2ktzrHODBEGENChEmTD6alTattWhHQMBrmcdFmuQa6o72yli7LQmo4J/wV1
         CJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290379; x=1758895179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIxa+2WmBouUoM6rL6uhJ45c5Ut+QjqEG8f266mFxbw=;
        b=ahShlPFSZbaLxsUHaXjEns/rNUwLl/5VHC1UuwBXCk4SugFlKHTe5Uq55yYuc3E4aa
         q6YMmn4pueIIVhmIM0mZb6tggxMkd9Kh4DKQt8rYKBcFn0vmpaJbNnZ13wQ5zRlT+tVI
         OF1tc7B8bdjrMxj4Rz79W/mCnzkwupA2pItGulMiLKr1b5iTfp05awMSzRuzDWrAIWvD
         WWwToXoLDlZCGYSkDlVJzBGBpQM5dqo5lkGYqdDXmO1l4KBeqPA0blknOry604GPjae9
         0QeyX8zB89iNj87YIi0ykKi2tNO6UW0xiU+l+u9Jla4WVgMO/L4jlPcuwDJOVaLPzA1t
         EscA==
X-Gm-Message-State: AOJu0Yyb0bn2/tR/YgKSmbCP7mWNve6S2DGdU4zgVInp6rh5lGuvAccg
	nE3FyNk3z4bXrksiNToNCDtB2D/FcpnrWWousZkPLOyJQxzSSyV2r7dGAAjzSw==
X-Gm-Gg: ASbGncsPuspWQ5xXXqKO9T6Nr5sywHoNTQIstmfaadci6jymRWeIvkMVN8Y3etQFpuT
	jZ2vKDaWFveExObuvdTk02IVcaSl0ee3/fxPKAz2uI7pSfQu0Yyh5dGORL+AflJSmge35KmG6b/
	7Djitsl9zMrcQIQAzpQmhvqEsl9cecsQqoxVV0v2YQlzr/qIcckKlO5Gks/Q2HPdLL5rl2a3HtM
	2xZbDAxJyvnUBKzen7jhemEjS5V9ekC6fSRoet1Xge5VyfKSP7ZbF1gCzDnYS6uo/27nOIJqCAc
	T4wTo4SdYQa+pMIiJE/kmh4Rdr2UmU20r/I9t69zDBfBdWO+8ws6aPvRLhihRWSeVJJ662eyM5Z
	gn41hjtWjWR98/dMQKajA
X-Google-Smtp-Source: AGHT+IFpUtpscIkeFYMlfrA+S/u8vcsb3Y+EAdODC0Yey3G8qUUyyGpO8xDdRLAu9YZa8Lus5X3lVQ==
X-Received: by 2002:a17:907:86a1:b0:b07:d171:fcd8 with SMTP id a640c23a62f3a-b1fad740e23mr747812566b.27.1758290378835;
        Fri, 19 Sep 2025 06:59:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 7/9] fltk: upgrade 1.3.8 -> 1.3.9
Date: Fri, 19 Sep 2025 15:59:29 +0200
Message-ID: <20250919135933.916848-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119604

From: Yi Zhao <yi.zhao@windriver.com>

Release Notes:
https://www.fltk.org/articles.php?L1898

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e124168f9134ab77910f262d3d0b0e49b1c3e4a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.inc                         | 4 ++--
 ...Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index b1bc83578f..0b2921095c 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -11,8 +11,8 @@ SRC_URI = " \
     file://0002-always-build-fluid-and-export-pointers.patch \
 "
 
-PV = "1.3.8"
-SRC_URI[sha256sum] = "1d9832409fc08c908c64ab40ad9fd8b0e8af5d203651eb9690b810f41e2f412d"
+PV = "1.3.9"
+SRC_URI[sha256sum] = "103441134915402808fd45424d4061778609437e804334434e946cfd26b196c2"
 
 inherit cmake pkgconfig
 
diff --git a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
index e6e68a0cb8..3f18d74c90 100644
--- a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
+++ b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
@@ -16,6 +16,7 @@ Content-Transfer-Encoding: 8bit
 |                                     ^
 | src/CMakeFiles/fltk.dir/build.make:1217: recipe for target 'src/CMakeFiles/fltk.dir/Fl_Preferences.cxx.o' failed
 
+Upstream-Status: Pending
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  src/Fl_Preferences.cxx | 2 +-

