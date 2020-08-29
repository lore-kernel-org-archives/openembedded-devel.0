Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.7113.1598686391345872597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 00:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d6RehtYx;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id i13so613583pjv.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 00:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HMUXTzzbHrxYMJbgChLKFW+tN/Kzr45yZURI8wVaTQ=;
        b=d6RehtYxPlB/nsYZKZWiBXtMWCRFaB5QhWSO7cPXf/rfuGRpdcHF1ViEkizsfH2q5J
         PCf++uEPe88wHil1J1JED6pPjzimCn1jOB1m3ZPCWtyHao7ES5ZCz8X3lozQtrlKZzcS
         UqfdiMfCMz5ahEJmzZLFJ32VEGZpnxoN1B9DsAY4eOy82ez0AqkZgpLr4oflfd3MMAo/
         Ky9VRlaI4b0tu2VqzNmbj84NCBP4vVHei8BFgVKy1lMxYwiK90KLPhF1jrdWdqiDAyS2
         bN62K2F6hx4ID8s9dR4tbbCrM2mMxu6QeeJv07sjg1ltshc1VHztmIddnsV2roHUmidY
         7Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HMUXTzzbHrxYMJbgChLKFW+tN/Kzr45yZURI8wVaTQ=;
        b=tSNGjj0sydBLuRPMeoyj8oAce5elPoyHr+lqHLoJyc6HXMYPRYHl9zfImrr4HaR26n
         4FcYIci7Dy5Y7ll6I1evTIYiFeXXyqZjZpxrTthnQ6eD6/JX/qff9FwQWBGxoRWZqHis
         AeoLUwpiej2wh+W1W2G5D5CZDOl95X/rInrY2Dkz1ugI435OscZ6xiKuASUiAypaallk
         DT65fIMJ1FqtUo/yRKzTP/eELWPG/xmpTABj2TUfqyfV1dqODx3hUE2FToGjVlw6jyTs
         k00D2FxQQQhj7PdPDnlK5BCc+LQumC31SB9910L6lp102XRr+ZfnOGDK7oN+CTCFSk/4
         Pn3g==
X-Gm-Message-State: AOAM533DIUMQKBFgKlTIEJUX3SLHpkYUGMtLfpQM6u30y/W4lWJlE0C3
	jBMMJIqWvWoa7z2m8dc8Cbpdlrn3aEPtpA==
X-Google-Smtp-Source: ABdhPJz4Pv2+9YpGPuPlthUXR7NlKs+YnQdQ27VLybyeZb0eXA+ONov4bB1FzIaUItOQU9Xz9TxwEg==
X-Received: by 2002:a17:902:6bc6:: with SMTP id m6mr1891986plt.302.1598686390495;
        Sat, 29 Aug 2020 00:33:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id l13sm1529469pgq.33.2020.08.29.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 00:33:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mini-iconv: Remove
Date: Sat, 29 Aug 2020 00:33:06 -0700
Message-Id: <20200829073307.2778520-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was needed for uclibc, unused now a days

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/mini-iconv/mini-iconv.bb  | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mini-iconv/mini-iconv.bb

diff --git a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
deleted file mode 100644
index 44f55b58df..0000000000
--- a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "A minimal iconv implementation w/ support for UTF-8, ASCII, ISO-8859-1"
-HOMEPAGE = "http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/"
-LICENSE = "MPL-1.1"
-SECTION = "libs"
-DEPENDS = ""
-PROVIDES = "virtual/libiconv"
-LIC_FILES_CHKSUM = "file://iconv.c;beginline=1;endline=6;md5=35af9d9924327fe8a0a1fe3a2cb454c8"
-SRC_URI = "http://mirror.meleeweb.net/pub/linux/gentoo/distfiles/mini-iconv.tar.bz2"
-SRC_URI[md5sum] = "84412221e26505a2b3855d4a1cdcd0e0"
-SRC_URI[sha256sum] = "3552262bf1bcf8e859a2a3a7adfb0367af8593383e730c492e981477aac0a0d4"
-
-
-S = "${WORKDIR}/${BPN}"
-
-do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix} LIB=${base_libdir}
-}
-- 
2.28.0

