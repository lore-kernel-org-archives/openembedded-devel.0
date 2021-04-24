Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web12.1589.1619229033954864132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 18:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HuE5xjMW;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id u16so33666961oiu.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 18:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ioAGwMMR1AhlQa20qY1yjPpwfLcd/JjBmtqm+i/4LFA=;
        b=HuE5xjMWJW5EdwVhSCrhBupa1mQpfg2dVGL7tBRB2fJAStjeCbb3HBnJi4Cl6AdHce
         sS1edcA4wfHFY3v9SyCD2mTyvBsmAwfejTABSdN9rjT9LTHJgRZCn1saHSyawOpUtzPu
         ESvOgPbVwrMMcl8bps5+aXPbN8jTYyoJVPl+tphGioa1m/FpsBVKqmOE5PeccoQkHHSD
         OZEtsW4xoywXRpqjvyVzFQr0Gwk34AH6x0/GAHfcf2ZrJkP3Br72K8nHI6PonfPmKeO9
         8fkgG6jzYnGDSpLWLws532Cezk/OqM6/ez2HVrBTHYz2aCuMG00qO8DMMgJLk9nOrP9H
         bXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ioAGwMMR1AhlQa20qY1yjPpwfLcd/JjBmtqm+i/4LFA=;
        b=FjZlDIKkrpKZVf5rfcVF9S90fdXtPj8QST5ts3ztHYiN5nGSgcoE8H308MMZ8T8XYa
         tNnz8ibzx5PD2g256PzyFyMXErPLm7sUZxH07Gw5srJMvnHi+EjaedZ95hwfePfrFGz4
         zo7kwbv8k/M2RVWt5Xp4/oQMd/DnJHVkEKY4aLRVVYSJ4uLmpBTSbTpuNRRpqkjdrxq0
         64UKskYB858M36Q1Lf30+34RZ5mzK9AbkDZfzcXeqKM1zJmwGSodWnEX36QjdlB6/jHR
         fCn36x0siPzITbRkFbDu1v7UAhWQwYpPLOPB4kcnFNlk+Up6C/YImHxuSvheXMKnKIBQ
         7L1Q==
X-Gm-Message-State: AOAM532oUnYgKEnoveDtNeMpLRYp50x85emwcQJ7FA1yJlOYKpo+n0rl
	jK3pein5MgUhMtmdvq8P3TWbvXc5CV06JA==
X-Google-Smtp-Source: ABdhPJzEaWfq3Vyutj7atYNm7K/vnGBsYWiz0IaNZMacTyaFtbq21F2UtDYWlITrvGHPgKfAlwoqVw==
X-Received: by 2002:aca:b954:: with SMTP id j81mr4817098oif.45.1619229033127;
        Fri, 23 Apr 2021 18:50:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id s19sm1748075otq.6.2021.04.23.18.50.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 18:50:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 1/6] uml-utilities: fix installed-vs-shipped with usrmerge
Date: Fri, 23 Apr 2021 18:50:23 -0700
Message-Id: <16de5f93d5da9af767c663b80d740aae07555a80.1619228936.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619228936.git.akuster808@gmail.com>
References: <cover.1619228936.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  ERROR: uml-utilities-20040406-r1 do_package: QA Issue: uml-utilities: Files/directories were installed but not shipped in any package:
    /usr/lib/uml/port-helper
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  uml-utilities: 1 installed and not shipped files. [installed-vs-shipped]

* pass LIB_DIR instead of using default value from Makefile:
  $ grep LIB_DIR.*= tools/port-helper/Makefile
  LIB_DIR ?= /usr/lib/uml

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

