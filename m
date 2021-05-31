Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.46789.1622481245030724224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lnlUH-00054C-4i; Mon, 31 May 2021 20:14:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-astroid: Upgrade 2.5.6 -> 2.5.7
Date: Mon, 31 May 2021 20:13:48 +0300
Message-Id: <20210531171350.11059-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531171350.11059-1-leon.anavi@konsulko.com>
References: <20210531171350.11059-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.7:

- Fix six.with_metaclass transformation so it doesn't break user
  defined transformations
- Fix detection of relative imports
- Fix inference of instance attributes defined in base classes
- Update `infer_named_tuple` brain to reject namedtuple
  definitions that would raise ValueError
- Do not set instance attributes on builtin object()
- Fix some spurious cycles detected in ``context.path`` leading to
  more cases that can now be inferred
- Add ``kind`` field to ``Const`` nodes, matching the structure of
  the built-in ast Const. The kind field is "u" if the literal is
  a u-prefixed string, and ``None`` otherwise.
- Fix property inference in class contexts for properties defined
  on the metaclass
- Update enum brain to fix definition of __members__ for
  subclass-defined Enums
- Update random brain to fix a crash with inference of some
  sequence elements
- Fix inference of attributes defined in a base class that is an
  inner class
- Allow inferring a return value of None for non-abstract empty
  functions and functions with no return statements (implicitly
  returning None)
- scm_setuptools has been added to the packaging.
- Astroid's tags are now the standard form ``vX.Y.Z`` and not
  ``astroid-X.Y.Z`` anymore.
- Add initial support for Pattern Matching in Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.5.6.bb => python3-astroid_2.5.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.6.bb => python3-astroid_2.5.7.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.6.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.7.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.6.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.7.bb
index 62c54a46b..c805dc4dc 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.7.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8a398dfce302c13f14bab13e2b14fe385d32b73f4e4853b9bdfb64598baa1975"
+SRC_URI[sha256sum] = "d66a600e1602736a0f24f725a511b0e50d12eb18f54b31ec276d2c26a0a62c6a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

