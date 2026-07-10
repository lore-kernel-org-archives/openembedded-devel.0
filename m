Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591AFC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 19:45:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1778.1783712739107640511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 12:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oSlm/qI/;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so12594975e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783712737; x=1784317537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ur9g+/yInH9LiGNtxOQGM8Gi9xiJVUBMAXCnjTEo6Co=;
        b=oSlm/qI/ID/XLzlyGAWZj8cLb98pXxwCq6lFpMiKPBVYtQ8UXvQEn/UwOpXZND5zjY
         DzmXsWEoFz00UEzfr6abD7KU00go83auJCD7Wt5XoKSOBTHE7lMlyWwTGYIyE/9a4JBC
         xhDDTJdgAxZOpwOgCEU55Te9gF0FpLq5026DwuTe9wVO/m05Xe++IBha3ZlCQ6U1RRBp
         cT4ocKTCxlAcWs74qKTk9jUYf3ElJcZ7NHyveMMkH7cxZ3KfRYNhWehJkun3w0PRhLkh
         bfXFXXaXZJ7xhwRHZKtvkIAIpbA2CpNbSRhBuPHNAIr4aJizFCmPzI+528B23tXlavOe
         AQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712737; x=1784317537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ur9g+/yInH9LiGNtxOQGM8Gi9xiJVUBMAXCnjTEo6Co=;
        b=SyRHDLniK19zgvfOi3+FV88gkeI/bC32WdoBT5hfz1I8yYzYp0OBNbOCSjiqKCAgt/
         DkGJia4/f30IzDcpZg3obypFTAM1Le9X6rzqsO77AZ+w3T+Xmt8Y9CsYRBsUJA7Kh3+q
         mJvgrjrgmvoUNIdcxaavl0MuN0nBZ1P3w+GgQH7I99931ns1QaMXMoZlxGCibqtbMUe9
         D2+biqW25Di4nVjStpjpRU6M6927NVIDc/smLCANzakrkM1YobAtxfFPdtAnYrPTisgk
         pT+CDB8sxzakD3chG7cFiJyzK5wKauwB2GUkTvJ66r1eJ4vAfaqDZIH8YV3nhm1ae4n0
         fqfA==
X-Gm-Message-State: AOJu0Yx+VB/2ua5iA1lYCMVG6q3XU+Tcke2Jzs9Qumkg4jLqOT/820v/
	awIwMbq//Ba+LWYLVAmEkHfAldyYqWcqEz2xijZmwDLl0s1i8D+C6xehqGN5NQ==
X-Gm-Gg: AfdE7cmekYGR0+jG3eeqR5BJWGiu3eFCnizxMxCTLnF+tgO7bPEPO9MmKNS7qAqzp2+
	BHh3J2cr0ig/8duAVsCukNeQN9Y82OYV1tyD5OMTWXIlBeB0mICs+Fwbft7YlcMoyrpBizKRqFR
	UQJdZbX7fNK4q9y1ONSVC2tIYoP65IiyQGUePQ7rBVZ9n1IPBRjVW2+9AmfkPQeUnIpUyKuxohp
	L5WDYp57d4FyNEnj4sMWFbF3OFP7j1WdqgD3xPI0kt6J+QwBkS48OXLE3mcW0qqCihkR/l8wwDx
	dB+B/9S9VCscybBcYzbSJP3O1GanPlJJ21Sv2+QRs084kAE6Er5TjAQwf1OmyDF/U7pcCEw2Ghu
	JXs7Cj53+4l0nQEVzqzh2aq3nInfxwRXfPStPp36fRmeBWs5CPTmVIxEaxsKzCb36K9K3Bv7sPy
	4BFkJ5bFKVMdR6LrkSN3C0D4cu+J9R5ruSu12Mjk9oESaI0wUiDqT4dTv5rcoFqNjOFqFYGXdG
X-Received: by 2002:a05:6000:1a88:b0:47e:81aa:def0 with SMTP id ffacd0b85a97d-47f2dd215c1mr115134f8f.61.1783712736861;
        Fri, 10 Jul 2026 12:45:36 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm16939461f8f.16.2026.07.10.12.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:45:36 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-filesystems][PATCH] fuse-archive: Add recipe
Date: Fri, 10 Jul 2026 20:44:24 +0100
Message-ID: <20260710194423.1171173-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 19:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128130

FUSE filesystem that serves archives (zip, tar, 7z, iso, ...) read-only,
mounting them without extracting to disk first.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../fuse-archive/fuse-archive_1.22.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb

diff --git a/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
new file mode 100644
index 000000000000..a4daa47c50cf
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
@@ -0,0 +1,18 @@
+SUMMARY = "FUSE filesystem that serves archives (zip, tar, 7z, iso, ...) read-only"
+DESCRIPTION = "Mounts an archive file (e.g. foo.zip, foo.tar, foo.7z) as a \
+read-only FUSE file system, without extracting it to disk first."
+HOMEPAGE = "https://github.com/google/fuse-archive"
+SECTION = "base"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/google/fuse-archive.git;branch=main;protocol=https;tag=v${PV}"
+SRCREV = "e218685189aabebb95d33e2542e2a122ea81392d"
+
+DEPENDS = "boost fuse3 libarchive"
+
+inherit pkgconfig
+
+do_install() {
+	oe_runmake install 'DESTDIR=${D}'
+}

