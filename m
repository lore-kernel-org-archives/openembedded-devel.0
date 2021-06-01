Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.55667.1622541999593275497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 03:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49790 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lo1IE-0002gA-Bh; Tue, 01 Jun 2021 13:06:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-ipython: Upgrade 7.23.1 -> 7.24.0
Date: Tue,  1 Jun 2021 13:06:30 +0300
Message-Id: <20210601100631.3277-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601100631.3277-1-leon.anavi@konsulko.com>
References: <20210601100631.3277-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.24.0:

- Fix an issue where %recall would both succeeded and print an
  error message it failed
- Drop support for NumPy 1.16 – practically has no effect beyond
  indicating in package metadata that we do not support it

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.23.1.bb => python3-ipython_7.24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.23.1.bb => python3-ipython_7.24.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.23.1.bb b/meta-python/recipes-devtools/python/python3-ipython_7.24.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.23.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.24.0.bb
index 492d922b9..1c11eeca0 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.24.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "714810a5c74f512b69d5f3b944c86e592cee0a5fb9c728e582f074610f6cf038"
+SRC_URI[sha256sum] = "a171caa3d3d4c819a1c0742e3abecfd5a2b8ab525ca1c9f114b40b76b0679ab1"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

