Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.819.1611269030982452738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gOFwjE1Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id d22so4457588edy.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6UFwLO+dI+ZyiyNvqrzXcX9Tu6jt9kpfePZax/njWU=;
        b=gOFwjE1Z6E7PA2l3j7VsBL9Yv3K5LoI1vJ8NZXebZmuBOcKTT5XzAMQdEJtXJOcgoO
         haeD00cZnInMOg5DylZKWX5vCsjfbAc4EpVKFIZTrDXscryTGZ4GRfWylr9Ye8bSX84h
         +4zfSX/LP5hw9UPMg2uFQfciD3IFKluurbptynWsUUGDHz3Vqd84OOjSmnECJsvPj6je
         +tQWky3mv3loW+IGDxUClpUzPUQ4BwSdBoOIxq+BpMZjvTlh3FqOI08UNM7Uh1PhKiwR
         z46eFM07t56J7XRVNUxvCmkgtOdH1Xd/IZEUcnEOt2idHWzYASxGHS5u+/6Uvq1BA4uR
         aTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6UFwLO+dI+ZyiyNvqrzXcX9Tu6jt9kpfePZax/njWU=;
        b=tcdMOHU9CQdfKKKqU4T/CqHhQCrE1XlvQAuTH1MSC+GxXMDTZkU7/dOBKlS47YDl8V
         CAmr2zOfFnRSPUsGstwbgEShbyRd0qOuCNDYJySwvhdT5LE98s/kbA/CyBxiGYB5jHf7
         kBQNgOILy3wiOQlF8Q8p3aBvvUxM0D6LCY1sWKpkhPoNWr6HcXaueepvtRT21zLrRbVy
         xVSKobE0e5PFaY+SF6sNg2Rez0swPCB2f1HrsGiYWkIMTBkjYfZ98MJzvpTYJ9H9NW3Z
         slXfmO1K6jJcjQ/Jhm12GBAJ5wjvyQBB+BzebPlXNkR4CJVnJYHqozBYyGIQ/Ufx30pO
         sxfQ==
X-Gm-Message-State: AOAM533pT2iMi1YO1a+hOmFaQutyusSKBPwtsPcDhU46GkCyrVTAvbeX
	Hxt7gwdjMX3v/xiv2EtUufcsKYWS+iY=
X-Google-Smtp-Source: ABdhPJzLRQ416k55E+QfPrBDt7UDbdXwjXeG76Tb5NQektoynZ2lyNmn61pch6dLDkfRQyyhC//lvw==
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr1054389edt.226.1611269029230;
        Thu, 21 Jan 2021 14:43:49 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (mob-109-119-49-251.net.vodafone.it. [109.119.49.251])
        by smtp.gmail.com with ESMTPSA id gb14sm2814074ejc.61.2021.01.21.14.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:43:48 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] vboxguestdrivers: Add patch proposed upstream to fix a build failure on i386
Date: Thu, 21 Jan 2021 23:43:41 +0100
Message-Id: <20210121224341.1511325-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121224341.1511325-1-costamagnagianfranco@yahoo.it>
References: <20210121224341.1511325-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../vboxguestdrivers/kernel-5.10.patch        | 23 +++++++++++++++++++
 .../vboxguestdrivers_6.1.18.bb                |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
new file mode 100644
index 000000000..a6b0a0454
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
@@ -0,0 +1,23 @@
+Origin: https://www.mail-archive.com/pld-cvs-commit@lists.pld-linux.org/msg461494.html
+From 80bfab5ec8575703ef26b442a3af2d030793ebde Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Jan=20R=C4=99korajski?= <baggins@pld-linux.org>
+Date: Thu, 24 Dec 2020 23:03:55 +0100
+Subject: [PATCH] - DECLCALLBACK generates incorrect code on ix86, remove it
+
+---
+ kernel-5.10.patch | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kernel-5.10.patch b/kernel-5.10.patch
+index b28d6e0..729235d 100644
+--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
+@@ -536,7 +536,7 @@ typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
+  * @param   uAddr               The address to apply the new protection to.
+  * @param   pvUser              The opaque user data.
+  */
+-static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
++static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
+ {
+     PCLNXAPPLYPGRANGE pArgs = (PCLNXAPPLYPGRANGE)pvUser;
+     PRTR0MEMOBJLNX pMemLnx = pArgs->pMemLnx;
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
index ea6a082f6..d620e9893 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
@@ -13,6 +13,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://kernel-5.10.patch \
 "
 SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
 SRC_URI[sha256sum] = "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
-- 
2.25.1

