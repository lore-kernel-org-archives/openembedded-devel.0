Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF4AC4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 02:00:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.65184.1705284005675349611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jan 2024 18:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YDU8AsLv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17448c82df=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40F1o3H6020708
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 02:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=oVWJOG0ponpDhkR5Lv
	ep1ICHRPYKtdjfScUzaBqpWno=; b=YDU8AsLvKNDZKdnxlDPTnefM7Ztgd7ULsJ
	NrdmZ+VWaKIV4WgMgS+yeHCcOwstgrUZz8SvkUzX6KpQEKyOyzufpFYnj4V8DR0M
	TFkTuqEkW+AnAM4KFtuXKxnt7lh9Ef4oMbnlLcxihGNY/MC080xD9BGMbo49jkyM
	B1+Z1zvWJhqJIx9dBypnuUFDUMa9SbBkh9s+ffuSjHYwsqG1UMyytfBfnWBIaFB8
	VHqbG5e1rE3Ll485waWwGv8wxJOeQeXSWQd2sQ8TX5RbVRrLYVMF8s/SMoyi1KmX
	ke+Lj0QfAG/WoARQhU5UN9H5gG/1OMCzf6XCAQe+9oRg3zqxnqmA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqx9jac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 02:00:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgR6iY3IRluO3n11GviTTJkXg1TffFAzhEBtydRIf1gPx+yQf0SbOoZoeyn6HHnE1tgJ063o3hgQc37GkvEotFo0xh/qQHhYN3rWbQ59zd86Ndv4C1Yt9018gjkXB/HX96dULslo5lPqqeX8QmDLh2uBQPB6B8td5j4HCrLXz+9IKbuVTpgPajg6MXKqOwS1NAT8X9WFzJF9kbrNBezzjbHHFabZvy5SbDi+qNrwVQ62Ue3mor/Sces8XPToYKdt7pgDLrBesFTt8PrbaeDtR8yS/+L+UV++3udptD0NwcycaIcvz620vLlI/6eux+WY8YEv4BubJtD3h4TD9tuS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVWJOG0ponpDhkR5Lvep1ICHRPYKtdjfScUzaBqpWno=;
 b=kZFcVfNDHHSaYeqZ/ckM67VykQ58wqvFmptEubkLhI/DrTsmYDVM4R1BgZJeHoZwOId4Jt4qm1vX3uR2rEIpaGuhcZrjGYU/PrZOwee7VUZRYCkqOBqsPNsPQfrKEFGGWWYPTMsd22FxqGkKVFFs+b3JBjHBUm4vkSvpWsVSPd38bN45qwqenQmQ6eu2fvIlSvI6YpWXS91ZaeJKcJYsyP7P76sPMa9+Slxx87PkoI/31pqT6GVako7bLx4ldw+nKOb3cog03P5uJ2f42i8NVwrSXoEFHKfM690AFEFPwEUNscyA9Ti3HyTtJa8j90Y2Z2s9rLzEjWf1AIpJkH6t9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 02:00:02 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::6633:7d9f:8d6b:247b]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::6633:7d9f:8d6b:247b%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 02:00:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.19.3 -> 4.19.4
