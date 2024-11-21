Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A273D6ED04
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:03:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8063.1732187028998066401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10555741c7=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL9qsj8022731
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 03:03:48 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq57b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 03:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzzzqJoYvQwPBKafSfayv6MNFhhTQFb2FthbPCqEG2pUAW2CsVqU5KXgzrjvCMX4ggf6k43zedpMlw0tfYVRDyyAjlQHBkUbECh2L1L1VQefRIgF9B+uJEAXbK0E21TMEgnFjycJMXeuCaenMTsp+vFTS8Wlq0lDYcLkcRxI4/wYhGE7/vCb9TA+pIPDFLj5Px5MSibLlhCivwv2bzj7VqFkwPsHR+0zWm7hcbtmahCchYJtd5/BuxhYxAW45MGKXHoZPlYjBNJ7gZWPPvE3bP+IoHtgdBUxLr+BNTkBG6cFAWnKQyRHwGsU/XTy9cAVZZg0SHq0RsnGu89oyQ3Zaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0fFFGw9eo/HbXJd6c5xuLfNAkvL0MULAYLBxkYQoIg=;
 b=qmrq/Q2xzqEKX8cDBrWHQzStrv/hcb9TEP7Spxt5G/it1A2jCbMHOnwGxH2TGj0wFL7KvRnlcKs7XCCiONdTOYh62mJErYnskmPzcJdOfAujVtufT+zipgg/QTmEiMUKsMn1qurXgM27/lbjNvff7PO90ZZzLk5nZX77xqufeBiu3nOWcN1E0R8D64iBsNM07tSdpnv/tnvQIz8TVlgGaHODpUlH/v/YIVpd89v+NkWWM49CM8MrpgK22BrMueKmg9mZmVeK3EL2pt/JdH8W/TpkRwaXxbb5jI1FURTx+g2Hmc42gOwBVQ+dCBpeNIs6K6ZGxdfmSjE7ei7rVvW7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 11:03:43 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%5]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 11:03:43 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][scarthgap][PATCH 1/1] freeradius: upgrade 3.2.3 -> 3.2.5
