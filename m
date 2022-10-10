Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074F4C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 07:30:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3652.1665387024464163601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 00:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=np0ZaXTv;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=728262b6db=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29A5tpUt021573
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=q+KkHhHuNp71TFzmXipzi7wfKsY+/gErtMN03GdzjBI=;
 b=np0ZaXTvnROpeXuiSFzq0h9uoT83RUIWH1zSM+cun72wiH5a0ARveyviA2NTdPSDhD2l
 C5SWxw+Oo7VTC9Q5uTO+h9LqiBwWQXpp/zsvH361UyZi5vMV4VY9tttXzWjJnBNSGuKI
 3QDLR46wjKhlvu5dv6RI3qXbypmn43JkFMSHbU/ptZtAt86OQ+al/w/R72pXMKYyRdZl
 2SVRcUB6jxI1vfAipFKD3PwRFAIrcJR/Uj05m5tgzqk5GMma6d7mnw+kTwVUtmICAgFP
 eU09M8tMZ4hQIHDo15YRVd5WYFTB6QUgZnKKEY/adMeeEikTMaBUOCuA+3zoNcZvgBhq Uw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs1ap8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7c4LTrtE7YKOcbq4lN4eUsksA9tGfutzKwWsJ5rez0Qusg7DiFAU/Hcf0ratwit8u2apId8yOr1Eoe/vk6VyLrFPsYdFIhODvzcgWx7xxTxivL2fhvZMUTc5BvjoI/DaaaM9yNaMXJHOGzlMtcDL8YIUCFUx/Wtj2gXcvYOG3e0TqI1YItIH5HSW51f8VppWnheN1bqIbCeib4r1dbzElv96cXMDkaFpD7FLV5yhg/H17kPaO1PCdOwq4GhdZowU69+Bapx3uUTogCSfCK8PuTRIEoUSKOnTwVehrstAlKGhemw2QxGIY+xrrPZndcL/JZVSP6rkhp/EKxZj+EBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+KkHhHuNp71TFzmXipzi7wfKsY+/gErtMN03GdzjBI=;
 b=EsiRybVJRFSOvvPXn9DulLzYIUnP4dVkZRsM2szp/uHoRmwmYa8Ri98QlZG0De1oZfrsfMOQDHxTt7lyDRfE7wKl28Jy85BQQEu7Ls6mqp2HGI/pBrF2DdMk1Dlgx/13uEVWELkFouidzbGPtkPks3lCocoPJ72moHODaxhGFekAqCJsWk3U1BoNY0S9qloxKpM24M9uEgqjI3Lhj9wjs9qZm27y7RT2JhhFl9GtblM34TxyyDYCmlRuiKRbcUtTk3k9WWCQpyjCsPlF31u+NwlQ6iKXhNPFb9j+DRWMU/3D2P6X4MCAthT1q2d/U+L64HqLaih64nrWtIED+UjTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Mon, 10 Oct
 2022 07:30:22 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 07:30:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/2] tcpreplay: upgrade 4.4.1 ->
 4.4.2
