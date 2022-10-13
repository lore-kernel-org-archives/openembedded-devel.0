Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FB0C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 03:04:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3360.1665630292184871359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 20:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gTVAewBc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7285ce88c9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29D2wvTV028616
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 03:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=01qsvrZ/XhETYR40dOKrcFbblHSGE9JLSFiYvQmdee0=;
 b=gTVAewBcSzVP9uSz7ZmN8yJFwjRLTX9oP4kUYIdwGrfvkKSCVWZcHEBLZrPRIpgH6jji
 tk06gTbM4Ca3HWNPL4cG6NuEiYzh1jYA+i4pALky3VMkP30Uj2t2YfLuoj1ixny2klvs
 C99HgEqTGWRKz06Zqz3T+QlnVoy72dH+MSP3SEeCrRIZHFlgaKu3PWP67vPBbmCgXReL
 v7tfyVWrj35Grn6Ogn07lBe2VJp2R0B2dKJFfycFp4WjNibAS93BgWL5XitjT9Ep1Wy1
 qZ1cv+HnnhRM0ll9RTTv0736e6CUt5jxdIOx7Fi+Qgb8htUemAsD9KWSn0fBFS3cUInA 2g== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k4feujfm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 03:04:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4yRpNlF3Up9SonVnO3F2yJh0tNv8+XY3Qk1ZM3X8EX2BozNN1b82nlJE/diosiOGJS8PYv7xBAVVI7Iv7QGHt2HPopMAvbL93/MnzQtixrDHJnt9tO/ID573KNlQjlSGmFtf+7NDaddch+FBiqugGekiP++f5Le9rVrPase4nwMyxjzovCith/CIYk9NeQHEnEAvcNLbf7RXPNR2BYgURm2V5MtWWUGTlrv/zj1pPS/5z8bxSjZxhL3c0Id9UsBmnYztzfYcLNXNNgqkf5TSsF6fqIkFoHyjSBenkHkM+RwmQuyD/R2H3Ar+kud3xbKPhFFQHjzeX4fP/KeBlBhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01qsvrZ/XhETYR40dOKrcFbblHSGE9JLSFiYvQmdee0=;
 b=W2LMM2AjQL9PM4whLpkGdDgAMnMBXOh/krHJKveuK3U3Sb1g1UZkjxfWhLNFLUCAHmCJje/iCRg95DyuKRgzWINlSdUp7zFSmys6IsuQmA2KpVcxWf7X+xBbjXQLk0eMqvYn9gdQrQ9IXqxpZhCS6kBgQzf3/ZiyS4suvYLoknLOg833xwgLuNz17wyWHhZnFMWQojhOYEH9VqT9dMWSHCn29tbSyV0ZPq6e1VJ+cgC+e+5wpJYcx3GnET0hRmPCNjHIIsfjRMZc0PZHJrYVedh0nc3i5m3E6qYh+s6OUz4v6bDo//+uiI/M4zSiHmdRcF31oUoqzZRiJXJqxzpd1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 03:04:48 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae%7]) with mapi id 15.20.5723.022; Thu, 13 Oct 2022
 03:04:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] frr: Security fix CVE-2022-37032
