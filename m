Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.45434.1624273121255881772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 03:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54610 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvHdS-0001ID-OC; Mon, 21 Jun 2021 13:58:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-prompt-toolkit: Upgrade 3.0.18 -> 3.0.19
Date: Mon, 21 Jun 2021 13:58:24 +0300
Message-Id: <20210621105825.28736-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621105825.28736-1-leon.anavi@konsulko.com>
References: <20210621105825.28736-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.19:

- Make the flush method of the vt100 output implementation
  re-entrant (fixes an issue when using aiogevent).
- Fix off-by-one in `FormattedTextControl` mouse logic.
- Run `print_container` always in a thread (avoid interfering with
  possible event loop).
- Make sphinx autodoc generation platform agnostic (don't import
  Windows stuff when generating Sphinx docs).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ompt-toolkit_3.0.18.bb => python3-prompt-toolkit_3.0.19.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.18.bb => python3-prompt-toolkit_3.0.19.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.18.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.19.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.18.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.19.bb
index 3662875839..f384e216ee 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.18.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "e1b4f11b9336a28fa11810bc623c357420f69dfdb6d2dac41ca2c21a55c033bc"
+SRC_URI[sha256sum] = "08360ee3a3148bdb5163621709ee322ec34fc4375099afa4bbf751e9b7b7fa4f"
 
 inherit pypi setuptools3
 
@@ -18,6 +18,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-image \
+    ${PYTHON_PN}-asyncio \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

