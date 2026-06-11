Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE49CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 12:30:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44202.1781181017402133050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 05:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sIDGYY1m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06223ef276=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCUGP03936895
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 05:30:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CPm4jy56u
	cux1iNKrIIx9pzyVS2t3c2R7bUJk7j3BaM=; b=sIDGYY1mJb3o/Bgyw4zk9z3gy
	3VnJtKHa4z8hg3wtr6mtrRuHk14JpttYQft2npzVsI9i6c3yFQe4jSYsozMpHN5F
	sxgxyS1MFhv7Rp97i20cM2aj1Q5MDKfRbogBGjBUNIx7A8Oew1eyxbuaD4VlCPrD
	IySyHzqpo0ONEiNXTc64pwYyyqx0g0OcrN48v+yyj+2LC6M+bOWBuOr1siLwmh7G
	xaEGJTdT5CWIJqiO3x3aEunF96FZKf0v6EVgjmiAhEdGp5s7kuMrb3jnqvLO1FK7
	L+rQTp4aYGuvQ9BP+av4rgmbVizMfhBGxnXNHla7pLCqzP2acrTPspyPzDABw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7agycr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 05:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tz9OJbSN8UBsNBNDja2FDfOEen5wbFOozpqBYYKKjgMz87iMVMKLfy9vmKNQ06QxO3upqkou8fM9iYwDHAa7XWljJLzxpsiI/5coqT6Y5M2g7MLmKeISuQ0/k8H0NLRaK0SfC0qUXHYUpMNJoUiLmR2N00IxwkN0ksdv9e5afzvsDmUBxJwkDXbrVxcbug++zSyHu1kwA+/bxTBNJpk5rf/YXwNPQueFkXd+kEbU3d7tFrVgGTyJ/GNZ/CDOPpL///dZXbFNr4lm6b7Utk6VxRqGg6JQ8D01J3D529AMWiqa6TSV5XuVwwCygnPDxfayFzCgomOkBMbjpMEUlvKtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPm4jy56ucux1iNKrIIx9pzyVS2t3c2R7bUJk7j3BaM=;
 b=kzUjN+wNT/a/hE+pfWOHaBS5zqGGjZZ3UIKnsgX51fk/GwaQMW0A4k7+YWJ/WYpIahvsI1DQm8gyIRfrd6nIei2r5rwCeHdJGHoJbvhfMuJNk9vdG5WWnFb9qnX571mCb8lSDwLHg+1AFqhIre5fgh+5ubZSPyYtp5zWJ5kXntUqCz+BFw5cAZp3hQPcRZw0Nfrr1k9zgpb4hLtellEdWdkNh9HodZO7zYaLVETikJ580ch9xqOcfAK3sxYPzK3xyzqOasY6C4QTU/R9PWiYuZM17Rd/rQ917xO0ECyNgnRj6EA4qplGBCHZFxnToiLqQrzxYFdhEJGyHspnBE0BrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 12:30:13 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 12:30:13 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [meta-oe][PATCH] bit7z: workaround array-bounds warnings with GCC 16
