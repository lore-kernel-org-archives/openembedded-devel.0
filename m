Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.42891.1585538083787229183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 20:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mImx1pm0;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id g32so1976335pgb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 20:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lrBzw0nhw5Nf5/REdSjli2r6+3Vbto8zkyLt2D24S0E=;
        b=mImx1pm0Z2TND6zW0DZpQTQ9fsc+r8aMsRXKJN3QfIaVbLDnt58+ubxJC1PBbotUVf
         GVkhlhrDLZQXCASCov+/7dGX5CdSwc23A9wxsCMTl5xy5uxL+LtI7QrzQLGdFv9z/44K
         JELn/d9FwgS268MW6yFlaPVbu16fTOFu5csHn+ITM78EQJv+CeQyUpxenHIX1cQTur3Z
         q11OaipFmeMFtbEecvMFTB07n53x47DpgNjDXd4hhlESXs7S5HaaonTOxEBMNcBC3gAK
         pFj0VbHLoEN8Mza+aGZipcR15uZKA0TQR4Rrqj7/QnpNfKEUeHghuc0RiNa3q7U/bqnX
         tjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lrBzw0nhw5Nf5/REdSjli2r6+3Vbto8zkyLt2D24S0E=;
        b=DAHB5gBoTy50g2RXAP3o5Ta8DRjX/HyqMAgHq8zuKys9DxGZkQ+TRkeiBn++WBo6v6
         V5iXRPaT6P1NJuieXaT2d8GqWNJXgI7hNMUql0Q2kif3bX+BHD97je6g2HVDE17R2l7H
         j2B77pXSOgArwoF8H3oek8oa5SXrbxXXHuvP/bKG6sRdcC7eW6DfxmC+fJV7+9Ukqp6C
         wyeJ4johA5tUaiv12SlehxCtY1uqaE8AESkIGwV7pFoWkGRiwbVwYFHavD90SJ8HKa+T
         jg5FhOm44VjvOWrjyrWpzmdrZtzjGRrI6f4IidTxWt2hEpgaafXXozfohMawewUDtzqW
         Lb1g==
X-Gm-Message-State: AGi0PubvTgKoao2WdOSdd6NU7qbGbBncRU2Z05IACyFxAeDXKc90Fu6j
	nkwV359FTTSfbVzZs5lznhuecHZjWZQ=
X-Google-Smtp-Source: APiQypLvnYz2zkoeXDLjHfWdGC+9xijvLla3dF0HstHBeAczlpnY+dmuDn9jCueR2TbkPMNUF6v2Hg==
X-Received: by 2002:a63:296:: with SMTP id 144mr7452383pgc.110.1585538082888;
        Sun, 29 Mar 2020 20:14:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id r7sm9009569pfg.38.2020.03.29.20.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 20:14:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] emlog: Do not clean modules when building apps
Date: Sun, 29 Mar 2020 20:14:55 -0700
Message-Id: <20200330031456.1708148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
make -C /lib/modules/5.5.13-arch1-1/build M=/mnt/b/yoe/build/tmp/work/core2-64-yoe-linux/emlog/git-r0/git clean
make[1]: *** /lib/modules/5.5.13-arch1-1/build: No such file or directory.  Stop.
make: *** [Makefile:36: modules_clean] Error 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...move-modules_clean-from-clean-target.patch | 33 +++++++++++++++++++
 meta-oe/recipes-core/emlog/emlog_git.bb       |  6 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/emlog/emlog/0001-Remove-modules_clean-from-clean-target.patch

diff --git a/meta-oe/recipes-core/emlog/emlog/0001-Remove-modules_clean-from-clean-target.patch b/meta-oe/recipes-core/emlog/emlog/0001-Remove-modules_clean-from-clean-target.patch
new file mode 100644
index 0000000000..beba528b33
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/emlog/0001-Remove-modules_clean-from-clean-target.patch
@@ -0,0 +1,33 @@
+From fd0a4ee201b5c7b24da79dcd346ac121978951a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 29 Mar 2020 19:58:36 -0700
+Subject: [PATCH] Remove modules_clean from clean target
+
+This is needed when building applications (w/o module)
+Since OE will run 'make clean' before reconfiguring, this
+will try to run module_clean and will wrongly try to look for removing
+modules from /lib/modules
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c60863f..fc897d5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,7 +23,7 @@ all: modules nbcat mkemlog
+ 
+ install: modules_install nbcat_install mkemlog_install
+ 
+-clean: modules_clean nbcat_clean mkemlog_clean
++clean: nbcat_clean mkemlog_clean
+ 
+ modules:
+ 	$(MAKE) -C $(KDIR) M=$(CURDIR) modules
+-- 
+2.26.0
+
diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 22308d7e85..387dd67123 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -1,6 +1,8 @@
 require ${BPN}.inc
 
-SRC_URI += "file://${BPN}.initd"
+SRC_URI += "file://${BPN}.initd \
+            file://0001-Remove-modules_clean-from-clean-target.patch \
+            "
 
 SRC_URI_append_libc-musl = " file://Drop-use-of-error-h.patch"
 
@@ -8,6 +10,8 @@ inherit update-rc.d
 
 INITSCRIPT_NAME = "${BPN}"
 
+
+
 do_compile() {
     oe_runmake nbcat
     oe_runmake mkemlog
-- 
2.26.0

