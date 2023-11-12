Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0EBC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:18:03 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.22582.1699820274625335217
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGdYZDr2;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35930447ae9so13890705ab.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820274; x=1700425074; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7bpYVxr+ogQWJ5eRXZXPz9QTmnZCIaMqpQaukn955U=;
        b=QGdYZDr2V3P2T1jSoV+qIC6CwviRtqmnC5xrmPV8WVpZkY+4OehE8rOU3Tb8yE1Kjt
         5OnbaCktxbqWFY7YOnAZ8u/M86EYDBgGO5AIeKi/saATj+Vjk8/5fpSvN8NcBP7T15nh
         mN3aBC9rZPmP9T2krc0x+KQ82RTR3CKeBrDBtaSbocmg/J3IkDIAR90HhgdLm0CDgWy6
         lx3WCYqwIViZVk302ZBoSpRtIfa4kON713tRHOlbjGWYCmYy/TJEMS1HLnRR9ab1wlIL
         M3fieX1mIk13Ub0UGwBKc2U3ms0zVhAf3hfxclkxNJaHocLp4UbJLZ157mmAHEcYJLUy
         tWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820274; x=1700425074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7bpYVxr+ogQWJ5eRXZXPz9QTmnZCIaMqpQaukn955U=;
        b=tZC/S3ZbO0Spm1lb87GBCRJxMwsKsg6Czt3H7MbFLZrIigdwFN+LTuXGLkbOZhaTdm
         NbO0g9oreJYHnnr7Isaj/64s8WbGfwkJnNZq9cHCvEutJhJQVHG3wOB3ob+C5ZSaX9Wd
         7oFT2DQozEDHwMwxLx4GA1spFeYbqVgLv0aGOGcKA/arjAm1s+Ayp390GLT7s4VvqorK
         dwXj77Oqi/Fz9GdcKyRvY36o7OeK9oyc0oEkZ8W/mAwPbKEuFsONEZyuVkB4ASyMsrZF
         cXNc1EbSGjGz2vSALRL0I9hgTfTnaQr9xt58ddM0cTUts1sdgtZeLaXmkDtAk+dmxWwY
         16cQ==
X-Gm-Message-State: AOJu0Yx+EFo0Nd3fH2/zV8nlS9xmUlHQt9eVgjiQac6UDQ6mfrDstXFI
	xHRcTXUX0ludGq1hrQR9ZPfh+tI5OV1D5w==
X-Google-Smtp-Source: AGHT+IHj/O2OE3Wx25LdxQqcmpuEU/buHt84XBd+PDzTaoZVmKtVoNiJq/YjhN2SI3IHDarCA09W4w==
X-Received: by 2002:a05:6e02:154f:b0:359:3150:c696 with SMTP id j15-20020a056e02154f00b003593150c696mr7600492ilu.8.1699820273765;
        Sun, 12 Nov 2023 12:17:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a63df08000000b005ac384b71cbsm2954892pgg.60.2023.11.12.12.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:17:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 12:17:50 -0800
Subject: [PATCH v2 3/5] toscoterm: Skip recipe, slated for removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v2-3-f38d4f960d44@gmail.com>
References: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
In-Reply-To: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106607

It needs to be brought forward to work with latest, it fails
to build with vte9 0.74.1 in meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb         | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 639388dece..fafa247772 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -891,7 +891,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     pcsc-lite \
     pcsc-tools \
     sharutils \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "toscoterm", "", d)} \
     sg3-utils \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "uim", "", d)} \
     uchardet \
diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index b9f26051a1..654e886cab 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -27,3 +27,5 @@ do_install() {
 }
 
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-ibm437"
+
+SKIP_RECIPE[toscoterm] ?= "Needs porting to work with latest vte9 >= 0.74.1"

-- 
2.42.1


