Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5147.1599046102396726885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQw6-0000FC-6t; Wed, 02 Sep 2020 14:28:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-pyzmq: Upgrade 17.1.0 -> 19.0.2
Date: Wed,  2 Sep 2020 14:28:02 +0300
Message-Id: <20200902112808.18547-1-leon.anavi@konsulko.com>
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

- Cython backend: Build Cython extensions with language level
  "3str" (requires Cython 0.29)
- Cython backend: You can now cimport zmq
- Asyncio: Fix memory leak in Poller
- Log: Much improved logging in zmq.log (see Asynchronous Logging
  via PyZMQ)
- Log: add python -m zmq.log entrypoint
- Sources generated with Cython 0.29.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyzmq_17.1.0.bb => python3-pyzmq_19.0.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_17.1.0.bb => python3-pyzmq_19.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
index 2369f067e..3c4e32b5e 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[md5sum] = "aecdfc328193fbd81f6dc23228319943"
-SRC_URI[sha256sum] = "2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920b9dee4"
+SRC_URI[md5sum] = "200abc1a75bdcfff7adf61304f46f55e"
+SRC_URI[sha256sum] = "296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.17.1

