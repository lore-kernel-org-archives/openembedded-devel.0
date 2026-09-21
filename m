Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00633C982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 03:53:33 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42196.1789962810549455628
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2026 20:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TzXvz5vg;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1961049a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2026 20:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789962810; x=1790567610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BJ0fnyGB3mBPLTzzNYrheyZzZuajsSJDk6O/ahHcAU=;
        b=TzXvz5vgePil17Axv9Kau/aH2XMnNOFNez5mJdHv5dJEFKqnfvgg4pL5pM4I0sjJdR
         EFrQ3sUrEyy1A2WqPBDlh2ahiSDxakE0DRminocbyWl+sJsmX+POc3NlO/hxolp4y84w
         v+ByLkH3QGCIo5FPcsYVv4YigxnmBe8G1+mhkbeF/TsxcsBSio8J5XBs9dwiJXgukFHp
         rHISA7IhlMjl3IU7jWu57ASKlNuFWVTpd64QbhHe9iliY6X5DUu4eQpA8VGTu0Tb+d/P
         ZUsU4v7oda2il871QYX3kGD7r1Lzu982tEUYBntdQBhbeOkZEX98aIIRctN2BAkXdNv6
         YtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789962810; x=1790567610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BJ0fnyGB3mBPLTzzNYrheyZzZuajsSJDk6O/ahHcAU=;
        b=yeNQNkFQef3Yqm+TaSjnMDy9WGBV8lzlMRadGi469vg14Y4VcVxrHV9lMYpQVrMuZd
         61lilLjOhOv7Zor1VVgYA3Q2sxi5pRax7bG7abFs7gjYMEmc2jaNZwIWs0M2aXHrcLeV
         aUu2jNUdmiaGFJgTlaus6Sh/iLkRo2cXTHj790E18zwjbaVVof028OxvxT8OA84GdAig
         IIg5RbZP3s/2gVDyno2lzuGudjfLHI0roEeGpUu/es/nFBp3RLSgeuKdMnXP4mcDZWh3
         Ni8MPQyz05GDC7h7FTiVWTDlWNuuQjEhLbZdbjMhmxZYOO6jnJu+bqR/+jJWnv2E7QLJ
         IpYw==
X-Gm-Message-State: AFuF++lCpriFSM7XdubBPJcdhjBC8OjrCMuG/uB7ACo/i2ZEnqOyumHe
	d/SHdKElN0EKHqPaNXvhgLDrWr/+vkjYWSAt7pFBY+nsmSIXKWegiXBWrMxK3Q==
X-Gm-Gg: AYBFou3yxDr9CNvv3wb2HsGZuSb1uI/K/GLsorRFp8pJX8WDOp68GW1XcgImiTv/t5q
	LTsFJNQrceOo+GheBtroPtt39yttayrqZc0kXbgy+lYoA0sSCiak0TFGclsgKSjbNAhMhN3oBgB
	J+kN7WSdHCAcp8JzR592T3ilrEAUD6uxqO1DCOZPTzqvVczmnkNCevqG9qWmtfOU2RuIGdF71oV
	qM5zrjhv5lbN/FDrhtuBzAh+j/B/cwFuzWHYyrxVRmb6FsJ+I21Irlg/Dj+/j9wkZhUTQVFfqPX
	6sVxuvTEgNHZWam+IQU/K2go6hnasJuK1qNi0ymo5dtdb1V3XN1noKNZQHSh4VtO/v3tWrCwX2B
	F+gb8f+XkbPqqjMlNSiqnSGKmHnnNEybV2/4w1ArCXbvD18cWW//cZm7uo3njL1w9LHrZpi+SuV
	MLT7MVQkCQ7KjYDOU7JhgoN8E+vuLjza8v3MNHwuYe5gpuR2FgX06nruqNHVeku6b68UqNZbZGa
	1UYOkYcVp2Vbh+Xi9Qrlr7BLWDiG/McAQAcIAXUbIvQq/aWWa5oKloWs6yLara1dKbe+l6rXVfB
	kPWY4jCXgILEhk3F68JINRLZHQKB+2mSzwhuwMb2CEMG+h8xu7vD65Ux9n8Th4GNjmjirtq5TaV
	NvweS9ADjZPjjqCmg3m/qQEq3kpVaJJd9h+b7/jccCu/FhCRMxx45g/waL68YY6HizV7D+NgctD
	Ccl5MFB+XS047Rl766eh9K02YDSRrodauIAjpe3NCsiCqhTll1
X-Received: by 2002:a05:6a21:1505:b0:3dd:a007:cb2d with SMTP id adf61e73a8af0-3dda007d24bmr9968027637.41.1789962809837;
        Sun, 20 Sep 2026 20:53:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55a4378sm14924771c88.4.2026.09.20.20.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:53:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] vboxguestdrivers: Forward port patch
Date: Sun, 20 Sep 2026 20:53:24 -0700
Message-ID: <20260921035324.2558889-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921035324.2558889-1-khem.raj@oss.qualcomm.com>
References: <20260921035324.2558889-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 03:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130128

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-let-the-build-decide-if-drm_fb_helper_alloc.patch | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
index cf94ce49b9..76793b44c7 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
@@ -32,15 +32,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  vboxvideo/vbox_fb.c | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)

-diff --git a/vboxvideo/vbox_fb.c b/vboxvideo/vbox_fb.c
-index 063be63..7163780 100644
 --- a/vboxvideo/vbox_fb.c
 +++ b/vboxvideo/vbox_fb.c
-@@ -330,7 +330,14 @@ int vboxfb_create(struct drm_fb_helper *helper,
+@@ -329,8 +329,14 @@ int vboxfb_create(struct drm_fb_helper *
+ 		DRM_ERROR("failed to kmap fbcon\n");
  		return ret;
  	}
-
--#if RTLNX_VER_MIN(6,19,0) || RTLNX_RHEL_RANGE(9,9, 9,99)
+-
+-#if RTLNX_VER_MIN(6,19,0) || RTLNX_VER_RANGE(6,12,103, 6,13,0) || RTLNX_RHEL_RANGE(9,9, 9,99)
 +	/*
 +	 * Since Linux 6.19 the DRM core allocates the struct fb_info instance
 +	 * before it calls into this callback, and drm_fb_helper_alloc_info() is
@@ -48,7 +47,7 @@ index 063be63..7163780 100644
 +	 * that, because the change was backported into the middle of the 6.6,
 +	 * 6.12 and 6.18 stable series, so let the build system tell us as well.
 +	 */
-+#if RTLNX_VER_MIN(6,19,0) || RTLNX_RHEL_RANGE(9,9, 9,99) || defined(VBOX_NO_DRM_FB_HELPER_ALLOC_INFO)
++#if RTLNX_VER_MIN(6,19,0) || RTLNX_VER_RANGE(6,12,103, 6,13,0) || RTLNX_RHEL_RANGE(9,9, 9,99) || defined(VBOX_NO_DRM_FB_HELPER_ALLOC_INFO)
  	info = helper->info;
  #elif RTLNX_VER_MIN(6,2,0) || RTLNX_RHEL_RANGE(8,9, 8,99) || RTLNX_RHEL_RANGE(9,3, 9,99)
  	info = drm_fb_helper_alloc_info(helper);

