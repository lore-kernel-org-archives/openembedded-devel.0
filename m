Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.145845.1598053517378367115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gie-0003AI-P5; Sat, 22 Aug 2020 02:45:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/11] python3-pywbem: Upgrade 0.17.4 -> 1.0.2
Date: Sat, 22 Aug 2020 02:44:54 +0300
Message-Id: <20200821234504.719-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.0.2:

- Fixed erronously raised HeaderParseError when WBEM server
  returns Content-type: text/xml. This content-type is valid
  according to DSP0200. Added testcases.
- Fixed handling of ReturnQueryResultClass=True in
  WBEMConnection.OpenQueryInstances().
- Mock: In the mock support, fixed multiple errors in the mocked
  OpenQueryInstances(), and added testcases for it.
- Mock: Added support for more ways the output parameters can be
  returned in method providers: The container for the output
  parameters can now also be a Mapping (including pywbem’s
  internal NocaseDict or nocasedict.NocaseDict), in addition to
  just the built-in dict. The values in such a Mapping container
  can now also be CIMParameter objects, in addition to just the
  CIM data values. This provides consistency with the way the
  input parameters of the method provider are represented.

Removed the wbemcli command that was deprecated in pywbem 0.15.0.
The recommended replacement is the pywbemcli command from the
'pywbemtools' package.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pywbem_0.17.4.bb => python3-pywbem_1.0.2.bb} | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.4.bb => python3-pywbem_1.0.2.bb} (78%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
similarity index 78%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
index a804b0cc0..da731989d 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.0.2.bb
@@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[md5sum] = "b65c03026bf2174e58e3e47a5e7e4825"
-SRC_URI[sha256sum] = "5b54b65a5434bb16432415743c0d154feee0c6d7a8a2fee208719c67d6d24c97"
+SRC_URI[md5sum] = "0f171e365e294554f8e7624ccf511067"
+SRC_URI[sha256sum] = "66d8ec82d30f2b95d8b4bd51659429066c2879d3f46292561f5fdbc7fed10f3d"
 
 inherit pypi setuptools3 update-alternatives
 
@@ -27,12 +27,6 @@ DEPENDS += " \
     ${PYTHON_PN}-six-native \
 "
 
-do_install_append() {
-    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-
-    rm -f ${D}${bindir}/*.bat
-}
-
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
@@ -46,10 +40,8 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-xml \
 "
 
-ALTERNATIVE_${PN} = "mof_compiler pywbemcli wbemcli"
+ALTERNATIVE_${PN} = "mof_compiler"
 ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
-ALTERNATIVE_TARGET[pywbemcli] = "${bindir}/pywbemcli"
-ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
 
 ALTERNATIVE_PRIORITY = "60"
 
-- 
2.17.1

