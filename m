Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF182CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9563.1790856319677132753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lz039Brd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecf0955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/6xP4Qv/DMcea83CQnazb0aKCbw6jq5XWLO26nG4I7E=; b=
	Lz039BrdIhT4NUw7LZP6inKGQ4/g66iWLt7ash9xjtlQQZBw7wk4FhcjLjC6XtFs
	Z+SdgWqeblCtXF2lqDrKnI4SeSwdkL9nIuehq85iG+TforrFQTN0egCyRojM4PxQ
	SesPDipvAkUgA5eqysNNilU3hSTM+XN66NJ/DtnB2MWMqywnXxgSNM5aN5c534SD
	sEzKCzMwelzhmjW6mspaWEtE1v9H2gHCZ3sjegw9zRHp8UoDyE46y8YB53ceNGPY
	SqZGJtvds93fcvO3CNFHLd1KIoJG2HTen1uXobhc2UiK7IroMmUNizvhyEwL2MhS
	Yt9XLwxGH5TqPLEVgSlI4w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMpbcD5GLaERThrw4oXlxiGePaQxFoV9qnoByfiE6V02ubWFqU1VAQuvAWYVvc/Tt9y8JQG99pSCofsc4MUWJ4q0xcu6G8siCFeAYz8Etg6bSex7J2/na0LWsX5XKbrYoT6X5QzfnVS3sK4fIpye1i/AvF2b84rTr+Eyu0D6Gm9vCKkUwK0letvw+X8HUsN9wnsLTVhEOeUNp7ORI16PX0QvJp7ORCKsQ1g7+TXhUakA88GCBOpNAPjTgbOKg6aZkfr6ghkTYtbXSLt4LggjKigdo9pj5UjrdVXIMdUy+CVvtOuQgR2b3ONTcRl2LlJUvQvCJ36HdA3M7Te/4xRYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6xP4Qv/DMcea83CQnazb0aKCbw6jq5XWLO26nG4I7E=;
 b=JDZmtNd1rsZHk8jHOVx310crSw9/MtDVKovwZHO9RAsp3VjdkZ8nytd7cdWHK+Yf0oKJAU6G+q0q1hFQIZoCMxM1+ZtlJB8pGuBIvBZsAYIk/3Wg+obB5Vo5vbvbYDqNQGUPCEm7zhCsp3dRxtJqWlnZQo+hGUmSgYYKk/Rrzx4WFHu7UvjADbNX5mS+4Brb5xoY/SU1JfHxd8y++tJXZMgutpyFWsCVG/PbQsNgqN54JH57v874vvTb1ZgUTI/6+CbjbVDfmcMq+SEeVDae4Y2LOuzdhAJniP4QGt/DEmpfxzjt6+Ptuoxp1wESYF5SmDQB9ewDFrjkMpOfpUrAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:04:58 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:56 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 07/11] strongswan: fix CVE-2026-78131
