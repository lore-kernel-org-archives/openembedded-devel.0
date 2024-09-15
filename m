Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825BCC35FEA
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 12:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.113926.1726404740435823854
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FCYPot012694
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f98yv3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1WSmQPVRT3yYd5Xr95TPMe1eD/D1tLR+6J6zRuw6eUvx/RfL8mU7tZ9dQ8B2whNhlxnMi5SjXwCA19QwA7Sx1TdUxv9z9dBwXmA5Q+tK7cnsSZqXlNLPdYyehJ/cJHnv6QSeuW6qx4iIJfeT7kAoJGc7dDJgp3ecr28VNDThNflbVJYQaOHxX4f8/ap2jFGNXA3dz8AA/SrWxGEqGahgGuip+wIxceWGsaiy+VFGxQ8C+5Qr46H5S6FfO/70OGW5F8BIEULm9QDZ7dEDsG8eHNJYb+1fyncxe0sUYoC610xqNSm0XCbzb/CtIiI+cgRDZCQPTpFAlseahKZ6HAbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YGeL8D2GjMU+hIzAcx3RRTi78Ex4o03JI4iKGUZlQk=;
 b=WvTXf7TdxCn7DFd0J1BVNJNISpymwCYvhjHsyb0+CefCr0T6b+xsWa5eOw+psJVFi3L4SCq5X2aDM4MLM5Mx7Qi+Mqjj/nlrLQMsemxtVBJXmFUod6gIi457E1yEN2eO1vBtOfbqsagiCCLB1bX6UHk5RKiOyGR/VRXeiPtaWz6vN2trBZj1BhVeKrmys/65X3c8VIOo4PJZ3oEeBI5bclgwcDUTUpwcLOSlVEw+3snjT6vrakX7Bbvj3XY7zkuOZMK32IGPJuAqI6WtQrRchFsMb4+BaWLZtZuRYdfFL71Elluzlcq9uUu61x1Z2N8H1t2x1fu35RlsdtipWIk+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:52:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:52:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] jsoncpp: upgrade 1.9.5 -> 1.9.6
