Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF485ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.72068.1661786675051328716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RXg5LUzz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TEwdPE010739
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=2Mi4tKgKHm2FA10BbouuuqSVdy8XBiWzA6PhvCE/+5I=;
 b=RXg5LUzzq/wW3HTESDaxEFZc+RO9i2RMbYpacZxXGzbpj8cG7KYsuAgWI6QkgwJ1Kxb8
 fI5DhOMUN78G56ofrrAvvcpWIOEmlar6/UgZ56rdx3+V0/0WPC6hCqkt1eCYo1e0Z58I
 a5eeyGSg09wMt9s+2FK9N50c0HpO0/4tvH8tNh99JV5I7P3m4D6mMGyuyIPjZrO249Lv
 xW6Yjec9Z1VlRLWYnvNDfdy6bjQZn5ArESfRovtyrz5SqBWnynVHdUBQckTIQ5gL1aLm
 lQvWAsTaRCxpZ24y5kFMTUtO++SEjigdpOP3DUbPwxNSjqyz5grKzYWVyII7B/O9rULL XA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89hr7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:34 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFOXPn017326
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89hr7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uua5Hg8wR3HxuMSJ22tcWIAMfDLpNTeXuD5bDvi6Y1sMlYRDc7HCmBT3dnGwkIf/JNmqy0YhZVfKzh8VE/bGd29orF15kMW+LGd3GCD8w1zQp1o7+w8ZRb1gJceJXDc3oEihy9UyoQR0kVFzWVSdKM8ita3ZhDgNycbSGOpsfgfl6Ddaa/aFMXbCc5SOcOtbN7b6e5ACWJWbrZmLujv+nmasr+jx5QbQsN6cFeqjh9V48hfYpAM1HwekP6XHFoTNuEbI2iCNBogLaedHmPQMzFsCdOt5fATfqEYIhO9EJSYtSeN5Mj/f+cL7kwKs0npb2mTNJQPGloDoaxQf9eyBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mi4tKgKHm2FA10BbouuuqSVdy8XBiWzA6PhvCE/+5I=;
 b=Vh87kWFdC+ZJsBb6of5JOLDfzevPrkMqZPSTSXgh/ENA7XRgvyRxDIVPwPeev1ejaNPgufCbJahuKMhzlMvV+ZRcq/ImTlFpcgBQjfb6qQ96As/03iz7kVvysiLjMlB3DCS3RaoJ3Qd2eeAT9cR/cfVCcxuGiuBV0jLPeWn2ZrVzcxlWtQxBpLjllO9IXusJH0JhDdeRr0q+/JWQs3kNBzNQuzgpsk14TDQ1xVRmMiij8QcmJh4M09HRhdVMPDvnbNwraavaxPLQvCp74bSPevMlrn4D2aZUqDDKZ3WUoquMfi367T2mabmIVNjnyZHSZqRsdwWcA1zEbjcgKXzbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MWHPR11MB2063.namprd11.prod.outlook.com (2603:10b6:300:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Mon, 29 Aug
 2022 15:24:31 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:31 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 05/10] libmime-types-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:09 -0700
