Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51867E82CCE
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:08:38 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.27426.1695845317531762758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MbHRTocn;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso1216124566b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695845316; x=1696450116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o2em0myBgVPz5sxbevzml9vVCPdVJD/HV7E/yw/tyuA=;
        b=MbHRTocn5v+m0v094Kp977sQizXRaYVJzgrvKFcb4AnbfnilqiH5t48I7w1ZujLgtn
         jIYhNEtv9Pqd8AD/kWIbUmwLU6wz2voO7tJChBmxVscfGLEKynOioV4mZ00BMJBrpt+r
         GoAM9fJ8fnkNImoY/kgpkSkZevl8o78f4beEcMrwrhn9OvoNcG1BqUoEwJ/2ziiBJ6o0
         mQC7Eg2Wrnk9CGFONtV68T6+tV+TAmFSw3kFnWDI03ECHLjjvQrS89wclDjsxNV/hoNk
         dVfbOEEaStZIvEuNt7riiqut/0Xre7nYuWEfNorvdWbgFHdpCNA3T29F00JsV3lCTBsT
         AAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695845316; x=1696450116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2em0myBgVPz5sxbevzml9vVCPdVJD/HV7E/yw/tyuA=;
        b=oikfYtaa1Zlv7PlyRk4XwfA9I2/sL6l+RqS8x8NHWHvdtb6AfLg1WIkAkPQlt3H0lj
         Ip0N4xIpZubJpUAUsTy1EHF1gD1hPqa17e4dglgSC6zGPoahrX0bDO5lgQvWyvBkdEcj
         x/yBg4JzmjHZjIrdaLBOI6yWiGVRJ0WfwuywMHbbisDGoFzU+HBOE35j0IDlEeOV4pWA
         P+bZ4NNK+S8wt7MBZ5uqlie5DYAe8nv2Y85kEAlKm6epUqgbZ3btb0pytcq/PORjHRXL
         BHHitIJMdXiXI2tNZC4H23S3NMIZ6OCLHAtXxK04nmG2BYeN8oZE6+0eMWe/Sr6eXqPz
         LRSQ==
X-Gm-Message-State: AOJu0YwOkbo9azSy2qOmGmMpqksfg4JcH1GrXJO2fOd/Zy6msf7PDyJD
	YMkIULfvizx4wvkosd93e1kcmLolpGo=
X-Google-Smtp-Source: AGHT+IHluKDXsH/Bll8SzKru9oCW+4Kx3JQGSQ4E/CgiugYYAqKnhM/Df3VqCTfwstONZL8XizpOTA==
X-Received: by 2002:a17:906:76d9:b0:9b2:bcd5:8d37 with SMTP id q25-20020a17090676d900b009b2bcd58d37mr657285ejn.6.1695845315685;
        Wed, 27 Sep 2023 13:08:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090670c500b009a13fdc139fsm9719179ejk.183.2023.09.27.13.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:08:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] gnome-tweaks, networkmanager-fortisslvpn, libesmtp, json-schema-validator, python3-pybluez, python3-pynetlinux, apache2: Fix Malformed Upstream-Status
Date: Wed, 27 Sep 2023 22:08:28 +0200
Message-ID: <20230927200830.2296905-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105201

* Accepted was replaced with Backport in gatesgarth:
  https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes

* as detected with oe-core/scripts/contrib/patchreview.py:

meta-openembedded $ grep -A 3 Malformed *qa-patches
meta-gnome.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-gnome.qa-patches-/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
meta-gnome.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-gnome.qa-patches-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]' (/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch)
--
meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
meta-networking.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-networking.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch)
meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
meta-networking.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-networking.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch)
--
meta-networking.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-networking.qa-patches-/OE/layers/meta-openembedded/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
meta-networking.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-networking.qa-patches-Upstream-Status: Accepted [https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]' (/OE/layers/meta-openembedded/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch)
--
meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
meta-oe.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-oe.qa-patches-Upstream-Status: Accepted [https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]' (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch)
meta-oe.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-oe.qa-patches-/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
meta-oe.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-oe.qa-patches-Upstream-Status: Accepted [https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]' (/OE/layers/meta-openembedded/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch)
--
meta-python.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
meta-python.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-python.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-openembedded/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch)
meta-python.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-python.qa-patches-/OE/layers/meta-openembedded/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
meta-python.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-python.qa-patches-Upstream-Status: Accepted' (/OE/layers/meta-openembedded/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch)
--
meta-webserver.qa-patches:Malformed Upstream-Status 'Malformed Upstream-Status in patch
meta-webserver.qa-patches-/OE/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
meta-webserver.qa-patches-Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
meta-webserver.qa-patches-Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]' (/OE/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: just rebase on top of master-next

 .../0002-meson-fix-invalid-positional-argument.patch          | 2 +-
 .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch | 2 +-
 .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch | 2 +-
 .../libesmtp/0001-Add-build-option-for-NTLM-support.patch     | 2 +-
 .../json-schema-validator/0002-Fix-assumed-signed-char.patch  | 2 +-
 .../0003-For-root-value-use-empty-pointer.patch               | 2 +-
 ...Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch | 4 +---
 .../python3-pynetlinux/0002-Fixed-relative-imports.patch      | 2 +-
 ...modules-mappers-config9.m4-Add-server-directory-to-i.patch | 2 +-
 9 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
