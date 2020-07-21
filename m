Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.5898.1595367226253785920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 14:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F1o6jbNN;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id u185so87651pfu.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fUUJMZ7rohuavaC1jCDZveJFKBx7+HYtC900QrjPHNg=;
        b=F1o6jbNNFXG+vRdEKlUZ17vJiT9GCq3efmXtRXI5PQtkVmmqi5/aVkjqeMJsqDOKOz
         dExnkvde984VgOKNrNxgMa2fpvMPjqPHLZN5NYdTybJZxtEzFrtLtKelxNFETOCqXHyz
         gsDGWY5W7oJF/3NlQc55QEo+3IVejJBjqythZDaKqxn+3W8jXvUvig21IsiZ3EZIh4sr
         VOmYIMMoRV3uWy8pJPIVDvQoZ1sXDdruGwtYsoak3m9ybpcuDZqbIz9rM+GQ0aXv2zqq
         vi8YJcteS5b7KvX2zlBGkwp3JZ1NdR/MOaYLSadMH9rAhVbX5hN0u3fLN/oYwEI4Em6X
         ZBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fUUJMZ7rohuavaC1jCDZveJFKBx7+HYtC900QrjPHNg=;
        b=RBkYVs4wLntb88VM3Jy728el1LCc1ZkcfMTYHZBDAYl1SI1ZYWm20ZUrH6RVzlorlg
         d+xZPaaKNnEpL1Dt/YP+IyqvXuXt0jHF2mwbMQ3TrdsFiR0s/ZDGzmI930IjFeJwEOg/
         rg9BpccnJdFghUdXWO1TlcH9wP9sJ4aPPeZXItq3gIVJ9exdrGAcDq9DnvGc4s6g8gJd
         nuu85dEQ/VuwatzDX2sMvwqvT/N0HHdSumEIA37G48RnDHrFUER/hfPJE4RfIBG4/rIZ
         obPkk/Yc+IAc8+AxnT/lkP01hcJltdg1jH0ru/M6dXzykxjiKYZe5NZSOnkEqjUszORa
         Dn5A==
X-Gm-Message-State: AOAM533geqSxb9+e6uLvQmskCGOjjxdd2GXjlH1EavdoqJXPqzKhlBXD
	cWM52yqL9usBhkLl5x65am+JLnmk7Qw=
X-Google-Smtp-Source: ABdhPJytcrKTiMQytxPWBnfWyKmIDzPV21Q9qVfHQq0gjWYXW0fA+qiIZzk1mWfJSaTeccB14zachw==
X-Received: by 2002:a62:7e0d:: with SMTP id z13mr25067414pfc.161.1595367225485;
        Tue, 21 Jul 2020 14:33:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id w71sm21611458pfd.6.2020.07.21.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 14:33:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ace: Upgrade to 6.5.10
Date: Tue, 21 Jul 2020 14:33:43 -0700
Message-Id: <20200721213343.2418737-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: URI updates [1] [2]

Fix build with glibc 2.32 while here

[1] https://github.com/DOCGroup/ACE_TAO/commit/5564c9667dc17bc7826e54efe7dae79334218a03#diff-134809fa00f40b726d607f36dffcc5cc
[2] https://github.com/DOCGroup/ACE_TAO/commit/289a4a8e0006f7a20e8de568334f74ba74f7a4bf#diff-134809fa00f40b726d607f36dffcc5cc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ace/{ace_6.5.8.bb => ace_6.5.10.bb}       |  8 +++----
 .../ace/files/no_sysctl.patch                 | 22 +++++++++++++++++++
 2 files changed, 26 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_6.5.8.bb => ace_6.5.10.bb} (80%)
 create mode 100644 meta-oe/recipes-connectivity/ace/files/no_sysctl.patch

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
rename to meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
index e35bce7f3c..df194f95a0 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.8.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "C++ network programming framework that implements many core \
 patterns for concurrent communication software"
 LICENSE = "ACE-TAO-CIAO"
 HOMEPAGE = "http://www.dre.vanderbilt.edu/~schmidt/ACE.html"
-LIC_FILES_CHKSUM = "file://COPYING;md5=96ef88a5529594698e8ceabdd47df92c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_8/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_10/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
+           file://no_sysctl.patch \
           "
 
-SRC_URI[md5sum] = "a6ba6a944612fe0696c90cbb5c3078ee"
-SRC_URI[sha256sum] = "cda2a960dbb9970a907663627711b2e2b14b3484a2859ae936370bcad0b16923"
+SRC_URI[sha256sum] = "90de437926928e98e9fd9132c7c3e886ca79f25567adeccbc24a5996f230d8e2"
 
 COMPATIBLE_HOST_libc-musl = "null"
 
diff --git a/meta-oe/recipes-connectivity/ace/files/no_sysctl.patch b/meta-oe/recipes-connectivity/ace/files/no_sysctl.patch
new file mode 100644
index 0000000000..278893114c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ace/files/no_sysctl.patch
@@ -0,0 +1,22 @@
+glibc >= 2.32 has removed sys/sysctl.h see
+
+https://sourceware.org/git/?p=glibc.git;a=commit;h=076f09afbac1aa57756faa7a8feadb7936a724e4
+
+This check therefore ensures that its only used on linux when glibc has support for it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/ace/config-linux.h
++++ b/ace/config-linux.h
+@@ -20,6 +20,10 @@
+ 
+ #include "ace/config-linux-common.h"
+ 
++#if (__GLIBC__  > 2)  || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 32)
++#  define ACE_LACKS_SYS_SYSCTL_H
++#endif
++
+ #define ACE_HAS_BYTESEX_H
+ 
+ #if (defined _XOPEN_SOURCE && (_XOPEN_SOURCE - 0) >= 500)
-- 
2.27.0

