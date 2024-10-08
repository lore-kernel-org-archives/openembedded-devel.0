Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0F1CED26F
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 06:09:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2499.1728367743590334602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 23:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001105f10e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984CiuS004524
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Oct 2024 23:09:03 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4230r4ajc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 23:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP5J0G/dWj3sgH1sI+pa3ID06DN+uwF0dFnjYQtJa7Nc1sXtI1FIPt1DCBfZ/hOSVsC9YCDIOb99/QmyBrABbNz5IZsSOy+l6dv7jO5T0n5ozt772HfqCsWWerkV264hs/9yWGyF/wK7YPxQKT1TBz9sdG5ajBb6UTFMrbmVX7nH8sb5sFwhK6eyKXNyt9QE1qOY4of7/7pYLozqe7KItri2hQX7wTIYXzrEo+1RE5AZ5CTUNF7kT5+BlZQfw1XjoMH+xEFpLjCBJY5rwxfc7jjYhYhZNo6Qh/zv/b6IISVmJctvUpM89RKVnshrEL4joZmGTMkVLodmGKWQ3Uh3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKHeJiptILRcphDIkFyA1m438gKISk90JB/XDJIVyxI=;
 b=Ri56/wotPwoa3Tucm+gZemWaVIEHqDFNq+jRt8vfagL6D7LT41HejCx3mji3Hx9dEbJ5z8am9dVKDGIh+vqsYflnICtwCBVJCoZkZ5Er259VCSLaJtzkgUIDkJwmVo6VVp1a72gHxHwNB4VCA267JnAN+WOyJ7SC467QpVE7q+19MCjknqJf7Sg70qokNxYEp1nl5gYnGonpy/Sc4awQrZGvcoP78cBfzkh5JM3O6/sUs7ZejepWRX4FdOB47dUg6PhPFXuPYi85hBnNxmF3jAgp/jWbci+f/IhDjxNhj6HXXktpNYyZFmbmNtiBjzZXIPB2+8M4ZbP6XOFFa56xjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Tue, 8 Oct 2024 06:08:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:08:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libnftnl: upgrade 1.2.7 -> 1.2.8
