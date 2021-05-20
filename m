Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11175.1621528969947409607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 09:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58812 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ljlkw-0007FW-MP; Thu, 20 May 2021 19:42:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pywbem: Upgrade 1.1.3 -> 1.2.0
Date: Thu, 20 May 2021 19:42:35 +0300
Message-Id: <20210520164237.31557-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.4
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

Upgrade to release 1.2.0 with bug fixes and enhancements:

- Finalized the pywbem mock support
- Logging: Added a value 'off' for the log destination in the
  pywbem.configure_logging() function that disables logging
- Improved exception handling during the parsing of CIM-XML
  responses received from a WBEM server
- Reduced memory consumption of CIM objects and CIM types by
  defining their attributes to use Python slots
- Reduced memory consumption of CIM objects by using lazy
  initialization of dictionary-type attributes
- Unsupported versions for CIM infrastructure, DTD or protocol
  version returned in CIM-XML responses from WBEM servers are
  now raised as new exceptions pywbem
- In the makefile, added an ignore list for issues reported by
  safety along with the reasons why each issue is ignored
- Improvements in the log messages of the MOFCompiler class
- Added a conn_close() method to the pywbem.MOFCompiler class
  that closes the underlying connection
- Added 'make perftest' to run performance tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pywbem_1.1.3.bb => python3-pywbem_1.2.0.bb}    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.1.3.bb => python3-pywbem_1.2.0.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.2.0.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.2.0.bb
index fd73419536..988dae1335 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.2.0.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "2abb6443f4debae56af7abefadb9fa5b8af9b53fc9bcf67f6c01a78db1064300"
+SRC_URI[sha256sum] = "8ef48185e0adbaeb9bd5181c4c5de951f6d58d54e2e1d7e87a9834e10eabe957"
 
 inherit pypi setuptools3 update-alternatives
 
@@ -24,6 +24,7 @@ DEPENDS += " \
     ${PYTHON_PN}-ply-native \
     ${PYTHON_PN}-pyyaml-native \
     ${PYTHON_PN}-six-native \
+    ${PYTHON_PN}-wheel-native \
 "
 
 RDEPENDS_${PN}_class-target += "\
@@ -37,6 +38,9 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-nocasedict \
+    ${PYTHON_PN}-nocaselist \
+    ${PYTHON_PN}-yamlloader \
 "
 
 ALTERNATIVE_${PN} = "mof_compiler"
-- 
2.17.1

