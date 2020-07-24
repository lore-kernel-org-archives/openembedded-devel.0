Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3470.1595586932292140892
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv35-0006km-1C; Fri, 24 Jul 2020 13:35:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-colorlog: Upgrade 4.1.0 -> 4.2.1
Date: Fri, 24 Jul 2020 13:35:14 +0300
Message-Id: <20200724103515.21420-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.2.1:

- Fix: product description on pypi is not formatted. For details:
  https://github.com/borntyping/python-colorlog/issues/67

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_4.1.0.bb => python3-colorlog_4.2.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.1.0.bb => python3-colorlog_4.2.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
index ea4c575eb..a4aaa3cb6 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
@@ -7,5 +7,5 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[md5sum] = "25f79b76421132e2a9e08da15e4e0a73"
-SRC_URI[sha256sum] = "30aaef5ab2a1873dec5da38fd6ba568fa761c9fa10b40241027fa3edea47f3d2"
+SRC_URI[md5sum] = "a01336efc6f54e58e3ed4f331d76c2f0"
+SRC_URI[sha256sum] = "75e55822c3a3387d721579241e776de2cf089c9ef9528b1f09e8b04d403ad118"
-- 
2.17.1

