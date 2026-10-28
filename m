Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36222.1793161568557645016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=a3QxFOTp;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so302598a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161568; x=1793766368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCbv5aFli/SUaqr63iGl3VFZls39DwvVgdI8l0oomms=;
        b=a3QxFOTpyGyWbVnsulrsVLbHVbyBIoHJIMZFd//+41kYsyfyQei9eNl7UbxbN15Xkt
         6OdJqfNruzwani66RulgFBDq4bJonkl7XyX0UfUKovn6xQ0sDjtcrZKLUB3qhbthH7sq
         k12qZhVd/v2w6/jLK8GdG+nWMhm3nUA00mpZW6znYkRZLbboMeaFJYWG/nWevxT9qGNP
         F06M8xlFsW/KolAi8AOxHMmvpYMcKjE/JC5ev+lAN/WWYFWtd+IruxsrK8+3t3xTIc2b
         CtcgP1BFQsQHO3ENK5BB9kDdUeun03qmjoU6P7Q2JCEvxYsz5nMZoqmz46HGbgTOH2hn
         T1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161568; x=1793766368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCbv5aFli/SUaqr63iGl3VFZls39DwvVgdI8l0oomms=;
        b=QbmjnGB1pGyeJToHbxiWczTCWNlQAZWQpFSUoT224Nsre3zTZ+stqov5b6GuAInbLA
         jUqee4kVfYtSupADfxFUWZG3GGTNKZ/Emhxz6NJgMCDM5v3eXmNLPaCQ2uuvanVjv/2k
         ryIXOggM9k+p2lo/VCc9/womYVhh7YbvC3XA3ew+qMFeuQY1QQxwKqhh7xh0QDUx3wqT
         AUA0Q1kGr6EUwW4Ai2qG0opw4lQbccvcsGjFTN+qS/mp8keVYOSK5g5AXcs2ZrQ3qGAX
         MiRZzuyhJdAEaAbgBSwOMaswmYRYM0vcFIT7AduU00m0woDOSFxEVoIE0LY8Hlwaos3p
         gtGg==
X-Gm-Message-State: AFq9FYJDAx1br+wmKu3yx7msf1E/9jScqCEpJGC89agVXoSbA5rFDEZv
	gqWq2LIWrfiYL+vt79aubNL0EQLKTHXGfarouBVWps/Ds97E7AKj0uK9nl6sIw==
X-Gm-Gg: AYBFou2+r+jHi7LhEKzCyEsKiqhDtABKpIodYYuXOgbBVq9w2oTT4sSBRhM0L1iOynF
	Gw5KYjmupV6xb5l8IjsDAcTasTeMPjmYtp+U/Ufe++8kfO6G68DkXSCTPgKpcfwbYlbIOiQB2MS
	G3Hn03lfpF+DNfvYHOdAVhGWGquAZh70eSWiF6H04llgqWVvNiRQDqmPNpeecgCzyBLlDtsv1zY
	gH24NMyLeAhqtvROxDWPDQVAHJvWsKKx2Yk4GggWoSJnArTT7sEpbDz3nWmQuAlo31VtVJmpClA
	ZNkaHZiUFXBo1PcWW7tu96rc3akZ7maqOd/s8RQ3fX4f5I9dtGilpFkKImOOQoihSy22Aw7qhTl
	X++EoI0g1U/hUys+C+BCb0DO1aMAlI3r5C8GmjLqQ+Q+Tm22+gS/EmH43I3fT9L405oqsuwO+2O
	uRN6JqZouSuSNCemXk5wAgGMRh7AfLpbbn4A/esaGoyUEyXLa7IkZDOby657cvC3Xb64l4Jd36Q
	zqLWQljDxZLnsbB4rCdv/HVIu+kxx7428DvLbRkaGP8h+6nH262Y9beEupL5X+5rCCComoj01Dm
	aKez+f3fWEfeoXkbbd7hUk/T+kWd1qn+Ey+EarKafuUL0Ii5bYVoTqFBTBKasTfZZfoD6h1Y9vv
	TukoMG44=
X-Received: by 2002:a17:90b:50cb:b0:3ad:68f7:dbcd with SMTP id 98e67ed59e1d1-3ae582adcfamr872657a91.55.1793161567863;
        Tue, 27 Oct 2026 21:26:07 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 48/60] libmspack: patch CVE-2026-110602
Date: Wed, 28 Oct 2026 17:23:46 +1300
Message-ID: <fa4dfa140df960c21a0d10a7a111c678831d9df5.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131599
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
