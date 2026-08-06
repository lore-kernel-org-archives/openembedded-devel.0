Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBBFC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:23:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13875.1785997396261260908
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ieZ6kb1o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26789fefaa=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6764sWjf3561744
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Aug 2026 06:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=aHrhfeDuHBkuuqw/U06m
	+N1rhNJ+D6PMlO668G5R4uI=; b=ieZ6kb1o2jiGGZjhb+vxg6a8yqi8HTQeo1FI
	X3l0xfmabLcTu7TgPpAVQ7D7JqtDf9wfIkR0Ev3+05ucI9NPdE9wCIWYP7JlXFMW
	fnWU4SY4sX4ETgtQ7aP8guEyPuRoyB0PBY2yWz5hevTuNdTIpnG7toIuQAMTBxlN
	+yz2z3v/LLqEOq9JJkRlctgUZPsvBI06ki80NiFqeOX3zr9MC5z/6e1s4vRoojnb
	a9WBGvF0a+tLOK1QjrvFW0499lCKAqRPVqSer5/5iSorIMq4qPaC2wgmKMWAWtSh
	kBe7apNOr7n+KQYEZsXtW2K2ukDqmMEmXC9q+vVofiQQUwudAw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fs7s8g86g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 06:23:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qS9SYDlu7nrIf3cWYZknLBtUEriG5MMTd9YJd2vJhehEwmdtSf3U0GElOjIKro3jPgNHfqFG1caS2ZjXCRr9t/lXKfYVZmGcgHYYiylzgtG61L57V2/M8ICWDQhtikK+9dTkpaxpfmvbwR7gqIGzKHRhxJ1AMc4sCNr8wdrH5kUwi+xFwikC8Mo3sTysGhr7jzBIdsm/zgDGiC3Jx2ahmFRuu8Ro8TL4Dz1IweqoE9fg+r2gB2hhYfGsDYJ8nVspIvxjifsID1v+4mjFx9f/sftqzC/+UFosTn5+eKE+9Oy1fhqJ8W3cnrIHeoZxau++YWnrvr7jzz8nuUQLklzqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHrhfeDuHBkuuqw/U06m+N1rhNJ+D6PMlO668G5R4uI=;
 b=ewLmBqb+4ROBqtDLSgP7YDT+yoFIonFv7ae+jcfRwNsBExX/9xbUgtkHSlosTwPC0Hu5R3mjsW4cJPubNcG5jzphiMHuFenUp8lfkarXbbKleoIZxOaJf9A4W0tPkKwD4MlWqweR7cEnWQGVSQpMYuFXupvmFlSzKg8gfXy4elyiDaxztBVAyZ0O2smEbcN/x0k3CFwDzXQK1KsjSLsTlLtMwvjD0oDVkNGNadyqRL9L/YHUP7HTbdnYYo43FfZLlP+EXhZSsm9nnncXZ5GwWZdms34wHMghhKRXK1e5/cyi4E6vNeK/PzTyKXNzykI3IaP89AChAxJLO1+1YuMESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by PH8PR11MB9535.namprd11.prod.outlook.com
 (2603:10b6:510:39f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 06:23:12 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::af7a:fb70:1f7e:534f]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::af7a:fb70:1f7e:534f%3]) with mapi id 15.21.0270.018; Thu, 6 Aug 2026
 06:23:12 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] openvpn: fix CVE-2026-40215
