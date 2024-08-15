Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9539C52D7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:46 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.116218.1723697138042250308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqvn+gYY;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-704466b19c4so318092a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697137; x=1724301937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RunKbqlgvHc6nG4MfXMzXYcrZFxy/vgt+nQv5bA2S/U=;
        b=hqvn+gYYCxbxCxucnEGe/53ND90NttrG6NKu9yP396TF983xfxwhUix6NGv0/+InkM
         HoIkcwKb3ntLET3hbSTMHtknalOmPOUA/MfFugoDHG04keimRudHGJ1zTiQeO910hD3l
         kqKGKo6mtsqOC1L6CPuZ3nz5gbM4ji2QjNekFVhEQPZYGjNIkOZAWr1jtIj3hHAYSSkk
         HMAacZwqXA7KS7PpdJeceXFAipt8hB2/bjl3jav6dM0Tea/xJJlaK4HuN22Z/PINkKEE
         RV6RI4FHZ6frFA32LF0He52X/aOZKNdSdETQK456n0SV1lRf1EKz9svwHSGBqn/qcDO8
         FTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697137; x=1724301937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RunKbqlgvHc6nG4MfXMzXYcrZFxy/vgt+nQv5bA2S/U=;
        b=W6LJsTdvMBmRUtSwg+TK5ihK3Z5LqOknVFFjJT+NgJcFtQCnte0rACEP6Gj15ll2pa
         Y2Yjx0H7l6NGeTz3Nl1QiEvh8nTfCXQqMYv9wJ16f1NWSCZ2oqL6ako5otH326+QzcdC
         qpmdjqsVPTQfPs2nsI2uWm1YBtoPRGVTxtVEa+9fkn5UfXFur4aaiySUBY21SjuYATIW
         ZSRYCu38+It/hc/Ji2fm3kbpQFsdYawyzvE3wWz+QiJASZSDPyhxnzlPR0Q2Vhjs5Eg6
         Maj4YpOg2DdxuBbFyiUBiEoYP4GKBes2QjFM8pyt7XvKIM4YrxcAnqPwwVIeqI16YY8o
         NPCQ==
X-Gm-Message-State: AOJu0Yw0pYLj1PjHRTQ0oOqUz34cR/6Wk3u7hxCdLaSiNqPW1Ih/FhcO
	XEj/ZZyVHt8mh1bo1sdBOdAtEax4zNpnNIFe833vMsbkuqaakEljnKql1Q==
X-Google-Smtp-Source: AGHT+IHapfoSIiHcxfos7kIeWiEMVBsbug/1ov41D3+akqeKlvlZTKlxFiIlV7nWtx6EaO3K1kOWZA==
X-Received: by 2002:a05:6830:2b09:b0:709:4735:6dc1 with SMTP id 46e09a7af769-70c9d9c1043mr6465472a34.6.1723697136895;
        Wed, 14 Aug 2024 21:45:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCH 9/9] blueman: Fix buildpathe issue with cython generated code
Date: Wed, 14 Aug 2024 21:45:23 -0700
Message-ID: <20240815044523.1030831-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111817

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 ...n-DO-not-emit-absolute-path-when-S-B.patch | 38 +++++++++++++++++++
 .../blueman/blueman_2.4.3.bb                  |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
new file mode 100644
index 0000000000..10f89a124c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
@@ -0,0 +1,38 @@
+From 18af739fd96960bbc8c5db5dd290d2f9134cd347 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Aug 2024 21:26:24 -0700
+Subject: [PATCH] meson: DO not emit absolute path when S != B
+
+build systems like OE build outside sourcetree in such cases it works
+ok but cython resolves the input file to absolute path and that gets
+emitted into genetate _blueman.c as module name, renders the build
+non-reproducible, wish cython had a better way to handle this but there
+is not, therefore tweak the meson build rule to account for specifying
+workdir to cython which will search the inputs correctly, and use
+meson's build_root to emit the output into build dir. This ensures that
+it becomes independent of source or build directories and cython does
+not generate the absolute paths into generate C code.
+
+See cython discussion on [1]
+
+[1] https://github.com/cython/cython/issues/5949
+
+Upstream-Status: Submitted [https://github.com/blueman-project/blueman/pull/2461]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ module/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/module/meson.build b/module/meson.build
+index 096ad7c8..e3d96f17 100644
+--- a/module/meson.build
++++ b/module/meson.build
+@@ -4,7 +4,7 @@ blueman_c = custom_target(
+     'blueman_c',
+     output: '_blueman.c',
+     input: '_blueman.pyx',
+-    command: [cython, '--output-file', '@OUTPUT@', '@INPUT@'])
++    command: [cython, '-w', meson.source_root(), '--output-file', meson.build_root() + '/' + '@OUTPUT@', '@INPUT@'])
+ 
+ sources = [
+     blueman_c,
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index df2a226f0a..c2bb4d24c6 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -8,7 +8,8 @@ inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache u
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI = "git://github.com/blueman-project/blueman.git;protocol=https;branch=2-4-stable"
+SRC_URI = "git://github.com/blueman-project/blueman.git;protocol=https;branch=2-4-stable \
+           file://0001-meson-DO-not-emit-absolute-path-when-S-B.patch"
 S = "${WORKDIR}/git"
 SRCREV = "7bcf919ad6ac0ee9a8c66b18b0ca98af877d4c8f"
 

