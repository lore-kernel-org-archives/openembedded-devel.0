Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3910.1794729112212380016
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qtmKEQ/V;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so3487420c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729112; x=1795333912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJsQcZaq91cbu3XQCN/P/t4twGAUF/8dB02J3C3P8zU=;
        b=qtmKEQ/V2/WkCKwAMOian2v9CkeQBN+kZZQ70lWe6jmjXLEoj6NYsH+2H7AdgEQBa4
         JU3VuJcPxKAOSmSp3OHfP9qx14TCEFh4tZDQF1opZbQKR0q/utTypAGjfb27DIYJCOgy
         3dgLEYUeRYnWkhaimo4abh8OPPV3LYpckUNEDrJiK2d5aCxIVW97fmzAoOJqsifJBTp4
         PFtsa0GBE4306L2vf2l5tthG7KQLT5U8X6Gbw6RMu3X1mIKn16xhcnT8GZQRb9LFOpT4
         rqRcnd2zmTvk0lwWhNxfwSJK+QVqVeTbyfqdW5egoC4MOQ5ujto5U6TLSELk46fRGEJ9
         osdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729112; x=1795333912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJsQcZaq91cbu3XQCN/P/t4twGAUF/8dB02J3C3P8zU=;
        b=OBJB1Jjjox9jLYqAuIeK6RSdBuedOkomaedgK8NW5cx+d1+ipo1K+qCQYICmODAoVk
         N2fvZjwnRAqyfJ5EyD3G35rMq65QinndwwLYcRdXp2bPZXelnzFUFXaXIp204EXFwqAN
         29Kcbtajdxrqu97zE5LFb3+0EgyogaezzeJIcqg9Et6XkNib3W38PyOatHjBOcCfhzHe
         pTNaQJ1CVa436PsnLRTEn+1gDffA9RRjv0VIkz/UpegsgujJ7pgiYaGKPKM3yvi7fPwN
         3XWxUaf1jKM4Ivs50ND2ilhyBT4nWLTHQ7ipQDfmO+lC2xi3OjQuJoMSj/1qlTa6Kp/L
         BkAg==
X-Gm-Message-State: APuU4Z8B5BKWilfAwizky68DFliGH76L+T3BxvnM6oOHqhn4DV2ce4ky
	Y+q/q9lyVcxyVG3iu1X1PAd6HNnQ6shna9ujbY6K8TDH0JqwuASVWTqpmLNtvH2c
X-Gm-Gg: AYBFou1p03/v3NitfC8Yg0+UPSId8S7LgXuL2WkdbhWIVpXJqZOydvQjTA8ApZbwmXe
	KXedJKvVkJaEAuyGELdg22xLyExn1YBiLJBayFWWtKM4nEXJ3gFzv1CPn13dsrjV6D+QD6Mkh0n
	1fJri23HS1618O5YXrT6uYOWvHFJH2VsRIELlU/1Oaz1Co9xRhTP7KsKQRtDBTpV+Y8E/HVRw80
	6cpkr3UDCxMf3DRvF7cpbLOw6Nl0H0EXDWst8PmFFYs0rkOUyGX8K356qrydop9d40Dxgiietxv
	2/diF9+gg6CDNBiMEchoWPdZ6zfGJy/oIqWyQMZ3v8XUr3WfFdMYNoiOl6mvfa/lZGjWQXbHDVI
	Ztim3wPSiqTFuMWfuG495gvXDKqmUHAcjf22IDOT59Xh3THxgT8eYvZjIz12zYPWiOl25Gq8UPE
	OqDb64YsmVggBRJVFjiZRZiswIgDsaDbZMbjRd6zV6UBaeOMIptFQs6a2hJKeb5vUrPFaXng7Uj
	setqAW64V0Hk1xiZfP4xJXYNi7xRJAWTOzHvZbPpeED2/pPuY6+DPxmiANGzTZyKa4e/ocSvdeV
	puHA2hOMFcj83nYgL++J+w8tACMSHf64wBrd9CbV2Q3vMHVCwBmtzv5QRPIGQ3EsLemssGU5VL7
	rCdYiyIpPBsKwNc873ZIPAU3G4XZ63w/FNdtrzdljyA7eqBCsEdSm0Py1TLGfhANYO1ZlwWgjoH
	WA1XhgP5CxwcnRwbHMum8z6cWfzsobweGqd2Luutd1lVP1MBuefw4pCaXFT0RpXw8avimq0zJoU
	UM6y/6w1FNix2p9J7iEeCt30yzwY/GNbEUTB9eSKkZtDNE21uXsy6wlM8yAyJs991jEM+fP0l9v
	F746
X-Received: by 2002:a05:7300:ff46:b0:37b:c89d:1d56 with SMTP id 5a478bee46e88-37bc89d354bmr1915516eec.12.1794729111568;
        Sat, 14 Nov 2026 23:51:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 92/96] pdfio: add recipe for 1.6.6
Date: Sat, 14 Nov 2026 23:49:10 -0800
Message-ID: <20261115074918.2932593-92-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132362
Content-Type: text/plain; charset="utf-8"

PDFio is a small C library for reading and writing PDF files. It is
required by libcupsfilters >= 2.2, which replaced qpdf with it.

The hand written Makefile links the shared library with DSOFLAGS only
and installs into BUILDROOT, so pass LDFLAGS via --with-dsoflags and
set BUILDROOT in do_install.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-printing/pdfio/pdfio_1.6.6.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-printing/pdfio/pdfio_1.6.6.bb

diff --git a/meta-oe/recipes-printing/pdfio/pdfio_1.6.6.bb b/meta-oe/recipes-printing/pdfio/pdfio_1.6.6.bb
new file mode 100644
index 0000000000..4858b009a1
--- /dev/null
+++ b/meta-oe/recipes-printing/pdfio/pdfio_1.6.6.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Simple C library for reading and writing PDF files"
+HOMEPAGE = "https://www.msweet.org/pdfio"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://NOTICE;md5=911592668bdcbb7554c90ec4cd2fb911"
+
+DEPENDS = "zlib"
+
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "be9790ff2e9f0b7052fca8e96f2fdb6ebac903910e7ed8e2d1de4b1e55a40a23"
+
+GITHUB_BASE_URI = "https://github.com/michaelrsweet/pdfio/releases"
+
+inherit autotools-brokensep pkgconfig github-releases
+
+PACKAGECONFIG ??= "libpng"
+PACKAGECONFIG[libpng] = "--enable-libpng,--disable-libpng,libpng"
+
+# The hand written Makefile links the shared library with DSOFLAGS only
+EXTRA_OECONF = "--enable-shared --disable-static --with-dsoflags='${LDFLAGS}'"
+
+do_install() {
+    oe_runmake install BUILDROOT=${D}
+}
+
+BBCLASSEXTEND = "native nativesdk"