Date: Thu, 21 Nov 2024 19:03:28 +0800
Message-Id: <20241121110328.1056588-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:404:15::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5626d8-dc53-455a-5538-08dd0a1c298c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vR0YaUHpTtIM4YNyJyRelYzXuxf6ys17xOGYcVQDwNTHrk8MOS3CJWUG7aKH?=
 =?us-ascii?Q?MZ/66CJ3SoK308DZUHoT+19wg1aNqteMtD+3Z5hgfn462v8JndlwD8DLzVQq?=
 =?us-ascii?Q?B/Hz6APKdpdEHyBZHxNxeEZuJACAm1PUBSa7QQZ9XHRoakPen0ZxJDNexEDf?=
 =?us-ascii?Q?f8kmOADZlER5EUlOHvaCKggAhUKLH7Unj2oYkhH08y+x6anmzEc+k61EC4zq?=
 =?us-ascii?Q?2u/NOKyUjuRPYlB2pq5uqp3anEPX7l9DrtwJT42qlLpYOCijgONL48yvZtzn?=
 =?us-ascii?Q?O9DwuO91kbsFwlc+St3ZSL79rXFmdF16YPeyhCzzY0w0YuKtOaqVfKggtScY?=
 =?us-ascii?Q?d0hYrlRswPdbqh0WLvpO+QlkgU4dYoOj4ccRtLVJ5lIIQ9q0NHKVdJFvblXr?=
 =?us-ascii?Q?Y5BQ4zf1Y3VYmf7jU8ZZt46XJKSRgj5NfXqJWJHCp++zDuW+rYeo0vLdYEIh?=
 =?us-ascii?Q?r7az02tMC41QY8E85jmeqLAntq1absyCA0zVCclNg1Se8PUFes/5dMNQBpYk?=
 =?us-ascii?Q?0jWx8F4vYINjKa5Tf91K2Rwowhztf0ZKfGjrljUFdGhZ8X3cOAHgwVScvFzq?=
 =?us-ascii?Q?Xf4EruUR240hhksLYWpMGzOmf+pqPyjyuIalyeV4I12YztF5FASK6CjytZOq?=
 =?us-ascii?Q?xONTvudF4ahy8DVElYWv6FdslklEIDruKtyL9One5DN7Lj5iGedO+I5JPzY+?=
 =?us-ascii?Q?RC+QlP1EQBwsA0kju0LSrjHTq7tIiFy4Fk4DO4/oTEvr/FEPHSph5k5p0NrY?=
 =?us-ascii?Q?XNfT0OzK8xTxaZNa0621RPP/9zbgVByVpDGw0O7bonY4KmlmRiwpegSHYHGj?=
 =?us-ascii?Q?fbDU9K35GA12KmlMidHG8gcayOS8j7tKGSS8I4t3z/L7D3lz6cZNsqV3duAS?=
 =?us-ascii?Q?ezQspLrHUqUWMFROXU91q6UAljD8LJWASkHP7PnEHtKlYlJ42M5yCOKO/nUu?=
 =?us-ascii?Q?233wqNQAPBLQ3ieFvUdNWly+h6EgBNSRMySVRyrJ1vl7GyeXihjabYKncBeR?=
 =?us-ascii?Q?p8Ns/eDPfJ4sn/fdjLvYGSNoz7VPQqKMyzqYfIu4e4+Lw+HxwZcaWimgJqis?=
 =?us-ascii?Q?w3rcDny9+axDEgicTiN2G4EFTsyqWSCBtyRAPY7I2JbHIe/gc1EuQrpn9OcH?=
 =?us-ascii?Q?SH1Zg+AcNKqp4hMbU4pYTZwjkPvoTheRiEV68tvZJDOCjpjC0n9PNyb7FXli?=
 =?us-ascii?Q?qWLK8VX6Lcr79GygfDy0hqYpIuHRph1qtCwHGCGE9XmycQNVtCFCj5AvcacJ?=
 =?us-ascii?Q?1+2dDRxVwTkQakN/VpgVWfdzBFmGdnGn6/r6DWJa18XSWkakCzmE3QbB27us?=
 =?us-ascii?Q?V3YbIgIW4ZpWQEzlEki4wt65?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lSYNK3FxiyGrb3HRw9RuPHcAUxQZFHV9e0UwZgjajFePROgRW3KAnUG3yk4i?=
 =?us-ascii?Q?echPPsiHR8y9dHtcF2KonAoj7cxo1+TjXzXD0G3KYZXfukZQZh96+EK/qHVF?=
 =?us-ascii?Q?S+0D2E7ZWEA/Imx+imAr+esK4naQ1eeCBG1ySL0bwiN+K3kqeRvUKjutneoQ?=
 =?us-ascii?Q?3RTLMco+85YpCZ+THRKtcAShCe1xkslsWS018Ay8YsJ+SF+DdueEsoWOIcfe?=
 =?us-ascii?Q?QNM6bJYAFxhYJDDkDncBPujT/YBCba8+34jwi50cCGSkuGPDPZK9I+bRkdQJ?=
 =?us-ascii?Q?zU6JLpmTg3fyGX/nuUYgg8VW0CXn46aqAWCJpFuuS/eGKRGbaoI5Ph6dhlA0?=
 =?us-ascii?Q?FCEi9lpLR15EFgd8k8XnOxB4i8ET/GtbUji7/QPCiqWRnBA0Xtn6fO8uGAFC?=
 =?us-ascii?Q?o0XakWHPQhXYOeN3c/u1BUd8pyzebFFPhY8BvoVxtqyT7dPZwpJTyF/FhkHZ?=
 =?us-ascii?Q?9yLCXeKCLmvMQFNzbN+Rq8CSZSqRrsVRtPfN4aPNpZCC+jKmo92N8nrDzYSO?=
 =?us-ascii?Q?3V1S/T2vJbWp+UqpN+dWTfjVxu8zgQm1U4MLhFsGdTeVyKP/fYihjSkqZkQ/?=
 =?us-ascii?Q?QMMEyjdD24XG5AsDC3Q3ChLxKRzz+zTFb1uFLN8NQ0ZBgt67HzbHR5NmmcWy?=
 =?us-ascii?Q?GDN+E/bzLLcru461Xyf0s5Tw8LuY1X92uBbTZ1n4bWrFf20xe5YfJdS/Wcta?=
 =?us-ascii?Q?y49kNW6eRBtraPAK3bXzJBQjjEGR7ajlZkapjG3t9lBKg06rSgnZN3YKrW8y?=
 =?us-ascii?Q?32h3eU0vnI7TMKaPQLXMpPKbmk7kf2XCiYy1lNWd+C1gs/vwS0vp5D3pwX4q?=
 =?us-ascii?Q?Q2dtwxvm0p7+hnicMhHIFfsln5pHEjJaz5yTlJoFbS0I3Gi100unxJLpb6hN?=
 =?us-ascii?Q?KXVm+CblDMufueeRCAln5mCvJDzERN5Z3jwqjabBCLsjHfvgH84ATBv7KZwC?=
 =?us-ascii?Q?PGBjlxm7O7sVWAjbQRgUbSvHyiYz0ccSPPmMY7frvxYKmj5PrHUJLbU/cu/O?=
 =?us-ascii?Q?WVF/sI9H04T4juvmJw78ixIRLRrwFDsE/ZWFR28+Jk0tCfv5ieN42xO+drJb?=
 =?us-ascii?Q?kRALdrkuCHdEKHo3WOuaWswQU5dIMmb6R943ZyBL2eqfU3Exx3jYkbki/brt?=
 =?us-ascii?Q?nGudATRoZ78Um+S6C88FuXm41JqJ+By63l6CEL0dzHVdBzYY3BiXf5pq9FI9?=
 =?us-ascii?Q?xKezdeujWX/hwDfwEsg3k9bLmM1Hr8IFUIBOXdvoNYcz3Ufk95+bksXZmSVf?=
 =?us-ascii?Q?aLGgIOWBRUuSKJcGHc6Sp+bXcU2rH8N7hYi8dCWOfHUEW5emcBqjM9KEPeX3?=
 =?us-ascii?Q?t7OkDryKOEHwK8XJNDPAI+cXIyB6Uhnzj8z+AmMEAT2+BCKxJhroY9SwVvEh?=
 =?us-ascii?Q?y5fAudTJLj4uVDLNA69N1ryaWMLggfPPIVxu0OwMdeV9WYR4cUc/MClnarew?=
 =?us-ascii?Q?DlTCUlcTR785aj9d2nYHOEUwbp9efUwZowgOcvOj8h7o48b2dbOzlpKbR4zN?=
 =?us-ascii?Q?H+hExr5QvNky+O9IJ00vAHdTMhjJOzKr98p/NG14QGeNBKWbvWJi1pGwNsCg?=
 =?us-ascii?Q?8gKHLNwC+c17emj/2ffd/gNK6Wa+oSvwRw8bIh3jmm4KCjo/45LntweZ+Jaw?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5626d8-dc53-455a-5538-08dd0a1c298c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 11:03:43.0987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fg60R4UA/REFu1Xw5V4MQ+MbkjrwQeuHbw3gsIz0EPmtRCCeUkHF4lldgMpAyoax3vrGuNjWcxTlr9O41IVf6zxsn1YERKVawol4Tu3bf/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
