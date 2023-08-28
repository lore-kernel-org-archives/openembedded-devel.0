Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC72C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 10:49:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10602.1693219773616972311
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 03:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VzKG1mxl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7604773f1b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37S5g4Kw012152
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 10:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=n/u2S4fozD1FLohQL9
	os7enkE04z/PcwmAPyL/ZIo8w=; b=VzKG1mxlcoPF52jD/0p5TNj0vjraQpMt3V
	pFuSpLZpHfaqIK5166MM0EpzBY1ZNXp4gyzuMJVdgwmEyRN1dNdrkfguWCTv2O2V
	umgBquru1nGKR2Zc7ASpHupIjn9JTXXiB979RnvJERHM77jq/wlG2LzTAciADGD9
	SoHNNQBDiri4E3fE/6wqOT04zlW7QykDN4cpJ/nFs0jjxElf8inpEexrrQ6wRfzO
	pEjBN4j4XUve5FyzYBIvsbNggGruDMsmLXxWtRczJg2GyX8Fdq7q1+x7auM6T5/u
	xiN9q2eH5GqULnlYjJ2cPY+Un4TlqeWKInIofVxtINT0Snf00ljQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwhm4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 10:49:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY2u28GIzReQUaXGKIMs8n/JlbgZ2/YPcHNugItCHWtNaSfoDkr+SPEqZN1gaNavsc49HI3z3GE95oycHe7piO1xOr/Ob3S7RNidqyrh6bh6ARouGuic5mM1uk7hfG0Y+P2rLlRRWVZVq7DmEHfgv86LQQ2ioBZqOM/Lw5wpijRjbDdd8wyLBfE8OcN2KMShU1pQkthMU+WGZQqgl3sDby5HPeZkKybpcaW3iWZzrv4HNE9UVuCKjm2FTPDJCXx9IOFlQfq+TgWulyl+kLmh5TILK0IO2q7ZjsAHbBJpkeTwe6emOhyHA3a20hxEEyU08md15HoGpoqs0y+1NWHXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/u2S4fozD1FLohQL9os7enkE04z/PcwmAPyL/ZIo8w=;
 b=T2miU88lzyTWT8APP5AFPsB3yuyPgDdydBoBT/adfgWLL9XB4Zl6K64nYnkwHsx80zS+vOcyk8I7TojDPWcW2Bmglw5TT9sCB/zLtRDJPf/bZw5FFUK41/LukhFSBbjQ8N/zf2b6kZq1N5RYblIiWxxYhPs/i/9Qp0Sk9tWHejdKTXYWiyQITKmzRPzuv1fW5Ab9tbdR+tWTYnAHudTtgVIZt1IImF8sjZZ48OJhfmWjBxXlK3cIYdXS7mTQSlK1GlkYiKe5DWX4VywoAwGO5w/LLCmliHnYzodQwsABL3iJm+MbZ3W/mmSLWG8CI9xsagPUIK3kSU7QoEPkSNwH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 10:49:30 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.035; Mon, 28 Aug 2023
 10:49:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH][master][mickledore] frr: Security fix CVE-2023-3748