Date: Thu, 11 Jun 2026 05:28:49 -0700
Message-ID: <20260611122849.3543884-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0908.namprd03.prod.outlook.com
 (2603:10b6:408:107::13) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f752335-c393-4a78-2266-08dec7b52f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	5sup3eFN/oDzq3s26kPW+febdbPn512+MO1awOWcfiFsQd7j5ZgDKokBiRxd9ggfN2MWTGzGHVWh/iYb4zgiH2vjPBB34pj8N2avpCJfLGPIj/nAfMVjgEJ89d2jwHcTPfmv337NX7GvYDB5J8ROVoAFfHrO+5Dyol7c2RH3wAcKcFXsCyuIxqaZKtfvYAuzIKWVYTj3q03KlXo5BaYat+6nBtOhlUOLheRyIeqtx+Rd6V/NnW459mS9oA0YnJEV7/7SX2q3/bo0DUMIEEEEJ1eLDl/0hRTHOnMOE6RnSlcIYtS318O9FABx8tAMZhjDAfknIvoTvzyf2Tokr6B5KkiqyfUrZCV98BIk+Qm5v6gMWXb55AydMVZcvq/irWmQcpXMrXHn+9wZwxsBdxlul2wPx9HKg8AR+/+sVA3rgKpPsrHKylIIlI0WXdo4JAtQk0IrmskKYYGyuvDYwflH6MJDSl1kf/xTgS8TNXKzrZlT1jtqbk6L+IamJiK11rZPP9qY+77aoSf76FtUzljXnxcjLAgX9x/jE8nhLyfUBQT+1noRrI6QSkfZBALdkhO47cq3QAXC8TVL9KsMHkLutfs9OAaqoAjh6+iwc5mPD4bLqPPpVtFcIuAHA/+47Yk3Dh8dXW+hl1CGk47jdMIEVBmGgJ8BoWM2lupm3qhnlxhlbqhu/Dz92THX6TizWGn+3b4QcWwTxHmgcoLGDRqwS0DJg4vS+oyPcA3TOph7kUMXVsmgCy0MVOku4gO9ImiV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AlphYzNKqZWasO0DdI/3bq8Eswpii5ylpIWPzGRuWB4CVvnrQjUMruWbywAr?=
 =?us-ascii?Q?qnrJvpNb8zDfPHFa4bG0NXyt9+TdzXOBH56+zlt92oVLeAmeAseM6bV8ozTN?=
 =?us-ascii?Q?I1blBicKq66qkAdeHvw/2tfth8tefayWC1MusYVYrURi7cR+KlexJB34iz7Y?=
 =?us-ascii?Q?uRPCrl+LG8GgMJCOVOEL0kLIVTJEoTeMfnUbOSt+JqB+kTRd1Q6A1pwIAA50?=
 =?us-ascii?Q?JeXgMTZaUewJtgaX2Ye0p4md4aa9+YP6nunPv+yDOu3tuopa3y/XfakGLCmz?=
 =?us-ascii?Q?LCOu9ynEJDy49pYL11lnGRDp0hCyMyI17K7oaZ4ydRLwbeLLpUv/z8/k69i4?=
 =?us-ascii?Q?9rr7i589qmzpjOTlKDFZf28DIXB0mC7o+mA8NpFwnvg2tGuoiDLOLL0SRrbc?=
 =?us-ascii?Q?ADVYwEPzGcFuUIl2szVXPocvhzb+eDGPiL1Ex7wCBDT9PmO3mjb+LvyLk5Jv?=
 =?us-ascii?Q?ackmoVsFitZ14+As7I6UPvFxC3AqHNSI899rYSkS4f7LaVjESepN41GkiCUZ?=
 =?us-ascii?Q?p/X3PEj0Zy1duuzgsCKPtsbM6Wi0h3X61NYNpNzMJgtf9h6D1FQJUaCtD5nT?=
 =?us-ascii?Q?u0Cgl/GsqRlBMGG5VDrKKGNKpN0QJ3y81YlflEjSlcTVoiPvwzeE7rGWZccW?=
 =?us-ascii?Q?dcO+caRt5RMuFBd8nCPH+BNFBmnw5uCVj4Ys3duAx2wFuPaV5C9JbDUYM+q6?=
 =?us-ascii?Q?eqj5aU6mlhsYr3XdzJqfP0liZ5JZW4PW52fE9B5pTmLfV4Zbcn7311zDUZCq?=
 =?us-ascii?Q?e/ngAigLGXfRdi6N13zGCB8By0If6aIV1Ulf4kr6LwiC/5RJCgxP7zkWSW+Z?=
 =?us-ascii?Q?9/x4BmrDB8aufspfwvGcDrRbaTJrZ57YuVBcHimdRvwzJaS3ZiUlRc92uvdJ?=
 =?us-ascii?Q?Ahh6frsKA8kBjn5jQYkWLAiANwslFN++fHz1DJvFKC7ISBl3dL+90wlXLVLB?=
 =?us-ascii?Q?wK6XrfU/8K8Hbrvy1x9fIAto4ohrxBjhH5+mzi0iQF6YK1MHgQFB5DwrnpbH?=
 =?us-ascii?Q?ZJfIi4nUPzZ4OnH60CAF1qAG6OqqG8Xipb5XiM2xxA8Y3To5i9baJRvlN2PR?=
 =?us-ascii?Q?70YHm2c/jLpsXzxaALpb5Qb5AlpzlDy+b2lGNAVW16zL/PE6xM85oeCCUM0c?=
 =?us-ascii?Q?cwDUDMMnUHpVXnXneOWf8CvGyeSwetEWovU75HLVXXZ3lO8vde+hfxjIqoQM?=
 =?us-ascii?Q?aQQXdHNAituv2CHdE3VkUr4LSMT7xY3pSUVBG8ABl2VG5ocS8c3DfMZNxGOc?=
 =?us-ascii?Q?2qacIFuf+14WzrFAPKTbqkOoyVrycNcLxeD7J9Hnv+8r9bOtM6mA1735/EeR?=
 =?us-ascii?Q?19ka/OLV3W9YX/9XUx4icLzXXn9d8lVGPWKYsK/4AzYv5LjtgBGOOn4s+/pt?=
 =?us-ascii?Q?tYdaSod2l2g+PKdNYzpWNe8qSU9oh6OjuHDl7E/L1QHEYPfauk1R7OMf5pUO?=
 =?us-ascii?Q?pGw2DnweXMPnKqSnv4DuamL0qaybwvnYA/wYDgEh4U/vT5vfLc5B9+zOfnYs?=
 =?us-ascii?Q?pBz2HUM45lEkAhTzENJ1s94WNo4BnmTvE1HpJCKpGfYsOjDcKGIQZVkeUHSl?=
 =?us-ascii?Q?n/X5OcJHm50ER+cz3IAZSU9CI+bzTx2gl7C4/rA7obSSPr743XWREKGHIrJj?=
 =?us-ascii?Q?PUsUp/ytmRI01JgEaGJ0nGIXoptABnUppxoBZTfu2RFxliWItoL/Q4DEVRRS?=
 =?us-ascii?Q?JSlnBndsQ90fDTD9qujAZqOgMu7JvJI2hn5hF4kukNBLX6ytyg+G9g9A130f?=
 =?us-ascii?Q?3lhE5qxt8uglGAM59C95c7iLZAjMphM=3D?=
