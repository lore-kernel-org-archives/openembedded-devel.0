Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.274.1617899826703082340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A4SfgjUF;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id m13so2759838oiw.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FnvjOIFWZFdDcA/QP5pQW7UifZAogzWpo/TuKbwai4A=;
        b=A4SfgjUFDYcGa+Yk+YzSlGW/Mdfz2QgaQH0mGwT+5Xen5Qu6imKRCdkzDqDIRRoz7t
         y6utAnQCCFfuj9or32VMyPLN/QTrZiOQzkkt8jOU6cykM+tPUJAWpmBIRvVdoRt9uPw8
         L1ayr+9XeSsTCqyKTwn9A0kquQU3of3QwXjqD8k0OvcXcbT18MopfA8DOH4oRXyyIPIK
         ThAV5BT20WTbvHEQrnB8PF+UIJvpXALS+iIIdwSIyL8cT2FwvNKe/DomSP4W9V7Ip/z4
         MR4y42hjL3vED+/akbZG9cqhw89TDjTafx2YxBVE4lvkz7FnjsN10SeHnq72my94viYE
         0JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FnvjOIFWZFdDcA/QP5pQW7UifZAogzWpo/TuKbwai4A=;
        b=RZrEl/MqcvJJiyJkgdmkT5pTYAPs1kGqsC9PnRPakkVGpZR+lx4CHAXa1Q4DSkRdhd
         P23XgpvEkNaoFuaQWTfL70hd5vZleF2vkx6Ef+G0Jw/UavOAXzMnbw5cz+sd+S0kyXZa
         /5X6XNmJAokRrwQwRUlHY1ewP39XBCKUKbCDx9TgSbOivhhagxOQFl1U7cPE1oqD4JAt
         FOTSPvjNmqQd4VDTyznRaQU7sRJM6un8mLYd2GRltb86Qza2VAPUHZpxA95I4um95Hv8
         zRWtkQq1gh5og74KfA1PD/EFulCKUfmKY2HR8DGbZzsq84mWcRDvp3wzr3UHlegjYafi
         jx9w==
X-Gm-Message-State: AOAM531U2+eft1/H4XEWbUqzpyJoYFuJbK+cUwtsnmFVEgLmCtIO1HNd
	Sj54vZf2P265V2NHpCS6P/9d3ObwSwg=
X-Google-Smtp-Source: ABdhPJx//Bu2bQTWiIANw6gFcNQNl73PT5YPMw1J7zmsMvLp2TWT4fanV8YomaXtkfAX5YOgtOw5kw==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr6605002oia.85.1617899825883;
        Thu, 08 Apr 2021 09:37:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:05 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 57/64] uml-utilities: fix installed-vs-shipped with usrmerge
Date: Thu,  8 Apr 2021 09:36:04 -0700
Message-Id: <e516ff377b9083d32002e2efd2a5bcfec0238cf1.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ccba1eb6a8b4c850e26e5814adfb5136ca4865a8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/uml-utilities/uml-utilities_20040406.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 8e00cb3ea47..f86b2b912e4 100644
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
2.17.1

