Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.4374.1592388940241002295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40086 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jlV6V-0001HB-Sf; Wed, 17 Jun 2020 13:15:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pocketsphinx: Inherit features_check
Date: Wed, 17 Jun 2020 13:15:31 +0300
Message-Id: <20200617101531.11242-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
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

Inherit features_check to fix unhandled-features-check warning
while executing do_package_qa.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-pocketsphinx_0.1.15.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
index 5aa0eb6bc..f7ffd9d26 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
 SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
 SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 features_check
 
 DEPENDS += "swig-native pulseaudio"
 REQUIRED_DISTRO_FEATURES += "pulseaudio"
-- 
2.17.1

