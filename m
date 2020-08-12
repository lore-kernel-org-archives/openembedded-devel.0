Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.295.1597264901257449089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qocQXlwn;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s15so1632894pgc.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=prtcrOEs8zqhAWwTviv7/38+s+CdvvouYjCbk/ZEDEE=;
        b=qocQXlwnmBt6YCXSgDLaDMDdPZK5de8f2w8d1lPbI31TZMNRdq9Vic7MyLCjjidhWz
         zAMqr0nbRfoQEobpEJGlxycGH+HBPu9Q7eDLzEkMetUosE+SGQIvIFX3FmHK/isQEjbj
         f0Mgj2tb0rbLd00lRKhR0j5d+2noH11SJSxwqiIyj2EoFH10mkQ3VKrmrEju9XmC4SN3
         lyXrGzc2GM97EGOoDZBK9H++hrHs+jo8TYm94A7IMVVcrbP5GIY30KPm74FzD9nPjbGX
         o+OVhpbUq4R769fDPMHkq/I2XyY4a+voMiOEoAUuUpqUE9sopLfkDNW5gGqvOkHMz2il
         2X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prtcrOEs8zqhAWwTviv7/38+s+CdvvouYjCbk/ZEDEE=;
        b=QK0ORHT2LM7tDXjqRUJka4pUcHmHp4LHRonBmkvm+hapyegT/tM9D1iNANOPwXqg21
         gE7QCWmwu4ADAa+TdqaibH8TKB4Srbh4lmKh2F5K7kpCyVsoC1elQy5hPbvxsRCB2RHw
         e41pxXNRrRSdEFnU0CsTJ/VzVHF5/616CaJzQTem3QwRhcDW4W7pt9mQriEZtsSxxgu3
         Gwnpfh8EzSS4To+pEgb2IeOrsKakYXgdQc3HcXyHDTK0/e5W/l7AVbMASjXExswSCGEs
         NUG1VbtoCdmVth/vCUj549835MSrRCZjGKghQG0DyRxr3Wb9h/DlTVWAbPHCeA26teEF
         9mbA==
X-Gm-Message-State: AOAM530pOkEsO9IRK64xduxacnyZ1h2TyfE2Excmd0nNuH4sm53185Z6
	xfBsStGHCPD7zY8ro16BFShYO6zmgEo=
X-Google-Smtp-Source: ABdhPJwgFx7a8MbXbFekZ8I+uDYrq5PD7R218VlU6dO6Svv85Ubfmeb9tzKqjGybmbe91Bmzvg8nnA==
X-Received: by 2002:a63:4f52:: with SMTP id p18mr819815pgl.408.1597264900208;
        Wed, 12 Aug 2020 13:41:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 10/18] fwknop: Fix build with gcc10
Date: Wed, 12 Aug 2020 13:41:22 -0700
Message-Id: <20200812204130.1012160-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...with-GCC-s-fno-common-flag-fixes-305.patch | 27 +++++++++++++++++++
 .../recipes-support/fwknop/fwknop_2.6.10.bb   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch

diff --git a/meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch b/meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch
new file mode 100644
index 0000000000..e696ac4ead
--- /dev/null
+++ b/meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch
@@ -0,0 +1,27 @@
+From 5aea816f27a71e6c88ad50e7326fa6584eeb7ad9 Mon Sep 17 00:00:00 2001
+From: Francois Marier <francois@debian.org>
+Date: Fri, 24 Jul 2020 21:22:47 -0700
+Subject: [PATCH] Fix compilation with GCC's -fno-common flag (fixes #305)
+
+Upstream-Status: Submitted [https://github.com/mrash/fwknop/pull/319]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client/log_msg.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/log_msg.h b/client/log_msg.h
+index cc17716..3dda161 100644
+--- a/client/log_msg.h
++++ b/client/log_msg.h
+@@ -38,7 +38,7 @@ enum
+     LOG_VERBOSITY_INFO,         /*!< Constant to define a INFO message */
+     LOG_VERBOSITY_DEBUG,        /*!< Constant to define a DEBUG message */
+     LOG_LAST_VERBOSITY
+-} log_level_t;
++};
+ 
+ #define LOG_DEFAULT_VERBOSITY   LOG_VERBOSITY_NORMAL    /*!< Default verbosity to use */
+ 
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
index 3eca3ab627..c3681f9259 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 inherit autotools-brokensep
 
 SRC_URI = "http://www.cipherdyne.org/${BPN}/download/${BPN}-${PV}.tar.bz2 \
+           file://0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch \
           "
 SRC_URI[md5sum] = "47a9c7c214c40dceb5dc2aa8832e4f32"
 SRC_URI[sha256sum] = "f6c09bec97ed8e474a98ae14f9f53e1bcdda33393f20667b6af3fb6bb894ca77"
-- 
2.28.0

