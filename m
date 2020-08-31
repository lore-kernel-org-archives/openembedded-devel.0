Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.48151.1598857428454418613
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdqy-0006cW-27; Mon, 31 Aug 2020 10:03:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-prompt-toolkit: Upgrade 3.0.6 -> 3.0.7
Date: Mon, 31 Aug 2020 10:03:13 +0300
Message-Id: <20200831070318.6573-5-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.7:

- New "placeholder" parameter added to `PromptSession`.
- The "respond to CPR" logic has been moved from the `Input` to
  `Output` classes (this does clean up some code).
- Bugfix in shift-selection key bindings.
- Fix hight calculation of `FormattedTextControl` when line
  wrapping is turned on.
- Fixes for SSH server:
  * Missing encoding property
  * Fix failure in "set_line_mode" call
  * Handle `BrokenPipeError`

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.6.bb => python3-prompt-toolkit_3.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.6.bb => python3-prompt-toolkit_3.0.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
index 806e67c09..7b0d1a069 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "e50cb328715b338480d8d29dda54ff5d"
-SRC_URI[sha256sum] = "7630ab85a23302839a0f26b31cc24f518e6155dea1ed395ea61b42c45941b6a6"
+SRC_URI[md5sum] = "f1b34c688ef7dccccb951130f008f6fe"
+SRC_URI[sha256sum] = "822f4605f28f7d2ba6b0b09a31e25e140871e96364d1d377667b547bb3bf4489"
 
 inherit pypi setuptools3
 
-- 
2.17.1

