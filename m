Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8741.1606413845387951627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 10:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54480 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiLci-0008NL-1O; Thu, 26 Nov 2020 20:04:05 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-yarl: Upgrade 1.6.2 -> 1.6.3
Date: Thu, 26 Nov 2020 20:03:47 +0200
Message-Id: <20201126180347.13763-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126180347.13763-1-leon.anavi@konsulko.com>
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.3:

- No longer loose characters when decoding incorrect
  percent-sequences (like %e2%82%f8). All non-decodable
  percent-sequences are now preserved.
- Provide x86 Windows wheels.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.6.2.bb => python3-yarl_1.6.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.6.2.bb => python3-yarl_1.6.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
index dbb5d23bd2..01682a46d4 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
 
-SRC_URI[md5sum] = "65c3346f694e37f45045f4e29a60d280"
-SRC_URI[sha256sum] = "c45b49b59a5724869899798e1bbd447ac486215269511d3b76b4c235a1b766b6"
+SRC_URI[sha256sum] = "8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

