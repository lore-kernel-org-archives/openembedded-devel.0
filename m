Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 72CF57FC59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 17:06:24 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y17so20977888wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KDu+95KJCvJPeTioAFQsYbbnjhc0pO16CeDpFuq7X5w=;
	b=zbgnQ/gkcxjYPnWoO82jKo3iuHvdU2RPd4qUmW8VYhhyVEMKNKJi/kDJFvkLj2uGMK
	A10lWvfovLS2p13+PIjeepSfAYnEDVOW1ZwUoMqI1rEvLF9Ukr64bGB1OJbcIDdxdxyD
	7tWr19YlP8oMsvRvs160rU8c0EIkD8k/5IciLFOdRiqUujKSxB4DkwmWubZUTypjQGvu
	6X2PkOnf4vP2zSey0zigyEYuZaawYI+ebwZK+ql4dGbhQnTwNyTE/iDsrylGkbr1zc4c
	WnEWJlEnyv/E+5RR8PaygAW7Fks6UpVaokYgxg/aaCGVKGAzKDNO/+W2lvwmn+G8z5bN
	Hxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KDu+95KJCvJPeTioAFQsYbbnjhc0pO16CeDpFuq7X5w=;
	b=PD1wH5tAgFssGT980p7FPRDb78V4U9ZFeCKxysrHg0og+ovfMX17sznSKSLXfgaaqS
	zaPH3anbqtwRH5asQwJJDCNCB+tC4QgNIzAnTeQArSv5tcqBujJF3HKVg7lHdK4/LKw+
	KQR2+oC/3CckErOmrK3TBv42x2sXyjnya6W4sw/dtzq50GdHVmUYtTPmNBvJduolIl3V
	78DJGCTN1FsLkM7sVE3OinuMMQxjiW03Qj4hUE6mjTjrZliVzZGHp+D9MgsatRIXYLNu
	zHXIgdX6yuja0ekEXpyYaC9Os3fofrSpFE4n2fKPcT3nkRPg8/7EOjBGC7Zj8giV9NK7
	Cqog==
X-Gm-Message-State: APjAAAW6jTw2zjROdiF56zRru7rQfpBr6GNnsDfpSjbY7dcHM+NMlm2d
	IPGjoKcfFfmzmy5TH8RFjhY10f2fbWA=
X-Google-Smtp-Source: APXvYqxI1l/h4v9WWrcwUbalmU0IptDWgV33Olj/PoFD5BvZrxJGSARtZ5OOxtKSxqPNxUVWznuTGg==
X-Received: by 2002:adf:f802:: with SMTP id s2mr4448449wrp.201.1575997584766; 
	Tue, 10 Dec 2019 09:06:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q3sm3998443wrn.33.2019.12.10.09.06.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 09:06:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 17:06:16 +0000
Message-Id: <20191210170618.29764-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210170618.29764-1-ross.burton@intel.com>
References: <20191210170618.29764-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH][meta-python 3/5] python-coloredlogs: don't use relative paths
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
X-List-Received-Date: Tue, 10 Dec 2019 17:06:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-coloredlogs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc b/meta-python/recipes-devtools/python/python-coloredlogs.inc
index f43bea1f74..bdb1d752c5 100644
--- a/meta-python/recipes-devtools/python/python-coloredlogs.inc
+++ b/meta-python/recipes-devtools/python/python-coloredlogs.inc
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e
 inherit pypi
 
 do_compile_prepend() {
-    sed -ie "s/find_pth_directory(),/'',/g" setup.py
+    sed -ie "s/find_pth_directory(),/'',/g" ${S}/setup.py
 }
 
 do_install_append() {
-- 
2.20.1


