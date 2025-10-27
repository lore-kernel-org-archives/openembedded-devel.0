Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA3ECCF9EC
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.33908.1761574564805408676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bT61dUId;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429a0d1c31aso632102f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574563; x=1762179363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uv/qhVUVz8UNDk7JJ966hZOYvR25y446bd1AgmDQDtM=;
        b=bT61dUIdz/jS0ArgcHNtNHWeSDnTb/a5XuivNtO/P6fsRIxJ4P8UybucxI/GB8o59g
         cX4tptUja1wpYwN207u2DTVADT+AtDh8LN2xmMTfxKAHUQD1ErvEMr0u8gAD7jEfBo7S
         M9L8EIwzy7r+BFSdmyVW/Tar9IFQzc5qWVoI9N0OGIoZ/BcVp+qSRz3Z8UeYvdpyVwFE
         XOlgHyQVwcEEv/AFezQpkmJF2rHt+nAhE0udoH6A1/SUZOIJczPxaFXb+DY0OZqSNG6A
         T9U4C6RGmRQmSkGgzdCMaRmoeBJrs97JMWt/VpNAoPyhBgXc3+R00/fjybrxPYl4TLvN
         +kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574563; x=1762179363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uv/qhVUVz8UNDk7JJ966hZOYvR25y446bd1AgmDQDtM=;
        b=YNe2DnKAX0uXMqaRg/dpdnC46FUEUWaIKEXV40jvhyRY7AakcshuNSQaU88KoDPklh
         iH03NrZTC4V7JHpZQcv1fZ/BjNGqw7/p6XdibP7mlO69zVY2WZci79ob+Vrg8q+dWors
         aYwYsmth+embZvDQSijLHulPWDBprRByif9y3M0tEFc86TmWFQKpYCVPi2x4jBegU7tt
         eDkavunSTgoB2qsAWKS8ojRhmLkPr4Lrm9i7Gt++XbhsbpwsIAh7bJklNefSwCYpormi
         85xFSLQwx3gCtsqjJN8cHfPgtsIQp8yMaOWrxhhUcieousLDF7fEt8GOpXSr0guue291
         DK7w==
X-Gm-Message-State: AOJu0YzzPE+5BtucBiwMYH/7HDA99pcv/Zz06u+jkXsPy4ua6iatwsqo
	viruJon6MOM9AOx21d/5LE6GCCFzjvSmT6u56hTaDXtiRSRk5/lorfLYaao1Eg==
X-Gm-Gg: ASbGncuc18FUsldwzor5T6iZkwQUaS88pf9A9qrgqhLdWLWSmqd2bFTTSQzHicgGNwP
	nf2ZBvEHahxiOt29IgaXqDKlY3kq92QoUWbhtlUPIbCaNfzARGFj3MYY9VNLcJQht5qRfbyHXKq
	hpxq5b2MenzIE718GyAxZQYHzloYkUy/ceJC5ihSlB0umr9sfs4RFRffGe9XdVzYxIk1oxxwvGt
	3rh77dI7JsCwAEwhrXL0lPGqm9EhKzkMsakjmF5R1eonEQA0CFP0WKGH0U7+j6wVOGi65ZSpdyk
	qwTOHvxW3n9Q2GAinREv3ijIdMnJlX/0aMxomVimQYHrS9rnKrwN1bpvLAHfEWM2Kno08sO1+3f
	h3e9ahdv+NXjz4fLUd+MK/+pBC1qNP819sqkX2SQSJvMELs/+HSHm7OKoe84s0CZ5+PlQ81Hf/A
	KXUESiAVoJ
X-Google-Smtp-Source: AGHT+IGjez9o3u/P3u+lEb/0us5aZeN8xxiIhwa5PsJQ2kHPbRwrvtLLNN4oFVaXCM2GpYwTU5s+xg==
X-Received: by 2002:a05:6000:4014:b0:428:3d14:7378 with SMTP id ffacd0b85a97d-4298f594837mr9257734f8f.24.1761574562960;
        Mon, 27 Oct 2025 07:16:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][kirkstone][PATCH 04/10] klibc: patch CVE-2021-31873
Date: Mon, 27 Oct 2025 15:15:51 +0100
Message-ID: <20251027141557.1893563-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121044

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-31873

Pick the patch mentioned by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../klibc/files/CVE-2021-31873.patch          | 43 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch
new file mode 100644
index 0000000000..4dcad20000
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31873.patch
@@ -0,0 +1,43 @@
+From 34f6170eca948ad221effc79db1f38c51e20329f Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 28 Apr 2021 04:03:49 +0200
+Subject: [PATCH] malloc: Fail if requested size > PTRDIFF_MAX
+
+malloc() adds some overhead to the requested size, which may result in
+an integer overflow and subsequent buffer overflow if it is close to
+SIZE_MAX.  It should fail if size is large enough for this to happen.
+
+Further, it's not legal for a C object to be larger than
+PTRDIFF_MAX (half of SIZE_MAX) as pointer arithmetic within it could
+overflow.  So return failure immediately if size is greater than that.
+
+CVE-2021-31873
+
+CVE: CVE-2021-31873
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=a31ae8c508fc8d1bca4f57e9f9f88127572d5202]
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ usr/klibc/malloc.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/usr/klibc/malloc.c b/usr/klibc/malloc.c
+index 413b733..14bfa63 100644
+--- a/usr/klibc/malloc.c
++++ b/usr/klibc/malloc.c
+@@ -146,6 +146,15 @@ void *malloc(size_t size)
+ 	if (size == 0)
+ 		return NULL;
+ 
++	/* Various additions below will overflow if size is close to
++	   SIZE_MAX.  Further, it's not legal for a C object to be
++	   larger than PTRDIFF_MAX (half of SIZE_MAX) as pointer
++	   arithmetic within it could overflow. */
++	if (size > PTRDIFF_MAX) {
++		errno = ENOMEM;
++		return NULL;
++	}
++
+ 	/* Add the obligatory arena header, and round up */
+ 	size = (size + 2 * sizeof(struct arena_header) - 1) & ARENA_SIZE_MASK;
+ 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 87ca00b857..8c2f1b8d62 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://CVE-2021-31870.patch \
            file://CVE-2021-31871.patch \
            file://CVE-2021-31872.patch \
+           file://CVE-2021-31873.patch \
            "
 
 ARMPATCHES ?= ""

