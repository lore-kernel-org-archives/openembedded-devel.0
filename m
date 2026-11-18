Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10375.1795000605248366362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R1w2Wgtn;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4126; q=dns/txt;
  s=iport01; t=1795000605; x=1796210205;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CWfz1aZEPWh6w9XR5pG7PfaV88D6jIpl6rqR+39dr1s=;
  b=R1w2WgtncwLrbnngyoG/kpKeHL9de9zYatBYziquEBJBqz06go+8/jHX
   q9uOJBhkEMK1K5VlCVaCWujCRrQ4kjrMBszUS5hKbrCOpGzl7kkNYMMei
   uZZo0ST6eFES7OMjhUXRxjTp9wEjcEKs4udIiGkPzY8CQC/RvSSIRMPsF
   lGaffR3REBgSzPUladpfRl9fRptNDYzbOlBfa89bteOvQ/q+IyBVi9ETa
   0EhDpbXY1cLDfanytUqsGHDMDsOu47+55Bphrq2AfTmZAXPY73PjdQWdz
   gqIgiFTg8hxGoPY3GrtcJdX8BxRmZvUGxg0yavMjGEy/sZjSwpPWbbApF
   Q==;
X-CSE-ConnectionGUID: 1ku9nzd8TguU6aD/v9DiFQ==
X-CSE-MsgGUID: G7vBl6HiTsOn+nDssRKiAA==
X-IPAS-Result: =?us-ascii?q?A0BDAgAeiP1q/40QJK1aglmCV3VgQ0mUKoIhniuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGTJwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgE4ARgBGz4DAQJaIyGDAgGCdAMRuweCLIEBgykBgVTZS4FoAQsUA?=
 =?us-ascii?q?YE4hUKIJF2FFicbgUlEhBBvgmECiCYEgiJ6EoFUHox5AoFPh3VIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhUyPDIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2A?=
 =?us-ascii?q?oJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAIND?=
 =?us-ascii?q?HQ5EDAeJC8FGiY+GwqBDCcfHggYDUgRLDcVGQQ+bgeTM4MYexMBKxeBCWUah?=
 =?us-ascii?q?TueJ4IhoRGEK4wklToaM4VbpReZCIs3glOWUYRqgWg8gVkzGggbFYMiCUoZD?=
 =?us-ascii?q?44vFRyBXIFoyl8mMgIJMgIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:dH144KB2IvUcUhVW/37iw5YqxClBgxIJ4kV8jS/XYbTApD520TwDz
 GZLCjzSP/yNMTT2edx0O47g9UlQu8LVn9JkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8hGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEmvZzXUckMd0k9ftKX2his
 uJJBDEjV0XW7w626OrTpuhEj8AnKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWMHgBfoO3WjPn8GFYg3kOqAjXjkeDoeo1WQzUYyyziCnFEsjuG1bbI5fPSlGtt/mhi4p
 17d2GK6BD0BL+a8yBOspyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgaWEW2pdG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTVluzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:bhIGQaP+QXSHCcBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:sKvLY2924NZfKvO4aI2VvxcXB5EjYHGN8HjNHhGxJSF3GZGUZ2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ACPReRQz20N/80l1+Pp6nL0mw1gKaqIvxFmoJz7U?=
 =?us-ascii?q?Hh9KjM292FyyGthe2a6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="898556105"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 11:16:44 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 2FA801800049E
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:16:44 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id C9CE3CC1611; Wed, 18 Nov 2026 03:16:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] frr: Fix build with bison rejecting paths in output directives
Date: Wed, 18 Nov 2026 03:16:43 -0800
Message-Id: <20261118111643.397300-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132645
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
 .../recipes-protocols/frr/frr_10.6.1.bb       |  1 +
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
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
index 8f53cf68d5..bd977be214 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.6;tag=frr-${PV} \
            file://frr.pam \
            file://0001-lib-fix-mgmt_msg-recv-to-deal-with-mis-alignment.patch \
+           file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch \
            "
 SRCREV = "71da51baee6fb2a02b24262defc46591c86e8a81"
 
-- 
2.35.6

