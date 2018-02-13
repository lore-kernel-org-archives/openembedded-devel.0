Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E3788601F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Feb 2018 05:48:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37020270"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Feb 2018 13:48:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 492B048AE761
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Feb 2018 13:48:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 13 Feb 2018 13:48:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Feb 2018 13:48:07 +0800
Message-ID: <1518500887-19805-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 492B048AE761.A6F6E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] tk: 8.6.6 -> 8.6.8
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
X-List-Received-Date: Tue, 13 Feb 2018 05:48:04 -0000
Content-Type: text/plain

1.Upgrade tk from 8.6.6 to 8.6.8.
2.Modify confsearch.diff, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/tcltk/tk/confsearch.diff       | 17 ++++++++++-------
 .../recipes-devtools/tcltk/{tk_8.6.6.bb => tk_8.6.8.bb} |  4 ++--
 2 files changed, 12 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.6.bb => tk_8.6.8.bb} (94%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
index c51e475..4dbd9a4 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
@@ -4,29 +4,32 @@ installation.
 
 --- tk8.5-8.5.8.orig/unix/configure
 +++ tk8.5-8.5.8/unix/configure
-@@ -1431,6 +1431,7 @@
- 			`ls -d ${prefix}/lib 2>/dev/null` \
- 			`ls -d /usr/local/lib 2>/dev/null` \
+@@ -1431,7 +1431,8 @@
  			`ls -d /usr/contrib/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/pkg/lib 2>/dev/null` \
 +			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
+ 			`ls -d /usr/lib64 2>/dev/null` \
  			; do
  		    if test -f "$i/tclConfig.sh" ; then
 --- tk8.5-8.5.8.orig/unix/tcl.m4
 +++ tk8.5-8.5.8/unix/tcl.m4
-@@ -93,6 +93,7 @@
- 			`ls -d ${prefix}/lib 2>/dev/null` \
- 			`ls -d /usr/local/lib 2>/dev/null` \
+@@ -93,7 +93,8 @@
  			`ls -d /usr/contrib/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/pkg/lib 2>/dev/null` \
 +			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
+ 			`ls -d /usr/lib64 2>/dev/null` \
  			; do
  		    if test -f "$i/tclConfig.sh" ; then
-@@ -223,6 +224,7 @@
+@@ -223,7 +224,8 @@
  			`ls -d ${prefix}/lib 2>/dev/null` \
  			`ls -d /usr/local/lib 2>/dev/null` \
  			`ls -d /usr/contrib/lib 2>/dev/null` \
 +			`ls -d /usr/share/tcltk/tk8.5 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
+ 			`ls -d /usr/lib64 2>/dev/null` \
  			; do
  		    if test -f "$i/tkConfig.sh" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
similarity index 94%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
index d3bf397..13dc4d7 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
@@ -26,8 +26,8 @@ SRC_URI = "\
     file://fix-xft.diff \
     file://configure.use.fontconfig.with.xft.patch \
 "
-SRC_URI[md5sum] = "dd7dbb3a6523c42d05f6ab6e86096e99"
-SRC_URI[sha256sum] = "d62c371a71b4744ed830e3c21d27968c31dba74dd2c45f36b9b071e6d88eb19d"
+SRC_URI[md5sum] = "5e0faecba458ee1386078fb228d008ba"
+SRC_URI[sha256sum] = "49e7bca08dde95195a27f594f7c850b088be357a7c7096e44e1158c7a5fd7b33"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
-- 
2.7.4




