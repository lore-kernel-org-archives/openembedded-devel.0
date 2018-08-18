Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 36311792A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o18-v6so9589166wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3lyR8cVpHQnYaVqFytYFFbzJjE1YdDnAzBEUkqJTRfE=;
	b=G2YT6DpbWJwIvqCRlpgN3VSy2d9fkwfU1AFlt/8l70B9+x/F3TyoHufdAyb5Wooz6h
	q9XyU7OLxKLDQp/XLy9ew+MIhGdNSkoQroOxM7bo23KNgJDalquc66BGNHwpd5kUvFj4
	SC5Ma8KDsEFM9IrFhMZjY5J/hkUTNeg46tTyH5nLEydsA9TNX78riDsMyKirMhtDSqCc
	QRyGgj6S1mr9oEtdLY0lB72pPJJRcJNoIEIzIfZVicHQsdxrQlutUIGBzZbWn5HwwYK1
	uCOpwo16Rg55yixW2VhMblthpXle8d3Yl2M2a0+MpdIZf6FWduRxc3pI4zGWpCTN63I6
	Xesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3lyR8cVpHQnYaVqFytYFFbzJjE1YdDnAzBEUkqJTRfE=;
	b=eFmsCRaqnVNaCw9oeCzWwnpHTd40K4TJBbMjqb+PkAKaBu7WLCqKlpfezNGPAnoRqy
	UIR1nQfj4qmCNt3sdiKMXOWmz2pwNGwjuwab2uDgplQAUPmbz+/7VB+iJfzDYrafv4wY
	KuE15Cc3y2rwKhvzsaHgx9mWkQsfh+VjKvHjA2FtGuZ4/8sVtmLBeJGXtWmKvzLXEe2U
	0rc+qeq11V8iXO9uw/leqD1++dajx7rWVkz9Pi1bDPMelSaSsG0jP52bMr2tu7EUUyCX
	E3/JLxLSrZAMcimTfwhaydHKZiWaBQMLP+bX2LsOpOuBgQbgY8tkzpT/4DpjMpx7NIIA
	leSw==
X-Gm-Message-State: AOUpUlEGLaD04G3RWgp7ICSS7bm3Cw9TYb1Qsnp8m+4dbl74rMcOb9H+
	cpTKRq1lXQOZ+Ozm8tQINqPJkVOt
X-Google-Smtp-Source: AA+uWPzFxYG/mEJo+CLZ9qcFLZtqimMnEQbfioVscE/nXsBUHDTGDdO5m+/uf9ZYt3ha00TXiJSa8A==
X-Received: by 2002:a1c:5e08:: with SMTP id
	s8-v6mr13145705wmb.88.1534591607830; 
	Sat, 18 Aug 2018 04:26:47 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v5-v6sm3700155wru.60.2018.08.18.04.26.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:37 +0000
Message-Id: <20180818112638.10006-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818112638.10006-1-Martin.Jansa@gmail.com>
References: <20180818112638.10006-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 6/7] daq: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:47 -0000

* fixes:
checking for flex 2.4 or higher... yes
checking for bison... no
configure: WARNING: don't have both flex and bison; reverting to lex/yacc
checking for capable lex... insufficient
configure: error: Your operating system's lex is insufficient to compile
         libsfbpf. You should install both bison and flex.
         flex is a lex replacement that has many advantages,
         including being able to compile libsfbpf.  For more
         information, see http://www.gnu.org/software/flex/flex.html .

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/daq/daq_2.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index ec35175a08..42ffb17a1f 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
-DEPENDS = "libpcap libpcre libdnet"
+DEPENDS = "libpcap libpcre libdnet bison-native"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
            file://disable-run-test-program-while-cross-compiling.patch \
-- 
2.17.1


