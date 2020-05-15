Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.14693.1589553950233198529
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=bQGV1vel;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vty/=65=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Nrn83Jknz2k
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 16:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589553948;
	bh=n10+ClJPv4Kv+xdP56LFFkf62odZKfg0NVeCxtHiQzs=;
	h=From:To:Subject:Date:From;
	b=bQGV1velI0+kci+mkrP2a/Jr8HXXszsfTxFP4sdOdaSz6tgYOuF63ITZkRqA8hjVT
	 MlmR6qvhnTcTaOV7xlfb3O4i/MIhofLX/obzjJSlOCBn7OuPDGsNLezRWT7zaRDSZ8
	 l8/+Tkw7hnTlOa3nTrBcPKOZzGyoPUnvsQWX+JQ4Fq/LWIIe1JkbFO6bdQFiwyZoW4
	 Rx2QsG+HgHHE8QxZBeCh/3d4xlN5BFiCVJtmZsRidbDGFIS24j4Oa2+jHl9kEIIYfE
	 +0B1l0fCYh7viDiKLjqxmVKcPoBfEkVbCRKlOktXbOC65NXInSR1gwUeN2byp2q2hS
	 pc+MpE9x6aN/C2DRI6g3rB4kabn2/pZxgPILSCEYuPjLmNGErDFr0TYz5STowNZyIb
	 wqXr0FsJju78AJhWfTkqLn/hg/eGdag6bysLy7eazGkhlYDcUZuSTIWSHpgPjOmxIF
	 65n2rTOOGxirxZquThbsv++e2FdxyHWNUbw7uAJv4eZUq4LCuWGqId93Kz2VFh+PWZ
	 vlho3NsA/A6JQ/6r9f4bZ4VWH3pTtY1sgBt/7yaIRE+xDsJvXPPJ+xI7fsD6aj3gt7
	 uEXIfZANcpjuDKFusFHqJSWtOM0vByGzkdPd2+owgslGwxmKem/MCexFoOBIa/hpf0
	 UqN53oO09uTzc3QiTo2V0wJA=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][warrior][PATCH] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Fri, 15 May 2020 17:45:47 +0300
Message-Id: <20200515144547.8912-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Adrian Bunk <bunk@kernel.org>

(From OE-Core rev: 5b71a3f3d1bca6b52f53b97971131a6771618420)

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
Recipe moved to OE-core in zeus.
---
 ...reless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2020.04.29.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2020.04.29.bb
index ded44b3d4..7c9c6e5c3 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2020.04.29.bb
@@ -5,8 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
-SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
+SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
 
 inherit bin_package allarch
 
-- 
2.17.1

