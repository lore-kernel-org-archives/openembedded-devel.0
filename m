Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C512C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 13:29:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.12730.1708522160467804794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 05:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=O66LvZX1;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4125df3c40aso35147915e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708522159; x=1709126959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4kBaLtp4N/A0HsHCU/odkmpUCQb7yervyq8n5MTX98=;
        b=O66LvZX1iu+cygbhdtb5lRg0Ft3eTXNd8rHQu5pSNMI6Ws+pOuSkWEFebnyGaj4sOd
         62ZXl0t1p8RKfRanKqfgCRmSDBOkrFtpTAOtbop0o0X8IsBJTKYH1OjixEmu3OTOG5Pv
         LcdLAKs4ZvM8QGdfDcZeR+Bmb759+27dpiHycIlSRLk7m8wqDzABdozyZCCbDx02w989
         tbe2CarQc+LkYIrj6FMGowakyBg8lPIvBHNneYPNStlocFPxx1eCOHdTyzqqQeNUoNAo
         zWnAJYbV2euGCCSQXN7F6OJd4nqx03+BWnWdhw0yMR4v4PvleN5diAaTQivPD/cvZbiJ
         QzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522159; x=1709126959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4kBaLtp4N/A0HsHCU/odkmpUCQb7yervyq8n5MTX98=;
        b=cMHXXFvaaQCdd9TB0wIxJrVWvmMnj+UFEdsbIg29+sH4ASP563fQq7ckOv0JsGu8kZ
         474wQ9hPBNcj0tT9T4X1CW56+hg7yfpWoAO0jnbwhN4OpXswQAjWhLFswyQUqJlo4rDH
         XIeWlIdCxRCAyGWv3bNKRfiiR/TfAl9CUnRXgeJ7+2k79R8hvrlpLZQFK9kT+Q9KDV+j
         NgrpBhDOYgfv0NvVBKkQHc2GvhCrJM7ynIRbyTjpj46OV8rNNT9MT7TgEQuqcfC6MUdw
         uoH+e9l3s3atuEm6qDnndoOUjs6h1qKXyiUz84hClcIE4wth4Zyy501T+vOcpj8h2HWR
         dYUg==
X-Gm-Message-State: AOJu0Ywa0YEFSdX0ef4qrCjeEOtecaeml5J9ofdpYw8ZwLwopEOY30+c
	MXXwWNdIOnOIemOj6dKMuf6MzTrnhXIplEtKHVwZSkQr49EdZ8TrpAxLUa7+aD4CNxudXJB2T7Y
	b
X-Google-Smtp-Source: AGHT+IFpBwLEuX4yrBgWkgPBjvvir5h5fqFB0mB9HCq8hJQga6FJmjRqMrR4dimllokDpHb2BX++vg==
X-Received: by 2002:a05:600c:4f13:b0:412:7673:ac11 with SMTP id l19-20020a05600c4f1300b004127673ac11mr1049167wmq.27.1708522158833;
        Wed, 21 Feb 2024 05:29:18 -0800 (PST)
Received: from P-NTS-Evian.. ([2a04:cec0:102f:f3c5:3be6:9d2b:1a77:e396])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b00411ff030f06sm18703450wmg.9.2024.02.21.05.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:29:18 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Romain Naour <romain.naour@smile.fr>
Subject: [PATCH] wavemon: add recipe for version 0.9.5
Date: Wed, 21 Feb 2024 14:29:14 +0100
Message-ID: <20240221132914.26748-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 13:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108963

wavemon is an ncurses-based monitoring application for wireless network
devices on Linux.

We have to provide the path to libnl3 headers since the build system is
not able to find them.

In order to workaround a link issue with pthread library, we have to
add -pthread to CFLAGS in order to add the library after the object
file.

  arm-none-linux-gnueabihf/bin/ld: info_scr.o: undefined reference to symbol 'pthread_mutex_trylock@@GLIBC_2.4'
  [...]/wavemon/0.9.5-r0/recipe-sysroot/lib/libpthread.so.0: error adding symbols: DSO missing from command line

  "We should mention the library on the command line after the object files being compiled" [1]

[1] https://stackoverflow.com/questions/19901934/libpthread-so-0-error-adding-symbols-dso-missing-from-command-line

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../recipes-support/wavemon/wavemon_0.9.5.bb  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb

diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb b/meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb
new file mode 100644
index 000000000..9da43cf9f
--- /dev/null
+++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb
@@ -0,0 +1,28 @@
+SUMMARY = "wavemon is a wireless device monitoring application"
+HOMEPAGE = "https://github.com/uoaerg/wavemon"
+DESCRIPTION = "wavemon is a wireless device monitoring application that \
+	allows you to watch signal and noise levels, packet \
+	statistics, device configuration and network parameters of \
+	your wireless network hardware."
+
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+PACKAGECONFIG ??= "cap"
+PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
+
+DEPENDS = "libnl ncurses"
+
+SRC_URI = "git://github.com/uoaerg/wavemon;branch=master;protocol=https"
+SRCREV = "a7c2f190e010db508ead31fa952478e2a1c13d64"
+
+# Needs some help to find libnl3 headers.
+# Reorder -pthread flag on the command line.
+EXTRA_OEMAKE = "\
+    CC='${CC}' CFLAGS='${CFLAGS} -pthread -I${STAGING_INCDIR}/libnl3' \
+"
+
+S = "${WORKDIR}/git"
+
+# wavemon does not support using out-of-tree builds
+inherit autotools-brokensep pkgconfig
-- 
2.43.0


