Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D230CD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:15:08 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35676.1781842507730145991
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dLSs3FXc;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16570; q=dns/txt;
  s=iport01; t=1781842507; x=1783052107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w/0cFUqW2jR4zSRssQaOY8YTqWZ2OGGO72FZNpWUOLA=;
  b=dLSs3FXcRYx1HPuH5ds5jAYbwlulTAfqPpi9ES8UHLqaXPg1/u8PZV1u
   ed5AQUbn/4JYNgKw4UlZi0X7sQxJJ8lWOOkVh0+pWwc9RkiUvYiolkwBk
   bOaEisBZ7bPD9DuIVFqppOb0b2HlSXjvZkTpk+XKqc7/dDi0B3StmfcgC
   Lmgp9kCXVckAPyb9daLD2icFODZQRu64HwJ1lXK9oGWfralIv4sIvbG6o
   8jwyWaox5DqUuWgynaTkIRv6H9XCq0ZcQ6WOZJ90391FMb3jg0eTbZMtc
   qMU8Vaz1au7i6RYLvi8ZtpkaDiQ6Bh2MEdnGSj8nQ6IXXVr6ldve7uAyK
   w==;
X-CSE-ConnectionGUID: 69DxnlHmRyygiFYBPckw7A==
X-CSE-MsgGUID: wXL3RmWARvSkbchjhgBmgw==
X-IPAS-Result: =?us-ascii?q?A0BFAgC+wTRq/5X/Ja1aglmCV3ReQ0mWS4tnkjeBfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBo1KAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgE1ARgBLSwDAQJPCyMhCYJ5AYI6AzYDEQaycYIsgQGDKAF/B?=
 =?us-ascii?q?VDYSQ2CVgELFAGBOIU/gnyFI1sYAYR8JxsbgXKEfoIfNwsBAoEmERKGWwSCI?=
 =?us-ascii?q?oEMgVoeUoFggQCLfkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEegXuBAoUDIx8DOX+BaIElZ2YVMDWBAQERHwqBJAMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?HcXD4FBdQcBMCIGNQEpAQF7HQNiCAMXDRGTADgxgmCMe4IhoB5xCiiDdYwhj?=
 =?us-ascii?q?z6FfBozhASBV6URmQiCWYsxhAmRX2iEaIFoPIFZcBWDIglKGQ+WezsuI78xJ?=
 =?us-ascii?q?zICAQE5AQEHAgcOAwuBaJAAASd1YAEB?=
IronPort-Data: A9a23:cvs83q6g9hycOd3pVnEODgxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jQeD2COaKqDMWGhcowibIm19U8C6pDXx4U3GgU9rCAwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNu/rfwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eY9w06uBzIWR05
 O0XKR48RCiIhP3p6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAhnv2fzpegFmUvqEwpWPUyWSd1ZCxYYSJI4LRHZk9ckCwu
 VLipF78PTggKuecwzGF8HKjrOrAgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:sFu3U6MCQyIv2MBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:UpDaFm5r9mcCjePvCNssqh84CsYhUnjn3WbfImGJI15iS6LKYArF
X-Talos-MUID: 9a23:tP5GcQUTIm8kq5Tq/CDcoGpYMfhB2bqVC0oGkZcGtOOBOjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,212,1774310400"; 
   d="scan'208";a="496416304"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Jun 2026 04:15:06 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 776571800033B;
	Fri, 19 Jun 2026 04:15:06 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 0942CCC1611; Thu, 18 Jun 2026 21:15:06 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-networking][scarthgap][PATCH 4/4] samba: upgrade to 4.22.10
Date: Thu, 18 Jun 2026 21:15:00 -0700
Message-Id: <20260619041500.2635711-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 04:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127677

From: Himanshu Jadon <hjadon@cisco.com>

Upgrade Samba to the fixed 4.22.10 security release for
Scarthgap.

Samba 4.22.10 addresses the following security CVEs:
CVE-2026-1933, CVE-2026-2340, CVE-2026-3012,
CVE-2026-3238, CVE-2026-4408, and CVE-2026-4480.

Release notes:
https://www.samba.org/samba/history/samba-4.22.10.html

The base 4.19.9 version is directly affected by CVE-2026-3012,
CVE-2026-3238, CVE-2026-4408, and CVE-2026-4480. Samba lists
CVE-2026-1933 as affecting versions since 4.21 and CVE-2026-2340
as affecting versions since 4.20, so those two are fixed by
4.22.10 but are not applicable to the base 4.19.9 version.

