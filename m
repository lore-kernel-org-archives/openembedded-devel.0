Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.35049.1601294508451578989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TsMDN74g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k10so1013523wru.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id;
        bh=glNyvMmEUPHj7O1VN9AUyIf/BcET/tgwh/TBcb40aFU=;
        b=TsMDN74gP67lYbsKHKNJtmg0d7vvntCvWLkTOjz6iPWfF9Zf26+rLBe1Ze1yoGv9Go
         /AwseD/Sv4bbAtrQ80v1UyL3nBEwECgpRxcz9GZPs88ovIuKH35tTH/QKMaTjVaW4H5P
         iDq0gVpj/cCUX9W9OoDfMr2hJUPs1fpkxGSCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=glNyvMmEUPHj7O1VN9AUyIf/BcET/tgwh/TBcb40aFU=;
        b=JlF6Y+Mg2ZeTxt3J9javvq31h5RGIti0ZMRn/9GHzNam1fBXJWbX6DLhRnUieHSL7/
         ozpaW0oCECO1enfcKLWHLIgGSJz765+fb877pAn8EfyWkZfiebQ+X9hrlBNDrDYUtdZZ
         su0QnJ8ZkEK2QBybvWzM2M/lKrnQqYffcw38xLi1wkAjDX9fDKiC9zOLUi08RoYuEsem
         fkdrpcaPeTz6qM7UOr2BWPlb+fZtXXZgyLUag2d/4RCzjSQEvHkynKz7w5TEQ+j36uCc
         BTEh9bdrdJgBkq3RdLxlXV30pucW91+W9ICqYYXvi8e7djM9u1chFktZ4lVoKt7IrxKj
         JFRg==
X-Gm-Message-State: AOAM5313a+Ygi4rwNK7d2BDZibbaFBm6S8xsgiD+g3+ZFSS3d30VoNlU
	uD+YzZ9LHWqcR4lEZj+esq4w0ZShxNJN6A==
X-Google-Smtp-Source: ABdhPJzwd7QLfgLbUyYC3TIcu3xgMGRf7rN7+OVTzkeCNo+cfnxyfSboH0ZX9yB1Dkc6vLHMJF52cQ==
X-Received: by 2002:adf:d845:: with SMTP id k5mr1220780wrl.285.1601294506491;
        Mon, 28 Sep 2020 05:01:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from jet.int.rpsys.net (8.9.9.e.2.8.5.e.6.a.c.b.3.0.8.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8803:bca6:e582:e998])
        by smtp.gmail.com with ESMTPSA id h8sm1026749wrw.68.2020.09.28.05.01.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 05:01:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] minifi-cpp: Adapt to potential psuedo changes
Date: Mon, 28 Sep 2020 13:01:37 +0100
Message-Id: <20200928120137.75277-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1

If we do adopt path filtering for pseudo, we may filter out ${B} as not
needing to be tracked for "root" permissions. We do need to track
the data installed by do_install though, so move the temp directory this
recipe uses out of ${B} and place it in WORKDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 37036ebbb..d75cb9f4e 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -52,9 +52,10 @@ TARGET_CXXFLAGS_append_riscv32 += "-fpic"
 TARGET_CFLAGS_append_riscv64 += "-fpic"
 TARGET_CXXFLAGS_append_riscv64 += "-fpic"
 
+do_install[cleandirs] += "${WORKDIR}/minifi-install"
 
 do_install() {
-    DESTDIR='${B}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+    DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
 
     MINIFI_BIN=${base_prefix}${bindir}
     MINIFI_HOME=${base_prefix}${sysconfdir}/minifi
@@ -63,8 +64,8 @@ do_install() {
 
     install -d ${D}${MINIFI_BIN}
     install -d ${D}${MINIFI_HOME}/conf
-    cp -a ${B}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
-    cp -a ${B}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
+    cp -a ${WORKDIR}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
+    cp -a ${WORKDIR}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
 
     sed -i 's|#appender.rolling.directory=.*|appender.rolling.directory='${MINIFI_LOG}'|g' \
         ${D}${MINIFI_HOME}/conf/minifi-log.properties
-- 
2.17.1

