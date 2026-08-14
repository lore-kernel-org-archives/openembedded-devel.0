Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B17EC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 09:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9219.1786698089654761518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 02:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lKw8w35l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2686f5f122=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7g9o23033114
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 02:01:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=k2+IruulU4ypXAI0hdvA
	uJaPxW2RidgUqQi9A6Lb7bw=; b=lKw8w35l3I83a9xsVaKxzGlv5k+pxlPZghgp
	OWTkCFQRVequiCf5mwni/C9dZPboptzkoEY6s/N3q0uNd7xafbZc2SF3O6+bjJj/
	vcoLlwAWKKzsCNNENd+xwE121zf1gkyQ8Z1BjvGaCc+IWpGP41YGW3LbfIQ73L+h
	lRkg2LRejGqfY2+Q5AAr2Qx3zvRS9Ywk17BXEnALdmnbqZW2yvS0effrbmuw8S2M
	PE5xtS2wESJmscCXeNTLXUn5SyKUZ07vXOFHrgtGu5mcADRGqwpqwJwkvl/D7st5
	LdhLqGS9utxWXrbycNfMZJHH0V/48psq1GU334g5uA/nSEHLrA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020090.outbound.protection.outlook.com [52.101.46.90])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysggevew-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 02:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvI88jrtdWugnQoxBxHKl3hxmhXqMBxEDRXnhYZwolcaYqOpU9R8f53sSGyj0ayhL3jbtxpuLUaLTEB93kpRb4+PbVj1hKOFHHSNELVR4f7LTztTSF1LNgc8F7T3lIXgDi7u5z9o0gGYxCPJ/vZUDrdkqlX0P1iSTn3qY4cB5pA6MJDq3XqPG/k+yGjmOqLzZd0hNiGlAflQG5nHthsbHvQXRtUhq2AH7Ja9MQ4HdGxjJ5dvh/16TJLuEXY/5HI41mxt+K/TTwggnC9TWCaiKCEw4Mc6GdLl7Z+u2qPQENJolmajuWJ8a9cLo2risoSev7AtTMzQcHmo1kTAWEsACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2+IruulU4ypXAI0hdvAuJaPxW2RidgUqQi9A6Lb7bw=;
 b=vMfy4fgRVgQnFjo43D9HFmvslzdJ2vL0V8LMwVdGrZ4Vwe8JLRYP1zqkbFxQisG2kWWvukusz0n0gNebnYckMXhBHLAdlPSPzw8/hfYVm/CSxFYbcu9lbErobYMkbKNgB1HFhPgS1h2i8N2o2W0FcMlv1PXV8uj5FLTbdjofckRTjcFCcg6ryeEa8Lf+W7W+Zm1nUAqoXKiYHQ3J/tp8BDnTonIp/xWpBXfxRpkNtfJW4pjzyJGeWq2IfFmqorurbhc0PuRGmy/0nlhJKMpswuTIXHvEHSdtg63jSI5pZIIiJWSs3kHTbTLnhbNhKCFryLJVVH7utFcesE1V+66VrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by CH3PR11MB7204.namprd11.prod.outlook.com
 (2603:10b6:610:146::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 09:01:25 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d%8]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:01:25 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] openvpn: fix CVE-2026-13117
