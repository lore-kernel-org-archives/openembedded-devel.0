Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F63B6FD10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 06:13:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D6D1Y1026230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 23:13:02 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 12 Jun 2014 23:13:01 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:12:55 +0800
Message-ID: <1402639978-4607-2-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
References: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] samba: fix parsing linemarkers in preprocessor output
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 06:13:04 -0000
Content-Type: text/plain

When PIDL calls out to C preprocessor to expand IDL files
and parse the output, it filters out linemarkers and line control
information as described in http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
and http://gcc.gnu.org/onlinedocs/cpp/Line-Control.html#Line-Control

With gcc 4.8 stdc-predef.h is included automatically and linemarker for the
file has extended flags that PIDL couldn't parse ('system header that needs to
be extern "C" protected for C++')

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...arsing-linemarkers-in-preprocessor-output.patch |   68 ++++++++++++++++++++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch

diff --git a/meta-oe/recipes-connectivity/samba/samba/0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch b/meta-oe/recipes-connectivity/samba/samba/0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch
new file mode 100644
index 0000000..586867d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch
@@ -0,0 +1,68 @@
+Upstream-Status: Backport
+
+From b07ade6e6fcc8b844cf1fb8b6038617281c4c2d0 Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <ab@samba.org>
+Date: Wed, 6 Feb 2013 10:17:57 +0200
+Subject: [PATCH] PIDL: fix parsing linemarkers in preprocessor output
+
+Commit b07ade6e6fcc8b844cf1fb8b6038617281c4c2d0 v3-6-stable
+
+When PIDL calls out to C preprocessor to expand IDL files
+and parse the output, it filters out linemarkers and line control
+information as described in http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
+and http://gcc.gnu.org/onlinedocs/cpp/Line-Control.html#Line-Control
+
+With gcc 4.8 stdc-predef.h is included automatically and linemarker for the
+file has extended flags that PIDL couldn't parse ('system header that needs to
+be extern "C" protected for C++')
+
+Thanks to Jakub Jelinek <jakub@redhat.com> for explanation of the linemarker format.
+
+Fixes https://bugzilla.redhat.com/show_bug.cgi?id=906517
+
+Reviewed-by: Andreas Schneider <asn@samba.org>
+(cherry picked from commit 6ba7ab5c14801aecae96373d5a9db7ab82957526)
+
+Signed-off-by: Andreas Schneider <asn@samba.org>
+
+Fix bug #9636 - pidl can't parse new linemarkers in preprocessor output.
+(cherry picked from commit 643571470f2e4cd2f58bd60ac7189abb826d33cc)
+(cherry picked from commit b5a8afd6550e9091d169d3010751913bb483fc4b)
+---
+ pidl/idl.yp                |    4 +++-
+ pidl/lib/Parse/Pidl/IDL.pm |    4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/pidl/idl.yp b/pidl/idl.yp
+index b5c5185..c8a65f6 100644
+--- a/pidl/idl.yp
++++ b/pidl/idl.yp
+@@ -610,7 +610,9 @@ again:
+ 
+ 	for ($parser->YYData->{INPUT}) {
+ 		if (/^\#/) {
+-			if (s/^\# (\d+) \"(.*?)\"( \d+|)//) {
++			# Linemarker format is described at
++			# http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
++			if (s/^\# (\d+) \"(.*?)\"(( \d+){1,4}|)//) {
+ 				$parser->YYData->{LINE} = $1-1;
+ 				$parser->YYData->{FILE} = $2;
+ 				goto again;
+diff --git a/pidl/lib/Parse/Pidl/IDL.pm b/pidl/lib/Parse/Pidl/IDL.pm
+index d4820ff..6927c89 100644
+--- a/pidl/lib/Parse/Pidl/IDL.pm
++++ b/pidl/lib/Parse/Pidl/IDL.pm
+@@ -2576,7 +2576,9 @@ again:
+ 
+ 	for ($parser->YYData->{INPUT}) {
+ 		if (/^\#/) {
+-			if (s/^\# (\d+) \"(.*?)\"( \d+|)//) {
++			# Linemarker format is described at
++			# http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
++			if (s/^\# (\d+) \"(.*?)\"(( \d+){1,4}|)//) {
+ 				$parser->YYData->{LINE} = $1-1;
+ 				$parser->YYData->{FILE} = $2;
+ 				goto again;
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index f80e41e..c3e834d 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -31,6 +31,7 @@ SRC_URI += "\
     file://configure-disable-core_pattern-cross-check.patch;patchdir=.. \
     file://configure-libunwind.patch;patchdir=.. \
     file://samba-3.6.22-CVE-2013-4496.patch;patchdir=.. \
+    file://0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch;patchdir=.. \
 "
 SRC_URI[md5sum] = "fbb245863eeef2fffe172df779a217be"
 SRC_URI[sha256sum] = "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b3514de"
-- 
1.7.9.5


