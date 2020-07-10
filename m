Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.3894.1594353674531191713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 21:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u34M/00u;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id j19so1912581pgm.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 21:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tLQqmmCOaZ7mywfkZWDnH67mrfo74MoAFUS3GaFWZs0=;
        b=u34M/00u0bBY0U1TquCHTgqbHp+2gAGA8IcOa7AaQRusub4GVJdAd7VIeeEJkVPP3k
         yyb+zxITTPlQMSnPzCEbzIQMY0Oc6mz8JE+ydyOdhdJGT887KcGKRJ8G9/dmqwU4LU73
         D0RrAUpVCMz+vp9FLePUs66F/cn7EfkIfPfBYOt4mjO/ufS7HmM9L7O0O6Rlc9uP4YZj
         QcQmO6Of2Z8kQEAVihkp0ifWq8CdFiXcK7uYll9hOmPzwsySvbS17ErUli9a3pwnCVqp
         /VsAD1Qkh85yQCPLepUU1ZUB0fNqTrzJdA5MFifcK4zcMYv61LMLwydqBkIkKTv5JIRv
         1Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tLQqmmCOaZ7mywfkZWDnH67mrfo74MoAFUS3GaFWZs0=;
        b=EZtO4J0imRgOUnyDqsgtJMYtbeGjSIuqhvO6SMpnpAkpVEvvPYiiO/0a+RFyrzzRUm
         LucW6EZBZSyNgbhX4aKUtg7Yl9cK1kfy01JLGqHriCUOvPZiG9GRF4M9GJCT/oKnySzc
         QZ91/iwsbQtWfY39iWYFGPhPlQw2h5zY4jAfJDUslbVuQpBFKRNbOJZFLVb4e93dmNdF
         18JIOtlJd/SBot93C3fRBBidVTYv27W0n/1+RMZ0gXDJL1AUMYF8iGibg3o2d6NkQIhz
         UymGE3Hb6qkZ1QBeoORvusOus59FwqGGYs2DBEi+FDFbi+YriA+ce6YwiqCLGqohMNb/
         MIsQ==
X-Gm-Message-State: AOAM530xD/oXcdIcJ42/jMy5PjnCFvbuUki85Kil1RxaVWs+kak4BjZW
	Ixk2aF/iLqXJtLVsZUxtMllzTmSeYWY=
X-Google-Smtp-Source: ABdhPJwQUErLp3RpB9++vEjhn1nOZ1hCwMEGMx1X4oTtpwrhQk87jg3KxoQUwNS2Uo3XgSuzbn67lQ==
X-Received: by 2002:a62:fc53:: with SMTP id e80mr58687472pfh.129.1594353673811;
        Thu, 09 Jul 2020 21:01:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:396f:c9d9:1d67:d8dc])
        by smtp.gmail.com with ESMTPSA id b21sm4101405pfp.172.2020.07.09.21.01.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 21:01:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/4] python3-icu: add new package
Date: Thu,  9 Jul 2020 21:01:07 -0700
Message-Id: <20200710040109.22600-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710040109.22600-1-akuster808@gmail.com>
References: <20200710040109.22600-1-akuster808@gmail.com>

needed by python3-natsort

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-icu/fix_host_include.patch | 30 +++++++++++++++++++
 .../python/python3-icu_2.5.bb                 | 13 ++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-icu_2.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch b/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
new file mode 100644
index 0000000000..1b6e890436
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
@@ -0,0 +1,30 @@
+Fixed host contamination of include files
+
+python3-icu-2.5-r0 do_package_qa: QA Issue: python3-icu: The compile log indicates that host include and/or library paths were used.
+
+Also, don't use icu-config
+
+Upstream-Status: [inappropriate] OE specific
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: PyICU-2.5/setup.py
+===================================================================
+--- PyICU-2.5.orig/setup.py
++++ PyICU-2.5/setup.py
+@@ -81,7 +81,7 @@ Building PyICU %s for ICU %s (max ICU ma
+ 
+ CONFIGURE_WITH_ICU_CONFIG = {
+     'darwin': True,
+-    'linux': True,
++    'linux': False,
+     'freebsd': False, # not tested
+     'win32': False,   # no icu-config
+     'sunos5': False,  # not tested
+@@ -274,7 +274,6 @@ setup(name="PyICU",
+       ext_modules=[Extension('_icu',
+                              [filename for filename in sorted(os.listdir(os.curdir))
+                               if filename.endswith('.cpp')],
+-                             include_dirs=_includes,
+                              extra_compile_args=_cflags,
+                              extra_link_args=_lflags,
+                              libraries=_libraries)],
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.5.bb
new file mode 100644
index 0000000000..5e8c8a3a02
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icu_2.5.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python extension wrapping the ICU C++ API"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
+
+DEPENDS += "pkgconfig icu"
+
+PYPI_PACKAGE = "PyICU"
+SRC_URI[sha256sum] = "a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc"
+
+SRC_URI += "file://fix_host_include.patch"
+
+inherit pypi setuptools3
-- 
2.17.1