Date: Fri, 14 Aug 2026 14:31:01 +0530
Message-Id: <20260814090101.3595381-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: b078586b-2db7-4858-ccb9-08def9e29e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|13003099007|38350700014|11063799006|6133799003|10067099003|56012099006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/TiHps7moZWwtecJbdvSxIQRDM9x3y29Pa2zJwjRdYORO+LquZI0tWEcuNc1ShpFvNDtLeb4IIOIZJjPCR08Nlp+FcmuhuARKw2H4/hEqPMA1WgH/B2vZx3p5TJySaa7+/gnR7W/skPwoOrbQ85ipWRgfQknGGBTvjF1W2/kF3FGSQOKZBWBEtp3t3ho8x6DCyAoqwQlVW0aWqwxZ1ExG+Xw1Yt49Me44ClSWhEYf4RsBpj6+5jaDUE3PBswSxArcPH7QHpRAGwheYTpUFwssTSb8JvRnLeFxN39EtQ1dNboYsJroEfdghwNggX4rVLbVuw0l+JjC7OdV3yTgUEs/XnbJPpXV4Rzh68Git3rG/zFXr/Is5ATY5ciNwvR70DYAdJ3qI6vHRXKbqCeDrXqLurpeeS0Fy7CF80gbcLN5OWDdZDhEwTi3j4DPMNIfBQEl/bT0WgklHD6AIAvGZLSnDCREWOJhDfD+oVmAbHRsyHUC5mtrrvSUWkPBIvq9s67zK68zRGL/SU/sDPwcWzFXkeTwki4cPDNzZ0kJnpe8TEvlEmxR1NlCbmYNCWDsENywRKQJA4FtxIivc26J+T2ojhGT2JIiz5LZn9R6oGvuIg2aWa/JyZK8270U90taWFLTP+6ijg5MPirZfTsCAnBXOAAyQ+cIISpPgn9T6hnfB63DzAUpMCGdhiEXltFHawVwIIDb7Hzr8lhG/rM0Sp5A6AGgnAOficLJyRzljfftaE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(13003099007)(38350700014)(11063799006)(6133799003)(10067099003)(56012099006)(12006099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xEPnAv/nolUMIJdQDFO7m4AD5VL36UfxTZBxo+r+uW74ObHy1oFz7q6BCLbt?=
 =?us-ascii?Q?Fb2PBco+bbNyEz0YKMJQjGYBrkHvaaoDurZnNakUNY3v1dQs214zsEROe5T4?=
 =?us-ascii?Q?IuaNQ+92ylex1z2ESIOAZbWae6KXn/y0ZG1Y3Wga/c1Wv74hivrGz4lrgnHb?=
 =?us-ascii?Q?ekerHTQpJZn8G27EjmHcfLPQocfL1Pn4GLso2kISUSl4NqGbxj+E+gDCt7vc?=
 =?us-ascii?Q?RupSmBky/DEuB+qh+5P9keWX1RTElsMvk1XZPP8m5DZGVzrpnSMWipUp90Fl?=
 =?us-ascii?Q?cWBVIV6pB1RAITm0JozGThlFrIaCQVB5IXXsfgXS4NvGNr6UDMACFLdHGiSK?=
 =?us-ascii?Q?PbQBT3RiKHo0rqpU+CT/WUgLn9CvhX9UkWWgbS3WxvJUx81g4GhG2/j2HqZT?=
 =?us-ascii?Q?Y1WHXh3RKjvpS9nxqfbjua44P489mhvu6mcI8yFo+7I3CmHTP19hlPmK7aVu?=
 =?us-ascii?Q?Rh6/4J2yPVUu3LlCCMTArMuFiRzE6Gb987/FSTN8LaM1NhNFdxC1YL0ntIDx?=
 =?us-ascii?Q?f+DW8rQvJksMkpEF62Ey+7kwdy8MD0d6razxgTbZPIoqi08RBqyIJYYnzvrQ?=
 =?us-ascii?Q?tNzUlO8M30rH/GxyhtNnBlB7u4rYnyfuKjMP3BmqVWh5RaHMo0NUClxoCs13?=
 =?us-ascii?Q?fqhjfbwbQIIkgKv+6/EeTDIMEArhs7q9L6ir2xLn4CTS/zMPzuVvFeRVRSsf?=
 =?us-ascii?Q?MmCTGEtZKJNX+gnhQlPkVmCBcfCK4q97RdLyiz2LSOZWzbE0R7SzKSUlZywc?=
 =?us-ascii?Q?Gcl6jvy/AoMHA/1k94sDLlMTyK4yeqcRuF0cQUL5rpiIQE7s/WbRWIiCc+64?=
 =?us-ascii?Q?b+Vyf/YVP6UYnlD8JplzPr7m1zR8NssC//Yas3x+Q5asemamG57ByaADTqdE?=
 =?us-ascii?Q?ii5kquS4fntirXkKubPhc7Q7tpUHHYdSPjPDo+ahe+Xk5/ds09/ulTLgItje?=
 =?us-ascii?Q?no4j/Yqw6yC8q5nL8miZ6+QJN6r1Idr+HBk9uGyhnLDR7P/ZfEoDcVn4aKHn?=
 =?us-ascii?Q?c7b43xGFnkoI5XkOcoIReBeVRrukiiBLNgTb3nS6kW9cgnycD1Hi9ta7ODOX?=
 =?us-ascii?Q?cyXSkszNSca5X5jivjexHETRQLxO2KeJHI6wK8sPwBLzet4cbInn5CYN0g0w?=
 =?us-ascii?Q?LltaUShh/9sNP3VfdOE8vHDkeD3VA+cSyLL9c6JxJADQWwU4oWi52PHhGfr4?=
 =?us-ascii?Q?9Zq644M8/2iNHiuDSFNKIZajwNI4qskZZINZYvT0QFo9V00eFFd2nAM7BUcf?=
 =?us-ascii?Q?y9qWfkNTrv5PrtLIkbU2/bDGH3bz0uQtnXGPSmAgmE8WtVsixTZVA7ECoe51?=
 =?us-ascii?Q?AmckdrYkesZSy2hAfJIw1x/P7et6JHzNJG9aXQJYGaNxyKqb7wgwwFpCOv/M?=
 =?us-ascii?Q?Y0+SH2OCN30Hw9Q7qVFpgtC8OtfpK0zL4W7J8bu2Xouptwh0dvliBdLpfZ6v?=
 =?us-ascii?Q?2ZGEYtXKA7veCRMG2qb29nzkjF/BZKwPtbOfoOictT9L+LOdW4O0c1iPj8yq?=
 =?us-ascii?Q?u5ZNY72aOsG3cozRYNM2ixGsQ52JW2D8rCAwHhvmtbsG7FrZjoWp4eUjZE6G?=
 =?us-ascii?Q?wGtN+Fhu+8v6FF1qAuzm+Dbzx7LiaJfK/f/OvWOlxvkRImrK15MaUnZYb1dr?=
 =?us-ascii?Q?KA+sC0Rxm1Mn+DiJa2JJ+vWvkkS121rPhj3n8aUMWs/Wsl0mf4Z74oTzhdTz?=
 =?us-ascii?Q?F3/Vn9UJRlCrAyTv+DEcpBEu/xlOdpFqorJtC8WORosenKKzmqhUjsSkHELz?=
 =?us-ascii?Q?11FIHmxyGrL93RKJVNfF0NFooqSvy20=3D?=
X-Exchange-RoutingPolicyChecked: 
	LlFX3oAXgkDExNgbhxCZ9MDYYtcomabDYHmKTc3JNQ2ainqTtI0u7l6GwMO2Kq3IDDVu3MlwbqEF6zzOZiB3S3gloMzWX2M6N8+xJbExbPmGZ6Wjxy6yv1yOF5ol9aKwsY1xhtkSbuykGOKmIZGz7ROVu3QV4cKLJe6DjEOlwXjrB5lEoNsXe4q9VHZehcDQABc3zDUssxh6DS05obGOb7hDH/KgqaHlW9hr6HGRVtuzNY65Q++XwJMyTSzOjAems+qvwpbbIfZtnTkxZbaIuF0O82RBl5eVRVUBVk5MsJJWpdUI11Iesr12jAoF7Z5O1CKoSnDpvoHQmd4PUIV/0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b078586b-2db7-4858-ccb9-08def9e29e71
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:01:25.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyjZ3Kx/0gQjAlG6Qb8BVumyOpU6yJUvm6w89wQ+R5N1POl6ZEpDudxDl4pXx0DQPiPr1PQaC1sLpmq3YvBLi9vVzz64SMJLm8EHNM/j8jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
X-Proofpoint-GUID: rjUa7dHy8etvOfC5BqD2mFo9KQHrJO7C
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7ed968 cx=c_pps
 a=mKvPdnfujGBEPWwSy16I3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8
 a=t7CeM3EgAAAA:8 a=FqYEshwvAAAA:8 a=pGLkceISAAAA:8 a=xeC3QtFAAAAA:8
 a=qfY453r0gQwMvcmf_EQA:9 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=whVU-vuORgf30j0UdIXk:22 a=9XEOD9pWidfRTSXZEhnp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2OCBTYWx0ZWRfXwTVpSVNPIi92
 BT8RjzPa/z7puz8PXTEQj+8YHp++imnv3/yMggQSBWJC9PxjPOr3zDA+rvqLil0YEScXdNQLzF1
 ZI4O3FE7rj/YG4M4QVFplNhpXqMATU7PhS699/VbvVA4zpWHdqQVzWOA2wM4gifRoQwKEO28bsu
 Hv2uNEqOG5CX+qvX9/tD/9Wb6Lp05dE7C0RRqJL0Iu5l4AxB7cu7+GqmQNtQf1RXcWHSTNTdB+e
 G56964T+lvqNET4545EZmSARwo+AgtONGysi7liioJfIQfolpLaHEXLkpGzPk0ZhKLe9MHTWYbx
 Ve2z/SDnSjRRBT4vuJBwDHoEw52NrSC/sBDc0vy2YdvMo5pIIZp1YSO4kcaAda8X3uiTOpK6cvo
 m4gSuMOZUhjv0o1J6xi2npBruySk/rujgrzk7aW282wqHET/MJS3OhdgEmLLZtBc3j/HRqSOy7g
 oqQsZJ1qEY9vyTPUdqw==
X-Proofpoint-ORIG-GUID: rjUa7dHy8etvOfC5BqD2mFo9KQHrJO7C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2OCBTYWx0ZWRfX0GUvSG5X0++w
 mYGHWaOO8N4rg0UGlpUImmOwdd+LJaK4Grsl0KetRGjAuKprql8vo3HbjFP54Yl6eSwk5+6eVJP
 7YmacocnWOO003VGQ3EkdpAaYG03fsK1rMbAnP8lvun0iBQXz4dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129043

An Incomplete guard in OpenVPN allows remote authenticated
peers to trigger a use-after-free during TLS session promotion,
potentially leading to a denial of service or memory leakage

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-13117]
[https://security-tracker.debian.org/tracker/CVE-2026-13117]

Upstream patch:
[https://github.com/OpenVPN/openvpn/commit/3ce0242e68527fd1e8d378aecb57c466e8058b44]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../openvpn/openvpn/CVE-2026-13117.patch      | 46 +++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.7.0.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
new file mode 100644
index 0000000000..ea2e32bdcb
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
@@ -0,0 +1,46 @@
+From 3ce0242e68527fd1e8d378aecb57c466e8058b44 Mon Sep 17 00:00:00 2001
+From: Max Fillinger <maximilian.fillinger@sentyron.com>
+Date: Fri, 22 May 2026 14:34:57 +0200
+Subject: [PATCH] Fix tls_wrap_reneg use after free
+
+When dynamic tls-crypt is active, it is possible for tls_multi_process
+to set to_link to session->tls_wrap_reneg.work and later free that
+session, leaving to_link.data pointing to freed memory.
+
+This is not caught by the function check_session_buf_not_used because it
+checks only tls_wrap, not tls_wrap_reneg. This commit adds that check.
+
+CVE: 2026-13117
+Github: OpenVPN/openvpn-private-issues#119
+Github: OpenVPN/openvpn-private-issues#125
+Reported-By: Trace37 Labs (https://github.com/trace37labs)
+Github: OpenVPN/openvpn-private-issues#131
+Reported-By: Haiyang Huang <huanghaiyang83@gmail.com>
+Signed-off-by: Max Fillinger <maximilian.fillinger@sentyron.com>
+Acked-By: Arne Schwabe <arne@rfc2549.org>
+(cherry picked from commit 2745768d6181c1d54ebfc5ef81f924a127f4f015)
+
+CVE: CVE-2026-13117
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/3ce0242e68527fd1e8d378aecb57c466e8058b44]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ src/openvpn/ssl.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/openvpn/ssl.c b/src/openvpn/ssl.c
+index c0ab6d3dfbe..d7e93bd41ab 100644
+--- a/src/openvpn/ssl.c
++++ b/src/openvpn/ssl.c
+@@ -3154,6 +3154,12 @@ check_session_buf_not_used(struct buffer *to_link, struct tls_session *session)
+                     "still in use (tls_wrap.work.data)");
+         goto used;
+     }
++    if (session->tls_wrap_reneg.work.data == dataptr)
++    {
++        msg(M_INFO, "Warning buffer of freed TLS session is "
++                    "still in use (tls_wrap_reneg.work.data)");
++        goto used;
++    }
+ 
+     for (int i = 0; i < KS_SIZE; i++)
+     {
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 4e466598dc..4d7258bfe8 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
            file://run-ptest \
            file://CVE-2026-40215.patch \
+           file://CVE-2026-13117.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
-- 
2.40.0


