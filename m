Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.4789.1591701089477899093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 04:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jicAA-00081E-MK; Tue, 09 Jun 2020 14:11:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-wheel: Upgrade 0.33.6 -> 0.34.2
Date: Tue,  9 Jun 2020 14:10:50 +0300
Message-Id: <20200609111050.32307-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609111050.32307-1-leon.anavi@konsulko.com>
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.34.2 and inherit pypi.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wheel_0.33.6.bb => python3-wheel_0.34.2.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.33.6.bb => python3-wheel_0.34.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
index 025b2eea9..8633a4fc9 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
@@ -4,13 +4,10 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752"
 
-SRC_URI = "git://github.com/pypa/wheel.git"
-SRCREV ?= "b227ddd5beaba49294017d061d501f6d433393b0"
+SRC_URI[md5sum] = "ce2a27f99c130a927237b5da1ff5ceaf"
+SRC_URI[sha256sum] = "8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96"
 
-
-inherit setuptools3
-
-S = "${WORKDIR}/git"
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

