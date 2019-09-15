Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id E76E57EC5D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:43:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id q64so21490242ljb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0lO3c9d7V0pOrTdV7R5i5xjirx/zxwo2ZAoddqz6Tnw=;
	b=NtgTwebBaP34aErNGXCa+9QaFDIdYklz60y3gEomqlAETYvEUAef1DmUnUK0terNKQ
	l3GWLaT8mXoFR3YM+wqRqO7Mf9Ls0QRgLSQ3hoZElXYWuo5G3XrsFfgnGbK57GA7v8Jw
	62RsDHgYYIuTXA2y3hagunjtmzA4sboXv0w35br8OJyzl9Mi4TJNqjBIMatTk7PE8Qsp
	fNYWOevSN01OB4Yf9WYX5GfWAwzUdRoy+XEn81ZSFFS1wiRwllEJa0cK7d+H/X0/XMdU
	f/1do61n1iDV44cgeKiBgPTJ/N1K76VlamwfT3hZpFqCu22hENlxBemHOAs3qsiLclAZ
	yBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0lO3c9d7V0pOrTdV7R5i5xjirx/zxwo2ZAoddqz6Tnw=;
	b=B7Oo5iFbucyPqU/cyjIKECEQoRn1Ois7Z4O3fp3z3jQUYVoLvxhY/+oN6t4r3p/1Cp
	hlvGdXKbolM6eOS1IEh4wLOOkhIDrhbKnHOPAprGYURpEQr76iH7TZYWs+I6CH2s9Mtu
	Tc6eZ3G9X8xaU88cEPEMY8wMhVMoGrOXxocdSa7imaMBx4Ub2CNkzZ7LQ0qUNj0UO8p3
	HKGLwiv8W6Gx8OLJGOSwmXj+fnQa7Y8sPambQxDEIHZriYlvEDk16mRbj3N0z0wn5KKV
	BkNNlfFwUVG2Yb7gL+pGlblB98yUJRUlN9DMgOdU8V9Gpk4yR5eiVx2G+EdAXuY4QMNy
	mcQw==
X-Gm-Message-State: APjAAAVDafpnWrJqAx/FZJ59EUTIt9mzZ1ZhEl+j7DsJJeF5wUiEjEHO
	Z6XtF9jGxPGg6cOnwBTG7RZjLnoEwt0=
X-Google-Smtp-Source: APXvYqwbxnE2bkElTn5hF3PGTGnCNQ7OEIOebda5IdHJE8dERSw0R2YOIKxAgL4Y/ula6D5HOQLoLw==
X-Received: by 2002:a2e:3e16:: with SMTP id l22mr4918131lja.195.1568591005313; 
	Sun, 15 Sep 2019 16:43:25 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	z30sm10118652lfj.63.2019.09.15.16.43.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:43:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:43:23 +0200
Message-Id: <20190915234323.14444-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] botan: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Sep 2019 23:43:25 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../botan/{botan_2.9.0.bb => botan_2.11.0.bb}         | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.9.0.bb => botan_2.11.0.bb} (74%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.9.0.bb b/meta-oe/recipes-crypto/botan/botan_2.11.0.bb
similarity index 74%
rename from meta-oe/recipes-crypto/botan/botan_2.9.0.bb
rename to meta-oe/recipes-crypto/botan/botan_2.11.0.bb
index a7d25d567..c2d644b41 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.9.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.11.0.bb
@@ -1,15 +1,12 @@
-# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-DESCRIPTION = "Crypto and TLS for C++11"
+SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=f4c145d4d70a3244a053c9f90d4841fc"
 SECTION = "libs"
 
-SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tgz"
-SRC_URI[md5sum] = "db8403d6a2f10c20fde3f3c76be9a045"
-SRC_URI[sha256sum] = "305564352334dd63ae63db039077d96ae52dfa57a3248871081719b6a9f2d119"
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
+SRC_URI[md5sum] = "2dba13b0d25d0e9d2a6f9867c62c9f2e"
+SRC_URI[sha256sum] = "f7874da2aeb8c018fd77df40b2137879bf90b66f5589490c991e83fb3e8094be"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.17.1


