Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.9976.1591544661564710652
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 08:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=sw4yQtyL;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id ADC3460250;
	Sun,  7 Jun 2020 17:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591544659;
	bh=J3sdx+h5/WMQqpm36jdLN8fWI0xtL5jNgGCA90/xS3M=;
	h=From:To:Cc:Subject:Date:From;
	b=sw4yQtyLZs0ZPyj5Mq1HG3wuZT9RZ++8ZiRiHCiwBA8Yw/V+7qO32hkFpO2ydGNgu
	 n0zc0Q5skhAPNDrGSLhXy8i+IarLNizXQrmKmLgF/PWE7E43YZzz9Jxoy/97lg16Zr
	 WKEWfKJMJS+NiNERzphBS/447y4TX20Kg7gx11Ztt7/kUuc9pKCdIECPogP8F0ad+Y
	 5GpextWK2e372ODcxF+Ukl69dX9xvED07a0ssjEvYOBB3tl4gylK85aDmPp6pYHTsw
	 DttA6NvLELU05o2HbIhkJXtzBi9YJfZLYdZWQ4XQtx5Y8EKh2/ScMt/3IctEfOksz9
	 8CEs2qHFHynZA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 1/2] libnftnl: upgrade 1.1.6 -> 1.1.7
Date: Sun,  7 Jun 2020 17:44:14 +0200
Message-Id: <1591544655-21672-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See https://lwn.net/Articles/822353/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-filter/libnftnl/{libnftnl_1.1.6.bb => libnftnl_1.1.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.6.bb => libnftnl_1.1.7.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
index db42954..4ff00bf 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "ac0778e403eb51986ce19bcf1a6e8ae3cd83dcfa"
+SRCREV = "eedafeb6db330b8adff1b7cdd3dac325f9144195"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.7.4

