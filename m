Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2921C76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 04:39:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.696.1680842334748711210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Apr 2023 21:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DKFPqByw;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-62ddb232ddaso235520b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 21:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680842334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ait7IaFtogFoNpD5dUImiXYb0gqSk+pLMWKzZg5nSj8=;
        b=DKFPqBywMvGkZ0+YyMbZFDv4YqX/AEuDYBaV5O8DS/CggGofjsNjH7Oq1pDzUqkAYo
         Cyhqajd94Ityhq8DhmRjrTgXmIfSgIrMTlXFVWg9J10fjo8F8QMMHOW0qe9mpKnpCPsR
         MO5y3P2Sa0pHuYN2Jcikppl5m+ggzshBENvbjcIkpJzUXxCDeTUxq6G+DimID+XQqrja
         a2Onj6jtjgoi6rTvgwacJ8FudF4niKSIfE7s8rmWrtwpjNrwGCsu/fj7kKpRd7HlIT2e
         0IB8tUd6qhOuW6wOm4OtYBNLxUwhkuc/w1VPesOXdZIJPGN4+McRxPhzrEwSmXTMrrXa
         Jl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680842334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ait7IaFtogFoNpD5dUImiXYb0gqSk+pLMWKzZg5nSj8=;
        b=AFxhn7EBdZuxjBlpK8VZq/n1VDuJD+4dt24FdqKy2BUANn0FMZRDzgDRkaslSMRRB9
         h0JJ56gy3pF6ZrHfkHX4EC/A8j7tbgf3bdw8IuBv/RiERfYslJM3GTwgmd9kFgl1ONQp
         NXohTAv8cY57QyfG6Q8c+EPg+05o3oVfHq5E64ovjhAr+la22uNOPZj3AkcZZIkzQSoP
         Ns5naLYyyTjReSxwLugTEr1zcBJxR6DBS5raZ1CnTVbzOvEj3dMwiOdx+GFeXYa/JCO0
         dpCBs8xac68+KXfwxQ+jeYBkQdnWushjGxOkLWzurkiNYd1DkcjNY7aHve9wFAqamXuT
         aDHg==
X-Gm-Message-State: AAQBX9c7WPHjMtnCR/eK0eN8bXYN/8nJpcX8ovLKaeCH+RyWFpqlE7/Z
	3za1wPeNIXo9Rpt9ketJNH+WNUuXBj4=
X-Google-Smtp-Source: AKy350apmNLF3CS57Or7pYuaFPxjTV0fX/MRJaaYVzVFvclAJS/5a73EpZTSy/U16CFPXdcjTFJ+Fg==
X-Received: by 2002:a05:6a00:140f:b0:627:e677:bc70 with SMTP id l15-20020a056a00140f00b00627e677bc70mr704583pfu.14.1680842333797;
        Thu, 06 Apr 2023 21:38:53 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:7754:b142:7aa2:403c:4b04])
        by smtp.gmail.com with ESMTPSA id j23-20020a62b617000000b00625cfe645d0sm2120859pff.7.2023.04.06.21.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 21:38:53 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: Bhabu Bindu <bindudaniel1996@gmail.com>,
	Ivan Stepic <Ivan.Stepic@bmw.de>
Subject: [oe][meta-oe][kirkstone][PATCH] flatbuffers: adapt for cross-compilation environments
Date: Fri,  7 Apr 2023 10:08:45 +0530
Message-Id: <20230407043845.1314587-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 04:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101976

Flatbuffers contains a library and a schema compiler. The package
contains cmake files to discover the libraries and the compiler tool.
Currently, all of these cmake files are installed into the target
sysroot. However, the compiler utility isn't installed into the sysroot
(as it is not runnable on the build machine).

When an application that depends on flatbuffers gets built, it uses
flatbuffers' exported cmake targets to configure the project. One of the
exported targets is FlatcTarget.cmake which expects to see flatc binary
in /usr/bin of the sysroot. Since binaries for target don't end up in
target sysroot, cmake configuration fails.

This patch addresses this problem of flatbuffers' build infrastructure
in cross-compiling environments. By removing FlatcTarget.cmake for
target builds from the sysroot we essentially skip this step of
flatbuffers' configuration.

Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
index bf74f1229..44478ea0b 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
@@ -25,12 +25,17 @@ BUILD_CXXFLAGS += "-fPIC"
 # BUILD_TYPE=Release is required, otherwise flatc is not installed
 EXTRA_OECMAKE += "\
     -DCMAKE_BUILD_TYPE=Release \
-    -DFLATBUFFERS_BUILD_TESTS=OFF \    
+    -DFLATBUFFERS_BUILD_TESTS=OFF \
     -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
 "
 
 inherit cmake
 
+rm_flatc_cmaketarget_for_target() {
+    rm -f "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
+}
+SYSROOT_PREPROCESS_FUNCS:class-target += "rm_flatc_cmaketarget_for_target"
+
 do_install:append() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
     cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
-- 
2.25.1


