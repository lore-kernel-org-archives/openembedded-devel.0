Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5E0CD1292
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 19:32:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12369.1762630332337608157
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 11:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h5+TX+vs;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so4746405e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630331; x=1763235131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU1FXEaR+cloc1/x+3G9JfZUFPZuotdCBfBW5Zx4hRY=;
        b=h5+TX+vsUmOPF6ci61f0583jkdU8G/xz1464NwjhPltGsmuecsCItxz/G4n0VpRCj/
         iURXFbo3T15a7GaFD+pTrVi+tQT2QuvgMuYY+eGwxuFc51xA1qDoIOabNf2F5FkJaV2A
         f6I0NftOCuHvWOFPfRR/sH9cw09Rp3NCgB4FQPwqb9yIwdfOb3TQ8ZZzI7Oy27JiBZja
         52sKYF1uotzH9AjQhJtNVfSNPoTiIoa6VytmOyWSmddr2Rj461wKuaXWnTkZGu4ajfo7
         TtBoLeuLmqpZHQ3uEeaAIBFUsF7j0XlO0FkFrNf0vrbQ6T9efF6kPrXwzVuwHC7w5lY9
         E+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630331; x=1763235131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AU1FXEaR+cloc1/x+3G9JfZUFPZuotdCBfBW5Zx4hRY=;
        b=T2DYRFglA27RRZbQ6mtuMGPx5CC9OVy0ERg3HwCTiqmmQ+ZHFkEzedP/WFq9JD5z5T
         NQ41yv6PS/+oANzNz8VDWLs3jL/QsCYL6HWCuWg29Rn/R5w03OG2lZk1qFZL4gvwcj+u
         7wIeyWZKJ8UiiXvtI5yC4LpA36BKYiaTsgisiF23D4HO9dEr1BjerAyR3jt+NO1XWOo7
         IVcVx5uAOq9V2+AdjB3lSBAFZ1JbuszwCToEWFIvhMUdfG52tcGNxBwOLIY2VIJ7bvYu
         hmWaGzqFVwebIOBrBbW6VtrPMXuuDXMRD4uFdlLau0sfrorbOhWnSkt5YHI9SHHv1+r4
         OecA==
X-Gm-Message-State: AOJu0Ywkh5x+6dBJ1vrXqtMrblzBo/aQ3iajtl/Lc1hfLK96Y9OUfBTS
	3HCxLLGP4M069zS4/A543njfhXfqD8VFJ90DhPZIBKoVF8mM1BIReuNoFXTxIlMa
X-Gm-Gg: ASbGncskDfeTSdNwuinY9O/rhtB8aA+d2xddPA/ifYN/NMQmSC1vaJFV240BK2KjzCJ
	cnPLlmryxzL6d1SaETGHK1xfGpQDXF80Aafepd5b9LCBijDGZF50BSYffPKkwhXyvdZXK8RtxJU
	Tfdt6ZEQUzmayqf5iftUBiqCtx13h1wpIvGuXIKgcQ04z29TG8yRCd/CSr0OMcwSxFnZww/FpqF
	Oso6q5NaU0jUOp6q+3XWQ24McRCvem7jTHmAi7AEpRUjd7BdOOa/tQYpRPeZ5M8kQve4wpxVjIl
	CItm7zxa5jsU8FKIXPaM+c1j/YugxcWhimZA7RNqd1+oxc8rCKIEJjfkunE8J7Wt6BVN/al0GXh
	XnaJwpAzZCNys5/jMj5EKwgS+O+ZSrCUo6BEZC+7Kraa9xisknMH4dfIqYqsyVeyGLN/TM3NyzQ
	==
X-Google-Smtp-Source: AGHT+IEA07LKy1Cp/rLwf3ikCCWUYui0EXv7oHndiV9dtjocI94TisrqKMs2pDJx9Wby9vSHrPz3BA==
X-Received: by 2002:a05:600c:a43:b0:477:63db:283f with SMTP id 5b1f17b1804b1-477732874b9mr25450455e9.37.1762630330563;
        Sat, 08 Nov 2025 11:32:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm150455725e9.11.2025.11.08.11.32.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:32:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] ttf-mplus: update to latest revision
Date: Sat,  8 Nov 2025 20:32:05 +0100
Message-ID: <20251108193208.3465135-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108193208.3465135-1-skandigraun@gmail.com>
References: <20251108193208.3465135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 19:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121402

The original sourceforge project page doesn't exist anymore along
with the original download location. The project switched to github.

From the github history it is not possible to determine when did it
switch license to OFL (sourceforge history was not imported),
it used this license from the initial commit.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ttf-fonts/ttf-mplus_027.bb                | 25 -------------------
 .../ttf-fonts/ttf-mplus_git.bb                | 25 +++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
deleted file mode 100644
index 1ae1d1a2b4..0000000000
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require ttf.inc
-
-SUMMARY = "MPlus font - TTF Edition"
-HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
-LICENSE = "${BPN}"
-LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
-                    file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
-"
-SRC_URI = "http://downloads.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
-S = "${UNPACKDIR}/mplus-TESTFLIGHT-${PV}"
-
-PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "
-
-python split_ttf_mplus_packages() {
-    plugindir = d.expand('${datadir}/fonts/ttf-mplus/')
-    packages = do_split_packages(d, plugindir, r'^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s')
-    d.setVar('FONT_PACKAGES', ' '.join(packages))
-}
-
-do_install() {
-    install -d ${D}${datadir}/fonts/ttf-mplus
-    install -m 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/
-}
-
-SRC_URI[sha256sum] = "a20b9b9b03c2a6fb1e2137d29e8a6ce06406ba1e008906ea3c474dc048dc06a6"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb
new file mode 100644
index 0000000000..c491a44095
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb
@@ -0,0 +1,25 @@
+require ttf.inc
+
+SUMMARY = "MPlus font - TTF Edition"
+HOMEPAGE = "https://mplusfonts.github.io/"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=ee870a4a7cee012360178b2f8bccb725"
+
+SRC_URI = "git://github.com/coz-m/MPLUS_FONTS.git;protocol=https;branch=master"
+SRCREV = "80ac404d0c80442781b6f4c6119a8c9e71770806"
+
+PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "
+
+python split_ttf_mplus_packages() {
+    plugindir = d.expand('${datadir}/fonts/ttf-mplus/')
+    packages = do_split_packages(d, plugindir, r'^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s')
+    d.setVar('FONT_PACKAGES', ' '.join(packages))
+}
+
+do_install() {
+    install -d ${D}${datadir}/fonts/ttf-mplus
+    cd fonts/ttf
+    for f in *.ttf; do
+        install -m 0644 $f ${D}${datadir}/fonts/ttf-mplus/"$(echo "$f" | tr '[]' '_')"
+    done
+}

