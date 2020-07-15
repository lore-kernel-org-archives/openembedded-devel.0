Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9070.1594826712838413588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 08:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jvjHT-0006eC-CW; Wed, 15 Jul 2020 18:25:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-netaddr: Upgrade 0.7.20 -> 0.8.0
Date: Wed, 15 Jul 2020 18:24:49 +0300
Message-Id: <20200715152450.29018-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715152450.29018-1-leon.anavi@konsulko.com>
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 0.8.0:

* Fixed weak reference support in classes with ``__slots__``
* Added ``__bytes__`` to ``IPAddress`` for intuitive usage,
  thanks to Michael Belousov.
* Added ``format()`` function to EUI, thanks to Omer Anson.
* Added ``IPNetwork.netmask`` property setter, thanks to
  Naveen Nathan.
* Added support for IABs in the ``40:D8:55`` OUI, thanks to
  Brian Maissy.
* Drastically optimized ``spanning_cidr()``, thanks to Brian
  Maissy.
* Fixed ``"x.x.x.x/x" in IPNetwork`` tests, thanks to xpac1985.
* Added support for passing iterables of ``IPRange`` to ``IPSet``
  and ``cidr_merge()``, based on a patch by Henry Stern.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-netaddr_0.7.20.bb => python3-netaddr_0.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.7.20.bb => python3-netaddr_0.8.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
index bc7598c46..a120b24f1 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
 
-SRC_URI[md5sum] = "f254d6b61e07123f9e2643b1dcbd03df"
-SRC_URI[sha256sum] = "d09252e5aec3913815d77eb8e8ea8fa6eb33521253e52f977f6abaa964776f3e"
+SRC_URI[md5sum] = "34cad578473b66ad77bc3b2a7613ed4a"
+SRC_URI[sha256sum] = "d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243"
 
 inherit pypi setuptools3
 
-- 
2.17.1

