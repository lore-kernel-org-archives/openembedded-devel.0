Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88E426C3AA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 20:40:20 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h13so8777304lfc.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2019 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xY55+eqEk/RpmxTNYsEu8RGXe62OdCPB6McNNxR1M2A=;
	b=i1qLku+bjfRR09LKxTLAcW8MZ6BYA/H1KhnXBJ+F067cNirg4cpu6kRPUj3oqcMKDy
	9dzxoKM3vipwMSAPw6EeQg8CfqhkltxNUwfEn0mzQf8WkfVPOV81zB3Qk+/RYd4nTcS4
	AdOWmKaz0CPFesKkeEqZy8ZJHo1VPbheoEkugEP+ktfSExvefMdzhrwOMlbgQEF+dbAU
	Xbdt5XcSb+fD8msEe1mkq6X1QdGU2lyNhHkVeCaCJw4r+T9Q7PwATcN+aRRijfbPxNUm
	g0wnDFmyXj/cL5HVJBvumByVkupcAjyvuvfS6DbKVCSUBLgX6h8QR6ZQYvr0Wmt4aa7m
	jZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xY55+eqEk/RpmxTNYsEu8RGXe62OdCPB6McNNxR1M2A=;
	b=YwrBKpFRECJdWrjDrP3XC7wt4buCbkA7wITbQUDRvx+mAXfgZ4+Ra48s433xBlGM2D
	BUSI9VOaTz0Qc+gRkhWNLglJKTtzy129Ix9oKCkp7L5o1mt+KrZzpIUb4Si/ggNeIcmR
	NMPyBYY2ZLn3vEGlxBkU4esqRw4qvzu0NscSGM9XXzbtt9pSeN81oEnOX3LMz/1fA9Hu
	OdB9h9nwyKHNW30q81r6VjfYtMcX0pdDFy4R8FyP+Ix/vta42XsJcE6mjRVOwiPJ6ScD
	XCTaI1p0JERXeAAMtrI9Em30Z9vUR60ORP4G7tTKz+GYSsaMk8ib2ykcyMl+/dzCzrkB
	zBuA==
X-Gm-Message-State: APjAAAW6a5uZyyxrByJwd2onH0w8RhF/xNxcXxlnHhReFLSRjMuOEPKQ
	/MBw16t2E93OqQDFeP5nZIV9O4e/DkQ=
X-Google-Smtp-Source: APXvYqz9KMS7jalLYQixiFDgRd56u8nWDTW5N/WvvId0yY9/yxWCXPWhQ0JuMd2u2Up3ykKLJNl2dA==
X-Received: by 2002:a19:196:: with SMTP id 144mr35249125lfb.35.1558298420629; 
	Sun, 19 May 2019 13:40:20 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y25sm3481276lfy.59.2019.05.19.13.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:40:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2019 22:40:18 +0200
Message-Id: <20190519204018.14033-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] python-ldap: update to 3.2.0
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
X-List-Received-Date: Sun, 19 May 2019 20:40:20 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python-ldap_2.4.45.bb => python-ldap_3.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-devtools/python/{python-ldap_2.4.45.bb => python-ldap_3.2.0.bb} (85%)

diff --git a/meta-networking/recipes-devtools/python/python-ldap_2.4.45.bb b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
similarity index 85%
rename from meta-networking/recipes-devtools/python/python-ldap_2.4.45.bb
rename to meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
index dde8a52dc..d10f11bbc 100644
--- a/meta-networking/recipes-devtools/python/python-ldap_2.4.45.bb
+++ b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -15,8 +15,8 @@ PYPI_PACKAGE = "python-ldap"
 inherit pypi setuptools
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
-SRC_URI[md5sum] = "6108e189a44eea8bc7d1cc281c222978"
-SRC_URI[sha256sum] = "824fde180a53772e23edc031c4dd64ac1af4a3eade78f00d9d510937d562f64e"
+SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"
+SRC_URI[sha256sum] = "7d1c4b15375a533564aad3d3deade789221e450052b21ebb9720fb822eccdb8e"
 
 do_configure_prepend() {
     sed -i -e 's:^library_dirs =.*::' setup.cfg
-- 
2.17.1


