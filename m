Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A9ECD4F5B
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2394.1779124450978125700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NfsvJCJo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEGTkv1524303
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bVNrXQUzep43F6yy9k43UvUUBG3nGnIzW+13dcfSNsY=; b=NfsvJCJoyBnH
	vWzSBtehl0W647S1xRDDiS3JUY2w5oRH8Jr7NujuOL8KNjBV0CTAF8NuLgR4J7ZW
	yymzqVjHqEPwA5Z9j7xgoq432Pt95F11FRCWUyWSmWkHWVBDqBUpj/DktW429bML
	SZqgulNU694N8Ta2ao/0M+Zu2N8dCVzhcCKn+0fxIljhEZpRazFNrB92q8zQ2BXV
	vPYzRcn/a7tJB+bbIi5qGDN7+tsgR49Pufa5gz9Ay6FDREaFa7oPmwUbswBaw/tE
	2SC81yuw/Ov0D4+slMjy0waBXz47VgX2dTpeLjj8KUICPkMqUq28vTCzEqFG1yE/
	Y05lQJYAbw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3ga5jh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNgjj6S251gDac71MIO3xKu+6+tmPgETpFGSe6Aq49ip+RLkoYB+O3TZRmDvlpiZZxfuNMtWHO4F0Xm45G+swin/EEKpqbux29BAQWO7ZgCsjvo9LUy95JiGWCvQ+0AmV7sSpEK384egyNYW7lLKyJi2p5taJ4lVNkHgZvZSJREx4hiPuq2YZmZ6oA5hWT0PVHAwfXPnUvBd8Upa6ipvKy99TquIq1KRKkJ83VVNRdXt+l14YvpCR03ojZzDvcim4Aeo5ax1E1IvRGEGeyj0fSDvQOqaAusFCsnrYIAw45K8K9tXPKPpIqtCn7HJ4S3STo0fsrGZ1xyERUc+6DrZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVNrXQUzep43F6yy9k43UvUUBG3nGnIzW+13dcfSNsY=;
 b=AKp/2D12XI6xBJ7iaZgywcR0cGzG3OGNW9yrTTbsDTK41UPVKgd5IN5jk/cAgSY0aMEiRKqwRzUem8jfBWdbeOxZtwhDd7AMkqEUvC4wfPN1pNjyRnvKpIovfoj0rBVaWwct8MTG3ajZWUU27HLjswrnDJ8I69jyZmdJlu000ixegx/Qif1DJW+fnpYVhz66HcEXRqf4EZ1+v7pdR2uBX3Wz3TE3Qo/2s+YL2xhcwMcQy3BAAi6QnsEmTddflrKO6W0DXJiqDybfLZPQ7ltZu5geOBuA0eFAHTXKe5IOGV4T/Wpnm5S7G0hfzGEV6nHNhOGWKNgYiyz71CO6jKituA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 17:14:05 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:05 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/6] dnsmasq: fix CVE-2026-2291
