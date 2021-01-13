Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8611.1610548001334547742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6d-0000Li-RO; Wed, 13 Jan 2021 16:26:40 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-pyzmq: Upgrade 19.0.2 -> 20.0.0
Date: Wed, 13 Jan 2021 16:26:26 +0200
Message-Id: <20210113142626.27599-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.0.0:

- Update bundled libzmq to 4.3.3
- Socket.bind() and Socket.connect() can now be used as context
  managers
- Better error when libzmq is bundled and fails to be loaded
- Hold GIL while calling zmq_curve_ functions, which may fix
  apparent threadsafety issues

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyzmq_19.0.2.bb => python3-pyzmq_20.0.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_19.0.2.bb => python3-pyzmq_20.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
index 3c4e32b5e..a668eb11e 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
@@ -8,8 +8,7 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[md5sum] = "200abc1a75bdcfff7adf61304f46f55e"
-SRC_URI[sha256sum] = "296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438"
+SRC_URI[sha256sum] = "824ad5888331aadeac772bce27e1c2fbcab82fade92edbd234542c4e12f0dca9"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.17.1

