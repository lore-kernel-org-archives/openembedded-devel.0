Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D86C6FD1F
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30529.1678100600301581123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=atJTbSqh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3269mAbR018975
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=DtxZ/J9YUYNTlx+l8HZ7ps8q8Dl/qnLLGIBlHNJJRPM=;
 b=atJTbSqhBRo8KkX0QFmlDz0oOewkOxO1gesxZXhyvpycGpoNYYwHV/SKMy2AkgOotbMf
 kJGbOqcGgSO9hGHtHN87WtUjSo5iC9jjRn0eZLXuwHGyO4tJVuO9TdhsV4mmNCq6q/HV
 IcxWGJaYdtHvxKBjYViNts0djSr4rTLuVNQ8sNC8g4gHNYvMOH6PwxFT7IkUtQtT1MTi
 YOUnvMqeqvp+HodbkK9KEgS6a5Le6sJQQ3tl0tuLA6e9VQOITqVm0Pf4oljmbBfT6bGN
 h40tfgfnHmF5WCQ07IAlYm8EtL297e2yVtlOmCWepX3pA/0PdT/fWWqZqM0dw2NrO4VM 1A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258sp5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ax98Llim0q1w3gPg/wqVJlsciNBGOiZ5ac0nY1Cr0Ry+G/WSW5pDUBX0wtEClFlHi3MDh6qEsm2+aohdqC7cQ1fNiK2dRbLLgOtD7P002FK69M3Lufs8Lk3wBerMUGyAbq6PdC82jHbOyq/HRAQG1ZMeuGRXaTU2y7Z9HWILRKVpqm/VnL6vDSjWeKyHNVb6lMbrf27baubOtQkLMW4GaOpUTIcwiU/T+4djk4pHNeVcF4ZkIZMKmQlCpPVgUdzFOF6TSIAk1gdPsw01Exq55RqlXuL5+HZ9HHNkd/Zr8zQBq2K7baoP0ZEInoA9JVQOXyIhTB2sxwaA3f4vKudMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtxZ/J9YUYNTlx+l8HZ7ps8q8Dl/qnLLGIBlHNJJRPM=;
 b=iB12G01sqc4Ub86VwMhc4YmKMesDO2su8GkBQIYTYKrADtWxJ47/OVF46pxa67Dcatif0BgaRo/+UN33iIEXnXuVn3NIo7z2ZloQoQjkBdt1vtjuJp8afnG4nULvRdJwyCK3ekgPfo7m5E+6lWxMiZ5DP+SOSVpZhviRUET3RGw8wVyJtcmvDeQSeXFqTM0/MqLRu9ydBoroDDVrqxtUH5WxTsHj9ZZDST7jxd2HdGl1NW50/vAm8OoU6nRX1DZ3ItaAWWX0NurXUWjnbSdwdjrs7FcHFrXc3z4VZfYgdDlGsAVU500x1LzmtvgrDaDnKlmG/cxBWvZap453n85YlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/6] traceroute: upgrade 2.1.1 -> 2.1.2
