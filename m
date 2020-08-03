Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11967.1596463544308276911
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b5z-00024S-JX; Mon, 03 Aug 2020 17:05:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-regex: Upgrade 2020.6.8 -> 2020.7.14
Date: Mon,  3 Aug 2020 17:05:19 +0300
Message-Id: <20200803140520.23250-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.7.14:

- Added \h as an alias to [[:blank:]].

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2020.6.8.bb => python3-regex_2020.7.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.6.8.bb => python3-regex_2020.7.14.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
index d09f63840..5c608c989 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "a991f73b0ccfe8f6e9a99bd1bc9071b1"
-SRC_URI[sha256sum] = "e9b64e609d37438f7d6e68c2546d2cb8062f3adb27e6336bc129b51be20773ac"
+SRC_URI[md5sum] = "c3a53929c3797289566368be4b6b964a"
+SRC_URI[sha256sum] = "3a3af27a8d23143c49a3420efe5b3f8cf1a48c6fc8bc6856b03f638abc1833bb"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

