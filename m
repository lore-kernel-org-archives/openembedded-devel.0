Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6124C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36239.1640677119821424288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YRM59Kb+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7UHks017574
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ojvUpnLnU8UZLTd/3rdNE0+BI5P3JiBYxsiXIy+9aXo=;
 b=YRM59Kb+flXm73Dy/R4OADKN5gqjRrvynVmyKNN6ATjpkrlsRpd8YZurUTTusX/qmRWr
 MWcwgJnvd6VplqpiPAV9G3tZsX7sGOMEq0cwzwVY9TOcsABVZqPdOYVJ1YD+UG0tOwsa
 0cEFuL+W5dg5CAUSpUEb5u8qPyTciGuX6WQADWG/CeYTLAUFgZZpPtCxSvFNWun4imbX
 TDUNX4XK48Nb/cUZaPCWJm8eApTnUjBmz1MAimXanXYTS5DdpqUmPiwblqtg5z9iiGWr
 bwEe4wR3JfySBaVe4Win2VsBcfwfLTQBDfmCu29vdMqGrI2Fo5nWoxeV1iL1+7ZyvFfD Jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:39 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7ccBN001356
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:38 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvowoBsclJHkX234Co6XB/Pvos6De3OkUKpPqa5cLZfZYLOUcS1sQnXjgqXfCPkEmH82IuaDMdzhb+tHez/1fnV+HqxI2xSwRS2RnYMBCSfFta0e4TXzblvO6KlyC9YmysEgMuvxhELAWJxDKK0yTDEu54LoBJ7CbgYvVXUHN69VBjUISHjcCrREXgoibqa4WZld/5WrmbJyEJ1hOQDHdBdw8/5hA7kv7e9sYVBVv4SqU/0L2JobrrCUyiAPezeL0FoMqZDmWcLjadll5Im+DBzbNievqlYTjCNUVOPYfuMhgxJO/0ZahgYU6b0SU9W6hBXhKzEKJ6/mTgr5RCcyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojvUpnLnU8UZLTd/3rdNE0+BI5P3JiBYxsiXIy+9aXo=;
 b=HfGNR4CwtIzY+M1LCNq9VFfiOghca+ujeDNophNCWF7Gjy56VFg3WS+nuPmHBaLFleJBtKduqIC4eW+Gbe3JtnrpVtlvlpnvgwXuvJ7pAsng0cn7WuvMMAyd6JcaYQQqwNDWEfcrC6IXEiAP0AU/8734xA7ScArLjBDn3AqStskQeFwPZpTxNm/JlegGRE0NT2T4LFR4XiTmDyxiYqEyHX98fIKQ0NBfMDy2RBfc8vzimUx3dmZMt+nD503u4MAxzuHx+oDQVJejbaGwEi2dlR5wns/hUaaPc0NfJJtXW7pecmUJzgF1Qb2uggJRgvsZYkZmDVd67IuM6DV+/+CmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:37 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 14/19] samba: upgrade 4.14.7 ->
 4.14.8
