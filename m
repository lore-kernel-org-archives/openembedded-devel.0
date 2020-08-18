Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.68139.1597764898949255847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k83dZ-0004rN-Ng; Tue, 18 Aug 2020 18:34:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-python-vlc: Upgrade 3.0.10114 -> 3.0.11115
Date: Tue, 18 Aug 2020 18:34:41 +0300
Message-Id: <20200818153444.15728-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153444.15728-1-leon.anavi@konsulko.com>
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.11115:

- Position is now an enum
- Add Media.get_meta tests
- Fix typo in play_buffer example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython-vlc_3.0.10114.bb => python3-python-vlc_3.0.11115.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.10114.bb => python3-python-vlc_3.0.11115.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
index 7f8affb4f..014509d55 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "17dba9a55903cdcae10814080fcadb8f"
-SRC_URI[sha256sum] = "c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b"
+SRC_URI[md5sum] = "422fd025294af2e55dfdcf9bc7d7dbac"
+SRC_URI[sha256sum] = "a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b"
 
 inherit pypi setuptools3
-- 
2.17.1

