Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E55CA0FF2
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:49:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6265.1756262945034712980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UBi9mi/c;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3253f0c8788so5228185a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 19:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756262944; x=1756867744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rdzX+LQqgdtNJuvUuMMFm2BlU54ywVCUo9G0PxyaGE=;
        b=UBi9mi/c/RhKCkR+8TRQjrUHKItiuuwIayp8/NWKI7eYaaTp1HXovsClc60JsaF5VA
         yOc4z/RxEZ3IsoXNwAWdQT2BOcurHT35rHWoN3q898JaY1K+s4CQrwDrNAZndIzSRhFO
         3/JD7Wrk7cXB6grMRu9H+dwifz9cYAc8jtETDDmc6g5FF4vGj/lsB8nGLyMR6Wgyon2g
         w6oXc4i82z5vfq+q+6uczkx3QLy9DA3qPuUMc6Jh7vIu0MetVzpTq3GRTQKsW62svUga
         U0R8bepnxf70PF+KIyKjECVOfkmHqjnbyk0BTP0/U6EBrUWCnc2+/t/Y2qvQASB2OQl9
         s6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756262944; x=1756867744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rdzX+LQqgdtNJuvUuMMFm2BlU54ywVCUo9G0PxyaGE=;
        b=f+tIrBr/ryRGqw8ezW21FgevN+OczUpgICszUDXuXCMCYi8H4w1Dbw2/Jyb1ageGQP
         0e8RqWDHf69SHTN4TgXUviO4o+I1M+ZJTQRYnnDXoJBKQXo4Qyew3KWqtapK4t2nb0tR
         NA/LCCKTrDIvzeLyJSIbVlDlTeku/yHdnIJYGvh4pQbf3pTS0SkB54E2tg6v/573cy3T
         Wb81k/W0domNAY31K37hfB7qe0eGG+7qJk8rWrtf0/op78eV7dtFCxF/tzPdYDn28BK9
         TTxCI65ft6zUzQ/Um2ET+rK/ifIpv4Fb9AbIMgsaPs7cO7hhuChJn/lBV+nKwgYCWC8W
         +Pbg==
X-Gm-Message-State: AOJu0YyJmqr0rlUvWI2hydGkhnQy+R3FkFsYipC1K25C9uRRbUv2Z3L9
	ZBIxIqbplYC8gqSZB6BWScHKEOiQHbxQUojJbFXPE63zF1ZwRvsiFlHF+GktizF9
X-Gm-Gg: ASbGnct3D5gjrPuTbIwqQimAkiu8xsH0szczZhEhja2BQDFi8nX9XvrVtZvuRJjNKZJ
	VVfPx8xzv1g2MoGiq/JLU2knHCOGmLcmC8Ma1iHv8IK0bHQ1cmeU2Sj86gA+eATvC4qlPClJ6ME
	irNvrur482eAD3MAe31o6qacJ0lAXx5AYbIbWYuSq2bKD9O/MlwnNs4IyWdpWKQSL1tblmTrUhd
	Q0uYPUdDrf3gw2ISAByKI4N+3+60KeYyLQnLeQQzFKJEccAG0EoPNL5kQgqEw5XHOiRG6B4OFhb
	NJv2hwDucfW3g5WPSzJ5sJip5njKsdrLrZ0YIhiU2KX5OcuCKxvQIc7sEgGd3IVfntmqkFz8MY+
	LkLFo9UG73xKANTJwuKp6/NJnUG5YZbSLYcS5A4ChGdjLvbXq0/YvvfrsC+qlfNKeHr0VIJEWu2
	jN9MuAuu9AR6qeFpt1FYGpZAVzQvxucCCa5cFHAYCD
X-Google-Smtp-Source: AGHT+IG80+tuVHLA4hxGl979J8bXsMy3h+X5YKpeHN4cv9n3ojl2JUCFvEU1xkapbWQldhj2BZ8uIQ==
X-Received: by 2002:a17:90b:2fcd:b0:31f:20d4:9966 with SMTP id 98e67ed59e1d1-32515ec151dmr25100410a91.17.1756262943793;
        Tue, 26 Aug 2025 19:49:03 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b4b98sm10357544a12.19.2025.08.26.19.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:49:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] vboxguestdrivers: Upgrade to 7.2.0
Date: Tue, 26 Aug 2025 19:48:59 -0700
Message-ID: <20250827024900.1318469-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827024900.1318469-1-raj.khem@gmail.com>
References: <20250827024900.1318469-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 02:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119121

Drop c23 std compile time fix, its already upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-bool-reserved-word-error-in-gcc-15.patch | 28 -------------------
 ...rs_7.1.12.bb => vboxguestdrivers_7.2.0.bb} |  4 +--
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.1.12.bb => vboxguestdrivers_7.2.0.bb} (96%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch
deleted file mode 100644
index ec75d5a423..0000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 76c443dfd209ddbed3ed4102596a568670d4c59f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 May 2025 20:16:11 -0700
-Subject: [PATCH] fix bool reserved word error in gcc 15
-
-gcc-15 switched to -std=c23 by default. https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-Upstream-Status: Submitted [https://www.virtualbox.org/pipermail/vbox-dev/2025-May/010316.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- vboxsf/include/iprt/types.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/vboxsf/include/iprt/types.h b/vboxsf/include/iprt/types.h
-index 3bcc4146..33b46ef6 100644
---- a/vboxsf/include/iprt/types.h
-+++ b/vboxsf/include/iprt/types.h
-@@ -282,7 +282,9 @@ typedef _Bool bool;
- #   endif
- #  else
- #   undef bool /* see above netbsd explanation */
--typedef _Bool bool;
-+#   if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
-+     typedef _Bool bool;
-+#   endif
- #  endif
- # else
- #  if RT_MSC_PREREQ(RT_MSC_VER_VC120)
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.12.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.0.bb
similarity index 96%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.12.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.0.bb
index e80f44833b..31f7b01aae 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.12.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.0.bb
@@ -13,10 +13,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://0001-fix-bool-reserved-word-error-in-gcc-15.patch \
 "
-
-SRC_URI[sha256sum] = "6f9618f39168898134975f51df7c2d6d5129c0aa82b6ae11cf47f920c70df276"
+SRC_URI[sha256sum] = "4f2804ff27848ea772aee6b637bb1e10ee74ec2da117c257413e2d2c4f670ba0"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"

