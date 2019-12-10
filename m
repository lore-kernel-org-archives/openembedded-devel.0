Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 86E9F7F8C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 17:06:22 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q10so20956580wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=870osHHpTNh7FRA9QnLOis5y/beoai3w3NLqpWJobCw=;
	b=Jdj338gpuRyj0asSZLqvNmkGpkksyaN1gHo1rhoJILGMKTpt+T2QznNOqvsc2U4j/Y
	LlMbTxgeCGsVjMdB2MO5kosiHW8YqqdO8YusVCOeYtXTedHM6pBuG64jRb13AlFfNJSl
	7qwrd20XhIzyhan2LQSmsDVjC24K5SCFdYRLhEc9a2lnGy/D0xX1RIYO6lKTYgEh1D9I
	MLrltydbm3m9ePUS/uTthzQ8nIdrcn9JrYGqINwhuTm5Fwa48M2G6zTNfeCuVEEGQGbQ
	3tjfhiYKT82rT3WABuVwHcXqakTvg5iVa6GJr4O2lHuPmCH1RBCfmSYkrYksILL9Dsdd
	On6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=870osHHpTNh7FRA9QnLOis5y/beoai3w3NLqpWJobCw=;
	b=Kw2qN4bqdgi5Sp45BH+hh1Iyt4R2QrfkZe2reB/KjyzkxOAL53GBZgwsYQVm3ijVzB
	7e0FcL4h92w3aMWWT+n+7ftHD37LuuFr/1WDthiDoeHzmrYZKyJCb02EfgV7CRgtv2jV
	XxlqjRZ5Exd/HIK5XIFBoqs3Srmu21mNg7mEajwwrPufuyHHfkodTbM12xQV8pW5YumA
	mcsyTEcfAirOfONqK2am3iN+GZHzWS8gl8x6Kk3G/7G5lrUueBQXeDFPY8g0xM0X1Ia6
	N4g3x2cCGVCIy+CLkdO9KT1rZklExfsYFyR6fcEf3M6JZQVEMJfU5yPcNZTr4oaqxrs5
	cZGQ==
X-Gm-Message-State: APjAAAXY0fy7gp57gHnIWG1drZEKU65+WqKOnVgz81dGecW5aKLjnqrS
	rhYr/KaGC98UVy4iQnMN/uBIwWbmkyY=
X-Google-Smtp-Source: APXvYqxKSP/dce3/gBC/mDWWAKTWz829M5sr3o8CYGvvlYhrc22AFldbupz7xEWV3a/6xp+JXKIolw==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr4275011wrm.324.1575997582914; 
	Tue, 10 Dec 2019 09:06:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q3sm3998443wrn.33.2019.12.10.09.06.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 09:06:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 17:06:14 +0000
Message-Id: <20191210170618.29764-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][meta-python 1/5] python-slip-dbus: don't use relative paths
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
X-List-Received-Date: Tue, 10 Dec 2019 17:06:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-slip-dbus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus.inc b/meta-python/recipes-devtools/python/python-slip-dbus.inc
index 9e726b5b92..ab7b1bb06c 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus.inc
+++ b/meta-python/recipes-devtools/python/python-slip-dbus.inc
@@ -21,7 +21,7 @@ SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
 SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
 
 do_compile_prepend() {
-    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
+    sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
 }
 
 RDEPENDS_${PN} += "\
-- 
2.20.1


