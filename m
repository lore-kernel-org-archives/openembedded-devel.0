Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.4821.1591701072207457864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 04:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jic9t-00081E-MT; Tue, 09 Jun 2020 14:11:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-tornado: Upgrade 6.0.3 -> 6.0.4
Date: Tue,  9 Jun 2020 14:10:46 +0300
Message-Id: <20200609111050.32307-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609111050.32307-1-leon.anavi@konsulko.com>
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
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

Upgrade to release 6.0.4. Update the checksum of the LICENCE file
although the license hasn't been changed and remains Apache
Software License 2.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tornado_6.0.3.bb => python3-tornado_6.0.4.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.0.3.bb => python3-tornado_6.0.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
index 04f6314d0..db6b56744 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
@@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
-SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
-SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
+SRC_URI[md5sum] = "cf39425f3d7eba9a54287f3e795a2f23"
+SRC_URI[sha256sum] = "0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc"
 
 inherit pypi setuptools3
 
-- 
2.17.1

