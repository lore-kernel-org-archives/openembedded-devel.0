Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317AFF013D0
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:30:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46310.1773649843253487666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KuG4rUAw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75354399d8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5qe39674659
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=91WJeqSaQf30Dw0+rvId
	1ynbVzUwfdH0Oa12kLg7Qbo=; b=KuG4rUAwIUf3v6QyifcqnlnjXyS12o4sBysc
	gjKfwcdLGiLv949wNDGeyARg/k9LoFpGMJQnARzXiqdHWnODd+LunZ37YlqKIH/I
	dfTla5Rr3NHp6yeebfUfRdFUMd5lEQ8fRs0L3l+np/qtlNOVQQ2MH7ToejRDgrl2
	i9wVzNqvv57AIzuCeQHN27VC76rxtMAt7kejXz4cQlUbXvMlPDRlHBgIVq2ByLfY
	2L3qD86fxxE3iS69x6EEDJhASvKU/55qXzpdfkhWKCcWMfjsI4VjmbPFNSY7gE/n
	cw2G2eFMbH0R3lspzWSQA11yibe5DAKkEGF5Yww6e4NW+HnLbA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvxn59r3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:30:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rcs0rQIYdlZf/aF4srUWdsGWBKsivfvZZw0JjVPJ9DZOqidbRvBLWvXoiD3319oKJrppF5Pl0xpe2Sp7qo+kvXYZKDfrRPXDmBtm4gSVgw1JW5+ofXb34Jej1FSjjyRrSi0vkVNQC4yss9lQzipKoP14UZACm79SsiKga4053gciUWdcUQUU/Sjz6oZKosoGtpHWJlceU9W9bPMez02zl9+B+Qi0MX3VgteGFDTPIfYyotSEedJdP2ZuIiGjg8yA9qU/TZvRQbg+OmRdFie/v/0zISFIZEfilFMbilQMrpUAzmnBb3LRiQwjD6KCm7aFERaQgLKkhcOV09GmgMbPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91WJeqSaQf30Dw0+rvId1ynbVzUwfdH0Oa12kLg7Qbo=;
 b=RGMslticIwxEJgeF+6tCLY8Lgv4FrN950+sHxQCMAMbujiVT6hTvot80xVuu8NCvXoHzInoSixjsQfOnSQKV6PiUTuD2utgbafJa3fCEMi5eAkboWcfTsJXvAehcaVnSddyk349OhHL68hvYAkxuf/kETYYzL6HTDqA5mzCaEW/pF7ZlU6fL94DjZGKYGNQfb3ZxhpGs181XP4TOOEVOHcYtoRLgibkuLSvfY/SMaNr05Bw1HNcZetuu87Cjv38oryDlu0ozKcPTQ4Vf3yBo6naafB9nPdVmm72OSIQywea0Wc1BdNwku4uKH9qtD3H5GRQG914xgCdfqT0ctLD2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:30:38 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9723.006; Mon, 16 Mar 2026
 08:30:38 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] librust-cxx: Add librust-cxx recipe
