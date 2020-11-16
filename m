Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.30528.1605503398805079922
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 21:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XG3Bg348;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w4so12150773pgg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 21:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=st7XXCAeyjWe+ChMwA5Wh2JTZ7pZzpgYMzA32C46I0Q=;
        b=XG3Bg3485fDjPHcZj62kLdFSURPUG7AFKSjSHMatv8cCqC0fV/bXXGrdGWlAchwL1V
         zV8G8A08vxUJ6yF0SExcQR1m6vZU15NQountmUt85hm0dh6gkYJ4r9UHLBLXU6+C1T5J
         cz5eFszi1lQ6CEHA7fK/RTlCTqUaiZzlOj9unQA2ccfJUiaBvrmIZOCFomv7lyELl2nE
         In0VaqWW5NK42YrtKnAQa9sRsybqvLiyccs3WDb0KM5Zj4SrFz1wfcbMaGkCIlJT0Plm
         bUxYtDdzqM4DlW9cl6aQtc1BFZNZFQRnTPeUYz5+nBiNcGF0FF6sWKR1bsvjNV9JZydp
         ExYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=st7XXCAeyjWe+ChMwA5Wh2JTZ7pZzpgYMzA32C46I0Q=;
        b=G4bucKOZ8P/wmtE+1T18E0C1bh7oc5/O/D9ju5xqg1i+Irgjad+xKIzBw36IavXug7
         eVD03PJqEHplWaAP1huikDVniPjrwjBvsyvTBcm11JoqL3/PNBq3K2Us50BnH/oAxXR2
         jDM77ttDdPz2h8fdTWlrVWd9eUhIP0fO8tgfRT5wJGJ2QA360fVSLOFZMHmxGCND7iWy
         4ecK2xmhv8k540Akqc3jBtfq1xTDHDk+UPlTTANw1iWFtc/hK8+nCogWxfN+YSOwpVEP
         /VfLaay5VDfRD1ulROU7Bzv12YSuTUfXIO0QBbItf9tJy5nxLSKtSmrr2ISLzgLNoD4b
         QR5g==
X-Gm-Message-State: AOAM532xbF08goMLmDXusPuVWmLFgLAU5fmpNJHn19+P/39JHjli5EUP
	b49OVkDx1nXrsQCv2pDn8nZVTiZ5pOFEQA==
X-Google-Smtp-Source: ABdhPJyLK12J+uxIdAeNNqqo7xw//iRAva3BMbjB1bJ6Wa4FGyH8ifip5UD4m7Ms+NwYVgcAMUC38g==
X-Received: by 2002:a62:8449:0:b029:18b:16d2:9ea0 with SMTP id k70-20020a6284490000b029018b16d29ea0mr12728384pfd.26.1605503398025;
        Sun, 15 Nov 2020 21:09:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id f6sm12212135pgi.70.2020.11.15.21.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 21:09:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libkcapi: Fix build on riscv32
Date: Sun, 15 Nov 2020 21:09:55 -0800
Message-Id: <20201116050955.21916-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...f-__NR_io_getevents-when-not-defined.patch | 36 +++++++++++++++++++
 .../recipes-crypto/libkcapi/libkcapi_1.2.1.bb |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
new file mode 100644
index 0000000000..8dba3d3cf2
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
@@ -0,0 +1,36 @@
+From 771dd6aa45dd0bbbb7d7c7a7b116e1b5666fbd7a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 18:05:48 -0800
+Subject: [PATCH] Disable use of __NR_io_getevents when not defined
+
+Architectures like riscv32 do not define this syscall, therefore return
+ENOSYS on such architectures
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/internal.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_
+     return syscall(__NR_io_submit, ctx, n, iocb);
+ }
+ 
+-static inline int io_getevents(aio_context_t ctx, long min, long max,
+-            struct io_event *events, struct timespec *timeout)
++static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
++            __attribute__((unused)) long min,
++            __attribute__((unused)) long max,
++            __attribute__((unused)) struct io_event *events,
++            __attribute__((unused)) struct timespec *timeout)
+ {
++#ifdef __NR_io_getevents
+     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
++#else
++    return ENOSYS;
++#endif
+ }
+ 
+ /************************************************************
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
index 7de64fa0fe..e76fba09c3 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
@@ -7,7 +7,9 @@ DEPENDS = "libtool"
 
 S = "${WORKDIR}/git"
 SRCREV = "d41284525ec8960e9a828979cfe269012b7df8db"
-SRC_URI = "git://github.com/smuellerDD/libkcapi.git"
+SRC_URI = "git://github.com/smuellerDD/libkcapi.git \
+           file://0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch \
+           "
 
 inherit autotools
 
-- 
2.29.2

