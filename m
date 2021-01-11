Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.36057.1610378727461042877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4Q-0006IU-C4; Mon, 11 Jan 2021 17:25:27 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-dnspython: Upgrade 2.0.0 -> 2.1.0
Date: Mon, 11 Jan 2021 17:25:07 +0200
Message-Id: <20210111152512.23506-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 2.1.0:

- End-of-line comments are now associated with rdata when read
  from text. For backwards compatibility with prior versions of
  dnspython, they are only emitted in to_text() when requested.
- Synchronous I/O is a bit more efficient, as we now try the I/O
  and only use poll() or select() if the I/O would block.
- The resolver cache classes now offer basic hit and miss
  statistics, and the LRUCache can also provide hits for every
  cache key.
- The resolver has a canonical_name() method.
- There is now a registration mechanism for EDNS option types.
- The default EDNS payload size has changed from 1280 to 1232.
- The SVCB, HTTPS, and SMIMEA RR types are now supported.
- TSIG has been enhanced with TKEY and GSS-TSIG support. Thanks
  to Nick Hall for writing this.
- Zones now can be updated via transactions.
- A new zone subclass, dns.versioned.Zone is available which has
  a thread-safe transaction implementation and support for keeping
  many versions of a zone.
- The zone file reading code has been adapted to use transactions,
  and is now a public API.
- Inbound zone transfer support has been rewritten and is available
  as dns.query.inbound_xfr() and dns.asyncquery.inbound_xfr(). It
  uses the transaction mechanism, and fully supports IXFR and AXFR.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dnspython_2.0.0.bb => python3-dnspython_2.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.0.0.bb => python3-dnspython_2.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
index a4e984619..20de09391 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.1.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[md5sum] = "42f922c9223dde0275e8c0695ead37da"
-SRC_URI[sha256sum] = "044af09374469c3a39eeea1a146e8cac27daec951f1f1f157b1962fc7cb9d1b7"
+SRC_URI[sha256sum] = "e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4"
 
 PYPI_PACKAGE_EXT = "zip"
 
-- 
2.17.1

