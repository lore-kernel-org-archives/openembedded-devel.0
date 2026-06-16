Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B290CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:12:42 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148002.1781591288640343888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=k91+wnjh;
 spf=pass (domain: axis.com, ip: 52.101.83.41, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq9kQWsMUmcAPQdbnx7vRjStpBrEw5ggyA3wwDIWXvmoSXQNnr9nPpg8sNtefrY9EUAW7B38NlNDJ9l80RtWREtsLCDIfsb4fngq7E/dSIlM4ySqlhudsX8oiw2PQLN3/e/uphLEPMa8wIV90q4K1WgXzszvvJ4LWujo+694ZwXVUUO3JZYqrtpvxs4ek2DVzgM5iGfXc+roby3UUQfU2TwszG4yjlGL3i1ZwP4Ddczl/Q0xoApWLDMjYlEaxkcAkdHlhzj/DSnrxE6ZOjjQ1pxOeycokUoeYDHiM32prfzSPXQIZdUOken0SZKA2d/3bI0Lh5sxjXTUlr1tyYsYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYbIQ42aq1enj7rMAdbjBpvoCgnenbQnA+ntIysZgLg=;
 b=VfvOXwin1W+BI+Ci+Rf9knWLF1pWhZsnFNdOipJiiLPLIKUJrybpw27te9WL4m3nbxi1lRmgEncLy5icqitycDAIYbOCVQHFHZvLTG5zu1jT13bMd9UWrC6YH6BJ4bwffNWGk77Tr2LmBsrLmyGwiHTGOvRUUYRcNyv0NtKOKmEBCmIxZKPIvAczP8wmsO8Br8yC4ffznZW3J/1eCvohM2PcFyIWVNCo8f5PXe2qJJW6Oj1mtzEwmgkqW9Kd0d/qAE0A6XPEQHYdUiEYH6Dwk2oWxfhose4gWllAx1HnmGWL0JQ1i9PcpP3ATfczxGhjDU0CAs3zJRef6shZRiE5ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYbIQ42aq1enj7rMAdbjBpvoCgnenbQnA+ntIysZgLg=;
 b=k91+wnjhVcv4kefzIyp+BuIFA/aBAXNMfjWASHitdLQeR8TPlkExLfFQscjSBPX4cpkVRFbzRd0eZ5fgdIqVsCLCmUdmo332Rh/EREM+RFtJ+jSZ0ldP0OGcN4Q9kugs2VHUDA6qLrqbm3e6sWlzpwfsUFe06jdhz9IVj6MB1No=
Received: from CWLP265CA0430.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::12)
 by DU4PR02MB11050.eurprd02.prod.outlook.com (2603:10a6:10:582::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:28:00 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7::4) by CWLP265CA0430.outlook.office365.com
 (2603:10a6:400:1d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 06:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 06:28:00 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 16 Jun
 2026 08:27:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 16 Jun 2026 08:27:59 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id D5C1D2423;
	Tue, 16 Jun 2026 08:27:59 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id BD6B98461E6; Tue, 16 Jun 2026 08:27:59 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCH 2/8] jq: patch CVE-2026-41256
