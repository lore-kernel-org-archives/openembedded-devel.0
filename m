Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E95C433FE
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 23:57:10 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.2421.1634774229035781681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 16:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NBgAnaF3;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so3571869pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 16:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdWuG80kynK2Lohmmvv98Uuik3jxE/JaVoHyqLcqEyU=;
        b=NBgAnaF33nvx1X6koJN5P93VDGHx4z2R/+J+p2oKPQP5H1ePIHlZSvOlvUm+rlST2+
         qX2wXvWPMq3CE4cr/nupYjoC5URV+vl+fOXb9vqUuSkhr1yJTQMe4KwI+TzpAyi2WVqf
         6ZG+7nffXtf8FG/GMcyJKWEJDSJ0OJV8NYaarsA6nOByCjLVNReLckGosDi6OvY+Mv5c
         0YU/ZDicukhFtF/4R+JJK6uY9QW4Qp4MhIxbY7rrHBZ/QfI9QlvMQXuFJ3SVJfpsmWxz
         qXKv33sFrzlI1Q7qQEy7MOZYWcFcXc4dQUsLUt2G0c0Ay4wHJk9T95NG+hrVR3GQD3Ai
         YbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdWuG80kynK2Lohmmvv98Uuik3jxE/JaVoHyqLcqEyU=;
        b=R4Fz7iTPUR1E+G0nUSBhBNGKu/+C3hJnfHp8RIEoWOlqGG9bhcFl2AWnFGaIJZrMoU
         VPBEwwJ3o2jraKrtsECO5BeIlyBcB0CZWpR/PWZiAs7k1LMWtdAWHxGR739tQQftuth1
         7j6TZKXup82MO121+rTYp+gHVlM5oYMSCgt+/QHSKUhIVD/vw4NMXjOKw9+FksXKgbTd
         o2Mb9TDy3CRH9Cund2g5IIMKo53YKGmeLAnj/wy8/65iaeaTcV3SZcTDwm9yyBNnKEVB
         oqyJrJHAuzts2uLFY8wiCYUmyvunKLJOhvSzAkvi/rhH1plMfJ624HMhkKS1vBpdkNwC
         vWuA==
X-Gm-Message-State: AOAM530xHYHG8aMY7mWYrmLFdpcEzJuPaMqLQc22DsjS0QWRJM47o45w
	UPAsCGS+vbv8XfTDiS4AtFak8++2HQpbtg==
X-Google-Smtp-Source: 
 ABdhPJxI0BJDZUgmJ8siWm7jBGfToKPc6XFtK4bkff3UX6eiK43inW7woPkkCppuLEF4mALJ51XR1g==
X-Received: by 2002:a17:902:b696:b0:13a:7871:55f5 with SMTP id
 c22-20020a170902b69600b0013a787155f5mr2116683pls.60.1634774228319;
        Wed, 20 Oct 2021 16:57:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 u23sm4222718pfg.162.2021.10.20.16.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 16:57:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mozjs: Fix musl miscompiles with
 HAVE_THREAD_TLS_KEYWORD
Date: Wed, 20 Oct 2021 16:57:06 -0700
Message-Id: <20211020235706.826702-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020235706.826702-1-raj.khem@gmail.com>
References: <20211020235706.826702-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 23:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93508

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs/fix-musl-build.patch              | 15 +++++++++++++++
 .../recipes-extended/mozjs/mozjs_91.1.0.bb        |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/fix-musl-build.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/fix-musl-build.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/fix-musl-build.patch
new file mode 100644
index 0000000000..c0834af589
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/fix-musl-build.patch
@@ -0,0 +1,15 @@
+Upstream: No
+Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
+https://github.com/void-linux/void-packages/issues/2598
+--- a/js/src/old-configure.in
++++ b/js/src/old-configure.in
+@@ -1072,6 +1072,9 @@ if test "$ac_cv_thread_keyword" = yes; t
+     *-android*|*-linuxandroid*)
+       :
+       ;;
++    *-musl*)
++      :
++      ;;
+     *)
+       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
+       ;;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
index cc985661d6..57bedaa70a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
            file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
            file://0004-use-asm-sgidefs.h.patch \
+           file://fix-musl-build.patch \
            file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
            "
 SRC_URI[sha256sum] = "3b913d6a52c95a8986123c98543f1273812a2d59f2891b4b1c604e35f4580766"
-- 
2.33.1


