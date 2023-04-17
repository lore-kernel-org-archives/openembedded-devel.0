Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167A5C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 18:51:52 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4976.1681757504532341410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 11:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LyL9PHvn;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id s23-20020a17090aba1700b00247a8f0dd50so2799054pjr.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 11:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681757504; x=1684349504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPk0XNG22TcPcT+48qWRlZ8BNBcQp5/t6o8nW/37S44=;
        b=LyL9PHvniY4+EmoktnFpUK8HJtaYf0VB4ED2v9KWWZjFNLQPmrxoktRbbtzlSYxfpH
         Ps/A7kchKezJH26Wu+P7LvlKlFeduGqb2N6j1QKO0o0R1Xh84ZtUPU2js6y/z4iAi2pD
         2le5ihj5PFlwIL0NgqN1DlMSDRE/OfZQug4oBkvWmR7O5sae7LtyPV7MH714M2R4cTny
         CPOXvKn3uf5DmwT1EnfMjFjwe/DyA9puPYbInozEbOzjd+u0txq7f6uO5sXZ33/gITff
         y/25mknjwUdLbAfZFv3b3fplrJk8D5NqOyWiULKwzHRVoAJCIj2yeJG9sHFMVOUpPeCJ
         STNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681757504; x=1684349504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPk0XNG22TcPcT+48qWRlZ8BNBcQp5/t6o8nW/37S44=;
        b=aSamBPHRz/Bu8jk4Lj6kB8TfANkaZtGojV53kDEMh41kV78d/2NDxu3wM2RBZZDKtG
         eQIfdS4iVvQ1zMnkw1UWyP0XC2/A6kYqHQprzVlvLsicm36bZ/tp5rf205dFKrG4PJTH
         4KfhRbAFMMWt8wQb7ZdKNlVDKA9bag2AcVw0fW1ntPpNeVQA9UYeX24T753D/lWesrD5
         q+/ON06tvBrwlH9cCKVU+xgRhuCqiLXj96tnT3edaoyToGEmtOyguqj+t6j8AwLbgvFh
         Q27lZ/whD63vXHdNU4I6ZCTUztqEJAFu3r884tiCfm084zH2BIFPLts87nRkzUX3/Qju
         L1NQ==
X-Gm-Message-State: AAQBX9e/Oea83TDxRG7pJ8Kpw4zmG5zdWa4HcGQXIYylt7DgEjROksu2
	h83OOwzK13IPR2RiVcq1rq9y0tIirtuG4g==
X-Google-Smtp-Source: AKy350Yfi+EXHQnOkFn28ffkobV2RhmBgo+wZ5Bal/yQIM9YgQqSB594ao7k9vKMUujVgQSPx8p7gQ==
X-Received: by 2002:a05:6a20:a00d:b0:f0:60be:33a with SMTP id p13-20020a056a20a00d00b000f060be033amr1404824pzj.56.1681757502962;
        Mon, 17 Apr 2023 11:51:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id x2-20020aa79182000000b0062ddaa823bfsm7864234pfa.185.2023.04.17.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 11:51:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwupd: Do not emit build time paths into generated headers
Date: Mon, 17 Apr 2023 11:51:40 -0700
Message-Id: <20230417185140.1389241-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 18:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102129

Fixes
WARNING: fwupd-1.8.9-r0 do_package_qa: QA Issue: File /usr/src/debug/fwupd/1.8.9-r0/src/fu-plugin-builtin.h in package fwupd-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lute-buildtime-paths-in-generated-he.patch | 41 +++++++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch
new file mode 100644
index 0000000000..2273bdf105
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch
@@ -0,0 +1,41 @@
+From b1df1ed3a21b8ef0244102043a8fb88b0ccc3f91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Apr 2023 11:30:21 -0700
+Subject: [PATCH] meson: Avoid absolute buildtime paths in generated headers
+
+using meson.project_source_root() means the path emitted to include .h
+files is absolute and it makes its way into PN-src as well, which infact
+is not going to work if the -src package was used to re-build this in a
+different build path. Therefore use relative path which is '.' and
+relative to ${S}
+
+Changes
+include "<abspath>/plugins/acpi-dmar/fu-acpi-dmar-plugin.h"
+to
+include "./plugins/acpi-dmar/fu-acpi-dmar-plugin.h"
+
+in generated build/src/fu-plugin-builtin.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index b9f6736..bb856ea 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -188,7 +188,7 @@ plugins_hdr = custom_target('fwupd-generate-plugins-header',
+   command : [
+     join_paths(meson.project_source_root(), 'contrib', 'generate-plugins-header.py'),
+     '@OUTPUT@',
+-    meson.project_source_root(),
++    '.',
+     ','.join(plugin_names),
+   ],
+ )
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
index 14d83ec521..1f95dee1be 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "719a791ac4ba5988aeb93ec42778bd65d33cb075d0c093b5c04e5e1682be528a"
 
-- 
2.40.0


