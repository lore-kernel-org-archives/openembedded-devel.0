Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA27C41513
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 18:01:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.41067.1715536907544179281
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 11:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fb7vP2EN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e3c3aa8938so24429945ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715536907; x=1716141707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s74Yn/lw8i1QJWdfs3ecsh409Huyo+V68fTjLJG9Ng4=;
        b=fb7vP2ENJYLJwr4rwrQHHPDwbNrkufjcUBRq5FjQX7pMF+goWaDIhzmFzQeFzes5bX
         pvFWnTEGUhIqudKQmHn7R0xyU/aNiAw+Vp0Ry0z7vtDp48YSiIiIobioXSBIg2qFaMnH
         j4mzwvO+obO7miNpT46qeqE39PXj4bj5viTs5OTwj/ajnFzotVn29WGusdi6wIhUvfDx
         1onYkEzZRO88gulnWnaVvlUm1PXygUiv8MBFBVDwb1TBRz7bs7ZYO6D80TrWmQTOB4YY
         bTGCs1bRre6MCyTVXc4FLW+HUziqxFGs1iI8Am+/+VeNDLKdNX5bmFoBSAc7H3T3Gd22
         J2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715536907; x=1716141707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s74Yn/lw8i1QJWdfs3ecsh409Huyo+V68fTjLJG9Ng4=;
        b=SZu4fKfrWXcxVTfOClsdf45W8Ftln0oV5uqcC4P02QUXo7k4PyVWOcFHIn3+jBdmuw
         4IB3hagQv3TvPG+uJ8inQ+p5/ld/BTRaxp+fGTFHpu0TkPzIgZuPlxnmFZxYLEt+vsrb
         e7AxIg3TegjfzzxrFi4aS5ksZA+/RH0bfuq3U57r8D2Fon3zml4zkobMiibtt4hbZFUR
         dx/am6xVXT9gjME26BN65RWtgjnT/F967PEI0rAwbhQSJ5anU6s+QakgywGIqaW4ttpl
         F91CE1eSFhivjMSDmB9qLwsqr9+/O6LR/R+Iv7fwhEFMEYna47tIKhkgTGkDk91rEtso
         NPsw==
X-Gm-Message-State: AOJu0YzxHnMTIYVQgiE0wAtPa3gHApNXQDHwIlFMK7AhmThChWJaepZE
	XBXv+fSxKUmmCHZC5b2yiiPTbjct0bGAhQD9wBMFfqcSykMyvL/WABhktDtgQVg=
X-Google-Smtp-Source: AGHT+IFun1k4TgqQ7qA2sA76CO3SAbImlizAaTfXrHXdNbNBgS57sNKe/+1tJoxaJ0jcc9yJcEPBHA==
X-Received: by 2002:a17:902:ab82:b0:1eb:2988:549d with SMTP id d9443c01a7336-1ef43e26f89mr79873195ad.40.1715536906463;
        Sun, 12 May 2024 11:01:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c037515sm64333105ad.204.2024.05.12.11.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 11:01:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rsyslog: Upgrade to 8.2404.0
Date: Sun, 12 May 2024 11:01:41 -0700
Message-ID: <20240512180141.88729-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512180141.88729-1-raj.khem@gmail.com>
References: <20240512180141.88729-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 18:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110326

Add a patch to fix build with gcc14+musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Pass-correct-parameter-type-to-send.patch | 35 +++++++++++++++++++
 ...syslog_8.2402.0.bb => rsyslog_8.2404.0.bb} |  4 +--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2402.0.bb => rsyslog_8.2404.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
new file mode 100644
index 0000000000..5df29e7d90
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
@@ -0,0 +1,35 @@
+From 1e0a77d8a5ae7cd0223afadf46cdbb540119774d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 May 2024 23:31:46 -0700
+Subject: [PATCH] tests/tcpflood.c: Pass correct parameter type to sendto()
+
+Fixes build with GCC-14 and musl
+
+../../rsyslog-8.2404.0/tests/tcpflood.c:811:70: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
+  811 |                         lenSend = sendto(udpsockout, buf, lenBuf, 0, &udpRcvr, sizeof(udpRcvr));
+      |                                                                      ^~~~~~~~
+      |                                                                      |
+      |                                                                      struct sockaddr_in *
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/tcpflood.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/tcpflood.c b/tests/tcpflood.c
+index bd8edaf..0feda23 100644
+--- a/tests/tcpflood.c
++++ b/tests/tcpflood.c
+@@ -808,7 +808,7 @@ int sendMessages(struct instdata *inst)
+ 			}
+ 			lenSend = sendPlainTCP(socknum, buf, lenBuf, &error_number);
+ 		} else if(transport == TP_UDP) {
+-			lenSend = sendto(udpsockout, buf, lenBuf, 0, &udpRcvr, sizeof(udpRcvr));
++			lenSend = sendto(udpsockout, buf, lenBuf, 0, (const struct sockaddr *)&udpRcvr, sizeof(udpRcvr));
+ 			error_number = errno;
+ 		} else if(transport == TP_TLS) {
+ 			if(sockArray[socknum] == -1) {
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
index af46cc14d7..5152984249 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
@@ -25,14 +25,14 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://0001-tests-disable-the-check-for-inotify.patch \
+           file://0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch \
 "
 
 SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-
-SRC_URI[sha256sum] = "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7ea85ba"
+SRC_URI[sha256sum] = "30528d140ec1b1f079224081fa37df6e06587ff42b02e3e61f2daa0526c54d33"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.45.0


