Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB36C6FA89
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.2850.1662594081597338627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9M2GG7w;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id o4so16038153pjp.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PTRcDS7eXYl5px7byg6q8lcYHfTsQ20vgSLsDDRlyEQ=;
        b=G9M2GG7wN8DHNrAo/6KnURHRNLO0+0mqBEPjec2CDiBTGx09mwIPMG+b03xI2m1C9a
         xddwOiA3nRwDj6Dvc5Qli+vJKAk4g5YqERgKlT5E+P32qn0lNjSGxMeAcpITgWWqDqUi
         Cm36xkrfvSHx+6iijLqmXHvmAdiZzA9N2cc3e7jJyN4mSqc2USWQ9WP0iVs706ulsMF5
         LQ+4b6GcTnqO5wAL8/1RYGHkMxc8sEostlAPcFCKydqvL9XiDNzk7aGFYVhuyB4DXrnS
         T3273CyYNwJeBDQG1L44A2l2iflhpTW3QCgraVQL/YIZg36V5MxP0c2vIIYmvwpaYxjZ
         CGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PTRcDS7eXYl5px7byg6q8lcYHfTsQ20vgSLsDDRlyEQ=;
        b=ew6qj7JP5nE0cG9u2vFB6rDTZuYIs7RU2CTpR9QGThhNKV0MaH+wkXle6fd9Rf6sDj
         89H9p97tlgDbyEEAicMklYItJry69WNmw9gR5RFMLvDeP7deim4R15TbQ5aCfY7uDYz/
         M6SkifpyX+EUJX1IsVPomzbwhlbGBaPfwixYGFqMuI4wtXdA2lfKtgGHhK8mGegdRo3q
         +ormuv5z46sgLmjXMrVeEbfGMwoZvMENpBenz7esJvlkuur0h8P2xwSA0IzMv17HNFta
         SaJXHlroZ0/pxaVBJm2bIJ5ON5B/kM9SRWRAq+0ToXmroX5b6NqKvrSQLjlYKHLUMeNW
         /K+Q==
X-Gm-Message-State: ACgBeo17miD5boP4un66AADRg/k/4JQY5ZPWnkS/dMnWi3FuXjzRhFee
	Yc5MXMuWCFX8Ww4YaUK4gG69bjbcywMIEg==
X-Google-Smtp-Source: 
 AA6agR6EF1TNrODAermVhOOy+64A5++psykTOu/Kv1aZ2o6Ra4pgMzA/P9Ozkvi51U4Ge46Jij2CoA==
X-Received: by 2002:a17:903:24c:b0:172:7090:64a4 with SMTP id
 j12-20020a170903024c00b00172709064a4mr6054853plh.124.1662594080870;
        Wed, 07 Sep 2022 16:41:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 20/22] matplotlib: Upgrade to 3.5.3
Date: Wed,  7 Sep 2022 16:41:00 -0700
Message-Id: <20220907234102.3312797-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98710

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python3-matplotlib/matplotlib-disable-download.patch    | 5 +++--
 ...hon3-matplotlib_3.5.2.bb => python3-matplotlib_3.5.3.bb} | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.5.2.bb => python3-matplotlib_3.5.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
index 42ffeb8970..25c49afb97 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
@@ -6,10 +6,11 @@ Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
 
 --- a/setup.py
 +++ b/setup.py
-@@ -317,7 +317,6 @@ setup(  # Finally, pass this all along t
+@@ -316,8 +316,6 @@ setup(  # Finally, pass this all along t
+     setup_requires=[
          "certifi>=2020.06.20",
          "numpy>=1.17",
-         "setuptools_scm>=4",
+-        "setuptools_scm>=4,<7",
 -        "setuptools_scm_git_archive",
      ],
      install_requires=[
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.5.3.bb
index eaa144719b..1a0b93b030 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.3.bb
@@ -19,9 +19,9 @@ DEPENDS = "\
     python3-dateutil-native \
     python3-pytz-native \
     python3-certifi-native \
+    python3-setuptools-scm-native \
 "
-
-SRC_URI[sha256sum] = "48cf850ce14fa18067f2d9e0d646763681948487a8080ec0af2686468b4607a2"
+SRC_URI[sha256sum] = "339cac48b80ddbc8bfd05daae0a3a73414651a8596904c2a881cfd1edb65f26c"
 
 inherit pypi setuptools3 pkgconfig
 
@@ -40,7 +40,6 @@ SRC_URI[qhull.sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b86500046
 # LTO with clang needs lld
 LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
 LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
-
 RDEPENDS:${PN} = "\
     freetype \
     libpng \
@@ -57,6 +56,7 @@ RDEPENDS:${PN} = "\
 ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
 ENABLELTO:toolchain-clang:riscv32 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
 ENABLELTO:toolchain-clang:mips = "echo enable_lto = False >> ${S}/mplsetup.cfg"
+
 do_compile:prepend() {
     echo [libs] > ${S}/mplsetup.cfg
     echo system_freetype = True >> ${S}/mplsetup.cfg
-- 
2.37.3


