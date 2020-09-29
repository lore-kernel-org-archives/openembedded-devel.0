Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.16190.1601368016052159575
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2020 01:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46838 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kNAyK-0004Ji-3L; Tue, 29 Sep 2020 11:26:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-regex: Upgrade 2020.7.14 -> 2020.9.27
Date: Tue, 29 Sep 2020 11:26:44 +0300
Message-Id: <20200929082645.32560-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.9.27:

- Fix Memory Error - regex.findall. The problem was caused by a
  lazy repeat looping forever, growing the backtracking stack.
  Greedy repeats were OK.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-regex_2020.7.14.bb => python3-regex_2020.9.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.7.14.bb => python3-regex_2020.9.27.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
index 5c608c989f..fb891f8716 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c3a53929c3797289566368be4b6b964a"
-SRC_URI[sha256sum] = "3a3af27a8d23143c49a3420efe5b3f8cf1a48c6fc8bc6856b03f638abc1833bb"
+SRC_URI[md5sum] = "195f5e867e9f87a39f921ad0e5761a61"
+SRC_URI[sha256sum] = "a6f32aea4260dfe0e55dc9733ea162ea38f0ea86aa7d0f77b15beac5bf7b369d"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

