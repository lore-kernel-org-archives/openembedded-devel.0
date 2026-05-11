Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96474CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 08:23:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45605.1778487784500207917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 01:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X6weQzH1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9591a44d6a=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B3x9wE999216
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 01:23:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cZ7CtR2HDG4mmwOgoSB7
	p2TZi4aw4YsS1bOwe7tdDfs=; b=X6weQzH1OfQG7zrXnSqa7+29FsPXfD7+J988
	i2lOjb7Hy9amPKs9fx4QszYbgqKveLK9UKMLDucbmujq/gmW8+ftqOQtHydFrG+m
	l3Xyadcfz+aRbFUJYPikzzqqy7x6pqgThAkXweKR6myDoS70TaL2SJPn9TZeDumG
	EN4850eGyu3HONIcm/S6SW+WR5MUGuvVBQFsOyOcA+F2Fz5Yb0SsMG1RurSM2yz3
	MRg2jyA6dYsWhBV4ehD9WyZRmrru14e4jtvw3kJ8wH/9f/Vq+ofmYjAWBX1HPHgE
	7iq43oMFNbmtugfDOIGpZmRd/jx1Rv0pZ2bVOGvRtfhgliDPwg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e24ee9crn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 01:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XluX3i7WiR0aPjftLZUcksXOhUF4KHN4SaPCezK3PcTAL5C+hz4ZPoy9eJgr1dYQXJtFenJPh5xqp/O82I2etQi8iOSoijE+CNOYiBY9ma/Cx5B4EXFBljQM899uE0OmUaAXOx3s4BTe+185dftwlaMA5iWffTSpCoS7Bh6yPHsfbzlqB90idA/g/xONfSKbX2BK2RsJkjpv/fYmu3DFrUaNokdIYgwt/rAJr9dfW8ahX0sB77soLYjO4C55KQMr7aT/TidVmQCZtMivL7tZh/Vnz/wi6HE1+iooRh3PynhqgcgxrPi0Y48q5QF+3MAkoKsyLri2BOwnfz0ODmZ/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ7CtR2HDG4mmwOgoSB7p2TZi4aw4YsS1bOwe7tdDfs=;
 b=iEcT3yrhBpvwJhvV+1mT+I1WYWcPFlNSoxE54a+7EI1qfwprc4xsNkpuQmuJKsQUKVg5lHusQpYlf1+ibgpiBO//PAmTrsHEBfmqHXH+WvPHeqSpnSUe10lBkwK9Fbr24R3zqPzQWLzdkwfhxVCMNeMqY4OR3B3GyDzpkxPKGehl+QAgVsMArKOn7pGW1CLIvohnW7PpmD5y3dMvax8LW2SzDrr102N3KbIQkqTUdWbTVeEvAk1cfYhLBzrnogslOAorCke+THVvQBDBAsSOvCLoxi1pdiV96Zbt1vUIo7PPBF9Dre1STgkgo3j8OazGO+MzjmxxglFo8P87rvNVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 11 May
 2026 08:23:01 +0000
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::3e27:2:e9db:4d7b]) by SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::3e27:2:e9db:4d7b%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:23:01 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] apache2: upgrade 2.4.66 -> 2.4.67
Date: Mon, 11 May 2026 16:22:44 +0800
Message-Id: <20260511082244.2846624-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::16) To SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8421:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5cc46b-d746-4ba3-d65c-08deaf36844c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mEciQnTLzSEWXHMBYu2rqGISQCbTN9oTogXkAzxs3roeargPyDpS0dlhoxpyrUvHevQwaZCN7X5gEkBnOyl9AAHGfE1VeGFGvabriUmA2QoHVW6i7j/A0KHVSHmdpy+sKJSw4o7qyDEa1SDr6sTPQ3/+/EbCl4Z8NJ8XwpVEeZ2s26zc31VSKYTpUvSfK+Vl8Wj1DfsPsBIsUz2xPsvgrRc9+zJjNsDwwIlatIipLJxl0yzlKo8gQZUOeVmiWxU3uV39mvqvVnu9/6Y0vL5s8PRCk9HIonMic1YHO2D0MkqIuCF7UzpNdOQGAclj/Mhf5yLr3Ilw9ikyvan9nFO011JuXU2ZKenuuM0TxZ4K9gqvqx1Sb8FCtxHj5BwxVmQ3At+2f3SkHwCdrpVFkchREDfzVPd/UDfB90nxPKED16nGxUQOGfOq/4y0fjl0Vk2hwD+DS/OaRS4uXoubpDfKi1z9E7GDg15fltk6T0YTnzStxZtHYYKWNQK3fOGkArImkUBfiwcr7cDyJwOIC/eMmYONArc6aDmSkHwbfjyzWqUKlobUyLsDlfhoOcOqJz8vew20RZCSBb6D5ckgqqr4v4D3E+9ScGVYW6WifJRXm/lWBtT1hmz2Dp+YFkNCMztFoJTV4Km1xW6IkwdQFm6WQ+u99roAKnZmyujFtfGSWIJdDOU8Gst/qJYfTi/vNtCoa/XhixaLRQ4u/BWNXaK1IbAk4zZEqwqD1tRtOnQ94rcwW3Tg9TLBnjaGFnxoC8Cv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8421.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BBGbbuN5K+s0msflVwuVMjPMYDPnPE/E3uqlGeC9h9WtBUBdM6GH79+EfVuY?=
 =?us-ascii?Q?vNbahoeQlk56VnlZG5+ydoEgRM5CRU3S1hoYw5Rsqn4ZV9AODar16ywqTc7/?=
 =?us-ascii?Q?SE80DAwzUTv+y3PYhP5dzF/2eRToffSXvqgDYmxHU+YqtP10glO21xNEcTzM?=
 =?us-ascii?Q?94kLgPbwmYmfDxWh/JIK6xMBQnYKGwxez4uwxg16+PHe9uzCk5qWvhxnOK63?=
 =?us-ascii?Q?zBeXqVT+0Q3QU9RU+FBDa9cFv/VmWxsvtedclVAkOIgptVnCiU/rZHQuXBi0?=
 =?us-ascii?Q?e2KC8Eutk0IBmt4RcbIIUDSFfsqWbCn0FCE9zJYBnTxpaPAOr9fiTzxzY3PW?=
 =?us-ascii?Q?DOlzsUufkk02oHFKIkB2FgY5qu0LyXx9re7ioadQ37qaPs8wzmvJKthxOTAG?=
 =?us-ascii?Q?bMs84U4tpe6SKMaa3AevtFNaaSh9fUxP0HvvDixMd7oDEv9UDR1373g8NHvk?=
 =?us-ascii?Q?p1iGQGYwKJHGRpW/gY6wP9M1vbfb7yu6WsGZCiARAGageUb2CSaxpv/yVArj?=
 =?us-ascii?Q?JtpNhLUP4RM8G3ISk7XZ2N0zwfH4Z5SArOuIG4yswOBWRUTqns+NkGKPuzlF?=
 =?us-ascii?Q?Fyw64tt+gJSlH67TWXqdGcGfL2jP8LCReVgKHQUnt9qHYHDAqzZzKnobG+ja?=
 =?us-ascii?Q?VMxHKRa/KZvyT8XT8bb4vdooyV4p9oZGwpqHDZKyiwVmSN5NWjhSKYRFrqLC?=
 =?us-ascii?Q?gugVi+WZUvYuAsQ0eRtLM6TKz9JhJqW/OfgSRM2zkLCBiwuAH30aqgzFYQyD?=
 =?us-ascii?Q?ZMf4Z/Wt0ygbv1itfcyE7QaV4RstF4I7DJLMtlw9OCZCBQc2qHKGiCRvsepr?=
 =?us-ascii?Q?oOOB9z0zlLwy1PuOPpl/C/qgUkjkrqaQjKdqtn9RMZl53CGY09ZXQkiuD5N7?=
 =?us-ascii?Q?QNr0ZioPZr8Zz4iAXy2VTKDcjOUgddyCFSUkvF3HLnh3Oy3vpudlPGwIGInm?=
 =?us-ascii?Q?MciYgdCcQGwLq8fCQFWi5ahxmu6E8raMv+S8pGlPH2Akcz97A4VUt0cnLhOi?=
 =?us-ascii?Q?piGVkftZxofIrjVbNxTqbPyIdniPXZRmh2U5nA4oGZVjSz2rYYgvDPU9LC3j?=
 =?us-ascii?Q?bYiQZ7CAdnSU0HiVozvUpkXZMLuosYCpu+8VevmqPqz8hbJWaVcWrVQFwRXi?=
 =?us-ascii?Q?l3bYtuzdY910vjsvWaBjzRjpYoPF8s6Zui12Cd8AlD3TrNfCrLjKtSSOuobb?=
 =?us-ascii?Q?ZCpInhXa/bZzlDmPkF7evXZN0YefvULsW5xhfLibiYBhZM9K5fhTLO3+czrx?=
 =?us-ascii?Q?edKAVE40ABVflr2AmSgw0wllvi3uJiLT4tQoTPBKAl9eRcGG3Jh+xeajAbaL?=
 =?us-ascii?Q?6cORSWw9IpMr+KG+nb6V7mg+ubj3Fo3fQMGfgOhO7XYK7LO9rhx57DT62zC5?=
 =?us-ascii?Q?08Ljvbf9g7pH3UBaTVWqdD6zWRTgcoMM8vg872MvRY52pfLycGX6nu6qKgxp?=
 =?us-ascii?Q?xHotO1Af5EzdPkM2Qw1yY9AlYYqASrEXG+wNaKd0HbKgKLwoNKRZl0KrVYig?=
 =?us-ascii?Q?Gcve4rItbONlaXYd+qAUmm9zAP0+ypGeqmgzQw5dPyUd52olAJbvjW2/N0Zj?=
 =?us-ascii?Q?MPMzHiysRTe2Tm/iuSUHReneTdkFb/+SQ9sXKKKDlL7gImdugXy1eJu8gJTO?=
 =?us-ascii?Q?OsmG4rkQNShKuVg/3FynDzfHnIar42kQ3b9ZbgJHw0qM61zYdJY8TdIjXK3L?=
 =?us-ascii?Q?tQKEur/mzE1pyYtAkux14hS7SZK/lMmdl558ty+JU7bwswQE+ycat3lsuVPH?=
 =?us-ascii?Q?mvrS+hPgh8sHbNxfxbGXFlBcIpq+1xE=3D?=
