Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35356F46C74
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 19:06:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62481.1775502387619534646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 12:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JLLRw5Oc;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so20283915e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502386; x=1776107186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mlfU2MOJ6wyISv3jA79L91ijs2CGYRcidq2crAlZcw=;
        b=JLLRw5OcLPCIrfQwguehsIkf/ZVlSoTy22iz5Xp13NHbdhv62oKvFYKpimICNGKMLs
         185G6jDcYCMufhbbzqKz0IS44JQOhe4OF1rIES5aEmcAnuwTG0OuqzdS7oUDexm9R0Bg
         kMnBIEMTDsPvDg0d78hMl+o89m89rH0GcWRT4p7YU9vRfFhqFLaVUpxkuqxUF8u68KQx
         0e0e3jamz92cyA/v5NMvROjHvqN28HyLy6QOljJ22Xj9+lUuTEFiUdjjgXYVXmRhOrfm
         l7HObFrgiVy871jh0a5o21MC1PbNTzL0uk9xUHQzq2aE1kEC48TQ6WMTJu21zs0QDEMa
         4ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502386; x=1776107186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mlfU2MOJ6wyISv3jA79L91ijs2CGYRcidq2crAlZcw=;
        b=klws4S0fWLZ0y7+WU46qOTuBRu7TMZYIsjP3iyZAxHv5aq3oO6/CMjpS1GWUaPDV99
         sGJVqCzLnduK+7jShC59AvdeFBQ7aIMjBDlFv4tkNDW5TTBP7Nvw9evWMurHD122gAaf
         46htjxynlm0oyUnSQ/D4cik88lt04c+XhxNhd70vqaPieDY4KG3jgvNEC0ULHPpsoqH0
         wDU52/k3XWuj1k6R1ARJm5lxdrdEtU6vUxoXnFmaLxmt0XMDdBh2BYoT+Eb5ZUsOMZ/P
         i4aguKNb35/10w89lNRODc9coo5RoBHto9VJKq8iqmomusPx611d33fzD3yEAe2zHBK4
         OCew==
X-Gm-Message-State: AOJu0YxiT5qJ4ZYE4nIeKA2WrBzFg4P+ZIkSPSZEq0yL4VSR482Jelec
	kbLKXQi593paGmRjnqdDQuKUrlztDFIBLndpTO2FJsjJUyzcNOF/+BvtbS7zQw==
X-Gm-Gg: AeBDietvG+HL0XyIoY6p16Kslv9HiLTmSYUt/Kp7VKx0hkmfo4MoerckPjSBLso2438
	x5GzJLfn1oOdv3uJJT3PE/04LO9C8hLxYT8DlpOrDKhdrPzZtBOUljGvWsl88CuQmEhVdl71UmP
	cJaxfnJj8Zg5Rtqgw3LUX+T6F/v6+3Vzkkvqh84BvNNDYXhU2klixATMf2kXiSd+fXovszGNhM4
	kzufSDoHjKr8miTjBFOtJRL65UfJq5BiBa/E6Q61sNRF+2C7t43PqbJfHKagTZOs0CRwf7ej4bO
	WlLGxCRztwyHDVAGmBWSmyQXyv4nbqfnuRrhereXyjwz3IOnc7Un3fs8x6O+W6mMr1KPd7SUUz4
	uxG4AQD6qj4drLanu+bCZfBs9LjKsl7X1Du+3GqoKEZCKqJaClx8g6y5yigVtrJbbQLzMSHJseS
	PKrb6hT9YcrcwuZbKB6CRT
X-Received: by 2002:a05:600c:5292:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488996b021fmr219340585e9.3.1775502385593;
        Mon, 06 Apr 2026 12:06:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm115187395e9.14.2026.04.06.12.06.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:06:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 1/2] dovecot: patch CVE-2025-59031
Date: Mon,  6 Apr 2026 21:06:23 +0200
Message-ID: <20260406190624.3889147-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126062

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-59031

Backport the patch that was identified[1] by Debian.

[1]: https://security-tracker.debian.org/tracker/CVE-2025-59031

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dovecot/dovecot/CVE-2025-59031.patch      | 142 ++++++++++++++++++
 .../dovecot/dovecot_2.4.1-4.bb                |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch
