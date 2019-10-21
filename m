Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE7160685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 03:13:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,322,1566835200"; d="scan'208";a="77253516"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 11:13:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 438174CE14FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 11:12:48 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 11:13:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Oct 2019 11:13:30 +0800
Message-ID: <20191021031330.19087-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 438174CE14FE.A8C3C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] ltrace:Bug fix for data type length judgment
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
X-List-Received-Date: Mon, 21 Oct 2019 03:13:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
if (byte_size == sizeof(long)) {

        *type = is_signed ? ARGTYPE_LONG : ARGTYPE_ULONG;

        return true;

}
...

If ltrace's target command has a dbg package, ltrace will look for the debug file and analyze its contents.
Ltrace determines the type of analysis result variable. The type of the variable is longlong.
On 32-bit systems, longlong is 8 and long is 4 (same as in).
An error occurred because the ltrace code did not process a variable of length 8.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy.fnst@cn.fujitsu.com>
---
 ...001-Bug-fix-for-data-type-length-judgment.patch | 42 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-Bug-fix-for-data-type-length-judgment.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Bug-fix-for-data-type-length-judgment.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Bug-fix-for-data-type-length-judgment.patch
new file mode 100644
index 0000000..98cc9ba
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Bug-fix-for-data-type-length-judgment.patch
@@ -0,0 +1,42 @@
+From 5226333bddb755dbefd780d31450e0238dd5d3bd Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 16 Oct 2019 08:24:23 +0900
+Subject: [PATCH] Bug fix for data type length judgment.
+
+...
+if (byte_size == sizeof(long)) {
+
+	*type = is_signed ? ARGTYPE_LONG : ARGTYPE_ULONG;
+
+	return true;
+
+}
+...
+
+If ltrace's target command has a dbg package, ltrace will look for the debug file and analyze its contents.
+Ltrace determines the type of analysis result variable. The type of the variable is longlong.
+On 32-bit systems, longlong is 8 and long is 4 (same as in).
+An error occurred because the ltrace code did not process a variable of length 8.
+
+Upstream-Status: Pending
+Signed-off-by: Wang Mingyu <wangmy.fnst@cn.fujitsu.com>
+---
+ dwarf_prototypes.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dwarf_prototypes.c b/dwarf_prototypes.c
+index bfac177..9887d4b 100644
+--- a/dwarf_prototypes.c
++++ b/dwarf_prototypes.c
+@@ -190,7 +190,7 @@ static bool get_integer_base_type(enum arg_type *type, int byte_size,
+ 		return true;
+ 	}
+ 
+-	if (byte_size == sizeof(long)) {
++	if (byte_size == sizeof(long long)) {
+ 		*type = is_signed ? ARGTYPE_LONG : ARGTYPE_ULONG;
+ 		return true;
+ 	}
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index ead637c..5c4e7c5 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
            file://0001-hook-Do-not-append-int-to-std-string.patch \
            file://include_unistd_nr.patch \
+           file://0001-Bug-fix-for-data-type-length-judgment.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.7.4




