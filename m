Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.20795.1598540127192915297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJF-0001it-3O; Thu, 27 Aug 2020 17:55:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-flask-restful: Upgrade 0.3.7 -> 0.3.8
Date: Thu, 27 Aug 2020 17:55:02 +0300
Message-Id: <20200827145504.29147-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827145504.29147-1-leon.anavi@konsulko.com>
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.8:

- Add Python 3.8 support
- Fix wrongly parsed Decimal fields
- Fix overridden response when calling abort with Response
- Various small fixes and updates to documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-restful_0.3.7.bb => python3-flask-restful_0.3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-restful_0.3.7.bb => python3-flask-restful_0.3.8.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
rename to meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
index ad2757838..3de916afd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.8.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/flask-restful/flask-restful"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
 
-SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
-SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
+SRC_URI[md5sum] = "e8051ff104ab4b3b867ba18d28953fae"
+SRC_URI[sha256sum] = "5ea9a5991abf2cb69b4aac19793faac6c032300505b325687d7c305ffaa76915"
 
 inherit pypi setuptools3
 
-- 
2.17.1