Date: Mon, 15 Jan 2024 09:59:51 +0800
Message-Id: <20240115015951.31517-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CY8PR11MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e770cc-16fd-4c9a-6e23-08dc156daf9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QG8ffERqAUKYcv0o6dL+EOFSilHSj3NT1tFCxVh+uG81naSDjgbCF7oALoe4MpGgGUOyxn7KR3PJGXuzZ/mnSGJe72G7n0OVE9Z2QPrqtxJ4zOaQG12nRRcZLmyncA5Oix9BcPjd+3hi5sTFh51lYUvVed4RznNdvEruuzezJkoZStR7yE/sPcGKzquomUrBX7FiyG5llkFvRlUa27parqVpgs0Qs1x+lgOFzeagxbD88RBX72WSSTPhjfeR/csbNO6WTvEkRwkCwPmw4TUC/V9C47E19sF4zc9tBLzFdndJsw6V2MP6jrk73hlWjMOD+8gY6S06kmuVOb0vtPodasHezhb1dbu2GIOCKTa1Xh0cXQZSgjoSKi7jFRVmcfCmlYQjNxqgiB2opzE7a/kLpnfidxxi+9D3c7NuKPCJ/QRPLY3Wx9LAKUH/DqC28xhx9dBQOw23VersxJ+0cBX54c+7s1FAT+9NiRHdeIP6Z7tAWE+NAJWZMvoXASisijJYGDZHVmDMR90N0YCrpK2CjoNKeqXEAqFq5OKW3MZShu7Ni6BY3x2gjvC6ZfTz7NSKonRYcwz4LJ1rqMLXgCeqFQ32xMxymyl4rZoB5n/vY98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39840400004)(396003)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(5660300002)(41300700001)(38350700005)(6486002)(83380400001)(2616005)(26005)(1076003)(478600001)(52116002)(6512007)(6506007)(966005)(6666004)(8676002)(86362001)(38100700002)(8936002)(66476007)(36756003)(316002)(6916009)(44832011)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Glfc3VIL0rRarSEKh8yDbmMn620LiHqqsS9/BdsJPOJcQ9uiMUgywTyxhe2?=
 =?us-ascii?Q?eWuOiPzRPVYpUits61xsNvS0jSy0eEobQmNSFzdTanfd57hWw7xveZujpXh7?=
 =?us-ascii?Q?88ObzhMbLONTZPFnGhWLDJynBBn/46xICKwPjpYvUrJFC8qtKh5+qDm9FkNu?=
 =?us-ascii?Q?xtuJvwXu4EOUpjDsMOzlSJlddOhNkIgP0NZCexmyNTmRPQa/LKuLs5uaGcjo?=
 =?us-ascii?Q?v5uruiCPGCOnkhoV3OPVDuT8XjV43FEd8IKshHny219CldNXgcnE38QzXQk/?=
 =?us-ascii?Q?Nwxs/IiFzAwRoH0iyZxF/dZOXkwU8NmAd8Kp7CaBT8YUj/EyYfJvwAWDmHRB?=
 =?us-ascii?Q?Sdoc8uwnHhVBSreq8xIrq78Um1qGvA8OZ2elwOgOA1Fnl9grT9YLY6DUpRsA?=
 =?us-ascii?Q?fQwUJEAZB9v2jh6v/fL+tguAgWEMc4doSmYTXg2OAs4IKOwvAD5tJa704pIW?=
 =?us-ascii?Q?OcT/4Dxyyf+H9GQAqrWvxMTseoMNmvZvm1TNX77cojpGIhrXd8VTa7qqqlfN?=
 =?us-ascii?Q?xGfTG6C1NDJqL3h7WxHNbjW2omJ14PShmWipnvOVeZ/YgKGtAJMIS5SNnflw?=
 =?us-ascii?Q?zMS5iGXUTvO6E5WPoHIcWI5wtQzMeb/g1O0kMxm67nb38uyUsknvpD71LPV5?=
 =?us-ascii?Q?Th90Ot8OS74CpVgZclvY+DW6DRJnEu1ZnkN4+zzXgc3h3VuJD93AhyPtk0rV?=
 =?us-ascii?Q?qAvGYqPytdQIpSc1NG/DSGqayjx1km5/BQC0s0wf8Pup1yFJIlEbGGeCTM7Z?=
 =?us-ascii?Q?ShPyEcHJz4V9wQSMSD+EHNmdnJk9IfMmJZHCIhXQ5fLd/ZefwozrC/todqbp?=
 =?us-ascii?Q?ayoCNYkjv34aqz/olI4s2TmclyeY/nvJwJM5vsl3k0OwJ8lG58r0xx0Q1WXy?=
 =?us-ascii?Q?sZQJ4pcjlyQMgeu/usTxUKyGqlfVL+7WPi1BjZrClWP0nhGok69HFh9bncp/?=
 =?us-ascii?Q?GEZZcQNDJltTIKVxF+rMu2icrDeDn4KCnCjY6L1c/qz/pC713N1R5F93lqdM?=
 =?us-ascii?Q?H8+SZ0Xo3mzuqRoxiPBhbx/XfpGsriyXbzrkMKCOM9Ty/TVA7HL28KDppFGP?=
 =?us-ascii?Q?U9oZ+JGVlNxeWbVXI71JDC18iHiuOSFgksZlUQuvYUKiSOsSL+dWgmYT9Uyq?=
 =?us-ascii?Q?lA2Fcs7ny0qv1bGJ+Xsiez078RDLw413gFISZOkgiG7Y+ycKQyFLx9wYCBGF?=
 =?us-ascii?Q?eZrHZ6zf/Lepwt/AEcGb4PfHNYlEKRyXi8P6qa22ZgBR4Q7vEsbERZ8esblF?=
 =?us-ascii?Q?F2T6iWJNx7j71aQXmy1xPors8tGl/kO2fr4RITYxOCD+FBY4kQot77CtjdM2?=
 =?us-ascii?Q?GGj5YSEviydrVaeAidOchv8OFYyWZ/8Ucfkaqhp+AHQCt8T4ZXL3DL4xwHyx?=
 =?us-ascii?Q?WZzNOfxele4fj60Gj1Xq0TkwXHIffCKgYWAtM28KtXJ9UfAYF88J0O4YwH0F?=
 =?us-ascii?Q?cvn8GydZsxSNV2EVKuC9+3OPuY62p8N5UJIayp+mWm5/pRxEKsvgxafPppMW?=
 =?us-ascii?Q?AlEF0C3etggAJUmopobNqKPqcmqeloFXNPGQY0qmNeizgKUTTeIwRAOSBlLn?=
 =?us-ascii?Q?XZzWafNWCgvkQiFE4lRRJPoKzsyfEm0AzyjB2hxa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e770cc-16fd-4c9a-6e23-08dc156daf9b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 02:00:02.5054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hA/0v/mdGFR+2ROQuMl3t0488+0t7M46eN2FxDlENCqZt+siunJ99VA3p16jVkNP1W+FNkqkq0E27jv5jhLwKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
X-Proofpoint-GUID: kdvhaeoruG-e363l0tWpNlngHQko_tzd
X-Proofpoint-ORIG-GUID: kdvhaeoruG-e363l0tWpNlngHQko_tzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=795 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 02:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108277

Release Notes:
https://www.samba.org/samba/history/samba-4.19.4.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.19.3.bb => samba_4.19.4.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.3.bb => samba_4.19.4.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.3.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.4.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.4.bb
index 4828526ed..9e02afd0f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.4.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "280553b90f131b1940580df293653c9e9bd8906201f5def6e5e8c160f0bfac96"
+SRC_URI[sha256sum] = "4026d93b866db198c8ca1685b0f5d52793f65c6e63cb364163af661fdff0968c"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.25.1


