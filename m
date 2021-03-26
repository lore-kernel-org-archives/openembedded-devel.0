Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.12193.1616764360567639323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 06:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPmGS-0004oR-Br; Fri, 26 Mar 2021 15:12:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ruamel-yaml: Upgrade 0.16.13 -> 0.17.0
Date: Fri, 26 Mar 2021 15:12:27 +0200
Message-Id: <20210326131231.5839-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.0:

- this release no longer supports Python 2.7, most if not all
  Python 2 specific code is removed. The 0.17.x series is the
  last to  support Python 3.5 (this also allowed for removal of
  the dependency  on ``ruamel.std.pathlib``)
- remove Python2 specific code branches and adaptations (u-strings)
- prepare % code for f-strings using ``_F``
- allow PyOxidisation
- replaced Python 2 compatible enforcement of keyword arguments
  with '*'
- the old top level *functions* ``load``, ``safe_load``,
  ``round_trip_load``, ``dump``, ``safe_dump``,
  ``round_trip_dump``, ``scan``, ``parse``, ``compose``, ``emit``,
  ``serialize`` as well as their ``_all`` variants for
  multi-document streams, now issue a ``PendingDeprecationning``
  (e.g. when run from pytest, but also Python is started with
  ``-Wd``). Use the methods on ``YAML()``, which have been extended.
- fix for issue 376: indentation changes could put literal/folded
  scalar to start before the ``#`` column of a following comment.
  Effectively making the comment part of the scalar in the output.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-ruamel-yaml_0.16.13.bb => python3-ruamel-yaml_0.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.13.bb => python3-ruamel-yaml_0.17.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.0.bb
index 39795b784..fd99f8566 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "bb48c514222702878759a05af96f4b7ecdba9b33cd4efcf25c86b882cef3a942"
+SRC_URI[sha256sum] = "3572505e63dd35b5dea62cd0386d03c4f2a53da29a3af09f428114cc85c564aa"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

