Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.4484.1585942966563480520
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=JEwkwpcI;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 2C55360323;
	Fri,  3 Apr 2020 21:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585942965;
	bh=+ou4HI082yfjv1PbPuUXFGtMaWefEadQXAwnMAMw+Xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JEwkwpcIBWb7C3DszxZQke2/5rGAvkbyyXRROzUZ6RV9tPlXNz8qxcg81fCxPWPD5
	 qbsBR0BmnGJ4wk2zAqClPsIc6kVtsuy2zAtfAsbAxzBheWKaN5AqkTKWWCZz9I1rCo
	 inLpQP6bl1nxSyhYLcVC6UOyAndvVxpE25jyRTV1RtNkVYJCxePCxE/4FCzk47rUTr
	 Xc0X99LPIdwCPSZFPC8aqnoLvBicERQ1DjaohMw8sR/orZ2Ar2D9iLiu6VUdWe9OD9
	 lpiD2bymUBFS/qw3JBkI32vePqLqSf0ton/Zh84QC4SvY4Kf8WKJRAnfgFDhscXZgO
	 YH1mYhIbKud2g==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 2/5] python3-pyroute2: upgrade 0.5.9 -> 0.5.11
Date: Fri,  3 Apr 2020 21:42:40 +0200
Message-Id: <1585942963-20703-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
References: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../python/{python3-pyroute2_0.5.9.bb => python3-pyroute2_0.5.11.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.9.bb => python3-pyroute2_0.5.11.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
index 90d9486..58b538a 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "4ee568832c98c39253230293a2ca3d59"
-SRC_URI[sha256sum] = "240ed116fabef02c284cc40d27986e629f02aa788311a8059905b8988752d5b7"
+SRC_URI[md5sum] = "7005db01604663fc2ecc089925980e05"
+SRC_URI[sha256sum] = "05e959f1a89d715158b91fe83b67946a4441e5e098cc225f4df78a3765ac4af2"
 
 inherit setuptools3 pypi
 
-- 
2.7.4

