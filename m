Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10195.1603278977701443343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6J-0007Sd-1L; Wed, 21 Oct 2020 14:16:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-dominate: Upgrade 2.5.2 -> 2.6.0
Date: Wed, 21 Oct 2020 14:16:04 +0300
Message-Id: <20201021111609.28237-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.0:

- Add get_current() to return the current active element in a with
  context

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dominate_2.5.2.bb => python3-dominate_2.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.5.2.bb => python3-dominate_2.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
index 2044338942..b7c738d656 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[md5sum] = "4a249c71cb009815923e9a47fa03ca08"
-SRC_URI[sha256sum] = "456facce7a7ccfd9363948109cf1e978d48c58e46a46b01c71b4c0adc73b1928"
+SRC_URI[md5sum] = "9f714324ca99eee98bb3c3cdbe838de6"
+SRC_URI[sha256sum] = "76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

