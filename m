Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E59E9A764
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:50:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17049.1774349441982269500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kv8Co3ug;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543dbf287=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O6vgmd2128640
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:50:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ow7CVLtscDYeV52UI9yQ
	espeLW0Xcfs0kqHODe0I7cs=; b=kv8Co3ugfZC3361xwWXUfBousj5y98OUUGVX
	9USfkDNsKQZByEe/aJSNOQUo8vYqMN7EQiK/72rJXnuMJGfrDW7P5sLDETj+LeYV
	zYBzvgS8j6KqIKfVKQ3EQSU3Rqm8Nk4rFAFar+2wE81xT6OMH/PXU0/JUSyOJk4w
	R48pI6WmPmQSImOXSpeThXZQDN3LSYg5tNmjMo/8nS6htyd9lY/++i5Kq1NOr4z3
	rSqII0VbOvXAhSOV700q5jp5yXPmHUDb53NPQhsoGt6n1gXecQAqnvj7haPm6cdp
	6bO24N4P3e+jtcXatshffmSjrPQlUcx7XpyODXAckuvUEVXc8g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyb1u2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnDA9/IU4beuFbf8IdS8iaFSytGa3RH4Xu6NUKUIxiudnCkHsbqFEXRCDmq3i9Z87O8YWKMBHqUJN7hSRYp9K48nirA9cawl0xuhOsu4/LNeWdhRmhUqLfSkWorgE7YUiGjas5AssO/PGSkDTIM7s/W8UGdT37pLSWW74PCAl8X2u+5A/Th7JLYT01M6hlP3h7dNrWObPem5BVj1rNrIlzdHypqkiXY2t4BxXAX/Rn9pkeCKnB7uuZ7PRI03a1o/mcy+hSdllG8jvCyB+GiJaVM2eIy8MGzGi2pmDUeg6WNPG6zJ38U7pme39uzc8Hnd/As7Cv1xRl9s/+USOWC0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ow7CVLtscDYeV52UI9yQespeLW0Xcfs0kqHODe0I7cs=;
 b=RqW65awaXQUzz/3STElWlSsGXU5aomcYKYU41Q1o8SlX5NucHiOa3ewouW4g7wkIsFovi/zfCU+xyXaHGFbYsu6bxXD1Mm5LsFZ0zR2m8wiQUVUoBaSNXSV9IMZqrwdcYEGjrkLdieClvPBpg3FMyAFctAXy3uwSWfGhD8Qny/qKNlpHi6Ka0FH1yaTQ/xn1kZqH/RSdMf5kymj8V9gS3e2vvXVidSa0MAWSP0B6z2CQDx3jQ1Fyo+tZSAj05yM1Kx+8n6uvQP7nuH5F7h7Ah9+E7O2JqufyS+fcpKlE6oXwqk/BaUlxk5NjNMDoNTdZTDOpIZ+3GiGdkBn4Xtj4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 10:50:38 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 10:50:38 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH V2] postgresql: add ptest support