Date: Mon,  6 Mar 2023 19:03:00 +0800
Message-Id: <20230306110301.75991-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306110301.75991-1-yi.zhao@windriver.com>
References: <20230306110301.75991-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: eaedfddc-6a26-452f-d738-08db1e3263f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YJbwAW7Y6VGuy22rZFx+GJzuFy84sq8uPnBueUVx+poMjNebSX+7fScNq9WAbPQDFU+uhjjuDzO2Q9bbjYXxAv9bhSjQHQt6RT9QTMCDxH2YiEIiefch9EAaIb1eZWiKMIxObZBv4//yZsSB11+j0bav/lfcNkjSIqqvkdUPZm1EK0HCwoj7ttEVkrLZN2p8YZLUoWNwI8HOYp+coltQYlhyZxysbrzvLfIbS6Gr901BgS8V/UM247KT40oMOZpsD4mrzGNUzMt1Tn0NOm85p8fS3pHSmNub61W/ndDz0rwlm+a4r/2VPU83IWggelcUFb0XubU2udL+YVXeWOObPJj/X7uFrCNMwgNUhevU+Ew/+ZJng75a34/eHpSJs30X2h/9hnWIrjEohJ/KhxvGbNbodjTu/qvU5yjPd/weu1sFhc08vgo3CFoAjwF/zzq/nAQSYCg1h6KtXFFuMuyf+ZfuGXvYvb1+xAC14F8hLd1Bqfxj96Lx8cN3o+Yfr7wnKH0tEYQrXHkYlQ7elhBBert00J+ByQLcFDd/I7MRaQBhMn50nXwuCb3KB1AODHkyOPIum/n37VNaOrUKjMljbWdnZLZ1zYTH7GgrrNFJCA5vK0ACAKPNfnTlavToikl2LBOEf9PRY9+ZI0NH25KwVbRFQcfBKyR/RCTiIalxLx/760CNpEKYLHLjKeib1wKw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(83380400001)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?smgyQDwi3BQHHsRj3qtO2JWwr31Wwtmff2kaX8YHGKePC5HlJWQn44KBmzx1?=
 =?us-ascii?Q?iMvWsfWwk0yg70+VTcbeXwMkjAfB/qrQ121Sky4npBD31sJTvjwcm6PRQyfH?=
 =?us-ascii?Q?HZQdr559fr1dr1ys8GHYIsUThXazsNn/F+ppP8wSbeX5vd57Ksdy107Zc8xt?=
 =?us-ascii?Q?KKaqlv2vE4XvNg/G0t/IFjkXR2ZCnvxKeI0MXZ8q37WxhIfvAuZvre5N4HsH?=
 =?us-ascii?Q?Wyz739X2W/Ktbtx8kk3GmeB3EqdJiwM84ql+OIAP8vVGdUbyFKRez/awUZqx?=
 =?us-ascii?Q?DXxzeMNpzWHJNY2ye+NyiPlDDLyBL6WMR4fqQbbFl7oX3Ea2w81EU4ug6v6s?=
 =?us-ascii?Q?rXyECaOSmz6I8geckDh4Tlc5FvNk6YZ0lqPfeKWG98Ru6EHHiprV2qBGYHQY?=
 =?us-ascii?Q?TsDFXjVgwiX/suHd3YrPRSiK09aoyumhWzTKYIThLDlZoN9wOcNRLlDOjRGL?=
 =?us-ascii?Q?55iCfu4+WkBW/fN1TrWtjlxuI1Wvo2cs4KXWAXXtbOP5F7pvkNBgQnJIx60I?=
 =?us-ascii?Q?Dt1LqiiWq/tNvLB/m9/AEHNraky32K8HDwSnLfwyPEFEnEQKgoepkOtGSPMP?=
 =?us-ascii?Q?Xmwpc4ogcaWjz/RB25aTamsnOS59QS/FtCkr64bOl4zsFjldr5QuiMlfVi/4?=
 =?us-ascii?Q?aylOOyrH7b6MEKgnJ0Pllq6hvL0coez/q9kKGE0lvc4sqqnoG7L0Ab7FSwNO?=
 =?us-ascii?Q?UnjVmqpFgTf7kHH5adHTA+JwgnWJgFgucaXE2LyC+AOioHSyM/ZGAkQGR9mk?=
 =?us-ascii?Q?R4tlDXGBWFn8pOmPdQk4Vnf9MeBgKgHdb9R+ys3DJ5NhzsUHP0vWGS+lPaz/?=
 =?us-ascii?Q?Hzr7hOFBofIfFbpG/PXmQL4FSAwMG6DU2VVPsxH8IAval541vobcZR43veLK?=
 =?us-ascii?Q?JxOJSWvX1RtPoxDOdB2u8h8gz+arcbaMe1KXL5JLEsOJoi/qHql+jnbtDxhG?=
 =?us-ascii?Q?Cskyw+SbSpXWIp+mJ95cdBnpeAgHJjXEcjReXGrk1OSaPBjm0kwT7DDzqp4y?=
 =?us-ascii?Q?rSC7jABYWkM5roxim3AWOzQQQnb7VVvYbRgYX7yJLD/VpXd11HJvA9dEi7sP?=
 =?us-ascii?Q?7wjEczbFZQ0UKYppTx0qktSUGSB5ElpaO4WhIt02z15FJMU99pT15Jjj0Val?=
 =?us-ascii?Q?pG6cxyS1CyTQvt5l/HY8eeRbgixpUyj8gtEKLevJ5tEC60jMW38858BuNjIt?=
 =?us-ascii?Q?ILrgt5xBz5ZWSKPsZL1hcFPy5Z9nRcKtdNxcmTq7+4UL6z7OlDT694hoOy2z?=
 =?us-ascii?Q?pf+mK33M4jEPDsFb66CjqrrthInxKwzTX53v+eBarL9MEhfcqdamt4c0FfBm?=
 =?us-ascii?Q?7fsBDwUUOJSE9ub/0RUjg+1uQpYfYNcbYXgO0Ifq1DMSw5/cSsQCgtkjjYb0?=
 =?us-ascii?Q?VIwD8lmwuTgV+ijCmmjfR+DTyuzTz3fc+ZsL7tGFe9v9taABjXMPq6buGDPH?=
 =?us-ascii?Q?ZLZwdrob4/V83tqvWPWcw+ZcSKQQGmStpoIbZxxxw+7uXe4fY9VnisfUOvMB?=
 =?us-ascii?Q?8Oxtpy9iHGf3IZ+3asaqh6aOBKEcawyj7R/Od0b2T2ksgvVF2LLh2G9agRtp?=
 =?us-ascii?Q?RJphuMqUzupEN+KQnn1/MIitAN4KZb9PzeoTTQbA5NUpZFs2XsaRpSqxsavE?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaedfddc-6a26-452f-d738-08db1e3263f4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:17.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wRbBoLqQfYdpVN/Rr2ZuxlntOdVi2qLVADruZMQuTkiRNwdzD09otXLWiVkNW8apBy1Zq36oIDHN9UDx2d2Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: p9O0aOr4rd0c56bHsu7XU0aes5jcVayh
X-Proofpoint-ORIG-GUID: p9O0aOr4rd0c56bHsu7XU0aes5jcVayh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=737 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101398

Changes in 2.1.2:
  * Fix unprivileged ICMP tracerouting with Linux kernel >= 6.1
    (Eric Dumazet, SF bug #14)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../traceroute/{traceroute_2.1.1.bb => traceroute_2.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.1.bb => traceroute_2.1.2.bb} (94%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.1.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
similarity index 94%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.1.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
index 3892a0e21..51b581a4c 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.1.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "8fc8d5046e855d7588607bb319f5b82e3ba13e91d5d4636863262e6386bbaf76"
+SRC_URI[sha256sum] = "507c268f2977b4e218ce73e7ebed45ba0d970a8ca4995dd9cbb1ffe8e99b5b1f"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.25.1


