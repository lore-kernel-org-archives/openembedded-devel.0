Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01F9CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 15:06:14 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.21337.1759849565919262412
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 08:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j0U+My1r;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso11976893a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759849564; x=1760454364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBNQ9nlM3l7ZZx6ehmlTOtCF3Gq/Ze2D0wutGNajFmA=;
        b=j0U+My1ry6jxnSIMJXETFJq9U00NsOlAxw5cj1XzLiKIGTDvdpm9ijh/HX8jPrwTfC
         y35P1CoVno+mnQeuLZ3Xx+25vwhQsBmRXUbwzWMzXxgitJPdB08maQDLRO2d+VKjF2uO
         qUF9bzciQo4pHqOZUhzkTXjH4S+RJYBD3SROygNGzjH/ON2vyMcW9LC48gUuI9Uy3wYz
         iDpltAIcvXyVA++Bgoddanl8SQkqLc/o26ypa7WgSc4Ptf1VgGr2rFArUcOqHdCcRjF5
         /Z29yD5U0wlRz+Hy3Qb0gM87kXG/TrNZBTmVkd++S60HE0Lb/ry0/i1yY1hd6PiyIUWy
         NQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759849564; x=1760454364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBNQ9nlM3l7ZZx6ehmlTOtCF3Gq/Ze2D0wutGNajFmA=;
        b=qio/CStS6s99O0jSV/mcZQYvX0pDgM51PIIxaDQUE6azgctA+Fo9jRGdG5Egdmv7l1
         3L52rp0WYLohVlK+foU3/2FQi4w93/Onvss2iCbCZGVOS+W1m/SBHVULj0cbfkIo24Zh
         3zvZ6NrRDakDmNB1dkh3VKYUhUEoogcLsVuvO89Vurp3HqN60it5ikR819l9RxNKO70b
         kve99mKu81yTMYKDTwtBrXJYF7V8F5GCxubVIYioALmjn3bwUORsB2t4uRUHPu1rO8wr
         bHVonrvLHAH90O8NZCYBLTEsIG4Y5n1zbNTUQpbFw8GoxEPX23l4s0a58u1E8m/duL7j
         aO1A==
X-Gm-Message-State: AOJu0YxjQgOz8Rt9N1gVc9QpK5yQecQnisviPIsbmf0JB9OcuQwT1bcH
	sdBhB5QtyVHUkrS/j5our4r7+NO4mapYi04N15rhFhGaiV8EpLKwT4Qla1scxg==
X-Gm-Gg: ASbGnctBnzPTDJi/H5XpcbntaRInjrb2+LEZoSNXSW6Mz9vYohFi06yv6N6swDWYhlb
	TR7UV6Kna++MdNpNMPRDDxGDHnajWdi/jUdd2l3MwqXdqbtmyjdk0WAPXM+JFzyWhUoubzchSsa
	UJfUACU1Nlrcbode4p0zWV+0LIaXRjPsKXYIewF7lafhCQoyak8CCQGLWwB2E4Y1kSNJ5DuL3hS
	KR7bKixRSevqC2VyVSYQvBFYr4zEoSLfbQ6WwJ2A/Ph7p6hlQFQCvspFFx39Ip+WuxMKDjzu2Cf
	ZPRoUr0+18MwWCVu1u4HsZ3X6TbUFO7YndQLvZbr1b7Tm2kqUa8QNVUyFJMFw9rPVURv4WQ/fXH
	fP+W5ZkWLec6g/+VFXNRG+Te/Lwp9cLiKF2vBVfrM6x5J
X-Google-Smtp-Source: AGHT+IFF/RvLX3qt0fCGqaDgqqVnbDtDfFc7C1pI5y2sSWGIso+fTriplv3CG087quwAWUNQPXFDug==
X-Received: by 2002:a17:907:da2:b0:b3d:530:9f07 with SMTP id a640c23a62f3a-b49c1280685mr2172596966b.11.1759849563734;
        Tue, 07 Oct 2025 08:06:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a174a6dsm1420322366b.90.2025.10.07.08.06.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:06:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libraw: upgrade 0.21.2 -> 0.21.4
Date: Tue,  7 Oct 2025 17:06:02 +0200
Message-ID: <20251007150602.4120778-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 15:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120339

This upgrade contains fixes for the following vulnerabilities:
CVE-2025-43961, CVE-2025-43962, CVE-2025-43963 and CVE-2025-43964

Also drop two old CVE_STATUS entries which are not needed anymore,
because the database has been updated with correct info.

Changelog:
https://github.com/LibRaw/LibRaw/blob/master/Changelog.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.21.2.bb | 13 -------------
 meta-oe/recipes-support/libraw/libraw_0.21.4.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 13 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libraw/libraw_0.21.2.bb
 create mode 100644 meta-oe/recipes-support/libraw/libraw_0.21.4.bb

diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
deleted file mode 100644
index 01425c6db0..0000000000
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "raw image decoder"
-LICENSE = "LGPL-2.1-only | CDDL-1.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
-
-SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https"
-SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
-
-inherit autotools pkgconfig
-
-DEPENDS = "jpeg jasper lcms"
-
-CVE_STATUS[CVE-2020-22628] = "cpe-incorrect: The current version (0.21.2) is not affected by the CVE which affects versions earlier than 0.21.2"
-CVE_STATUS[CVE-2023-1729] = "cpe-incorrect: The current version (0.21.2) is not affected by the CVE which affects versions earlier than 0.21.2"
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.4.bb b/meta-oe/recipes-support/libraw/libraw_0.21.4.bb
new file mode 100644
index 0000000000..ef0a0255d9
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.4.bb
@@ -0,0 +1,10 @@
+SUMMARY = "raw image decoder"
+LICENSE = "LGPL-2.1-only | CDDL-1.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
+
+SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https;tag=${PV}"
+SRCREV = "9646d776c7c61976080a8f2be67928df0750493e"
+
+inherit autotools pkgconfig
+
+DEPENDS = "jpeg jasper lcms"