Date: Mon, 16 Mar 2026 01:30:13 -0700
Message-ID: <20260316083013.71509-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS2PEPF00004568.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50c) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b08890c-0985-4583-fb16-08de83364d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|18002099003|56012099003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	kZJXt+jzyYNlmJvln5XTDQuNPfawRiBgdkX9CebNdzLVwkUPhZvHHSRJPC0ZQs0rnXV2HAJyrhSEpC+u4etsbgNs3MbXG/4OOmUMtlh9miwk8KZoaWpPX/bbO1Ga4uHmUoLoz4v1SnxW5dDr0pb/aS66hbArIBiZ9k5fcotYBtOsNFVVZRoM/aQhyIGiLK7EMt6vbqfELrs4QYTyNAVhionX+qOfyQccXMbwmF3ZcfavzfdVMuCKNbhiWQ8XO13vHiQGiYiH/V+yXoRGhxn2oK4ecZ1ptUDlW1CTHFGxV4H20l8v68eQAUJvaIGxUXh6HvbbdWuMfoztzSStLeC5zZCZENS3zHUYZo3oyqsnbriCOgzQgE8f/+LLSTsMLaIrMZYu5pr52zi7ihGLljqEenwd4cHtuuN10MJTgHTleycMib/4wiCuGsaiKE7uL+p27S+x9CacNLalw5hz8zCfIAmh7mbielxWiPdUORgwac3Q4PL5qRuJHn9s9DL9NxJEQN9/uo5fV4WlX7bOY9d9DSCqfSqQwPpK7rUo5ebsZeylhdaSIQXPvKUldlLVh0sZ6pEc2v2w7NmapWQ4zZ5j+AVuN3plHrieN+JKXJ5ABo+yam9/PG1ho2OCkf10cEYHboy27ymbWOHQr/HqqZt6qHeoF2Mlczyc25bvABStttYWhjLp0rs26hd3JnML+l0F6oI8SdGQzYUdFwuE4FEIFPxjdJrOm8DVFi9oFLjZZCI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(18002099003)(56012099003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7VXQXAJuSUSnHDdoJizQPpcdKUTaZqQxvN2Azj4gcCDBK6TTrJfLaAlzaYBm?=
 =?us-ascii?Q?+0mclrDerfcs/HAsEBstH95ETDjDm/XMdSiWgBbNdfqqkoYYlESKSz4Kf7wv?=
 =?us-ascii?Q?FG2L386Mh9ipcgunS6ls2G6sXbT1Z6a96vK2qOqxrxr1PV+lekElDwlHFpmT?=
 =?us-ascii?Q?puO0jht5lXZJIy5KIFSCkkuJklqmFcQvI8kmk9vEMTfpFVFQMqIsolUbWwwA?=
 =?us-ascii?Q?WJNakjFq21PyuxrjUnfoynv+wRKhsBIImtMseys605LJVwKIKyKu7/gDBbmZ?=
 =?us-ascii?Q?83O1k5/3CZJ4BZktHke7UFvYWP9t0FPPsDE5piXi9K2QGKyQChC3/SIvhrK0?=
 =?us-ascii?Q?H0X//CuO3B3pFYjvEiaxtU0ssoPohPd07B6KAdky9lnsycyl5drl4Oe695WG?=
 =?us-ascii?Q?3+JXLSCJEQhr8DivFUX9XznluO8VaSFfD9uHpzU4QgWamFYiXPb3FsSmZaxm?=
 =?us-ascii?Q?3LR0uR3OZEH+rmGVZWJF4LYb7zquHei0E7OJhrpb+NYrkoL9hRIWJAvDiJfY?=
 =?us-ascii?Q?vx/hfAp86O5CL8j/DUkEi98IB+PnqL7tQcxufpp2svZi4O3JfLWOSqj1RobG?=
 =?us-ascii?Q?H06FxHzC/DbwySmAVVuoI86DFizvt6zYA2laPDWFBoBeeHWvO7Pi5At6k+4x?=
 =?us-ascii?Q?V4/Iw6/1w/HpGkndE9zNP4Ja4GnIZ2oM+HcNuC/p0Jewlzw4usBRhJw3WhkY?=
 =?us-ascii?Q?aBQOofhL41TP/jRYaRkMW/YLA71mOm3q5BTBqPhEquxlbPUuDaMSx9xzmmdK?=
 =?us-ascii?Q?rVX2UUpT+5SMNrR+QblWIM9VDpX3TRLndZaHVBs4jEq+qoEPoDQng5jn22/G?=
 =?us-ascii?Q?AAHFegu0eo3BEA1N/rmIB6WDFI9NZEyCqyWwCnUPJIbueMkP9V6lmHdpu7AT?=
 =?us-ascii?Q?MUrtYnaKWRD7kreRqzmgHFm03ka2TwZIppM5b8kW7K/1p+xtQmM/v1d/RT5O?=
 =?us-ascii?Q?jtcIcGJYoIK2nmMp8QTg1AAh68T2QOaqJWsC2vHosG/KWmEZYnfos75uso2W?=
 =?us-ascii?Q?4KXRfZ4TFfMEH2W7qGnadbbItZ7NG+QsseRs4brCy/j3J7fy5QNSZ9qKtE8i?=
 =?us-ascii?Q?xUV9+nEiMGmW55c2i8VteRYwEVG+r49+7wRjof7SomMjbAyNCrH/F1iCnSX1?=
 =?us-ascii?Q?kFX/sk4LDc1nfSqvC+ctgb6U5ABEVhOGxkL0zeRhPoImT3Cy0l4azZ4JN8jD?=
 =?us-ascii?Q?GMYqL843BDW/tpldDmKjwl5SvjRCz1MeAy2hu4aLE0pNQJKyP9QpMOUJNmYs?=
 =?us-ascii?Q?PDjxzi5+szWBSzPF5wfC087JPVGgdue2vAv2MP4j20SNpe/qdbLE96oj4Mjs?=
 =?us-ascii?Q?3qE6SNmhZLYyAjIlvsR5DeGEmrOHVuIMxIR0qSjdlw6iWPPRDK/szwuwhGvo?=
 =?us-ascii?Q?T0vUkkpKO4oYFd3lpGELG3XCFClzFJQMOU/tgYkvGNqdzI8HL64oLcAsliVl?=
 =?us-ascii?Q?CbNoQe7HUnNyJQ2+8sGY1yF4PM7Us1ilEEYZP+wBHHGd9AKxfpTIyMKyPZ++?=
 =?us-ascii?Q?qocLVfRXfzrE2l4Dg3WqAQh0eFVKO4OaK4eKpe1uSzw7HQ0Nw8DqErItc4sH?=
 =?us-ascii?Q?TQPNGIqOFZcL+wRXSvgbTOACxmTvGtqJiyQIx0z5AZnE+Ol/+SszSraC5zl7?=
 =?us-ascii?Q?szCL5+VDFovOJwL54resvjJm9/TwQ4axw+DYcpja4dwK1tBkEBbs8sJmeMWg?=
 =?us-ascii?Q?GBHj8qr4D6u7vax9Ma+QUekOmQRpWtZY+AZHJJfEg2GCB8psjcSuA7EmkRhv?=
 =?us-ascii?Q?sAuZdBzfXT9VZebApB8Npo0SjpcK3vaU1ap6uqPV5YcQxCelCSoN?=
X-Exchange-RoutingPolicyChecked: 
	h0fN6rX3OLKR7MebP4SQg9KtuUo1eG9O35M8OxhIh89rv4BROkcp0a/le0ENkYltVhpQ+5+LGMeGONYNO7I8ZDIo2JflLaIu+RjcobM5nPDzOubKJucI90hhyTRWPAPVinbJR2Iumpns07/hWiu+wBDA0C7/s82zt0elNpDMtTHABi8zHCQzB6Q/LsKOA2hTPTPKYlPamqPwCnns/82g1qwK0vnRyp87yNHpzQHzWFeMtuRt8qOWKDhwv6w/bSxSwskR0c5sGpuzo39kIyTH+g2ZgyeMAu9wAE04sRC0vqH6mXwwAiKZHDbCMNbEVvA239H6BJN6RmNpfF7O7THg4Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b08890c-0985-4583-fb16-08de83364d6c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:30:38.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3zkYYC1k/m9CTviOsVlluAPwm6oUi9cCLXV5Luqbkf5SG1SM1wuQvvW2vDIhcyjnCXUeCzoDcFB+kUy8oeyS1ws6uvAXQ3Z8sH+W8iYCKYDlOnvB573HniIHPgRpQyr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2MyBTYWx0ZWRfX4+z9TBZAc9Bw
 k4BL3K3Kc0HVcB+WFhApnhTra4aRztY/sUKEpz74q24wVqCd1VGydH+wGgiv9WhSynV9MZgrc6O
 E4pvU0wQhBPfyJUx81zlKlJ39pDjfGZSjkI9eWBcxeZi/p0yp74VHlTBOfk1Ked2TTVPMcIYey/
 Sf5CCcfWlwhzL5Mt+bt+v7lj94t8FwWbRUTo6+h0U5r4IdGzIp3TGz7akCuLLMhY8OOCZrojhmS
 C60MZvsdn/sOgiDXhj+k8o4G3Q4lkJ7gPiks+d8DnLhRh4xsbJ7gVjyyugo67IHO0G9DfUSLWBS
 HSUe1Q/rbbSq9BuLgKz0TlD6xD5zoJPtPD7x/0hiIex07AZplhLWnSG2nzs9g5FBDKgJ1/dBtxm
 UBSsCLS7v9XqZ1q7+U6v+H5WtRrZXPr0VCbGVKLuIPD06kJYn0LAUd+u2r7YXJUtcGuZp511mov
 fi14QMx6WMFv2gis6Qg==
X-Proofpoint-GUID: Al7lLoJsSQpsQDdMjqsxF09ZMU6Ss58e
X-Proofpoint-ORIG-GUID: Al7lLoJsSQpsQDdMjqsxF09ZMU6Ss58e
X-Authority-Analysis: v=2.4 cv=T52BjvKQ c=1 sm=1 tr=0 ts=69b7bfb2 cx=c_pps
 a=e7UpQLGcWimQYEoqUdNrWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=OcE5tU-iAAAA:8
 a=t7CeM3EgAAAA:8 a=XnwjAbwApK5WBTHBLp8A:9 a=qwkNQZnGtIHGNKTLT1RO:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125255

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Add a recipe for the cxx crate, which provides a safe and efficient
bridge for interoperability between Rust and C++ code. It allows
defining the FFI boundary in a shared Rust module and generates
compatible bindings for both languages during the build process.

The crate is implemented in Rust and supports zero-overhead FFI with
common Rust and C++ standard library types.

More information: https://crates.io/crates/cxx

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../librust-cxx/librust-cxx-crates.inc        | 130 ++++++++++++++++++
 .../librust-cxx/librust-cxx_1.0.194.bb        |  36 +++++
 2 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
 create mode 100644 meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
new file mode 100644
index 0000000000..c313d24e5c
--- /dev/null
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
@@ -0,0 +1,130 @@
+# Autogenerated with 'bitbake -c update_crates cxx'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/bitflags/2.10.0 \
+    crate://crates.io/cc/1.2.53 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/clap/4.5.54 \
+    crate://crates.io/clap_builder/4.5.54 \
+    crate://crates.io/clap_lex/0.7.7 \
+    crate://crates.io/codespan-reporting/0.13.1 \
+    crate://crates.io/cxx-build/1.0.194 \
+    crate://crates.io/cxx-gen/0.7.194 \
+    crate://crates.io/cxx-test-suite/0.0.1 \
+    crate://crates.io/cxxbridge-cmd/1.0.194 \
+    crate://crates.io/cxxbridge-flags/1.0.194 \
+    crate://crates.io/cxxbridge-macro/1.0.194 \
+    crate://crates.io/dissimilar/1.0.10 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/find-msvc-tools/0.1.8 \
+    crate://crates.io/foldhash/0.2.0 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/indexmap/2.13.0 \
+    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/itoa/1.0.17 \
+    crate://crates.io/libc/0.2.180 \
+    crate://crates.io/link-cplusplus/1.0.12 \
+    crate://crates.io/linux-raw-sys/0.11.0 \
+    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/proc-macro2/1.0.105 \
+    crate://crates.io/quote/1.0.43 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/rustix/1.1.3 \
+    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/scratch/1.0.9 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_json/1.0.149 \
+    crate://crates.io/serde_spanned/1.0.4 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.114 \
+    crate://crates.io/target-triple/1.0.0 \
+    crate://crates.io/tempfile/3.24.0 \
+    crate://crates.io/termcolor/1.4.1 \
+    crate://crates.io/toml/0.9.11+spec-1.1.0 \
+    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.0.6+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
+    crate://crates.io/trybuild/1.0.114 \
+    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/unicode-width/0.2.2 \
+    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
+    crate://crates.io/winapi-util/0.1.11 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/winnow/0.7.14 \
+    crate://crates.io/wit-bindgen/0.51.0 \
+    crate://crates.io/zmij/1.0.16 \
+"
+
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
+SRC_URI[cc-1.2.53.sha256sum] = "755d2fce177175ffca841e9a06afdb2c4ab0f593d53b4dee48147dfaade85932"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+SRC_URI[clap-4.5.54.sha256sum] = "c6e6ff9dcd79cff5cd969a17a545d79e84ab086e444102a591e288a8aa3ce394"
+SRC_URI[clap_builder-4.5.54.sha256sum] = "fa42cf4d2b7a41bc8f663a7cab4031ebafa1bf3875705bfaf8466dc60ab52c00"
+SRC_URI[clap_lex-0.7.7.sha256sum] = "c3e64b0cc0439b12df2fa678eae89a1c56a529fd067a9115f7827f1fffd22b32"
+SRC_URI[codespan-reporting-0.13.1.sha256sum] = "af491d569909a7e4dee0ad7db7f5341fef5c614d5b8ec8cf765732aba3cff681"
+SRC_URI[cxx-build-1.0.194.sha256sum] = "b0f4697d190a142477b16aef7da8a99bfdc41e7e8b1687583c0d23a79c7afc1e"
+SRC_URI[cxx-gen-0.7.194.sha256sum] = "035b6c61a944483e8a4b2ad4fb8b13830d63491bd004943716ad16d85dcc64bc"
+SRC_URI[cxx-test-suite-0.0.1.sha256sum] = "2a0a413bcefc6b37668d9eae784f5fe11232343e11101f1d1834163a509610e7"
+SRC_URI[cxxbridge-cmd-1.0.194.sha256sum] = "d0956799fa8678d4c50eed028f2de1c0552ae183c76e976cf7ca8c4e36a7c328"
+SRC_URI[cxxbridge-flags-1.0.194.sha256sum] = "23384a836ab4f0ad98ace7e3955ad2de39de42378ab487dc28d3990392cb283a"
+SRC_URI[cxxbridge-macro-1.0.194.sha256sum] = "e6acc6b5822b9526adfb4fc377b67128fdd60aac757cc4a741a6278603f763cf"
+SRC_URI[dissimilar-1.0.10.sha256sum] = "8975ffdaa0ef3661bfe02dbdcc06c9f829dfafe6a3c474de366a8d5e44276921"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[find-msvc-tools-0.1.8.sha256sum] = "8591b0bcc8a98a64310a2fae1bb3e9b8564dd10e381e6e28010fde8e8e8568db"
+SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
+SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
+SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
+SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
+SRC_URI[link-cplusplus-1.0.12.sha256sum] = "7f78c730aaa7d0b9336a299029ea49f9ee53b0ed06e9202e8cb7db9bae7b8c82"
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[proc-macro2-1.0.105.sha256sum] = "535d180e0ecab6268a3e718bb9fd44db66bbbc256257165fc699dadf70d16fe7"
+SRC_URI[quote-1.0.43.sha256sum] = "dc74d9a594b72ae6656596548f56f667211f8a97b3d4c3d467150794690dc40a"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[scratch-1.0.9.sha256sum] = "d68f2ec51b097e4c1a75b681a8bec621909b5e91f15bb7b840c4f2f7b01148b2"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
+SRC_URI[serde_spanned-1.0.4.sha256sum] = "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
+SRC_URI[target-triple-1.0.0.sha256sum] = "591ef38edfb78ca4771ee32cf494cb8771944bee237a9b91fc9c1424ac4b777b"
+SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
+SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
+SRC_URI[toml-0.9.11+spec-1.1.0.sha256sum] = "f3afc9a848309fe1aaffaed6e1546a7a14de1f935dc9d89d32afd9a44bab7c46"
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
+SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] = "a3198b4b0a8e11f09dd03e133c0280504d0801269e9afa46362ffde1cbeebf44"
+SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] = "ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
+SRC_URI[trybuild-1.0.114.sha256sum] = "3e17e807bff86d2a06b52bca4276746584a78375055b6e45843925ce2802b335"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
+SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
+SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[winnow-0.7.14.sha256sum] = "5a5364e9d77fcdeeaa6062ced926ee3381faa2ee02d3eb83a5c27a8825540829"
+SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
+SRC_URI[zmij-1.0.16.sha256sum] = "dfcd145825aace48cff44a8844de64bf75feec3080e0aa5cdbde72961ae51a65"
diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb
new file mode 100644
index 0000000000..b0d0477236
--- /dev/null
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.194.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Safe interoperability between Rust and C++"
+HOMEPAGE = "https://crates.io/crates/cxx"
+DESCRIPTION = "cxx is a library that enables safe and efficient interoperability \
+               between Rust and C++ code. It defines the FFI boundary in a single \
+               Rust module, allowing static analysis of types and function signatures \
+               for compatibility and safety. The library generates the necessary Rust \
+               and C++ bindings automatically during the build process. It provides near \
+               zero-overhead integration and supports idiomatic use of common Rust and C++ \
+               standard library types."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
+"
+
+SRC_URI = "crate://crates.io/cxx/${PV};name=cxx"
+SRC_URI[cxx.sha256sum] = "747d8437319e3a2f43d93b341c137927ca70c0f5dabeea7a005a73665e247c7e"
+
+S = "${CARGO_VENDORING_DIRECTORY}/cxx-${PV}"
+
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}"
+
+inherit cargo cargo-update-recipe-crates
+
+require ${BPN}-crates.inc
+
+do_install () {
+    install -d ${D}${rustlibdir}
+    # The cxx deps directory also contains dependency files (.d) generated
+    # during compilation. These files are only needed for incremental builds
+    # and are not required when installing the cxx libraries.
+    rm -f ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
+    cp ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+}
+
+BBCLASSEXTEND = "native"
-- 
2.49.0


