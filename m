Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 49B9F6C8C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t27so4791527wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=awgA2EQhIKCBN8pGjfCMOFQiZFLCAT/q4i8Xqsx+nCw=;
	b=ZQOpQeYxOeIz2CQrsTn8C7+92O7+5QtgptdakRN/mvQazYX1fKRDDIUay6zrrY7JI7
	gqL4ug6tHRZXOAoSsP97n9lxhlTdGl2Xf98lPgpMPR0WsVu9RTAEl566cRI+hHBB/hu7
	+cQiT0V6mhF/2A9FDQ//8XprPN3dwdthn0/ZpWmHb8S/ds0kW9bIfUvAlFDwcysTyjBF
	Hi9QD51ycTzp6ffy/KSObNqqBmHlTzogyPUJ4GnDCnYjjt2khgCImCnfqm0zKmyL6P8b
	r1qHZT2hEDFPP9VpzFWOMDeOEsQTgugJ/pv57VZmYebY7Vf0b5OqvtAnt5zi7oRUizHu
	17FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=awgA2EQhIKCBN8pGjfCMOFQiZFLCAT/q4i8Xqsx+nCw=;
	b=g+oj6z/sF+4cFuL+jk57bFGgW1TZO7TtVCLNTXLdTvPpzkXaQ38rxtLIVCoEQuBnHu
	pGXTDPcqL+G9X2XnMkuLGEcKxr7Vwe9uLIR3WzrkIhaRH4ZF07p0Y4bUHb9xavpf1zVt
	nMNpLYCzknzdKRgncox883PzeY13dH48cDdiL6XdNGYWDxc751qhjKQWlNPcWXyAc05e
	wf6eWgQPtoQR5Qcqdt1nxYeFZF4R+RMaVoKg2+rO2ZuDeF2uyBDMXk6bqeN4klNsuj1u
	I59smGzfV1Caw8Oa8fHan+8ZDNgQ1CuoVQ5+5iK0Sd4wV/GpNnZSe9TDzZ2Y3ZpWTgct
	p9Ww==
X-Gm-Message-State: AA+aEWY/2Xsi7q+C3ZMJCRHLqDLRKqBihGbHFIiNpUeL5zF+y5XAouHV
	Ir+Kb2FrDtTL0HRSX748aHFx8v63iCc=
X-Google-Smtp-Source: AFSGD/XRdCkhugEn0Dl9x7BjXjbPOXqogTqlX3ISxp/p82zD/oC8FgZkjk9UTkdn+YU1SoxrhsJ6cw==
X-Received: by 2002:a5d:660e:: with SMTP id n14mr14189051wru.19.1542987587551; 
	Fri, 23 Nov 2018 07:39:47 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:36 +0100
Message-Id: <20181123153941.10186-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
References: <20181123153941.10186-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/6] libzip: new package
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:47 -0000
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


