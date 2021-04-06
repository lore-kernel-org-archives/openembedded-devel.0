Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.1268.1617734557445655237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ryLmY5ie;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id z1so17784339edb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTu62MGaiDDjQw5xpFYVOhdRv5m0tje4azGVnwRZNU0=;
        b=ryLmY5ie8Q+6baouiKYy+bTehfRmSPPrUXK1fug3FU8vCzbDSBFKwzaQuF2NkcUoVZ
         NK/2LfEjmJXdoV5TXfr2hiRB8HuKQapflB9RU1Cq+YKBHJeXjJ/DMZLo266uuoMq1vBc
         +3p42CkEdNKY67p7/L+Q43kJR5ZTcvQwq73SWO846I/iOaS3U65p6PzQMNuXBEwrdWFf
         iNVmVbuvD3illEoOzLkhj17pTnqdzsCNg4U23mjM6cIhEIl8gb4zJTDQtxTOH3kH7Qu+
         OSCNWFFDn6ye9IqbLoOQ9xYG4I/kf/6vxcmz79QtSGnCzG2EBue+Ohnae5OAgI4KAsMY
         p/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTu62MGaiDDjQw5xpFYVOhdRv5m0tje4azGVnwRZNU0=;
        b=GSb8biVsDNB4e00rG34QWCA4OL0Jx/2BFDvnGrFYhqZ4NiEO2QRE+rG6D7PVvCkaYC
         q95HZUVSnpccavQtjAYOvDn2CSKZL3+VW//Lc0d6PT6X6jBMprxYW1iSvzz6H3RvEVAH
         VcG2kKXYH//HcXM0ctCu4vTWf3Y0z8DUNWZKF1v7whBmQyW31nPDbxR61/2xLrFYSLXP
         V4Cacjjrp2ypGdN0fOts4/x6X506R1fBhwjg/B2rjvajFHDjHS76yqanvpR8XnvBKOGl
         Zs1mSGLFVjeFsCynSRlZMI3EoxRKp+XHgOyfn84OeOK2aktCACV4dOJvEsuPPfSFR963
         jvVg==
X-Gm-Message-State: AOAM533f/dVuhXkReGJO3fkGjlq1ju/gtomlfRdiM9A8TrQrFaWuwmcD
	W574LOTeFEnK5uVHlVNBzpmWn+q9GcU=
X-Google-Smtp-Source: ABdhPJyYP6j8TnJjs7mk8s/NdLFxnqVVuqdVA+QK2AW38ppn4L3C8xwcnzSX+ARTbvgBa+DPk9L/6A==
X-Received: by 2002:aa7:d898:: with SMTP id u24mr5614023edq.198.1617734555947;
        Tue, 06 Apr 2021 11:42:35 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q6sm1149476ejt.51.2021.04.06.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:42:35 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 1/3] uml-utilities: fix installed-vs-shipped with usrmerge
Date: Tue,  6 Apr 2021 20:42:31 +0200
Message-Id: <20210406184233.1585138-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: uml-utilities-20040406-r1 do_package: QA Issue: uml-utilities: Files/directories were installed but not shipped in any package:
    /usr/lib/uml/port-helper
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  uml-utilities: 1 installed and not shipped files. [installed-vs-shipped]

* pass LIB_DIR instead of using default value from Makefile:
  $ grep LIB_DIR.*= tools/port-helper/Makefile
  LIB_DIR ?= /usr/lib/uml

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/uml-utilities/uml-utilities_20040406.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 8e00cb3ea4..f86b2b912e 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -18,15 +18,14 @@ S = "${WORKDIR}/tools"
 inherit update-alternatives
 
 do_compile() {
-    oe_runmake
+    oe_runmake LIB_DIR=${libdir}/uml
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${exec_prefix}${nonarch_base_libdir}"
-FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/uml/.debug"
+FILES_${PN} += "${libdir}/uml"
 
 ALTERNATIVE_${PN} = "tunctl"
 ALTERNATIVE_LINK_NAME[tunctl] = "${bindir}/tunctl"
-- 
2.30.2