Message-Id: <20220829152414.1757540-6-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e13ea2-b974-4579-bd59-08da89d29204
X-MS-TrafficTypeDiagnostic: MWHPR11MB2063:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jMOlHv1lwFn6RSGUJcpoqeGonvr6pM9o1ZTCsQKUeyVkzm6C+OMom49bLybsWmBRkxLwVKovPU9aiadCe4VQUFvk2op0UQGsIQwizZwxYW8fEziq5b202HxNINXaCGx//LyikTxOXIyKQ64iEiJO95NKKtL+r5ETeZGQwefSk4kkAcvIc6PS3wU/xYX7Kd/aMOEqjttm8NgcazrYbU8TEa72RNIIKLnlfnyYpJXWm/v5JyrXRhDugL3MU7RCPIktQ7ZBIIuO/jCV85462gehmeumLYHnxqCTLx1LpdGlWoiDpW0LHvHVkt6wurnSxJz7SCrmA1TEDm42/AscKTUkGIERM4IwhlaWfaFWTDyOkxjoxX8rq7Tasualf7MQnqnrHqG9/9UpHFfMVyFMShCI7d1+TgAgtfMU0HOCg4iY9OzIxdHKb//yyJx8lbpeMNL7H8SeEqrPbZRncaFgvcLNeWc2l65X24AKP2NE8wba59a/oJNDOWhLoWs/XB+jd7hEO3Td1fedV2gHv8KH2a8RxEuO/9QmD9oWRLbVtjjE5uj2VTMN4hv8TGKUvwoVoiZvlB3Wk0XGIVAoFM+rFF7gFvh1/7VWa3bFt7p3yaz3zArs9iclktNcFcC4Nff2hRBwUIiDsXZq8bEqcZGHhU6Xw6xDjDWl0EEvYjVfvZtx6WFPmcX7W97xjmtGfOOIV2RxD558MrlLZQhyHAHbJ4IgqrJlc4u+WtdfbrU5NWiZsxqVQiequRfjNwsNnqckAxfSoipkv8y+XEf5sArQUKlquFuKdr8Wtn/P3OCkAPL7k1PWGKLXkfbt8Js9ndA1ySPr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(2906002)(66946007)(8676002)(66556008)(66476007)(52116002)(8936002)(6666004)(6512007)(6506007)(316002)(26005)(478600001)(41300700001)(6486002)(86362001)(38350700002)(83380400001)(2616005)(186003)(1076003)(36756003)(5660300002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bxQNjuBsHnMHAH0ULl13SFheED99TZWuLaE3lHpx3YLt4uuJNGEVP6dMcmIg?=
 =?us-ascii?Q?tJErA2JSSx2Law8p6sQnKQLYJZd8OY/uvYqWM7lFUT/goZnXGXG6jaisxJDE?=
 =?us-ascii?Q?x17G+0wPa/HT1fUSvDePlk0aNE+tbM81oGfxz4N5i5qLrhjyGtsRElcqXZgG?=
 =?us-ascii?Q?C6o0Sp/aAw+eFUJk9M07Yi+ZvdRIjAuBkb1MWWXhTZUVgVJCG+ngOSd1KYTx?=
 =?us-ascii?Q?44QHNuLniAFHwVIKUNiyO5XEXqSCgv4YQmaqnS6soCZN4sT3Lrsefq/cIH8k?=
 =?us-ascii?Q?Jmp7VdJ3Y26sfxXil5ZJU5d6A8+VpHMx8P3SFWmKmIuq8uylJCJYmV+oL98H?=
 =?us-ascii?Q?chTTDRQLns4r/BhrXYxjwnWRT6YG+OqwqyPUJM9IDmsnz0+UOWm7OcMKpLil?=
 =?us-ascii?Q?IVGIl5W6Mvf1A60inAO8Fcw3CA3vyUInOAftbTep6DPPNathik4cghMeSaiL?=
 =?us-ascii?Q?NwG5BjNR1zB8RbMxIH0S3SMx168SF+wd0RRKpruUHcBN6Z2YiUcxcC5IBdz+?=
 =?us-ascii?Q?dxxEUCTOuDUus/2cycCq+HzrcqQBXZpQLglA+ay9l60fT6TlMVEDDE/1VKGJ?=
 =?us-ascii?Q?SVLMIUVdqbYzZb3ikXEcByx5jvhXhpPQqNqj6L4bgkc7t1z8QngAe4vBGWtG?=
 =?us-ascii?Q?efaKM3T3EZ5ivnM92tWF3rQZGV2zs8G3fRFf+u4mQ7wTLSJgjyAYDDBEo0PB?=
 =?us-ascii?Q?a4fWE8xhM4/T/Mub8KTHs3rZ/ambOmLT3OMeW2pRKL2iXNaMbOOmSdebgEbz?=
 =?us-ascii?Q?xiALPu2jS8Jp0LUubGXONl+YabFBpwM6MWamFWWHmpaULMp5ZWoDwooNiG+d?=
 =?us-ascii?Q?6cbDQF+AcPgnUjM8olWYxCJGmhg+TZjMdKrpP/XqQ3kRZVpf6glVwM2Wp5/6?=
 =?us-ascii?Q?bo9jajjaNhxTv9/dQrrq7sTS5y8/HX5abgo7x2H7a8cHPlSFc2xkyMIya4km?=
 =?us-ascii?Q?9BqapNKh0hB2gM2r5xOz4NO5wohtHXv782rQ00dyAcAkzuVYIQUs5na+KXLf?=
 =?us-ascii?Q?v6uzIHkCAMq9l150w2uAduksuGFk4cPbGEaYKAecbW1Lb6T2khCDJux9ZSUF?=
 =?us-ascii?Q?kH+fAh6DdmGRai+Uyg+AxBlUdrLa9kdPIMMUwXwS44vH02gdkdEw41KHDr0z?=
 =?us-ascii?Q?hP/t6Wtoq88gfhRr23hTNdbOuFFYnpRrvS3ZygMdI2n6P6dg0a26kfucg5gf?=
 =?us-ascii?Q?HzVtvWfh3eB0rIQ8o3G/JgdBniTYrXBy5pS+NNfN40D+OuOhKIG5vTpRNxWf?=
 =?us-ascii?Q?sI/PJH5mCcpzOdm4dEQ5hkmVG9u+1ipAyZ9k01xS0vvIniRBghFNT50xhtbH?=
 =?us-ascii?Q?yP+PaT5jurxIvFeNGk23wX+WOvzcRPKr0P2xxdlUB+nlslDW8u7MT45WPWOJ?=
 =?us-ascii?Q?m9BNw+DMz65zKDGZn18KgWuvW0HAcksSLJhcW1w+uyfCmdCAjxb8sjQfQTOd?=
 =?us-ascii?Q?iaJBeRELByC8ah67zxlEjWfXvzptDuNqCzspR2l/tKM0rLsh4UkIvMM3OHWN?=
 =?us-ascii?Q?mbFhcyCQ2l1OqFfhlMT5BBnDEToePoTAZ7p4GOa1o/WFhBsjNx1xRm0V9DMS?=
 =?us-ascii?Q?WNNQ0PMMANmXiGb9mPiO8eZRR/Ix6RFKf39TLXN5m3OpwylSrWFmP+sx0obO?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9e13ea2-b974-4579-bd59-08da89d29204
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:31.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yVGeM/LhXdSsuQQltczBVt6g5iNM5NXyBaH3SZsuVJ+78iIIGSJFEdRgFmWVKIY/IpuGaRMLKy9TWArroaQn5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-Proofpoint-ORIG-GUID: XNLDEUORdF7s2cIclNy9hJCIekA6ARzQ
X-Proofpoint-GUID: XX5b1T_qCnECeYpwKeG6E_0HIynWnXuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98529

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
index 2c06728ed..d1f6f8c59 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
@@ -8,7 +8,7 @@ one known mime type."
 HOMEPAGE = "http://search.cpan.org/~markov/MIME-Types-${PV}"
 SECTION = "libraries"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
-- 
2.32.0


