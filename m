Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3499.1591866621466372897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJE3-0007qt-Nd; Thu, 11 Jun 2020 12:10:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-pocketsphinx: 0.1.0 -> 0.1.15
Date: Thu, 11 Jun 2020 12:09:04 +0300
Message-Id: <20200611090904.29772-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611090904.29772-1-leon.anavi@konsulko.com>
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
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

Add pulseaudio as a dependency and required distro feature because
libsphinxad requires it. Upgrade to release 0.1.15:

- Add all travis osx
- Remove bdist_egg and bdist_msi
- Bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
index cb22040df..5aa0eb6bc 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
@@ -5,9 +5,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
 
-SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
-SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
+SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
+SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
 
 inherit pypi setuptools3
 
-DEPENDS += "swig-native"
+DEPENDS += "swig-native pulseaudio"
+REQUIRED_DISTRO_FEATURES += "pulseaudio"
-- 
2.17.1

