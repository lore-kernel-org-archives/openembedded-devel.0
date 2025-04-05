Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D0AC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 14:43:04 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.7507.1743864177541280982
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 07:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hs2AB475;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e6df4507690so2704985276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864176; x=1744468976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEwBA8Tx+HyfGSlgF1j3jr5iAwwGESAhF3Q5XEOBGLY=;
        b=hs2AB475b53HkLB8grEEQ6MVjQM/FCMIheCp7yGae0gaiZBEdhJ6KxoqlgZbF7irxQ
         vBATpO1RXcK82Hvwm6UORmKfQDoDuj0Ck/HRcxFKyByOMc6r2mpt2Fk4f+LxdPee99BP
         etmxjyFpkcAD/Lm9ja2YuDQ0uQOwrnX9BPcH/NSwCMO94ZyNlYY+b8o/KlrFQYJk9mop
         j8fZiXG1QZJWjOciFsP2JLebPv6f7PO0Rxbdgn0SbCMZsvYyyWLqjs5tjqbk264KPCg8
         N1bCnxqeKFp0dVVbUcMGvx3m+lhF7BF2jHxc8mPSo5TdyMOG2nSUdxqTovivzpbH5HYA
         bZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864176; x=1744468976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEwBA8Tx+HyfGSlgF1j3jr5iAwwGESAhF3Q5XEOBGLY=;
        b=QYjSYeuU44DhnR/B/Lw+Vfef5M/z1YY7PurOpkHdKIwsK7WV4JshKMDcQk0lw6J/fy
         FJKcOeH+7owRu+Lad2xKphNaJUznI0buauXp4KbdixEY3h7WYrtXzqnAuBVqH5e0cPJp
         uZwNLVKuOh73DnTQ3uCUNcz5zCG5U4r4Q26D3mi2qnWEVTKv7uO1tWQaZCNG/4TuV3OT
         A4psOpRc+eTW+mXY06NhJL6hRpBEbah1fNonvffGmVdHSAq2g5+FoQB8EYFfN3rMc6aQ
         ivqPOv+vUrnI7IHsVd+Dr0dsyRtqJCERl/a96NdOpg0B2UlgapAXKYTqU7Fea9ohaY3p
         C7LA==
X-Gm-Message-State: AOJu0Yza8azJWIfRrDStAIxcM4pvE34jyeMYrXwvN0P2R6SpT2OC0qMN
	nUjOjPU02xf5B0GIJLAKnA6rJps96p2YhttugUuxLE9vfZ46GEmkZ7zJCvCs
X-Gm-Gg: ASbGnct5ALxQX836HZ+pRq5iHbw53HU3RTz8ZoPCcgs1cu/s4ObmR2JYfRoVUjlculj
	Islvz9VbsJP1IcGM3KkUjEvaoX5f+cJ434Lfj3oVC865vInTt+ro9cXcPhAb3pORqNvdzjYeM0P
	5Tb+kyCqrPUvA5y9BhOWHIQrNjq9DVgfQNsPDKbaJLCRmry0UICJUhET3oHl2dio3ZtuPob50br
	L2bJpUAch8Ap0/9KMhQdYVQ5ukGliYKWkCPNMKqdRUM8gZdvBGjB+EEvr629G5J43D2AcdSVMgg
	zkX/Cw0hd4/LP60IXDm8B2qvZAUOtEg5U48s50P1lPF+S2QZzQ==
X-Google-Smtp-Source: AGHT+IEG1HGI9fcwKIFmCg9cCMWZdUJYjffm15VCeifDOffYV0B2JCUhRhGVYNU7tN+qW1qVFUHUdA==
X-Received: by 2002:a05:6902:230f:b0:e5b:43dd:cf18 with SMTP id 3f1490d57ef6-e6e1cfd90e5mr10736674276.22.1743864176154;
        Sat, 05 Apr 2025 07:42:56 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e6e1c22c23csm1011529276.42.2025.04.05.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:42:55 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] Fix warning : lack of whitespace around assignment
Date: Sat,  5 Apr 2025 10:42:34 -0400
Message-ID: <20250405144235.7951-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 14:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116599

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc       | 2 +-
 .../libcompress/libcompress-raw-bzip2-perl_2.213.bb           | 4 ++--
 .../libcompress/libcompress-raw-lzma-perl_2.213.bb            | 4 ++--
 .../libcompress/libcompress-raw-zlib-perl_2.213.bb            | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 9fc5e9675a..d081c2fdac 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -28,7 +28,7 @@ PTESTS_SLOW_META_PERL = "\
     libio-socket-ssl-perl \
 "
 
-PTESTS_PROBLEMS_META_PERL ="\
+PTESTS_PROBLEMS_META_PERL = "\
     libauthen-sasl-perl \
     libconfig-autoconf-perl \
     libcrypt-openssl-guess-perl \
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
index 63706d8f74..5735bbba1e 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
@@ -17,8 +17,8 @@ S = "${WORKDIR}/Compress-Raw-Bzip2-${PV}"
 
 inherit cpan
 
-export BUILD_BZIP2="0"
-export BZIP2_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
+export BUILD_BZIP2 = "0"
+export BZIP2_INCLUDE = "-I${STAGING_DIR_HOST}${includedir}"
 
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
index 62521dfe85..2bc42cb941 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
@@ -21,8 +21,8 @@ RDEPENDS:${PN} += "\
     perl-module-universal \
 "
 
-export LIBLZMA_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
-export LIBLZMA_LIB="-I${STAGING_DIR_HOST}${libdir}"
+export LIBLZMA_INCLUDE = "-I${STAGING_DIR_HOST}${includedir}"
+export LIBLZMA_LIB = "-I${STAGING_DIR_HOST}${libdir}"
 
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
index b8afcc2074..205e6a548e 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
 
 inherit cpan
 
-export BUILD_ZLIB="0"
+export BUILD_ZLIB = "0"
 
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-- 
2.43.0


