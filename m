Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.3850.1599327016295763018
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 10:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kEc10-0003Np-4j; Sat, 05 Sep 2020 20:30:14 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kEc10-0009Q2-0c; Sat, 05 Sep 2020 20:30:14 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-networking][PATCH 2/3] mdns: set CVE_PRODUCT to "apple:mdnsresponder"
Date: Sat,  5 Sep 2020 20:29:50 +0300
Message-Id: <20200905172951.31808-2-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200905172951.31808-1-mikko.rapeli@bmw.de>
References: <20200905172951.31808-1-mikko.rapeli@bmw.de>
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20200905172951.31808-2-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

This is used in CVEs like
https://nvd.nist.gov/vuln/detail/CVE-2015-7987

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
index 88521c1b2..a87b02a78 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
@@ -25,6 +25,8 @@ SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${P
 SRC_URI[md5sum] = "ac766013bbcb323e9db4c80805b2552a"
 SRC_URI[sha256sum] = "b86f4816b4145915198e7c5bf0bc56dbbfd960e9a4518bb6486baa40cdcca7e6"
 
+CVE_PRODUCT = "apple:mdnsresponder"
+
 PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
-- 
2.20.1

