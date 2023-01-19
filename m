Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90518C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 14:15:31 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.138])
 by mx.groups.io with SMTP id smtpd.web11.46218.1674137722969875984
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 06:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=K809npKt;
 spf=pass (domain: est.tech, ip: 40.107.104.138, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQGARHpXE5m8TnpEQt6U5pf5brprz4w/s5poI00Z5D9Ioh2z7Ug7Ci6Pdxd02XfJmtcDbDG8kW4kiCzE+KvAkW7f276dVISbiejDTuDQCle552v58i7K4cSE0onz8JiXpaoii6sE3Iy61rLMHfIzTLvVZNwUcH37mJYpteiyT/00YH+HD6p39N2/AOlddSnlGimkkmbywC2iI1VNKYmZOPn9K5FXfWXxTJ8edZHEKWR510jJHVt1p869sDJmDXLjZgkBbIdVwao/6hUxv652xCACauvGqTbSyckVajAhHYZiWwnPgY8g1JRWaxzT05kY6GJ+7UFwsRTste3//sAIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0C8NH5K0CGraM4DAOQIxdEuJnsDMkKL94txx/HHzL0=;
 b=JtE3Oj60FOkbBXIcNek0hp1GO+AMhrz8FQkyAoFleth8SMMxmxA0NxmNo9brt5Bf/cTSoaSFiq5fXPu2zJ1X3iw4RE+SlYWwu/3ChEQfUgeZqP0tmXYmeEzoVcsbycQLSKV0RpnvSPX7nY9Xh/kz9jzRoSb9gzAJ9Xp/1xNUMIsWHdjufnwZcdm/Fx7fBJtbrPFIdLm2SjuP3e5Ff8Hz4Q+fwUQ76hGY0jvVmrzNtpqgYTYTS3kRQHYvx22qAqxAjW5LLAFn58jcIL2YROOATDcl1vk/cFe/pHFnvCDLHWdR0mGsfaR+sha9kP7UpQNsmjfkj/gcsT5JHO2qyqOvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0C8NH5K0CGraM4DAOQIxdEuJnsDMkKL94txx/HHzL0=;
 b=K809npKtvM57MgzUbB5ejJ1MyKhU51A10lfTiPxmUQNGL+5TLo8+J2wP5vCxPX2ujW6+Zyy1gZMdpmZOw82lhlSjM5svlAFO0PxDL36gt4D1pZlq9QyGnrWO4JAvvVdQ0RLue9OxE+QCd3dHE1pPQe2Z4KtsnxdKNzdlxFvyP2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by AS8P189MB2093.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:521::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:15:19 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%7]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 14:15:19 +0000
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Ravineet Singh <ravineet.a.singh@est.tech>
Subject: [PATCH] gnutls: add initial ptest support
Date: Thu, 19 Jan 2023 15:15:11 +0100
Message-ID: <20230119141511.29010-1-ravineet.a.singh@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::32) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|AS8P189MB2093:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b314c7-abf4-45b8-997e-08dafa27981b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uqgG7aaHFdwttaUhSgU5ax7Gzu7o9QtIn5w/8VvF7t1ICnHMvP0256bpBnCj2HkcrfXRaYhGelmK5BWM3009RRMASGOcY4X3XSu2GJKMxJehsYV06s3k6drafv4LxS0fNyMjPS0xVDTB42QT8T/2qjTU8aq2dh3wLaYNyPVYsaIe0Mf5UlEuDxLzTrCTkHGMgSh5O2QnBAmDj/r1lkbMYz+s5gBA1F4dhrsIVp2LEn/2jNVo2ce4S3XojzloPJdw8W53PROZrM6rgKOwG3TO0lBOAd3KAu7iptlnDa5xjEn5Rg3hGpLQgVL3gZ3RvuoAdcOmzwME88IIv81yCf/sLVphBXMLBqX+w0/4IftZj67FuBLLjPYaIzcJbumqmbicLOCVXmxsCnb9e3LpiXtROCpqkyXWSMZvfgp4rm4idJXThN32GrjIbi1UmugbSMtlvBCXN2WCNVX8Nw0sDdD7WKavoDKMX+0y3SM5quAzS4++vGW/xMywlefQnoQMj7IFTpkBHLDm4iSHj4K7mKjUlMeBgetwqYPZk5br58MMvOdwFHsyJ8yZx26ZftftihDz81nB/v0NaAZRJvzaLLCJS1J7QXwEC9KQUZD+oIVHtxRMPduR7HLgIYsV/2jaPuscy8JW5cg0i4BJELyH+YRCiU9umsz1Hv1c9WHvVZL5Iew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(39840400004)(346002)(136003)(451199015)(8676002)(4326008)(6916009)(316002)(41300700001)(66946007)(86362001)(66476007)(66556008)(6666004)(83380400001)(2906002)(36756003)(103116003)(8936002)(6486002)(1076003)(38100700002)(6506007)(478600001)(186003)(6512007)(2616005)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DD2zhGIx2U+dXjbGBjCCdbDOXsqYfrO0uLCuZfhGEE2Agbgy+IIOOi7wP3DB?=
 =?us-ascii?Q?mvFCtpjC8IwkuKlbR5+nYo3+CNcFeiO5TIn0vlF2cw6oSasKQ3DAPHQ2si9j?=
 =?us-ascii?Q?VYjlTDnu5ib4I/MPyPJVPL2Thy/S/9gWFd+GX/yvKPdqZTeAwgvBy5ZE7fww?=
 =?us-ascii?Q?T6qEBXOsVoi6HU8nxXSncgXa6WJq05Qj3rHxFXU5JPPuAiTGMuZH2CWvE+14?=
 =?us-ascii?Q?HoC6fTlmkF/WsOU1A2p65IWpee9DZSP6tzoXMQxNULXAoNMXgE3ielO3ATYl?=
 =?us-ascii?Q?gzgFns7vzIk7GeqSZI6DG1yHQ9ynfmkBcESDmwuRmDM/pJK3la4t8ijK6z1l?=
 =?us-ascii?Q?lTbLZgAdNu5WJppC0Ncl33IYpyJ9I6Iz7GiYMzPNDngpuXcbEzNAryrTkEI6?=
 =?us-ascii?Q?vBEvk3DYXqK4gggbVV+LSgZpw3JrzDN6MF3JVkWR7VJuWuIjo9E4dq5zvENL?=
 =?us-ascii?Q?b3pQfhQ43aAVMCM5fuBoZ8PXRW+FqpCgZBusiGwcxsTGUS+tu23niuSY3+k5?=
 =?us-ascii?Q?L5Htibuk3XOx3nnC7maSbFSfVmMdjaQGBwsJbfZGkUPEbGDlmwwz6cAAWJMt?=
 =?us-ascii?Q?wR8tMOM74jGKYPM8N680v6mU+/v1bTpxnQtlNPAgVlmuvCp1+itfHsYwcL1H?=
 =?us-ascii?Q?65VNH5Nj4SsHU44gu5tauotiUpV5iwKLGWCpq0xmCVfPC/y7ym2j6NXnE7Gt?=
 =?us-ascii?Q?m/zt4SgSgIWhQWzdcyNdD45SeEeEs/VX2KuK3wZYdlsxsJcGsU0R72NwE+uE?=
 =?us-ascii?Q?Bw1SBl0zVFWJvGgSVtZMmnaeTI+6znBDIj0uM59OPi6Wh1RLMYquDUzSl1Tv?=
 =?us-ascii?Q?IJ63Xe4a1bxZJhy1Eh+IhCF8YbWUJv4vo/YsxTVddfKLgHimkTlb9l12CEGi?=
 =?us-ascii?Q?1LkyOJ/ouX4bJ0+diMgKlgClWPHoochmVOofS1qAD1ZqixwGS1vdrjAzG1le?=
 =?us-ascii?Q?3KLIGp32KLmImPU6IJA81dfbPVJtRAy/ZKR30VtAT1wYBfe8qEehLgCUMTgk?=
 =?us-ascii?Q?kdDMob2UGKGB7pj7cVi4bgVq1FpWHZ+kqT1/7ybjgKmLS4jDhZWyXOltqCqb?=
 =?us-ascii?Q?WkSUqi18iRdsxBLg03iGxfZ847Q+cVbNScUoFdPQcRMErvVeG+xKisMKweA/?=
 =?us-ascii?Q?ZVWigmfcAj77u8RVCbn75o2/Dab801/cxlC3algDbqaHoOBF64Tn9oZAagUM?=
 =?us-ascii?Q?Qxiw3++O0vcbN8jyMdnLX0WhZdP9c7AAsLmdzjZLBtELhzS0o6o23wG4PzDB?=
 =?us-ascii?Q?u+F0tk2Cl6n1rpp3gOWQMkPBb1M+txB5B1IQZxyP5H4Bc8okoXvvLxkcb5F9?=
 =?us-ascii?Q?M+29mNb1fdXio+W5rg+jImv9Zie+lAXik4XOjXKmlwp5cws6Yh7lkGu05hby?=
 =?us-ascii?Q?Mo9bUyzfsRW5I6MAJsH5YQSXBV0PbsPWs6QMYJGPSkzes35ErpxiNNHdkscV?=
 =?us-ascii?Q?NAXKYNIJOJysDOuI6O96333SjTSCc5K0o1IGXw9YHQ2qdaRJ9VbCnKqfNqmt?=
 =?us-ascii?Q?g1a7dhUDDu1WotGH4lLW9M9Vm7HFx9Om7Nt2oelimAGokJq8kJ7SF8E4PaLa?=
 =?us-ascii?Q?bsVv0is8/quKvbTehWiuBiDFRT4fLYyMOP6rEeunRXORuQ6uSCy1flJsIqhh?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b314c7-abf4-45b8-997e-08dafa27981b
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:15:19.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Jj2P+02ckXr/omG2AQvI2nRrj1X+Q7hduVAOLoSSELintp9VKFPTfM48Hl6ASTA5d66HY4VSQQmJqtPJeKf8s34Y1oQw4aCEEzlIPkthzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 14:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100658