Date: Thu, 13 Oct 2022 11:04:36 +0800
Message-Id: <20221013030436.2102064-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ee1bb2-7c4e-466d-63f5-08daacc7b068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wFG6aYg9olZkNpPkn5e4gzEVW+pF2WSmc04IpPrewLj4uJNU//MbNgLZwftukPUdeCuWkOibcaJXRfRWXzTHAVjqH+0cs4bm6pbVSdbCVv25+fxz4WQsxb3y9n3fqErPv7w7BU4YC3UnsDj02NiHGJtWdVkc2j4c8L43LmOMvOt3jNXw5OL43UOnT6R3oyL9O+fv8Dq7cmzAUUyAKUnvZO53oxZXEwXmeYv1r4i/azh3r+X5ZqtjHistPbek/H2ZoT/iUvzRzzfBR9SzqgpVC65Rr0lbmrRK921ycIZCkndwVJcOlPhInnsabt7eyHDRl7N/n3sjgvUWOB7XzX+mAKTWj5AQcLw/hLfcs8+6W18JFwLmhMdkHiDhypOT5b/jtDG5OYmw3j7eVsiDRFrFSN3gq4U1WnbSUTze9fbyDqvf/mY+ABlHYlLL+CLeSpEjJ+8aeWN6/3Tz3+if6Z9/c21TpIlGiDjVvVfkXlmAWVCpbvwNGqvp4OO165JjAI8SW5gaOgdIcUrfKtNzlXWjhmla6OCEseQXJsyWZyS/H8YyjMbsGodFaVKyyiQwLnAgC1RdIHDZ61s6c0+L99nCu1nt2FaRywbic1PyRDPQFJxJDoWrUla0nwWLWFaNzUhhPcRzaGbkCr05pTDDbfOSh963miapSG8jD9QN2dy3NUsD576kyKW5tFl+q8fvcHoSjr6VKt70TJqal+HEYZr3MiesObDQPaa3hM4tbD4Xn7WAtYl4SYhb2MqDQwqvbAOIpc32zSjIKxtk8fW+ZdPMXwodaAv3cjMzMo/AZEnO46suUcEgFu3KEIbz4rnuK1XfJw7wAvzAV7GAiBPKlSd2cQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(451199015)(38100700002)(38350700002)(5660300002)(52116002)(6486002)(966005)(478600001)(6666004)(8676002)(316002)(6916009)(66946007)(66476007)(66556008)(6506007)(41300700001)(26005)(86362001)(1076003)(186003)(6512007)(44832011)(8936002)(2616005)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rW7zcaP8GQis8GoSF1aYPB/mL5Y62/5He9nk0NKIOFB1ZtGUVfjpij1+bTNV?=
 =?us-ascii?Q?TVUanPpFMhSB0eC7ewt6pvpDVypzE1e7TPlSBumy40S5iYSSQnosyMxMerCW?=
 =?us-ascii?Q?7+eECG7+6rhiGb72TXAVu+xNI+YQryPVvvmpKeqxRrwZHDME9Bvp9Fuh3OYq?=
 =?us-ascii?Q?D0qAf2DlrVzyIkmRxGh3ps+miNbzFXjRw76HTUrs6GFkfwS9Sk2VhmcWF6sX?=
 =?us-ascii?Q?UjAvNLYQ9yIJDMs8vx/F4B6tcyOcNME4KX4XNY6+s32a6rVJO0XnE2xuUxAZ?=
 =?us-ascii?Q?RTBrFWsfMLQ5RWBheIkuTvX2XPoMkT671LUrY6+ERQ2NnvDMC0G8SpvK+wcY?=
 =?us-ascii?Q?v6D9fu+PbYK/Wa5TAU7iIeN8WRy48VTPZqiaTwlSCeOfJ27DffuYEpBrn8gK?=
 =?us-ascii?Q?BsB8dLXOLO0bLlBxY62ShJbhsOI6r5Q5aEEzz3fyFx0nY+hXF5E/vVkicQRK?=
 =?us-ascii?Q?N3E+qy342oZZDXDDwvHJCXHlozr8qpWwBOgy/AYTEZSdcf3ipcddMJEA+5Qc?=
 =?us-ascii?Q?9raN9oN+Lztnzhye2PHTuaXE75ijArtFCF2wZdLdEHLC0l9CEEP2BM3E0eAq?=
 =?us-ascii?Q?9ruVcRPrJd8aLRD02vCNp9mu0K/CCJMfqn3aZN/58faFvXPxz3+wNV4nAn7U?=
 =?us-ascii?Q?iTTkUU23VO7LiL6GeZf7ODh/wPSemYWvdNM8abtM83i/l9BaidzdahU0f1oR?=
 =?us-ascii?Q?HzUDP+QIBZgBIeAeHi4vzTKJArzqiNJe9UJ/CpG9SgtpjsxnqffOonAmE29d?=
 =?us-ascii?Q?xbjRJcI5o0eTeQF/ctLj0qm5kPXbA8xz//6JSJlZscGSrkXCoTDUpoqJQqOA?=
 =?us-ascii?Q?3VBJjojtahcUHH1YOY8h5Ffuqm3QI+lHlHGiD+MH70NHZB2t5zd+aXhkVYBg?=
 =?us-ascii?Q?CVwlwPBADRiM80+CJI1qDC/t65bx/nA7VQNfIVnYhmgHeubrT3XPEHk1CCbk?=
 =?us-ascii?Q?GdbDbMHyce60+FxO75jtbgIDrDhqoben6we0sNBK9f3egk07Ro3MFxcrlsyy?=
 =?us-ascii?Q?0bWCLcN9gSJreLx3VjgbpF7BmpJjML09Bm3v+Rko9hH+XEU55e04qMc+VGT7?=
 =?us-ascii?Q?S56twfrixzrF/asD0TvJTXp0k27ISGPTER6PV7QcQpapScqiEFGewQqfZXRG?=
 =?us-ascii?Q?TAtVEtTrw60CdUs3etXgRE8ZBn9AkezyZHAG0Zw244zLY9J9WYjNviSgMwhm?=
 =?us-ascii?Q?o2fHwHVoLmYVw3NxFILKclsq3BiPqk3mgtAs2D+7omkzWc4zccgivASGJMTn?=
 =?us-ascii?Q?TZZlcYTzreKsN9wsGn4rhTBWGCNz7/Q6fv15sxlG/D3AlQREZvbPFk8aULXk?=
 =?us-ascii?Q?vcq42opkId4oDuvhbE0EqJNdCSZ2+9fGbp+7n/2tNw+t2PpJV6qTzDBku/mH?=
 =?us-ascii?Q?n7RnSlpXGum1oJgF25NaJ4FEpL4pl1iC6AUbVxv+jPvCYi8dyM7qPYAFFyIi?=
 =?us-ascii?Q?vxPfUVBXDcqd+GY6SFNZPWBtZtxEx6OGyfyI/SBmuvFMc0p5lgUMcAmZxuTo?=
 =?us-ascii?Q?HBygtxw7TXnEYNeDRYF28hLnB/4qngXzDPYEVa1nD9+vG/YxFx50leSRF4RM?=
 =?us-ascii?Q?BN+ydXr71/ftxchJ9fg7V/E+0bBdi/hcvDNyyJzy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ee1bb2-7c4e-466d-63f5-08daacc7b068
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 03:04:48.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiOneXnXJokRErU4ZRH5JD/xsDdXwVxYHMzPpHVa7005dGdJXl5/1Oy7nERaAdZjTRXwUf7RkNxJh6plQoPKxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-Proofpoint-GUID: QcXikeq3mkyiy1mEXudn1ZBMxmymNOJN
X-Proofpoint-ORIG-GUID: QcXikeq3mkyiy1mEXudn1ZBMxmymNOJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_02,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210130017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 03:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99154

