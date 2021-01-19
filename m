Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.14807.1611077882521666724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux7-0001eq-1C; Tue, 19 Jan 2021 19:38:01 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-yappi: Upgrade 1.3.0 -> 1.3.2
Date: Tue, 19 Jan 2021 19:37:46 +0200
Message-Id: <20210119173746.24694-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.2:

- Add support for Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yappi_1.3.0.bb => python3-yappi_1.3.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.3.0.bb => python3-yappi_1.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
index f87c3fb63..7c3f0fd4b 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[md5sum] = "6dde41b116566cbe1575e41a1e376f74"
-SRC_URI[sha256sum] = "a443240f4a776fa1be04430bf423dbf09615c05eba34f4a2a6af344a7ce8ff61"
+SRC_URI[sha256sum] = "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3a8da8d"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

