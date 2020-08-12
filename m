Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.9669.1597214236588549192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkUlH2MX;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id m71so524338pfd.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MzlB5pe445HStbReLuihS/IIdWHAJ7Zy8/S+ES7aZVQ=;
        b=dkUlH2MXiUOy3MDshqQHH//maFEtrV32b9pue0mPkb5NzLLeWhNUUCpyHj3zxVBu9g
         G3KQSAIAJ68wZWBu4cr7qTIXQIc3QFzt4w/aqi0G/8BU0upA+IBXmydbwBnkIV2ysEOa
         W3jsqQnf45JnjyPxJJbXYsOhSVcS4TTcUnsqnORYs6oFuza3xMf8qm7ncaXSRZ8Klxqy
         UJ/winV0K1uTNzxruVkQU/FCdAY2rZMSPIjX8sNzuzfZYv7HzOg5OELpi+oIglqcRNKe
         3xeFrPGCxksMb4YuMoItWKgnu6haLQr1MOMkiPXVlzvFI4g07bsfGY42VFzh9Dp/uNxW
         DFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MzlB5pe445HStbReLuihS/IIdWHAJ7Zy8/S+ES7aZVQ=;
        b=iZ6Ue5u/ZCY202CMMXl0VN4YUZlP5Tn7IvS3I0BEgCtSts3697Ux8DgdcUDlrKRUZt
         blyLF+shza27LmhtRWmr3GDexZd1sEQMPnYkw1vNdztwNFWLtgTL4r+3XM5nm/6Hs3D3
         0yuhg/aLmqvZhTgvNxpf0Z+UHMSwqg8h7Y/CAgu4g1ooHzCiyth+2wFfn2dY6s5y/9aw
         /UE+A1sieG+ZwESiMv+vOXNp7wNJRm4cmHYYtS8CWXbryuoWDwIdHt7+KgVur8KIU3fs
         OU5ujqCA3qxPCfE9L8K7uZZORQQ9hmMbTfh4zQ7+RVYYHSB9S93sJW1ooNLrFiwi8+eg
         JNjA==
X-Gm-Message-State: AOAM532PW78IQipE6tE48YaddkKyd0E7LCt1of6J9UXukN0ZJGqkptri
	suYH5hKcRCv5CQbgKbDJ3Khl6ft6C5E=
X-Google-Smtp-Source: ABdhPJwaAqtuUTM9IagNIgY/IL/YtJ0FFXIH/Ts6LYmR+69wd0OUrBlkaBKxr6cv1cyxsgLqzBcgQQ==
X-Received: by 2002:a63:fa09:: with SMTP id y9mr3937547pgh.0.1597214235549;
        Tue, 11 Aug 2020 23:37:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Khemka <vijaykhemka@fb.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 1/9] Adding recipe for exprtk
Date: Tue, 11 Aug 2020 23:37:03 -0700
Message-Id: <20200812063711.2758315-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vijay Khemka <vijaykhemka@fb.com>

The C++ Mathematical Expression  Toolkit Library (ExprTk) is  a simple
to  use,   easy  to   integrate  and   extremely  efficient   run-time
mathematical  expression parsing  and evaluation  engine. The  parsing
engine  supports numerous  forms  of  functional and  logic processing
semantics and is easily extensible.

It is a header only library.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/exprtk/exprtk_git.bb | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/exprtk/exprtk_git.bb

diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
new file mode 100644
index 0000000000..6930f31e96
--- /dev/null
+++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Expression parser"
+HOMEPAGE = "https://github.com/ArashPartow/exprtk"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+SRCREV = "281c2ccc65b8f91c012ea3725ebcef406378a225"
+
+SRC_URI = "git://github.com/ArashPartow/exprtk.git"
+
+S = "${WORKDIR}/git"
+
+# other packages commonly reference the file directly as "exprtk.hpp"
+# create symlink to allow this usage
+do_install() {
+    install -d ${D}/${includedir}
+    install -m 0644 ${S}/exprtk.hpp ${D}/${includedir}/exprtk.hpp
+}
+
+# exprtk is a header only C++ library, so the main package will be empty.
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

