Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.43120.1598622707752399652
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBenC-0004K0-Hh; Fri, 28 Aug 2020 16:51:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-luma-core: Upgrade 1.15.0 -> 1.16.0
Date: Fri, 28 Aug 2020 16:51:28 +0300
Message-Id: <20200828135131.26321-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828135131.26321-1-leon.anavi@konsulko.com>
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.16.0:

- Embedded font parallel device (for upcoming HD44780, Winstar
  character devices)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.15.0.bb => python3-luma-core_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.15.0.bb => python3-luma-core_1.16.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
index 17445e727..ce1e7ba03 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "9c890fa8e387a035ff0d1ae96a0715f1"
-SRC_URI[sha256sum] = "e0e14c762695fb8758e8b15cfd28cd4c1618bf2fd93157c8770a2e8e0e254ae5"
+SRC_URI[md5sum] = "52ab2cdce4222aa71d9ac254a806dccc"
+SRC_URI[sha256sum] = "ca523f606f8fff2c9843d48b415a0a748bb2c96270eccac97d9caa9ae6810c94"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