Date: Tue, 24 Mar 2026 18:50:21 +0800
Message-Id: <20260324105021.3616668-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0098.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::13) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|PH7PR11MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e88f08-8571-48ae-73ce-08de89932f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	UKxon/vhV5OOuQ3mReIk30+5dWgMBaAbrn7kE21muSvHUwW0d5mwQy+GU6fssT04iHvmiE+E4GQVYN2MnbNmG2d69l5sdYDx4Vj7EHWb/a2Fq0QhFNVoK3NYLKkNn2Zq7EJu47lo0k5bKnrbcoHHyhDst6XXgj7DcfIyD4rYiVtBVAezNUQw8A4Hw8eOn1EnzrUtX9Fh4+Z6IfX4GIf4/nHQSpkT31v7DItRYkoQo+wCuZvp6Zn5dJnZh27VW39xuO1YBf2mXUKn0Hs4xy81jPKNjAkO8UvDwRJQv8moQzMuXh6zLCzKqft13Cx2wQegp2I7ztH2PVW+YWqRev/svz4TPZPjf9HCiRKvbOmLf0AaHFmsFWWiuZjBnVsM0NrB9ltw3FUSNcFLeHqcQd0IDrklswWceo2lxut8J3z8NpNvXngFaF+VYFEqEfEwcN5rpthrYRPTbdgNZkTIFGtT1NQkNTGc3zdJ9b5egujhca5JmaG8+GVYaHvQUJyvUTf8jyvj6yMi16sSEsJ0fccx0A2YIOIpplE2+QestBsC9N1ODesGzcrDrVfbwZZoMaObqbKWYbpzDxlq+6f1PJd9hw7CI7R8C6gH8l6Hhzs1OiU+ASPw7jTzvBh1DmNUmBNmFliv/jah9I3YSLbMMFy0c1K5psH6P0lKC0JiZmkEouypWI2X9l/JJvmRhg2/dH33pp0dhpypTggGpM1/999nNoQ49A2Vkm2WVvOrZuxbl1XmVw0QNi3z9ZXa24YJYdrjjs/wQts/RbVZ9sRttU4UhjnhQVRq46RJdqaQOCVbbeo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F8QTBwSB13ZXuvBG4QIe6b0dW58Ejkmeu9/7Gzn+becJ7xMoCbKg6vB2H3Ol?=
 =?us-ascii?Q?oRnYGCDPxl9NciZrdAXKE0E5qT78WmpsBbsGswnKCttS3/TjBy6mzm3Tq8oA?=
 =?us-ascii?Q?zvK7ONm/5TQ0Y/8chrnSRmBJCKTai4dXa2Fxh2WSIMomRCCIlVrp2JAISkgi?=
 =?us-ascii?Q?W/ICsWTk7ngtRhdh1xLgi9GpD4lAn5MeFxeFLzjTmjZB2DG4qjEqsfnLjPC8?=
 =?us-ascii?Q?dOKWzgjvaqbZckcQ5hWYF7G0lZjk+b0t8muslW+CZoJHy9QMfo0+6IBdGXvb?=
 =?us-ascii?Q?sqUSQvoH1k/ft/K27qzp0oGLUULFrNgO7x1GRChGCgcmjLQy871HDKrh9+6R?=
 =?us-ascii?Q?xAkDdbhdIRvw4JgV82z06XYiZGk7ZCxsto2zqM2kuM7eRDjai9daele3SO3U?=
 =?us-ascii?Q?V5700wbn8Rp34z65FVm9PghYiydFtuBIIDC8T0gJB382pD6/05RLqU06jjFC?=
 =?us-ascii?Q?bjXsQaXHaOZckDmBg4ExS0O8LoWuHruo0eHWzkzA2hiJ1OBm4jpwBrGmSIis?=
 =?us-ascii?Q?vq8AK+kUkXKLPBnmy5QqMTD+ZfyzzikDGqRR7HcyOkymC8lT12+FN5UOxz/6?=
 =?us-ascii?Q?+H4cwRHTCy7dMPpSPyGsW0T/ssKzeQR9ajrew28gXHK+oNKDjHpuOCZYRoEY?=
 =?us-ascii?Q?7ZT+8AKeEhn7ZKVTe4PO1dBfg8JWTuJh/D7/tqVvDRXdf/eamFPt29XKme1F?=
 =?us-ascii?Q?YWWhy5tQWww1bR/xrRSS6UoTIkl6RmaZs0mUUlCK3yhz4j9JbBA4kiTlKh2/?=
 =?us-ascii?Q?YJwZ5sT0br0PjoBX/rkm1gIs+TA3SuOyvPAjq/X5EsjDIMIvQQMNCsMrxi6T?=
 =?us-ascii?Q?YpQa8SQiRMonsDPO/4Esq7MwUh3L05oZDtNI34Ein/pHqRIpyBTBtITtXlpq?=
 =?us-ascii?Q?HfysK4nmIyja8+PWc23E+emhAr86prDiLG/l+UQZ3HrtVielQBfA9zVJO1P4?=
 =?us-ascii?Q?efjWC33rJzjpbfNnxIcK8JT2FsKOaEdo8Qrn3IltrRQGgzKvorkJRwd2wkzw?=
 =?us-ascii?Q?8TDx1y18FX3BWTq+JpKzVjRO8r5jNH8lMs2LOs4CWlO6CnbelOe1sYjeuM1J?=
 =?us-ascii?Q?Cdfx4mNNraPrCfh4yD9ockLOGPAojXLSFArAgETkUghBj6WgZ74uVAnvItDA?=
 =?us-ascii?Q?hU2PMGqaRkGKewIgUYc7CXDGyTfqjsBBpzWXeeCN5DkZRM42+ODlgXokx34n?=
 =?us-ascii?Q?2yctE2Dfm0X4nUQaMQlgJ66IPsKhd/3osPkLPdDMW2pa9qMKU8UTddl/LxyK?=
 =?us-ascii?Q?e5kxNzXJXC2NSlz14QF0ZV43wO6EA6MF9ryYlfi1Rwi/vJ1oOP895yVLp0j8?=
 =?us-ascii?Q?YdZPx5iEwBICAE1x5Stw7WpZqFbrPe1NGsRjJaOSMDL6RG6L4Svg0oF7qlb6?=
 =?us-ascii?Q?FWPRG9B6+Q/pgQxoH9DFn+wWe8BsR7Bdo66gNfPntKxbEb7fwhL6tNXxq5+s?=
 =?us-ascii?Q?YcF209a9Xoy5Xk6NxH5MgxQYXHCN0zqzuWXA7DKfBoMvuC2y/E9XjYLpB+m1?=
 =?us-ascii?Q?JZJBE6HCLoBlgs85ssP7tqfoYrbEuf8E/OLXZeJbY5DKwLreBbXv5DnVuPZr?=
 =?us-ascii?Q?KXE45iRUGChr6KNdT2ygEwATdnPjSwOx48zQM8mipwGZDcgaVAwTbHwhiMtm?=
 =?us-ascii?Q?kwZwIPEVUSlGEBQQxx3mb9+vFAoN7APU7pDpTnZmETkB0pPrTGew7s/0TMWr?=
 =?us-ascii?Q?8Vtnba9nL9+CKUVwe0BpyL3Ye0iAjIAsOlUtFyHKmSVRdrhz4iRatTXxLpJi?=
 =?us-ascii?Q?GufxdcfkkdvIPPVOFyNUrQuFiCG5QzY=3D?=
