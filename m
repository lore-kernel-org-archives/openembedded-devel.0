Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15870.1593011811023858089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo78t-00035d-9Q; Wed, 24 Jun 2020 18:16:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-netaddr: Upgrade 0.7.19 -> 0.7.20
Date: Wed, 24 Jun 2020 18:16:22 +0300
Message-Id: <20200624151628.547-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.20:

- Fixed returning from an iterator on Python 3.7+, by Sergey
  Kozlov.
- Fixed Python 3.8 SyntaxWarning on using `is not` with a string
  literal, by Stefan Nordhausen.
- Fixed DeprecationWarnings by using raw strings for escape
  characters used in regexes, by Sean McGinnis.
- Improved IPGlob documentation, by obkmeta.
- Fixed exception creation in corner cases by explicitly passin
  error message params as tuples, by Matthias Urlichs.
- Stopped manually replacing shebang of an included script.
- Stopped using __file__ in all code that's expected to run in
  environments that don't support it (like PyOxidizer-produced
  binaries).
- Updated all databases included in the package.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-netaddr_0.7.19.bb => python3-netaddr_0.7.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.7.19.bb => python3-netaddr_0.7.20.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
index 75460caa7..bc7598c46 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.20.bb
@@ -2,8 +2,8 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
 
-SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
-SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
+SRC_URI[md5sum] = "f254d6b61e07123f9e2643b1dcbd03df"
+SRC_URI[sha256sum] = "d09252e5aec3913815d77eb8e8ea8fa6eb33521253e52f977f6abaa964776f3e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

