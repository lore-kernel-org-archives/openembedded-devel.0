Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66E2CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:09:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.32306.1759752545423507042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QXQkIITG;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3d5088259eso709449766b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752544; x=1760357344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWLu+S/DZTCqT9ml2YWJnobsWuW0OeT93nD9juwMA1Y=;
        b=QXQkIITGMUisGb4HVb4KQeszlruaIBGtvTLcuICvtoII7X3b6IQmuEsAI2TXVOEthQ
         xaeJ6K0+L5aL2wS2kgda62WcN1MzcqZcmWS1v8OnLxgBZMh9GR4TsQOK5PO4FrOebU5z
         HkKcnrTFjT/q3DBYG6VyXIp7R8fyE0pZkN0KTqaH2Vz13d6HD6UnaaGOZUx2A/vf4WT6
         ByoRs5EyPUXf/S4oUDRXyH5SJQMueYAOiTZ+zgadUUW5Hz/N49Vqc5Ic+ugSiYTqyv50
         4s84odeThVmoqjLVHaHntjosE9LrpSfcxR8NQiZPMcu9IPdpN9hlNqTKpWgiKq0HFs42
         b6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752544; x=1760357344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWLu+S/DZTCqT9ml2YWJnobsWuW0OeT93nD9juwMA1Y=;
        b=QcKFhticOAr0xeO8d+AcCY2Ic9k4Me9KC955VqHk0ZbAxWyJSLHnTYdT70sL+Olz0t
         s5vlD5WrOs+1ZbredOfGudZFuCFY5SR9X+77JxzRkYQkxmHBs4buXP4qMIwwIjCbVnhe
         2Cki+QjnM4rzFHQdASAJxo2eWWasrAeE+XVm231l2ZfONdbNwUyJxE22BAsWP7ZMTd1a
         DpM49a8AwlViyyvRF1nwjlxXCvjWUZ3d0J0yXNp1WS2BMDB6SvbxfDOUFTwnsbw0zNbG
         osjLH2CUgBafQeaEheQfce7LTrT+gXBe6LYOVu70Mp4U9UziZRoJMnTOH2TVS/PbNxJG
         aDJw==
X-Gm-Message-State: AOJu0YwvHkNxd1J5ncBrT1xVlv7ibAaYKcnKAFL7k+lnuwwWhdD/FZ0J
	LSx5tyACqbhuHu4dVko7chCzC5Lg7NIlQoUYy0Diil/6xTU/FAVL7MAPkyHKoQ==
X-Gm-Gg: ASbGnct8K1nsfCPWjEY2D51GcDJ9/tSCGBnFebk+zVmCNFjGf62fQT0rQTW27gRnoJ2
	rVS43IXHFK+gkflYGThlcG3bPrg+n4Gmvg71zyqgZ8OEDfHo0CfpdYbSyTqZcA2bLQndyt/w7XY
	gHzBSjI7WH0SRJPGSHTJiHq4lzcovt6atQlzNJpGmo1PJsTZUWlxi3a5wEGBEUyxQ5Y5YD5yIQh
	r9gKP42mhFEkxk3mVlVmqRUDQTih/1a9+5HJeicVYJckV2Zih5SvxZpIx2ga2FO4plzYIbJ8XVU
	uB7vRJ+aEdwuJqLTooI41xWeXSDq4a+YzJyqzND0lCtfmBiLh/BNJ+1WbnZz0UwaxJbKTBCz8eW
	a9qXjhEL+E0pqHo/67JK4rCEkxgel1cGWq6Ac26McJIzW
X-Google-Smtp-Source: AGHT+IEDBg4UP3aERAliTqb3CMuRy3gJTAB1iPHQ/H2TEDXUXQZb5+7a+Lc+EPGogkySN57uFhyb5w==
X-Received: by 2002:a17:906:c141:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b49c3a2f8aamr1479388066b.36.1759752543549;
        Mon, 06 Oct 2025 05:09:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c7396b863sm428309666b.65.2025.10.06.05.09.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:09:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/5] audiofile: fix multiple CVEs
Date: Mon,  6 Oct 2025 14:08:53 +0200
Message-ID: <20251006120902.485724-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120283

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6827 / CVE-2017-6828 / CVE-2017-6832 / CVE-2017-6833 / CVE-2017-6835 / CVE-2017-6837

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/cc00bde57fc20d11f8fa4e8ec5f193c091714c55

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 634cbcb91c3ab7154e0cda707663a1e4aa500f4a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ays-check-the-number-of-coefficients.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index a09f84381e..7654c073f4 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-fix-negative-shift-constants.patch \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
+    file://0004-Always-check-the-number-of-coefficients.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
new file mode 100644
index 0000000000..282f4c01b9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
@@ -0,0 +1,45 @@
+From c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0 Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 12:51:22 +0100
+Subject: [PATCH] Always check the number of coefficients
+
+When building the library with NDEBUG, asserts are eliminated
+so it's better to always check that the number of coefficients
+is inside the array range.
+
+This fixes the 00191-audiofile-indexoob issue in #41
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6827
+CVE: CVE-2017-6828
+CVE: CVE-2017-6832
+CVE: CVE-2017-6833
+CVE: CVE-2017-6835
+CVE: CVE-2017-6837
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/WAVE.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
+index 0e81cf7..61f9541 100644
+--- a/libaudiofile/WAVE.cpp
++++ b/libaudiofile/WAVE.cpp
+@@ -281,6 +281,12 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
+ 
+ 			/* numCoefficients should be at least 7. */
+ 			assert(numCoefficients >= 7 && numCoefficients <= 255);
++			if (numCoefficients < 7 || numCoefficients > 255)
++			{
++				_af_error(AF_BAD_HEADER,
++						"Bad number of coefficients");
++				return AF_FAIL;
++			}
+ 
+ 			m_msadpcmNumCoefficients = numCoefficients;
+ 
+-- 
+2.11.0
+

