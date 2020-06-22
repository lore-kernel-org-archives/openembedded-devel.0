Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14491.1592822159521561919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJnw-0005ty-Jl; Mon, 22 Jun 2020 13:35:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-cmd2: Upgrade 0.9.23 -> 1.1.0
Date: Mon, 22 Jun 2020 13:35:35 +0300
Message-Id: <20200622103542.27830-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.0:

- Fixed issue where subcommand usage text could contain a
  subcommand alias instead of the actual name
- Fixed bug in ArgparseCompleter where fill_width could become
  negative if token_width was large relative to the terminal
  width.
- Made ipy consistent
- with_argument_list, with_argparser, and
  with_argparser_and_unknown_args wrappers now pass kwargs through
  to their wrapped command function.
- Added table_creator module for creating richly formatted tables.
- Added new exceptions to the public API
- Added explicit handling of SystemExit. If a command raises this
  exception, the command loop will be gracefully stopped.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_0.9.23.bb => python3-cmd2_1.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.23.bb => python3-cmd2_1.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
index 803ca4a40..bc74b5ab5 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "6db66a06210d5f1edb44693b887ed62b"
-SRC_URI[sha256sum] = "8ad12ef3cc46d03073c545b6e80a3f84a5921f6653073a60e7d9a7ff3b352c9e"
+SRC_URI[md5sum] = "2b4a3b15ac52d239664c40c2d661b0c7"
+SRC_URI[sha256sum] = "d233b5ad4b9ee264a43fb14668f287d25f998f4b443a81b4efdfd292f1a77108"
 
 inherit pypi setuptools3
 
-- 
2.17.1

