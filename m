Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BD6FD006A
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 14:09:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138467.1772374152219606947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 06:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DE7q98yf;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2510381f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772374150; x=1772978950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QibME5oe6QkUs7kexGgPL1go9piZuan4+qK/LA0xxw8=;
        b=DE7q98yfYtLci2sj71btdT7pCC+GWou/CX1/stZgza5gDSoTOlBm9b75uIkAocpBFV
         XdoMTZJbhm06Q4/HxPZlfQLxZV7gMg3ZHAjSjcXWjXzH6rOGHDtkTdf0/SuPTCeuFNtR
         P0/6M4XvlATn9SBAWLsS+tfRuQxG1H8IgMx3bxHw7TWoTOgSlkHJdtUPH3z+IbIL/Y6Z
         CI5qmIBnHC8szABiiexGRCHnKtCWiZipvIWmY6LcGJAXk98YqPkH/UIREvweJjyGM3Cv
         kaS/iEqvBkupOiFJ31s3RWbwZ0LZbO/mskKPn9FMCRWOh3sWT4+vBCg1ufcZXymaML93
         +9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374150; x=1772978950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QibME5oe6QkUs7kexGgPL1go9piZuan4+qK/LA0xxw8=;
        b=gKl6Psx3RSfFkkQpMVEvnE9wnb0qUfqEWiF7s+1ybLNAGIloPxgnYPK0WVPcviOW5h
         rPVddImeDd1ZNH/JKgOxG8dlZVk1TCt7QtaITLdCU14vVTK5amsdirJZRSWeVC+EXlhE
         W07qbwTZx0tdR/zLC1Thg12iO+mbWgIAqv83Ebx/B2pMS6mEg0icAN/dFKYGzazGQ4/s
         HPKXTKls0YH5MH1Wy5v6XXDaKP3Hwn7ngfoIXbcFx1/eIw5PApm+NKDY1eAI1dxlyiqQ
         tIA3yg2mRpDIfzBIned9QCKgXDw33HWdqtwLVx79sxO9yIwNMXn+Y7r9oCFX9LQViR8F
         RHIA==
X-Gm-Message-State: AOJu0YxMZcWNTjQ3b0siukOtDGdvNsiqXjG4wtF6snsrJcCxHCK8RhBG
	+zeH5jT0p+g+hKjhjp1kdxFwKAK6ZHvzhIl9VElxxz5GpyHNjdirDEsoNAx2aQ==
X-Gm-Gg: ATEYQzwn+oi/Oni+Q2q/ewzRYmBPUdw3dRvL+mX/1K54FBw4s6IE/q69QxlKx4Y0YhC
	dNZnaVhTmHDq81qG4rpJ09QVrMP7lGt6WkULHz6JFHO3TTcm46yXMpICxflS7T52+7IfZqdyU2I
	SjNG3q7cyBPmEQrBzRRMpkib7l0Oko25zZ+3MVZMucFREDfN7kOMfkpcKGim+Fyo8qPV1pyEtbx
	PqqlzXIxlF9jAcsce0wQv2cPS8R7WBJcbQm0PEQuAi2PTqR3afNbcyK2aI2Rth6T8CQL+9y40Ar
	qrPIuWFCQYtOLTfxR/sXf189E9pTxPjrIYZZfwgydTV3JKmQD4NrBFmQWLVKrfNchbPhYKHW9GI
	QVdn074CIAWdjxRREjmPXo/AWMpsF3ahmlyXyp6950orGmPerZyJLZChKUOVnIkg8jvZFx7FDES
	C5nkdYkYjcF45IrXJeNZZRnbo01Rug0sQ=
X-Received: by 2002:a05:6000:2007:b0:437:6d8c:c08a with SMTP id ffacd0b85a97d-4399de2fd5amr15319086f8f.45.1772374150179;
        Sun, 01 Mar 2026 06:09:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4e771basm3953910f8f.0.2026.03.01.06.09.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:09:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] exiv2: patch CVE-2021-37622
Date: Sun,  1 Mar 2026 15:09:08 +0100
Message-ID: <20260301140908.1139771-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 14:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124794

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-37622

Pick the patch from the PR referenced by the NVD advisory.

Note that the regression test is not part of this patch,
as no patchtool could apply it in do_patch task.

The test patch was however manually applied during preparing
this patch, and all tests were executed successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-37622-1.patch        | 25 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2021-37622-2.patch        | 25 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  2 ++
 3 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-1.patch
new file mode 100644
index 0000000000..13b2a4c81b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-1.patch
@@ -0,0 +1,25 @@
+From f6da4a573f9f4c0821ac726fcbfc7fc09212327b Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sat, 17 Jul 2021 12:38:31 +0100
+Subject: [PATCH] Make sure that read is complete to prevent infinite loop.
+
+CVE: CVE-2021-37622
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/ffe5eb517dad93845e62144d8e53f52b17420ecd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jpgimage.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jpgimage.cpp b/src/jpgimage.cpp
+index b9e724c..bb34044 100644
+--- a/src/jpgimage.cpp
++++ b/src/jpgimage.cpp
+@@ -644,7 +644,7 @@ namespace Exiv2 {
+                 // Read size and signature
+                 std::memset(buf.pData_, 0x0, buf.size_);
+                 bufRead = io_->read(buf.pData_, bufMinSize);
+-                if (io_->error())
++                if (io_->error() || bufRead != bufMinSize)
+                     throw Error(kerFailedToReadImageData);
+                 if (bufRead < 2)
+                     throw Error(kerNotAJpeg);
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-2.patch
new file mode 100644
index 0000000000..c506b48c11
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-2.patch
@@ -0,0 +1,25 @@
+From 8390f32b88b2c779c328ca09d9f437202fca2782 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sun, 25 Jul 2021 19:03:50 +0100
+Subject: [PATCH] Remove redundant check.
+
+CVE: CVE-2021-37622
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/19026fab2bc2b6dee2150f38153feb65a41cea17]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jpgimage.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/jpgimage.cpp b/src/jpgimage.cpp
+index bb34044..d549355 100644
+--- a/src/jpgimage.cpp
++++ b/src/jpgimage.cpp
+@@ -646,8 +646,6 @@ namespace Exiv2 {
+                 bufRead = io_->read(buf.pData_, bufMinSize);
+                 if (io_->error() || bufRead != bufMinSize)
+                     throw Error(kerFailedToReadImageData);
+-                if (bufRead < 2)
+-                    throw Error(kerNotAJpeg);
+                 const uint16_t size = mHasLength[marker] ? getUShort(buf.pData_, bigEndian) : 0;
+                 if (bPrint && mHasLength[marker])
+                     out << Internal::stringFormat(" | %7d ", size);
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index eecd02d78a..1deb1d3aea 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -30,6 +30,8 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-37620-2.patch \
            file://CVE-2021-37621-1.patch \
            file://CVE-2021-37621-2.patch \
+           file://CVE-2021-37622-1.patch \
+           file://CVE-2021-37622-2.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

