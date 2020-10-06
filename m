Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10308.1601975140074218998
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 02:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59138 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPiug-0007g5-De; Tue, 06 Oct 2020 12:05:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-nocaselist: Upgrade 1.0.2 -> 1.0.3
Date: Tue,  6 Oct 2020 12:05:25 +0300
Message-Id: <20201006090526.24310-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006090526.24310-1-leon.anavi@konsulko.com>
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.3:

- Test: Fixed issue with virtualenv raising AttributeError during
  installtest on Python 3.4.
- Added checking for no expected warning. Adjusted a testcase to
  accomodate the new check.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-nocaselist_1.0.2.bb => python3-nocaselist_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.2.bb => python3-nocaselist_1.0.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
index 8509cd0c94..1119c7f38e 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "10e58542c1225aff3f057e89e9ae4394"
-SRC_URI[sha256sum] = "3cfe964c436991cd6bd9f2cf23375c484ec7cf0c7488471381eff13a4fdac902"
+SRC_URI[md5sum] = "42ba878fd70611cf345c61edd83f5fb0"
+SRC_URI[sha256sum] = "7e6decb7d85563b9044913c9087ef4b691bc3da4d7ad1d88968cdea409553326"
 
 inherit pypi setuptools3
-- 
2.17.1

