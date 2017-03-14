Return-Path: <pbarker@toganlabs.com>
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5A877824
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:09:29 +0000 (UTC)
Received: from mfilter34-d.gandi.net (mfilter34-d.gandi.net [217.70.178.165])
	by relay2-d.mail.gandi.net (Postfix) with ESMTP id 6D1D2C5A8A;
	Tue, 14 Mar 2017 18:09:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter34-d.gandi.net
Received: from relay2-d.mail.gandi.net ([IPv6:::ffff:217.70.183.194])
	by mfilter34-d.gandi.net (mfilter34-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id Y87Btq2tp-NW; Tue, 14 Mar 2017 18:09:28 +0100 (CET)
X-Originating-IP: 82.34.23.153
Received: from host0.betafive.co.uk
	(cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net [82.34.23.153])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 55EAEC5ABA;
	Tue, 14 Mar 2017 18:09:28 +0100 (CET)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id 5FAF14032ABA; Tue, 14 Mar 2017 17:09:27 +0000 (GMT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Mar 2017 17:09:17 +0000
Message-Id: <20170314170917.18344-1-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] vim: Update to 8.0.0427
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
X-List-Received-Date: Tue, 14 Mar 2017 17:09:30 -0000

8.0.0427 is currently used in Arch Linux so we know it has at least had
some testing.

Upstream has fixed the following CVEs since 8.0.0022:
* CVE-2016-1248 in 8.0.0056
* CVE-2017-5953 in 8.0.0322
* CVE-2017-6349 in 8.0.0377
* CVE-2017-6350 in 8.0.0378
See http://www.cvedetails.com/product/14270/VIM-VIM.html?vendor_id=8218

Patches are updated as src/configure.in was renamed upstream.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch  | 6 +++---
 .../vim/files/vim-add-knob-whether-elf.h-are-checked.patch        | 8 ++++----
 .../vim/{vim-tiny_8.0.0022.bb => vim-tiny_8.0.0427.bb}            | 0
 meta-oe/recipes-support/vim/{vim_8.0.0022.bb => vim_8.0.0427.bb}  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/vim/{vim-tiny_8.0.0022.bb => vim-tiny_8.0.0427.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_8.0.0022.bb => vim_8.0.0427.bb} (98%)

diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
index 8f824e78b..65e5f58c6 100644
--- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
@@ -4,10 +4,10 @@ Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ================================================
-diff --git a/src/configure.in b/src/configure.in
+diff --git a/src/configure.ac b/src/configure.ac
 index fb965e5..d734064 100644
---- a/src/configure.in
-+++ b/src/configure.in
+--- a/src/configure.ac
++++ b/src/configure.ac
 @@ -2511,7 +2511,7 @@ AC_CHECK_HEADERS(stdarg.h stdint.h stdlib.h string.h \
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
diff --git a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
index 693d130e4..6c620f9f2 100644
--- a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
+++ b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
@@ -7,13 +7,13 @@ Upstream-status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 ---
- src/configure.in |    7 +++++++
+ src/configure.ac |    7 +++++++
  1 file changed, 7 insertions(+)
 
-diff --git a/src/configure.in b/src/configure.in
+diff --git a/src/configure.ac b/src/configure.ac
 index d734064..f504fa6 100644
---- a/src/configure.in
-+++ b/src/configure.in
+--- a/src/configure.ac
++++ b/src/configure.ac
 @@ -2483,11 +2483,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
  	AC_MSG_RESULT(no))
  
diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.0.0022.bb b/meta-oe/recipes-support/vim/vim-tiny_8.0.0427.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_8.0.0022.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.0.0427.bb
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0022.bb b/meta-oe/recipes-support/vim/vim_8.0.0427.bb
similarity index 98%
rename from meta-oe/recipes-support/vim/vim_8.0.0022.bb
rename to meta-oe/recipes-support/vim/vim_8.0.0427.bb
index 920391adb..1f86fcd2f 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0022.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0427.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "ec68a99464055029c01082762517e97245ddae0c"
+SRCREV = "ad4187e6fc9c8e1083a172852d958a70a689a75c"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.11.0


