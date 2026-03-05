Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1BAF30948
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41722.1772708838399258447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kV2GfVlB;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so4770962f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708837; x=1773313637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0WfDSOO35W65cDyx2v5pG6zOWLTUIfFkixT2zk6kDI=;
        b=kV2GfVlBzN9wrRa/YSCLtPkxqYQU3yJSjZuF6w/mjWzpuq2gt6Y4spkT5oBBThqmGp
         ZtZfUQE3EdGiRIyRzKP3ei0Usn6rPdS/VsATtorEowKdBlQDZflaifUd5MJ0hX+yQV/J
         0/E7ngQu4AbkqwSkMn5+qnvt4BS4LCv885piZFexAr0WzcyNweVqWY3NUQyAq8jxo7b6
         X5yPWpt04yAMLI+vKv4v+jJu7Al9qXWH3MlshFqua+r5b5+sdk01mQW/4Lwef87Rex1H
         MAHMQqsU0ItlOwiXuAvTSryFt9a939+l1EP4ohxMkqPkdn5IVYZ4mDPEl49/Ie7nPjCt
         KigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708837; x=1773313637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y0WfDSOO35W65cDyx2v5pG6zOWLTUIfFkixT2zk6kDI=;
        b=pJEI1c7Os8rIdlH1XvpeWTbov53ijzjKz8nQgT69yIIB+SsQOpbG6/NDJNe7JyDqF/
         c5qThQyc2Hji+Vj8jP4h6bNBv6B1/iVJ2yPf69XGBaSWq8BqUoOJ3xemmGIA2HgeicQq
         WQuJoYM6vrGbfEXu9aPbl48AZFacr+OZvpRaPg127BlZz0xHIu6zhXg0E+zPq1U7lEGH
         KoqGN08lY8+G61Ph9rCdou5jvhkHpEgIcuqjJDNAD1nsq1i+jMPw89S9Q/k2nXs42qYu
         eetWA4V60T5t1Ry96qoqnoyaz71tY1yvLUyegI60XmuFUBCZBP4vA8qy682IRwrJsz+6
         6CaA==
X-Gm-Message-State: AOJu0YyKX6aNf6LIiRcYZGNmmIhYn4j847/ansJulozEVKt8fLtSR34c
	HvgZ35aK71I/WfuNf7czGoeKDeys6IgMeuHiV3PsJjPGH4yFyEGOAuGKNPCgxA==
X-Gm-Gg: ATEYQzwToRemAia0GyRPVOVxqFvoWLUOGNzoItn3TxOSIy9edkQFn15dvRl+q82IvDH
	cA8Ee2hhalqgrLQpFnACravYo7O39nrMVdc6gmKsJq2TEY3WZDLoi57mIPpaJUP+zYicetZN4M4
	5DKCSA1X3x6rxf35zkZ8pXJf6wkw5PjEqbP5ZjjCcuesiEwD0kzms4KEMa1H3wP+dlTzKxlF7+y
	DuoUQOK+ppLbKA+DyZR3/4Mgf/3WbdYAUDj9Rj2Y1WLtFBMAxMYL8be/3yTL4yyYGXVs2gFxLF7
	2dTmQoj7Qvwrd0xxDBZkrcqztFxZaRv0lBKzF1MVJkeRKqLVjt4zd2nXeUpn4lirPnkxRDwcQ7f
	+c7IXxfnM4fIjSjdvtoeViBDuQ31D5pCHNz2SzPfL4HjgDTFI9Gai+tRxEaIo6jPucOHirZhTJ0
	86I9BPjMSuK5Bt6/FnuEYN
X-Received: by 2002:a05:600c:4e4e:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48519854b39mr98907325e9.10.1772708836566;
        Thu, 05 Mar 2026 03:07:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 4/7] gimp: patch CVE-2026-2044
Date: Thu,  5 Mar 2026 12:07:10 +0100
Message-ID: <20260305110713.2893128-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305110713.2893128-1-skandigraun@gmail.com>
References: <20260305110713.2893128-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124869

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2044

Pick the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2026-2044.patch             | 28 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.patch
new file mode 100644
index 0000000000..102dc155da
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.patch
@@ -0,0 +1,28 @@
+From af312f516e23521e1d03255263b22ef4b99761d5 Mon Sep 17 00:00:00 2001
+From: Gabriele Barbero <barbero.gabriele03@gmail.com>
+Date: Fri, 5 Dec 2025 19:13:01 +0100
+Subject: [PATCH] ZDI-CAN-28158: use g_malloc0 instead of g_malloc
+
+To avoid accessing uninitialized memory, replace calls to g_malloc with
+g_malloc0 which initializes the allocated memory to zero.
+
+CVE: CVE-2026-2044
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/112a5e038f0646eae5ae314988ec074433d2b365]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-pnm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
+index f514c2b..c82720c 100644
+--- a/plug-ins/common/file-pnm.c
++++ b/plug-ins/common/file-pnm.c
+@@ -571,7 +571,7 @@ load_image (GFile   *file,
+     return -1;
+ 
+   /* allocate the necessary structures */
+-  pnminfo = g_new (PNMInfo, 1);
++  pnminfo = g_new0 (PNMInfo, 1);
+ 
+   scan = NULL;
+   /* set error handling */
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 9a969bde7c..4f273a7cbb 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-2760-2.patch \
            file://CVE-2025-2761.patch \
            file://CVE-2026-0797.patch \
+           file://CVE-2026-2044.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

