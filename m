Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.46326.1597070613100355071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591Q-0008Tw-0V; Mon, 10 Aug 2020 17:43:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-prompt-toolkit: Upgrade 3.0.5 -> 3.0.6
Date: Mon, 10 Aug 2020 17:43:17 +0300
Message-Id: <20200810144318.17106-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.6:

New features:
- The SSH/Telnet adaptors have been refactored and improved in
  several ways.
  * Handle terminal types for both telnet and SSH sessions.
  * Added pipe input abstraction. (base class for `PosixPipeInput`
    and `Win32PipeInput`).
  * The color depth logic has been refactored and moved to the
    `Output` implementations. Added `get_default_color_depth`
    method to `Output` objects.
  * All line feets are now preceded by a carriage return in the
    telnet connection stdout.
- Introduce `REPLACE_SINGLE` input mode for Vi key bindings.
- Improvements to the checkbox implementation:
    * Hide the scrollbar for a single checkbox.
    * Added a "checked" setter to the checkbox.
- Expose `KeyPressEvent` in key_binding/__init__.py (often used in
  type annotations).
- The renderer has been optimized so that no trailing spaces are
  generated (this improves copying in some terminals).

Fixes:
- Ignore F21..F24 key bindings by default.
- Fix auto_suggest key bindings when suggestion text is empty.
- Bugfix in SIGWINCH handling.
- Handle bug in HSplit/VSplit when the number of children is zero.
- Bugfix in CPR handling in renderer. Proper cancellation of
  pending tasks.
- Ensure rprompt aligns with input.
- Use `sys.stdin.encoding` for decoding stdin stream.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.5.bb => python3-prompt-toolkit_3.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.5.bb => python3-prompt-toolkit_3.0.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
index 78fdbca4f..806e67c09 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "96ba0be8d3145eb70e3da25654987670"
-SRC_URI[sha256sum] = "563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8"
+SRC_URI[md5sum] = "e50cb328715b338480d8d29dda54ff5d"
+SRC_URI[sha256sum] = "7630ab85a23302839a0f26b31cc24f518e6155dea1ed395ea61b42c45941b6a6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

