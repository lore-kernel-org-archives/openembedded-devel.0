Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.1356.1617734611074752428
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jL7s+sya;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id p4so7518917edr.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MwkXQKblWkdldvsqXhy2cCV4fUXULnY+VaiDQ2pLGzo=;
        b=jL7s+syauZRZ0CIrSNONsnvEUZTNJzq9D3v06fPJKrYdBWI4PyAz82Du65LZslQvLf
         u3GCuwX5cql9sMtxygOW2QM6sotCeHYEDH/t/aSzHJ44HeJyRnPTuYNreOud5qW+4GjL
         9KUBVaRaOmPgWWnqEgV7+0Oe/ek+blGkOiwIc6d/8V3NE4EqbHWm+uBBnkEJZcLP8dOf
         R3y7KFDXd71VQWq3min+MsJOFoYtZDGObf0kgo37RrnKc86KgzKZijFzDICRskT7HIhw
         FJFWgkRSgvxX837JJYEN6aNZnT3XPGUo5on+tCYYQGVtM+9PE7vFAGAMA5zqgiOajpdK
         f5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MwkXQKblWkdldvsqXhy2cCV4fUXULnY+VaiDQ2pLGzo=;
        b=VCF7dlBFXhRMn6R8ogGbGPWSZ1EJVNF0fj1vlbNqb0uHePJ//mrycOR1zNkW8PBCnK
         qWXZ76vOV6vzyHnBR4xVOJ0/YQ9ypkSdEmDaXCNS/Qp1KRawGLioLEmQipj7JbFtaSGg
         KIB0jHXxRoX1kuKrkbnyPUDZZB+jQmlYetpXVIvMp3hYiPxgAREW+rx1XifsumtYhXk0
         91jvQrUR9I9eCQ8VTL7IQjQGpSGE8Xo0Lu3hfq5Vs83Zefmo5hXygyOEP/5PafDUSQ7b
         D9uUUXeGbsTQoGrCV/Xo5KmlEgnUXWwt0nnZqk/i6f2C+opgvzXnGMNdCw4v2XaNIpyK
         qIXw==
X-Gm-Message-State: AOAM532PHQjzp4EyjdnknxPCjlUI+SD5iJWh3BZ7KasuwZmSRd6hWcQj
	wAv416TkY9oezJmZf/CmL2DbflOTVvY=
X-Google-Smtp-Source: ABdhPJyFi8+WtD8AM9vwckb75YbnCGh2O/j0qAq5eSrO8iZPbd/ebM3bBnGqX7/I7KCiyEbUEhrwHQ==
X-Received: by 2002:a50:f695:: with SMTP id d21mr84949edn.382.1617734609678;
        Tue, 06 Apr 2021 11:43:29 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l1sm14374305edt.59.2021.04.06.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:43:29 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/3] uml-utilities: fix installed-vs-shipped with usrmerge
Date: Tue,  6 Apr 2021 20:43:25 +0200
Message-Id: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
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
index ed19d1e41a..de1fc3a1fe 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -16,12 +16,11 @@ PR = "r1"
 S = "${WORKDIR}/tools"
 
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
-- 
2.30.2

