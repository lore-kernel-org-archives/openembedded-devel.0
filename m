Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10846.1795002600425853158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CMFI4Mar;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4126; q=dns/txt;
  s=iport01; t=1795002600; x=1796212200;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CWfz1aZEPWh6w9XR5pG7PfaV88D6jIpl6rqR+39dr1s=;
  b=CMFI4MarYM4MXTOuUFSLSiTvnO5gwRG2Ntc/fjB8JlqXM/kietf2jRJs
   MivG6P44B+Nv/KHfXOV4F8Q53FGgT451V66Ij1Z7zPT+pfdPrzI2c6uOy
   Odsv+e6M6Sdrp2cIo2pXwp+p3wQIZo/BOzmAGkyS4bpn9LFPfSruteSX+
   OQyHNV+R2YLdIqb8PvJlIxtLKynQHy82lDYvZvnPvhFHXITzLngE8qxiQ
   vzsAQUyjVizq6SmgWHl2UJEiwPXDewMb6nQivwfq6cg3Cj1XG1cmz7fQA
   ELkAlsQCNnquqOp9fTGy8JbCd/UeEsIcYKMbv3+ZNxWaZnbEJ/fU3SJqW
   w==;
X-CSE-ConnectionGUID: 2BSDJM+FQDKGYdB9qwWHbA==
X-CSE-MsgGUID: HJNnmrvoTFeudxeg6NtYIA==
X-IPAS-Result: =?us-ascii?q?A0BDAgAZkP1q/40QJK1aHgEBCxIMggULgld1YENJlCqCI?=
 =?us-ascii?q?Z4rgX4PAQEBD0QNBAEBkycCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBOAEYARs+AwECJDYjIYMCAYJ0AxG6dIIsgQGDKQHbH?=
 =?us-ascii?q?4FoAQsUAYE4hUKIJF2FFicbgUlEhBBvgmECiCYEgiJ6EoFUHox5AoFPh3VIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhUyPDIdgSM7F4EHGwYFgRyBHoESgQNdgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHggYDUgRLDcVGQQ+bgeTM4MYexMBK?=
 =?us-ascii?q?xeBCWUahTueJ4IhoRGEK4wklToaM4VbpReZCIs3glOWUYRqgWg8gVkzGggbF?=
 =?us-ascii?q?YMiCUoZD44vFRyBXIFoy2cmMgIJMgIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:RnQEUaxPGgP5nr2jtzF6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 mIeWW6AbPiNYGvyft1/PIuxoRsAuJLUxoRrSABor1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctazJMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBscBqE636VZOE1t2
 s0UAmEUcS+jjcvjldpXSsE07igiBMDvOIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiZC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQhgeiwYYKOJY3iqcN9vmS+o
 Gfc4WPFLBwHOMySxmSj7kONr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:P4sSrqOEfvTBv8BcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AmrHJU2idzvyruHTIClQyqyTE/DJuKFfm4FX1YGG?=
 =?us-ascii?q?BJUVGebG/GEaPx4Nuup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AX/w1HA9P6/+bN1FGswxDINSQf+dKxaKrEl4Krbs?=
 =?us-ascii?q?LpsWUOCMuHSusrR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="898590379"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 11:49:57 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id A21C8180001B3
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:49:57 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 42117CC1611; Wed, 18 Nov 2026 03:49:57 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][wrynose][PATCH] frr: Fix build with bison rejecting paths in output directives
Date: Wed, 18 Nov 2026 03:49:56 -0800
Message-Id: <20261118114956.431781-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132647
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