Date: Mon, 28 Aug 2023 18:49:18 +0800
Message-Id: <20230828104918.471061-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:404:a::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SJ0PR11MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 157cca1e-4bdc-48ae-8108-08dba7b474c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	38lBC60Sr/DEbwlxFvg+c/2Wn0FTs/mVWMJN9tsdiZHookPwaJ7LPMuxIQOL6ZYQA7FAc62/TFE1zRcX9DujyvBPeYaKFOjG4IQDmIcBk90xZTEAxqUyPYbyu2nbJ2gIyPTHD4/aZp2zolXHaHK37NAM/rcVGUlBKUfXk7P5etKWVbzTEOFkAoedk0KbSf3Z1z11KIr5X9NDckTuwppwYKXQu3owSBIGMdgEUm/j5gZK6+usHqaIuYGFCmvMCczDHKH1+ynuarbnG7AW5h9NUmHmzSxYKlr6mV8fzA/eIs1OFS+BKUhFBdrIvC4apHJ4E9U9blVElsE/EcmkU5Ixi/dJsAg4tCY2g4zfQUUZzFAZfXuYf5BmAuClHItJAM9KLpg+D4xfBc/o5vxd53qDkkH1khEVfcLgX44Tmvaddt8+ujsmXI3Hj3mxQ7n5jS7JOTq8cFctMMzn+EvemaVj5DoAswSZrJQIg7XWfgXqPMTVxz5uuLNBOBap3ib7+Pot26/mOuwxeEuinVdxYLcRU9Z2vYiNy1fniokV0WqXqaK113w46qZ6cxSPor6VjlxrSPTQooTJmx+CPS53NW3EyvOJiZQ03DPEjGRXXOvKryJkGD7a1T48jcgqj7kzgQK/1i1pC8dowk+KyNso52GH9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(396003)(366004)(346002)(451199024)(1800799009)(186009)(8676002)(8936002)(2906002)(6916009)(36756003)(66946007)(66556008)(66476007)(316002)(5660300002)(44832011)(966005)(15650500001)(41300700001)(6486002)(6506007)(52116002)(2616005)(1076003)(26005)(6512007)(38100700002)(38350700002)(478600001)(83380400001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SOBKSG90d2YhLX+5kRBenQmp+KQN88isEpHtGAdTh8yd1pZoorxWa8PfQbup?=
 =?us-ascii?Q?R0pQMmt2shmXrVI4+hMtI+cdFTkHnohmRCSHMTrHsPcOW3MlhsEh6GgaUdbQ?=
 =?us-ascii?Q?fH47Xd/XzzHuEdYJwxkp7w2J9hYjc+UTk8Prm4MPQB8uokPycJ/3o2G9j6iK?=
 =?us-ascii?Q?2M95cSkxfqQ8hisBKUSnBeuOwk8/4sC7jRG70nUVakNy36HumLDZVFDEUBsr?=
 =?us-ascii?Q?6gn8O04FW77sv1A8095Pc/gApA56hup8Ok9yCFFTE06pedhARRONz4bqq9v9?=
 =?us-ascii?Q?jLmyqqms/lzCDd9Gmji87OSg2uvTB3Nq9gWxh7YHI48V7bdZ7iiVV9M+6EdN?=
 =?us-ascii?Q?TDVcW5/wyeJdZLKpP3G+MRi1T9jEn/21DfUo/8pNcdoAyoRJXLZfcocolxo+?=
 =?us-ascii?Q?sFMd0HIS3J0TQqQJSU7u6/F4l7zP4A8qfDRhj6iLp3nMJ32nWokFQ1lgG8Am?=
 =?us-ascii?Q?776N2RFsoMFgseoBj6dwpsAmVOo8vU6z1s+fGPSiazF02QK+jMd5KiXi1Bzb?=
 =?us-ascii?Q?ZLlypsx24T6EbnlIsfxOE+3p7RjAWAIeM7lV5acsKtKL6KxVv3WUz5gLSsNN?=
 =?us-ascii?Q?Ebkvtk3xWibFAhuecq2a9O0gSCNEnONjZ6vB8Diq8jg0zaDrtNfso0xd2vK6?=
 =?us-ascii?Q?DjLwXSke9XxmnSjDUpzr1fHk3k+cD4ahUYnWHN9sx0BMJVq+cACmUdC7XPVN?=
 =?us-ascii?Q?Kh1M818+Q4vgIdJTwue5Pdm8acrrhfSEbinKZgW5qw+miFc16VvMXGbP2Kri?=
 =?us-ascii?Q?dB93MR7aSUgt+dKyj6tke69MIdFRi8+1IaCGUtRL3lVy5UlTE+/+M6KCUTC5?=
 =?us-ascii?Q?lJBoH7d3yE426bt9zy6t+PqffpJJUng0dQr10WJdlhV6eg653t/fkk1/aMhg?=
 =?us-ascii?Q?NH/vCekZ196XGntouGwI2Tluax4K7TJjkiLLAn4ZNDBVzYk3vmU6+GnbqMnX?=
 =?us-ascii?Q?YSmOnQy7QnOXt6RuhBtxp+8lRpcVruNK6tyTLI06+MbO35qc0LdeHC4AZ7fQ?=
 =?us-ascii?Q?1gjFSXERKysWSOEc74qBKEvQ2gM521/k5jmhkKi3Ml09GOSkUkVXw1eH8Pt+?=
 =?us-ascii?Q?yVRRWOgyqTB0W7Eqpiq4N6nQHTNrCZTjp/5TVAiAVqKD8+cyjdWVZBqmFqGV?=
 =?us-ascii?Q?tIy4qArMrQABgvTO2Ws9nkcun7PQgoQ5DHAzE3WsoaPCYV4JjnCVhZqjNBLY?=
 =?us-ascii?Q?7ASj1yPakhTpY6PbP/p3m2RF4q01jfPRJiWMgmE0eBKwuMpjze7ka4OxGl/1?=
 =?us-ascii?Q?xBcn86HpU8Xpp1cEGYS4YIJ+v7IRrLl3cRcFYWRF/d/lwz7YR21XUJzDeYmP?=
 =?us-ascii?Q?iGFXHqxHE+kFGRqr6q/ithxWLLMjvc+3z7uB28Isi1jRK6lQDMjhu8wVKQoa?=
 =?us-ascii?Q?be3F7tx4gS6/q43OeBDL4UcDETZe226/PiozK6k/P3l/HvVnKmWk1xwjXUPy?=
 =?us-ascii?Q?cL569UsBeUsxcvKE+tdihOgUh/jD4AE+BD2fVATyII9QCHvHh7saJqoky6RK?=
 =?us-ascii?Q?BLRxPdWH6C0BOUtOzMlfzRFPbF2Sbj4bxSS9LvLvnE5nkV8n007rkWC/z9Bu?=
 =?us-ascii?Q?Ghr8InEoi/DnG+XRCNSRX2OUpIY/PitvkmQRO/kJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157cca1e-4bdc-48ae-8108-08dba7b474c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 10:49:29.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMuGJVSra88Unw2Y2fEQtfNdBhTNKUor4h2Www01d6TCW8ajc2R0y32EgcWQ4IMkFsB1Noltbly0yhMvhrYFUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
X-Proofpoint-GUID: w9LM7Br5SPbeYhfun0psa9zMHDLckNx0
X-Proofpoint-ORIG-GUID: w9LM7Br5SPbeYhfun0psa9zMHDLckNx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_08,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308280097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 10:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104632

CVE-2023-3748:
A flaw was found in FRRouting when parsing certain babeld unicast hello
messages that are intended to be ignored. This issue may allow an
attacker to send specially crafted hello messages with the unicast flag
set, the interval field set to 0, or any TLV that contains a sub-TLV
with the Mandatory flag set to enter an infinite loop and cause a denial
of service.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3748

Patch from:
https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c4433fb5523d0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../frr/frr/CVE-2023-3748.patch               | 54 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.4.4.bb        |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
new file mode 100644
index 000000000..4a8a7e1af
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
@@ -0,0 +1,54 @@
+From e61593f2ded104c4c7f01eb93e2b404e93e0c560 Mon Sep 17 00:00:00 2001
+From: harryreps <harryreps@gmail.com>
+Date: Fri, 3 Mar 2023 23:17:14 +0000
+Subject: [PATCH] babeld: fix #11808 to avoid infinite loops
+
+Replacing continue in loops to goto done so that index of packet buffer
+increases.
+
+Signed-off-by: harryreps <harryreps@gmail.com>
+
+CVE: CVE-2023-3748
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/ae1e0e1fed77716bc06f181ad68c4433fb5523d0]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ babeld/message.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/babeld/message.c b/babeld/message.c
+index 7d45d91bf..2bf233796 100644
+--- a/babeld/message.c
++++ b/babeld/message.c
+@@ -439,7 +439,7 @@ parse_packet(const unsigned char *from, struct interface *ifp,
+ 			debugf(BABEL_DEBUG_COMMON,
+ 			       "Received Hello from %s on %s that does not have all 0's in the unused section of flags, ignoring",
+ 			       format_address(from), ifp->name);
+-			continue;
++			goto done;
+ 		}
+ 
+ 		/*
+@@ -451,7 +451,7 @@ parse_packet(const unsigned char *from, struct interface *ifp,
+ 			debugf(BABEL_DEBUG_COMMON,
+ 			       "Received Unicast Hello from %s on %s that FRR is not prepared to understand yet",
+ 			       format_address(from), ifp->name);
+-			continue;
++			goto done;
+ 		}
+ 
+ 		DO_NTOHS(seqno, message + 4);
+@@ -469,7 +469,7 @@ parse_packet(const unsigned char *from, struct interface *ifp,
+ 			debugf(BABEL_DEBUG_COMMON,
+ 			       "Received hello from %s on %s should be ignored as that this version of FRR does not know how to properly handle interval == 0",
+ 			       format_address(from), ifp->name);
+-			continue;
++			goto done;
+ 		}
+ 
+ 		changed = update_neighbour(neigh, seqno, interval);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
index b87c3e78b..f32b52f33 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
            file://frr.pam \
            file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch \
+           file://CVE-2023-3748.patch \
            "
 
 SRCREV = "45e36c0c00a517ad1606135b18c5753e210cfc0d"
-- 
2.25.1


