Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62FDC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 14:01:36 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.59])
 by mx.groups.io with SMTP id smtpd.web12.7498.1663855287233088996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 07:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=fhKpMtbN;
 spf=pass (domain: siemens.com, ip: 40.107.15.59,
 mailfrom: andrej.kozemcak@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrQa575j3BQ25YUZEicSsaMuGMPWnxKVx/OHxuFQ0M7ts9QxUCAagGs2SxAN8/qHz/Qazfse7vCDYYxM+86L7K4ZLVJM7jX+4sMm+Zx0AE7SL8AqFm6xNRPW5Mx5cjBTMxj7Sh/H6m1N4SxAXQEZIjRic7R5bZL+oR0sTX2A9pL5qwuAIAiyEIhdnOvDTgBR9iC+N5mDr8BEAQEfnLtYm1BV73VDHYj/iDuNdzhNyKd2MpOuNjxmvT6/5i9PbZzs8IrPWn7sTxJ9f29//q6ikU9MPzimII5NyXxpirbWCtTNA1y47mEjzgSdsUdXd0wbdZV88JJDgt88Vk1xCI/8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stbskUUA8qj/tIloK08qrTxb2Hw3DKXlob/e3+L5GYA=;
 b=eKz7zJDoOhhnXon/FP9vmqwzia/6cJXcap64wdH0Bbwhskmwfh5Xp1z+M1oneL9hQN545DakRKLGGuVq2EtabgFIakT0H5Z7TN8k1MjQaEK7J4XpKxHS0RYZEK9MeVOpSOHW3wFI6HLawVWUhzYei4tVqhR+R+riFGGMprhHmemYPI6NtKomAhw72GOo5XOkwNZJr50PRwPyir2wYM0CfJSZy5w7dRZoT/XccA/gISl/IsZT5J4VMgZjxBWvnrhGoK2EZJglQlvA5mK7ZmgfnG3KIozBPnMaDWmo477U/FJAhkqZSne0vpYHmlN8BXY7e1JX0B2uodZp3PBDBde9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stbskUUA8qj/tIloK08qrTxb2Hw3DKXlob/e3+L5GYA=;
 b=fhKpMtbNV+0Vw4xLEhs2YAydYDf6uZhWOCCz9tiRoabmEAcsteN0WAOl2BDZX1BoRgvXsARo7hYvO8iXDHl8r0xJp7ozebqe5Jd9kw0iFpCe+xPE0EaBubobx9Gz9ILo60IQWtT7YR7E1fgl1WFixLHhVm2SXsxT9ZphPZlUFwncQyfLyLLaSJhn4IkSyrtPe+c97899XsD28ftM+akCzfIBvW0MWqheKDhHhk1ArSJkDnZh5R2EyR6x7sVEX2Nsz8NacgNzi6nmlMKKLB6sW1wqhovjX/Mvp8XfX3uSkfnv8QlmMYqbpezAxMTao63Cxf7eNqei8HNt2ieaBT+sWg==
Received: from FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::16)
 by AS2PR10MB7501.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:593::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.15; Thu, 22 Sep
 2022 14:01:24 +0000
