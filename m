Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.1066.1598379254880326167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nrrGV2NX;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id e5so9673666qth.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EYqYofrl4XyMcBve3v5WyJK1+6YfRC2FD9gxXsx81Q4=;
        b=nrrGV2NXgvklUSo3JplKA6cp8/UyqABGQZfcd5mxxEoq1DXhKenKREUGRIatpuN/Sx
         AVitQlNX/BnPKyUc1Glg0AO4e3zwNlYFw+tRWzm3bgc3mmZx9KDchvcgOxtf7onmc28l
         5fz3Q33SC3lNxJRwddy+FAQOuatg2BSN+JJiKNBB5VMIXmCQIS568ck7ouGk7eANlEff
         Mn3Mbj8mVbqsA3j0HMA2QC805Uo1NzWPqsdQyg6bn5PC7vAT+B3Q3rOR/Sy9e8XX6IEY
         178YtmpgdyhNYQsd4IuRXqx1kuo+QPwbmVHPXyk0DANfA8HBhHEHm4O7hH4Gc2T68+5z
         AfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EYqYofrl4XyMcBve3v5WyJK1+6YfRC2FD9gxXsx81Q4=;
        b=OMteTn43J3aFYRYXgNXFDyshHsHhRhApsk5eZnRLDh6vAwAqswbplSlqO8hxFbS7tX
         SyTCIys6/LAe+Ii4VM89+ru5jZh5c0IlnKFd9cRy8XIOjsipgpQa97jIwLB23SK2268C
         HTZVR1+HIVof3zd1cEZ4x8hPlCkvBVme1tZb9wKNxGesfrhtIM7eUiC2APq+R5Z4snIW
         x/3BInXvWBPPFyiaJC3mJ8r80mWtE6xaAFqPVsRTBzqf6CDuz0PFVgmHKezdqwF3Whjc
         RogZxGzud8NRJk9C3bzB5M7t7l9Mk1qtY9xelXlk07bsMCsQxzrPInrNHNIzkAhOmG5y
         3cSw==
X-Gm-Message-State: AOAM533US0Oib74/92plpu1SHPu87M6SyLQZIIpBViTTBgbY4Vyark4X
	03H0fB8hxkW743noTYGtBmu3xH8EF7YSGA==
X-Google-Smtp-Source: ABdhPJz5AM3Tim2BVBdyMXdygR3ueyifH8o1cfI3jBonBDJeuory1XNVt7Gat3DWoAj7sPRaqfo4dQ==
X-Received: by 2002:aed:33e7:: with SMTP id v94mr10300319qtd.18.1598379253653;
        Tue, 25 Aug 2020 11:14:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.cable.comcast.com ([2601:646:9200:4e0::55db])
        by smtp.gmail.com with ESMTPSA id f3sm5410208qth.56.2020.08.25.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 11:14:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@skidata.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] v3 liburing: add v0.7
Date: Tue, 25 Aug 2020 11:14:09 -0700
Message-Id: <20200825181410.1693069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

Add initial support for liburing v0.7.
Fix build with musl by linking and depending on libucontext

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with musl C library
v3: Add libpthread to XCFLAGS as it was lost when overriding it

 .../recipes-support/liburing/liburing_0.7.bb  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/liburing/liburing_0.7.bb

diff --git a/meta-oe/recipes-support/liburing/liburing_0.7.bb b/meta-oe/recipes-support/liburing/liburing_0.7.bb
new file mode 100644
index 0000000000..3a1eaef873
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing_0.7.bb
@@ -0,0 +1,24 @@
+SUMMARY = "This is the io_uring library, liburing."
+DESCRIPTION = "liburing provides helpers to setup and teardown io_uring \
+instances, and also a simplified interface for applications that don't need \
+(or want) to deal with the full kernel side implementation."
+HOMEPAGE = "https://github.com/axboe/liburing"
+BUGTRACKER = "https://github.com/axboe/liburing/issues"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 | MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
+
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRCREV = "45f0735219a615ae848033c47c7e2d85d101d43e"
+S = "${WORKDIR}/git"
+
+DEPENDS_append_libc-musl = " libucontext"
+XCFLAGS = "-pthread"
+XCFLAGS_append_libc-musl = " -lucontext"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'LDFLAGS=${LDFLAGS}' 'XCFLAGS=${XCFLAGS}' 'BUILDDIR=${S}'"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
-- 
2.28.0

