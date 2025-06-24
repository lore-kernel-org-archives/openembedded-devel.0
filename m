Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260D9C7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:58:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3906.1750755488380696623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jun 2025 01:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8270701add=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5dPkc020719
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 01:58:07 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14tr47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 01:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH0MCkXykySPwqFTMiaXJVHhFaTvGm/GyfYrh/ZEa3fBj0r2S8RrKteLYZEwrRDfVTQE63L2r299E5LgBVmKdXvRto3SeCVCisP1N2wPPevaDacFU4vcpu457Uu62BPqDfdImiJdqYkjgn6FR/gphvOJxCcTgS5vm0eQM5Bnyx9+cvqUJhkyDpqabIMf6HSKg0icU7gj1TMt0F+JsfldP8uE0RDN0ocfsZ9rhcV+ZrDJj9OzwMLW81ogUHHDYnPDsJgMuCINGmR4UNzrZZVvRqeHq1CgEfeluLZwVm8gQLbzg+U27nAg2E+uqRbSiYdDHVDqqM9ZHaGoJGOJNMoI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hg3EvxWoJcGKob6UpUuGLyV/VgoW50eVe46/bUo0Xg=;
 b=HrHWv8IvxDfyM70VPEXaJs9eeqhovMnqnnc3Rh2zONwjD8vZ7PVc2BlSokVqFexwxF7PjSwd83k0S/vmwo3synJH3q/f2db088+LKpte7INjt4neX5ArADpPN5Wh9qXwW4f7ylfVY9f/2CBJcRsmPbbyL8Gh5nBbjFO5EcXS7XnlQkhjTbwpk31zmv58QvXppxncyoUtQlx+cK2htJ/BOOOcuKFx7gajTAW0ED06r8HzLFsPcoT9UdDwpc34splN8nD7c4jESy/ml3MsB2QdgbghI/x0Jfp2m4CAd1WqBTl1TB2PKN+VC/EFLwGiyKpUAuAAw+9mhmgLHr1eRQHmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:58:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:58:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 1/3] protobuf: fix ptest with python PACKAGECONFIG enabled