X-Exchange-RoutingPolicyChecked: 
	m0mHsGs9HDdrQp6wGVjVg5Mc3rmIpxGO2JevkzViuLwP6DXgF9v3IXBSGKt4KOzZ19YPlxCzXXU1TUwUJ2Sl/XWf0q/pLxyOan/zkd94gC1puzdqcaa8qzPX5uVvGGOscxwMtZ2jRmc18j+qhCtjrNvALESj0ZfyY/dWAuRFgLH2Ze8yCQ6lQr1jVh8Hp58BSt8qVJ2CQt82WGcjWn9xqZOgVLDnAV6UV32E5HoaU1EHOQCQzUkrwVtnBlLSEs8R1noBOe5V3T15NtDfgVbKATwajABbhetrjbz7E3MLu++Fz8jeusdECssb5ySNoJWH5PiX97Ct7Yzp1iKscem7QA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f752335-c393-4a78-2266-08dec7b52f4d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 12:30:13.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWKa9yO78aO+nDk0qRAhFsquwntFDTSVGEy2DC1IwpJlp8Ck+Uv2I9kKn1iEgQ3oVcz6K+QWIHDp3QjMcPT9SLQmSAxhqEEtz/SewkcyI3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-Proofpoint-ORIG-GUID: 49Kj2NkW3LcSzJsQALmq-GPR-s1Tg58K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNiBTYWx0ZWRfX1PE6SocqPWz9
 Io+/rS1EXH0yUItggOWmIG2MSjBJlzwzSNvOP0yCtMtl9TznShOz4Uvo8M7GfTKjlkxWzwlJ9w/
 o5i1z+3eeYaEtomfpmOm2V2Ww0EQ1YPL6vdbcOBPuLbwJzPsSn0P7DTmBmLvOASM7MkwWQX4o7i
 7EZU/ar9h+WQPA5tndVB99vKsHlV6L4fi6+hppJvvCXz64rBbkmr77OXe2GOmWkaSLCGatB7fpj
 q8npv9ulAdCVlhJiyGkVmMeWwVFOP/R3j6IpE9Fe1YQBBEb0PYgGSMukqrIvAkTuI0ZHNrw5blY
 pKjMDHSN7qv8bBhW7sm3XVWHI07Fg4GaBIpMHWWALkKl7pDEKeIRRhXnLVddLuERotxUQjijhGg
 8mlb1DuCPiD9KxIJ7irDkIsQzWmvcpKc9SHGj6Uuyz8YHNOh9rVCzZMmunFWTixPuo/uApXONv0
 fL6M8a+qEvo/DH6fNIQ==
X-Proofpoint-GUID: 49Kj2NkW3LcSzJsQALmq-GPR-s1Tg58K
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a2aaa58 cx=c_pps
 a=p2I1UVXXVW7tbHwl5ZyrfQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=BdUp-iT7SxcZIKlFAtsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNiBTYWx0ZWRfX8nql5oEs4VA1
 8jqR8o5nNIzah5RbZX7iIhuoYhg5lZDdhYBC9Wpj0IfkXFE36zEZpUcBbd5n4vHnmPRlNVIfhhq
 Wd2URqPJgzGDfKexkeEIeWfnA+tprOqjdMxZD5PvR+xtxsLjrhek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127529

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 reports -Warray-bounds warnings which are treated as errors.

Reported upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125743

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
index 300d9bc3cc..31202d0ea2 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
@@ -34,6 +34,8 @@ DEPENDS = "7zip"
 
 EXTRA_OECMAKE += "-DBIT7Z_CUSTOM_7ZIP_PATH=${STAGING_INCDIR}/7zip"
 
+CXXFLAGS:append = " -Wno-error=array-bounds"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[tests] = " \
     -DBIT7Z_BUILD_TESTS=ON -DBIT7Z_DISABLE_USE_STD_FILESYSTEM=ON \
-- 
2.49.0