Date: Mon, 18 May 2026 22:43:31 +0530
Message-Id: <20260518171336.470608-2-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DM4PR11MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: d22ea9a3-9207-4768-e505-08deb500dd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	Diyx4zN6snG9Tib76ODGKGIj/SlE8dSj4Bxu+oAjhDEIPS1T2XbYMaRtTwAFpvViANSmBMpZfWA1iQFVgHBvz24/bdUv3K3h/tLPbpBQXzpG4hRtmrB+X+vQNCvlJe9rSPDbsMb97bdb36XVRHBwt1IOKxjopIu0EOmkPAr+jHe/pytuRCkNP6IytXTvjV4XbIPWIgivI0Qva8hOn3KSxVtIfNIcjP+DWsinqmHW+AGbijYRu7kgl/RtIyS2prbqaNBhdrsVHeH+1pbXhObe741DUagmevGAwCvp4P0gL+rquTUYcVFz4yDuJoxZHJ3WCqwTeT10/HGfYFui0q24MOJPuqA9ao7O4C9ITRBbfUOEsUBR5Kg9dZTrw3OxYVVV0IUhbYH3696ViUNg4klC0GbmQc1V4sxrlNdOKCEn2NUHW8P/4wu6i8DtA6/naqfVQRfxr0TS3VO8i36vqwbJs8h3KgfoKHg+eAis1ARQj4xCG3q3Qz+1mbscKSvYOfT1onv5+a+HTQSW/3S/FX2VXDQXqY3pCa2z22Yi7s/7c1mZ122EizOoCMjIOxOb+wo2MJyn7zWhTjd8UvzIB7Zm3BcnH83kxLBlS6cFcac5gwBAkNV72CqmRdODDufhWnMZiCcpj9aobR7TW79+JiAGOjbacrdf2FES5TeC/p6HctNO940NCeh7mXgxIfhyjnXyUDCVXSOD4g1uOIi9aaAreA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LEsQVaLG7IlDTRBkI/xL0/ElxXU3JDPK9FyN6HryDKbvj8puX6iJNvvKmTQs?=
 =?us-ascii?Q?lb6NRS9gCTCRc+003mQ00/iC+juRfP8sYXK3fwoLkBWhAtkDWPBJuvvDPa13?=
 =?us-ascii?Q?FFln3Xfek0PVwA3QdzkivcitQUsBoyO8d7uUfkmPVJ4oP2WqEO0tpQ9EKg1E?=
 =?us-ascii?Q?vPcCVpjSvivvW/1xAFA36BUX98OXk9fGGIxggv9jUXeOtxy88229LyVyowor?=
 =?us-ascii?Q?S3BfJJa+Tsh49Ieo2YTnvibXDKkpYCJd2mHdcfifJWE4r0c503mZAQK1uosU?=
 =?us-ascii?Q?QSQ2UIG9N6t2l6rjl8l3JmSKL7RNJgJyVLsV0OQ6Z3a5XzuCdEyfBfgUs8Jd?=
 =?us-ascii?Q?FqRcihLRvwCkxJDDnFtsGZGsBGxHuVLpp8Pp51BhnpDAnlxmmc2OVlKdJ4KQ?=
 =?us-ascii?Q?/rrdMHPh6PH5AAGe3sOn/zzpgLzvkGp8PDfO20I0ZcOhYFgWvHV/LUYxXjjc?=
 =?us-ascii?Q?lV9hK+L3MdfhlFggcNmzL4bBp5e5GVxz1ms1qV9qhN9E/Xor90KYkOwpt2Vq?=
 =?us-ascii?Q?IgCOlpMf/SwYFpe2qlW2IqrKffXu7bxANtnKN5IhSFYTjiPkW5kj9GePdslt?=
 =?us-ascii?Q?nO1JwMAJR0t1G9G66tHgVNb2/80JXyFsWR9v728npvW3JwegA1UyNkPmLDIZ?=
 =?us-ascii?Q?cFHC8FMVvGsBBFSusoEHtraWKpPqmvhb5BWqPVwcMCT8C4IF0kGFAhxtbch2?=
 =?us-ascii?Q?TDvMbPpP/iplDECwrh4ckYNnVvM/Gheq6nN8dKBt821AGcv3COl7AaDZcb82?=
 =?us-ascii?Q?X/5wSn56pmrNaYqC9MBu3fu5jASBJ1vsrlC60GOcVfrq87E4Qypc7VdAdWGF?=
 =?us-ascii?Q?b2/PLZGoDGFqEMd2lTWhLV90kP6a919KaigGGbFxMRHH2mAOWqd3oS66icDT?=
 =?us-ascii?Q?4/08kWCczGcInYB0iIQPLzuNpAKLKIbZNDga5UXglkw5QA/0TQRJvHyZBkcl?=
 =?us-ascii?Q?+1F9bgTT/uY7cwBby6inXqH9Uyg8Q9z+DeDvknWECjrEYXi7yP8YsbPysxOG?=
 =?us-ascii?Q?DI009M0gavS2H+okK6zzfi4QZn+O2G6oIQ4UKT7BhrHVhkC2uC9x2Eu7ABKz?=
 =?us-ascii?Q?mvUoIuSEqD/KXpmGXXQWVEdsWBJCENMbl7dBian54lAPciPi6VwUDLuRL2cf?=
 =?us-ascii?Q?/lVDjLZtTNNVKAFGUfXXjLUMKbqG2I9QOziBhSXGIEG6rK6kPxgAwZM9MaDh?=
 =?us-ascii?Q?VxWPTcVYOggZVII2NZnbVBboo8MjJJBgjLtFqxiZKw44DX7PIu2EGSgyA93u?=
 =?us-ascii?Q?977s9tFiklRizBRF9WLDV2HVO0n3vPJXOvKA20BqtAJj5s9iOqrzTAzityKZ?=
 =?us-ascii?Q?51U6Nsq9S8pQBXmZQIEJhDttC1o5q0XNH7TXZbAnrWWKrFd09vXxchay3R/4?=
 =?us-ascii?Q?GI++PH2joUP/PL6F2MC0Nj/c91eEGg5dBnmuvTPyVrwbknt36gVHdobHO0ln?=
 =?us-ascii?Q?CmqsC1blHaY192x+Pe22CHyjrisoaepin2I3v+DzBMFL3+LVpW0Kk6tXlZEm?=
 =?us-ascii?Q?6dELUBlpsmdqHZ1tADAzR1Nv45d7aHvC7WtvB0w6TuvhONBo6YYiVmOxP0hD?=
 =?us-ascii?Q?lSdLgpoRc/UPuGvBpAbC+dB/oNITazOM2EhO3LnkZ3avWGu0cREonTaoKwpV?=
 =?us-ascii?Q?vekya3s+myWpu5Mo++6gahJRzyRK8SVcbpFPsMohwX723l9KarGxzNeABfle?=
 =?us-ascii?Q?UMSdwaS/kmuuXZRi75M5AXHlapnYLtAKFCXE64KLF3mQHlLmVDwgKVvY5G6Y?=
 =?us-ascii?Q?rxZfR0RSZeZlbgwRHS5PXTKY7r//PpOH5Wl37kWuYI3LNSL2CcIS?=