The upgrade requires newer talloc, tdb, and tevent from the
preceding commits. Drop the system libldb dependency and pyldb
runtime dependency because newer Samba builds its own LDB/PyLDB
copy, matching the upstream meta-openembedded upgrade path.

Refresh the existing recipe patches for the 4.22.10 source
layout. Add bison-native for the generated parser build and
add docbook-xml-dtd4-native so Samba manpage generation can
resolve the native DocBook XML catalog directly.

Raise the xsltproc maxdepth used for Samba manpage generation.
The generated smb.conf.5 DocBook input is large enough to hit
libxslt's default recursion limit with the DocBook stylesheet.

Package samba-bgqd.service with samba-base because Samba 4.22.10
installs the unit when systemd support is enabled.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../samba/0001-Don-t-check-xsltproc-manpages.patch | 20 ++--------
 .../0003-Add-config-option-without-valgrind.patch  |  9 ++---
 ...dd-options-to-configure-the-use-of-libbsd.patch | 45 +++++++++++++++-------
 ...raise-xsltproc-maxdepth-for-manpage-build.patch | 36 +++++++++++++++++
 .../samba/{samba_4.19.9.bb => samba_4.22.10.bb}    | 45 ++++++++++++++++++----
 5 files changed, 113 insertions(+), 42 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0008-build-raise-xsltproc-maxdepth-for-manpage-build.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.9.bb => samba_4.22.10.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
index a498348c20..dea0bab99e 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
@@ -9,25 +9,14 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
 Rebase to 4.14.4
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Rebase to 4.23.5
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
- lib/ldb/wscript    | 2 +-
  lib/talloc/wscript | 2 +-
  lib/tdb/wscript    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/lib/ldb/wscript b/lib/ldb/wscript
-index ed5d45f..de3c648 100644
---- a/lib/ldb/wscript
-+++ b/lib/ldb/wscript
-@@ -144,7 +144,7 @@ def configure(conf):
-         conf.DEFINE('EXPECTED_SYSTEM_LDB_VERSION_RELEASE', int(v[2]))
- 
-     if conf.env.standalone_ldb:
--        conf.CHECK_XSLTPROC_MANPAGES()
-+        #conf.CHECK_XSLTPROC_MANPAGES()
- 
-         # we need this for the ldap backend
-         if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', 'lber ldap', headers='lber.h ldap.h'):
 diff --git a/lib/talloc/wscript b/lib/talloc/wscript
 index 075f1ec..9bd9f73 100644
 --- a/lib/talloc/wscript
@@ -56,4 +45,3 @@ index 5e6a928..f13cf2a 100644
      conf.SAMBA_CHECK_PYTHON_HEADERS()
 -- 
 2.25.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
index 2c9d29c9fe..aa25966d31 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
@@ -37,7 +37,7 @@ diff --git a/wscript b/wscript
 index 95ddd9e..6d9577a 100644
 --- a/wscript
 +++ b/wscript
-@@ -123,6 +123,13 @@ def options(opt):
+@@ -131,6 +131,13 @@
                    help=('Disable kernely keyring support for credential storage'),
                    action='store_false', dest='enable_keyring')
  
@@ -48,9 +48,6 @@ index 95ddd9e..6d9577a 100644
 +                   help=("Disable use of valgrind"),
 +                   action="store_false", dest='enable_valgrind', default=False)
 +
-     gr = opt.option_group('developer options')
+     opt.samba_add_onoff_option('ldap')
  
-     opt.load('python') # options for disabling pyc or pyo compilation
--- 
-2.25.1
-
+     opt.option_group('developer options')
diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
index c72bd133ee..ac4c85eeb5 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
@@ -19,7 +19,7 @@ diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
 index 30cb366..d167551 100644
 --- a/buildtools/wafsamba/wscript
 +++ b/buildtools/wafsamba/wscript
-@@ -145,6 +145,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
+@@ -155,6 +155,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
                     help=("Disable use of gettext"),
                     action="store_true", dest='disable_gettext', default=False)
  
@@ -37,7 +37,7 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
 index 9dd9b48..a22ae59 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -444,20 +444,21 @@ def configure(conf):
+@@ -444,31 +444,32 @@
  
      strlcpy_in_bsd = False
  
@@ -46,28 +46,48 @@ index 9dd9b48..a22ae59 100644
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 -                               checklibc=True):
 -            strlcpy_in_bsd = True