Step 1 of adding gnutls unit-tests into ptest. Only self-contained
test (no external file system dependencies) are included in this step.

Sample output:
root@qemux86-64:~# ptest-runner gnutls
START: ptest-runner
BEGIN: /usr/lib64/gnutls/ptest
PASS: aead-cipher-vec
PASS: alerts
PASS: anti_replay
...
gnutls test summary:
--------------------
total: 375
pass : 364
fail : 0
skip : 11

DURATION: 184
END: /usr/lib64/gnutls/ptest
2023-01-13T11:32
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 .../gnutls/gnutls/Add-ptest-support.patch     | 59 ++++++++++++
 meta/recipes-support/gnutls/gnutls/run-ptest  | 89 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.8.bb   | 11 ++-
 3 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/Add-ptest-support.pa=
tch
 create mode 100644 meta/recipes-support/gnutls/gnutls/run-ptest

diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/m=
eta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
new file mode 100644
index 0000000000..965568cfd6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -0,0 +1,59 @@
+From 74080376904713a8e6cceefbc25c81512796bf0c Mon Sep 17 00:00:00 2001
+From: Ravineet Singh <ravineet.a.singh@est.tech>
+Date: Tue, 10 Jan 2023 16:11:10 +0100
+Subject: [PATCH] gnutls: add ptest support
+
+Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
+---
+ Makefile.am       | 3 +++
+ configure.ac      | 2 ++
+ tests/Makefile.am | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 843193f9f..816b09fec 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -191,6 +191,9 @@ dist-hook:
+ 	mv ChangeLog $(distdir)
+ 	touch -c $(distdir)/doc/*.html $(distdir)/doc/*.pdf $(distdir)/doc/*.inf=
o
+=20
++install-ptest:
++	 $(MAKE) -C tests DESTDIR=3D$(DESTDIR)/tests $@
++
+ .PHONY: abi-check abi-dump-versioned abi-dump-latest pic-check symbol-che=
ck local-code-coverage-output files-update AUTHORS
+=20
+ include $(top_srcdir)/cligen/cligen.mk
+diff --git a/configure.ac b/configure.ac
+index baff1c007..f9f596abf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+=20
+ AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
+=20
++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
++
+ AC_DEFINE([GNUTLS_INTERNAL_BUILD], 1, [We allow temporarily usage of depr=
ecated functions - until they are removed.])
+=20
+ hw_features=3D
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 573e911a0..e8a26f8b9 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -644,6 +644,12 @@ SH_LOG_COMPILER =3D $(SHELL)
+ AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
+ LOG_COMPILER =3D $(LOG_VALGRIND)
+=20
++install-ptest: $(check_PROGRAMS)
++	@$(INSTALL) -d $(DESTDIR)
++	@for file in $^; do \
++		$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
++	done
++
+ distclean-local:
+ 	rm -rf softhsm-*.db softhsm-*.config *.tmp tmp-* x509-crt-list-import-ur=
l.config.db port.lock.d
+=20
+--=20
+2.31.1
+
diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-su=
pport/gnutls/gnutls/run-ptest
new file mode 100644
index 0000000000..13d4906faa
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -0,0 +1,89 @@
+#!/bin/bash
+
+function rjob() {
+    local job=3D$1
+    local log=3D$2
+
+    # TODO: Output will be garbled
+    ./${job} >> ${log} 2>&1
+
+    ret=3D$?
+    case $ret in
+    0)
+        echo "PASS: $t" >> ${log}
+        echo "PASS: $t"
+        ;;
+    77)
+        echo "SKIP: $t" >> ${log}
+        echo "SKIP: $t"
+        ;;
+    *)
+        echo "FAIL: $t" >> ${log}
+        echo "FAIL: $t"
+        ;;
+    esac
+}
+
+function is_disallowed() {
+    local key=3D$1
+    $(echo ${test_disallowlist} | grep -w -q ${key})
+    return $?
+}
+
+# TODO
+# This list should probably be in a external file
+# Testcases defined here either take very long time (dtls-stress)
+# or are dependent on local files (certs, etc) in local file system
+# currently not exported to target.
+
+test_disallowlist=3D""
+test_disallowlist=3D"${test_disallowlist} dtls-stress"
+test_disallowlist=3D"${test_disallowlist} handshake-large-cert"
+test_disallowlist=3D"${test_disallowlist} id-on-xmppAddr"
+test_disallowlist=3D"${test_disallowlist} mini-x509-cas"
+test_disallowlist=3D"${test_disallowlist} pkcs12_simple"
+test_disallowlist=3D"${test_disallowlist} protocol-set-allowlist"
+test_disallowlist=3D"${test_disallowlist} psk-file"
+test_disallowlist=3D"${test_disallowlist} rawpk-api"
+test_disallowlist=3D"${test_disallowlist} set_pkcs12_cred"
+test_disallowlist=3D"${test_disallowlist} system-override-curves-allowlist=
"
+test_disallowlist=3D"${test_disallowlist} system-override-hash"
+test_disallowlist=3D"${test_disallowlist} system-override-sig"
+test_disallowlist=3D"${test_disallowlist} system-override-sig-tls"
+test_disallowlist=3D"${test_disallowlist} system-prio-file"
+test_disallowlist=3D"${test_disallowlist} x509cert-tl"
+
+LOG=3D${PWD}/tests.log
+cd tests
+max_njobs=3D$(grep -c ^processor /proc/cpuinfo)
+njobs=3D0
+
+for t in *; do
+    [ -x $t ] || continue
+    [ -f $t ] || continue
+
+    is_disallowed ${t}
+    [ $? -eq 0 ] && continue
+
+    rjob ${t} ${LOG} &
+    njobs=3D$((njobs+1))
+    if [ ${njobs} -eq ${max_njobs} ]; then
+        wait
+        njobs=3D0
+    fi
+done
+wait
+
+skipped=3D$(grep -c SKIP ${LOG})
+passed=3D$(grep -c PASS ${LOG})
+failed=3D$(grep -c FAIL ${LOG})
+total=3D$((passed+failed+skipped))
+
+echo
+echo "gnutls test summary:"
+echo "--------------------"
+echo "total: ${total}"
+echo "pass : ${passed}"
+echo "fail : ${failed}"
+echo "skip : ${skipped}"
+echo
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.8.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.7.8.bb
index 8f979a5b99..2e3f6e2430 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
@@ -22,11 +22,13 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.get=
Var('PV').split('.')[1]}"
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-$=
{PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-env=
i.patch \
+           file://run-ptest \
+           file://Add-ptest-support.patch \
            "
=20
 SRC_URI[sha256sum] =3D "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c5197=
7fb396d4617114"
=20
-inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
+inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
 PACKAGECONFIG ??=3D "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccom=
p', d)}"
=20
@@ -68,6 +70,11 @@ do_install:append:class-target() {
         fi
 }
=20
+TESTDIR =3D "tests"
+do_compile:append() {
+        oe_runmake ${PARALLEL_MAKE} -C ${TESTDIR} buildtest-TESTS
+}
+
 PACKAGES =3D+ "${PN}-openssl ${PN}-xx ${PN}-fips"
=20
 FILES:${PN}-dev +=3D "${bindir}/gnutls-cli-debug"
@@ -75,6 +82,8 @@ FILES:${PN}-openssl =3D "${libdir}/libgnutls-openssl.so.*=
"
 FILES:${PN}-xx =3D "${libdir}/libgnutlsxx.so.*"
 FILES:${PN}-fips =3D "${bindir}/fipshmac"
=20
+RDEPENDS:${PN}-ptest +=3D "bash"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 pkg_postinst_ontarget:${PN}-fips () {
--=20
2.34.1


