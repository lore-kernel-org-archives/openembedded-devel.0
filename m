Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA0CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:28:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.16370.1760448510743758900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FmQWxmSK;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e29d65728so32044575e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760448509; x=1761053309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNnUYh1xRG3d4o1okE2uTI6ZUnbx423wdX+uZsQtFY8=;
        b=FmQWxmSKMTg0UWGSSeryuXuPpkT8aablpG0Kj1fPmatFovFPz3Gm+1RU3fUwQS05dm
         0RKrEbmu/R0XjspCh+70KIpxjfZhflev0ig7WI8FYVkgd5tweLK8WZQuwiu8GUkMEG5L
         Yn4EalpRJrEYEKyTx4ra7V9DPAyiDKMQA9LZDWyC6TN4MMlHSuegaoBkXJ2wFtJBkIbJ
         mQ75SfIzE2cmlpupCyN4nKaII5SWyFWLgqixvu/tH3gLihx0CWfU3TFQ7Idi57HWnZIx
         Yq95AlZiod0RIXPuk4+W8fEG3I4RlqfBM4Ib1p+iLTQ189bspAdmYR/rgGBSRbZe3phU
         yBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448509; x=1761053309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNnUYh1xRG3d4o1okE2uTI6ZUnbx423wdX+uZsQtFY8=;
        b=cKWqziFCzmHF2sPy7MdJxa1HVCGeVuFw3u35oq8IVO2bPBj03ppq/PBhOvV2A3wYri
         uSD1PfUGhqRpWfbVe8qnS1W+sKx9C8mwLh6CTX7CUHNG3UWrdk2cILvHznprsZz3LfT1
         TkPZKm4stISdPbSjestOwW9/40d+m2Wzy8TxnDYD2cVDWK3eAiz1ENsFDx4zfeP6Ak4X
         rqdKRcFTFA6S+fititsxan3Qd6us08Zg32GcBo6rmYuvI75PSXog2BzFFl5pfg3IZHEn
         3fjsOsNyuoCHPkoPeN+WAoxPWRIP/GPC0oR4MkdJUj5C5kcXzTWf0C2N+0RnvwdKbecd
         Vnkg==
X-Gm-Message-State: AOJu0YyoABdHn1tJ9hILdi0KkCyZAkH3cuxveehq8flXwaoveE+jcmA+
	xfa5rMCE3YEX9XWMp0uJ/Atmi415HCKiojFIRnX4foBR4kGMsv346U5O5fw+vw==
X-Gm-Gg: ASbGncspkt0NFicuMNPb836xU6VPGjxws3C5hGD/bSHVKGTh7/BhdkCZ/Nx8ptkUyTu
	mQ1t/o/J3jrKviWl69FlOttZ4S17Jgitgl3b3dQHKuufsHd81I6EEwqaQOBvojDRDkpdV12WcdC
	YcZZ+qFEuGcXzV7hd4v5ik/PA0KQ8ozpSg8DaZNAe/gW4eYxiJmeGCuKFGlawWJcEDhWPrSy4GG
	OZ2zSA9bjKnfiuq/wFnziejPeMq1DyftE4ATETIfoZhthM6jAufqSzGMXGtW1iP4MODbZzqckqK
	AqAtLPNDUCASQTAJjTl9kPLs+A7ozwA+BEo3IyH8zHiOgMHSj/l2SKalfRq1gyZe8F+fdboescA
	vYNcIXp9DHzGaBwG8YxqreJhoL/tHgvYy5YmDiLiqn82IfpG7+A==
X-Google-Smtp-Source: AGHT+IFnjLVltew5HO3np2iOiccP1skq/BxnrgXclhWYTm208Vg10TyWpHWS3004fPkeUmvLLYGr6w==
X-Received: by 2002:a05:600c:c096:b0:46e:2cfe:971c with SMTP id 5b1f17b1804b1-46fa9b937e1mr118916035e9.0.1760448508808;
        Tue, 14 Oct 2025 06:28:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm247833025e9.1.2025.10.14.06.28.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:28:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] webmin: patch CVE-2022-0824
Date: Tue, 14 Oct 2025 15:28:24 +0200
Message-ID: <20251014132825.1052635-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014132825.1052635-1-skandigraun@gmail.com>
References: <20251014132825.1052635-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120607

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-0824

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0001-Foreign-module-may-need-a-check.patch | 27 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need-a-check.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need-a-check.patch b/meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need-a-check.patch
new file mode 100644
index 0000000000..8698030e82
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need-a-check.patch
@@ -0,0 +1,27 @@
+From 2659c2990427c587a49014abb5275aec0ea44c0a Mon Sep 17 00:00:00 2001
+From: Ilia Rostovtsev <ilia@rostovtsev.io>
+Date: Sun, 20 Feb 2022 12:48:27 +0300
+Subject: [PATCH] Foreign module may need a check
+
+CVE: CVE-2022-0824
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/39ea464f0c40b325decd6a5bfb7833fa4a142e38]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ web-lib-funcs.pl | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/web-lib-funcs.pl b/web-lib-funcs.pl
+index bbe154a9..4bb2b0d6 100755
+--- a/web-lib-funcs.pl
++++ b/web-lib-funcs.pl
+@@ -4669,7 +4669,8 @@ if ($module_name) {
+ 	}
+ 
+ if ($module_name && !$main::no_acl_check &&
+-    !defined($ENV{'FOREIGN_MODULE_NAME'}) &&
++    (!defined($ENV{'FOREIGN_MODULE_NAME'}) ||
++      defined($ENV{'FOREIGN_MODULE_SEC_CHECK'})) &&
+     $main::webmin_script_type eq 'web') {
+ 	# Check if the HTTP user can access this module
+ 	if (!&foreign_available($module_name)) {
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index cc31ff35a7..d553c7530c 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://0001-Escape-potentially-malicious-HTTP-headers.patch \
            file://0001-HTML-escape-command-description.patch \
            file://0001-Object-names-cannot-contact-special-characters.patch \
+           file://0001-Foreign-module-may-need-a-check.patch \
            "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"

