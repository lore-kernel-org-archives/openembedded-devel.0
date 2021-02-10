Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6034.1612966900679414769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 06:21:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=ATh67OLg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id g10so2817886wrx.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdQtDQScBaCzmJEh9hUWUSCz/HdLvL1ySj6bL1GZiXM=;
        b=ATh67OLgGFrZPvweyyR7WSfPJ5eGvmAq8rSkHzIwqlitup8t0X06K6CHHZQT0TwtKl
         t0+5cIqKQp5dtZ3oIjKdlfAQy7IZUADFYEAFyuvYwNTeliVmTt1ECjtp1fmNMwTVRFQR
         f+zJ0Y8kI26BHt3XhFA/TN44+ZdSs3xWF5M6vozjtcCvl1Crst/mo86koIesaVSsPMrP
         Vj6miaIx/WBwi85JiL+RGhgngjeVVwimj18dmNDVubNJ2FM6w3WcbYlxC2YP9MAsw/ld
         Lio+7qFZCzIif6ViArRgAH7hsTcfLDUJOiGWUHFIU/hAQJLaZGR9oDizkpZmARUT6RTa
         P7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdQtDQScBaCzmJEh9hUWUSCz/HdLvL1ySj6bL1GZiXM=;
        b=G5qz/KxnGyuyy9Evb6wLyjx24HToJVKhozK/U6OFtLZ7eN857JgXCYT3SZuQAN8O5G
         dRdiR2FR0bE429htNTxZxgiVEZbGxYo8VbCIdKr2nUMTA1qzlu6zp6JVMIqbCXa0dfRk
         tlQlY3Z7unjNcfEwWjn7jA0tg24+gLVUEyYmJuxkpzUcZlnFklr0OaWAYmlWSXAs/obY
         FDLR3NsdSiPFLJXzUszyWPrD5r7sJZ4SZEi9/6afnIKFZyaxVlVRIOIF/I4F/J+PkVjo
         hKRit4ssAA1PyOUvO/OA0uGuTPtduCvDyM13qU5wFZWtbxCllz7BhOTB9S6Fxp9OCOXM
         +qsA==
X-Gm-Message-State: AOAM532hIFRRwe7107gDD0HK4sEkSEHLiKUOcFSMsJ+ezWwywTf6ZWzw
	vDtxBiSJ41oi3pG/sDGqvVCx2Q==
X-Google-Smtp-Source: ABdhPJx+DiLBvv5JQcydrN+tAmero8p3LcmMaYPGKK5LPrWhWj9PTA/Bfj3xH1VnKOyRut9fWi4unA==
X-Received: by 2002:adf:f192:: with SMTP id h18mr4038911wro.340.1612966899149;
        Wed, 10 Feb 2021 06:21:39 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j17sm2481960wmc.28.2021.02.10.06.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 06:21:38 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-python][PATCH] pydbus_manager: new package
Date: Wed, 10 Feb 2021 15:21:26 +0100
Message-Id: <20210210142126.21906-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

pydbus is a popular (and probably the most 'pythonic') implementation
of DBus for python but unfortunately it doesn't implement the
ObjectManager interface. This project is an extension providing this
functionality.

The reason for having this as a separate project is simple: pydbus seems
to no longer be actively maintained so it's hard to make it part of the
original codebase.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../python/python3-pydbus-manager_git.bb            | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
new file mode 100644
index 000000000..ae9e42160
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
@@ -0,0 +1,13 @@
+SUMMARY = "DBus.ObjectManager implementation for pydbus"
+AUTHOR = "Sébastien Corne"
+
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fd5bb1dae91ba145745db55870be6a7"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/seebz/pydbus-manager.git"
+SRCREV = "6b576b969cbda50521dca62a7df929167207f9fc"
+PV = "git${SRCPV}"
+
+S = "${WORKDIR}/git"
-- 
2.29.1

