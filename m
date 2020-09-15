Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9148.1600160598465401910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rs-0007I7-73; Tue, 15 Sep 2020 12:03:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-nocaselist: Upgrade 1.0.1 -> 1.0.2
Date: Tue, 15 Sep 2020 12:02:58 +0300
Message-Id: <20200915090303.14367-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.2:

- Fixed an AttributeError during unpickling.
- Optimized pickling a NocaseList object by serializing only the
  original list, but not the second lower-cased list. This
  optimization is only implemented for Python 3.
- Added tests for pickling and unpickling.
- Suppressed new Pylint issue 'super-with-arguments', because
  this package still supports Python 2.7.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-nocaselist_1.0.1.bb => python3-nocaselist_1.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.1.bb => python3-nocaselist_1.0.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
index 9a6b24e75..8509cd0c9 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "a2654766ee683906ba6c77ac1e89f556"
-SRC_URI[sha256sum] = "87dc37f97cf52f6e10e1e4a82f56359067462a713222b52976045bf227a40eda"
+SRC_URI[md5sum] = "10e58542c1225aff3f057e89e9ae4394"
+SRC_URI[sha256sum] = "3cfe964c436991cd6bd9f2cf23375c484ec7cf0c7488471381eff13a4fdac902"
 
 inherit pypi setuptools3
-- 
2.17.1