Received: from VE1EUR01FT077.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::42) by FR0P281CA0077.outlook.office365.com
 (2603:10a6:d10:1e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.7 via Frontend
 Transport; Thu, 22 Sep 2022 14:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT077.mail.protection.outlook.com (10.152.3.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 14:01:23 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 22 Sep 2022 15:58:05 +0200
Received: from dev.vm8.ccp.siemens.com (163.242.51.115) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 22 Sep 2022 15:58:04 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm8.ccp.siemens.com (Postfix) with ESMTP id 6C4673478E1A;
	Thu, 22 Sep 2022 15:58:01 +0200 (CEST)
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-networking][PATCH] squid: upgrade 4.15 -> 5.7
Date: Thu, 22 Sep 2022 15:57:45 +0200
Message-ID: <20220922135745.611494-2-andrej.kozemcak@siemens.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922135745.611494-1-andrej.kozemcak@siemens.com>
References: <20220922135745.611494-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.51.115]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT077:EE_|AS2PR10MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 18311532-e584-470a-47b1-08da9ca2ef28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h2EmRA+nFGSBHak/eEw+jar2jKF5zv6jgPNjh+H0rHheYLQ+4F+sNZjet/ENuf3X43zO8TmB4+UdsOjeFWHo1UCkwV25uf3RusB+ccamlTrBdUg0wBCmqArTEGot2RAGlkBJ629rXMKDLbQ5fOH5VEaU1Q+sACeww1jfHRhcT5SeE2qZEXjtU/84fgPpkNxQOS9rZ7YwubgHZPOSCj+6qoWiTzIaZYJzjZ316ryzOp9RwRLORcxbHPB/n2tA+WPCFLSQdowXBaHnYT1NufFxAkBkxegtriPFM5+4Dl9NexQEJ210LwNy3lheeeoWU3lLPJnV43HeuMTuUrG8saOCImRsH1b7H/wwIXCaMckojB7vHVZbm/zgGWEBZ223yXEjGfHc9b/bQTBQRznM8XuLrV02iCxQ4f05tl7llUDLc1uJ+HNBw30nk/XTIw+fw5j6dh9Jw/IAmIfWa0ZL0nxIxlqO++iAEd//HBrhBczdh1xe8wYIFfiiMWDGDb7lyJy/g5ZviA8C23ZNAJjUkDgz1114Fe1BxmmmEB6r1CZ7pOi+4rBvdRmVdkJgo7Khca1rRvdgzNc4yF+y2Z5pY+T9oMGw92NhKvcU0jz2GhhWQwBdG9JUT2x71JrfCIkPsTwFCIrvVEpfNz9eBXTXYNBpDwaxa3CIPSyY4+wBi+goVPas8HeHZW8NeaQT/jpSIfJUEif9JTm7VUjWwIr/1KWqy3qcOaR6KqwFOfui8qj/kmaZI853A19ADomnpwdtZExNT+8W9uZ3eaBjAwt6IBC/fpdvLxaDhsd4FObednyQImE=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(336012)(86362001)(426003)(83380400001)(1076003)(186003)(6916009)(5660300002)(47076005)(36860700001)(8676002)(30864003)(4326008)(44832011)(82310400005)(41300700001)(70586007)(70206006)(2906002)(6266002)(2616005)(26005)(7126003)(40480700001)(107886003)(316002)(19627235002)(6666004)(478600001)(40460700003)(36756003)(82740400003)(7636003)(356005)(7596003)(82960400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 14:01:23.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18311532-e584-470a-47b1-08da9ca2ef28
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT077.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7501
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 14:01:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98928

- drop included patches
- refresh remaining patches
- update to new ptest

Licence change: update year

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...0001-Fix-build-on-Fedora-Rawhide-772.patch | 82 -------------------
 ...y.cc-fix-bind-is-not-a-member-of-std.patch | 31 -------
 ...tools.cc-fixed-unused-result-warning.patch | 34 --------
 ...d-dynamic-ldb-link-test-in-configure.patch |  2 +-
 .../files/Skip-AC_RUN_IFELSE-tests.patch      | 15 ++--
 ...-t-do-squid-conf-tests-at-build-time.patch |  8 +-
 .../squid/{squid_4.15.bb =3D> squid_5.7.bb}     | 21 +++--
 7 files changed, 27 insertions(+), 166 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-Fix-bu=
