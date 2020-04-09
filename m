Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.8294.1586437520524083118
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 06:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=uphKTwFr;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 2317860307;
	Thu,  9 Apr 2020 15:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586437519;
	bh=MlTtdMnF3Ey2XNX8Gj/DzWNXXDsu0pix/DTVHO5NCFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uphKTwFr3i9QyGh+NCJ5/MTiOlfKC1IYRjzuGGU2BZeQN00WGjOtObGwh/Euf6u5y
	 V6RuZCQHHTANMQMQgUEZvGoOLYc43/obv1PgyHI6gsSnYIKbMj/ye1hG7WrXHoGriq
	 R8GOqDMbD+rdHlpkLGbr4sjuikWJnxhEpO842TuapjpkWqD9C5sv/+FFU2Saabozz7
	 M5kRNmzg2NJ4gWoaaJxSMIa3XJbqPMt0iBk+9GgOgQoiIKyxsnZWpoFXqtRHXn0Dqd
	 XZ/zAe4MtwHdXSEaGNemcPeroIjQw2yyN5YLY258UqYFUzKOIG0ccquVmCTicAKdpA
	 EeT4fFCOIoD3w==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 2/2] python3-dominate: upgrade 2.4.0 -> 2.5.1
Date: Thu,  9 Apr 2020 15:05:10 +0200
Message-Id: <1586437510-4405-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586437510-4405-1-git-send-email-pjtexier@koncepto.io>
References: <1586437510-4405-1-git-send-email-pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../python/{python3-dominate_2.4.0.bb => python3-dominate_2.5.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.4.0.bb => python3-dominate_2.5.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
index e76eefb..dd8c596 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
@@ -2,8 +2,8 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[md5sum] = "27d3aa7e0d67902c505e248e705e5e2e"
-SRC_URI[sha256sum] = "a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd67e59c"
+SRC_URI[md5sum] = "35eeb6b5587c8c9a51cd22c83e07ac49"
+SRC_URI[sha256sum] = "9b05481605ea8c0afd0a98c0156a9fb78d9c406368d66b3e6fedf36920fb9d78"
 
 inherit pypi setuptools3
 
-- 
2.7.4

