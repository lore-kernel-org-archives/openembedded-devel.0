Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.56])
 by mx.groups.io with SMTP id smtpd.web12.7362.1614175733299179006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CSdUv1M6;
 spf=pass (domain: windriver.com, ip: 40.107.220.56, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXGgS4fr/A5nxMWTWlpdZy5kawzG2q0BIZwTFbjuwE2HMaCbM3ldDy04ixiu3sryyrdKWQ75yjU7zvBenPL2MGX7Qj0WV0uNGQqRhwyWOJ30099061qetBSxEL0p43IZRnUx1cwuZeFabBzQ5Ushsx1/4DU1nc+5Q7rJ4YVuxDNx2y/OcWM664hJ9hzr58tHhTOSJHqmlrSLfU6rORUd15xwiFc/6nN0HImXBsuf1JO/NQwBhDrZCydU3vRZKQA3WYqfQ8IA+5JerGmpwNTg5zCMhMvaHWhRaMEUnx5Op3f1+QWOlDOtFzgqydx72Q4OzwfbEHa/CICbYO4nU5U+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjhXltUJ44J9uTCGD5he6D8lRZj3SPHKpwYnn0Lq5F0=;
 b=jt6/klJbEUE2kcJnkCgszuPETmNbx464qpszDqUHIqFM3W5C0/boHkZKjijnjV+TK136/rdhTg0/i4koA0SvuNlm1vdLY9zSmgrMPqHwz+DEb/gHUWtOMWtE+3dy8JwHG//2vEz0uiso3L8EwE54EVMAxHe1pNy2wqfzvo2S4G877a2t4wevsYNL2ztYvmrOirbyN2QlCqxC86QbUKUvHlmeuZAEtV6O6QpqLM/lSYLjGPkwttd/7ckPNBBFfNYenKntZ38OA3Yo4WhJaB6a8xvCcEBQrkUgvoRmTG8EeIhGJXQWwk/i+0dt5wuAwnAXjs/5ZjmaGk32N1DSNSw/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjhXltUJ44J9uTCGD5he6D8lRZj3SPHKpwYnn0Lq5F0=;
 b=CSdUv1M6EfqCH9OjqmpKuusrzHLPiSJ8BskxcVMrAHkahWAuL5LPIpzTZlnFmhfqbfY0yoZ3QemFy7iW7XhoHfGiQtzcNHtwWiQ0QUiCF9sJVSKJFcIthXUOrgtkvLHrrZIqAVHHfBm/2GjR9csbKibUr8H7u61WzKHmmDClh+0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12)
 by DM5PR1101MB2217.namprd11.prod.outlook.com (2603:10b6:4:52::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Wed, 24 Feb
 2021 14:08:52 +0000
Received: from DM6PR11MB4708.namprd11.prod.outlook.com
 ([fe80::8d6b:40f8:2b9c:6145]) by DM6PR11MB4708.namprd11.prod.outlook.com
 ([fe80::8d6b:40f8:2b9c:6145%9]) with mapi id 15.20.3890.020; Wed, 24 Feb 2021
 14:08:51 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: Add imhttp to packageconfig
Date: Wed, 24 Feb 2021 09:08:39 -0500
Message-ID: <20210224140839.3056-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::16) To DM6PR11MB4708.namprd11.prod.outlook.com
 (2603:10b6:5:28f::12)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0221.namprd13.prod.outlook.com (2603:10b6:208:2bf::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend Transport; Wed, 24 Feb 2021 14:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cfaa486-ac4d-4489-1ac6-08d8d8cdb6a6
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2217:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB221736EDC5B6AB32A8239D4C809F9@DM5PR1101MB2217.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8gqOf8JtAobVpAQ3pTNNSrqW2ffEaPCzs7J4v95+03i17RDQCP5ZB3vzmYOQ+BbMcjfuXnB43YfPBM2kjov0Rsg7FaBAQsk97SSEaAx7NDyjeXMTYp5UIb3CVMDliycIt3t5dms6R/TVJ0KaqWqFZL1DfewG7lPkQKQbQOK9l+YLthlqJuURr/6mVivfQSsUzCE7WAFItv/9ZUWP3bKnzAVfev8Ozoiwo9Ch/RUwATBqQ4dgZFLq+Ru4Q4XMTYSpCGEaWSMsS6w6zwYbOB3xeMT06YZNWs4hEcYaK/7ZfmyHGMhKqCw7YdxVF8vUdZfkUyJuFnxxd9cRAExq65bp9/ZooqdopcW59SwximxFLyz+BsH6lI+az4V9Hj+l+vDgsQuKhLY5EwVR70LJcqMLZAqNoFfrNGfNTRIvsjUk1InMfLAzi5wDgctliGVqVmlcdQu/g9Ulb9ViDtfOMdhCtbCZGs2FnSss7611I1BIzTXsu8NRjw3tvSUJojCCWjaQiVd6eJgjGKkTbC8lnBOIpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4708.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(346002)(366004)(396003)(8676002)(956004)(66556008)(478600001)(2616005)(5660300002)(316002)(6506007)(86362001)(8936002)(6512007)(66946007)(52116002)(66476007)(186003)(16526019)(36756003)(2906002)(26005)(6666004)(6486002)(4744005)(1076003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4+eKmU8J1YT22oq708zshE6XmmMpe/d5zlVuAqLOjj7zAcVpQHmN7cFsKunw?=
 =?us-ascii?Q?YA8UrsZPttAoajbb/BeW5NvwucMkmWLK2nR4LjMofN2bVktzjDXlIpxchXVL?=
 =?us-ascii?Q?2FjGS7W2wE+21d1Egq8WtdApDeRvuhmGoCndWZaNr2hXK6LEzllHmhCejBa+?=
 =?us-ascii?Q?GWSDHosIxTqpyVCqlmhRqsXGa0cs+IsOvHy02HYupSJ1xY9KqwM3PMAHr7d3?=
 =?us-ascii?Q?+9/lFcHTgPtypM3VPRb3zlsaMgqhO+0arqpJlNX+HCiiX4ENbpH+qvRXbkfB?=
 =?us-ascii?Q?XxYhrXaJ34pBZ6ajN0DzmKA/SxrSohayh757+816SxU8d1O1YK+/f+5nvJ2c?=
 =?us-ascii?Q?XQU2rTpjU64JmR5vCAqJ4UJCfYTIlxAM0jO+Rjgai2m0wjyB4lpLwd4wVaD+?=
 =?us-ascii?Q?+cIPad9V1F0P1jSGVRG+673TGOkGdZLTgSaA3zv0iUjqqGt5ys4pA6kUJtN8?=
 =?us-ascii?Q?QRwpHtKzIIkh1hzXgg4mTik6J6W15dQ9As5nAZa9KGce5ft1OWtpA2sCE6J5?=
 =?us-ascii?Q?aUoT0QBrPJ8qRPVsnIieNz+RzRBHRbbjcC8RI706DpQPM5/eKrZh307hQzsw?=
 =?us-ascii?Q?8Na7d5VVVDWiX/iTZS/9QrW4K2akUBBRjZFQ8UfiKGKGuczt0UiVUUZT1LSd?=
 =?us-ascii?Q?3sluFdgpy0pMoYDP8iXilJAm1PpRywMtawbANNRygywD1ndQT3uDwlo4rXP5?=
 =?us-ascii?Q?iiY6DCk/XGKCSnS2chZ/dD9n3OqIC5+oYGMJ97HKQWPV0HhceXO3qDdjHGZm?=
 =?us-ascii?Q?szYNB5msC09WEtp7WAuyZkyJc5RCHA2Lp3ZQcVpMUMiQhiNtCfV+HvRqEGu6?=
 =?us-ascii?Q?EzW7LvIM6DdiQVzVoj0pd2DxnyeBwZjLWQ0QCc27WQgdSCVLCRMb6ejqNvbi?=
 =?us-ascii?Q?XVjLmdKbbjr3rRjbCkHavjCeR4NtJ7bAeWg+NuZ1zj1x+RLhy672ZdvuEDxa?=
 =?us-ascii?Q?lLH//hHZX071lJNe5R6AAKCrejVZWKV87de3p21oW7OLtuxLCNJN0IKBoibh?=
 =?us-ascii?Q?ozSrvCRTgTNFB3EyQAYrNZwpW+ZfY4DB3McPuJCEPI1bWTjZx3kw2pgyc4r4?=
 =?us-ascii?Q?BA7dRP/1F5P4q/0ev3W0rMl3vG1bM51zXShiyF+HPlFb25NyjuTHNp3iUPHK?=
 =?us-ascii?Q?OOheG8tTi8kmnCkF699gJosalsm+jnXgy7iv4lOetPcnA42DMO7ZYRyEiVa0?=
 =?us-ascii?Q?1Jt15RewKOzfxm2tFyDKSrnYmPpVoU/mhZZA230JoO9b6crY8IaDUTYnzEJC?=
 =?us-ascii?Q?KTUW4MV9PyawjPImdpmnvVlmmuKjyF4Hoq3wSC1K+nMjP9E4tyIRgx9llDLr?=
 =?us-ascii?Q?BHEbAsRO4Lf0Kckp1k5bW/Rq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfaa486-ac4d-4489-1ac6-08d8d8cdb6a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4708.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:08:51.9041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5vn6IE1oggX9maIItW6zRje5U1azN6fP68otR5XtXywo0oA+wGIDeoQ1a9r+2XJAhgDnlhu5PiuCUWnD1q/qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2217
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

introduced in 8.2010.0
requires civetweb for http input module

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
index 69fa963d1..4fd7e85e5 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
@@ -78,6 +78,7 @@ PACKAGECONFIG[postgresql] =3D "--enable-pgsql,--disable-p=
gsql,postgresql,"
 PACKAGECONFIG[libdbi] =3D "--enable-libdbi,--disable-libdbi,libdbi,"
 PACKAGECONFIG[mail] =3D "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] =3D ",--without-valgrind-testbench,valgrind,"
+PACKAGECONFIG[imhttp] =3D "--enable-imhttp,--disable-imhttp,civetweb,"
=20
 do_configure_prepend() {
     sed -i -e 's|python |python3 |g' ${S}/tests/*.sh
--=20
2.29.2