--    if not conf.CHECK_FUNCS('getpeereid'):
--        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
--        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS('setproctitle_init'):
--        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
--
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
+-    elif conf.env.enable_fuzzing:
+-        # Just to complicate it more, some versions of Honggfuzz have
+-        # got strlcpy and strlcat in libc, but not in <string.h>
+-        # (unless it is there coincidentally, on a BSD). Therefore we
+-        # can't use CHECK_FUNCS alone to decide whether to add the
+-        # headers to replace.h.
+-        #
+-        # As this is only known to happen on a fuzzing compiler, we'll
+-        # skip the check when not in fuzzing mode.
+-        conf.CHECK_HEADERS('bsd/string.h')
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
 +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 +                                   checklibc=True):
 +                strlcpy_in_bsd = True
++        elif conf.env.enable_fuzzing:
++            # Just to complicate it more, some versions of Honggfuzz have
++            # got strlcpy and strlcat in libc, but not in <string.h>
++            # (unless it is there coincidentally, on a BSD). Therefore we
++            # can't use CHECK_FUNCS alone to decide whether to add the
++            # headers to replace.h.
++            #
++            # As this is only known to happen on a fuzzing compiler, we'll
++            # skip the check when not in fuzzing mode.
++            conf.CHECK_HEADERS('bsd/string.h')
+ 
+-    if not conf.CHECK_FUNCS('getpeereid'):
+-        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
+-        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
+-    if not conf.CHECK_FUNCS('setproctitle_init'):
+-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('setproctitle_init'):
 +            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
-+
+ 
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
  
