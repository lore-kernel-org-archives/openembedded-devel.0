Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51B5C531DF
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:19:32 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.142136.1723789164303856170
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/8LGRdy;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70968db52d0so1784288a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 23:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789163; x=1724393963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBBqZ+a7r24gd0k5peNwnrbKBM+kxmZ2JHfWueO4SZc=;
        b=Y/8LGRdyDGiFOd0AslBrPvug9+ZP7rRFm7f0qh9OHHXIfJMQv/FdoHFmo+BAVZyFwU
         q121YXLHG51y8UopkAfA51PwzDRWIDyq7MJKBYEh/d0J8PR5ZjTPGPqnnEs9THHJJugD
         MH4pf0jloN0jhBdUJeCHWVDTtHVuyOA4LW8UA2CXk2eKK4oUOQXFD6rQcEjRcXd+5aH0
         WV9f7yaS0ZUSWE8ITrN/F0DaAxGkjSnKK5YeLih6ypwAPCclSZm+Nn96/+wOUygcLLBM
         YiBV3SxZmm0BdEgXmfmMQETSRcaWc8cJfLGt9/w0Cu4vcZ8ebQHkytl8n9Q5wJXcx8Gr
         YAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789163; x=1724393963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBBqZ+a7r24gd0k5peNwnrbKBM+kxmZ2JHfWueO4SZc=;
        b=bCPedKY9kdzrrUoUkxC0xV7B2HQNETurP2HSTqzCxA5YtWMQWHhfTSxTQbxg8k5knR
         4H6Dv6dG4o/c7EoemXjJAnrfc7zk95s5mmcSJ88GIsP1aFJfYPEJBiWEdKshgxQ81uaV
         2MJBVeNUjcbOBSOiou9jO8nb7i14bGOVLxweHGPX+97SIrWP9adM5ZVXXg6iiP5XbBxp
         JCG/Moc1bBpA99E3JRxEwuJxqt+t+gayTiD2hTtgm1gNfvD1FQOgnvXUQVf8hZrRcML0
         RDXBkVGOzN7jBKns3N+2Pher4h0WM28qvwRFdfkm/dG30BgOAzEaAw37mXWRyU1SQClD
         zavA==
X-Gm-Message-State: AOJu0YykJB2E1N+w0u87ePQaDqjweiZmCyZFL+5NNQ1zrTL+6v/JyBho
	FksvEjappdsLKivmbV3++X/mEIHf87BUXbqZMlAUa2N9CwvhTgWYcE635g==
X-Google-Smtp-Source: AGHT+IGTJ6/oZ6mn27qvVv5aHR//1k5VBBOHsSMbR8w+LTT5DWkJWCBJf51JgFILxsRK9/eFpTXPPw==
X-Received: by 2002:a05:6359:a396:b0:1aa:c73d:5a98 with SMTP id e5c5f4694b2df-1b393310aaamr234841555d.26.1723789163139;
        Thu, 15 Aug 2024 23:19:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm2022940b3a.176.2024.08.15.23.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:19:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/6] keepalived: Make build reproducible
Date: Thu, 15 Aug 2024 23:19:15 -0700
Message-ID: <20240816061915.2095711-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816061915.2095711-1-raj.khem@gmail.com>
References: <20240816061915.2095711-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111834

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

