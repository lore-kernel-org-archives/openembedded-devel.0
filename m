Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.48201.1598857434510136562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdr7-0006cW-8o; Mon, 31 Aug 2020 10:03:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-hpack: Upgrade 3.0.0 -> 4.0.0
Date: Mon, 31 Aug 2020 10:03:17 +0300
Message-Id: <20200831070318.6573-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.0:

- Remove support for Python 2.7, 3.4 and 3.5.
- Add support for Python 3.8.
- Performance improvement of static header search. Use dict
  search instead of linear search.
- Fix debug output of headers during encoding.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-hpack_3.0.0.bb => python3-hpack_4.0.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hpack/{python3-hpack_3.0.0.bb => python3-hpack_4.0.0.bb} (61%)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
similarity index 61%
rename from meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
rename to meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
index 742f34f2f..afba98e4b 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
-SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
+SRC_URI[md5sum] = "27e01514ef06dc9fa0798d3dcb7de47c"
+SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
 
 inherit pypi setuptools3
-- 
2.17.1

