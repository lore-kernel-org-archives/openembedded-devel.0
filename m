Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.32680.1628829754367232896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 21:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JHSiwxdz;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38595f8eb2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17D4UIr4015670
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 04:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=wNzqvlNmSbY+u9R8KtzyFfCK8NEWAOHkABv8Qf1JqwA=;
 b=JHSiwxdzs69KpxaPn3Ma29tVj9XibI7ShrQ0rHDJOSBvQK1fbV1EqLc0E7EJOG/faP1i
 QeUIj5+Ga9NK9Sg06oxiMrUze75XUPX3trqzzj3if7I4WSS+1hprRMfZNVBCkctCZjzL
 rkpFkVoH6GseS+I4UXEi9/DwORywWxuiPLLU3losfL3HOuMKf88z9A5YlRs4PfuGWayT
 AW5Dssgk4cJykxbXOnJ0gs2za5boN/w+T8ZVrjLzNQabxLPbwDjxpZGSxgEqNS5UISSJ
 J+NyWIVqX1oa61R7JRxWl5rH5nXvLc0rPfzweSrJsYOtoJDIxF9YZkmlBY6Ohn4t3t8w Bg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acsen0yfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 04:42:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dw8HKuFD0UnA8i95Aabn5R0tDSaJsB/+NtxGbC5BrvamQgc1iZJXHU42MAG0mRQ+fUkgahl026XVLRtyAZGX1EvrbGcm80Q9+6KQEgtCiL0+nfpAXPA703L/bxU5n6NcMKvh5PJaX0/fVSZjg/Rnluava9LIfftB1I8R7J5bArbv7HR+r7aHkjj2+iYke4GC0DOTSKRvBscFumM9+sz+z9JZPXeRwAryRkgd8k25ag9R5W7ONb41uB9nQ4lbkCAdAjebdMlSCZCJfgtpDlbEPLwhLlLmUcKUeXR1ARy/2hTZXq20V/fSmkG4QSJpP160Cx0UVE3DIl2b/HC35IyMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNzqvlNmSbY+u9R8KtzyFfCK8NEWAOHkABv8Qf1JqwA=;
 b=XZTG+xNnInnqDl8CNHSoQUaX+WZuXjksCu1rFz6bMLuG1m1imIm3X92aVF70dR0H7JBaFl6q5RJxdoTm9VKfpp7xRQl1CCqFUUFHuNphqAulv3OHU+5rfYHdAfnQxPxrnS7VvZFiYQ+D3gwCij5X80nE1bZdW6UoO9zkyGoO1GP70vBZgr1FlOvUBQ8i19rhpouvFAGc7jEBNOGWFXQw6R+kpHf0d4OifwkEF6+EfHTxXc64FdGFSTX1mg1AkslVToEkBiPP7A7hBn/scYt0SPP1wd9ag5XPiWtxcNdJ95D9tLF0NPb9k0iBFhAUeudTJqeZuNDW4/CHWSuvvoAD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Fri, 13 Aug
 2021 04:42:32 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Fri, 13 Aug 2021
 04:42:32 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: add PACKAGECONFIG for audit and selinux