Date: Mon, 10 Oct 2022 15:30:08 +0800
Message-Id: <20221010073008.192330-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010073008.192330-1-yi.zhao@windriver.com>
References: <20221010073008.192330-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fefa05e-e205-4ac1-7bf9-08daaa914a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qobvLrOFn4Jnee5TctqVK51ytJP+95W8Gt8fWdn42eHrQVD7wYAnFNSD/mNsqiVxpjnMMEBaZuXZMi7zpAD+STrR2+z0B8++GKa60wfjDuTOlkoT1XiqacTHsWYO7tGGXIMIup27QKtWfVfAXu6uE98O8kN3tneiEKDHd2E1fxdQof67+L0HOCMVKmoIYg45q1AqP+g+/9wZ4yH3R0ag/nnwEA/+IHY1ZHXTuD06f0WgYdwXGdv2WHQFOlIg25dDUd+9gtAr+VDMZhCY1wcYRObaBUILo1YLfoXGoCBjXc3yssGSwjWMLccQJnplO5v336etGGUvua/jhh0ZxGMhLDa/br1LHTNn6geoxcQnFn5WtUofPZcwPC6h4ZWE382ht15yIo9YLKkX7ywQ0G/ed9ChD4KDvFCGWsH77rIR/NSQ6mK/OUAWlWf6SIjou3w+t0TTooMD9nnKbzuMYgABmOHBaKvGY5AeMTzOj0EbXGMtiPVPUigJu5EuxDvszeUJo9N1HRRigzh+gbx0Wecc7DHuaK6dXSTqAfFAXWE0titpyuuYml8ZddRDdZN4A7g5/j8Agyebx72qx2bTFnVymJajuPGWmlNzJHwVGSOItS95oCcK5xacG+P27utVpGt21o2Ue/XOoilnoxEL19Fn4EWZ5qAYiygLLAkheHWbwKUPyqKRKLPK43oKD17GwQQpY2JUUU6UCjxaW77KWNwd2wyHmb9Nbgs4OzTZMbXxa6qQSq5YVKtJx0YxT0pU31mkLG9/OBuw2iI18KGzMy0+otgf+2xudJiD9bR4aZR/n93hmyLNbQpuKbjiooZ98qFNBgeq6gm1KKsl+5bw4yIARA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(451199015)(83380400001)(8676002)(66556008)(66476007)(8936002)(26005)(2906002)(36756003)(6666004)(66946007)(6916009)(2616005)(6512007)(41300700001)(478600001)(186003)(1076003)(44832011)(6506007)(6486002)(86362001)(38350700002)(38100700002)(316002)(52116002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x2Gwe5RQRAPLPyvJT4YDuvSIbG6TLYuToYFoOGSqKDWBz7osXIoVxwTP70q1?=
 =?us-ascii?Q?VkiXNQ19T3srP4VERYMm2nGhs7UDVOEiyc7CrFtwgvAFKQMPeOr2q70fZ0a8?=
 =?us-ascii?Q?SH7eTHYmFfyCWLI+5IM7S4td0ID/spD6fEYHiA4OCUF7cWX6X2otnMx5+hRl?=
 =?us-ascii?Q?26rjergN8jyk1OXcOM48RcjzrThxm6X2n1vG6Nu7TyJJx+vqiotfDLppORe+?=
 =?us-ascii?Q?CmQui3zrneciwAOUpTkmeASGyOLTL6sJ7sJSEgG+mEbzMRD2DX/IEjdkhmTr?=
 =?us-ascii?Q?jLwtHWEB9UQHaWU2SMsA0dKz6kfDnxIkRTfAekIsJ/3zpuGC84ud6kAjuB1/?=
 =?us-ascii?Q?+gO//sA2Sx1Vp3F1S0em2+FdKUSOEst4NJSKlRsAfpsUZ8jI67gDRIkbsEBt?=
 =?us-ascii?Q?WIdD94tc4bmYsbX/mzwZxF7hznFmwrRG0cl+dxo83oaVq/0kyAncv3QMtzga?=
 =?us-ascii?Q?L3bVWLDJK64ZtF7rexH1eiqlhVZ5zWA4dgBOP+BWqCGqjCXEQWzGMB29bX84?=
 =?us-ascii?Q?dmnS5ugWLM4BQZCLluAo+K6IFyMaaBm4TLuzlDES2HrSwm2OQIqRLIC72OVo?=
 =?us-ascii?Q?59qF3cdZFIHoDG68yYtpAsAN6HjKBfF1znrYRxKwgpvhJTO2G9t2dWNe39TL?=
 =?us-ascii?Q?JopHicoHk9a/dWOsiOD5Y01uVODgdW6K1rtlvXVcZaAOr0jY4g9qP/VQFgiS?=
 =?us-ascii?Q?NwpYVQnq63gHU4/FQh2k8FsMx2ZvPRtlpO2irAYM7VKyKsYviBiBlAlbzAcq?=
 =?us-ascii?Q?q2nfFM52tqUz34JxpUR+PfajxemdJYJ9o7G1zSRpiMxKJu7O82dD2My3dx8F?=
 =?us-ascii?Q?ywNRbXcVdhxtsFUfBztQDmZhuixvKUHzDe+DiYa6JlTujJLEJ5KHX46msrIn?=
 =?us-ascii?Q?dGRjty7D3b7Jvg2wkba462yDSjJPhrI+wbPJM8Z78hMzrKkF2sOPaUTI8zL5?=
 =?us-ascii?Q?Q/XIy3qfQI+szVVZmT8sq/l+X8geF8xlRlsXacGJH/z8GxPG3H+ieBWhQ/Qo?=
 =?us-ascii?Q?v6J+55KVqTaUYHVco7Q+1c3Bu2dnMzABBSn7MQEYAXmzWaHQuNQtgAXsqmml?=
 =?us-ascii?Q?nrlctLdtmkxxNNyg7ss1OQB5/Nr9JCCzELfwfjjB0WPyEGze+YJBiwWLXtrH?=
 =?us-ascii?Q?7u+V+f5qBHen/LSMBW6GEAid+T7PhN6CgXVt1oMnsXTGRWX1TvDQwETgs/An?=
 =?us-ascii?Q?wHw4EjtuwFS0u2PnV8c2MyAMKnT1/5zmV1k5BaCbc3pwPRV0x5s5fDcaylzo?=
 =?us-ascii?Q?u/yQ6glXHgQs65rpb2Lbcw/xpRwY8E0jtr3C6oeyDY4TBkbwWHjPIHMgjt+h?=
 =?us-ascii?Q?cqs+HpOLGVkO3YfyA2OkWlYQuUYZZUJAwpix0EKB5amnWV15ZB0M3/rKKFuj?=
 =?us-ascii?Q?tu0J2KZrqvvahBSQY5oJk4rR4QQbqvXq11camjSvkErYmKwNNRm+LTnP+obk?=
 =?us-ascii?Q?p2WAGzX8WTkX/KAJXoptXN/Wx/MTzdvS4/ClhaF9i31aPGsZ1iQW9E40sZPL?=
 =?us-ascii?Q?mFIQBnkBXr4VhHEojGjyEx6AEMpFsDNJGGWV5CYHYj5KLEJYylpfeUgh48NO?=
 =?us-ascii?Q?UZPBMMHbaI3pKtGL7f/CkatOdM1XxdRUlC8PpxMK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fefa05e-e205-4ac1-7bf9-08daaa914a73
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 07:30:22.4127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PDpLfVOtlJeVrIayZ4DZ22L/mMc4KVLTuxl4HHj5Jo2F/gP+N9JgOJA+5aVa6ssSL7fmoqEr4Zl1OGbNZSeQ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
X-Proofpoint-ORIG-GUID: 3Cc0Omd3TWHGwwoSKC2qbsdivPDRJjHw
X-Proofpoint-GUID: 3Cc0Omd3TWHGwwoSKC2qbsdivPDRJjHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=960 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 07:30:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99117

From: Wang Mingyu <wangmy@fujitsu.com>

This release contains bug fixes only.
The following CVEs have been addressed:
CVE-2022-37049
CVE-2022-37048
CVE-2022-37047
CVE-2022-28487
CVE-2022-25484
CVE-2022-27939
CVE-2022-27940
CVE-2022-27941
CVE-2022-27942

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.4.1.bb => tcpreplay_4.4.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.1.bb => tcpreplay_4.4.2.bb} (85%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
similarity index 85%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
index 56db66b8e..165a0e735 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "cb67b6491a618867fc4f9848f586019f1bb2ebd149f393afac5544ee55e4544f"
+SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1


