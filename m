Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6771.1795056188482456331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 18:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bsHTqMW0;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4129; q=dns/txt;
  s=iport01; t=1795056188; x=1796265788;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=emA7u2y3VPY0kVJoltxJvJzcJ3tpZ+xXgbU636JboCM=;
  b=bsHTqMW08B5iWciI6uW9ztP6+eCCZnZQmnX0HnJxAImI4H9LyF7uDePe
   ZpC52dlGz3V8Vf2uA0ZA/p/OA/4F+VHst+6GTo/c2nRUU/NfiJqw1pJAY
   ZVklaxrpz00sa/rp63GU51rXk6qv/j2AOEqorbzuny70cIhHgXLSmlPws
   kHJ2P05/5aoHRMSoxl4UYOrV24eyOhBvjFiQQeZ+9jXS+ysFTk52E7d4G
   LD8u4phEa4bkiMrqG9cF4AAtJJvMH9aVy9D+xprsikRyB4DZvdRZPmvKg
   jkEM1hAOhUEHIjG6a/0GhQzmJnUELo3kf/59XHTDNELZ7FpjNYF3zD+tp
   Q==;
X-CSE-ConnectionGUID: YJIgSuzNTBaol17vhscs8A==
X-CSE-MsgGUID: bqtIx+6lRqayEV+vV4ZjZw==
X-IPAS-Result: =?us-ascii?q?A0BDAgChYP5q/8pK/pBaHgEBCxIMggULgld1YENJlCqCI?=
 =?us-ascii?q?Z4rgX4PAQEBD0QNBAEBkycCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBOAEYARs+AwECJDYjIYMCAYJ0AxG5L4IsgQGDKQHbH?=
 =?us-ascii?q?4FoAQsUAYE4hUKIJF2FFicbgUlEhBBvgmECiCYEgiKBDIFUHox5AoFPiAVIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhUyPDIdgSM7F4EHGwYFgRyBHoESgQNdgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAg4YDUgRLDcVGQQ+bgeTT4MYe?=
 =?us-ascii?q?xMBKxeBCWUahTueJ4IhoRGEK4wklToaM4VbpReZCIs3glOWUYRqgWg8gVkzG?=
 =?us-ascii?q?ggbFYMiCUoZD45ggVyBaMw+JjICCTICBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:teB14aNbscAtCyXvrR3wlsFynXyQoLVcMsEvi/4bfWQNrUomhTJTn
 zdJCjjUaayNZmD1e9Anb9vk90MEucXUzYRrG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gm4saQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68RMLU4NIJ8+xsx+BmUXq
 uIYMzsWPjnW0opawJrjIgVtrs0uNozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I1BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOnVUsiui9bLI5fPSAXNl0jgXGo
 ljf9nXUPFIECoCtywiapyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgaWEW2pdG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnUjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:WPUKy6BY3oj53LblHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3Am0ikUWunuBbTzUyKiKS2fxPA6IsUUFzS92rCBXO?=
 =?us-ascii?q?SAGFtEeKLSUSb4/NNxp8=3D?=
X-Talos-MUID: 9a23:hkp83AgxereB44YsLBDmIcMpPt50wrTtVkQ3iJwXlvfHKxIsCTWvk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59152884"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 02:43:06 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 0158E304BC1
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 02:43:06 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 70D37CC1611; Wed, 18 Nov 2026 18:43:04 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][scarthgap][PATCH] frr: Fix build with bison rejecting paths in output directives
Date: Wed, 18 Nov 2026 18:43:03 -0800
Message-Id: <20261119024303.1507106-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 02:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132665
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

bison now carries the fix for CVE-2026-56390, which rejects '/' in
%header/%defines and %output file names, so generating the command
parser fails:

  lib/command_parse.y:20.10-30: error: invalid %header file name ignored
  lib/command_parse.y:21.10-30: error: invalid %output file name ignored

Backport the upstream fix which drops these directives and passes the
output file name with -o instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cf06742a7c064d293c715e143fdabf91bf072893)
Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 ...ths-in-bison-output-defines-directiv.patch | 54 +++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
new file mode 100644
index 0000000000..ac732d9ebc
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 13 Oct 2026 15:33:02 +0300
+Subject: [PATCH] lib: Don't use paths in bison %output/%defines directives
+
+The fix for CVE-2026-56390 rejects any '/' in %output and %header (%defines)
+file names. The directive is then ignored, and bison reports an error
+and exits non-zero, which breaks the build:
+
+    invalid %output file name ignored
+    invalid %header file name ignored
+
+We only used these directives to place the generated files in lib/,
+because the .y.c rule ran bison without -o. Drop them and pass
+`-o $@` instead. With -d, bison derives lib/command_parse.h from the
+-o name, so the generated files stay the same.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7ad39d799d98c982713b29c1d0ba6d49691308b]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/command_parse.y | 4 ----
+ lib/subdir.am       | 2 +-
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/command_parse.y b/lib/command_parse.y
+index bc04bc93bb4c..4d9377e5df87 100644
+--- a/lib/command_parse.y
++++ b/lib/command_parse.y
+@@ -16,10 +16,6 @@
+ %define api.pure full
+ /* define api.prefix {cmd_yy} */
+ 
+-/* names for generated header and parser files */
+-%defines "lib/command_parse.h"
+-%output  "lib/command_parse.c"
+-
+ /* note: code blocks are output in order, to both .c and .h:
+  *  1. %code requires
+  *  2. %union + bison forward decls
+diff --git a/lib/subdir.am b/lib/subdir.am
+index 20947c306d60..dafebacf8e7a 100644
+--- a/lib/subdir.am
++++ b/lib/subdir.am
+@@ -537,7 +537,7 @@ CLEANFILES += vtysh/vtysh_cmd.c $(vtysh_cmd_split)
+ .l.c:
+ 	$(AM_V_LEX)$(am__skiplex) $(LEXCOMPILE) $<
+ .y.c:
+-	$(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) $<
++	$(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) -o $@ $<
+ 
+ #
+ # generated sources & extra foo
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
index 20a224b7d7..02756db322 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch \
            file://CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch \
            file://CVE-2026-28532.patch \
+           file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch \
            "
 
 SRCREV = "ad1766d17be022587fe05ebe1a7bf10e1b7dce19"
-- 
2.43.7

