Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F78CED240
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 05:50:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6155.1763445050061760646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 21:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GEOGlpHZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29853ec5b8cso59374575ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445049; x=1764049849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QD9pYhcVBaicaotiaH9nq5rbCaXfrUbkYRdUGQXnlY=;
        b=GEOGlpHZ47UowkqpxvnrSRmftNK/webUy9PkT2lCR1usWXhvb/cavEfmDC/P5MuRht
         ioeuaDDv1CZf/tOMc5h9kRj2HmNa/2fMUDkM5Gv3EgboVkjOVhiKtmLaZy1TEYPS5O0h
         idjZIE3qsAHhO9w7HieFEnU9sG7fWHnP86NFLWoTXFasd660qEpObrP1v8Smao3z1rO/
         auqwH5rIGhuFFGyegRfeyeF0CB2cYyKetTxo4EWvDi4jbA3O16voU4lCQhXxHC7oZEv3
         ZW0tO0pOFfUy/hI+S9UIUZBhNJ9D76dkjS4RsWf/ASGmspNUetVjq3dq6ZJvbHegtVGd
         7ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445049; x=1764049849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2QD9pYhcVBaicaotiaH9nq5rbCaXfrUbkYRdUGQXnlY=;
        b=Wps5neF6MVfInoR6R8cSxPBp+EBhELv8RRHDZrVd3iQBzjM5xNk+/79ucFo9hAHp0W
         Sw3eLQEtGQH/s4y1J/UKakINLkD0y2X+WoaEU3yFAN1Al1dzKwtuEuXH0JhO+YRg5DqN
         kS2tLc8etWt+Dv3OdzdKo/5NOL+sst76/GdZ6g7WnKt0X3Co7lIIUGDBAcDNHVBmBEaa
         YCQkzWdWMaejIfUTIv7CBzRupNWuSWLO9qFZi83vMhmPiJd9k92avjat+mllGmeymj6y
         P/l7hHh2v/xQYLbLT1+pUbHgR+w7VYYwfS0tE6HSvnf5WZ1QFcNzALLNfpO8tM64nx8e
         Hxfg==
X-Gm-Message-State: AOJu0Yyu40L5u+M6pAjNtwbYOoiYa5b29DFTxVFX0GrKAMyJZdS6WlrJ
	VUSEDdDf6Bms6M8ugsp5qsvs/P2vZv1E7WwGUUDz6FhEOLXRItAUUBkmWkOW2A==
X-Gm-Gg: ASbGncvJkODkdE/Sikdoii7B11evaFmO2Dhcp7/Ip37lunyWmOP3dTijxwGF/Yh6OEl
	8qdeySQvqqsoH6l5RG+0Kltwp5/J6hmYT0cd8fyMwR8CGkN0gEg5asrkcAPZlrSlWpHW+FfXXhB
	an1+lzkdLtl4swYCrc91yvhORJDoCBKSoj4ZaAb6KuQtB+XZuY9uM2PwOQm9PuunYzaiDQbYpM8
	mDxGuDWA/A7VMHr6Ep7MWij8vRma0RMOy3z1MHrKxsnJ0MWNCKeo8XRBukyCAElybvf4vPwTZFL
	mWz733ASfjZ5SpaboJWc3bFLOpxfZJc1+/oBD+VsKAggcHOsD+i0LMannB5VJ8SHdldcLvNtHd0
	/CPExtdYf+aSRe4bs9K9g9lymN2TIk2gzCCt/W6Ws7JX8bFIKsP3idiHPBEHfEESCf+I6qIYQX8
	PoFZvBXENn71Tmg4F555zfseWj
X-Google-Smtp-Source: AGHT+IEQsS3eObhcaNp3i7Jy413Fj6xyZe5JLST1PT4Gu0QRgsAbXD4eneqHxnLu5LS+COcHVWbWdw==
X-Received: by 2002:a17:903:2c0d:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-2986a6bc3c9mr155702005ad.4.1763445049271;
        Mon, 17 Nov 2025 21:50:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm126822955ad.79.2025.11.17.21.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 21:50:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 5/6] webmin: patch CVE-2022-0824
Date: Tue, 18 Nov 2025 18:50:26 +1300
Message-ID: <20251118055027.1334922-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
References: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 05:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121808

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-0824

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit b4c4f0c52537afd097c967850267e4e29e4a620f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

