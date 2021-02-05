Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.980.1612483298828687206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 16:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hShyooj+;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id j12so3124593pfj.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XCGyaqcD+uqDp4ogkCEfVIRdcv644WgIfEfWwF7YKns=;
        b=hShyooj+GYm1miDfL2pkoGP15ucJhrUoXWu+MK0HmaulrOVuzEY43TmbGIA5qL+h0h
         IpyK5LnNEYpHvYvu+imKhy2MOQtJbfMcTpdWj3vNaeCW9aQHX6ElAEVqt8qR0v/jED+4
         k6EhbObg71iKcEqQPruoFvaW/KITxfc5rGbGarrfKkLwxNNpd7bM7S3RQ2tsuDL0Eq4C
         Ud3VduoatHYxUHbvlyOiv33QIBrIZLi+kjSfMqcLi+r9laeZOtT5k3uOwu3Zvt7pJGjn
         hg8g1CQbfaHotvfaZUshT7sJhx+z9waKaoSM03eHY5Kv5WTMjhBmLv+26WdgsKetYvMG
         4dMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCGyaqcD+uqDp4ogkCEfVIRdcv644WgIfEfWwF7YKns=;
        b=UnKvWBdrgfkJ/9JbOtTNYEWnONgpqnUDY6cTHRmkcMHfC3CiczxkYsSShPXKhZLMV9
         NZlriYhMva/POAFVy/n+VR6FVPYLYW7u4co8B5UngnNQXomrKYpbBp2HihNfhpT63Hn9
         cIj755OVxZWpOa5YnwnpTeqbjIWA318fTWoynZVsveZEM/VTLxHo15nZTjJ72OR/iAql
         gDlvVQCtBFYgwlZkLJVvGhqKOWOLzzMko3H5XUV87BTgFaeQQHwnIQe7EFTJ7qLj6fJ7
         w7ajRChKGHL7GkK1Hpnvw8p9pMeqWsbk/zLik78J+7BQsoLt92J1g1ygmelAts7tmqDQ
         rMtw==
X-Gm-Message-State: AOAM530R5s939sfQmtmg1LH39mOZmUxIdOAFO2UdfMi7xns3WhppCL2e
	aXWlcbw+6yw20cjGfCzER8Qf1pGaNDsgjA==
X-Google-Smtp-Source: ABdhPJz7IPdxEPtDMUiOGlFv4VmpvKG4CRwTCMaWaZrVztrWCBwzTq18vJ4dUNXpLCQca4mP64zZFg==
X-Received: by 2002:a62:160b:0:b029:1bf:56ca:a594 with SMTP id 11-20020a62160b0000b02901bf56caa594mr1832827pfw.57.1612483298109;
        Thu, 04 Feb 2021 16:01:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id v6sm6330399pjc.57.2021.02.04.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 16:01:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] hidapi: Backport patch to fix build with autotools 2.70+
Date: Thu,  4 Feb 2021 16:01:31 -0800
Message-Id: <20210205000131.756936-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205000131.756936-1-raj.khem@gmail.com>
References: <20210205000131.756936-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ove-duplicate-AC_CONFIG_MACRO_DIR-22.patch | 27 +++++++++++++++++++
 meta-oe/recipes-support/hidapi/hidapi_git.bb  |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch

diff --git a/meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch b/meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch
new file mode 100644
index 0000000000..f3cd1015f9
--- /dev/null
+++ b/meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch
@@ -0,0 +1,27 @@
+From ce3ab6ba4b8176d100ac535a39e3d5b0c517989b Mon Sep 17 00:00:00 2001
+From: Jan Palus <atler@pld-linux.org>
+Date: Fri, 15 Jan 2021 14:32:14 +0100
+Subject: [PATCH] configure.ac: remove duplicate AC_CONFIG_MACRO_DIR (#226)
+
+fixes build with autoconf 2.70
+Upstream-Status: Backport [https://github.com/libusb/hidapi/pull/226]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 220909a..77da67a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,7 +13,6 @@ LTLDFLAGS="-version-info ${lt_current}:${lt_revision}:${lt_age}"
+ 
+ AC_CONFIG_MACRO_DIR([m4])
+ AM_INIT_AUTOMAKE([foreign -Wall -Werror])
+-AC_CONFIG_MACRO_DIR([m4])
+ 
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ LT_INIT
+-- 
+2.30.0
+
diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index df68a850a4..76f5dc7624 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -10,7 +10,9 @@ DEPENDS = "libusb udev"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https"
+SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https \
+           file://0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch \
+"
 PV = "0.10.1"
 SRCREV = "f6d0073fcddbdda24549199445e844971d3c9cef"
 S = "${WORKDIR}/git"
-- 
2.30.0

