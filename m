Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1678BC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 04:09:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41413.1752725364352747518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 21:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9293993554=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H19QoV3876715
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 04:09:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxjnq6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 04:09:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKV4iTOponReqhjuHC9LhZI8PcwgHTFzMB3woIuQAEOluLZ1i+G7N+USktkK2KIXBQQMlC0NY50SgscyoXSe8wUXIhTN+vWbIyFHTGiE8sSCcdQ0bOWQtVlkP36SnLsMNKecp+8KcW6E0/sMDeMKaPu4D+yY8BmPGgV58GuLjX0EMmqLOOkn+qKKY7Nkg0+W5U8vt7JsYsfjaHSd4Vihd28ixMlB4ysSH0EEHd/NL7KBhTkrsFw0fL7nZVmcTdXapEuVgRHic74voDP9UXvIg7rhzjmGbuavwj6CrsHaz2u0X6cPcT4hk92V5bx3cAtgdd+hF+ShtXEVuQG/ZPeD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmrT1Dn9uWsR85I2q3KBY3eksFbp0JKZYEVLv9E2ptY=;
 b=vqUVLjlIg5VQflMYw0gjWEjDOA9xfwtsYLurfZ+jV5t+xA4e24Uc1OZJZVu9lo9TuV5BDrVmq3499j8lHF0YjEX0EW6pvmfJgntVegdi2yuKCjtPVpkGQBcSx8DDiaahJBgQaqVFM9KdWUcg09bv6m4tzBC5+5LogxYvaUKd7Z8F2wV1q/iamCadRB5DtdjN4s2FSMUASqImXS1Owop3AsYFXCFUfnU68H+HlqihNHABzow0IcugptYlq5VECQmMwBq9tQj9CDYgwHtexplVMpCUvSs1WYe14e/2FZAyNHmeSoCOAVRPTbfFcKUNCFNzZxofeSUULhvmW1P9zQofyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 04:09:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 04:09:19 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] wxwidgets: add back SRCREV
