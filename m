Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970F9CFD2F2
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.972.1763839896193529363
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vr0VUgPD;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso29830945e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839894; x=1764444694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoQyaGD3W2t28OmTyV+i79Abxa5U7rArgsD6EmxGkIg=;
        b=Vr0VUgPDTZ/0m8Ld6CvMbCfTGanojRdE4Q+gdEIGAyKMAP4UeD8GKGvbaXUkAvllDK
         Axkttp4vnY0m7zM1Wp4VIKU7/x3BblRX2aG2UL25Pp5cEMWc9zJSE3MZfqFm7b2YYJOp
         7uMowSmQzQc4OWbZKBR5LnOmrGVeTsBXu3jp72op8FpeMLgPy5HT1qBs6FgGJMrMIc4I
         4uGez3Iwx2ZqTXjqxVRy5KRgRQ5nAvuM0+9bJH8QC6SNscBau+2jo1JNr/HTnu0HCxw0
         0RIl1zsveFO2YUPkOKXZEOFCcgg85ykEmyM+S1iFAJ5hXSVTh/3l5tqlN0eRZNKBF/eb
         E5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839894; x=1764444694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IoQyaGD3W2t28OmTyV+i79Abxa5U7rArgsD6EmxGkIg=;
        b=rve7C7zwOunmCK6itoVs5UwyqEGCZYPMYK4WIYgft+c56mIUxvVie8duaT4N08wg2n
         dbI6KHu77zawf3O3PUlkkcu1nxCogHTNyCtS9IOQJg/lrBpO6YqJEfGc8s1Lffzu7sSR
         sqBi+eQJqaJpY2RqaaaS0LT36rVb9x5rxGyUHudeRz4Vch+DnfWvCYTWm6HDZWoOG1B9
         Nj2OTMn99mLSOJUsM/clDp/W7IB+WAMFsYOQF3//cLrjsIe6KhSu2x8Vcno6imT0YkpJ
         nlaEiPQ0C72+skfkJ/nlEXaIhhllOF/Ur+JtfPFSg3ct6ZnRqg+VEbNodDRoTcsFzvkj
         LGFA==
X-Gm-Message-State: AOJu0YzPLC1dLIztG5uyXTMmpBdpQf/ps0eSE8gAKk3DcmpBIBm2CUxy
	TjmmXeb7/gTeRlek3SXw25rBw0kyAf172SjFc1CpM6fWOdCUEjGqibbcntQWAkLP
X-Gm-Gg: ASbGncv5O+EhD6g4N5Za962b/zMLqisI5AG71iHbeDenlIgKszUAOY8Qvb9al8TRaOj
	v2pegMQkLqTBQOV40BSQJlPa14evNiqnxQOHa7R8PylZDB+SfNAs8nxr0SGmX7z7+DkKypLvehY
	UUysJdEjvc+qJOQWyYX1n46e2ZqkeWoKreGwACCJGkbjXEslkuGLUkOGZ32vqYuYoJfzzpXlhGG
	CY8Bv3SdZQ7hknO7FZipaX06YyCaj0l1Qgx2jw5E0ZC9TUdqSWLWHhEehQkwmQJnL06ETM0I1fz
	lvl1zYHwiiK17vUR9XXa2vIMgJKuapj1bLrIkhVTzKpV5SBz105FSj/1w2R+achUZLcuMdpGhAJ
	VQnjTMbo4bOawFiLWmT6lWlXTFztc2tbGKM5h2D8dMJQ82y5dNVpBhNy7rKWKJq9wMkGWO6w7oJ
	UeV5OXjyoY
X-Google-Smtp-Source: AGHT+IHOVY8nSUWofZ2ivALuOFFCEx1MR27Ax9Z8eUcAmpsKSUCGyC2N1I3fhQgKJCRkInNu8WleAA==
X-Received: by 2002:a05:600c:470d:b0:471:1717:411 with SMTP id 5b1f17b1804b1-477c01edab1mr84591685e9.24.1763839894402;
        Sat, 22 Nov 2025 11:31:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/10] exiv2: patch CVE-2021-32815
Date: Sat, 22 Nov 2025 20:31:26 +0100
Message-ID: <20251122193128.1703871-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121986

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32815

Pick the patch from the PR mentioned in he nvd report.

This patch is a combination of 3 commits, which are so
small, that it is still very readable in this form also.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-32815.patch          | 36 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815.patch
new file mode 100644
index 0000000000..238e1cfb84
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815.patch
@@ -0,0 +1,36 @@
+From 14fc89433d22f56fa3ec973d802e9316a268deab Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 23 Jun 2021 22:39:31 +0100
+Subject: [PATCH] Don't crash if s > size.
+
+CVE: CVE-2021-32815
+
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1739/commits/0c17eb33c0a7fad1796ce23b8bbc32067f511aed
+https://github.com/Exiv2/exiv2/pull/1739/commits/04466168b87dedff4ec09c09e9c23f2334ba1734
+https://github.com/Exiv2/exiv2/pull/1739/commits/c79d83f25fdd09218697d482211a61db87ce5333]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/crwimage_int.cpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 2e3e507..0232867 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -1226,9 +1226,12 @@ namespace Exiv2 {
+         for (ExifData::const_iterator i = b; i != e; ++i) {
+             if (i->ifdId() != ifdId) continue;
+             const uint16_t s = i->tag()*2 + static_cast<uint16_t>(i->size());
+-            assert(s <= size);
+-            if (len < s) len = s;
+-            i->copy(buf.pData_ + i->tag()*2, byteOrder);
++            if (s <= size) {
++                if (len < s) len = s;
++                i->copy(buf.pData_ + i->tag()*2, byteOrder);
++            } else {
++                EXV_ERROR << "packIfdId out-of-bounds error: s = " << std::dec << s << "\n";
++            }
+         }
+         // Round the size to make it even.
+         buf.size_ = len + len%2;
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 389d8da921..2807cb8948 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-3482.patch \
            file://CVE-2021-29623.patch \
            file://CVE-2021-32617.patch \
+           file://CVE-2021-32815.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

