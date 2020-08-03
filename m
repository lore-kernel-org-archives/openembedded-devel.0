Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7796.1596448704212036754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 02:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40162 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2XEc-0003NX-Lr; Mon, 03 Aug 2020 12:58:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyalsaaudio: Upgrade 0.8.4 -> 0.9.0
Date: Mon,  3 Aug 2020 12:57:57 +0300
Message-Id: <20200803095759.9591-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803095759.9591-1-leon.anavi@konsulko.com>
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.9.0:

- Added keyword arguments for channels, format, rate and periodsize
- Deprecated setchannel, setformat, setrate and setperiodsize

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pyalsaaudio_0.8.4.bb => python3-pyalsaaudio_0.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyalsaaudio_0.8.4.bb => python3-pyalsaaudio_0.9.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
rename to meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
index 987010a14..90050fb14 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
-SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
+SRC_URI[md5sum] = "48c40424a79c2568676a41643d93f1f7"
+SRC_URI[sha256sum] = "3ca069c736c8ad2a3047b5033468d983a2480f94fad4feb0169c056060e01e69"
 
 DEPENDS += "alsa-lib"
 
-- 
2.17.1

