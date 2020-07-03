Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6912.1593768646348622791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1s-0007av-4U; Fri, 03 Jul 2020 12:30:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-pyasn1-modules: Upgrade 0.2.7 -> 0.2.8
Date: Fri,  3 Jul 2020 12:30:19 +0300
Message-Id: <20200703093020.3514-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 0.2.8:

- Improve test routines for modules that use certificate extensions
- Improve test for RFC3709 with a real world certificate
- Added RFC7633 providing TLS Features Certificate Extension
- Added RFC7229 providing OIDs for Test Certificate Policies
- Added tests for RFC3280, RFC3281, RFC3852, and RFC4211
- Added RFC6960 providing Online Certificate Status Protocol (OCSP)
- Added RFC6955 providing Diffie-Hellman Proof-of-Possession Algorithms
- Updated the handling of maps for use with openType for RFC 3279
- Added RFC6486 providing RPKI Manifests
- Added RFC6487 providing Profile for X.509 PKIX Resource Certificates
- Added RFC6170 providing Certificate Image in the Internet X.509 Public
  Key Infrastructure, and import the object identifier into RFC3709.
- Added RFC6187 providing Certificates for Secure Shell Authentication
- Added RFC6482 providing RPKI Route Origin Authorizations (ROAs)
- Added RFC6664 providing S/MIME Capabilities for Public Keys
- Added RFC6120 providing Extensible Messaging and Presence Protocol
  names in certificates
- Added RFC4985 providing Subject Alternative Name for expression of
  service names in certificates
- Added RFC5924 providing Extended Key Usage for Session Initiation
  Protocol (SIP) in X.509 certificates
- Added RFC5916 providing Device Owner Attribute
- Added RFC7508 providing Securing Header Fields with S/MIME
- Update RFC8226 to use ComponentPresentConstraint() instead of the
  previous work around
- Add RFC2631 providing OtherInfo for Diffie-Hellman Key Agreement
- Add RFC3114 providing test values for the S/MIME Security Label
- Add RFC5755 providing Attribute Certificate Profile for Authorization
- Add RFC5913 providing Clearance Attribute and Authority Clearance
  Constraints Certificate Extension
- Add RFC5917 providing Clearance Sponsor Attribute
- Add RFC4043 providing Internet X.509 PKI Permanent Identifier
- Add RFC7585 providing Network Access Identifier (NAI) Realm Name
  for Certificates
- Update RFC3770 to support openType for attributes and reported errata
- Add RFC4334 providing Certificate Extensions and Attributes for
  Authentication in PPP and Wireless LAN Networks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...yasn1-modules_0.2.7.bb => python3-pyasn1-modules_0.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.7.bb => python3-pyasn1-modules_0.2.8.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
index f2a836b04a..dd39e8c405 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
-SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
+SRC_URI[md5sum] = "107e1ece7d0a41d782f69f8a95a4d9bc"
+SRC_URI[sha256sum] = "905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