index bd7e76f208..d921ff3308 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
@@ -3,7 +3,7 @@ From: Mae Dartmann <hello@maedartmann.name>
 Date: Wed, 16 Feb 2022 06:08:41 +0000
 Subject: [PATCH] meson: fix invalid positional argument
 
-Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
 ---
  data/meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
index 0a568fa23c..2e84a334f0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch
@@ -7,7 +7,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Accepted
+Upstream-Status: Backport
 Signed-off-by: Eivind Næss <eivnaes@yahoo.com>
 ---
  Makefile.am                                   |  5 +-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
index 798a57b0da..6ac8f2b643 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Accepted
+Upstream-Status: Backport
 Signed-off-by: Eivind Næss <eivnaes@yahoo.com>
 ---
  configure.ac | 6 +-----
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
index 64938a4820..dbdd644830 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
+++ b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
@@ -11,7 +11,7 @@ disabled by default.
 Like 1.0.6, it will check openssl MD4 algorithm support as MD4 is
 insecure and modern systems may drop MD4 support.
 
-Upstream-Status: Accepted [https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]
+Upstream-Status: Backport [https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@intel.com>
 ---
  meson.build       | 13 ++++++++++---
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
index 2ee0a39126..1c4b871bb6 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
@@ -11,7 +11,7 @@ GCC treats char as unsigned resulting in compile errors:
 
 Fix this by specifying signed char.
 
-Upstream-Status: Accepted [https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
+Upstream-Status: Backport [https://github.com/pboettch/json-schema-validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
 
 Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
 ---
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
index e0d0cf8ce9..eac997ae58 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator/0003-For-root-value-use-empty-pointer.patch
@@ -3,7 +3,7 @@ From: Sven Fink <sven.fink@wipotec.com>
 Date: Fri, 13 Jan 2023 09:15:42 +0100
 Subject: [PATCH 3/3] For root value, use empty pointer
 
-Upstream-Status: Accepted [https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
+Upstream-Status: Backport [https://github.com/pboettch/json-schema-validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
 
 Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
index ba3edff0b4..fea87a2ff0 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
+++ b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
@@ -20,11 +20,9 @@ From python 3.8 changes:
 
 Fixes https://github.com/pybluez/pybluez/issues/426
 
-Upstream-Status: Accepted [https://github.com/pybluez/pybluez/pull/427]
+Upstream-Status: Backport [https://github.com/pybluez/pybluez/pull/427]
 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
-
 ---
-
  bluez/btmodule.c | 23 ++++++++++++++---------
  msbt/_msbt.c     |  6 ++++--
  2 files changed, 18 insertions(+), 11 deletions(-)
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
index bc438a8e7c..65f38814c3 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fixed relative imports
 Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 ---
-Upstream-Status: Accepted [https://github.com/rlisagor/pynetlinux/commit/afb778669efbc658a29e6bdb1c4834fee42931aa]
+Upstream-Status: Backport [https://github.com/rlisagor/pynetlinux/commit/afb778669efbc658a29e6bdb1c4834fee42931aa]
 
  pynetlinux/__init__.py | 8 ++++----
  pynetlinux/brctl.py    | 2 +-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
index 996eabf586..9accbf18a1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
@@ -4,7 +4,7 @@ Date: Tue, 18 Apr 2023 15:38:53 +0200
 Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
  include path if mod_rewrite is enabled.
 
-Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]
+Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1909241]
 
 ---
  modules/mappers/config9.m4 | 5 +++++