Date: Tue,  8 Oct 2024 14:08:43 +0800
Message-Id: <20241008060844.1057216-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:f6::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 5981f333-5452-4b0c-c7f7-08dce75fb2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ye2en5nFRCr14aRgAduBELD5E8M+ivL+p7t+IELUUiYeCbnhT06zLiH3C3Qu?=
 =?us-ascii?Q?bFtcUxiv7Bo07mp4hiOWQPJt7R3xjtzvc5IO4uC3Ds4QB+5UzwAYqtpC03ye?=
 =?us-ascii?Q?SKDiCyl54aLQP/Q7OpsoAAwHcGrngXXViq1H5ktGxYNneUpJYmuyrcUyrGEb?=
 =?us-ascii?Q?nVaBjaxulRt+1Efytc/6Gwlct+AR0DLLB5HJDKJSGVZDc+q5ckqRmkpc7TdV?=
 =?us-ascii?Q?hUBZVbpI412F1OkWmlTp3qylxnGI9CzvHRvucfbRtIMzNXp/T4mEgSCuT4Iu?=
 =?us-ascii?Q?1dYuaXyNBlblRoeSOhkfj0+Ppf77iuXibiyI0XxCsyNAsg28GfFGvZAe2hSy?=
 =?us-ascii?Q?8uYxVggmnxX4bPpJLT2RZkL/uGsiDtGpImOm8hhlTmZi2dH4WtFJxYtS7vUQ?=
 =?us-ascii?Q?xJCmi8I2yo2juyUlwV1HX/lG7WGo4oloEcRbBEPy2aVZ8bF5TbtamEf+0pmm?=
 =?us-ascii?Q?ze/kjeKfrj6Vazw9Hi3XBcppmUz3yEWmccwdRQJOwxUPwRPhUgsmYe6Ta4P/?=
 =?us-ascii?Q?Sy1RILzD4R9FW2LCXEzNMfPv5QkLfZGNEWwREEmtdgALNY8dfDwoL+LvEwJv?=
 =?us-ascii?Q?TExNwISSfTQ3D83KOgrtI4h+UpkZl2unHh4bYPB6r2TccQMEGVzfS1yh2m2A?=
 =?us-ascii?Q?NpuZnFsa9yx4JNiqlaq1TtddQ/vc1EbM6pfQKvAzjCET5EiQ3WOABhR51NcD?=
 =?us-ascii?Q?dzM4AoYFX0Y947EH4sCBGVr3q1wQtr0SKwsHhGBPJkPqUCmdfaNepZrTuB/u?=
 =?us-ascii?Q?acmXqNxztDHcx/CLTHfWWzny/pZgzmxqRHsx6d9ZBaVLhwKlkAj5+IsdygHy?=
 =?us-ascii?Q?aSEObFQK6BdSfO0T58lgRvgJjXNvbQ0hKP8UJ8YweWzUWYzjuJqM/hLY50qg?=
 =?us-ascii?Q?OTGnCKVEgKP5aFKO5ssnJsGJ+lZT6GRqN9GCW8e1Ubh7YQnf0MuLQQB4Sktf?=
 =?us-ascii?Q?j1Q3l2rnVDMwMb2Wkhqh/XbkEy5eu2VBApOAyAZIT35t4N7uKLX5XkcwojNn?=
 =?us-ascii?Q?dj0/xbd2ZjxBmxQ5YgkNgXhVCzJaeoEhfc1DxSZmWasxYy0SCX35WHVEk7gt?=
 =?us-ascii?Q?SiBA0qGKkITls4sJe+I3aAOhqwQ5etwiUM7ae2dkE9S0OzG4sP7NRxlYK7Nk?=
 =?us-ascii?Q?Ad1LeplegqGjAOmbAMlYodxNsP4tj8o8IiPE1t/r7mXFRUiHf9AiLhkXaZJa?=
 =?us-ascii?Q?2le9Ms/KIo3qQGekMnrZt0k3ZISM3CwSjA6+jObPKqNaJ/GdcFbxe+irmlz8?=
 =?us-ascii?Q?XKrYYm5ZdVo3xX1whOl3fUrVF14dZsKWe9bkR1weTu+Jomvv9aJnb5d47I01?=
 =?us-ascii?Q?YcFGSRZGXvG6dWRO9VUh95RUis+3bS/TmidcfJ0HZLUiFg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DcyYsolVDmBDngr/kdFi1JHQNoZTY/ePwC/u7l3F07C65j9YY0Bz+6Zmzjji?=
 =?us-ascii?Q?cPKURBGaeHIzMLAyMgHqZ32wYQoJiTFaSWnn5V35Kp6N/d6f6eKSOQTqiDAp?=
 =?us-ascii?Q?OzLZrxFgbFVztUOLtTbJ2ta17ZxYEQ1qIJo7rHnfWhKq5c5bYlk2iMkcUzM0?=
 =?us-ascii?Q?QS652shY9QK7YjBwJL57yfn64Uh4VRcZeCmqLvcm4+aYyoeQnh3te8BjI8NE?=
 =?us-ascii?Q?3MVedP1cg4bIZyExnfm/IYfyl+l6wEed9VCFAhpkTL7rEYWMF7afOgU6QtqS?=
 =?us-ascii?Q?g6Bw8oR1+vqSvkixyRf3dd0hpRcTcItT0Qq58bSfeUIHlsnM86nWDJB1Q7Xj?=
 =?us-ascii?Q?xmdexYoIcVmvMBjBKzjKpqQVZrGUFloEPsB+VwRsrXKWJxc3RIamPpbHJrAN?=
 =?us-ascii?Q?wbjpO1QMkSpeWygznOCh/qTwd9vRblNi512/qYkp6Tbhk46CbI61I6qMzTXF?=
 =?us-ascii?Q?zeov345+QYiIConeItp2Q/9n1V7iYvTqjFazmkpah3n9KGt4kn6XyFAVHH15?=
 =?us-ascii?Q?IQT2XZFI8Dyqb2PaqsjdozkQV+CYenpKJSveV8YVJtOZaUVT8IOLOzklV5qk?=
 =?us-ascii?Q?LPcIsepHWPU10y+qesNcFzUap9OR40Lk3BYnDJmkAt4tyJttV7dHlk6y5E0d?=
 =?us-ascii?Q?bkny6wSVuNSfXxJ0eboQrHAejwJPtWihrUjcp6mBw6pIDuY4X8BnU+xIrOyh?=
 =?us-ascii?Q?VTsNoW3+C17iDobRXR0Ru9DlkmufkhgOUtLD3CfFogK2tKzNaT7wOe6HPSXx?=
 =?us-ascii?Q?Qc1AoFBi5k9pieWebCpJX0+Stz5y4EUMFHb8Rjp6bKsm7gI/McOY6XVFNiFr?=
 =?us-ascii?Q?CnqwIsXMoh3Po8B2bk1+aymB+Y7VAA5Q39ElwB0X328i3G0ycHQE633n0BbV?=
 =?us-ascii?Q?K6G1WVvArUJMx2QOn8EcnTcjMOpcNeUd5mYesG2N2qDjJbFOAvWrOHHXqrE+?=
 =?us-ascii?Q?4s+KE70bmv51OFQvLHiqNN8a2fbYiWtNqCMbNbxKmKTEDhrDwTPiycggDumy?=
 =?us-ascii?Q?OAQkmJRZwWEysl7O+jE0aFhadqmzgqMlF3n+YUpB7mZXG5e+AQytRU00h8w8?=
 =?us-ascii?Q?x3B+b7Xzs72Eyxr2nTWb7ZiEewYxtm7Z/xNubUlVTbtx0ZDM63sWyh7vlozE?=
 =?us-ascii?Q?l05qqQr6AAE8mSOf2DHVvsMuoZnUdYWvwsRR4Dq7dg3kv9EnBrrLu62AWm5P?=
 =?us-ascii?Q?3kpuks2FCb3sm97pFLPw0IRje8SAmpIrhPav86Q/wIJCBFADQLAfDg6l02/J?=
 =?us-ascii?Q?/dneyX5eIghOV1VhSopAXWtxMTvxrvI/ufI3xVrGvg/m1jMVQtd+Ste6Mezv?=
 =?us-ascii?Q?c4xkya8lLEziNlrxih0eZjeJMAZeic8VpVG9VH3a2NUGEVoxax+uKhyWZF73?=
 =?us-ascii?Q?HZOEzjFb5aPe+YNcN50L2nvDPvWYowBaV8LeiXtaDy8qHxgTKa6apGkGsXph?=
 =?us-ascii?Q?XYOYyGkdiSmNjx8RHWZIL+WMArct9yc9yyEL1B4iD8e43ZYZ741B3ol2KjHY?=
 =?us-ascii?Q?1MxNmUY37MJOeBUh5Ra8LEP0NmGtgGNm71QOhOdCynhZ1wUjY6BqfQyQMf84?=
 =?us-ascii?Q?TTRxeGZdsss1RZUN0ZF27H+C7YfRV9OUWTM/sLRv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5981f333-5452-4b0c-c7f7-08dce75fb2e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:08:59.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFG4IbEIbhatZtOP8tsrw/pPirjPeXoCukqnbLbtHn//7u8H/vO/QGIqV9By/LiExN8lLpKPeTQvufrCRi1Rfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
X-Proofpoint-ORIG-GUID: qd9QXsx92hclM6K8Ka6JmEKJ08H6wJQ8
X-Authority-Analysis: v=2.4 cv=bP1EI++Z c=1 sm=1 tr=0 ts=6704cc7f cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=3HDBlxybAAAA:8 a=yGL88mH5bYynCEZ7mNoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-GUID: qd9QXsx92hclM6K8Ka6JmEKJ08H6wJQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_04,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410080038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 06:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112704

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libnftnl/{libnftnl_1.2.7.bb => libnftnl_1.2.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.7.bb => libnftnl_1.2.8.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.7.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.8.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.7.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.8.bb
index b46520938..0af64fe03 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.7.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.8.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "116e95aa7b6358c917de8c69f6f173874030b46b"
+SRCREV = "06e2cbec41c7cd7f2b1e660ce5e5f949912e32eb"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


