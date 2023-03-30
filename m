Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116A0C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 10:17:11 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.21576.1680171423061823383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 03:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c5JTM8bg;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id ew6so74339679edb.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680171421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUwKRtVv0EuMAxm/qjRaFdNfiZ5bkzAzXSV/ELRdD0U=;
        b=c5JTM8bgKJNf8gP+12RI/cZa9B1OBRI2Ppp3XqMTNgVfsnTzJoteHj3qXJXhg7xU5i
         5z5Af1Ak9XfXq3FAD0tilROu+cUKJfY4wtmJCvu9latHj8de0oYBkcOXJKLZlEtBXUK2
         Tnzjn7yJWsK1LdcRdHyerApHlBCWC5EeAWDy8HNuqf4UZiX6JgvoVQxQMd+B16MeqL52
         neNrpTlorMZOrP6CSQUbyYg60Ql+XXnwrE1PEiXh37+jq9QoXtt2css7lrqKXWQJvmOS
         4t8GzIWDSHI3NKTlukILvvg1VahclHQja5CDLYUG0erIdfUzkg16UbyBQpcEp5GB8nyP
         NYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680171421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUwKRtVv0EuMAxm/qjRaFdNfiZ5bkzAzXSV/ELRdD0U=;
        b=tEqqcyYgKoiQPSssT8Q+KLhxezNjlBFy/BEHpqMcX+m+zP4RZKNGL0E4E/nuqaA8SK
         aJxpeNZQMsF6CCvYgQAjSzFRWXUAdu7NVFeNKmSXmPSzDWUK68sDYm9qQfOWI+rJqdbF
         fj0lejDJZehtFBoST5BkL4Wc/eObJqhl99Ls2jgsUXUOXl0BX68bd5VtyuElIgDNgEFK
         9mdy98uRSLSySW08uz27O0wZbBCxOjpruZwQw8EGoYlBaHl2//sF7d551uIVmH6GeHNa
         e+1I6KXXMh7kF0x/KstzLzMEwbpMyy2EKUtORtOHKEy3qPR2wxxo/cGAKj6H09FAzXme
         Fs5g==
X-Gm-Message-State: AAQBX9d5QF0ra2e9GMj8ng+9qWBJoJENbGd6H0J2ApSwKeR1yk3mu9a8
	IufmqjgoAye38vNDVtzdyTL68iIn+UM=
X-Google-Smtp-Source: AKy350aKn/v4KCqPriSa+6EYwUB+cC9fPi+1EZfzEPXnjZmryNhvYQemIDP+DOtvtZlubXRlmw07+A==
X-Received: by 2002:a17:906:5fd9:b0:930:d17b:959b with SMTP id k25-20020a1709065fd900b00930d17b959bmr24744926ejv.22.1680171420925;
        Thu, 30 Mar 2023 03:17:00 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z17-20020a5096d1000000b004aee4e2a56esm18011961eda.0.2023.03.30.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 03:17:00 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] hplip: Fix installation and QA
Date: Thu, 30 Mar 2023 12:16:56 +0200
Message-Id: <20230330101656.2758605-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 10:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101830

With version 3.22.11 it's not enough avoid linking to the
closed source ImageProcessor library, it must not be installed
either. This library is pre-stripped so package QA fails.

Add a new patch to fix installing HPLIP.conf into
/usr/share/ipp-usb/quirks. The upstream Makefile.am fails
to take DESTDIR into account and do_install fails because
of this. Also, instead of detecting the presence of the
target directory which is invalid for a source build,
create it and install the quirk file.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../0001-Fix-installing-ipp-usb-quirk.patch   | 38 +++++++++++++++++++
 ...or-only-when-DISBALE_IMAGEPROCESSOR_.patch | 20 +++++++++-
 .../recipes-extended/hplip/hplip_3.22.10.bb   |  2 +
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch

diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
new file mode 100644
index 000000000..71ed69722
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
@@ -0,0 +1,38 @@
+From 5cfe30829174a18ec64e53c84292a0229ffa5602 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 30 Mar 2023 11:31:27 +0200
+Subject: [PATCH] Fix installing ipp-usb quirk
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use $(DESTDIR) as installation prefix for
+/usr/share/usb-ipp/quirk/HPLIP.conf.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ Makefile.am | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e10364d..f520225 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -703,10 +703,9 @@ if !DISBALE_IMAGEPROCESSOR_BUILD
+ 		ln -sf $(libdir)/libImageProcessor-x86_32.so $(libdir)/libImageProcessor.so ; \
+ 	fi
+ endif #DISABLE_IMAGEPROCESSOR
+-	if [ -d "/usr/share/ipp-usb/quirks/" ]; then \
+-		echo "ipp-usb directory exists"; \
+-		cp prnt/ipp-usb/HPLIP.conf /usr/share/ipp-usb/quirks/ ; \
+-	fi
++	install -d -m0755 $(DESTDIR)/usr/share/ipp-usb/quirks ; \
++	echo "ipp-usb directory exists"; \
++	cp prnt/ipp-usb/HPLIP.conf $(DESTDIR)/usr/share/ipp-usb/quirks/
+ if !HPLIP_CLASS_DRIVER
+ #	   If scanner build, add hpaio entry to sane dll.conf.
+ 	if [ "$(scan_build)" = "yes" ]; then \
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch b/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
index 2cfe1255e..fa973a8d8 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
@@ -7,8 +7,8 @@ Subject: [PATCH 2/4] Add ImageProcessor only when DISBALE_IMAGEPROCESSOR_BUILD
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
+ Makefile.am | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index 5f75759..73421b1 100644
@@ -27,6 +27,22 @@ index 5f75759..73421b1 100644
  #else
  #hpcupsdir = $(cupsfilterdir)
  #hpcups_PROGRAMS = hpcups
+@@ -687,6 +692,7 @@
+ 
+ install-data-hook:
+ if HPLIP_BUILD
++if !DISBALE_IMAGEPROCESSOR_BUILD
+ 	if [ \( "$(UNAME)" = "x86_64" -a  -d "$(libdir)/" \) ]; then \
+ 		cp prnt/hpcups/libImageProcessor-x86_64.so $(libdir)/ ; \
+ 		chmod 775 $(libdir)/libImageProcessor-x86_64.so ; \
+@@ -697,6 +703,7 @@
+ 		chmod 775 $(libdir)/libImageProcessor-x86_32.so ; \
+ 		ln -sf $(libdir)/libImageProcessor-x86_32.so $(libdir)/libImageProcessor.so ; \
+ 	fi
++endif #DISABLE_IMAGEPROCESSOR
+ 	if [ -d "/usr/share/ipp-usb/quirks/" ]; then \
+ 		echo "ipp-usb directory exists"; \
+ 		cp prnt/ipp-usb/HPLIP.conf /usr/share/ipp-usb/quirks/ ; \
 -- 
 2.37.3
 
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index 23cc5197f..ca683483b 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0004-Define-missing-prototype-for-functions.patch \
            file://0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch \
            file://0006-Workaround-patch-for-missing-Python3-transition-of-t.patch \
+           file://0001-Fix-installing-ipp-usb-quirk.patch \
            file://0001-Drop-using-register-storage-classifier.patch"
 SRC_URI[sha256sum] = "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1366624"
 
@@ -80,6 +81,7 @@ FILES:${PN}-dbg += "\
         ${PYTHON_SITEPACKAGES_DIR}/.debug \
         ${libexecdir}/cups/filter/.debug "
 
+FILES:${PN} += "${datadir}/ipp-usb/quirks/HPLIP.conf"
 FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 FILES:${PN}-ppd = "${datadir}/ppd"
 FILES:${PN}-cups = "${datadir}/cups"
-- 
2.39.2