Date: Fri, 13 Aug 2021 12:42:12 +0800
Message-Id: <20210813044213.125664-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813044213.125664-1-yi.zhao@windriver.com>
References: <20210813044213.125664-1-yi.zhao@windriver.com>
X-ClientProxiedBy: YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19 via Frontend Transport; Fri, 13 Aug 2021 04:42:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8fffd1c-a7e8-4a21-50b9-08d95e14c33e
X-MS-TrafficTypeDiagnostic: MWHPR11MB0048:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0048FC4D8E001CF78B5557FBF9FA9@MWHPR11MB0048.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FLoTnfl3bC96jDIJzm0ps9ZAazGOkhnwoyyy3FCrxbrUM4RMSYeH7N+Ez0Wbxb9N/bDfU5qGd9jgpXBpJjU2NqOIcxd36b9KujSHPLXNGMVGb4LVg/UqmrBKk9dZvHQ7w7SsUkkjqNni+t81nZXjZxIB8ZBKnvHOmCmrfvEEHCyttvcUioHUMFn88NP2AjOGwAOXa7rB0ZH6r+6b0O2pWoXRx9A/umFCK3sG/TNlwq8NHZnK50EDC7inQqnOLfnjTiH1Hi80uiDjd0j/3Tk/3QPQzQ5ua7cuCMumXT+1fMmIvQveLvRtQMvtrtfzcAr2J8g6IGW1FKz/F+HnLlY/BKpTY5EHBa7QsL+ukXxP/LiSymid8Ho0Jm9LYV7W8rwvnsWVJOLHZ7ENH8VtFM9WovjD+uDnhmoXgFmhamqfr3bB1otfMI8stVNGJ427eZU7OnrfsydH5y6A4YmBn7N1YCvfKjqoer9pWlQ3qTt9/nv6s2HY4iINdP1WzDVv7eB+6YiEOQQOpqZN3rlHFdQQk5ch3KRKIAA/t73gh4pE89xhQ1R2b/LEUdv3+UabjNQ6sLlSsHpfkMkJ0Ul0EPoJM2TsyjiuntWyXRc9vPXt9p84KkBoatXcKR7MifbnoczYe5LNeKLYiyrnZBOSd8Cp3p4NQS2+WYCvwmgbPyEGMrF7fZKvizHI+yQ7K2H7llnOH6TKWYGe847P/N4w84cmWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6666004)(66946007)(52116002)(66556008)(8676002)(6512007)(6506007)(66476007)(26005)(2616005)(2906002)(44832011)(86362001)(36756003)(508600001)(38100700002)(38350700002)(6486002)(316002)(1076003)(6916009)(8936002)(956004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pYPisduUHhRKnAxK1s2ZCqeN2Sli1qs1eBkKynUkPhWvwmnh9Wl6xwIFeLB+?=
 =?us-ascii?Q?v7M1hAbSvy/hUNLyQCi+rNvQBaVA2dn/+huEfPczcGZlAkVE3mJwa+2ymeJP?=
 =?us-ascii?Q?rifksrC8Y9O6cb/blYkmUeDlGjeCUS2GAF+D7eZl3khP4FuftQnSn3EiQ6eW?=
 =?us-ascii?Q?rbkdw1fcDJKGOcZc1MQzwnp4obMlUXgYtssev0AR/mW5AdS6SGl9e4a3so/n?=
 =?us-ascii?Q?2mhVhz0RJNyZ/nlNUxvY+bShLit5bwihxyPi2MdHX4dhsGJTbq6ItSFe90P3?=
 =?us-ascii?Q?wkLo6Ggo0Wtgjg49gF0bvnWPAQvohmwfWeT4y6q8q/ehQCzJozI1OspHxzJV?=
 =?us-ascii?Q?GkWUEc5uEIJ4x2NFrl72mLpoE9HhBEzqfbLTswAXiGu89yrGGye81j/75eao?=
 =?us-ascii?Q?U2RE2rraasv80vJgu5qa7gyQbKJQwhXa2PNvDD8Gb4yQ8aD/lKAQdrOvjnap?=
 =?us-ascii?Q?qiLWQYNQUPFiFPMuF585B71lv4sGPNIm5GPSs/vYgogJZqtPyZd4FOcT0q2/?=
 =?us-ascii?Q?MdfEA/DZN7qwpAUjVhNq4PrlbSFOZ5GXG+VFSK4YM69NisCEqoMslkpQ1PUG?=
 =?us-ascii?Q?Y7w95u4/FJhWhvk3QOJ6l+4bewKdsa79p9EM1i7Znwj2ppJW+V/6P7raGaEK?=
 =?us-ascii?Q?gd77mwdxzXF8UzwHUXX1F3NYYs9X0/f6uRvgAar4ySdDUb1Q3dMz/qs/3+tx?=
 =?us-ascii?Q?6zSR/GP0cDAcfQq/F3sUG1MGd+8c5t4fHbHk1tTiuTfxcWkIo44MaGB1uwdI?=
 =?us-ascii?Q?w0gJjvAQvCOspVDwU+wIo5DFluQ3XHaa38QTjSC2l0cSYsXZTX+LgIRyuJOU?=
 =?us-ascii?Q?OqsZdeUt/00/ecGe/877UxYyFa98AqL2IKhYTSifYDlJbjxbokdLU13xEsdn?=
 =?us-ascii?Q?x4uTvG9YFAGw4SayzINofKq1y6puv3SaCmkshUXzQV3j5DLcqLXaXC/Kud57?=
 =?us-ascii?Q?SE18LLgmKXNgnt2ME5T19Vj6nrjJaDsVWfkrAQQMjpoedkAaLRbE4S1JmME1?=
 =?us-ascii?Q?GEck9wXpP0kaxH0EKVvOQpV3oITQf/byqa1TJXP2LuHqznuM7in3t5pg7BSg?=
 =?us-ascii?Q?uTMQYjnfhBWgPT2q6r3GOyer7J8DFPQaYYsYd9n46HJ4wd6TwjUXaXrUbZ4r?=
 =?us-ascii?Q?5pNjLUuWHU7xXmgpyT7H08v30r1j2jb9ct2+8CE4YJYg5ksucOGXj28+zVuW?=
 =?us-ascii?Q?cG+7RVGOunfGyYx7JGFK0Jb6CcI2Emxv0jDoikDkxIG5D4CAiFZaqbje4Tkh?=
 =?us-ascii?Q?yfpeQHlRQw5mwi3/xmTWtMzkCj14b8Lnl+wHIMh82GwyLdE95QpgRzum5VW2?=
 =?us-ascii?Q?wOBFcMe3EXbDTFOL7d74jJkK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fffd1c-a7e8-4a21-50b9-08d95e14c33e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 04:42:32.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxMWfQZPLqI2+wrU4HL5ihQ7KiDXFyaYJkY7LC4yEEFYNTWh669vuBCtVDz/oQV/MoK9M0NKtD9wNdMkSSNFuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-Proofpoint-GUID: AdfNf1WJ9KEEOgS2LMY9CroREnRWvdA3
X-Proofpoint-ORIG-GUID: AdfNf1WJ9KEEOgS2LMY9CroREnRWvdA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-13_01,2021-08-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=834 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130028
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add them to PACKAGECONFIG if enable selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../networkmanager/networkmanager_1.32.4.bb                    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
index 0ef525d31..167d81022 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
@@ -59,6 +59,7 @@ PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'nmcli', 'bash-completion', '', d)}
@@ -83,6 +84,8 @@ PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] = "--with-nm-cloud-setup=yes,--with-nm-cloud-setup=no"
 PACKAGECONFIG[nmcli] = "--with-nmcli=yes,--with-nmcli=no,readline"
 PACKAGECONFIG[ovs] = "--enable-ovs,--disable-ovs,jansson"
+PACKAGECONFIG[audit] = "--with-libaudit,--without-libaudit,audit"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 PACKAGES =+ " \
   ${PN}-nmcli ${PN}-nmcli-doc \
-- 
2.25.1