X-Exchange-RoutingPolicyChecked: 
	LtnRluyJ7YtSH2idynv+yQbU7NT6mPpLWxbEE4KGA2IIlpivsnOrm8Dhl25WAPqHWRZsGxM6ovx1NGjmk5/H2goRX9IExGHF8Qd394y3bKdUqOD//5TRSPlRGrRC2M5hHvrIn6KAyQ1T/HwhCvhmOpMPpkAil0TNBTumq96gWgdLLYraNB7+j8wv82bEO1QCF5oVPTCi3u/m9L3VeaG51WJr1usmaqBYwSbY9HNU6uB/cxo3hM5x8r9lvuX3WgpE9osnuelO4V/zZXwLoXpCPjn1LCgcfNrVgKG05MhEFWQ1mPk3DY30ZCNn+moZ6cY9lobGGIWVZeUm/m49AFpapw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e88f08-8571-48ae-73ce-08de89932f32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:50:38.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJYQw2B9LQ43sHU/w10Kw7dzatI6IP2DOuQomGfHGuTrBOMEO9dsmHkU03i5bLc7ymda8NKUsV24ybca29A+Z6kN5Q87ddob/XUmGC/Fw8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX1R3QPtLqjRJF
 dez5Nrua5s6L5p9hK1+4Xn3hxoKwy9Wm7qup9GkTWYPi+Drss8xDXVFwBS/yasm0KJ9hkzC15Ss
 V1Puj/9E6RwyPdViIVIJlyawDgoT+Wj3IbFmolF+UFlWOLAzZ97C7BclKBp4HloL8f32fkI/wol
 c7PVEuHicrP8Prkh/YgzfhbvPDhqAEZlhJ8VC5TXCgTh5yDsHVHSAH26OScKMC0lLnVv50qKzt9
 IQFVzYXyQVHDDroaYjgL8+RddXRLRooIO1acv3KmrDu+x3nZjSUUqow45lgt/Cm0dPMqrm1Ufzd
 2cc2E9UHcgZUGIYowFWtFq02rTdcqN6BcZm/R3dqt02DB+DEJIvUHn6G2lWQahWkzZESFocaxSM
 EAZ93i7fLkfAusw9nv0S2mpfcJsThcIyDLnGrtGix17G0xrmHtpOJF1rmQFe+lNDDBBvBZ/B0lm
 cSXC2YOCStoLqrxSYGg==