Date: Tue, 24 Jun 2025 16:57:46 +0800
Message-Id: <20250624085748.3060194-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f96348-7764-4642-d837-08ddb2fd3b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E7JGGhbhUPYZjEW5JUORjE+76gZnceVtOJJPlaiE+2DtHOEi3XNXy2AuJbeT?=
 =?us-ascii?Q?iI/WrFkbdO7b+18z36msVSqvnr922p7X+KjFv7DjUjzI58/PyBO4mq/Yyjeq?=
 =?us-ascii?Q?5EJXwUnwja3eXqyaACQWzA5o+ta8erCuEcphKkBnsItpA8GRX3F49uYvMmYV?=
 =?us-ascii?Q?KfaELuWBtszuWpQDmRM0OuIF3RtLRuxMYaVCSDAC2RcRBkAs4ihIBcA3pD+q?=
 =?us-ascii?Q?sSkzqKG9Y+VfbbsKZ9BwOKN1Y0D78cG26flSzZYqyxHE0kf38Ba8s2ygG8OI?=
 =?us-ascii?Q?7yNo7KnXFptQbYA3UQyYrCPPiOsy1vNGPZ2SEDwRyMSKou5Q/E7bkU7jggYo?=
 =?us-ascii?Q?m7A2DCXlav4HvgqdLASSyt1uz0CYc1LEg07X9z4sMe34i3jyDah90jpbvqdK?=
 =?us-ascii?Q?W5z2e7H7ZV9bK7eaxw2qQjXCaRBYazIc8oGUDZvEHI9brrT84Ec8cfwmk3JN?=
 =?us-ascii?Q?oa4w2t7zW6WV/JqmAZ63wPEN/nLAFgPSsp81w/sLLw4jdCg09TAMI0ozMHvv?=
 =?us-ascii?Q?OycjdzJAJdOo09ywAGWMi0Pcc5md8BbJXTsc3Pig7v63BJ1UIDzTd8Ha7DNd?=
 =?us-ascii?Q?cPAWgDavKUq+IxlvUIzWQf8APBI92+2sv41ORyxf1ARzQSjyaI0Y4Rzl8nt6?=
 =?us-ascii?Q?FJGQr9gEmCKDPG3376b7pcaaguRShZwi/V7enoTrza9qWP8v8wlwDIMQ/c1c?=
 =?us-ascii?Q?56+TmdSmXVBigie21FBkz8N0dILpEwFhYydp+pH9mIqrchphxl0/6JO23CJF?=
 =?us-ascii?Q?qGkwMBW2cc1k+zXOrAa7VsNtMdLYB1G8vuDL9lfX2snbCMOoP8+AP+qzNhgf?=
 =?us-ascii?Q?XKHlV91WQZ5QJMZ7DTW13OTPnCibVvInW2QHBpANo+WFdP+URuE88C/PoUxK?=
 =?us-ascii?Q?lyjfm6WrhO9+gIeFMGy1iaex3f5wrEIFt1ouf06YhiVgaZguLuc84C7AzGRX?=
 =?us-ascii?Q?VIcIwnjNLIR7HtKY8AIBqvuRGh0RTbbLw/JkGpLEMc5scccakkmE/pXRzUmB?=
 =?us-ascii?Q?gfvXrYdS0GGLC0NwNuriznG9VthtJ2qTskknazs/TcgsVm6we25/TPBcf8TT?=
 =?us-ascii?Q?BrIZlq5cFd3LFvC/XjvTQ7iUVM11c9aPINTPBjum1xigJiYD+44aP86vBAH8?=
 =?us-ascii?Q?wddS2CjlpHM0irfxw31yQMiVrwZSyit64w1zGG1iVu3ZYa9C7EEIqggeVjgy?=
 =?us-ascii?Q?Oidoh5jwx6e4oWgMZ7w5pECypj6LsuX1Ime7Z/P2IvCDO5FqXayPN2ZcGmk8?=
 =?us-ascii?Q?TEYH+txVqALc1QbxNJd23IeH/5HyPYSCws7Ix3IHKMgi7LNWUV9zN/PYcNaA?=
 =?us-ascii?Q?YMl9Sqm1Yb6GQDbiKFxWXbcQpFatIaYps2PbD3NEvjiWG7KqHdZoxdpQD2Sr?=
 =?us-ascii?Q?dzpdIHRlCGdTzF+CvmTjY3/GaI1gKEZGwxzELHDTL6Pm8EYhWLkY9PGAWoEa?=
 =?us-ascii?Q?h7cIWmp30HkuZgQO9IVxWLB9kxVwwLH0t8/fOb//ZlJeTH+eui1bFg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?emEbBjdrkdaIBBJdMJFH6FWJpZmx42CWGBk98rVEp++cyLxboJH9lK5yiz+K?=
 =?us-ascii?Q?9Wz8uRZvagN00eFjqib9ctaGbQC6h/8sbZgJmaxR7/0zhI3ABO1hPuezGoVg?=
 =?us-ascii?Q?FPLdYHi+us5y3dIJvtg57DbHQFBMp5Nvg2DH54dMns2V4UTD2jMshzD9mvI9?=
 =?us-ascii?Q?y/A6ovE0e9mUAlM5TVCNCNAP/TVq5WuKVMLpE/vjNjjxOltApvGe9MwjqXE3?=
 =?us-ascii?Q?2syjuCPa8qvccHMPmpDPXcoLezK8BCAbYH41bX2KVKDlGOm2eFelZ43VHx56?=
 =?us-ascii?Q?s1vpZ64OgrAS9MdjEgte43YT+Cz9NonZcN/oVFoQ1IMb1L72u5mRidzFk7yo?=
 =?us-ascii?Q?JDPMZNTp2vpwWZVtCNqdtDPMyOe0xcuWmaCms/3kNq+LL/xHGOuJovoByj+V?=
 =?us-ascii?Q?RdrACMPY0CO1wZtu9RCikUahl5fQMFm3qLRqnuN+dBAJhcc1YxLE0lRmSYtQ?=
 =?us-ascii?Q?vGwOg4U8rk5uHA2XVf5+1EPQ3Z5E34I+2JXpqYg2JVjapCxxrOTIrLMAKkdB?=
 =?us-ascii?Q?UEOLHkIGBO6AaXCn72sAlAoC4brVLmeEtk9+EbvcApGfyXRHiLZHMBQsZlm2?=
 =?us-ascii?Q?3fAJc9D/qU7Vw82Ih8TITm2Il03BT5Gw6LE0EQ2Mmd+Hw1SAenbJAqbQMA75?=
 =?us-ascii?Q?dwGPILiBYma6IhfewFjbqwYkXatMWON6eJCome4L4bA3crx9BmfBaOz5wcCe?=
 =?us-ascii?Q?TySDBlRhR5K3gkwRtmO6FdWDvY+8uTQerjIBrGqjj71bGEAT2mLuSWNrtl5o?=
 =?us-ascii?Q?jKJbSGZK1sK8jzrn8f8P3nzoEOBHkW3w3AiJX1rEEw2fu95qMiONTjgJzBXn?=
 =?us-ascii?Q?kJuEt1Mw+orLjKN+FjOooMeGdwk5PQzBHPYXkx6nkdYULyc38a0wi5gffwHT?=
 =?us-ascii?Q?quem9luD5QNyDkLtXzMAiQWst5mYBJR8+gMZNyw+J7zcwelRlsZBjYtGF7o9?=
 =?us-ascii?Q?7/XZzIfQcY5S/t/5rRVv3oFeCaRv7ZmFjG8SF6cHyY6WSVf+pdDK4W6irID+?=
 =?us-ascii?Q?az6DN3vcR1l73c3xMFQjN11Wddd+C2iMKYTcFd94CRVbNoVmPxJKpWGEBCfJ?=
 =?us-ascii?Q?sa8zEjY2fMq0CbSrV+oJs4K0Pnhk8C1zMahubBql2JnZmaOPvQvAEG02JerH?=
 =?us-ascii?Q?ZqAfdrDuJWY/AvCbtfAFnYRUWjDVQIPiRePaaZYqc4M+kA6qAk5uVSGUWFtr?=
 =?us-ascii?Q?QR6bgh4/T4jeVg4e9RGff+FP95AIjp89W8xEh65/NwpLZ1DYB6HHlzAjmJdX?=
 =?us-ascii?Q?cljXLguGoV3nyRCp9M5j2BluXMTHabSNAefDVuvqr11qvAZDvBKsK0rxysIi?=
 =?us-ascii?Q?DA2B2qj7Bf1ORXNsL6gm5z/4aQC+EHGXtYz0t6xybtNgw/neQX7b8Fcdk2st?=
 =?us-ascii?Q?rrKkvgfP9sr2UQg91AfS8Pid7ilfQafYWb0Pgji9UsMJkVcTO2Wspfyr5jow?=
 =?us-ascii?Q?SQltgK8P+W2RqmvQm5scHUcJtYTpf/uIBvbZC6zmqjigRCRXt5zED3/AODjO?=
 =?us-ascii?Q?/tassbIeCTwttOTwz1sXuGBjo0dwPVKqgZ8wgAKSEaTvmgV7b2Nlz4IulkR8?=
 =?us-ascii?Q?Iifh/pGD6u6FAqjT0n7lcmPidB4l9+kN9MJn3nd3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f96348-7764-4642-d837-08ddb2fd3b16
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:58:04.6879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lS+nQoWajc9sDk6mNltfqkbNHuu7srdbqMIsv5cTcXDaWh7fFTkLv5wbUz91IxE7SXwR29BU420kAfRX/9amfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-Proofpoint-ORIG-GUID: cZyHBHCEIsBoLjPZrVl__FPGAExz5fT_
X-Proofpoint-GUID: cZyHBHCEIsBoLjPZrVl__FPGAExz5fT_
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a689f cx=c_pps a=9tBfwoQ6/+n2CpjoB+3+cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=A1X0JdhQAAAA:8 a=QyU6DcDbxFceu_3kJPIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NiBTYWx0ZWRfX+HysdSFaiIbe nGxnyaCy/KV0NvItqtTe/G4EVoUTQ6wcv7illVN3ai/+g5LNHwWdbuvu4Sfpip4DIoBD5MJPQA/ zHqvRDNTmG2UVp31PGMkzx0vq3nAP/D4FG4V3iMQLgGyU8hbUgRb1uqdsrqzjlnEDbbLh54vbTB
 IyB/cr2e7xYbcxnDrJA/s00jbeypBx7Xwa6l5Z8k0oIy+WFNxkfMTYzkNckYd8Us43sktqAfBS0 g/ract2mg/2M3koQdD4i0OERbegP3pRyg0Islq5ea8yZ2iVlUF2sCSSboKnjNEZblCA9079gPAC MP0rhp17ihiaPAKTtR3NSj8MMF4HU9Ia6RXdDW4eNu9HJiRse6X5+TtDG+TDXj0kCBhFGbrazn1
 dTZHh7pfmneZAkKJsglmxgtfIiBL7iZXw6Clocz/YqZkzXINJ9k/6ry6PoYqhG4Qw8E007vS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=971
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 08:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118099