Date: Tue, 16 Jun 2026 08:27:48 +0200
Message-ID: <20260616062754.748436-2-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616062754.748436-1-antonsk@axis.com>
References: <20260616062754.748436-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|DU4PR02MB11050:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c31afa-8593-4e32-eaf4-08decb7069c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|13003099007|18002099003|6133799003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	xd9yNQER8pjvZOC4B6AM3cz46Hqf+DDKe/jkz140pUZq4PJhxTJxejAnypGZcIgkUrkBox23/Q6Y/OZnlb7r7E7kqnIkwS0N6p6FsSHhPV7JtSyImIY8AA97hwbPZ1gt2BHn7ApDQkc0DDXh6AB+P2QpR6boBmPZj6jva8Rduf3zDUSzuuINLg93b3/pWpYOM4Zmmbk7GwjtSeRZY2bcviDETiK/C/lDnjtlR5/tBiH+hbjaxm8YLt+sIULEM49x5Ae+6mOJY2oCrQEiWln46F/PEGKDbAwabiqIwDXQy1C2HCIQQAPtQWhrt+6f0X1kemTTUlAbRxPu/SfO9X4pv21KAHQtJtDDLTxTFtYn+nwt/Z+Pf8x7z3xEEHiRzfGnXU0oVsX+Gzl0ynIG8OZ4j3zPxoeWPz8kJ1T9HaoBWqLszJlJvz3bFHvZ5w7aaIBvaFPSrU1unjo8MUtTqzSwbNEc0mFi2t4OKdIEX7PY8dCduzKJCMRnOJ9O11rcHTdf+G9r1gCp1QBmE6yjUWicta1Ozm9x+jEIS5MWYtU8iFSQaNmJMRAJEahAPFFL5EzGx0YGR+kVV2L6X82HchhXas8ReEQlQfpuXnJ4tmgvMiwUAXaUQKz4aIAwjoPAOipMoFDOICxMCr4SGz5J+qsbd/pgKhc8jvQdqSGnTv8/faojIcXRK/s51S01vfEtXRDhOXV0gxuLI8aqquNETyqNDYrTVOa+3Z0ofvU9Sy5KQk4=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(13003099007)(18002099003)(6133799003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T6SzIRoQWdP58rTE8FbhPN6Ikt3ZnyEMo/Wly+1EIE+FpimmcgzWifXJGmhxw4mdLl+RMArVbp/usIIi6uta61itXnY3tCztTkhq2OctmjB+4LywnqvUegoLJ8FC81QSz92XiTSjs6QGeaW9CAJ1bq5NtpNTRKe/7tHNjeTHJ+y8HLcbwX5Gdtkl2Iiv038rlRgsZQhNHsYnbca3yUL5Sq2ZICIr+hFJkcCPo4pT+nSInm5wNirmpZGGTcHyS5EnTHP/RX0ekcg7qtI/DSU82Lski0qVLwXZN/SwqPtDefvK1lh53BUZhOKlIHWdluLZ5rPuPy2FZ3pwlca+QZKR+bXNLfXpMQDSJGej1Lf6CFKleliPQ53cvKmeD9ONMtvsG79pGhVivIuTVZ/X9BVZZtvU7lZKdsOHzdcDkm/JSptFc3YkRXoAPTxy6SPRJ1rt
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:28:00.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c31afa-8593-4e32-eaf4-08decb7069c9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11050
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127610

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-41256

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-41256.patch                | 49 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-41256.patch
new file mode 100644
index 0000000000..738a359e6a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
@@ -0,0 +1,49 @@
+From 5a015deae35d19e3ebbc65db6c157a80e76df738 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:15:08 +0900
+Subject: [PATCH] Fix NUL truncation in program files loaded with -f
+
+This fixes CVE-2026-41256.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/5a015deae35=
d19e3ebbc65db6c157a80e76df738]
+---
+ src/main.c   | 8 ++++++++
+ tests/shtest | 7 +++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index ce362607e2..fb5c7ab8e3 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -612,6 +612,14 @@ int main(int argc, char* argv[]) {
+       ret =3D JQ_ERROR_SYSTEM;
+       goto out;
+     }
++    int len =3D jv_string_length_bytes(jv_copy(data));
++    if ((size_t)len !=3D strlen(jv_string_value(data))) {
++      fprintf(stderr, "jq: program file contains NUL bytes\n");
++      free(program_origin);
++      jv_free(data);
++      ret =3D JQ_ERROR_SYSTEM;
++      goto out;
++    }
+     jq_set_attr(jq, jv_string("PROGRAM_ORIGIN"), jq_realpath(jv_string(di=
rname(program_origin))));
+     ARGS =3D JV_OBJECT(jv_string("positional"), ARGS,
+                      jv_string("named"), jv_copy(program_arguments));
+diff --git a/tests/shtest b/tests/shtest
+index 370f7b7c69..68705df255 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -886,4 +886,11 @@ if printf '{}\x00{}' | $JQ >/dev/null 2> /dev/null; t=
hen
+   exit 1
+ fi
+=20
++# CVE-2026-41256: No NUL truncation in program files loaded with -f
++printf '.\x00invalid' > "$d/nul_prog.jq"
++if echo '42' | $JQ -f "$d/nul_prog.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for program file with NUL bytes\n' 1>&2
++  exit 1
++fi
++
+ exit 0
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 0419ccd46d..34616e0af6 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33947.patch \
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
+           file://CVE-2026-41256.patch \
            file://CVE-2026-49389.patch \
            "
=20
--=20
2.43.0


