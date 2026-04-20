Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386A3F36C2A
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14177.1776666480458192286
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EL1b8KR6;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso4550165e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666479; x=1777271279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzOWvUF/pAuha6IVGQw4W6Vok7soPfsFyhj867knzlg=;
        b=EL1b8KR63YJcscFiEh4V84tReRJAFjmJbtZ9btrf7NkynTdwgWA675o1RGyK1YZspA
         XtnbrlW/BtM7YmtNGvCwNykvJyBzLc98VmJbytFZqTccUDhQnHI8O+uNvhebVyEYmvIr
         lg0gd3ifH8bPruP09AxVyLdMwUlYQU8x6Gt45XetsnqxrcsPiR9RVINGSXNVSgcM3r0M
         DgyAp5lGL65X0yM81XB7yJQ6Wn07dLzW+pUDerxL50v28g+po1UmOkJzVUekt4OwEB9p
         ygduIkNcxSsRRqAl62KEyF/pykRcaHM4wZ244pEWbylqOA+RfQEW8EOb88fG/2mLDY/q
         85QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666479; x=1777271279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzOWvUF/pAuha6IVGQw4W6Vok7soPfsFyhj867knzlg=;
        b=CAFrAkHX5+Jit9XFh6lFrJwGeXegwtEP4APYKPIT+dl25jyndqXrDp1M6Kd/MRjaQE
         ZmL/C4q71d65YZSbnN7oRuki+5H/fNvncBcH8ysn389WWMRyxmum1pDzTSSMvRfhDFw8
         cxbXPB0vQdevUclXBc3qBCT3ni4tMmTtPFr2aIRB5s8RMxqhkqASmXn8wV5d41eCg64a
         /PImhNOVA3LLbOTuLcunHGiUYosoRjjp1lO9rYQtggKpB/mlR2H74VvbZ1S5+0LXuBG/
         cL5Y4XzkkT8DUWESguYG98ESObqe3H5J7S4w7l0jtVA0sSgqmCnICdxKo3tr2isxxExh
         1U0Q==
X-Gm-Message-State: AOJu0YxmM2oft3Ceu4Y8PIgY6rGAkU5YHA8lMuP+TFfoCahNWrooPpzD
	G7N7XOaW71h9kfKrqISPsMSyOa1KcZrNdxeJOdpbEhzhJsCTg9btkDPKfwNvzg==
X-Gm-Gg: AeBDietRQLW9FIYGo1fMduLWt2gWYhSkqMuMIQAva9T2rZX0ZXVI/GrGJm4t9g3TKAY
	HZQaV4r2kdF6OKWroS7YC4Ogui9KFoPQA3QehfNyhsQwGdTHy/6R1Q2Uxqu5m+T+01CM63dnG8Z
	qVkqJpj+dFGd4CCRkqgtdVb7OZ4Rib1U8Tm8j/L9E+gwGh75jIdtYBe/yYb/NzaRW+PmAIRt6iy
	EeN9YupcOsS/+yZruO6cNtEeGXZMuGmiGfOgutUFE/cVvJEvJTqXzr3g9CtCLi6AmZOYlrIRq0O
	p0ptGYqn66jcuakXmTSKy7UHSS0SrhiFrS8s47nBCoxg/I+hnVoW92niH/KvbfXf8Btoz0OTrFH
	g5iX8ys4BLG2816oedr1H4Wq/8Pm04IEKTjobhfu8yO3vDwrGqerCI0Pe5fTI13FAcwEE+tcBc9
	3ufcMZOYwybLMtiEDuaWJlRNyG3msNobY=
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr170126255e9.14.1776666478781;
        Sun, 19 Apr 2026 23:27:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 10/17] libgphoto2: patch CVE-2026-40334
Date: Mon, 20 Apr 2026 08:27:42 +0200
Message-ID: <20260420062750.3795917-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126474

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40334

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40334.patch   | 37 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
new file mode 100644
index 0000000000..883582dff0
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
@@ -0,0 +1,37 @@
+From 20b33a26b2efdbf2c35c5cacc54a041855ec764b Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:15:54 +0200
+Subject: [PATCH] Fixed Canon FolderEntry Missing Null Termination
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ptp_unpack_Canon_FE() copies filename with strncpy into a 13-byte
+buffer without explicit null termination. The EOS variant at line
+1451–1452 correctly adds fe->Filename[PTP_CANON_FilenameBufferLen-1]
+= 0; confirming this was recognized as necessary but not applied to the
+original Canon path.
+
+ CVE-2026-40334
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40334
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/259fc7d3bfe534ce4b114c464f55b448670ab873]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 09dcc24..982b4f4 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -1369,6 +1369,7 @@ ptp_unpack_Canon_FE (PTPParams *params, const unsigned char* data, PTPCANONFolde
+ 	fe->ObjectSize       = dtoh32a(data + PTP_cfe_ObjectSize);
+ 	fe->Time     = (time_t)dtoh32a(data + PTP_cfe_Time);
+ 	strncpy(fe->Filename, (char*)data + PTP_cfe_Filename, PTP_CANON_FilenameBufferLen);
++	fe->Filename[PTP_CANON_FilenameBufferLen-1] = '\0';
+ }
+ 
+ /*
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index ac7892151f..e8e56171a1 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
            file://0001-libgphoto2-fix-const-correctness-for-c23-builds.patch \
            file://CVE-2026-40333.patch \
+           file://CVE-2026-40334.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

