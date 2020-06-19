Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2100.1592554304191179379
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCMG-0007GG-Ai; Fri, 19 Jun 2020 11:26:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-prompt-toolkit: Upgrade 2.0.10 -> 3.0.5
Date: Fri, 19 Jun 2020 11:10:10 +0300
Message-Id: <20200619081011.25051-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619081011.25051-1-leon.anavi@konsulko.com>
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.5 and add HOMEPAGE. The new release brings:

New features:
- (almost) 100% type annotated.
- Native asyncio instead of custom event loops.
- Added shift-based text selection.
- Added many more vt100 ANSI sequences and keys.
- Improved control/shift key support in Windows.
- No Mypy errors in prompt_toolkit anymore.
- Added `set_exception_handler` optional argument to
  `PromptSession.prompt()`.

Breaking changes:
- Python 2 support has been dropped. Minimal Python version is now
  3.6, although 3.7 is preferred (because of ContextVars).
- Native asyncio, so some async code becomes slightly different.
- The active `Application` became a contextvar. Which means that
  it should be propagated correctly to the code that requires it.
  However, random other threads or coroutines won't be able to know
  what the current application is.
- The dialog shortcuts API changed. All dialog functions now return
  an `Application`. You still have to call either `run()` or
  `run_async` on the `Application` object.
- The way inputhooks work is changed.
- `patch_stdout` now requires an `Application` as input.
- `ShiftControl` has been replaced with `ControlShift` and `s-c`
  with `c-s` in key bindings. Aliases for backwards-compatibility
  have been added.

Fixes:
- Bugfix in invalidate code. `PromptSession` was invalidating the
  UI continuously.
- Add uvloop support.
- Forwarded `set_exception_handler` in `Application.run` to the
  `run_async` call.
- Bugfix in `NestedCompleter` when there is a leading space.
- Bugfix in mouse handling on Windows.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mpt-toolkit_2.0.10.bb => python3-prompt-toolkit_3.0.5.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_2.0.10.bb => python3-prompt-toolkit_3.0.5.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
index d9ece8dab..b4d20c2cd 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Library for building powerful interactive command lines in Python"
+HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
-SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
+SRC_URI[md5sum] = "96ba0be8d3145eb70e3da25654987670"
+SRC_URI[sha256sum] = "563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