X-Proofpoint-ORIG-GUID: bZPsmZKdcmCZL6Uwl4oIBdLNWjppoCYO
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c26c81 cx=c_pps
 a=l+Dg58WJtlZLJwH7BKFLvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=epTmVMiNAAAA:8
 a=t7CeM3EgAAAA:8 a=gIRqVpUcCQc2nCLCJdcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bZPsmZKdcmCZL6Uwl4oIBdLNWjppoCYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125551

From: Guocai He <guocai.he.cn@windriver.com>

Add ptest infrastructure to run the PostgreSQL standard regression test
suite (pg_regress) on the target system.

Test logs:
root@qemux86-64:~# ptest-runner postgresql
START: ptest-runner
2026-03-24T02:42
BEGIN: /usr/lib64/postgresql/ptest
.....
**if all pass **
PASS: - event_trigger_login                      1901 ms
PASS: - fast_default                             9459 ms
PASS: - tablespace                              16542 ms
PASS: all tests passed

**if have fail**
FAIL: create_type                              1763 ms
PASS: create_schema                            2123 ms
PASS: - tablespace                              23226 ms
FAIL: some tests failed

waiting for server to shut down.... done
server stopped
DURATION: 853
END: /usr/lib64/postgresql/ptest
2026-03-24T02:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
Changes in V2:
- Convert pg_regress TAP output (ok/not ok) to ptest-compatible
  PASS:/FAIL: format using sed
- Add summary line (PASS: all tests passed / FAIL: some tests failed)
  for autobuilder log parser
- Update RDEPENDS:${PN}-ptest 

 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-dbs/postgresql/files/run-ptest    | 65 +++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 42 +++++++++++-
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 4de602ac1c..0e395db48a 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -76,6 +76,7 @@ PTESTS_SLOW_META_OE = "\
     fftw \
     libusb-compat \
     mariadb \
+    postgresql \
     re2 \
     rocksdb \
 "
diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/recipes-dbs/postgresql/files/run-ptest
new file mode 100644
index 0000000000..4cb8e5c7e1
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
@@ -0,0 +1,65 @@
+#!/bin/sh
+#
+# PostgreSQL regression test runner for ptest
+#
+# This script initializes a temporary PostgreSQL database cluster,
+# starts a server instance, and executes the standard regression test
+# suite via pg_regress against the installed PostgreSQL binaries.
+#
+
+set -e
+
+PGDATA=/tmp/ptest_pgdata
+PTEST_PATH=$(dirname "$(readlink -f "$0")")
+TESTDIR="${PTEST_PATH}/test"
+PGBIN=$(pg_config --bindir)
+PKGLIBDIR=$(pg_config --pkglibdir)
+
+cleanup() {
+    su - postgres -c "pg_ctl -D ${PGDATA} stop -m immediate" 2>/dev/null || true
+    rm -rf "${PGDATA}"
+}
+trap cleanup EXIT
+
+# Initialize the database cluster
+rm -rf "${PGDATA}"
+su - postgres -c "${PGBIN}/initdb -D ${PGDATA} --no-locale" || exit 1
+
+# Start the server
+su - postgres -c "pg_ctl -D ${PGDATA} -l ${PGDATA}/logfile start -w -t 120" || exit 1
+
+# Ensure the test directory is writable by the postgres user for
+# regression output files (regression.out, regression.diffs, results/).
+chown -R postgres:postgres "${TESTDIR}"
+
+# Prepare the tablespace test directory
+mkdir -p "${TESTDIR}/testtablespace"
+chmod 0700 "${TESTDIR}/testtablespace"
+chown postgres:postgres "${TESTDIR}/testtablespace"
+
+# Disable set -e before the pipe so we can capture PIPESTATUS
+set +e
+
+# Run the regression tests.
+# --dlpath points to the standard PostgreSQL package library directory
+# where regress.so and contrib modules (autoinc.so, refint.so, etc.)
+# are installed, so that CREATE FUNCTION ... AS tests can locate them.
+su - postgres -c "cd ${TESTDIR} && \
+    ${TESTDIR}/pg_regress \
+        --inputdir=. \
+        --bindir=${PGBIN} \
+        --dlpath=${PKGLIBDIR} \
+        --max-concurrent-tests=20 \
+        --schedule=parallel_schedule" 2>&1 | \
+    stdbuf -oL sed -n \
+        -e 's/^ok [0-9]\+\s\+[+* ]\?\s*/PASS: /p' \
+        -e 's/^not ok [0-9]\+\s\+[+* ]\?\s*/FAIL: /p'
+RESULT=${PIPESTATUS[0]}
+
+if [ "${RESULT}" = "0" ]; then
+    echo "PASS: all tests passed"
+else
+    echo "FAIL: some tests failed"
+fi
+
+exit ${RESULT}
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 040b3d5e34..6858015478 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql.pam \
     file://postgresql-setup \
     file://postgresql.service \
+    file://run-ptest \
 "
 
 LEAD_SONAME = "libpq.so"
@@ -37,7 +38,7 @@ LEAD_SONAME = "libpq.so"
 export LDFLAGS_SL = "${LDFLAGS}"
 export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
 
-inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header ptest
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
@@ -184,6 +185,45 @@ do_compile:append() {
     done
 }
 
+do_compile_ptest() {
+    oe_runmake -C src/test/regress all
+}
+
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/test
+
+    # Install pg_regress binary
+    install -m 0755 ${B}/src/test/regress/pg_regress ${D}${PTEST_PATH}/test/
+
+    # Install test schedules and resultmap
+    for f in parallel_schedule serial_schedule resultmap; do
+        [ -f ${S}/src/test/regress/$f ] && install -m 0644 ${S}/src/test/regress/$f ${D}${PTEST_PATH}/test/
+    done
+
+    # Install SQL, expected, input, output, and data files
+    for d in sql expected input output data; do
+        if [ -d ${S}/src/test/regress/$d ]; then
+            cp -r ${S}/src/test/regress/$d ${D}${PTEST_PATH}/test/
+        fi
+    done
+
+    # Install the regress test shared library into the standard PostgreSQL
+    # package library directory (PKGLIBDIR) alongside contrib modules such
+    # as autoinc.so and refint.so. This allows pg_regress --dlpath to
+    # resolve all required shared libraries from a single location.
+    install -d ${D}${libdir}/${BPN}
+    install -m 0755 ${B}/src/test/regress/regress.so ${D}${libdir}/${BPN}/
+
+    # Install run-ptest
+    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
+
+    # Set ownership to postgres user for running tests
+    chown -R postgres:postgres ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest += "${PN}-client ${PN}-contrib perl"
+FILES:${PN}-ptest += "${libdir}/${BPN}/regress.so"
+
 # server needs to configure user and group
 usernum = "28"
 groupnum = "28"
-- 
2.34.1


