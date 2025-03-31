Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1BFC3601E
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3830.1743454878733360743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1P5Q6LX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so827674566b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454877; x=1744059677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZYk9beQB1vzYB1t32X0Bl/yGTuAszWa3QNp4HLqAbo=;
        b=D1P5Q6LXzmGTq8TL2WI1U8vIQuuYT4KBJPyGGOHtNGDyRYLLEzLDSPR3LfowzLP4m2
         ep0Fm5WeJ7k07yxfA0XoGSR3bo27trrSUI7yugCZ9AS19YsGMu47B44GB7B2/IH8sKTu
         erKFbCbq8Bg3M6D6BzoMgJIZYwOSI8WPGIUmVbB3RDB4CmmbfJ3j4YzXR8TUjuOtrqX+
         MfIfx/9FxEbbstlP9LmOosmIUoyKlAP56molACwCGsVn3PjBLJ8HldwPw9tcM7IkJYa+
         q3NKd0wZrrma3Wb3rfdm9CbzVbrtDq3IrvC0GYpdWmU46JvtSuy8r9nhGMDe4FR0h2zm
         cr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454877; x=1744059677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZYk9beQB1vzYB1t32X0Bl/yGTuAszWa3QNp4HLqAbo=;
        b=gQhE7aXDXbV9t4wgyoZuhApxTdwopatwn5gCT6dI81KNcb5E3izv1seWkMdJnV3EEk
         nkejZwu5Ve6LWk9eQ/iiqhpXx144WSjT/PqoQ1aAAo8V7nuBByNoOFmePcSXF8K/iVo/
         yhBApmlDwZiYnxNIWCcvvTvqr/eb4TwXrVrM40zJUWCUrsfl+yO2+TmsxH9R3nPOdwF1
         JNF0oeDDQQI4KG6AXLZQ9yEv+cp6bDR8K20OiAetXFQWrYtIhybUrxWhzoc+0woANASG
         TFTZCpGLnjjtrGBsVq7J8gOq9oNWIdHKvnGDhB+Os1J+ggeAR0aqmDRRbmMSa4MPNnwO
         /S4w==
X-Gm-Message-State: AOJu0Yyq+LV7SW7L0HDyhbGKpajAxWPsyKRyYQcS1LUGReL5zEvToa8w
	d77qVIg7K2qDkg0kMXG8oSIvvByg8XTefPLRXS8WtskN6aHudpesXqpzyiS/
X-Gm-Gg: ASbGncvKXmwypAv4INDXioCq9Nj4Fj3dERLQ4qjdmR6n3CR3NMMX/zRMBp8CHFdbT90
	wiurxsOCa0D7YCxfVoT72m8+Rf+vl3odz2B9MVjWHe173PIC2hG6RGQ5T2DMroLxJirltlTb4jx
	LtsXu0wImb7aioa7OWTqyMqnPM+YlJcE/D54pfZezLovxn66v54sqO2KiT4KoQNgl2Ai4bqTLSa
	U9yV4XXNrJ8OSEr1+XvTGd0gq7qhvWailHwOlLF7ajBQo1QwijpQjyYB/EPYofRrK2o830AhkJi
	v+9lTmjUUNjcZkV6WSjEgGCA/qnA0K9YnitUBGizBGcUk04=
X-Google-Smtp-Source: AGHT+IGsixcuAOuWoWwZZb+PiFeFAtT4Agax5xl+APDnvkTdB8BtygpYcbib/8eO1dq0lnS9T4TxJw==
X-Received: by 2002:a17:907:3da9:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-ac7389e4a75mr908353766b.14.1743454876850;
        Mon, 31 Mar 2025 14:01:16 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7196dd435sm664731266b.161.2025.03.31.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:16 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 05/21] keepalived: Make build reproducible
Date: Mon, 31 Mar 2025 23:00:45 +0200
Message-ID: <20250331210101.3460858-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116441

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...not-emit-compiler-flags-into-object-.patch | 29 +++++++++++++++++++
 .../keepalived/keepalived_2.2.8.bb            |  5 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
new file mode 100644
index 0000000000..1f9f8b30b1
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
@@ -0,0 +1,29 @@
+From 5b1b04356f3efc08ae279cafc6ee86df11f10c9a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Aug 2024 23:13:02 -0700
+Subject: [PATCH] configure.ac: Do not emit compiler flags into object files
+
+They contain options which have absolute paths in them e.g. --sysroot
+therefore do not record them and make build reproducible
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fae16f1..677b94a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -904,8 +904,7 @@ if test "$enable_hardening" != no; then
+ 	  "-Wp,-D_FORTIFY_SOURCE=2" \
+ 	  "-fexceptions" \
+ 	  "-fstack-protector-strong" \
+-	  "--param=ssp-buffer-size=4" \
+-	  "-grecord-gcc-switches"
++	  "--param=ssp-buffer-size=4"
+   do
+     AC_MSG_CHECKING([for $FLAG support])
+     CFLAGS="$CFLAGS $FLAG"
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
index 85f4a6aa59..c4d59d3caa 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
@@ -11,6 +11,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
+           file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
            "
 SRC_URI[sha256sum] = "85882eb62974f395d4c631be990a41a839594a7e62fbfebcb5649a937a7a1bb6"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
@@ -30,6 +31,10 @@ EXTRA_OEMAKE = "initdir=${sysconfdir}/init.d"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${B}/lib/config.h
+}
+
 do_install:append() {
     if [ -f ${D}${sysconfdir}/init.d/${BPN} ]; then
         chmod 0755 ${D}${sysconfdir}/init.d/${BPN}