X-Proofpoint-GUID: n18BAPstcFXBX7MqXP-6OegsGKL3Ikb7
X-Proofpoint-ORIG-GUID: n18BAPstcFXBX7MqXP-6OegsGKL3Ikb7
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673f1394 cx=c_pps a=ZeveGGZnxkNpWlA7A6AaFA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=JBbWWo_dQDwA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=FcTRRU_JAAAA:8 a=CjCwKRb6AAAA:8 a=wxTbmSEpAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=e-KD-92V04e1ACSu5JwA:9 a=-FEs8UIgK8oA:10 a=24chkg8mTlgNITX-x-SQ:22 a=yyUDA5s9UKYzn2Z-n8u3:22 a=BUy6Hz7BFr9c6Tp_jCZq:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_07,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 11:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113965

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_4
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_5

Security fixes:
CVE-2024-3596:
RADIUS Protocol under RFC 2865 is susceptible to forgery attacks by a
local attacker who can modify any valid Response (Access-Accept,
Access-Reject, or Access-Challenge) to any other response using a
chosen-prefix collision attack against MD5 Response Authenticator
signature.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3596
https://www.freeradius.org/security/
https://www.blastradius.fail/
https://www.inkbridgenetworks.com/web/content/2557?unique=47be02c8aed46c53b0765db185320249ad873d95

(master rev: 28d82d17c8174ee17271ca43ad7eb2175211cacc)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../freeradius/{freeradius_3.2.3.bb => freeradius_3.2.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.3.bb => freeradius_3.2.5.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
index 7ea63a65d319..70f249617020 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
@@ -39,7 +39,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "db3d1924d9a2e8d37c43872932621f69cfdbb099"
+SRCREV = "a7acce80f5ba2271d9aeb737a4a91a5bf8317f31"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
-- 
2.34.1


