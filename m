Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14123.1599140129062767678
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 06:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47596 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDpOh-0007vv-2s; Thu, 03 Sep 2020 16:35:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-isort: Upgrade 5.4.2 -> 5.5.0
Date: Thu,  3 Sep 2020 16:35:18 +0300
Message-Id: <20200903133520.19437-1-leon.anavi@konsulko.com>
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

- Fixed: isort: off comment doesn't work, if it's the top comment
  in the file.
- Fixed: reverse_relative setting doesn't have any effect when
  combined with force_sort_within_sections.
- Fixed: --skip can error in the case of projects that contain
  recursive symlinks.
- Fixed: ensure_newline_before_comments doesn't work if comment is
  at top of section and sections don't have lines between them.
- Fixed: comments in imports with ";" can keep isort from
  recognizing import line.
- Fixed: As imports removed when combine_star is set.
- Fixed: --float-to-top has no effect if no import is already at
  the top.
- Fixed: isort never settles on module docstring + add import.
- Fixed: Error raised when repo contains circular symlinks.
- Fixed: noqa comment is moved from star import to constant
  import.
- Fixed: Incorrect placement of import additions.
- Fixed: isort5 throws error when stdin used on Windows with
  deprecated args.
- Added support for specifying config file when using git hook.
- Added support for coloring diff output.
- New multi-line grid mode without parentheses.
- Extensive profile testing.
- Proprety based testing applied to code snippets.
- Create automated integration test that includes full code base
  of largest OpenSource isort users.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.4.2.bb => python3-isort_5.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.4.2.bb => python3-isort_5.5.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
index 6b1cee40d..ee13d76e5 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "59592b6e14beba48149d651e900e3815"
-SRC_URI[sha256sum] = "d488ba1c5a2db721669cc180180d5acf84ebdc5af7827f7aaeaa75f73cf0e2b8"
+SRC_URI[md5sum] = "9560df531409e67ac8796e98ffcb6124"
+SRC_URI[sha256sum] = "0906e0e7092e060c05de709ad172e1ec1b26aa27fdd4e8093f257890cd881d18"
 
 inherit pypi setuptools3
 
-- 
2.17.1