X-Exchange-RoutingPolicyChecked: 
	NWBOjDyATSaiC4m0yZvSnRJiy6CdpyH1I+pnIMkKHodY/X4tusO0auMZvyI8+T5uBTdzz65kJjrvzZgh26RRqTuIuN+3kmugxaarDAxggMaB9veSa7Z5+aY4EBodfLVRUumc5ND4moWRaA/EjijD5g9cExYmpLrCmD3hj7rGVL6lftdNVxGa1aht1VkQSfm1d/mo7qultPt82KeH9vAovto7A3dvrR4pbWXD/D9dfBDhE38DCHMZDRAYaS3vQTgdLNpgc31E9cpov0dmr5G/d3NR3sJTJvOlQBuRsaLjmD3R4Kq6KX+5eF/FNVjz6/x5c7W5oJcEVH0wXl6Lf1kM7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22ea9a3-9207-4768-e505-08deb500dd89
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:05.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZDaBRWmHkzeUk6nDSA5WRwTarQ1sztYyyki4oCmRDXeTgJ+hsnEWVK54YS3z/h+eI/OKKYu5LicD0OtydZ/7h25KyF2aLV7VuwkSzzMNnBuPVq0RPOk5x+31kVsqoC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
X-Proofpoint-GUID: st3-6qPjS9o1TbBsVs-_w7SEMRo7DltP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX3aA7IjJIt20l
 v8m7YEvGi+JkbC80pz+FKVnb7w4BR+1QgyB3k76cLAmLUu7JeU8R310CU+gkZ620zoAovq1gIhc
 4qWzGtZig0RQNRdK2heBKnm2261Hq8G2yfGvEQVxrFPZHc/W5lRTYv9qWsYu9AWDSZu9Bmv5ldj
 s//5rlZEPvBikpZQW1XbxreZN07EzYm+T9Ty/lU8/2pPIctBB/zFPs6/Iisj2tygi2v9cfrpB+l
 IIZ5rN6v+T9PwbUcV0x9k7z1PyBvN7kpgeZF9asRcoYo9CnkUt+bY2hrmo8li8dFbtVSXLiFfuJ
 DHQExwbvbh4mpXSjXElq1ujzNAayuG+sALfnMaF4rQ3Z7f28J/vmlDTApbhpYfGcvSNmy+M/jtP
 l2N+jk1NNitHp5lg4vhL/0tO4ek96wZ7DLEZL+utHeUFHlQ+BWAVzZNvGlfcxn9qy3SHXPx53Nz
 UIytUC/EHUSB4ZhOiqw==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0b48e2 cx=c_pps
 a=DTw/Ji8TAQQrvHP5vDPzUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=vERyuOpYtQ9BugJ4xdwA:9
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: st3-6qPjS9o1TbBsVs-_w7SEMRo7DltP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127053

dnsmasqs extract_name() function can be abused to cause a heap buffer
overflow, allowing an attacker to inject false DNS cache entries,
which could result in DNS lookups to redirect to an attacker-controlled
IP address, or to cause a DoS.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-2291 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-2291.patch         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 59509ecba2..bef058aa3e 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
+           file://CVE-2026-2291.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
new file mode 100644
index 0000000000..6e42f32136
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
@@ -0,0 +1,37 @@
+commit ec2fbfbbdaa7d7db1c707dce26ce1a37cfe09660
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Fri Apr 10 16:29:31 2026 +0100
+
+Fix buffer overflow in struct bigname.  CVE-2026-2291
+
+All buffers capable of holding a domain name should be
+at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
+size of a domain name. The accounts for the trailing zero and the
+fact that some characters are escaped in the internal representation
+of a domain name in dnsmasq.
+
+The declaration of struct bigname get this wrong, with the effect
+that a remote attacker capable of asking DNS queries or answering DNS
+queries can cause a large OOB write in the heap.
+
+This was first spotted by Andrew S. Fasano.
+
+CVE: CVE-2026-2291
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=014e909f787e808bb35daa546d3f8f3663918de2 ] 
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 254bacd..58be09f 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -479,7 +479,7 @@ struct interface_name {
+ };
+
+ union bigname {
+-  char name[MAXDNAME];
++  char name[(2*MAXDNAME) + 1];
+   union bigname *next; /* freelist */
+ };
+
-- 
2.40.0