Date: Thu,  6 Aug 2026 11:52:48 +0530
Message-Id: <20260806062248.2339681-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|PH8PR11MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1254d8-8c11-47e9-ed1e-08def383311a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|52116014|1800799024|376014|11063799006|56012099006|10067099003|6133799003|12006099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ljc/MbY668HGKQ3/22iyArFs1gEcNDOzMGriSp3GlI7eoEuJjhLlVPEEKyiudQGd2Iu3qKQXuYKUal4FQDkRduVPEfm2YR1BWtAH8s6RhRpFqNi7yMBfPaNY/hvUxggsKgrajgU6EMNheEgiFJCijfbRjSzvAEivNjBVxn6b0x34XOzn3s19Wa0mEm+5DCG9ItO3wuxSn2iWKZ9oJJv2aK7cmhXKxiVmfVTcD3zeLIuA9d+LFrWnsrlo60GnN4BXxjmklsnRqOWppEcCJDwxIzn432TjQnFdfYPX7kg7cteGdj/q473fqW/tHksD6ovwkCYd1hkJwQuTwV+XaQfdrTnMb6LTLXlfPjhcVNKFBtrUhHEXVhLQtHiKjujWrBAoRZRX/y1UAIhRi2lYzyyLKBfIxQo9lz8V9GBfsVRZXoHP3de+GP+KWyJEdle1RueyPY/xt+S7Vmmf4KJsa861LoVnY5HVIdCizwLo+4VR7wZf1sAMyvIIN621r0tv0O1DymreOJM2y8z4hRthdKHmyOwtaz5B4Z8q+eEyLqCdadnLBVf7jSFWRKJB4QmARYflU2AwctsclqMBG8chRM5H2nOf6XFO4lw/PAKPjfZ5/0Wjit/IFq1Mhrlg3LNzUhzS9bDVe5OT6sul1FCc1j7SKDZql916dqgjFI0eHeW7t3cCYd9MKrMjT8/2QrE2KPpT+lwr5fuKNPh+hSwYUWTEN4mrBWknyGIkJbYoMZPUqfY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(12006099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u0EdXs8jLjer7Kx/98NqjmqNKTnx4jR1SDlOdeDpTOV8Lehn4HIgxYxAWh44?=
 =?us-ascii?Q?CMM/gqu+vcN7GMUIpngr4uCJKJtdr/mKoaJGiGdM6fk2ap5y539qwNzJnuP0?=
 =?us-ascii?Q?w7dN9Mvi0xB5tKxF27T9tgGuHJU1hW84P3LRlnjf7H8lPqQBH4D6SGNZ2tE7?=
 =?us-ascii?Q?FJZCrXQ9Nh7hZLMaJ6o5+xxDznVyxsPUbqe7a29AG6JupbOhfuFI53Gic/kY?=
 =?us-ascii?Q?GYhA/22ff8QCCw00r9iY6BedwYp85TBvjsryMCx1nQqbsGXzSobyVI81EsP0?=
 =?us-ascii?Q?TzmIMKigFhtJVY8JGsjqnQkUo/n5cRftq0y99mx/yy3MNNHGOF/ubbxti2O/?=
 =?us-ascii?Q?wTI5JQNWVysjGtrEnXBunJrPmm81oNZxnMMjdnyKrTI/HTvzLTzTdxXsloEd?=
 =?us-ascii?Q?fPufx0ejAgdIUBovf7IfdcJ/QbxpEw5newAtiH9jmSszoITTGViGmC/8VBmT?=
 =?us-ascii?Q?gj361VF3iD3Ub/wsypgSWOTLUh+BUdl5oY5Es1Kz3yadHV7Hy7fxQawUc0KV?=
 =?us-ascii?Q?UZA251L0SvC4jOmk1e9hzlrtZgGroasQ3dqjha2DAxCz+LUMDnL2OMUe7YOD?=
 =?us-ascii?Q?I57uUR0NlrqJbjQYB7LHoMm1NTdzCC3inIhcQaKoqR/WCta3FFkgK6T10iaW?=
 =?us-ascii?Q?ZKRXKWgwmr+dCTF6x0FVJ6j0vu8ngmFehD97PrrQ/Z46h7xBQTFsnT3M4kSf?=
 =?us-ascii?Q?2W/qs8GcPibqeZ3OW0JnUMf8dEHhq5zvVPrX0ikpzFnWMyHxxy7Q3OkwLdQ/?=
 =?us-ascii?Q?kKAql3UivpWDEdCm9KhHSEZfOwp6/s6C3dX1W13qQhfAtX83NIirGF0dLRNi?=
 =?us-ascii?Q?QUojji6EqSDjH2Q+472T0RXhQFJhvgxV3BiHRgKIrdYV7PhZl8DYLrbXXRse?=
 =?us-ascii?Q?FMgpU3NzcoRinpYWwqtHXsncrgLSLsn++nMqxZG4yQ3wzOqgfQ20+jJKJUgk?=
 =?us-ascii?Q?jxa1Pg67rmARSmIEzPFUWWjsoX7wmQuAdbpswnj6LpgUne8aSEyKQglHfW5E?=
 =?us-ascii?Q?hEc7JASujaS86hodaLVuBe5LK+P2Tobp0miOmz6RbQ9Hr1Y2KTbPKUjNYkv3?=
 =?us-ascii?Q?sLYhYZ6iiMqdRTmzBAV0KNl2lf/wmZMBbfN7u1BTHmUTkcbMGehNQX+N/ZiF?=
 =?us-ascii?Q?+hZzn7JIAI+oVsNwvAjWFcs75pZQSo/qQCo/rx1QpLUC8kiN5H08Q7ruJOZ/?=
 =?us-ascii?Q?CEEcZFEBBMVqpplSgJ4/bu/WQtqF8aXuHllxLJpIn8fcuXvetTPdBIcNXwwu?=
 =?us-ascii?Q?ks7Tfrl/tXdc4jSQSeZDrOFRsp7raFxzVDdkitKQ5qJJrfsECdHTOfh1+M/Q?=
 =?us-ascii?Q?vNbQ6AA4iGAssal6q1/w6L7azzgcLnTVGnxepefT/+UPZ+33xHOQynoH64l2?=
 =?us-ascii?Q?eyzuE7JTUa2pVrmdwlfIT4I9F5dbasRldffck+FysWwNyA0wSI6/Ko+c6tSd?=
 =?us-ascii?Q?r6ozVRM9tp5PWdyH9Uu6SdEVE7v5+kKRzmuKlI7pi5HESNTuMpoO0sIqurO5?=
 =?us-ascii?Q?6dfK3nogCkmqAxoBXTVTvVjmccFJDDdQdhdwLO/D5ZzYrnCxvu0Pla9TkiNX?=
 =?us-ascii?Q?DGfxK9qY9ug8f6RKwrOchfWQW+EvgMVzBuvfxLCJDPevTGYjFpLkNiE6PJFu?=
 =?us-ascii?Q?5XyefDFZyZVlCsKVhTMQiKBUQNrWE7AmpnHCFMJsfq9XIyd+EpC7OPvGexLy?=
 =?us-ascii?Q?JvyYOkEdQ4VvgKMOggV7KlyUXtjjrJnb+uDghFyxWyUm43IWO+cF5Dx39UaR?=
 =?us-ascii?Q?I41jgxTuVxS3T/6BOya8zueDBaoyRT4=3D?=
X-Exchange-RoutingPolicyChecked: 
	g3AV6GXYaCpjaGipba9oknm1vT8buL17C7g9R7W9yVU8ByZv+SQSvTZmxTxv+fuKt9NrerjTpDGWBzaRPtlHQuWAIctJBLanm9iqKOK7r16qRG6s5/XJtDeltHCHGSXwM4HJ8OKuagNBhyu52MYfUNq8499nESe6zgh4M66Wdavalks31M+dCJgKcYTUDHRTTNJFFlnnLg/jWpqBny55vkfpBbbyX/IwF47S6qxdWQFuDH4XNVJj3NaxMUqk7iI9jdzXJZ2yJLuEAUtoa6m1yTSRzbjUQuL/VMcj5vVV1rM3YfSda/g7wT5z2OCk0XL5kUMM7mL27KWjGSe5kFjyOA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1254d8-8c11-47e9-ed1e-08def383311a
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 06:23:12.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ansLfibmpRCYgiJuf0mgKOJzOjOTZhwngG1A1MjjcP8loCLri6nKALrVoGK2t31G4uZhfxSsqFc7fhRsRc3N87Z2yNIQ+FDzP2qhhDdK3Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9535
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0NyBTYWx0ZWRfX9l8PUll/UDDA
 G3AOxFMAl04l5OM23bCQ+oIZzEMBcfRIuI5RVGJH33RIWbV+1NK+GwbCUncPdPkclSh5tNaTZiw
 UA8fU1zpOsmp8BfjCHj5b25zOKMnmTltiF7Gw14HULkrJd1HFfdP
X-Proofpoint-ORIG-GUID: Cwj6XUzomFzgL7lI-0CJjsEkAGao2Wvz
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a742852 cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8
 a=t7CeM3EgAAAA:8 a=xeC3QtFAAAAA:8 a=GvQkQWPkAAAA:8 a=pGLkceISAAAA:8
 a=amB30EhMnZE3fcpCAG0A:9 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9XEOD9pWidfRTSXZEhnp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0NyBTYWx0ZWRfX1QfrOcveo9iZ
 gVyoCndJRzldpvgx5SIT+jU8SVeSxFIYz80bD2cbuyrx5hhBMOZX/SXYaXa//pjLV9g7Cbs1Wb8
 yuDYuv7rLkMgKwjd2J8p74ix09rFhCWrnG89NRMAKQJjXKkuGLPBOzls9Kbc509SOqByano68Fc
 u/rNFNd6sWtDzGz8pi3HIgdyUMqXcY+AScBlq/Oeb0V8rhvzGs4cKLblEvArGVWoQ4oYXxoxb5W
 ZQnGIewHZl6/yIvvkfqs3GOvlH6ZX3HC6G2R8+7x8C5b4bDaN20FvX2nEZbcEsvTi6OAddXNAYP
 ij+IWZS4C97Cs59dDK/njw12cga1IF2EtAxHxJN/pzMCz4Eeed2nH+0SnO4Gs6VOmeAUdDpBUIp
 KniFb4tb+w4fBUueQmjB+090HEqopTTEUNEor+7dZzRYwYms2tbiWmjYcTVJUqqapkCMx3l+TU1
 0qeSdwuW4LS4DLgyRQA==
X-Proofpoint-GUID: Cwj6XUzomFzgL7lI-0CJjsEkAGao2Wvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 06:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128837

A race condition in OpenVPN 2.6.0 through 2.6.19 and 2.7_alpha1
through 2.7.1 allows remote attackers to potentially cause a
server crash or leak heap memory via a use-after-free triggered
during TLS session promotion

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-40215]
[https://security-tracker.debian.org/tracker/CVE-2026-40215]

Upstream patch:
[https://github.com/OpenVPN/openvpn/commit/4a2c827c2536aa03a1d6c7cc916689a46c067187]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../openvpn/openvpn/CVE-2026-40215.patch      | 59 +++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.7.0.bb  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
new file mode 100644
index 0000000000..e1bd0c99df
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
@@ -0,0 +1,59 @@
+From 4a2c827c2536aa03a1d6c7cc916689a46c067187 Mon Sep 17 00:00:00 2001
+From: Arne Schwabe <arne@rfc2549.org>
+Date: Fri, 10 Apr 2026 16:59:53 +0200
+Subject: [PATCH] Ensure that buffer of freed session are not used
+
+In a race condition an old TLS session could still try to send a packet but
+also get replaced by a new session. In this case, the buffer of the new
+session is still referenced. Add the check_session_buf_not_used function
+to mitigate this problem.
+
+Also make the check if the to_link pointer is in one of the memory
+regions a bit better even though this not make a difference with the
+way we use these structs. But better safe than sorry.
+
+A better solution to remove the TM_INITIAL state and handle reconnecting
+session in their own complete tls_multi is a more involved fix that requires
+a lot more refactoring.
+
+CVE: 2026-40215
+Reported-By: XlabAI Team of Tencent Xuanwu Lab (xlabai@tencent.com)
+Reported-By: Guannan Wang (wgnbuaa@gmail.com
+Reported-By: Zhanpeng Liu (pkugenuine@gmail.com)
+Reported-By: Guancheng Li (lgcpku@gmail.com)
+Signed-off-by: Arne Schwabe <arne@rfc2549.org>
+
+Change-Id: I7c5fa2a7a2563b7a8955d386411f3ceffe5b092f
+Private-URL: https://github.com/OpenVPN/openvpn-private-issues/issues/112
+Acked-by: Gert Doering <gert@greenie.muc.de>
+
+CVE: CVE-2026-40215
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/4a2c827c2536aa03a1d6c7cc916689a46c067187]
+
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+(cherry picked from commit b2a15fb84d85790eeae4a2e12b431cbfd0b0302f)
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ src/openvpn/ssl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/openvpn/ssl.c b/src/openvpn/ssl.c
+index b188b4e9b32..a63d142ec46 100644
+--- a/src/openvpn/ssl.c
++++ b/src/openvpn/ssl.c
+@@ -3280,6 +3280,7 @@ tls_multi_process(struct tls_multi *multi, struct buffer *to_link,
+                 if (i == TM_ACTIVE && ks_lame->state >= S_GENERATED_KEYS
+                     && !multi->opt.single_session)
+                 {
++                    check_session_buf_not_used(to_link, session);
+                     move_session(multi, TM_LAME_DUCK, TM_ACTIVE, true);
+                 }
+                 else
+@@ -3353,6 +3354,7 @@ tls_multi_process(struct tls_multi *multi, struct buffer *to_link,
+      */
+     if (TLS_AUTHENTICATED(multi, &multi->session[TM_INITIAL].key[KS_PRIMARY]))
+     {
++        check_session_buf_not_used(to_link, &multi->session[TM_ACTIVE]);
+         move_session(multi, TM_ACTIVE, TM_INITIAL, true);
+         tas = tls_authentication_status(multi);
+         msg(D_TLS_DEBUG_LOW,
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 0cbe4641cd..4e466598dc 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-tests-skip-test-execution-when-cross-compiling.patch \
            file://openvpn \
            file://run-ptest \
+           file://CVE-2026-40215.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
-- 
2.40.0


