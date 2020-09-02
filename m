Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2864.1599035635695536650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDODJ-0004fH-Ip; Wed, 02 Sep 2020 11:33:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pycurl: Upgrade 7.43.0.5 -> 7.43.0.6
Date: Wed,  2 Sep 2020 11:33:42 +0300
Message-Id: <20200902083342.22101-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902083342.22101-1-leon.anavi@konsulko.com>
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 7.43.0.6:

- Improve SSL backend detection on various systems
- Add support for libcurl's multiple SSL backend functionality
- Add support for several libcurl options

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pycurl_7.43.0.5.bb => python3-pycurl_7.43.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.43.0.5.bb => python3-pycurl_7.43.0.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
index 5a1c1797a..0437a6cc9 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.6.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6 \
                     "
 
-SRC_URI[md5sum] = "0b387d4609ed20c88baede8579a4d425"
-SRC_URI[sha256sum] = "ec7dd291545842295b7b56c12c90ffad2976cc7070c98d7b1517b7b6cd5994b3"
+SRC_URI[md5sum] = "3e121d895101022c30619e1bbf97eb97"
+SRC_URI[sha256sum] = "8301518689daefa53726b59ded6b48f33751c383cf987b0ccfbbc4ed40281325"
 
 inherit pypi setuptools3
 
-- 
2.17.1

