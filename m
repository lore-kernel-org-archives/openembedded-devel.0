Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7D06578754
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:26:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 07:26:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="34810665"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 28 Feb 2018 07:26:37 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id CE4D55802B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:26:36 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 17:29:28 +0200
Message-Id: <1519831772-41479-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
References: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/5] nautilus: remove unused patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 15:26:36 -0000

remove the following unused patch from nautilus and nautilus3:
        no-try-run-strftime.diff

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../nautilus/nautilus/no-try-run-strftime.diff     | 28 ---------------
 .../nautilus/nautilus3/no-try-run-strftime.diff    | 41 ----------------------
 2 files changed, 69 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/no-try-run-strftime.diff
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus3/no-try-run-strftime.diff

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/no-try-run-strftime.diff b/meta-gnome/recipes-gnome/nautilus/nautilus/no-try-run-strftime.diff
deleted file mode 100644
index ccd2934..0000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/no-try-run-strftime.diff
+++ /dev/null
@@ -1,28 +0,0 @@
---- /tmp/configure.in	2009-04-13 11:26:43.000000000 +0200
-+++ nautilus-2.26.1/configure.in	2009-04-13 11:28:37.000000000 +0200
-@@ -375,25 +375,6 @@
- 
- dnl ===========================================================================
- 
--dnl strftime checks
--
--AC_TRY_RUN([#include <time.h>
--                int main ()
--                {
--                  char buf[100];
--                  struct tm tm = {0};
--                  tm.tm_year = 99;
--                  if (strftime(buf, 100, "%EY", &tm) == 4 &&
--		      strcmp (buf, "1999")==0)
--                    return 0;
--                  return 1;
--                }
--            ],
--	    AC_DEFINE(HAVE_STRFTIME_EXTENSION, 1, [Define if strftime supports %E and %O modifiers.])
--            )
--
--dnl ===========================================================================
--
- #
- # Checks for Xft/XRender
- #
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3/no-try-run-strftime.diff b/meta-gnome/recipes-gnome/nautilus/nautilus3/no-try-run-strftime.diff
deleted file mode 100644
index 56d2e15..0000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3/no-try-run-strftime.diff
+++ /dev/null
@@ -1,41 +0,0 @@
-From dc9c8cf2676c8c91ea0ae250cfedf863352f3ccd Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 24 Jun 2011 20:24:08 +0200
-Subject: [PATCH] hack out check that tries to run generated binaries
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- configure.in |   17 +----------------
- 1 files changed, 1 insertions(+), 16 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index c3aa371..1d3ecdc 100644
---- a/configure.in
-+++ b/configure.in
-@@ -251,22 +251,7 @@ AC_SUBST(WARNING_CFLAGS)
- 
- dnl ===========================================================================
- 
--dnl strftime checks
--
--AC_TRY_RUN([#include <time.h>
--                int main ()
--                {
--                  char buf[100];
--                  struct tm tm = {0};
--                  tm.tm_year = 99;
--                  if (strftime(buf, 100, "%EY", &tm) == 4 &&
--		      strcmp (buf, "1999")==0)
--                    return 0;
--                  return 1;
--                }
--            ],
--	    AC_DEFINE(HAVE_STRFTIME_EXTENSION, 1, [Define if strftime supports %E and %O modifiers.])
--            )
-+AC_DEFINE(HAVE_STRFTIME_EXTENSION, 1, [Define if strftime supports %E and %O modifiers.])
- 
- dnl ==========================================================================
- 	
--- 
-1.6.6.1
-
-- 
2.4.0


