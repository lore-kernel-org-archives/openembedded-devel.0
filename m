Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B05506C623
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c126so17128171wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=awgA2EQhIKCBN8pGjfCMOFQiZFLCAT/q4i8Xqsx+nCw=;
	b=Fh6kA49XMKp+xDr2pIRAE4FpphmO8ohyxXj4IcjEh69qrAOk8IsRvpX48yj60Cpk7k
	h2CfP7mo6FgkYLAtur/CJBPAB4m778VIBfNDPNfQk2GY2ATEgSbac9fhpDa3PgUnJhTv
	k+XUY0LsoJmQ53FCB+TBiZGVYqi9/Z0EVAVSd+uyo38l8g/KTytp9V6Sx9dARSU/p965
	ZTmTf7gGE0wSFh/ojAvaew3Nn+ZkI90JDL792mqi0AZJ8OMqRhBbxgdWhrSh2crqJieR
	XMQ1QD7+9MvwTW5XlxinZR/nUVhgQiT2H03FGyj3oKD9ZpOpDkcpYpo8JO2UIyw1Ocrv
	msrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=awgA2EQhIKCBN8pGjfCMOFQiZFLCAT/q4i8Xqsx+nCw=;
	b=MItUPKrEgFvrPDOKCiEjeoe9ZNrS6weESEPWCvxcqlSNalcxl5Mj/QrGg1UtXJj41U
	hOZIEy+mbflhL3ApQoZUKUxj66/Ah8QiXyhEC7cbeO0+wImYjzEyJVjwZ7Y62Erjhs/V
	yqrSvi13CxZf3yGzCJQB48X0ZMKhDWMzrxRBD48dYN7Cf0HVOARbKG98CRS0U3ms6hRa
	s8frn2GPBPGcjs3Uqm3SR9/AQIVm2+94QiF7/+gsH1KOQcAgYPhxxx4TEEue59jdiPf9
	aPa6sld8TFV3bBBIHXNJWF8PlVJ02Z9QpC4q27M4DuNyOUXmftt0UnD+ZWHJWhkPJyKH
	tHKA==
X-Gm-Message-State: AGRZ1gIErCVFsu4JlAyOR5DlhDljNcI+V67264pLGMHsRJiDXJzHn/yy
	9BKrAMA0Mqy+gTAuPMZmAFiwDopGRwE=
X-Google-Smtp-Source: AJdET5djHzXxduLijyZ5+CsMZSQGsY+mKBaMZQzR6JW18Z1m5/Fj5ImuXFXaXOQlOm78S6fRQQ/g2w==
X-Received: by 2002:a1c:7601:: with SMTP id r1mr21932304wmc.98.1543217726175; 
	Sun, 25 Nov 2018 23:35:26 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:15 +0100
Message-Id: <20181126073520.18859-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126073520.18859-1-brgl@bgdev.pl>
References: <20181126073520.18859-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/6] libzip: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2018 07:35:26 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-extended/libzip/libzip_1.5.1.bb    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libzip/libzip_1.5.1.bb

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.5.1.bb b/meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
new file mode 100644
index 000000000..ce73700d7
--- /dev/null
+++ b/meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "libzip is a C library for reading, creating, and modifying zip archives."
+HOMEPAGE = "https://libzip.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01f8b1b8da6403739094396e15b1e722"
+
+DEPENDS = "zlib bzip2"
+
+PACKAGECONFIG[ssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
+
+PACKAGECONFIG ?= "ssl"
+
+inherit cmake
+
+SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "6fe665aa6d6bf3a99eb6fa9c553283fd"
+SRC_URI[sha256sum] = "04ea35b6956c7b3453f1ed3f3fe40e3ddae1f43931089124579e8384e79ed372"
-- 
2.19.1