Date: Thu,  1 Oct 2026 17:34:13 +0530
Message-Id: <20261001120417.1280843-8-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: e64d5573-eecd-409c-6955-08df1fb43590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|3023799007|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	tKd4FjhS/CqhwIzbYKGzecwDZKhw8UCsYLLaBJP/pmxZTs8KQ9EAfO9OsSqT2w+NE3amzY86eieDkb9eW7QPmCDYywj/EfaXmzJ301a2wC/91jJnYDspEoxjo8oBlBBYNBP6keYjNh1iVpC3H2Gra3jVqMcM6B7G76LH1ygvA27ddYEt5V4QgXWeYNkQRznDvQ+ArInVAOne8+A3BIuD8i0B3DE6fOfUVV4cbWpdp5GR4ZpPtG1YVyWUjfYJDyExUULrOqFqY9hvmlkJX6BKCdyz0ywvMx9uxKDTmylZz51DR3hGsWC/UI2NgoApv4s/TuXL9t51cZeyEzypezK5GySDK/PB0aaInonH/gT/QodtfuSa2xnciCPKX9taCyKRIYqBm9TCxjKES8MN/vZtmNDPT8gkvrqWPWt2QjQo8q5yu95hHk2Y47VbA7eNeuGfuqAMnMs7gY8drgOoslexKF3yd0b4SAihdRflVN9OsB3e1ktIwdkYCvoR1sx5VtAjkCnZMd5Dqy1tUeLhVJTJFqw8y2NuXoDdqY/ohaBvDluaPkrBF2v61bl0Yf2eBmHL3/X1irXE7+JPY3RcYqdaXkwCnxJvvRETShsubW3410jqei74ffrH7X4oWywS/yhw0p0xr9O/3f88zYZwRUDg3z1wR9n6u2Sdjy/XUJITwGk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(3023799007)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QtW1BYNFkdzs7gPc0QuoNjnFoDAZxaCfRibHBj9RquLMMJl5rTXANDSwVcj2?=
 =?us-ascii?Q?aIAj//D0CgYSoDjR4WtCFfM8QfvBWwQ0MgfBQdiOmPBxdTlNCPQObpU7/zKu?=
 =?us-ascii?Q?jzs8MauzUr4AfUuJ2QBeQ9rICEwlLiLw4jqeUWVCtQ7GHPiKS3R+yKNjLROs?=
 =?us-ascii?Q?D6VRG1QG6QuI6ujvzDsrstMXz6lmAbfQgZNHacI9ekADT9zCI8kJ+gMnREcV?=
 =?us-ascii?Q?q9rEREIJ+dqMcIXBJnsU8B9ftoTbKI4j4h3LvhnYTEpgxakPbXBLrYS+F3lB?=
 =?us-ascii?Q?Of3Qv1z+9LDxARpTOcrdqLq6riczxhfthf5UYZsjt7xsvN34btNP02KrFCTD?=
 =?us-ascii?Q?1q+0rM43tQ60L/2ts0hShxjDArOOIb9TKVoKpijRxs019U4aMrKhgrpwPBvL?=
 =?us-ascii?Q?DuCXkDh7jZTgrr/QR7X8oXHb1Js70Hra7JsOQCMye1zTXZF30+BDwNVdB5O4?=
 =?us-ascii?Q?goQGhI37BcfnHKQQkPMQwFIaRN0WY9pdg0OhsUbz2HqOLg4z/pbJBRxLXoPx?=
 =?us-ascii?Q?nCuR5eYF2JERScw6zKovyeSJH1G6CKY8XOYK5SVuiMB3hg4vcp05F2IND1QV?=
 =?us-ascii?Q?WFpMSa8bIFURqffhmu9wIhCfhKWQhJsYDS1tET2VKvI9LV/t16ByBYIdGlTV?=
 =?us-ascii?Q?3B3h7WMU7KQlw8HZsofZKNh/riR+W7qC9GlZNFrMKBwQIiYZOxBFEFlFFjS/?=
 =?us-ascii?Q?bkLephCsJ3xkspjunM0ce/bBqrlD0HfHn/q4hR3qvgzBnGQfk7EoAJxfe9FD?=
 =?us-ascii?Q?2YEDkUSqMJucUuxxEo81wIhoOt1UJGdhTA+j1GieEBa+w4Vt7Lcx2opoaMuS?=
 =?us-ascii?Q?XyRac6zpbV5MfIfSdd6LrhiEySw+zZ0WfzfVAiVZp3RbbQ7PptONMoDuu9GS?=
 =?us-ascii?Q?xgYzaq3S+Yt5n/6yb814hwy69Ws8XxvbxoyXrdJFUNgsOJY/KsRV52exnZMa?=
 =?us-ascii?Q?AgIJLZ6NO8QBNps6y0DlYH3eSGFelSuZhda0+YXC6exO7Qj7/LO0dIR2B2T9?=
 =?us-ascii?Q?eCDv5UpZvtChqDYGn58WH37ArYQe23Smc499lXmzV5MPbfWXJ2ZvQJYWFs6N?=
 =?us-ascii?Q?FX4Wg01jeKgO0bdMwiM5tJoTA5LOty/rm0NMOCTwe4ii+c78ifUw0ci761mu?=
 =?us-ascii?Q?TVvKoh6GVkek5xM5zLd322yS3GAJvzs8fGJ1CRyWAtWKCZv8CBrAmsHDPe3O?=
 =?us-ascii?Q?2CeNNrv4AjCoGKkmLXwdxEEnsUV1FAnJt1uCRLK8bJmA+cFQWRygJgwQ9fS0?=
 =?us-ascii?Q?YiyLKuPtC3lDLF47FyPI1Zgy0pNeBLRHZcGqBWHs/uzKpi0V/URtV43qeGDe?=
 =?us-ascii?Q?QV18IEmhb7KWDnUPaGzsspiP7q2mgscSdhF5BewDttS5iDP84tReGb5d04t1?=
 =?us-ascii?Q?E556y/e65nHKvwVxnIwmZlMgSobcdL04fIPjg8Fz82vlPDjzYUoLzDsMbmA9?=
 =?us-ascii?Q?zBw0DAP+ZL6VEN5yopbWlU4EBz+mAszQxgJsrybmBet1Y4T4HDeWKGBQhOHY?=
 =?us-ascii?Q?YpqITQk6RAmYV228xkyox8qJcNOcKr5C0jcRQGSQawkEkICoJokVvh7zmKAg?=
 =?us-ascii?Q?wk0+0R3msZmNj4Bi+30C+lio2S8kMCgHcX8BLbwlYfy2dhXqtG6THj17gxnj?=
 =?us-ascii?Q?oRWFCg75V1OukMLzQgf0U1ZNl255Ik1QsS9Xc4FqUNER64at+fh9Q6P6Eb4g?=
 =?us-ascii?Q?LIXU+dORnWbBvegD5xVo0ovGxgOnzF09ugDz918hicGe1/xWPEDmvPM+Eix0?=
 =?us-ascii?Q?jIthcux/oGNxzLfVRiaPyqUF+jpwoj8hpRpQokytD8S1+p/n9oXt?=