new file mode 100644
index 0000000000..6f13502422
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch
@@ -0,0 +1,142 @@
+From aac45a278d95afeec8c702b5b4966ea0a96e5ad6 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Thu, 8 Jan 2026 08:51:59 +0200
+Subject: [PATCH] fts: Remove decode2text.sh
+
+The script is flawed and not fit for production use, should
+recommend writing your own script, or using Apache Tika.
+
+CVE: CVE-2025-59031
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/36a95e7fa6b913db6c03a15862628b06be66eb3e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/plugins/fts/Makefile.am    |   3 -
+ src/plugins/fts/decode2text.sh | 105 ---------------------------------
+ 2 files changed, 108 deletions(-)
+ delete mode 100755 src/plugins/fts/decode2text.sh
+
+diff --git a/src/plugins/fts/Makefile.am b/src/plugins/fts/Makefile.am
+index ae57d8f..4485cf4 100644
+--- a/src/plugins/fts/Makefile.am
++++ b/src/plugins/fts/Makefile.am
+@@ -65,9 +65,6 @@ xml2text_CPPFLAGS = $(AM_CPPFLAGS) $(BINARY_CFLAGS)
+ xml2text_LDADD = $(LIBDOVECOT) $(BINARY_LDFLAGS)
+ xml2text_DEPENDENCIES = $(module_LTLIBRARIES) $(LIBDOVECOT_DEPS)
+ 
+-pkglibexec_SCRIPTS = decode2text.sh
+-EXTRA_DIST = $(pkglibexec_SCRIPTS)
+-
+ doveadm_module_LTLIBRARIES = \
+ 	lib20_doveadm_fts_plugin.la
+ 
+diff --git a/src/plugins/fts/decode2text.sh b/src/plugins/fts/decode2text.sh
+deleted file mode 100755
+index 151fb7c..0000000
+--- a/src/plugins/fts/decode2text.sh
++++ /dev/null
+@@ -1,105 +0,0 @@
+-#!/bin/sh
+-
+-# Example attachment decoder script. The attachment comes from stdin, and
+-# the script is expected to output UTF-8 data to stdout. (If the output isn't
+-# UTF-8, everything except valid UTF-8 sequences are dropped from it.)
+-
+-# The attachment decoding is enabled by setting:
+-#
+-# plugin {
+-#   fts_decoder = decode2text
+-# }
+-# service decode2text {
+-#   executable = script /usr/local/libexec/dovecot/decode2text.sh
+-#   user = dovecot
+-#   unix_listener decode2text {
+-#     mode = 0666
+-#   }
+-# }
+-
+-libexec_dir=`dirname $0`
+-content_type=$1
+-
+-# The second parameter is the format's filename extension, which is used when
+-# found from a filename of application/octet-stream. You can also add more
+-# extensions by giving more parameters.
+-formats='application/pdf pdf
+-application/x-pdf pdf
+-application/msword doc
+-application/mspowerpoint ppt
+-application/vnd.ms-powerpoint ppt
+-application/ms-excel xls
+-application/x-msexcel xls
+-application/vnd.ms-excel xls
+-application/vnd.openxmlformats-officedocument.wordprocessingml.document docx
+-application/vnd.openxmlformats-officedocument.spreadsheetml.sheet xlsx
+-application/vnd.openxmlformats-officedocument.presentationml.presentation pptx
+-application/vnd.oasis.opendocument.text odt
+-application/vnd.oasis.opendocument.spreadsheet ods
+-application/vnd.oasis.opendocument.presentation odp
+-'
+-
+-if [ "$content_type" = "" ]; then
+-  echo "$formats"
+-  exit 0
+-fi
+-
+-fmt=`echo "$formats" | grep -w "^$content_type" | cut -d ' ' -f 2`
+-if [ "$fmt" = "" ]; then
+-  echo "Content-Type: $content_type not supported" >&2
+-  exit 1
+-fi
+-
+-# most decoders can't handle stdin directly, so write the attachment
+-# to a temp file
+-path=`mktemp`
+-trap "rm -f $path" 0 1 2 3 14 15
+-cat > $path
+-
+-xmlunzip() {
+-  name=$1
+-
+-  tempdir=`mktemp -d`
+-  if [ "$tempdir" = "" ]; then
+-    exit 1
+-  fi
+-  trap "rm -rf $path $tempdir" 0 1 2 3 14 15
+-  cd $tempdir || exit 1
+-  unzip -q "$path" 2>/dev/null || exit 0
+-  find . -name "$name" -print0 | xargs -0 cat |
+-    $libexec_dir/xml2text
+-}
+-
+-wait_timeout() {
+-  childpid=$!
+-  trap "kill -9 $childpid; rm -f $path" 1 2 3 14 15
+-  wait $childpid
+-}
+-
+-LANG=en_US.UTF-8
+-export LANG
+-if [ $fmt = "pdf" ]; then
+-  /usr/bin/pdftotext $path - 2>/dev/null&
+-  wait_timeout 2>/dev/null
+-elif [ $fmt = "doc" ]; then
+-  (/usr/bin/catdoc $path; true) 2>/dev/null&
+-  wait_timeout 2>/dev/null
+-elif [ $fmt = "ppt" ]; then
+-  (/usr/bin/catppt $path; true) 2>/dev/null&
+-  wait_timeout 2>/dev/null
+-elif [ $fmt = "xls" ]; then
+-  (/usr/bin/xls2csv $path; true) 2>/dev/null&
+-  wait_timeout 2>/dev/null
+-elif [ $fmt = "odt" -o $fmt = "ods" -o $fmt = "odp" ]; then
+-  xmlunzip "content.xml"
+-elif [ $fmt = "docx" ]; then
+-  xmlunzip "document.xml"
+-elif [ $fmt = "xlsx" ]; then
+-  xmlunzip "sharedStrings.xml"
+-elif [ $fmt = "pptx" ]; then
+-  xmlunzip "slide*.xml"
+-else
+-  echo "Buggy decoder script: $fmt not handled" >&2
+-  exit 1
+-fi
+-exit 0
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
index 09583f1694..769e693c5a 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://CVE-2025-30189-5.patch \
            file://CVE-2025-30189-6.patch \
            file://CVE-2025-30189-7.patch \
+           file://CVE-2025-59031.patch \
            "
 SRC_URI[sha256sum] = "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
 

