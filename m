Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064BE810C2
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:49:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.14598.1695811767635777634
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2Nv7WJk;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so13214125a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695811766; x=1696416566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmFWiPXR34E4dBm/XfngapKdOD6CaG8imPRodUIBuXI=;
        b=K2Nv7WJkOeXQaPjCTxrwO9aQNgv8gwbD3amg39yYOIAnEv/DqBKwBZH2xZ8LJazNss
         jlxlXuS3klzlwivgVHVNnM3WowefCZ7/gGLc+Gvvpzjqt4TGKrDmC/z+moaWYTm1J26Q
         3Zxx0MENzXrK368SOC/PhLcN2pHsBf4rok+Fz8oPzn/9Lhw/M5Lruo8d3G6bIbv6t97E
         xGy0VzqvvL6NXUf3LFccQ0d818qSFAinxm8s77D+gfccFiqFSVyHs3Rfh16PLkIuwvVs
         aJAhGZaLWHABhuJjcz95kkOM2ANIUNAvz8iIfbi2QVPmeOG1T97g13AzvobFAHwNjuYv
         XZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811766; x=1696416566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmFWiPXR34E4dBm/XfngapKdOD6CaG8imPRodUIBuXI=;
        b=Cfx9G57Jn8IuPYAfcRCFJy4f+PT7O/HpB6XRYc5Co6rQrBWkowA7RfgbYxGDLLpv8I
         XrMgFGijypD4X2qOvYIlZ7dAjYnsKkumk7A6Y6m6ZPW3UqG4CO9IQdMyDjQhmQN1OCRy
         AWp2KHdutLcFRaUcQwPTIgRy0F9v2cKGqX6Siheo3tYiH5/laqMKl0BrM/5Z9wNR+Cmw
         JMhAVAUhzmE5e/AgjQUbCfH/G4d6Pe3m/F62TOPpqg1FLPczmJneQOObwxxA7D4FROdi
         wmavsf3ydyY10VCZGyyyd2DMc7RnyX/LwtxYO4QZWN4WY97vDvlsR1uHLyB8whzXuWiP
         eDdw==
X-Gm-Message-State: AOJu0YyGm08c4MCuJT/im+Hk08WAeAymELbPh8n+Qqm3wsghlwCCxNm6
	Q0DU6pmVcZpNp7MNPVJvrC5TkjZB6SA=
X-Google-Smtp-Source: AGHT+IFUppEe6bbdsyJ1nmQDfHoiirGE6Gsph9QRivU0gGKnnHPLW48NFAPFiOTgj+eb3l/RCE65MQ==
X-Received: by 2002:aa7:cd51:0:b0:52a:66c0:1e9b with SMTP id v17-20020aa7cd51000000b0052a66c01e9bmr1709428edw.30.1695811765723;
        Wed, 27 Sep 2023 03:49:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j6-20020aa7ca46000000b0052889d090bfsm8028064edt.79.2023.09.27.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:49:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] gnome-tweaks, networkmanager-fortisslvpn, libesmtp, json-schema-validator, python3-pybluez, python3-pynetlinux, apache2: Fix Malformed Upstream-Status
Date: Wed, 27 Sep 2023 12:49:15 +0200
Message-ID: <20230927104920.2052173-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 10:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105186

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
 .../0002-meson-fix-invalid-positional-argument.patch            | 2 +-
 .../networkmanager-fortisslvpn/0001-fix-ppp-2.5.0-build.patch   | 2 +-
 .../networkmanager-fortisslvpn/0002-fix-ppp-2.5.0-build.patch   | 2 +-
 .../libesmtp/0001-Add-build-option-for-NTLM-support.patch       | 2 +-
 .../json-schema-validator/0002-Fix-assumed-signed-char.patch    | 2 +-
 .../0003-For-root-value-use-empty-pointer.patch                 | 2 +-
 ...1-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch | 2 +-
 .../python/python3-pynetlinux/0002-Fixed-relative-imports.patch | 2 +-
 ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

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
index 9126aba8d3..4d54a2e943 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
+++ b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
@@ -20,7 +20,7 @@ From python 3.8 changes:
 
 Fixes https://github.com/pybluez/pybluez/issues/426
 ---
-Upstream-Status: Accepted
+Upstream-Status: Backport
 
  bluez/btmodule.c | 23 ++++++++++++++---------
  msbt/_msbt.c     |  6 ++++--
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
index 9b5d9d6364..ee7cea8108 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fixed relative imports
 Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 ---
-Upstream-Status: Accepted
+Upstream-Status: Backport
 
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
-- 
2.42.0


