Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299B1CD37AD
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6231.1762976152100929214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GI0DLFmI;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777707a7c2so9879095e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976150; x=1763580950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dr84gsqgQmLhy5W3AYhqoEoqgrXiPX7fU3xj/7TjbS8=;
        b=GI0DLFmID//2OKiQnUft/cgpCAS8hNeGISBg6ph+Fm5+gZfVy2yHV+wxLTpWaUPy9C
         xysy8KjmLulUckztm+jNOmCwoG4cfd8ec6rRU9LoeLT0eiof1GRLEKWcwHsN7pTLpK6j
         VbJvuDoUGMgd2O8FU7TxM3rwNwvlMb8AJP7vG8uyeAPrlju4RSWj/3HvAKZY1o+DRQ43
         CP6Z6frVTxDfta3uBP0zDhcfgu4BQydwymSATBjbPtDYph9J8OSeqw1l4gEPxIRzs5Ij
         qVBS0AqFabHfuvefCez4VILAc4xUC+6N38ASDKondyfEzh5E3MAF+6JTh3u4xg5RsgbH
         2+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976150; x=1763580950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dr84gsqgQmLhy5W3AYhqoEoqgrXiPX7fU3xj/7TjbS8=;
        b=Dkeoiuh3cTAblqoQdJDbs338npCeU19PZIFXtsvUSsz6VhQDIijjTKaBDGrTy+yt3P
         mYLumjYbbVOrNW24huiR0LBM1Rp+lCUp6CwdFDFvr4HvF5C/CRQPEJTEBgFbMjhQjgMe
         uJVJYur1jrOHWa0EcvismaovBA2syNdTJIM0cN6eT+ghEUeTREumsfTKmvBdwsg9QS3Q
         pmvsEv68e4pafbsgAa9HduAWgv9G0scmiFx8on79b8oTnVq8rEk1qa4Ooe7+ccjbdzRj
         AMwIoslv82IUOMckrbg0liMgsNoKRXoBMR3/c1yVIWKVyVVzHQWiZ100SPvCv6YXokUg
         XrqQ==
X-Gm-Message-State: AOJu0YyYLNMaRHtrl+XjsDpeS8ZRNMfhaZwBBzmJBHfc1wbuJAnhq41i
	OqY+lxpsapOnfu+eXBaHVTSs/TXKCgHAhckxIdYJAJzbSx752fHISp9LersYHUdX
X-Gm-Gg: ASbGncvf07vLPBB1c5jtjJPMtudxvFpVsXBgReWWZe3M1NezciRkug2uy8Q4Y6DCz0D
	zLTOvJ0F4otVIK5Zion1ODCOxyXeS+LAXaouKBiY0sHtevnQSXX4XmbwRjh8B6ZKR7eUegOB74/
	J81YXsDfGSDCY5wKh1Xx10V9P2AjGnHeBVztEXWfHmC343AbQFS/yx96guV3zNzATW22FTqs1Og
	KLs/QQDDPeY886c488UwTpUWJ82eLSEgbrpnip0tCBhBAs6rTOR5jtm2lkaBuAzuWk5PNwvOVf1
	VeZfAdO7yum6qFrXneeyLTWqPahM772OEKbSEDSC+pbtiLljiYrt3vmtDMjiY+0RDHuZF13UmIb
	tsHvWeRgzD9YiahnIOBFul0q4xCpQl8VWDdLGnJMQay1lYzg3sA/7LLNK7IFKGVSEKl5+VRA2ag
	==
X-Google-Smtp-Source: AGHT+IHX/lfeNOJJWBQlYBWoRZMRJJIomwurPQPL6iUV2SmVSHq4/Y3VXV8FWQGoyQh5V5NBcNdn7g==
X-Received: by 2002:a05:600c:2e48:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-4778bccfb0dmr3973615e9.5.1762976150357;
        Wed, 12 Nov 2025 11:35:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/21] unicode-ucd: Updates due to license.txt updates
Date: Wed, 12 Nov 2025 20:35:30 +0100
Message-ID: <20251112193542.1589821-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121571

From: Khem Raj <raj.khem@gmail.com>

This is downloaded and does not have version, so we have to
update it whenever upstream update it. The copyright year
is changed this time.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6121f2907aff77839bfdff9fdedb7e9bee6b1628)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index f0f3a66e07..a4952cf97d 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.html;beginline=43;endline=83;md5=cf6c4777b109bcee78b6083a21be6192"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=ea17640caddb659394df50e5db6efd69"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.html;name=license \
+    https://www.unicode.org/license.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[license.sha256sum] = "e415e1f2188ef2b1a5f7e6ee8c60cefe8a49dacd8b96c9025cad5013985129e4"
+SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
 
 inherit allarch
 

