Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C67D106B51D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21205.1774441285248709498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AvKKTEoK;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe655187so62337015e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441283; x=1775046083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsMkJGKZbBH52TIobSBf1Xao19tUPDpFdLeHpx2hXpE=;
        b=AvKKTEoKo4wwo6rkxvOEqfhoogFuVWfu68kWVftZukZI5230y+Kel7Bs59cFAsJFgB
         oC+nBRPwgQprUqJleAQ3eWWBj4CNW/IEzTlSXgQsLrEJgnwIRYnNb3LBWG8Kh1/Rxymr
         B+ucJk4+RZ2j1hjA71sR0/EI55C+NaekI1wU7QZiDIMOvwmSBvcZ86NHPJKO3aWLTyRb
         Slq6biOwAY5g3G10vmkoBmU1u6dXzXWI/4FQ22hklYKUXCN5uYo+AHLgLtukL4dRSSaq
         WLe6YsBk4hU67B0w+/Vo3WLDmgDloUnt0/AeQX/kHSn911Tl+tEHvPAFn87oCVFaiUqQ
         NeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441283; x=1775046083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DsMkJGKZbBH52TIobSBf1Xao19tUPDpFdLeHpx2hXpE=;
        b=MChpTLTtx1WUYm+GAh0h92NO+bbSqTe+ri779m2i0U8dm942v0kYthKk1/4xxt3Pff
         ppa8aeW8LKQ9eirAfZipeZBRBtQNP0BixJFBwdvNFvGQ+9opvF6ydOl/LGlMCs73U6uC
         OyIuTqFLUAZxFvyYT3NMwGTHkXKjPRQ85BM+lIR0/gG2lDe1asU8WqtOtgiINxagsc+M
         xP5FMdChaAWQsnL0Ho229Z7z8Q8WZ4SNFDcrUWd5CfEmaiSa3ZZZbCbyADOzVRw3Nq9h
         0Skdq9a+f1jRP94nivuEp3Jm40kNRG0LtQowAwzoK6gJLtUnA/rdZuNga9LNZefKmMzL
         4G6g==
X-Gm-Message-State: AOJu0Yy97OZadj14P+diN3ycfGeOrpXu8M10vQIIrIxcoNZpeFgUJqFJ
	UsYN/Jjn0b9b7Thhq8xqXyGQ3lG7I13t2ZxnZ7F4rRN0v7BzGVBm7HP9Q/dHAQ==
X-Gm-Gg: ATEYQzzSycSEkNMr7EXrzO1mCXtyTVxtJvKkSXvMlXmB34sf50M8b9QaFScddS33KnE
	2O7yfNdtyTExw96OkHBD23HcO/KhmlP+oPsaCzJ1YO0U8r207JUnSrHQWK+xcP71/FqrOS3Mr1G
	VbYguOBb6ftv64Bza7qSo3MUc1+ptRAzr49LKEVT2xFIl8FO33jq5UrfIF+JVL2Ffruf8rniaTJ
	BKO4/9jJzkYZpwqvfA3+YEGNkJbj0lb9ZGu/RT9HouqvCxnQB72CN1EPf/k09PWh9tIwr03UaL/
	tabRw8grAR4KMEThd9puoY1WBbTLgKpw1RhTulwitTBHBIxoTC62YsjkOOaupnuZ5GDYkcdp/8Y
	z89yAsqG7FhNe3t6D+EGZONVJ5DLbRUPbf3Mc0H+O0XCw+GUeSWSkBvjVt0fFr/CV9ySMrsWz9P
	izv57Gcx49p79GWg==
X-Received: by 2002:a05:600c:1f95:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-4871607e3d3mr50384355e9.27.1774441283168;
        Wed, 25 Mar 2026 05:21:23 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:21 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 15/15] opencv: Fix installing when Python freethreading is enabled
Date: Wed, 25 Mar 2026 13:19:41 +0100
Message-ID: <20260325122046.1211090-16-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125622

Move the installed site-packages directory to the correct
location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.13.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
index 981b06e33b..206159876d 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
@@ -117,7 +117,7 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtu
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_BIN_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
 PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON,-DBUILD_TESTS=OFF,,"
@@ -224,6 +224,10 @@ do_install:append() {
         # mesa-demos /usr/bin/shape file.
         mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
     fi
+
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
 }
 
 do_install:append:class-target() {
-- 
2.53.0


