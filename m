Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CB9C7EE2E
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 07:11:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6850.1724915470380972165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 00:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99715c18f5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4wHtT017292
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 07:11:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419pw2hptn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 07:11:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sf5c+HiOQzxucokQXZ+1JAeOPCJyqJ3r/JlDl50nVib2gWmwKYktXATZTl7V1TOHt+fF5uVxOxpXQRaIv0xQzrNDQhrM+uglysOOMXNZ9svREQ9G0FHT96a2HjFceZGL6TKKjB9/ZVf+Ggg0RYXYPiezY/dKer1Mh35uRTC0xOt0Dbw92XV7nqdikF5mrVQth7TzNsUAdCxr2qIiMLPl21UEZ4qpH1CSGbwkuGqvHjH34Tnu2esbkm2GS/HaBJ5kuFOkpMEaZw7fByqR5nZom6l2S9oOtMz2ZblxnkWbvhdGxzMCny1dkOxiczjbESeuxdc5CHnLOvKRsS21EvbWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkVMwGjkL58TmE9QWnddUvN5M4X5S8yxFYEtmFizMdM=;
 b=rrhzmfXBTvFJeij8ixzRbflTcBHkmuzKIpzCgGsaXvCzIM92+zFgZCkKv0Q9rBVFzx9Ptthc7X8FH9vYFCgNaNNzAEfx9jHE8SEH14riLuCSK/2pJkjJBw3j59R+4nFqVUbz/Kca0+b6anSMqgL5RDN2XcZueuTNVD24IDrRUYfiBe768ZSmR6CqS1fFz71bvMWm13OKvkMKqLrhDEJcYsN99jTlUfhRmrXZ1j9s/yj98ViTm1KeFv4PNTOgmsm3+EeOD7cIw0jWpYjmldhMLX9w8ahxoFqjR6TjO3OzFv6w8QkCeEB8Ll69Bi5VMYLl9fXnZYE5hSiPKcXRr9wNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Thu, 29 Aug 2024 07:11:04 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7875.019; Thu, 29 Aug 2024
 07:11:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] snort3: upgrade 3.3.3.0 -> 3.3.4.0
