Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3718.1592905906438589470
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfai-0006Iq-0l; Tue, 23 Jun 2020 12:51:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/11] python3-sh: Upgrade 1.12.14 -> 1.13.1
Date: Tue, 23 Jun 2020 12:51:27 +0300
Message-Id: <20200623095136.24854-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.13.1:

- regression fix if _fg=False
- minor Travis CI fixes
- bugfix for boolean long options not respecting _long_prefix
- fix deprecation warning on Python 3.6 regexes
- _pass_fds and _close_fds special kwargs for controlling file
  descriptor inheritance in child.
- more efficiently closing inherited fds
- bugfix where passing invalid dictionary to _env will cause a
  mysterious child 255 exit code.
- bugfix where _in using 0 or sys.stdin wasn't behaving like a
  TTY, if it was in fact a TTY.
- bugfix where help(sh) raised an exception
- bugfix fixing broken interactive ssh tutorial from docs
- change to automatic tty merging into a single pty if
  _tty_in=True and _tty_out=True
- introducing _unify_ttys, default False, which allows explicit
  tty merging into single pty
- contrib command for ssh connections requiring passwords
- performance fix for polling output too fast when using _iter
- execution contexts can now be used in python shell
- bugfix ErrorReturnCode instances can now be pickled
- bugfix passing empty string or None for _in hanged
- bugfix where passing a filename or file-like object to _out
  wasn't using os.dup2
- regression make _fg work with _cwd again
- an invalid _cwd now raises a ForkException not an OSError.
- AIX support
- added a timeout=None param to RunningCommand.wait()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sh_1.12.14.bb => python3-sh_1.13.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.12.14.bb => python3-sh_1.13.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
index b7858734b..2a6d9bcc6 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[md5sum] = "a8351aef25d25f707c17e0a7a6280251"
-SRC_URI[sha256sum] = "b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc"
+SRC_URI[md5sum] = "7e3dd3a6b49c06db93746994a68cb8cf"
+SRC_URI[sha256sum] = "97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.17.1

