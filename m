Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.6138.1587821577025285861
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 06:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Ps9ZdmSh;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id B13A660133;
	Sat, 25 Apr 2020 15:32:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1587821571;
	bh=QL5gqeYClqzIwYNs2P/S5ImqJ4otya1Ddz6JdT9lw8s=;
	h=From:To:Cc:Subject:Date:From;
	b=Ps9ZdmShf5930oezbFqlsSCkL+xp0RU7+TNDku36P7XgROZgRWYq2/hx2CIEWdmuO
	 4pEuempHBHMScgERM6C4Xh1M2BbjvmFVPZOfemHwa+IQQ808YYEvV5AEo9FmgAq6Or
	 su52nyWslNhWDgmCKJb0rx7ExG5jic/GShOMrKwtoT+BwO0yH30fGy8mNIs7uRSFdZ
	 cWrc6joC9UWyH9vCBMOi18u3KIhf6AU5pTEzVNDzgm4AtiUVdibQhkBYulk0vThsRU
	 w/3QGpgLVN4gEtV2cjlvDfMmd30CS+chQbAC0gerZFUG484vvBWVO18UnQJco51ygI
	 wq1to/CCYTt5Q==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] pegtl: upgrade 2.8.2 -> 2.8.3
Date: Sat, 25 Apr 2020 15:32:47 +0200
Message-Id: <1587821567-1422-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/taocpp/PEGTL/releases/tag/2.8.3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/pegtl/{pegtl_2.8.2.bb => pegtl_2.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_2.8.2.bb => pegtl_2.8.3.bb} (87%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.8.2.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
similarity index 87%
rename from meta-oe/recipes-extended/pegtl/pegtl_2.8.2.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
index 42aa655..92741d8 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.8.2.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE="https://github.com/taocpp/PEGTL"
 LICENSE="MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6a5195f720a8d436a4148e0cb8660400"
 
-SRCREV = "ede3ce17aef7da27648b195dc77814cb1d3c313d"
+SRCREV = "47e878ad4fd72c91253c9d47b6f17e001ca2dfcf"
 SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=2.x \
           "
 
-- 
2.7.4