ild-on-Fedora-Rawhide-772.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-splay.=
cc-fix-bind-is-not-a-member-of-std.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-tools.=
cc-fixed-unused-result-warning.patch
 rename meta-networking/recipes-daemons/squid/{squid_4.15.bb =3D> squid_5.7=
.bb} (86%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-=
Fedora-Rawhide-772.patch b/meta-networking/recipes-daemons/squid/files/0001=
-Fix-build-on-Fedora-Rawhide-772.patch
deleted file mode 100644
index ff51f5344..000000000
--- a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-=
Rawhide-772.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 1f8b5f0e1cc27634a7310be4c9674112f919d974 Mon Sep 17 00:00:00 2001
-From: uhliarik <luhliari@redhat.com>
-Date: Thu, 18 Feb 2021 01:08:40 +0000
-Subject: [PATCH] Fix build on Fedora Rawhide (#772)
-
-* add SYSTEMD_LIBS to all binaries using client_side.cc, fixing linking
-* add `<limits>` to all sources using std::numeric_limits, fixing gcc-11
-  builds
----
-Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1c=
c27634a7310be4c9674112f919d974]
- src/Makefile.am               | 4 ++++
- src/ip/QosConfig.cc           | 1 +
- src/ipc/mem/PageStack.cc      | 1 +
- src/ssl/helper.cc             | 2 ++
- 4 files changed, 8 insertions(+)
-
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -2320,6 +2320,7 @@ tests_test_http_range_LDADD =3D \
- 	$(SSLLIB) \
- 	$(KRB5LIBS) \
- 	$(LIBCPPUNIT_LIBS) \
-+	$(SYSTEMD_LIBS) \
- 	$(COMPAT_LIB) \
- 	$(XTRA_LIBS)
- tests_test_http_range_LDFLAGS =3D $(LIBADD_DL)
-@@ -2624,6 +2625,7 @@ tests_testHttpRequest_LDADD =3D \
- 	$(SSLLIB) \
- 	$(KRB5LIBS) \
- 	$(LIBCPPUNIT_LIBS) \
-+	$(SYSTEMD_LIBS) \
- 	$(COMPAT_LIB) \
- 	$(XTRA_LIBS)
- tests_testHttpRequest_LDFLAGS =3D $(LIBADD_DL)
-@@ -3487,6 +3489,7 @@ tests_testURL_LDADD =3D \
- 	$(SSLLIB) \
- 	$(KRB5LIBS) \
- 	$(LIBCPPUNIT_LIBS) \
-+	$(SYSTEMD_LIBS) \
- 	$(COMPAT_LIB) \
- 	$(XTRA_LIBS)
- tests_testURL_LDFLAGS =3D $(LIBADD_DL)
-@@ -3646,6 +3649,7 @@ nodist_tests_testYesNoNone_SOURCES =3D \
- tests_testYesNoNone_LDADD=3D \
- 	base/libbase.la \
- 	$(LIBCPPUNIT_LIBS) \
-+	$(SYSTEMD_LIBS) \
- 	$(COMPAT_LIB) \
- 	$(XTRA_LIBS)
- tests_testYesNoNone_LDFLAGS =3D $(LIBADD_DL)
---- a/src/ip/QosConfig.cc
-+++ b/src/ip/QosConfig.cc
-@@ -21,6 +21,7 @@
- #include "Parsing.h"
-=20
- #include <cerrno>
-+#include <limits>
-=20
- CBDATA_CLASS_INIT(acl_tos);
-=20
---- a/src/ipc/mem/PageStack.cc
-+++ b/src/ipc/mem/PageStack.cc
-@@ -14,6 +14,7 @@
- #include "Debug.h"
- #include "ipc/mem/Page.h"
- #include "ipc/mem/PageStack.h"
-+#include <limits>
-=20
- /// used to mark a stack slot available for storing free page offsets
- const Ipc::Mem::PageStack::Value Writable =3D 0;
---- a/src/ssl/helper.cc
-+++ b/src/ssl/helper.cc
-@@ -19,6 +19,8 @@
- #include "ssl/helper.h"
- #include "wordlist.h"
-=20
-+#include <limits>
-+
- Ssl::CertValidationHelper::LruCache *Ssl::CertValidationHelper::HelperCac=
he =3D nullptr;
-=20
- #if USE_SSL_CRTD
-=20
diff --git a/meta-networking/recipes-daemons/squid/files/0001-splay.cc-fix-=
bind-is-not-a-member-of-std.patch b/meta-networking/recipes-daemons/squid/f=
iles/0001-splay.cc-fix-bind-is-not-a-member-of-std.patch
deleted file mode 100644
index fbbad1597..000000000
--- a/meta-networking/recipes-daemons/squid/files/0001-splay.cc-fix-bind-is=
-not-a-member-of-std.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1def5b4278d97f197520d23c1dce52f93a1b2f46 Mon Sep 17 00:00:00 2001
-From: Andrej Valek <andrej.valek@siemens.com>
-Date: Tue, 9 Apr 2019 09:40:30 +0200
-Subject: [PATCH] splay.cc: fix bind is not a member of std
-
-fix
-| ../../squid-4.6/test-suite/splay.cc:134:28: error: 'bind' is not a membe=
r of 'std'
-|      auto nextRandom =3D std::bind (distribution, generator);
-|                             ^~~~
-| ../../squid-4.6/test-suite/splay.cc:134:28: note: 'std::bind' is defined=
 in header '<functional>'; did you forget to '#include <functional>'?
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
----
- test-suite/splay.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test-suite/splay.cc b/test-suite/splay.cc
-index f71b337..4e21adc 100644
---- a/test-suite/splay.cc
-+++ b/test-suite/splay.cc
-@@ -20,6 +20,7 @@
- #include <unistd.h>
- #endif
- #include <random>
-+#include <functional>
-=20
- class intnode
- {
---=20
-2.11.0
-
diff --git a/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixe=
d-unused-result-warning.patch b/meta-networking/recipes-daemons/squid/files=
/0001-tools.cc-fixed-unused-result-warning.patch
deleted file mode 100644
index f267875ed..000000000
--- a/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unuse=
d-result-warning.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 86dae8010310d13bd2a2beb006b4085d06ae1556 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 25 Jun 2017 00:59:24 -0700
-Subject: [PATCH] tools.cc: fixed unused-result warning
-
-fix
-| ../../squid-3.5.26/src/tools.cc: In function 'void enter_suid()':
-| ../../squid-3.5.26/src/tools.cc:616:11: error: ignoring return value of =
'int setuid(__uid_t)', declared with attribute warn_unused_result [-Werror=
=3Dunused-result]
-|      setuid(0);
-|      ~~~~~~^~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/tools.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/tools.cc b/src/tools.cc
-index 5829574..19f0836 100644
---- a/src/tools.cc
-+++ b/src/tools.cc
-@@ -581,8 +581,10 @@ enter_suid(void)
-         debugs (21, 3, "enter_suid: setresuid failed: " << xstrerr(xerrno=
));
-     }
- #else
--
--    setuid(0);
-+    if (setuid(0) < 0) {
-+        const auto xerrno =3D errno;
-+        debugs(50, DBG_IMPORTANT, "WARNING: no_suid: setuid(0): " << xstr=
err(xerrno));
-+    }
- #endif
- #if HAVE_PRCTL && defined(PR_SET_DUMPABLE)
-     /* Set Linux DUMPABLE flag */
diff --git a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic=
-ldb-link-test-in-configure.patch b/meta-networking/recipes-daemons/squid/f=
iles/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
index 1516bb014..a429b7b2d 100644
--- a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-li=
nk-test-in-configure.patch
+++ b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-li=
nk-test-in-configure.patch
@@ -19,7 +19,7 @@ diff --git a/configure.ac b/configure.ac
 index d2f7feb..c7ae568 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3235,6 +3235,16 @@ case "$host" in
+@@ -3268,6 +3268,16 @@ case "$host" in
  		;;
  esac
 =20
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE=
-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFEL=
SE-tests.patch
index dd83b62e6..10853333e 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.=
patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.=
patch
@@ -38,10 +38,10 @@ index ad0ba60..4477446 100644
    ])
  ]) dnl SQUID_CHECK_KRB5_HEIMDAL_BROKEN_KRB5_H
 diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
