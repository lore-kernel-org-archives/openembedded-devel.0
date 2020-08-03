Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11828.1596463543794173933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b5y-00024S-KX; Mon, 03 Aug 2020 17:05:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-dnspython: Upgrade 1.16.0 -> 2.0.0
Date: Mon,  3 Aug 2020 17:05:18 +0300
Message-Id: <20200803140520.23250-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 2.0.0:

- Python 3.6 or newer is required.
- Rdata is now immutable. Use dns.rdata.Rdata.replace() to make
  a new Rdata based on an existing one.
- dns.resolver.resolve() has been added, allowing control of
  whether search lists are used. dns.resolver.query() is retained
  for backwards compatibility, but deprecated. The default for
  search list behavior can be set at in the resolver object with
  the use_search_by_default parameter. The default is False.
- DNS-over-TLS is supported with dns.query.tls().
- DNS-over-HTTPS is supported with dns.query.https(), and the
  resolver will use DNS-over-HTTPS for a nameserver which is an
  HTTPS URL.
- Basic query and resolver support for the Trio, Curio, and
  asyncio asynchronous I/O libraries has been added in
  dns.asyncquery and dns.asyncresolver. This API should be viewed
  as experimental as asynchronous I/O support in dnspython is
  still evolving.
- TSIG now defaults to using SHA-256.
- Basic type info has been added to some functions. Future
  releases will have comprehensive type info.
- from_text() functions now have a relativize_to parameter.
- python-cryptography is now used for DNSSEC.
- Ed25519 and Ed448 signatures are now supported.
- A helper for NSEC3 generating hashes has been added.
- SHA384 DS records are supported.
- Rdatasets and RRsets are much faster.
- dns.resolver.resolve_address() has been added, allowing easy
  address-to-name lookups.
- dns.reversename functions now allow an alternate origin to be
  specified.
- The repr form of Rdatasets and RRsets now includes the rdata.
- A number of standard resolv.conf options are now parsed.
- The nameserver and port used to get a response are now part of
  the resolver’s Answer object.
- The NINFO record is supported.
- The dns.hash module has been removed; just use Python’s native
  hashlib module.
- Rounding is done in the standard python 3 fashion; dnspython
  1.x rounded in the python 2 style on both python 2 and 3.
- The resolver will now do negative caching if a cache has been
  configured.
- TSIG and OPT now have rdata types.
- The class for query messages is now QueryMessage. Class Message
  is now a base class, and is also used for messages for which we
  don’t have a better class. Update messages are now class
  UpdateMessage, though class Update is retained for compatibility.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-dnspython_1.16.0.bb => python3-dnspython_2.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_1.16.0.bb => python3-dnspython_2.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
index 66cd88363..a4e984619 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
-SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
+SRC_URI[md5sum] = "42f922c9223dde0275e8c0695ead37da"
+SRC_URI[sha256sum] = "044af09374469c3a39eeea1a146e8cac27daec951f1f1f157b1962fc7cb9d1b7"
 
 PYPI_PACKAGE_EXT = "zip"
 
-- 
2.17.1

