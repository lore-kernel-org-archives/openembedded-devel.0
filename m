Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE96EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:08:19 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.4596.1690229296638064372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=OWtklsZL;
 spf=pass (domain: baylibre.com, ip: 209.85.221.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-48138ef0c3eso1422186e0c.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690229295; x=1690834095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHoi3bHcOftCHIoiTBSbVzljhEH3wnEXa7TqU2tMe8I=;
        b=OWtklsZLxO/3550FTh4mGafghlGXInHJv41+FRGRaVe6oLVjfyVSPHalzvKSLJL2Gc
         8OOlz0SKS4+KEXrvkF/Yx16Be2HwG2bPSeS7v94Jgt4lZF0AnvI8j+fVggjrJ5STmcZU
         iJ2b9nU9LZ/6QlpnE/JWzVldAWszKVjIREUsy9C6uGxtj6yS7afai550HElz72uw+8kd
         Bai67rVVrJkB/ykUE0tePr5a92LTIfQoz8O4cqc9XCCDtjfu44tK4ceGRz++P/fYRdHp
         OS/wVe4b358QFpmNfg/WJUjk00bEtrMPxbT3cVXWUB7FI0JiMTFqvDnRhHs8rGrnfIkP
         LFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690229295; x=1690834095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHoi3bHcOftCHIoiTBSbVzljhEH3wnEXa7TqU2tMe8I=;
        b=N4M+kHdmXKht1O8k9qaoYJD05MS2Lj8o7AYWWhxSYQXMpQAaGaAmKILtZeNUFebGeL
         q3NR49etrT+wXvvVEaf7iBtf/2VAK14XNF2f35iUypnKu4I0nHppf1oNi/glk4c3nKEC
         klDjV7cVr144ltDVCsx67Fp9b8A7J3Xxtlrs5foKQH1MDfeX9fVh46Z+5ujk2mMprSPh
         5x8v6NDiYfIn2CTgHXS1BIifvS8My6HDyifqnrWLGCmFIoE+Qzy6SO+C2wKfHpPGDtbm
         MLySiQdMcPJBTBs1mf4GfrGqv7uMYSvj2GtilGH89daz2TICF5kJjjE1z7LzlJXWn3zR
         OJDQ==
X-Gm-Message-State: ABy/qLZP4nKzqYbI5fmJ+B6GQi4UlwHF1nyaYLKsqYVJEOVnLCuA3Qxd
	vUOMMOX4oZ1QXQovVOy1tVUPO/eSNWW27NsCMpk=
X-Google-Smtp-Source: APBJJlHynTM0I8Z0Nm5JN7Vzjx2gV38OzhxSuedKBjVXpXjgErG4DLb3liXSkDlUZZ8LiPgtMhybMg==
X-Received: by 2002:a1f:4511:0:b0:481:4a91:ab62 with SMTP id s17-20020a1f4511000000b004814a91ab62mr4231903vka.7.1690229294983;
        Mon, 24 Jul 2023 13:08:14 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id p5-20020a0cf545000000b006300722883fsm840248qvm.33.2023.07.24.13.08.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 13:08:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pocketsphinx: upgrade 0.1.15 -> 5.0.1
Date: Mon, 24 Jul 2023 16:08:13 -0400
Message-ID: <20230724200813.346001-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 20:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104004

pocketsphinx now requires the skbuild module. It has changed versioning
style, explaining the large jump in version numbers. The LICENSE
actually has changed to include parts from other projects, which are
either BSD-2-Clause or MIT.

Also adopt the fix_cythonized_sources function (inspired by the pandas
recipe) to fix some QA warnings:

WARNING: python3-pocketsphinx-5.0.1-r0 do_package_qa: QA Issue: File /usr/lib/python3.11/site-packages/pocketsphinx/_pocketsphinx.cpython-311-x86_64-linux-gnu.so in package python3-pocketsphinx contains reference to TMPDIR [buildpaths]
WARNING: python3-pocketsphinx-5.0.1-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-pocketsphinx/5.0.1-r0/_skbuild/linux-x86_64-3.11/cmake-build/cython/_pocketsphinx.c in package python3-pocketsphinx-src contains reference to TMPDIR [buildpaths]

Changelog: https://github.com/cmusphinx/pocketsphinx/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-pocketsphinx_0.1.15.bb     | 14 -----------
 .../python/python3-pocketsphinx_5.0.1.bb      | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
deleted file mode 100644
index f7ffd9d268..0000000000
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
-DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
-HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
-
-SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
-SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
-
-inherit pypi setuptools3 features_check
-
-DEPENDS += "swig-native pulseaudio"
-REQUIRED_DISTRO_FEATURES += "pulseaudio"
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
new file mode 100644
index 0000000000..c6bd978d24
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
+DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
+HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"
+
+SRC_URI[md5sum] = "fdd1227fb750f087f0636f8c222cbbb9"
+SRC_URI[sha256sum] = "cadfe42cf1596399ff1a6818ad75970c658e567c7250d67e758b29444facede9"
+
+inherit pypi setuptools3 features_check
+
+DEPENDS += "swig-native pulseaudio python3-scikit-build-native"
+REQUIRED_DISTRO_FEATURES += "pulseaudio"
+
+PACKAGESPLITFUNCS =+ "fix_cythonized_sources"
+
+fix_cythonized_sources() {
+        for f in `grep -l -r -e '\/* Generated by Cython.*/$' ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}`; do
+                if [ -e $f ]; then
+                        sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' $f
+                fi
+        done
+}
-- 
2.41.0


