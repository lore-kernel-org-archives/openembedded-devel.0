Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.3851.1599327019937277493
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 10:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kEc13-0003Re-Em; Sat, 05 Sep 2020 20:30:18 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kEc13-0009V6-2C; Sat, 05 Sep 2020 20:30:17 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-networking][PATCH 3/3] mdns: add BSD-3-Clause to LICENSE
Date: Sat,  5 Sep 2020 20:29:51 +0300
Message-Id: <20200905172951.31808-3-mikko.rapeli@bmw.de>
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
 Message-ID: 20200905172951.31808-3-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

The LICENSE file in source tree says:

The majority of the source code in the mDNSResponder project is licensed
under the terms of the Apache License, Version 2.0, available from:
   <http://www.apache.org/licenses/LICENSE-2.0>

To accommodate license compatibility with the widest possible range
of client code licenses, the shared library code, which is linked
at runtime into the same address space as the client using it, is
licensed under the terms of the "Three-Clause BSD License".

The Linux Name Service Switch code, contributed by National ICT
Australia Ltd (NICTA) is licensed under the terms of the NICTA Public
Software Licence (which is substantially similar to the "Three-Clause
BSD License", with some additional language pertaining to Australian law).

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
index a87b02a78..086b40869 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
 DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
 HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
-LICENSE = "Apache-2.0"
+LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.20.1

