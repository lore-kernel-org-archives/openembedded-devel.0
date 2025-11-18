Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E4CED60F
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:03:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9801.1763463815023565916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3yF77F0;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29568d93e87so48174025ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463814; x=1764068614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt0aIvrH5ZF1MrhN6kp+q7RdUgaVQeKj/vAm+g6A2ms=;
        b=g3yF77F04pKqhnXbAYqR5WXLLoPFv2i37Cu+4Jh4HmunXsxNwEenzKvc/3WJaWUwGJ
         ePx5slnLUZyyJJa42o0ljIfW4237P0nRnPSfWdIfNfT5eEoLs9v6Y9fO9jDL0rc3bdYI
         qKWHgd5yUGU56lwAlIcWQnUjRFEkWsQsQ5E6uccLiYZ7MRdIV3tuL+gGeUxLULdCXF6y
         L0fnsJ/MzcCuTpyPeMDfDPZtTJz9+fzNOpdng3W8m+NGA3IpjXu9pWOZNIlxd2Rb8jYo
         COWYIR89DSFPUDFI4GBoQ/YfjOrcGhP0FH8UeP9YApM5uYwFidBc9mQaD8UmKwA8XMgZ
         sF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463814; x=1764068614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rt0aIvrH5ZF1MrhN6kp+q7RdUgaVQeKj/vAm+g6A2ms=;
        b=LnwUoM+8EQvFv/3BU0WzGKgpa1q/PfS6WH7EYE165ltuX9UL/+9q+0/9zaRyYgzTxc
         Z74gfh6Fc67PR0Qm0nvIq+Qhd4JBzaf2EerdEMb1Ks4H45ahgxBeRYcXqAiPtyW/4L9/
         gyHqvEHtP7QanPwoQJ/FJcyNUhc5ysuv5wUSXH829nrSqLjABKkVkkLGuLnKRlWlIHt2
         3BN/W5Yu3sJkwzrT+zYo+VqV6JxaMSorlsdYAXwERWI+vov+v1DaahwgFtq6ew2AeCho
         PSLzUWZczHm1HSbehADwlGo820tzFuNIl+wYe68o+fc9kN/XsIRmbfIbRN8hteE0Z7o3
         gq5Q==
X-Gm-Message-State: AOJu0Yzm0HPewnw903akpjd3e4FDrV8nw0ZfTh3fK4+ORTEEQRHIWlvh
	I0H39pPrq9bx9I54rqXBP+8WxgV8Plh65q48NFuF9eXjgsNocuJPgwm2n1eodg==
X-Gm-Gg: ASbGncv+ghTWUMIR1Y8YpsPs/WFgT6yG4ra/5qojuIQL3ceSm0fP2c380RLA/kGwmlp
	AQFUFH0zzHZe7dMiOVy8v1fuN6e/Lb/HKH0ULx9gfqHQ50reLhJP0U8uiZFJ1QoEgZn14W2KNoL
	fjbs2mWO3UZa0a++zDHKJtLZ90u4CXdgrUzDTMWZfRBlvIngEX8O8i+X0++fmm3USSLKIUN8EDy
	rab/MnXVu5zKAPCIpZmzXQbM0xfFfbtSmYLI6HAgcGAtdb0szMguWyrB05yNAT85XKuOdJhx6lm
	6WEinlxp4ytcAfqzm9BOHz3Djm6kTuXsXmfc/CwIKULrxx+vwvFnxpbyFZBwTXYfOKqzWi/LFSN
	PHFPhoUYbPI22BFbPs+UuCTnsr4IhLrsNAhduigHTI5VzO5yMKI/eMt+tQQcDZCoigDaKUMgEwZ
	Pvzy+ZNC19eNsFYJwVfbOfikVV
X-Google-Smtp-Source: AGHT+IExARDBYhiTy+yEoreCIG8krEoj4xb42GWdpuXWvrPU+B8h7cNJHl71mOOSyNO4AD8jMVW7gA==
X-Received: by 2002:a17:902:e543:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-2986a6b8261mr186068075ad.7.1763463814203;
        Tue, 18 Nov 2025 03:03:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e46sm167431675ad.25.2025.11.18.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:03:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/5] hdf5: patch CVE-2025-2926
Date: Wed, 19 Nov 2025 00:03:19 +1300
Message-ID: <20251118110320.1635988-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
References: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121855

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2926

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2025-2926.patch            | 32 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2926.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2926.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2926.patch
new file mode 100644
index 0000000000..c752de66e4
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2926.patch
@@ -0,0 +1,32 @@
+From 6680a7795b76d451ff17f193e5cdca7a86b01699 Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Mon, 3 Nov 2025 13:01:04 -0500
+Subject: [PATCH] Fix CVE-2025-2926 (#5841)
+
+An image size was corrupted and decoded as 0 resulting in a NULL image buffer,
+which caused a NULL pointer dereference when the image being copied to the buffer.
+The invalid image size was caught in the PR #5710.  This change catches right
+before the copying.
+
+Fixes GH issue #5384
+
+CVE: CVE-2025-2926
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/d37b537ff256f0fa65cb4f82b20f286ad9a2e1e2]
+(cherry picked from commit d37b537ff256f0fa65cb4f82b20f286ad9a2e1e2)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Ocache.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 6916a9044c..9b82509812 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -610,6 +610,7 @@ H5O__cache_chk_get_initial_load_size(void *_udata, size_t *image_len)
+     assert(udata);
+     assert(udata->oh);
+     assert(image_len);
++    assert(udata->size);
+ 
+     /* Set the image length size */
+     *image_len = udata->size;
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 80828ad30c..8a37323536 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://CVE-2025-2925.patch \
     file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch \
     file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch \
+    file://CVE-2025-2926.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

