Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF5A7EE52
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:36 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f17so12210888pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M7PPoLYVYHuWQE7HeAr75TRRl4a/WVrKqLYTJBfh8U0=;
	b=Sif3HZiFDe+SjBhKtPpMYoeZvNw6L9zuW0vC1dhmj9kUZe4S/2fceao8WxmSkQkzUG
	F5vDaFLxt2oSGzKDo+cyFCgrtUCqd2c1xU4ExcY0xilRETAxQ1tNbsRCU2yVingSe3Zs
	KysfM6A6wQmpN7HW62gAn3voMmAKYu3Nix0GQsU/WoUAr5aMPLThxJSXDTX6dJu7bDz3
	pBdpYSmbB2x51kPL5vEn11ShhnK8QuLj0YN7mXMqd6XY+wUeRXaV+Gso+H2OTqTS3rF3
	rn5RfERwZaualdsqjRspqOxrQTp/6LFIp+8g8jswuFfzx4UXvHkJbfSxbm/DCTVR01gp
	s+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M7PPoLYVYHuWQE7HeAr75TRRl4a/WVrKqLYTJBfh8U0=;
	b=mA734pMMM89X8dfRKIKF7txV2Yzohvnr7dcvO+r4wi74nI1F2iBMLGAKqHtPVSLLzv
	vGpS7/aQ5hLdNa3Dl8IfgQku0Hv7LP5zo9jExz3s3sri5NcKMUBlTEkaBaSwms3TiCIZ
	+J76ogzkMhe1wBQv2paGL806lWkCblcan/+97tkIEhWO1uPyBnEiQ+yqfWipv5ZrEf4g
	aGjvcvBqOiMg1eRBdMVlnPHWKgGupPeJGiQ23D5blooRi5kR5beVSh/ZQ0GiI6OzyAyv
	t6UtmgihFyG1T5N6H217WjKIfyhA+pVTwMPLYnNLtDlJiHasFIeyxIybxIwfPRHXDNfJ
	u52A==
X-Gm-Message-State: APjAAAWC/S0sND5i9jx6GSL6wVjXXBzyFAT8hlwQvKQAqPnTINGvR2Qr
	Mu61FjhGl3rfBoBpN9zGtrg9NqlrB5g=
X-Google-Smtp-Source: APXvYqwnCyhZ0aU7IkHnLYLCNNg2FMNBl4IKhmqvTGc/OH7Y+J7opFbzrwjwvSmFNyL3Y+eAOqQj6A==
X-Received: by 2002:a63:3d8f:: with SMTP id
	k137mr68026809pga.337.1563727176846; 
	Sun, 21 Jul 2019 09:39:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:16 -0700
Message-Id: <20190721163919.32659-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 11/14] libuv: Switch to using git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:37 -0000
Content-Transfer-Encoding: 8bit

github archives are not reliable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
index c8239443c8..6fd0339c5a 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
@@ -4,9 +4,9 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRC_URI = "https://github.com/libuv/libuv/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "cc2cf259442fbe85404e75691e8244e1"
-SRC_URI[sha256sum] = "4afcdc84cd315b77c8e532e7b3fde43d536af0e2e835eafbd0e75518ed26dbed"
+SRCREV = "a4fc9a66cc35256dbc4dcd67c910174f05b6daa6"
+SRC_URI = "git://github.com/libuv/libuv"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
2.22.0


