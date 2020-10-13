Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7602.1602579567464110371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9V-0002BF-LP; Tue, 13 Oct 2020 11:59:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-prompt-toolkit: Upgrade 3.0.7 -> 3.0.8
Date: Tue, 13 Oct 2020 11:59:13 +0300
Message-Id: <20201013085914.31580-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013085914.31580-1-leon.anavi@konsulko.com>
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.8:

- Added `validator` parameter to `input_dialog`.
- Cope with stdout not having a working `fileno`.
- Handle situation when /dev/null is piped into stdin, or when
  stdin is closed somehow.
- Fix for telnet/ssh server: `isatty` method was not implemented.
- Display correct error when a tuple is passed into
  `to_formatted_text`.
- Pass along WORD parameter in `Document._is_word_before_cursor_complete`.
  Fixes some key bindings.
- Expose `ProgressBarCounter` in shortcuts module.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.7.bb => python3-prompt-toolkit_3.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.7.bb => python3-prompt-toolkit_3.0.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
index 7b0d1a0696..0debba48d2 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "f1b34c688ef7dccccb951130f008f6fe"
-SRC_URI[sha256sum] = "822f4605f28f7d2ba6b0b09a31e25e140871e96364d1d377667b547bb3bf4489"
+SRC_URI[md5sum] = "cf3ca19873fa9e7f6162296cf6bae419"
+SRC_URI[sha256sum] = "25c95d2ac813909f813c93fde734b6e44406d1477a9faef7c915ff37d39c0a8c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

