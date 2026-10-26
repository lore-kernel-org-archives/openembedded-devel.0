Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39572.1793009945419506454
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RsVJfSHO;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so2026007a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009945; x=1793614745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCbv5aFli/SUaqr63iGl3VFZls39DwvVgdI8l0oomms=;
        b=RsVJfSHOnYhqQbpU58UaypaO26l2ryZRY+4TaYzYOqusz9ihncJB3/5hfgyeozw+w3
         Ds/uhNcBtUmMK6nNXRwSB9Fnv1mdFOhlxOLpsoDfUlf91doPtBRrVKFe4gA8jq/PuZfK
         0GEq42lNDrZjravRq1nrYMg+wHKrFhQw1cP2CkyfV5z52wlR2ZJWq/eP/xh+E+6bMVq5
         yESnVqfydbr20GanhaU59sSKMrLa0DfI6kq7qDPe6nem4/jNfSAVyN4s5xMEeZGx6cWr
         J8rVlgu6zO5QlTSRGEUYJ+mFdED3Dwz5N1vACNmlOJ3hTUC6u5Ypvqve5E/Zq61naqi5
         O1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009945; x=1793614745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCbv5aFli/SUaqr63iGl3VFZls39DwvVgdI8l0oomms=;
        b=HXjOz9xBgdZ3yzAwyRN+7PEY2cxXPfw1qeC4b7fw01+8D/Gue/uH3Dhcn2gBd/S+O/
         izQIoZEWtUEUq20hVferzMSf4BwAq+5rOvtXbU6ynIu9CoMMS2eNvR4kttMSYmjlFbrg
         hMruNj1S+toHwx3uVU5O5Ft2n8m2l+ugEpy9IG0G56WakY13sgHT9OuHaLJoSTJzUdgL
         OeDiV+cEdGN/tNLFf4AK8sphRAP7rl8pYPGcpivWVMmRAdHvinh/nU00UeUHkUjPrKLG
         HW+H1PaN8v1EH4NhMPQpuUfy/tv1M1edMGxh0Ye6ftu7jXxw/JDCN07evBPZQ/JnttDS
         qdfw==
X-Gm-Message-State: AFq9FYKp04dM5fTMhU1dvzfBZ9qqTFicdcerKndtF5DGqnMkd6iW/tLG
	F8PiIZJTy2UN6ClzzzC/zbabNwT/hRkV+lwdP7Pqa2oeBe6PomxvFsTn+s8rlA==
X-Gm-Gg: AYBFou3AHgYVwOHPk5Eu/TfQxLsXpHv8kANBIdVOjFEtGXA0Lqu/2fOXmijhOF8rhGJ
	NFvIZxiGfV94NyFQz3G100qDnhmo2oO3JeRi6GK8DRCk5E6QtwRU3uzU74AW54OQmmHJbPg0UZh
	yQ/yrZgHIV2s1cs/CIyai/L1zNqw5XvDBe9KLZXWU24ir73gLMzc/E5BeoSL9f0hKCQH3K00hIn
	QlYZCmUp2ewD7J6XA3bgFubh0K+y9mfT1nNFUmcNsu1IxbL31ariiCNyGyrhHlNFvAy6qeLI1tR
	3nI2sOOAw68WLA0qaYPq9S23lA3Nrwg7QUuAKPbVnhUyi03j+1jbvoeL1R4lBoW8WIam6izlzoY
	WYT1nxvFthdkSSeD26ZOtga8QvSdS3HEjRw79h6s8nl/h4hg4GA/jDMk0bE4WA644FSJt6gk9E4
	jLdhxYL1kuYuPr1JcAhxx+/rTDd+OFSwnY1FmuL+sY0mPZPhzYiw7pCH6wptFBqgIUudHI2UnBT
	u91iwBstq+5OncKES5WKW4F0uhdcKS40W6hpvA0DaB6ZwMhXwaVp2R0Hbp45/fraeu6C7Qh2zhH
	Sdix1SORL62Oew+svtDETaDfYZKNHhU=
X-Received: by 2002:a17:90b:2645:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3adead4c29bmr5382998a91.35.1793009944674;
        Mon, 26 Oct 2026 03:19:04 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 1/10] libmspack: patch CVE-2026-110602
Date: Mon, 26 Oct 2026 23:18:41 +1300
Message-ID: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131423
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-110602

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libmspack/CVE-2026-110602.patch           | 41 +++++++++++++++++++
 .../cabextract/libmspack_0.11alpha.bb         |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch

diff --git a/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
new file mode 100644
index 0000000000..15d690945f
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
@@ -0,0 +1,41 @@
+From aca3603bed20772fd86ce5b901005668cee835ad Mon Sep 17 00:00:00 2001
+From: Stuart Caie <kyzer@cabextract.org.uk>
+Date: Mon, 15 Jun 2026 16:33:33 +0000
+Subject: [PATCH] kwajd_read_headers(): initialise pointers before returning
+ any error
+
+CVE: CVE-2026-110602
+Upstream-Status: Backport [https://github.com/kyz/libmspack/commit/4d868504114346aa767d435fbb89a8b76603493f]
+
+Dropped changes for test and ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ mspack/kwajd.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mspack/kwajd.c b/mspack/kwajd.c
+index 30caa89..ede91dd 100644
+--- a/mspack/kwajd.c
++++ b/mspack/kwajd.c
+@@ -160,6 +160,11 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     unsigned char buf[16];
+     int i;
+ 
++
++    /* initialise pointers */
++    hdr->filename = NULL;
++    hdr->extra    = NULL;
++
+     /* read in the header */
+     if (sys->read(fh, &buf[0], kwajh_SIZEOF) != kwajh_SIZEOF) {
+         return MSPACK_ERR_READ;
+@@ -177,8 +182,6 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     hdr->data_offset  = EndGetI16(&buf[kwajh_DataOffset]);
+     hdr->headers      = EndGetI16(&buf[kwajh_Flags]);
+     hdr->length       = 0;
+-    hdr->filename     = NULL;
+-    hdr->extra        = NULL;
+     hdr->extra_length = 0;
+ 
+     /* optional headers */
diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
index 169a5f271b..c612e54e17 100644
--- a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
+++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz"
+SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz \
+           file://CVE-2026-110602.patch \
+"
 SRC_URI[sha256sum] = "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b"
 
 inherit autotools
