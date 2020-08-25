Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10494.1598349259386414493
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 02:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54770 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAVeh-0003Eu-8j; Tue, 25 Aug 2020 12:54:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/3] doxygen: Upgrade 1.8.17 -> 1.8.20
Date: Tue, 25 Aug 2020 12:54:05 +0300
Message-Id: <20200825095407.18867-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.8.20:

- Add configuration setting to have docstrings not as preformatted
  text but as normal documentation
- Bug fix: void return type reported as not documented
- Bug fix: Doxywizard 1.8.19 (Windows): Source code directory
  seems to be ignored
- Bug fix: The Doxygen uses too much memory (or has probably a
  memory leak)
- Bug fix: Doxygen doesn't stop on errors
- Bug fix: C++ grouped functions in namespace have disappeard
- Improvement of line count for e.g. warnings
- Improved layout on the bibliography page
- Updated the swedish language translation to 1.8.19

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb} (79%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
similarity index 79%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
index 45de71826..d4ac3b720 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
-SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
+SRC_URI[md5sum] = "8729936a843232a66fe970ef65f3c3e4"
+SRC_URI[sha256sum] = "e0db6979286fd7ccd3a99af9f97397f2bae50532e4ecb312aa18862f8401ddec"
 
 inherit cmake python3native
 
-- 
2.17.1