Date: Thu, 29 Aug 2024 15:10:54 +0800
Message-Id: <20240829071054.4065901-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM6PR11MB4515:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bea843-fd1d-4027-cadc-08dcc7f9bef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EkQgIdmJ6GIU1J81F9H+LXdniADaIEs4fkRj5WPV90dIxJSwl1vqaK9/DzmH?=
 =?us-ascii?Q?sMRp/kCyyhKk82ANc6xk+/SKl2bjZGFWL3Cm+RjC6L2/JAskehmVdspSZ8Dq?=
 =?us-ascii?Q?Xl68s6mGY9i/63nQQ5yI+yKKt5nHWAZ79F42XJEA7wBCDu8gdbUquGnpfvfi?=
 =?us-ascii?Q?o0k4S851dr1uBNFe8bit9eFCxLCEQtLIHomuaa2O0JsUw1trnC8xmiYH41+i?=
 =?us-ascii?Q?DCnIsZMiXaKZ5qgNn3QNqQwoA5o1DjDY/Pz1BmiwblrynmXqirQBi6XBqTNJ?=
 =?us-ascii?Q?IFRD25aQ3puIvtQDi6eAp+FkWOvYL1r1s3a2Ab7FLFTm7nesdl16lzSrjAYU?=
 =?us-ascii?Q?LEFPV05YMxHUo3R00Ol7MWevOb0jD9zf/lqKJaf6+yEYc5fSAHoT2MtmYxX+?=
 =?us-ascii?Q?QMWfF6C4m9HThoOEvUpOfA8VmmiCaaYDicj746QBlF1Fgbi/hyPVgzKo6Q+R?=
 =?us-ascii?Q?CpjIA7qj8B08prRa80fx0Z1TQFCRboFrVgZ+lcb+1R0kxC/tlgRPmYGCMzrm?=
 =?us-ascii?Q?x1nNYyvDnoNzc9e8tgwM2NHRAY6HD5x/n8oNzfHdMUwZUE3QtWI0fiGJL6Nb?=
 =?us-ascii?Q?atdVL+sRVmJ43AVW0z+y4XNLvA0rm3CXkiXwMPIJgCtdAkHdfpotlNRDDJPz?=
 =?us-ascii?Q?eoBl1yhocONWszObK5erjExxV2/iuNEr+alELKvyC3U9QfwJNR7eOjw6DjlX?=
 =?us-ascii?Q?lmyVl1IruotGlDZDcrPY6Qbzi4uAESskasKeLNAW5+xwIzpFK3xj6M+lbAde?=
 =?us-ascii?Q?V/Tb6YwY3na/eHzj11SGzF42eAy7rXlpZtSOlmmdQr+J2V7heoGeItBkmM27?=
 =?us-ascii?Q?MNSrAMklRqWXQVP7DT2OjOeUGaLgNq7RHRJAEE8y3gFlHGYDSLxF5x04eQiJ?=
 =?us-ascii?Q?DRBru/fhmVIhpaXwTFW4abGVrzAekmtMpM5wnQdu+yb8QRQq+ZbDp2DW12al?=
 =?us-ascii?Q?OdbmNvrEnTliyuB7t9imQWQrNagh+NeJ1Z8DF/+Sw6DQQZkY7l3c17LoY/SI?=
 =?us-ascii?Q?GFgFJN75/VqQTPlu6c1mOdEcxtd2OX0qPPrz1Fzci4PcrFHOUmzbibQDmlWn?=
 =?us-ascii?Q?t+MjOgoBAbyfnwq3HqhHi7JMpUAcJi5AFOOro8fsbTKpQ9/Dq2p2hbMK73Pb?=
 =?us-ascii?Q?SaDKqSOUoQ1AxOI70XfgsU4XB1jHvEL2QRs6caUrwF6Xx2oFWcU+c5v0gri2?=
 =?us-ascii?Q?/IMJyp1wBjsbOjcueWsyeha44uNfzw8QVRi/ysmhIw3xstVpMQq9WhhEybAt?=
 =?us-ascii?Q?SpUCDNwJ6dX/NDi71OYpCaopc34QNfjInTaEKmQfxIuD82QfqOdGwN494EQp?=
 =?us-ascii?Q?40JH1yZ9bAnAYZIIkbKS8UA1lvvE/4fv7I0ngxkD60QK7KqqM7KGRf3sLHyH?=
 =?us-ascii?Q?SeaZpvg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gbuXO0ITZIyOKHmCYKy75GCIX4ql/ffDQAk8CqvcU0ZZ3jjPJ7uj5ydlu2rK?=
 =?us-ascii?Q?Zi48nmwFejiHQ+/son8t9nZDPvmvmclnU/U/64tgQn0BKN9jXIxc+o1ZKHak?=
 =?us-ascii?Q?klgm8XmN0fex7E8PA5ewUyOjko1p0On9rWPrH77onv0b/vm4Y88IPy7bTGLr?=
 =?us-ascii?Q?qWQDOSWLjBYbm1Yx/bEwK7nOzAdtg+bAu1XbYuIjaNahu0vr9uuwXU/dzMk+?=
 =?us-ascii?Q?0iYEuXQi4HsD95BNIa42p2HaAx1iG8YGuLZ2R8+/5Piorq43kOAipNq2ExYH?=
 =?us-ascii?Q?kdAJ4LZrgx7mqFlsUmcDxpprqM66YRpK0Im9q7Pop+v7ADzs/YWuxcBer+tP?=
 =?us-ascii?Q?j67/R0c53raLGj1rpNUss3bltfcOcLAbIzffiXr/DOo5Ve7onddhiMRd8wlu?=
 =?us-ascii?Q?oyH6m6S+fl5kPfoxkBbZFVcT+y/zsZP0VO94LhG+3nG3zlzaaFzwrTfQaANP?=
 =?us-ascii?Q?vghuwlIE/WpITNa0/Ms9eqaXHMuK1zA+12ivGVh6jyFAJrzjh+LRdHl9NJgR?=
 =?us-ascii?Q?RkgJg/xnsAWK7WIfFa72af1Q8nVMMWOxhY67kmdAXM15r2XgrLAVvo3L5v/S?=
 =?us-ascii?Q?0cAOZbDA0Bybx0LS2KErqzn6pokRcoOsYVtCf9vVGMomzGuBihfKsJ1ENiDO?=
 =?us-ascii?Q?EwHpK1U6H/BUtbVpyXvSR81wpJjLVm2h9YlprtElTR0KuHH+l5BGoNJQh1G5?=
 =?us-ascii?Q?M/YEgKvQirv9X8yVpEkJQ/7i5dE5yMpM34FiKjN92w7Fqmv2e+VlSUBxVfcX?=
 =?us-ascii?Q?hoWI9w3F1gkLfbWVgSpSEYYEA6pfkqEEMVP4ue+spKzDo87FJcg6iQc1CcpH?=
 =?us-ascii?Q?Z/FF49JhVfo10HElKo7tPPKMpMBPzelpa2DxRsnhvAVLULEdsFIV5Y9vlW9S?=
 =?us-ascii?Q?5NV4FBj6g1/R3dib2OfiO2a7JmPKWkS+UtOQ9SpBgafMUMo3wiyBOI8GMMrW?=
 =?us-ascii?Q?fqRRREPk6063OJk0QWWdtgub2q1Bgw+7UkXFuEGpWySzTMHiXQFPkKIXLiSI?=
 =?us-ascii?Q?Tix7FM9K4khZPbrY9VEeTwSIUTXG7FafpW1o63crFAISH8Mn29dnZNM3Ald8?=
 =?us-ascii?Q?RD/c57q8ac8mRHhMUzc6mWceUbpFumeSmpsoAlRbkcY6YfivPSOIY0eypx/X?=
 =?us-ascii?Q?I90a2I9uoqtfsPdtlRBStPiszBwDu2LnIss6zJUQnaVChMS9lpZyD10ggD0j?=
 =?us-ascii?Q?HZVW8REmn9GSNlNgKo2cEQdSCuuSfki6s+7usv1w8FlZfbq2avuIuRL8XflC?=
 =?us-ascii?Q?GjKzegKndOe5y5WTEJvpMnRp+S88yg6pxFdRrKBr/rvJ6aaNPu5hkOc9Z33p?=
 =?us-ascii?Q?uNfrBvaOiNTNgzWqaM7M8PvTlMYQbSUlEhmga8rwIi3E0yx8l9CqAzpU0IYB?=
 =?us-ascii?Q?4zHlwsDMm5K2Yk/OxPbWGQIj4FmXOBELGxpqM+6uNuPSIcoNXmBnE7sbYc/F?=
 =?us-ascii?Q?ErjXMM7KX4DBputHPZa0msHeUO8979qr/dEp56hS86SpR7rBEgSd9H3vZ53c?=
 =?us-ascii?Q?v1gp8/XG2hblpkgzrQSOCtHXc0e683pWEcUGmuciNUpnYkOFvMYbYbrIui7H?=
 =?us-ascii?Q?NvrZM0Prxu5nrWw2VSXzy38Tn0EbgiebwbDMsech?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bea843-fd1d-4027-cadc-08dcc7f9bef9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:11:04.6494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /T0dJPbfnRqNxoYlQSfcPmQ31h5TEJwndEQ3BGwbFeEN/0rfJABD/EMQlXbOE/liU0oUuoBQJj4nP/B4WM2JFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
X-Proofpoint-ORIG-GUID: GLzoseiQjgu2zwIJk6W-9MAEom2At0eU
X-Authority-Analysis: v=2.4 cv=Kucf2nWN c=1 sm=1 tr=0 ts=66d01f0d cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=jRk97MQQ72kCReX4AVQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GLzoseiQjgu2zwIJk6W-9MAEom2At0eU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408290051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 07:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112033

ChangeLog:
https://github.com/snort3/snort3/releases/tag/3.3.4.0

* appid: notify binder on service change
* appid: replaced hsessions vector of raw pointers into vector of smart
  pointers
* ftp_telnet: refactoring ftp-data
* latency, dce, stream_ip: fix max pegs incorrectly declared sum
* telnet: avoid flush when cr or lf is between commands

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../snort/{snort3_3.3.3.0.bb => snort3_3.3.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort3_3.3.3.0.bb => snort3_3.3.4.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.3.3.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort3_3.3.3.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
index ebb041575..0f3d0e986 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.3.3.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch"
 
-SRCREV = "276ee7604f84f393033324b624421bef1622af66"
+SRCREV = "5598e8dd87829cb1bbb478a7b6d4f6fb8b5dabfe"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