@@ -94,4 +114,3 @@ index 44f92a8..79e8d09 100644
      bld.SAMBA_BINARY('texpect',
 -- 
 2.25.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0008-build-raise-xsltproc-maxdepth-for-manpage-build.patch b/meta-networking/recipes-connectivity/samba/samba/0008-build-raise-xsltproc-maxdepth-for-manpage-build.patch
new file mode 100644
index 0000000000..d2ba9e0e67
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0008-build-raise-xsltproc-maxdepth-for-manpage-build.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Himanshu Jadon <hjadon@cisco.com>
+Date: Thu, 11 Jun 2026 06:00:00 -0700
+Subject: [PATCH] build: raise xsltproc maxdepth for manpage build
+
+The generated smb.conf.5 DocBook input in Samba 4.22.10 is large enough
+to hit libxslt's default recursion limit while the DocBook manpage
+stylesheet runs string.subst. Raise the xsltproc maxdepth for the final
+Samba manpage transform to avoid failing with:
+
+  xsltApplySequenceConstructor: A potential infinite template recursion
+  was detected.
+
+This changes only the documentation generation command and does not
+alter the generated Samba binaries.
+
+Upstream-Status: Pending
+
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ buildtools/wafsamba/wafsamba.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildtools/wafsamba/wafsamba.py b/buildtools/wafsamba/wafsamba.py
+index 8edcc74..5f9b4ac 100644
+--- a/buildtools/wafsamba/wafsamba.py
++++ b/buildtools/wafsamba/wafsamba.py
+@@ -1217,7 +1217,7 @@ def SAMBAMANPAGES(bld, manpages, extra_source=None):
+                             rule='''XML_CATALOG_FILES="${SAMBA_CATALOGS}"
+                                     export XML_CATALOG_FILES
+                                     ${XSLTPROC} --xinclude --stringparam noreference 0 -o ${TGT}.xml --nonet ${SAMBA_EXPAND_XSL} ${SRC[0].abspath(env)}
+-                                    ${XSLTPROC} --nonet -o ${TGT} ${SAMBA_MAN_XSL} ${TGT}.xml'''
++                                    ${XSLTPROC} --maxdepth 10000 --nonet -o ${TGT} ${SAMBA_MAN_XSL} ${TGT}.xml'''
+                             )
+         bld.INSTALL_FILES('${MANDIR}/man%s' % m[-1], m, flat=True)
+ Build.BuildContext.SAMBAMANPAGES = SAMBAMANPAGES
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.22.10.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.22.10.bb
index d50d9f5155..654351c15f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.22.10.bb
@@ -12,7 +12,11 @@ ${SAMBA_MIRROR}    http://mirror.internode.on.net/pub/samba \n \
 ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
 "
 
-export PYTHONHASHSEED="1"
+export PYTHONHASHSEED = "1"
+
+# If XML_CATALOG_FILES env var is not defined, waf defaults
+# to build host folders looking for catalogs.
+export XML_CATALOG_FILES = ""
 
 SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://smb.conf \
@@ -24,6 +28,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
            file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
+           file://0008-build-raise-xsltproc-maxdepth-for-manpage-build.patch \
            "
 
 SRC_URI:append:libc-musl = " \
@@ -31,9 +36,9 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "71ed406444714c90bb9d36c576d807b67af15449f297e91106d42b3ca2fa5549"
+SRC_URI[sha256sum] = "e601437cde4845a42e7818379cd0ad5fc4fa518a7cf5284cc0a2657e79b30c34"
 
-UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.22(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
@@ -42,7 +47,7 @@ CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonS
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka docbook-xml-dtd4-native bison-native"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
@@ -57,7 +62,7 @@ INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
 SYSTEMD_PACKAGES = "${PN}-base ${PN}-ad-dc winbind ctdb"
-SYSTEMD_SERVICE:${PN}-base = "nmb.service smb.service"
+SYSTEMD_SERVICE:${PN}-base = "nmb.service smb.service samba-bgqd.service"
 SYSTEMD_SERVICE:${PN}-ad-dc = "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'samba.service', '', d)}"
 SYSTEMD_SERVICE:winbind = "winbind.service"
 SYSTEMD_SERVICE:ctdb = "ctdb.service"
@@ -127,6 +132,19 @@ EXTRA_OECONF += "--enable-fhs \
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
+do_configure:prepend() {
+    # The xsltproc tool is actually a wrapper script in OE, which exports its own XML_CATALOG_FILES env var
+    # However samba does that too. So here I'm trying to concatenate the variables.
+    # The original looks like this in the wrapper:
+    # export XML_CATALOG_FILES=oe-core-specific-thing
+    # and this sed prepends the value with $XML_CATALOG_FILES, and encloses it in quotes. So the end value is
+    # export XML_CATALOG_FILES="$XML_CATALOG FILES oe-core-specific-thing"
+    # The first grep just checks if it was already done, so it is not prepended multiple times.
+
+    grep \$XML_CATALOG_FILES ${STAGING_BINDIR_NATIVE}/xsltproc || \
+        sed -i 's,\(XML_CATALOG_FILES\)=\(.*\),\1="\$XML_CATALOG_FILES \2",' ${STAGING_BINDIR_NATIVE}/xsltproc
+}
+
 do_configure:append() {
     cd ${S}/pidl/
     perl Makefile.PL PREFIX=${prefix}
@@ -208,6 +226,18 @@ do_install:append() {
     find ${D}${libdir}/perl5/ -type f -name "perllocal.pod" -delete
     find ${D}${libdir}/perl5/ -type f -name ".packlist" -delete
     sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${bindir}/pidl
+
+    sed -i 's,${WORKDIR},,g' ${S}/bin/default/libcli/wsp/wsp_aqs_lexer.c
+    sed -i 's,${WORKDIR},,g' ${S}/bin/default/libcli/wsp/wsp_aqs_lexer.h
+
+    # Phoenix installs standalone libldb with Samba; keep libldb as the
+    # provider of the common ldb command-line tools to avoid rootfs clashes.
+    rm -f ${D}${bindir}/ldbadd \
+          ${D}${bindir}/ldbdel \
+          ${D}${bindir}/ldbedit \
+          ${D}${bindir}/ldbmodify \
+          ${D}${bindir}/ldbrename \
+          ${D}${bindir}/ldbsearch
 }
 
 PACKAGES =+ "${PN}-python3 ${PN}-pidl \
@@ -240,13 +270,14 @@ PACKAGESPLITFUNCS:prepend = "samba_populate_packages "
 PACKAGES_DYNAMIC = "samba-auth-.* samba-pdb-.*"
 
 RDEPENDS:${PN} += "${PN}-base ${PN}-python3 ${PN}-dsdb-modules python3"
-RDEPENDS:${PN}-python3 += "pytalloc python3-tdb pyldb"
+RDEPENDS:${PN}-python3 += "pytalloc python3-tdb"
 
 FILES:${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
                     ${sysconfdir}/init.d \
                     ${systemd_system_unitdir}/nmb.service \
-                    ${systemd_system_unitdir}/smb.service"
+                    ${systemd_system_unitdir}/smb.service \
+                    ${systemd_system_unitdir}/samba-bgqd.service"
 
 FILES:${PN}-ad-dc = "${sbindir}/samba \
                      ${systemd_system_unitdir}/samba.service \