From: Chen Qi <Qi.Chen@windriver.com>

1. RDEPENDS on python3-protobuf instead of python-protobuf. The
   latter is not available anywhere.
2. Use use python3 interpreter.
3. Fix run-ptest to avoid test failure. An extra '\n' is needed
   to break out the loop.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf/run-ptest | 2 +-
 meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
index b3b2278c47..1112fbdf89 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
@@ -8,7 +8,7 @@ for write_exe_full_path in ${DIR}/add_person_*; do
 	if [ -x "${write_exe_full_path}" ]; then
 		write_exe=`basename ${write_exe_full_path}`
 		echo "Generating new test file using ${write_exe}..."
-    printf "1234\nname\nname@example.com\n" | ${write_exe_full_path} "${TEST_FILE}"
+    printf "1234\nname\nname@example.com\n\n" | ${write_exe_full_path} "${TEST_FILE}"
 		RETVAL=$?
 		[ $RETVAL -eq 0 ] || exit $RETVAL
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
index 2b19d07ff8..9bcd208acb 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
@@ -74,6 +74,7 @@ do_install_ptest() {
 		fi
 	done
 	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
+	sed -i -e 's#env python#env python3#' ${D}/${PTEST_PATH}/add_person.py ${D}/${PTEST_PATH}/list_people.py
 	cd "$olddir"
 }
 
@@ -84,7 +85,7 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
-RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-protobuf', '', d)}"
+RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
 
 MIPS_INSTRUCTION_SET = "mips"
 
-- 
2.34.1


