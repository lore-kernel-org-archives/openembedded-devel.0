Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310F4D10369
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 22:59:11 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126.1764111542246030516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 14:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msUOtnx1;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso7461521b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 14:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764111541; x=1764716341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TJwVeL2oQut1ac1XTW6FknUye3DoXOt24YCVNa+7PQ=;
        b=msUOtnx1uiuNN6aOnnKbU918ZMp+J3hg1hPwTQHT1P6vPpc94SDBlYLejbrKLikWCi
         vYjd+Q2u565+Q26kmIGwM7XSnYIaB0r9JDFi6QjEOVkeIBfPXNCvZIf4sNZKVj5bv+3B
         zUza/jj+nwmt4Qsb7+juYSLKfg3TVPIdAnJivqO+VwNpVPaSnp4k0UL1+a9zhMr/4llZ
         2g9hxhTGceaGxH5N0upION9pUufhs2rWMhCGRXD0mhEDW+artPSbZ/KVnsHv9Nz+1J2Y
         f6zR4RpuHhuDH+EteQ5X52LBunztkSffXDK7AAF6gFt04pMIo0kqg5V/rTXWNiWvtfVr
         q56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764111541; x=1764716341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TJwVeL2oQut1ac1XTW6FknUye3DoXOt24YCVNa+7PQ=;
        b=m0gWFxGL5x+edATCuyXAtzw4VYiiYAeDsQBcjwFoSKwYEdRkcy2eNNRC2lZ/1iU0zK
         XupPfUcXxFv7u3957i/JD1xaR692xP2C2v57F0OvjHjB82jvbzikmASD7VwKPe4+4Ptu
         Qe7mJMryd5anqOmWxkDthc5wDWHxFFxaAbVzwX3jQjRIwkTLE3D6VO9beHVK+F16UUUF
         +4BSnxG86z69pLFi5pawNTY13G3+8ZVRoO/D0z+0N0dTKkXbf3ZnaW69P2W6G5mddF+9
         sQs1F5qb2jdzP4roaz9oHlVVG3Ky0obRCZrQ/sPgiB1oDeLzaPJHRgEhqFaGJFxqjKoX
         g4LA==
X-Gm-Message-State: AOJu0YyzWXK8dx0hNzU8lMTupH/TjIu3myEBjiAfEBo3kHqDEzKrzGsN
	rKQdHd0lBNbb5tyaQW3Uweta+pqcyBKCNAIBDSl7Rd3FKUhJzCGn1EP4tfYs2DM5
X-Gm-Gg: ASbGncvrQ1eAupbadcnBQI+BwqSkG9EcEp3j4zje3mSKH8IaQkvOa8azrUMlsYP4OBx
	K8piLtHTDXgvXfBTD+X7LxwF1jrgpMDE4z3/KMyN13V4cVGzIlmODX8wkVu/8+HuT1yBDYaNyeK
	Thnz7P1Mh1iCqYQ1xtG6vySYuGOfr6oBGWCu5I5ZX28e8vWtFSUj0nVkhYW/u1Zt50LqqXvGZWX
	l0xrnHaa01kxYt5u1pKRFTKYZBbfuUFk3BSNlYS8EQIrFfOqmRACX8AVgL27QMsOQCYJw421uA4
	jbI0FPk35iauNlCcQtyxp3NnKIm1Z7631hgFgUfwAfRGdc2cBbTxRx62idlWw+nNSLZNfLlerDs
	c4aKycXvA6ohwUHXCYYAbUxkAZyFJsYkzIWyplaOa2Cq4KSc6qlnlHf9Re2jIYnYa4jeeOeQUh2
	vlRUDS7aoKlhuLHE+LE3vYf/IVA4cEIqecnNN6vq4AzppqnmKzEHdyYwHjLz2rC+uF73I71vrts
	utYrf+UdvShvYCoVS38Cwq2f8XYiAZc
X-Google-Smtp-Source: AGHT+IHxS/mKVHc+3IB90i4M/4+CoC7+go+ykC+m1vTuidUC7tgK303NOuJjdnlLJ6cNItZzZAIoIw==
X-Received: by 2002:a05:7022:638b:b0:11a:3734:3db3 with SMTP id a92af1059eb24-11c9d863622mr12327958c88.32.1764111541250;
        Tue, 25 Nov 2025 14:59:01 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e945sm84620894c88.6.2025.11.25.14.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:59:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystem][PATCH] e2tools: Fix buildpaths in ptests
Date: Tue, 25 Nov 2025 14:58:58 -0800
Message-ID: <20251125225858.1361559-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 22:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122065

Currently the path checks are escaping QA check for buildpath detection but config.status
still has paths which show up in reproduciblity failures, comparing build in path A and
build in path B, content of config.status don't end up same.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-utils/e2tools/e2tools_0.1.2.bb       | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index 219735acd1..b7b925da0e 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -39,7 +39,21 @@ do_install_ptest() {
         ${D}${PTEST_PATH}/build/autom4te.cache \
         ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
         ${D}${PTEST_PATH}/*/*/autom4te.cache
-    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*--sysroot=[^ "]*@@g' \
+        -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
+        -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
+        -e '/EXT2FS_CFLAGS/d' \
+        -e '/LDFLAGS/d' \
+        -e '/PKG_CONFIG_PATH/d' \
+        -e '/PKG_CONFIG_LIBDIR/d' \
+        -e 's@${S}@${PTEST_PATH}@g' \
+        -e 's@${B}@${PTEST_PATH}/build@g' \
+        -e 's@${HOSTTOOLS_DIR}@@g' \
+        -e 's@${RECIPE_SYSROOT}@@g' \
+        -i ${D}${PTEST_PATH}/build/config.status
 }

 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"