Date: Tue, 28 Dec 2021 15:38:01 +0800
Message-Id: <20211228073806.868759-15-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 355d28c2-c28b-4521-bffc-08d9c9d50f46
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15845670B1A4A1D2E0480DE3F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p6viryTg6ylr/spUmcn3mKMyT4hhIkpl21aNG/bxSw/6sBK8UaXABZxbRbDY65LaKvGzAm4I+vpRMpHhCroG+uXJzSP0rEQ5/ueyaPXI6ztlr+txAxLYdIEVq7Ub1h/lR0VEyweL9m7bUlh3fbZy5Id7fiYBkLzdcqqv2sTajdaVl56vWSoiqliAR03Xw1t8E6HetDjaVg6goBTrCZLcofCD//yN0+Ggg1XwXf94FK01AR9CpIFl4SoHIyklGHO7up0I8XMWLJoLLreOCJcbz7Ufry3t9CM81oTGxfOV7trK4o2gl5p0EcmaUAE6V9Qhaca5vBb/Cd1Ch+drlqlfL5N1D1kTaIpaWJ9qMZAsBphETg10/6rgwDU1Nl9nkG3a+J5fRgWxjCrAYgSNU1B3Y/0tyo7iCxEGe+4KLiiaQcGjyc38XNdHGc6XLxFJN0NPxcuq8X9U7W3Qq4d82eev4JtjvpG8/F+pZ8kq7jPYNXynZcqq4K7F4IUpxy2nA9hs0XTW/5OiVv8z8gNiAbfRFewrbV3K90xQt9Mq1H7Ym0ggsxzF23jqjlKM1Qeu/nsHkphB28Iyt1GYSnsozsIc0gWiP/cq9HoU5F8z/WejsjocUP188Amu3XV+erCGBJfc+HwEslnp5HWJhPEfuHT+ITpFsZs+q57RYOmMYQVeWZWpvv4o+n/4A8dO+FQ/b5BTAKbYj/RIl5XJ/PqQrwca/x8w9nSEteFkYsN2XhuOhSnJBydscPzJD+loC1prYQRN2sX9tVj7gb1u+XF4mwmOMHCdpyJRPiZrF/aH8iAXZms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(966005)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W355DXdRaUEr9uEBffl0LrQA0+esPmKmqIRlrFyNz98WTkD9GBm4uDp2Jolh?=
 =?us-ascii?Q?6cMpQAkLbfVxaqaWO9alHkUA08dDbdbBlhoqzAshBw3ERAazZZC1AMhFkSo+?=
 =?us-ascii?Q?frCCEEhcjb4ZD/TxiUASATfIXvds067Q6nfGotRDis3521YHDP5/QHHlh6+g?=
 =?us-ascii?Q?wyzpFSDXrLTzGpEiDgPke4LrwhLkvTzMUpsoy3DDbelx58cGN+VJCZJd8Y/0?=
 =?us-ascii?Q?DsX/At5F8OY8cs5TeA11qCz/VMXiLLPkDfZGffx5Q6BKBUKF4X0Nx2wbaxBK?=
 =?us-ascii?Q?otk6FeRQOFk39uS+cHiB5BgEBo6EJWupeTpeGD1DCi96fFHquIiU8nAMlXbc?=
 =?us-ascii?Q?IDQgpslvpdMo+BlXIzSaaIqNETkptyoPh05V1wgYJj9KSNoPrtzfqhdkyWUh?=
 =?us-ascii?Q?qDWX09nkuW2PjeurYEvGLgVjzdmO7qpN37w/RqqZAZcGqw3HHi/x7mjCPun1?=
 =?us-ascii?Q?P06HQe1kPn8a+SvzzXJE6UJKe/byvUGlD/0xc68L771BoesfYSDBg4sX95rz?=
 =?us-ascii?Q?hvSyDE6ONHuYy6DnzZPq3DBXtweyTn8DDRo16XhDRbyxQlSylYeG98s09tGR?=
 =?us-ascii?Q?K3Jusj+VWtHyuKX/k6wlTQ6eibkXvM71hd0lwxhYOxpoy9/jyyO0M/EX1/J+?=
 =?us-ascii?Q?uZvOlHE1XC1RG93UmFSKS5JW+RET5mC7r7YihSVd+5Z1ybd/2b9n/yxOTUrs?=
 =?us-ascii?Q?MjEX8vaw5FL8gxArCbiJzSUmKk/mZgc07wvQPWtxK9x19T0ru/1DPLw51F0D?=
 =?us-ascii?Q?EAzEvYV8lRVC6f39xMMyXoDDOx8VzxD5vaLeeSE0cUpcb4l2hz2TqUSbT2NG?=
 =?us-ascii?Q?yIaQZJFXu3rH6NeUF+u5vBbfAX6Su0852bZXJl+NpT8BteU+9lU7ONi3crgo?=
 =?us-ascii?Q?n6QM+iFyBNDnVwNnC+O+DNFsrW9ob9EYFEsBOVk9MfmJsAvK03e0WfW9We7P?=
 =?us-ascii?Q?QHjf/qwE2/2mNtmEGHVgeAXEdIViydAVeo+egGYLBkYm8ri/+xppCPKwVKni?=
 =?us-ascii?Q?BfewCUsRlTOiTaGvpyb39jep2RsHgUidecccA6loZEbtM2L9inqVb5z9ronL?=
 =?us-ascii?Q?ilD6rjBzpBvTU0x6euVoNSSleTqbplZIsvlaT0w9QwToiLLZqqMXZTokweID?=
 =?us-ascii?Q?iQ6BIvHaJxwx86Gzzf6FZnUU3mKG33GowVFKRXYR3/Hvep4xfcKjbjAXNR/b?=
 =?us-ascii?Q?5AloQ1VHxouL/Y/1ZWEVmQD9+qw3OCcvhVlIIoO5GywUW3qzmwtmGGe/AOOc?=
 =?us-ascii?Q?njJNoAy1BBFNOwgkiZwW8PeFsXvawSxp43SioPdX62hgKWlxgCtJV61K49+A?=
 =?us-ascii?Q?CUGpiaKnYmPo7mI3hMuL1rOo/UDGzPLlzK8KnbmYI86QyXvg7A27xdmwd0at?=
 =?us-ascii?Q?5/AWnqRACG/FjD8zbEGRbZCc5O9fIUaincWQ0iewM2C0dF85VDachMufjU7T?=
 =?us-ascii?Q?5uSHUKC85QCOCTTbtaJmjT6nPVG5QjsfyOs5Aixwmhee7nuRFnMie2KxMqXI?=
 =?us-ascii?Q?4NswwU8pcJOYwVJNmnSKHDep8stL5Y9VqWda1RfLksTteJA3aIzMa0h5uacX?=
 =?us-ascii?Q?Ve48Pu3pLGLRPTU+trX0OK5aUnNffeq04hIkrj1d8WpamVvs3lJ/n7VaGNdX?=
 =?us-ascii?Q?C8ZXz0NaEV6U6OurE8ba1FA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 355d28c2-c28b-4521-bffc-08d9c9d50f46
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:37.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 haLoXWhjtYEqvfm8MlRNoey6qgBoHXeEXpe5R7NqFLXBYXq1wUbBWuX0WX2r05sqNLqnRX1PcKwG7jV4/y4x6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: Ubd6gScUtcf6sUEyBMvbEq0dyE0WSi2y
X-Proofpoint-GUID: eNsuh1lzga7d5b84WMoCpu0OeCAgpojn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94541

Release notes:
https://www.samba.org/samba/history/samba-4.14.8.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.7.bb => samba_4.14.8.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.7.bb => samba_4.14.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
index 0580bf292..1c599ac0e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "f0db8302944bb861b31f4163fd302f66"
-SRC_URI[sha256sum] = "6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d8f1906"
+SRC_URI[md5sum] = "5c6636b34a322de0eb917ee0403be322"
+SRC_URI[sha256sum] = "c936b782c2aced8cd7299c13bec67c495fd4affdb217a6ed6150f4fd6d770fde"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


