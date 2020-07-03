Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6910.1593768642163165070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1o-0007av-Db; Fri, 03 Jul 2020 12:30:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-python-vlc: Upgrade 3.0.9113 -> 3.0.10114
Date: Fri,  3 Jul 2020 12:30:15 +0300
Message-Id: <20200703093020.3514-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 3.0.10114:

- Generate bindings against 3.0.10
- Fix return types for callbacks
- Example usage of media callbacks
￼
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python-vlc_3.0.9113.bb => python3-python-vlc_3.0.10114.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.9113.bb => python3-python-vlc_3.0.10114.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
index 6d53e33812..7f8affb4f3 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "a3a7d64bb4c6c1cd5569173ceef9cb67"
-SRC_URI[sha256sum] = "5422b79d347b6419008ee91cfd9663edc37eaf2a0bd8fb9017d4cc2e5f249dda"
+SRC_URI[md5sum] = "17dba9a55903cdcae10814080fcadb8f"
+SRC_URI[sha256sum] = "c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b"
 
 inherit pypi setuptools3
-- 
2.17.1

