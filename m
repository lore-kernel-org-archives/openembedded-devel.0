Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9ABF8D770
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:18:16 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23472.1776367090671295097
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=ZGUmw8sx;
 spf=pass (domain: baylibre.com, ip: 74.125.82.45, mailfrom: hfranco@baylibre.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1279eced0b9so12358242c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776367090; x=1776971890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IF5e5lurc45DRbodDAj1WKSyhqlmjjW8lS3K8E2rByI=;
        b=ZGUmw8sxGFrcA5AQOXrP6/3XKX6j86fzxziblmE88AdKIkSVxCuFbDRdEZUiwc4+ll
         GdG6zzvF0S10n+9PYx7jHdEmPZOwmto180EHSqK00OZ5mCjc6P81SFOTI7Ul9YQiEBld
         TX7t3WSEIAMkFKAu5iX6DIMevRjPSY9y+HpMThoxAnHggKBVdhcoMs1d9QXOfluZRbWK
         zz37D2APmYVHWRyso749NBBptvPNGDpje1mLSxP19T0eAh94Q7sOvSzlXI35AQOeH3eu
         nr4rXkjz7l3eSbUan3adfG2KhPy6M3EbD3K37wA+byxexFMqPnVEJDeE0klCBhfrrVbs
         bEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367090; x=1776971890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF5e5lurc45DRbodDAj1WKSyhqlmjjW8lS3K8E2rByI=;
        b=VTxIa533aSLBlnmOQm9zXDA3NC5Fq+7tpDnB9SIJTmdP2CdagB6cCjsSMvVIOLhCnj
         qfZ1Vmcv7kmSGQA1kkfLxpXf6jjYaFx/UVd4XOzqtChHjOCgD8n/LfJ15rJmC6K3iHho
         ofi9y7Z3/1IuFJdF3ylrA6ouaNHqd//CLmPEFBW+0vzz6UcZNrEvtdRxIyTJD7YG8rne
         sZGibwzSWyBY3Mw71yFzwcORugdwOxoZJDCnF1ThwhJAvsMlMmapkn6YIJ0HyJQyQ7/d
         pO6OVX/fi6R/OoFXzuqTkdYhyle+mb34gSL1sKVji0v/jkveQkOJg++cr70CQB/QXGjY
         r5wA==
X-Gm-Message-State: AOJu0YwVXFUUejkNG3B4qyYBGBJoPwfHpKDgYVK8sxqxy4hLPueN8CvM
	qx6hpZXwirGHl8mWd8D+NQOPx2Y9S41sQGmU/goKYs92hpK2pqI5HwqVfrIdrqTKMfo/g1u/POY
	MBX3D9fU=
X-Gm-Gg: AeBDievgkc9Lgfivh2v7WPuLlskl5TK/ofmLfHnVMPYyGU9scNEuEJFsBYeUPDmEhOh
	ncsjBKhUyRMzmEHs5xTxFFbcMstJcOEIbvYSblJOWs/dS9UOiWKtv5U0PpLVD7ELInzNKLVTruZ
	Dh4foc5WH9Jd06517J+ozOJJWkcOPqLLAfER61XkdvlGvCusLgl0rOaqTbDiH69j5TYrLr4aAWI
	NiNKbrfH5Q7oBEEnReKag/Tb/qAPIgU1R8a9USEc3opTrbCAsA/Olh469tRuVUjOF8vnakIRp9y
	vZ4yX/WMVkJ945el3vDnZk1YdZU9O+/31IfXBfcIhqMvNd4LN8Ow018knUDZHTFvx2FndLjG85H
	iTfPJmErE3x/LA1ALAFfktqAwvZwBmYfJGeTBPJ38GoWb5GcDbyN3eTOj7ueXEWIcB53aEmGUKn
	Kfx9Pau6ge0cxFvM38FIA/2M9ioooS7zFjpAarv2WBWZJlC0yO9KIXtRw9rzsbVsmRguti
X-Received: by 2002:a05:7022:995:b0:128:d5f1:d595 with SMTP id a92af1059eb24-12c727ef249mr240124c88.10.1776367089396;
        Thu, 16 Apr 2026 12:18:09 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm7076412c88.1.2026.04.16.12.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:18:08 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [meta-oe][PATCH] uutils-coreutils: make selinux PACKAGECONFIG dependend on clang-layer
Date: Thu, 16 Apr 2026 16:17:54 -0300
Message-ID: <20260416191754.3910026-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126407

SELinux layer build fails if 'meta-clang' is not present, which
shouldn't happen, since 'meta-clang' isn't a dependency.

If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
'clang-native' even if uutils-coreutils is not being used (this is
enough to make the recipe fails on parsing time if meta-clang is not
present).

Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
warning if the user wants selinux support o uutils-coreutils but haven't
add clang-layer.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
index 8b9b4dc199..99beb70104 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
@@ -18,7 +18,17 @@ require ${BPN}-crates.inc
 PROVIDES = "coreutils"
 RPROVIDES:${PN} = "coreutils"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+# This is required since uutils-coreutils uses selinux features that require clang-layer
+python __anonymous() {
+    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
+        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
+            d.appendVar('PACKAGECONFIG', ' selinux')
+        else:
+            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
+                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
+                "if selinux support on uutils-coreutils is required.")
+}
 PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
 PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
 
-- 
2.51.0


