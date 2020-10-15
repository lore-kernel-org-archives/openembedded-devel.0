Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7083.1602746535286976722
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 00:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40534 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSxaU-0005mO-GO; Thu, 15 Oct 2020 10:22:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-yappi: Upgrade 1.2.5 -> 1.3.0
Date: Thu, 15 Oct 2020 10:22:00 +0300
Message-Id: <20201015072201.13634-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.3.0:

- Add support for profiling gevent applications
- A new API has been defined: `set_context_backend` which accepts
  `greenlet` as a backend.
- Fix various issues

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yappi_1.2.5.bb => python3-yappi_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.2.5.bb => python3-yappi_1.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
index 366dec3dc1..f87c3fb63a 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[md5sum] = "83237494e7d22df2a31935a1e6650fa6"
-SRC_URI[sha256sum] = "ad5fa4caf2859e480ffc4ec3e85615a6f7dea852c8f035f2db723f824ed4ba11"
+SRC_URI[md5sum] = "6dde41b116566cbe1575e41a1e376f74"
+SRC_URI[sha256sum] = "a443240f4a776fa1be04430bf423dbf09615c05eba34f4a2a6af344a7ce8ff61"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