Date: Sun, 15 Sep 2024 20:51:52 +0800
Message-Id: <20240915125153.2940806-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240915125153.2940806-1-yi.zhao@windriver.com>
References: <20240915125153.2940806-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d4432d-40bf-48ff-bf96-08dcd58537ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0Y7hb/zu59AERdSwT0D+9iN6FMYRmbRlIJDDxk11hW8cC+V3RJVL1uEaoGGD?=
 =?us-ascii?Q?990GLyx1RFPu7k0S39VGayN9kNpvVzZACqcs+Q/5YQNQ+I4UHqDGLMCfaMJS?=
 =?us-ascii?Q?8Jg+fCv522OHKc4K/9p7gycHZQuPiqtzaZuWrGDum8c6KXdXPP0e7vzP4FeZ?=
 =?us-ascii?Q?e8zY4nqVtUwziEFcKsIHZvDdn2GsZpzTmhXs4XXOlxuLByeNJJU/rKK3dY99?=
 =?us-ascii?Q?9zLyylaaLktFwtWgRZ9yOXtHw6hzMCr6JyV1nq/YA18oED960YbsvQ/9f9Oo?=
 =?us-ascii?Q?9OJpPEgOHVJnhX74Srmyjz8CZGgpKU9j8rKW/aXquHNWgWFT3PquSmlrsoHD?=
 =?us-ascii?Q?m+mI6mEe6YMZWtsOBcVlIzpmE/F8uSEq4DRWMzFL6ixaZZ6eKS6X7JLtaaq6?=
 =?us-ascii?Q?DVpDm7NqogMCqLP9GcuIoKE59h3dbvM8secP0iv8fB6yAozthpzwGUKzEVCk?=
 =?us-ascii?Q?txNbhpNc1Em9ztSFH7xPYLjmFwMioCeHDBbrCqvlPTzOESN0O75Bbdsq63wI?=
 =?us-ascii?Q?gC0kI33yW8l/FVMbVIePqvVcchV/VatVmXZT6rxx840AK8KeIcDryi0AhHFP?=
 =?us-ascii?Q?b2WDOZeW0TKNIr+jlIPKjy080YSqf15nznc4PPLuQvFGrrWIm42zLC6MlDI3?=
 =?us-ascii?Q?oyAbOX6+KPE/q6ZxamXcjUvFLtzZCNjaFEa4ds/54r9weZNAxTpixDssbkJL?=
 =?us-ascii?Q?H1ozV/gijeB8fS1NkWDszY0rU97QDiCjGFP2Fmu0AYpELv7KNixf36BW1KBJ?=
 =?us-ascii?Q?widCX/yAnFFBZeUVPQwkEM4o2ubdgk3+7lHycObzXHJF7gx/b1wP+W4/ynmJ?=
 =?us-ascii?Q?gBuIhj43eJjw7g9KIz4rK8eLCt3BpUQgGSAQ+T3bu3PShOOZKZQh959qpI57?=
 =?us-ascii?Q?p9WxmMI9AN3zglbhhpDrWgwYpamW72WR1S4OiKbKzEMCjH2HrnuCmu6r3Xds?=
 =?us-ascii?Q?UAZbu7N4FKTpiWzJ3T4MLqfTPa6bUIteANt9t8K+b1yPmZNVMXBh5LCRjmO3?=
 =?us-ascii?Q?I8/3SeBE/t7guLmBmPs3Z59Ur4dauQaKT66Y8mYTppi7Svl+tomY/oKEhL6X?=
 =?us-ascii?Q?2IypiDTk+E/ZQm0PGU5PO+tKF/a+Mx6bkI2u2YNKXv5NO87Z2cGLxiO2a736?=
 =?us-ascii?Q?5FY7IS1CHrCyj25z2P7FL33xEuwz8cK/Y3Vf6+yffgqNBOtCO0JISYd0V1bp?=
 =?us-ascii?Q?49t02vfXyyJHesUif+WWqW6ztWD0YgPeCYjb35w2NLdPcSoNE4XVyMpstPuQ?=
 =?us-ascii?Q?LgwN+8Uc9xXiPIfBY9y9xiAxbsW87SjMTjdWBsmnifiC5J3KcV0DRRKdvbw6?=
 =?us-ascii?Q?k7poIC/0DZS1wRaqcvzQ1ujnZy5+IYurGqZckGdb3J9eI7gI/lBzr5jPwSQk?=
 =?us-ascii?Q?Kt6DkBjU7revEduC9oUQ5Zw4lQ4qXU19vI2yH7UXmLAATORALw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UtcPHENTkKp0Ba37bs1FIhkgKlFnLk2Z5hGWHVylvLZBRr/w/3+nR3DcxeSP?=
 =?us-ascii?Q?2a1P+AYsGQnR9vLgvb2Gjojwpd4aQNlaQDz3jKQpwqcowI6USrohS/6HvkCq?=
 =?us-ascii?Q?LtmW/C1x6u9ouHF60g1cx0nJ4dbNfGiYqsai0Hi7fh/VrttU9MhfI8apzsJ2?=
 =?us-ascii?Q?PWott3eEvmnLtdrLxz7+EMQBRN7uuFYMRicNJQyxJ9ocLZKd2Y/qLvjXhUd3?=
 =?us-ascii?Q?LrfBUsSSOKjvzcyCJ84xV2BH1U+7c/SiXuyHpBoekWKx6t3dPg4IbXgBRnOU?=
 =?us-ascii?Q?KrqeTiriFYpjFP12qtvZuSPu0Fs9JvRWXqlQ8nfbB8UTMGCOozJT5RdfUV0G?=
 =?us-ascii?Q?G2dg8e0KGgrlWye1fyyMEMhMRYdOE2xHHwaGc8QmtYrrTX3Fsv42dOQIgmx7?=
 =?us-ascii?Q?F2uwk/y9yIAtzTbJQhAZa7QbJZU/T+SsqzqeyReqlc6r541TPiDeGKeQ3+/w?=
 =?us-ascii?Q?rzgv/0imCx19h4nEQ9uJ8pSb6MPZ2m+v7+pjTO73OQx1ifzzXaz107I5UXgW?=
 =?us-ascii?Q?O4auutSMSui7e+72VP+e4Lov7vPgyJPY6y+XTceDwH6vkPbMTYWdys+cJDko?=
 =?us-ascii?Q?K4nKhVL8x4nMhHkKsDdBIQItK5v0KMd9HNbdGJ7F/1l36Eq494nR7gIAGizB?=
 =?us-ascii?Q?CBluKUFNt9stCh4g01bATzl5QTARiIK6B+hQAMb9yIxquQNB5jKvhUQZp9Va?=
 =?us-ascii?Q?pAuZBpHSW2MsXWPhbd1G7MQuHI7NrbZhJINl8VaQvMB5CD1hntmTOo5i+v7R?=
 =?us-ascii?Q?b6D097F0QMWFyE4CJJUybUQ5ug+6QDTPM121Hw2sOEJCmOYqfaiPjps038Lo?=
 =?us-ascii?Q?oDJdQUBJLEoaN5sSeAjXZ1oQns9NmT55Py0LRJFiP46rpY1HPFJ9kduZbhit?=
 =?us-ascii?Q?LyFvrHPq0wDDaB2fOkmkcveht5l+3AlTPI42fkaRYpkBL/p6jbSVjQk0AI+S?=
 =?us-ascii?Q?Y2lLuV9vDdnYF0cC/tcamfXuoFK3NS/7f1Um5BNyRABIA3a28n4OZ43VqDr0?=
 =?us-ascii?Q?MiJj6Cx9C5vZST6Sz11/1vCjncyxW30/I7bqbeINIecaVDgaL6RCJFX+aMBt?=
 =?us-ascii?Q?1H+iDWr35doJ3fwX5lcozeZnOHeU+dLhaX+5IAoQOmaDZfDB2XEWbzpIGbaP?=
 =?us-ascii?Q?/MZRe/K7aL4rM5pZHVIwRjxT9jbIz9cLmGvgR01a+PqsFSm8D5SvFBjjrW7s?=
 =?us-ascii?Q?l4MJ808JGzfLmWWS4ZVF/nLaNJVVraGI89UG3lVww//V2VlV/bRwPMOzGH/T?=
 =?us-ascii?Q?Y53rr+ZQJqwd6LFdbfNF13yfa/10304pRXZJLoKXngbmP9A91StXXYeA76CM?=
 =?us-ascii?Q?HQwQ/C1X7Pmk/7jA/aZP/0O3WGlPQsQjQAjDG6icB3bFeyRMYhUSM5EtD5mJ?=
 =?us-ascii?Q?ZW/RBYoYsmd+sk0uwno5nbGswFv+uStzFx0A33klnMFrjCH/NE2Qm+U2amwv?=
 =?us-ascii?Q?wsnBwbff3btUJNeQIceg2B6b18y5PmUX6A9OLWk6wXDRezg8eOUznRx1RiXf?=
 =?us-ascii?Q?r3ZHKNKyjy0R75nO1qP5hq8TE2cS/Smq4ICMhpGQrFuqXczSTyzutx3ZnuvM?=
 =?us-ascii?Q?FV4AAZVdbJh6UJCkNczZk6VNL3r+CJ/ljDb/tKAL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d4432d-40bf-48ff-bf96-08dcd58537ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:52:12.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nqq8eo5jfJLi+jzAyhTErnkLJpzAl36HCHlMhxfWn7hXMR8xu2GqvO/yhDcsQF2TjPgFkXJRHwAPTrPa2KZggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Proofpoint-ORIG-GUID: qLsjMjNvxDZ6V4rMCjiRPU6J6bx-v8r9
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66e6d883 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ax9bDcA9AwNTG_gPzAAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qLsjMjNvxDZ6V4rMCjiRPU6J6bx-v8r9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_04,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409150098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112297

ChangeLog:
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../jsoncpp/{jsoncpp_1.9.5.bb => jsoncpp_1.9.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.5.bb => jsoncpp_1.9.6.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
index c54dc9466..ade9f35d1 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926"
 
 PE = "1"
 
-SRCREV = "5defb4ed1a4293b8e2bf641e16b156fb9de498cc"
+SRCREV = "89e2973c754a9c02a49974d839779b151e95afd6"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