-index 7624b56..b449c5a 100644
+index 1e9333527c..2d42787029 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -217,7 +217,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
+@@ -227,7 +227,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
    [
     AC_MSG_RESULT([no])
    ],
@@ -52,14 +52,15 @@ index 7624b56..b449c5a 100644
 =20
  SQUID_STATE_ROLLBACK(check_const_SSL_METHOD)
  ])
-@@ -377,7 +379,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
+@@ -386,8 +386,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
+   [
     AC_MSG_RESULT([yes])
     AC_DEFINE(SQUID_USE_SSLLHASH_HACK, 1)
-   ],
+-  ],
 -[])
-+[
-+   AC_MSG_RESULT([skipped - can't test in cross-compiled env])
-+])
++  ],[
++    AC_MSG_RESULT([skipped - can't test in cross-compiled env])
++  ])
 =20
  SQUID_STATE_ROLLBACK(check_TXTDB)
  ])
diff --git a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squ=
id-conf-tests-at-build-time.patch b/meta-networking/recipes-daemons/squid/f=
iles/squid-don-t-do-squid-conf-tests-at-build-time.patch
index e5267ea2b..ea27285e0 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf=
-tests-at-build-time.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf=
-tests-at-build-time.patch
@@ -20,11 +20,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com=
>
  1 file changed, 7 insertions(+), 8 deletions(-)