X-Exchange-RoutingPolicyChecked: 
	du/yV1JP86KwVRRgI3cb5FN40GC16heNApR5IkrBctUXbs9sTD8VWeh7AWYLw2l2wGr3rweI1Y/ktgxhRnqdVFn7bjKCRGjgshkuipIbYmhvqSPk91nxlmoRhVl2ytLrRjruwLP8WusT4Q4eY9OtFDHpl4R0hq+KoU6dZpVkL7dgP5CXwI7/vWEmulKBk6VWyTFzy8wM1h/Y1PiIQCcrgSwMU7OGNRBOLfkcISgNAG/INaIcqyH3GNeAkQwXhxPQ8LTd1CHZoNX+4ps6ZKMuYDC6UdivWxSnF4T1FoSoqiW+1dsFSAdjJT+3Ay5/yuhPAaXp+cZ8zwvb3wrlCYcOBg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64d5573-eecd-409c-6955-08df1fb43590
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:56.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SD/TbGDRUL0/mPewkJUKquU+ai8lK5rrjefY9RCDr7dPYoRZ10JzcFqpJ8kX/DinquCTRV2OUA51cmsXw/IRUMCfB6ghHP5Pawr7BVozWvxzjTIfFSTdmhx7tFd/8Gk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c7f cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=4UBERAe6OaQNjufR30oA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX9yHUSEb1g+YY
 dwlQ5A/mwAIe5H4myfolEsk5O2kaZtAAB0sZhvdeZ4ozkMqfoTLMNzdm3vl57msztuB4EO8oOdE
 vnYsnxgSYJHSqUFrsjZtxHmRIgOYdkoAPMUWtN2j5n4XmHR4YtUh