X-Exchange-RoutingPolicyChecked: 
	Q9LAmKwllyb9MdnUdlbQZHcutM1Olol6ezo9x52CEAQtIOD3oUcFSw/kBE0GzmoCvU3YnKtsOlJOh0jMo3WnSAyqI41R6JXaRggT1eiNd3ht6aXVVIoLh66nUNXZIVyDCHiQTw+vMyoPvw1Y4vuGOOtu0/SvgiL4ieGohhaBj0V1qoXDBXonXIdDWo0KwFGfgzEVFLmI97peoPa+FspIE0MfO/ZvIcnfafVIuJGdKBBfzB5Ge8Q7hngoKziCzO8SgDEMFboY++vl7qcAwHRMhElh5BQke4eBtCfjwrfL+8kf6gMGy+GpW5eRgqVnSDENWh0FnZKJ6nTy4OYFQaNxcQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5cc46b-d746-4ba3-d65c-08deaf36844c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:23:01.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj2DLdzGPhQW/Q03IeZ8jULo55Fc0W1h+k53iL0KbEyrgo8pVBacw+uh2eOPZ0ijWV7AsGYWuAFv1EZpXPVjspMK2yD9+uavD+eo4FUVc2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MSBTYWx0ZWRfX3D9ukWcI9LuO
 FXOVmk/ylR0igxSpNB72pbrfD8woWea4pA/WPyTb7Oh3hUQnB/tagbhTJK5l895RzrhsY2SMdth
 HYZq/f2iZwMH7vJCWJKcs8nykOJ9zDwIPeWT/hvy36u+O9r+rmQ/TfzbmmzlTWPD5bpRFajOWau
 PxOm/kcxaRN5mSaRq2QloogOvKI7sumOMW6rPI5jlmvi5yugsexbLX2KTeRH0PJtfXsMQ8nrySk
 DtRyb5vPdXJSpTVxwW3DaTzcLcqG6HuJrjPFGP44G8Kqk3GvNhMrG0TOKfsY6LGn4vUaWodaAm+
 C7PcP/H5hZ/7O0zZkiFGcNu3pj8/uvHUqSCWFrjScnWwFRU3/YsbePRMyP+QclKyZVeFymSUP9X
 KuYdmvCskbVwptrWg+Hc2VQpuWFZZpUfIIc3u/GxBvZOG89n+RlZ3Fd7683vjH4sLdpBWl+JyZR
 a6F/PsEXEDSZ1ykk8gw==
X-Authority-Analysis: v=2.4 cv=H/TrBeYi c=1 sm=1 tr=0 ts=6a0191e7 cx=c_pps
 a=NooIwpZNnZK4GOBrdp331w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mV9VRH-2AAAA:8
 a=t7CeM3EgAAAA:8 a=6PmuYHjm9Mjsl3llDxUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hriPNkFxuhijV_S66j1XPR3_pSsA-A1w
X-Proofpoint-ORIG-GUID: hriPNkFxuhijV_S66j1XPR3_pSsA-A1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 08:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126839

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Security fixes:
- CVE-2026-34059
- CVE-2026-34032
- CVE-2026-33857
- CVE-2026-33523
- CVE-2026-33007
- CVE-2026-33006
- CVE-2026-29169
- CVE-2026-29168
- CVE-2026-28780
- CVE-2026-24072
- CVE-2026-23918

See: https://archive.apache.org/dist/httpd/CHANGES_2.4.67

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 .../apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
index 630c6f3b1b..082f533c85 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
+SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
-- 
2.34.1


