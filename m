Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.671.1622820734381209675
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53150 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lpBnw-0008SE-Uk; Fri, 04 Jun 2021 18:32:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-ipython: Upgrade 7.24.0 -> 7.24.1
Date: Fri,  4 Jun 2021 18:31:59 +0300
Message-Id: <20210604153200.20570-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604153200.20570-1-leon.anavi@konsulko.com>
References: <20210604153200.20570-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.24.1:

- Allow to control if reporting hidden frames
- Fix typo in IPython.lib.pretty._seq_pprinter_factory doc

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.24.0.bb => python3-ipython_7.24.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.24.0.bb => python3-ipython_7.24.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.24.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.24.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.24.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.24.1.bb
index 1c11eeca08..96d50b76db 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.24.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "a171caa3d3d4c819a1c0742e3abecfd5a2b8ab525ca1c9f114b40b76b0679ab1"
+SRC_URI[sha256sum] = "9bc24a99f5d19721fb8a2d1408908e9c0520a17fff2233ffe82620847f17f1b6"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