=20
 diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
-index 061a463..350dfb2 100644
+index 0233c0e..e0021b6 100644
 --- a/test-suite/Makefile.am
 +++ b/test-suite/Makefile.am
-@@ -41,8 +41,7 @@ TESTS +=3D debug \
- 	MemPoolTest\
+@@ -40,8 +40,7 @@ TESTS +=3D debug \
+ 	splay\
  	mem_node_test\
  	mem_hdr_test\
 -	$(ESI_TESTS) \
@@ -33,7 +33,7 @@ index 061a463..350dfb2 100644
 =20
  ## Sort by alpha - any build failures are significant.
  check_PROGRAMS +=3D debug \
-@@ -125,19 +124,19 @@ VirtualDeleteOperator_SOURCES =3D VirtualDeleteOpera=
tor.cc $(DEBUG_SOURCE)
+@@ -159,19 +158,19 @@ VirtualDeleteOperator_SOURCES =3D \
  ##$(TARGLIB): $(LIBOBJS)
  ##	$(AR_R) $(TARGLIB) $(LIBOBJS)
 =20
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-net=
working/recipes-daemons/squid/squid_5.7.bb
similarity index 86%
rename from meta-networking/recipes-daemons/squid/squid_4.15.bb
rename to meta-networking/recipes-daemons/squid/squid_5.7.bb
index a1122a3cd..a208a2a88 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_5.7.bb
@@ -22,17 +22,14 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v${MAJ=
_VER}/${BPN}-${PV}.tar.bz2
            file://set_sysroot_patch.patch \
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-com=
p.patch \
-           file://0001-tools.cc-fixed-unused-result-warning.patch \
-           file://0001-splay.cc-fix-bind-is-not-a-member-of-std.patch \
-           file://0001-Fix-build-on-Fedora-Rawhide-772.patch \
            "
=20
 SRC_URI:remove:toolchain-clang =3D "file://0001-configure-Check-for-Wno-er=
ror-format-truncation-comp.patch"
=20
-SRC_URI[sha256sum] =3D "71635811e766ce8b155225a9e3c7757cfc7ff93df26b28d82e=
5e6fc021b9a605"
+SRC_URI[sha256sum] =3D "4c17e1eb324c4b7aa3c6889eba66eeca7ed98625d44076f7db=
7b027b2b093bd5"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
-                    file://errors/COPYRIGHT;md5=3D0e03cd976052c45697ad5d96=
e7dff8dc \
+                    file://errors/COPYRIGHT;md5=3D0a7deb73d8fb7a9849af7145=
987829a4 \
                     "
 DEPENDS =3D "libtool krb5 openldap db cyrus-sasl"
=20
@@ -80,12 +77,21 @@ do_install_ptest() {
     cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
=20
+    # Needed to generate file squid.conf.default
+    oe_runmake DESTDIR=3D${D}${PTEST_PATH} -C src install-data-local
+    install -d ${D}${sysconfdir}/squid
+    install -m 0644 ${D}${PTEST_PATH}/${sysconfdir}/squid/squid.conf.defau=
lt ${D}${sysconfdir}/squid
+
+    # Don't need these directories
+    rm -rf ${D}${PTEST_PATH}/${sysconfdir}
+    rm -rf ${D}${PTEST_PATH}/usr
+    rm -rf ${D}${PTEST_PATH}/var
+
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makef=
ile
=20
     # Add squid-conf-tests for runtime tests
     sed -e 's/^\(runtest-TESTS:\)/\1 squid-conf-tests/' \
-        -e "s/\(list=3D' \$(TESTS)\)/\1 squid-conf-tests/" \
         -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
=20
     # Ensure the path for command true is correct
@@ -112,6 +118,7 @@ do_install:append() {
 FILES:${PN} +=3D "${libdir} ${datadir}/errors ${datadir}/icons"
 FILES:${PN}-dbg +=3D "/usr/src/debug"
 FILES:${PN}-doc +=3D "${datadir}/*.txt"
+FILES:${PN}-ptest +=3D "${sysconfdir}/squid/squid.conf.default"
=20
 RDEPENDS:${PN} +=3D "perl"
-RDEPENDS:${PN}-ptest +=3D "make"
+RDEPENDS:${PN}-ptest +=3D "perl make"
--=20
2.30.2


