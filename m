Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.208.1616517232283760843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyZ-0000KS-I2; Tue, 23 Mar 2021 18:33:52 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-isort: Upgrade 5.7.0 -> 5.8.0
Date: Tue, 23 Mar 2021 18:33:16 +0200
Message-Id: <20210323163317.26664-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.8.0:

- Fix: as import comments can in some cases be duplicated.
- Fix: extra newline added with float-to-top, after skip, in
  some cases.
- Fix: incorrect placement of noqa comments with multiple from
  imports.
- Fix: in some cases different length limits for dos based line
  endings.
- Export MyPY type hints.
- Identified import statements now return runnable code.
- Added "wemake" profile.
- Parallel (-j) now defaults to number of CPU cores if no value
  is provided.
- Added a safeguard against accidental usage against /.
- Provide a flag --overwrite-in-place to ensure same file handle
  is used after sorting.
- Added support for extending skips with --extend-skip and
  --extend-skip-glob.
- Auto identification and skipping of some invalid import
  statements.
- Ability to reverse the import sorting order.
- Added ability to push star imports to the top to avoid
  overriding explicitly defined imports.
- Doc: Skip doesn't support plain directory names, but skip_glob
  does.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.7.0.bb => python3-isort_5.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.7.0.bb => python3-isort_5.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.8.0.bb
index 9f234ee46..36de825d2 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.8.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e"
+SRC_URI[sha256sum] = "0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

