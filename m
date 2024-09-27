Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAE3CEBF8E
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 10:08:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.65809.1727431714086531416
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 03:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0JWsw1U;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so17733485e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727431712; x=1728036512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUZOXyWJYa827fjEC0mHgrJeBwgzdVSebst802x7lhE=;
        b=D0JWsw1UN7TKYkZLlnrkP2Yb1QUm/pLw4KXahCSabbdl8HnzqDKyaiZY5IMLch5Ncd
         0SJRKAkLw6CbETQgZrSDZqBps6xulUf9dXJm3PuGJEDi1moZ6dQ7e26GUvANAmZJfIQ+
         dbRFVqFFU/9tVpF5X+jSAVXW4YiANjXDYxbvy3NQ+H8HabKqnzumCCaHAluI10fbOlnH
         NhV4XWOQF9je2uqsQtWveS9CdZjeazn9I6d0mjeixQt2diUUpLiM8igPXBm5nUwov02u
         bxN2cBdhjnrp7prcq9eYu/mQOpZ4GWS7yYoEqP/D3GLHaV0wQ731szDBdH3WuTaBuGPA
         IPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431712; x=1728036512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUZOXyWJYa827fjEC0mHgrJeBwgzdVSebst802x7lhE=;
        b=Vl4vpQ3SbPZYs+X+KM1vhIyameqC3iGih5S8/oIEoOVYzB+7ct6s1dnG+/MshijW9F
         0NvEAczdhre86piwClu9BhZXYgcce23jmplpgfRWGJYKlQ5j+fjYV8MMP8VGNZa7Chow
         sxCFwyUyxKjAKo7lJUhBOitUc5OBB4xks2UtYqYTjNSNHgajEJGg95QzkJOdGerrTqSI
         mcxTPa1lhOcli+RlpPd1+4pdmbC4gFf+h+2e2XmirCefHCsr3vQ/2AnPPiQ+BxQRhM1s
         NYLfUijVYq1xhNglD45/8j1NGg4YWSUk0RFMD39J2DW7Bj/zb1CIQdmUfzsXrs0ocUm+
         VTbQ==
X-Gm-Message-State: AOJu0YzboMOdjx/pSUj1SOytRieHLC2XKv6o9aIioSBfPDbZ0qLZMeqF
	fWb7IoqIRo/6zAxOXL3J1bQ2ucszTCbj144TLiknZAYMLHOt5Z5XNQcIRYhp
X-Google-Smtp-Source: AGHT+IEOJA585sjG2d3MEpnSTTGGpl196RjSPlhParmPFp1WBCcYFOG9qdIAcDOvzMWBhmK10YYhwA==
X-Received: by 2002:a05:600c:a42:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-42f5840a6b8mr20751505e9.7.1727431711824;
        Fri, 27 Sep 2024 03:08:31 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffb11sm69362755e9.21.2024.09.27.03.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:08:30 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH 2/2] gpsd: condition the runtime dependence of pyserial on the pygps
Date: Fri, 27 Sep 2024 11:08:22 +0100
Message-ID: <20240927100822.5101-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240927100822.5101-1-jose.quaresma@foundries.io>
References: <20240927100822.5101-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 10:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112527

The python3-pyserial dependency was introduced in [1].
It is provided by the meta-python layer and so make it conditionally.

Fixes:

| NOTE: Resolving any missing task queue dependencies
| ERROR: Nothing RPROVIDES 'python3-pyserial' (but ../meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb RDEPENDS on or otherwise requires it)
| NOTE: Runtime target 'python3-pyserial' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['python3-pyserial']
| NOTE: Runtime target 'gpsd' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['gpsd', 'python3-pyserial']

[1] https://git.openembedded.org/meta-openembedded/commit/?id=1266c912afa0abf118eaa5d152a0641c87665fbd

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index f893ac359..e3b2f8bf6 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -27,6 +27,7 @@ CLEANBROKEN = "1"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
+PACKAGECONFIG[pyserial] = ""
 PACKAGECONFIG[usb] = "usb='true',usb='false',libusb1"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
@@ -147,7 +148,7 @@ FILES:python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}
 RDEPENDS:python3-pygps = " \
     python3-core \
     python3-io \
-    python3-pyserial \
+    ${@bb.utils.contains('PACKAGECONFIG', 'pyserial', 'python3-pyserial', '', d)} \
     python3-threading \
     python3-terminal \
     gpsd \
-- 
2.46.2