Date: Wed, 16 Jul 2025 21:09:07 -0700
Message-ID: <20250717040907.1458875-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: f42c982b-535d-41d5-6ecf-08ddc4e7b3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IOCXGSVgVbf4fbNZHWG3VgA2X8i9s7czMKvj85MZtxhn1fqkQwPSU4bfgtRJ?=
 =?us-ascii?Q?wLVfPYptrzX0O4UYjBmeuXPWaRqU2HD38OwXDtaWmBwQBmAD/5PQWIooe59Q?=
 =?us-ascii?Q?CYOri0oYdTTRzDKsdsyplDddwD4x1oMSfSSvYNeHiGFYzov/Y/fTctku+6SU?=
 =?us-ascii?Q?gJUStPFHvBr+zjFVE/jhNGqY9T1voqkq8TfKn/tIo5Sejmhu32I9I0FANFnm?=
 =?us-ascii?Q?GLbi2d6b2cp9HKS+x4q3QwGsYJ9A7Jf0lIy5DOOakuvxF5j1efVCAc1q2fH7?=
 =?us-ascii?Q?WryzDJD3fSLpNc0ZKQTgh+OCd6K3pFrKL3AUpzCndZON2HViG5qJpPNen8Va?=
 =?us-ascii?Q?GUTttPRELoRSP8av+3D28ujiKXdq2fsbnf/DDsd9cdOfAgBK6GaC5g+GUGeA?=
 =?us-ascii?Q?QltHO2LFAH+0qjhTny/CuKsh72imDhzTMmYMDRfkASKQ9/eOH4T16xSYIkeI?=
 =?us-ascii?Q?Ot0DUelq2L32VbyZlsXPZq1odzV/qwsvbhbQfuw02iTO0Lp/MkFpQpWwuBjg?=
 =?us-ascii?Q?KTzt/zyHkZeq/a5c6lVidcPEYCh3LT83k+hHY7JxHTLQ14enHOpG/tSj2VtA?=
 =?us-ascii?Q?wC7D/N4vIS+HbSdqy+MVVvh63v1cygR0Ztyzyxg4TTCMt8z0YMLzQkno8nzf?=
 =?us-ascii?Q?aZVzZADHOs/t/SC7Wsy4NbbLSsaU0EvWgUkiJMF9qqhautgCYeAjaeYZIEIi?=
 =?us-ascii?Q?bQbbX/4W50Lr5k0g6vtYPhFr94Ijdnj08xG3PKNeLaNNxICOjAtG8qX1Peh6?=
 =?us-ascii?Q?1xmomdGFhFU6o/WA0JY5f4p6ZyY6L0s7DogNvAp4ARLz6s4qp7hDc8Wp99Pl?=
 =?us-ascii?Q?1XtM1iWglSQ0XUjioFAvhD2K4K0pXBH5n0Ak7lfxf2jO0NiCSBynKMa41i2O?=
 =?us-ascii?Q?pqjJ7dRkt3i1u9xOQtr9sQ5eCWnSYqbJe1gF/YOy0jD2gDHHaVDfy8Uy1c1N?=
 =?us-ascii?Q?yTbaFzAp+7w02LJqJhSWBbdcWY9NgmwY70wtFD35I7cK22mtCymAnORTLdeC?=
 =?us-ascii?Q?I3GxhU3503H4xzJhhrGYGP6qsi/15PGkxDY3RwKqiwApeD+MY35vT1mJpMbK?=
 =?us-ascii?Q?hYhJg4Llmz9co6a6cKM6jcNIUGtMsCY6+TBhyCI75JE1KoLT94ijStU/vY7w?=
 =?us-ascii?Q?IX3Vn3jenPpkeGIHpO3eCHNOyXPJDJhLsqRmFvH3wFi4b7qbW8UcgDWY10HN?=
 =?us-ascii?Q?H8idRPU5QQUlQvtITJqSwCGrSCUSAcBlGyuU7PwIulaV/xSDvu4kPRzbR9zU?=
 =?us-ascii?Q?byvhUJxCzlGnkhyRmkSBgHg1Ym9h6Tc8FTv843QDb9YFn0yJRz5SyteZhl8U?=
 =?us-ascii?Q?wCqwH/istWeow3YLUlCw0jcOTF6mHckqI0rf1UovWdxWnz7phf24yPoA0B9o?=
 =?us-ascii?Q?WdjhlDobbr9GINwUbRxBLlNRIEOpiC7SOxGumfyjScAlTR7xMXk8vcOgAPvD?=
 =?us-ascii?Q?rtV7TDsGScsUv2iDDD8zDHDNTZJ9fkXw+4cpCMa9Nzfe7kqPKQNo7w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8m4bSuSHXHxMdHORI9WZkx0oC1kI87j+vWVIOeRtwiDHzTcO3UDHpV12XfRv?=
 =?us-ascii?Q?gNlgw5dP0URh+VseavRBVd6pY+30fm2CWdpi2EdRMpQc3BblKOHkvR9MfHtb?=
 =?us-ascii?Q?n2gIBhFV1ILGNaBypMTDFEkpU1pxGkDfkY/6zwEkv5cUZ71zb5y+mdwt/d5p?=
 =?us-ascii?Q?7cZ2C9SH4cvXNwkRIsXH/x/wDAvE1ZDaRIZSG5nKbPhRic7mMtQNhm05JQMb?=
 =?us-ascii?Q?BaAsu+EoewDk9MG6WDqL1XvsRquM8f1uGcPUWNxfx2CKCcGHeAQ81Qoke8Wb?=
 =?us-ascii?Q?NavGHfEDLZAtSA8/OY+sDeyVv9NQqpGHIzXmt9/nK2yXagkILWEAv0ZCdHlL?=
 =?us-ascii?Q?jK01lmBAa242CJdF7oCAvARxW60d7AwXjqWxvx1f5lJGUMcY6J0w1x20Edtl?=
 =?us-ascii?Q?lzSZ1pXvcKatw6uu1M4oLGM7/CsSsQKmLkxLhQlzhCQPHlAtGL1tNwwHC/9i?=
 =?us-ascii?Q?EMzfydf3Kmxl5nPRdvym3o4H7gpUourEDuR+Ys4eGPuz2QoX6U3NvlKnBrQF?=
 =?us-ascii?Q?S7aj0IOSHPQ/XLrKrLmgPL2aVuMZelycYr4J0OMLui9wEio1YmPM/2AyEjCj?=
 =?us-ascii?Q?AHhwq7iEHxbajw8qu6EjdRK1Ky73i4tBFiwg0o2FbzynobVOFtd+Qxt2uJz7?=
 =?us-ascii?Q?Z6tacC9ueHvTWVTt5hzXjVbBmRor0bWWhAQJ5LAes5OvliXGus2JYgbgOnQg?=
 =?us-ascii?Q?cT4P1LtQqta1a5EWtfTgKiTHdU5L2Cigh6SAp83ZpapNo4LFCGEJMiGnJPSQ?=
 =?us-ascii?Q?kWD/wDAAU53b+R3xD9b1l5M8JE0ejfVvmELYwlUW3GsV/u8c/TJxk1Aq4wRw?=
 =?us-ascii?Q?m66JYVC8ciYWKIMGngP7tMGkFT7MIIF8Z4BcEthcHeqlreb/ClvDoC4bTYjb?=
 =?us-ascii?Q?EmX1dYvbkkkx4FbhtqBZtnPYXpu486vkuUvP2066lDI98c9kYfSuS+KJkyn+?=
 =?us-ascii?Q?vW+65Os1vSL+yo3DpDCZaN2whx7KtQ9OrvkgQv/px4EE3F8zmjextfDDqMXF?=
 =?us-ascii?Q?wsxdMSwRrDB1tPlfvKKSYl1mwVzcFepYdtVYI5xAk+/WzZnQaPCr4lMXNN3s?=
 =?us-ascii?Q?D0ECf1o88KQ9gRzJMLJMLkVPdSY5T/OYSOOIuAvz4nITfQJPUpZqOP26kmNZ?=
 =?us-ascii?Q?My1n/raEMbOLD/WPQeXzPs8EJPHmb70lxkdKF5vVg+IsZUT9IaQ0CGUHiVQ8?=
 =?us-ascii?Q?serfr8/fly7RRcm4jSkwGiggsRQtgYreFxHyPgg92TxhYp62zDkiVIJEHvN/?=
 =?us-ascii?Q?+jXgRQi/et977cq54gmNDM4syTOXRF2g0+vYWl5GWasyCJCW9WwA7d545Kep?=
 =?us-ascii?Q?aGRnrKBlJ0rhxqalun8AxeeJ+jiOG0AkfyKDCqlEMzg9gB2B/o7EllQuqGk+?=
 =?us-ascii?Q?yboZscWXMuvvo2/ZEw4V+Uz2rWmv4U4DBwxphsK9SqFKqyDKQNTdtny8a6cr?=
 =?us-ascii?Q?8nEUSloCjniBFUCdLIHzrjtYHMZ52eOT66oo31a6L3tJ2jlEhBZE/4CnxA1q?=
 =?us-ascii?Q?edVZxZ1LWPQf0FTQIQkYPGvf+dqGkf6Ppyx1b8IIySySRFC4+leX4oBhSTaz?=
 =?us-ascii?Q?Ar5s2LYPmF/778EsYcCiOTFnIEkOncPQI04meDZn3A69kW8bBz/93gc3qrQO?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42c982b-535d-41d5-6ecf-08ddc4e7b3d8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 04:09:19.8714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqNu8rcqaO2dStCN6I/Vu2GV8yW4nd3NFX/qMEVIBLXCDHENffDQcHH06ls59qsx70nJfZ02ziftbQXF1iLVZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-Proofpoint-ORIG-GUID: 16d8OgcQ_rMXdHA3NSjmHQliZGD1unh2
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=68787773 cx=c_pps
 a=fitGS+hZ98UC34WIUPRuFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=ViWoxnUNWbx1AuABZ24A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 16d8OgcQ_rMXdHA3NSjmHQliZGD1unh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX2CkwWznbwJHi
 ISqLiAdH+J89uLSxTk3u6+RXv2cqspo4mMluz2fQmacQKkN5vcbV4J/kUBb6pIzQ78HsaXCsfyi
 p3Nns7ajZrfGE5EPVi8wShZrOzlU5cvPYhEFqAxcAyzoiGURGhplUDRRPCPvKkg1dSzEnUPRBMx
 h5VtF9V2StEfdymu57tqSyYBZRx82WfQ190IwXvxLA79yo5boJlzEQiNA3rtnYCgljS+6qHE+hs
 wWH6ZxgDrkE7spt/TJl4ddIVox7nnhDx+3AEgIajWflD6YSEddAHo70irGXzcBCkEeyG7G0A1fH
 tq7N+XQHWZanSnCAhEeppupiKmGWkgIOqm8ZsvBhLFqWqZe0jskf4BaZbiCt4ZrNonQT7cGlonX
 ojzQs7K5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 04:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118605

From: Chen Qi <Qi.Chen@windriver.com>

During the last upgrade, SRCREV was accidently dropped. This will
cause parsing error when BB_NO_NETWORK is enabled.

Add back SRCREV for tag v3.2.8.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
index 4a531f30ae..2137bc686c 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
+SRCREV = "8aef5f40b93958719771331ca03866b7b6fff6bf"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.49.0