CVE-2022-37032:
An out-of-bounds read in the BGP daemon of FRRouting FRR before 8.4 may
lead to a segmentation fault and denial of service. This occurs in
bgp_capability_msg_parse in bgpd/bgp_packet.c.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-37032

Patch from:
https://github.com/FRRouting/frr/commit/3c4821679f2362bcd38fcc7803f28a5210441ddb

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../frr/frr/CVE-2022-37032.patch              | 42 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2022-37032.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2022-37032.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2022-37032.patch
new file mode 100644
index 000000000..672bc9514
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2022-37032.patch
@@ -0,0 +1,42 @@
+From 3c4821679f2362bcd38fcc7803f28a5210441ddb Mon Sep 17 00:00:00 2001
+From: Donald Sharp <sharpd@nvidia.com>
+Date: Thu, 21 Jul 2022 08:11:58 -0400
+Subject: [PATCH] bgpd: Make sure hdr length is at a minimum of what is
+ expected
+
+Ensure that if the capability length specified is enough data.
+
+Signed-off-by: Donald Sharp <sharpd@nvidia.com>
+
+CVE: CVE-2022-37032
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/3c4821679f2362bcd38fcc7803f28a5210441ddb]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bgpd/bgp_packet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 7c92a8d9e..bcd47e32d 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -2440,6 +2440,14 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				"%s CAPABILITY has action: %d, code: %u, length %u",
+ 				peer->host, action, hdr->code, hdr->length);
+ 
++		if (hdr->length < sizeof(struct capability_mp_data)) {
++			zlog_info(
++				"%s Capability structure is not properly filled out, expected at least %zu bytes but header length specified is %d",
++				peer->host, sizeof(struct capability_mp_data),
++				hdr->length);
++			return BGP_Stop;
++		}
++
+ 		/* Capability length check. */
+ 		if ((pnt + hdr->length + 3) > end) {
+ 			zlog_info("%s Capability length error", peer->host);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 62f548f84..658731567 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2022-37035.patch \
+           file://CVE-2022-37032.patch \
            file://frr.pam \
 	      "
 
-- 
2.25.1