X-Proofpoint-ORIG-GUID: e0th-8GX3IMmdjsxTd0JJn-suAqjaPqE
X-Proofpoint-GUID: e0th-8GX3IMmdjsxTd0JJn-suAqjaPqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX5yJGPSvcNnXb
 QdwYiQHKYhq40KDhRtiu5AXtrtfh4jnLgQZcXwZTVmXewYrFFdGeovwlvbDU9dJrhsg81JBDyng
 PjOyAoLF82KSmmJ3KRbJev860zoSBC1kw+ovKsV8ca2CCzcgiBIKbpIJtqEc7YdTXkwSF45J4r0
 mnI5qX93ZSTPpOj2Rm1szC2v7JFZYmCOxSLxsLPT25VnzJESvYsh9JDzk/FGDXNDgzJew2O/Acu
 RS0vO4hezfC4DWWOXT2VeOOjRRCDTjflyJ4QjpJc/dq7xLJQ20TresPrch7cXc73q39BN5rarsX
 N25sWYOan1WAe1Z3HvIow9pC7IsPZeP4HU4MVttE/CpX5zLk5MDEnEGvIwQC+EUxWu9dc/NBh+O
 QaJ7d5N0Vq7Alc+2CYdWaiBEuK8c6JsA7kHuumIMrFDetIcJgEBlj3YATON60Yqw74rlhpvL9f+
 YnytM3QxIgQJIQFTKUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130584

strongSwan (since 4.2.0, through 6.0.7) allows a denial of
service via memory exhaustion in the x509 plugin related to
the parsing of identities in X.509 attribute certificates.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78131]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78131).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78131]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78131/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78131.patch           | 85 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
new file mode 100644
index 0000000000..322cd520fb
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
@@ -0,0 +1,85 @@
+From 7012f6263df493b62268954675b0311248780309 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 12 Jun 2026 15:55:43 +0200
+Subject: [PATCH] x509: Fix memory leaks when parsing attribute certificates
+
+This can be triggered by an attribute certificate with lots of GeneralName
+entries or AuthorityKeyIdentifier extensions.  There is no verification
+before the certificate is parsed.
+
+Fixes: 3134379ac7f1 ("x509: Fix some whitespaces and do some minor style cleanups in acert")
+Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
+Fixes: CVE-2026-78131
+CVE: CVE-2026-78131
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78131/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 33 +++++++-----------------
+ 1 file changed, 9 insertions(+), 24 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 3fc5de2f1186..68b7cf927dbf 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -186,41 +186,25 @@ extern bool x509_parse_generalNames(chunk_t blob, int level0, bool implicit,
+ static bool parse_directoryName(chunk_t blob, int level, bool implicit,
+ 								identification_t **name)
+ {
+-	identification_t *directoryName;
+-	enumerator_t *enumerator;
+-	bool first = TRUE;
+ 	linked_list_t *list;
+ 
+ 	list = linked_list_create();
+ 	if (!x509_parse_generalNames(blob, level, implicit, list))
+ 	{
+-		list->destroy(list);
++		list->destroy_offset(list, offsetof(identification_t, destroy));
+ 		return FALSE;
+ 	}
+-
+-	enumerator = list->create_enumerator(list);
+-	while (enumerator->enumerate(enumerator, &directoryName))
+-	{
+-		if (first)
+-		{
+-			*name = directoryName;
+-			first = FALSE;
+-		}
+-		else
+-		{
+-			DBG1(DBG_ASN, "more than one directory name - first selected");
+-			directoryName->destroy(directoryName);
+-			break;
+-		}
+-	}
+-	enumerator->destroy(enumerator);
+-	list->destroy(list);
+-
+-	if (first)
++	if (list->remove_first(list, (void**)name) != SUCCESS)
+ 	{
+ 		DBG1(DBG_ASN, "no directoryName found");
++		list->destroy(list);
+ 		return FALSE;
+ 	}
++	if (list->get_count(list))
++	{
++		DBG1(DBG_ASN, "more than one directory name - first selected");
++	}
++	list->destroy_offset(list, offsetof(identification_t, destroy));
+ 	return TRUE;
+ }
+ 
+@@ -539,6 +523,7 @@ static bool parse_certificate(private_x509_ac_t *this)
+ 						DBG2(DBG_ASN, "  need to parse crlDistributionPoints");
+ 						break;
+ 					case OID_AUTHORITY_KEY_ID:
++						chunk_free(&this->authKeyIdentifier);
+ 						this->authKeyIdentifier =
+ 								x509_parse_authorityKeyIdentifier(object,
+ 											level, &this->authKeySerialNumber);
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index d0b015f741..8e3765ae5e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78127.patch \
            file://CVE-2026-78129.patch \
            file://CVE-2026-78130.patch \
+           file://CVE-2026-78131.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


