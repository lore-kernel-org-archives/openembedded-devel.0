Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3E6C83F15
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 00:29:09 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.19569.1693096147098957448
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Aug 2023 17:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oxbas6od;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bd0a0a6766so1554038a34.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693096146; x=1693700946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fJpu5B2rSq+RgVbLmTjrh6Eq11fPF+NiD2xAKH5yXc=;
        b=oxbas6odvrEjhFqnxLVmhJ5OzT5tBWFUWqZXMZq2o52+cKc2xiDlzcUqNJosb6auys
         o9y6Hy+3QtCUyLdN2Iu1K2Rb6M61EExm4ZeC8LEl4gFFYIRYeQ6tIoiXfMKBp9BfE3Sk
         X0SMz+2nRHRalA8RxI4QVINxtI+NOYEIBmQB9qEqIx4q5TESUsJfkdsZ6WtwhE8wfx3i
         UyNrXlOpEMAgQaXEInwDtXGfB51cH2naYwVspV+H3WUCLJnjgH6VKVIMo7IHTvheQSUh
         fIcFdc7BHtMOxHooYVw2ZcoGuwmxkJxiR3OUbTfwhpNIAH9P+un29IK2peBq/Am/0EH9
         cs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693096146; x=1693700946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fJpu5B2rSq+RgVbLmTjrh6Eq11fPF+NiD2xAKH5yXc=;
        b=bZDmoiLzLhNU5MHxL9YOtfWUDeyh4Br4wj62RYWo8iFiQlRcreFGycApOBvuLgthSO
         WrGpb/qE7sFaQ80qeYmUkQPm16xRmyVzBW99JPuyRIuBtj9r6iYbcpW+R/cl6r5Bd/vK
         O8RIcAGvmPO5ZFKQ6cz4IFRVk1D3vjAr6pF5m31QstWqPsnLuOCDbKjT/9IizSEHVQN+
         PXNtgZMEyyjC121GIri3pNjcT3DkYn+chuVwyZfPxjm1YnB9mEGnO2gsAXWvGF8Oi9Gh
         j3M6cxtm6BfxUViGqOdSSUgA9MCoCJvmjKsqjax2X527wtOmhV1x9LI3aTQzfzmgqH2n
         0pmg==
X-Gm-Message-State: AOJu0YwjStBiz9P8PA+rZZBDu0JERH3XmD2rJ3ZM3YdNrbvtPo9u98hK
	co3SbwoOLUXvHWGAKsQfrA5Mr+/oGFFc/g==
X-Google-Smtp-Source: AGHT+IHFZMcP3SUedhzDERvJGXw2osTS14DZLZUs0yNTPPJNvh7H/K/GeW8u4lOC1OB2A1p5JVyYWg==
X-Received: by 2002:a05:6830:d4:b0:6bc:f5b7:f1d with SMTP id x20-20020a05683000d400b006bcf5b70f1dmr9502476oto.28.1693096146089;
        Sat, 26 Aug 2023 17:29:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b001bdcde49bc3sm4321353ply.119.2023.08.26.17.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:29:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-lz4: Drop using PYTHON_PN
Date: Sat, 26 Aug 2023 17:29:03 -0700
Message-ID: <20230827002904.566500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 00:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104622

PYTHON_PN was useful when sharing recipes with py2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
index 71171513e8..2d6663fc86 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6231efa4dd4811e62407314d90a57573"
 
 DEPENDS += " \
     lz4 \
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-pkgconfig-native \
+    python3-setuptools-scm-native \
+    python3-pkgconfig-native \
 "
 
 SRC_URI += "file://run-ptest"
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "e1431d84a9cfb23e6773e72078ce8e65cad6745816d4cbf9ae67da5ea4
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest
 
-RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest ${PYTHON_PN}-multiprocessing ${PYTHON_PN}-psutil"
+RDEPENDS:${PN}-ptest += "python3-pytest python3-multiprocessing python3-psutil"
 
 do_install_ptest() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
-- 
2.42.0


