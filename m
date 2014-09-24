Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B91A565FFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 00:18:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8O0IwTN013769
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 17:18:58 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 17:18:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Sep 2014 08:18:57 +0800
Message-ID: <1411517937-29925-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][rebase to 1.12.1] wireshark: not put the CC options into CFLAGS_FOR_BUILD
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
X-List-Received-Date: Wed, 24 Sep 2014 00:19:01 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/Do-not-set-CC_FOR_BUILD-flags.patch      |   46 ++++++++++++++++++++
 .../recipes-support/wireshark/wireshark_1.12.1.bb  |    1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch

diff --git a/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch b/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch
new file mode 100644
index 0000000..64a08ad
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch
@@ -0,0 +1,46 @@
+[PATCH] Do not set CC_FOR_BUILD flags
+
+Upstream-status: Pending
+
+AC_WIRESHARK_COMPILER_FLAGS_CHECK() is checking which options CC is supported,
+and put the supported options into CFLAGS, but it should not put them into 
+CFLAGS_FOR_BUILD. since CC and BUILD_CC can be different, CFLAGS_FOR_BUILD is
+used by BUILD_CC 
+
+BUILD_CC is used to generated host tools, do not use the gcc's optimised options,
+do not effect the running of host tools. so do not set CC_FOR_BUILD flags.
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ acinclude.m4 | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 136fc27..8d3d360 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1755,10 +1755,6 @@ if test "x$ac_supports_gcc_flags" = "xyes" ; then
+               # just the new option.
+               #
+               CFLAGS="$CFLAGS_saved $GCC_OPTION"
+-              #
+-              # Add it to the flags we use when building build tools.
+-              #
+-              CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
+             ],
+             [
+               AC_MSG_RESULT(yes)
+@@ -1771,10 +1767,6 @@ if test "x$ac_supports_gcc_flags" = "xyes" ; then
+           # just the new option.
+           #
+           CFLAGS="$CFLAGS_saved $GCC_OPTION"
+-          #
+-          # Add it to the flags we use when building build tools.
+-          #
+-          CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
+         fi
+       ],
+       [
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
index 71cc082..147c513 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
@@ -8,6 +8,7 @@ DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libnl sbc"
 
 SRC_URI = " \
     http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}.tar.bz2 \
+    file://Do-not-set-CC_FOR_BUILD-flags.patch \
 "
 
 PE = "1"
-- 
1.7.10.4


