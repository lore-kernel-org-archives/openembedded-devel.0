Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46960C43217
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 02:12:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2940.1665627156530634541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 19:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Fwm0QQxO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7285ce88c9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29D1dZKl030805
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 19:12:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=46nvt3EHqIscAFy/t+Y4iyoqY3KFis1gWi/8/fSgWZU=;
 b=Fwm0QQxOTfj1DepihGYXjCM/osiMZZZkiXRxH7kmZUyFtHYsb8UAw1FYtwYa/W0vjoNy
 IKBu1MHxGd2mSz27GOClriiXICgcVpZpUnrFrZwyIYCQWzj3BbX7YTbWcqiJQIQ2LKF6
 YTjHQijB+MI5zkNCIsvpuYIgFzwiOvZbdVv5deZT+aob1qqhkVEuCgxt3sZGWHzC5CJw
 zKIG7yc+OcsEonpDtuEu3+yfK7UnGyCvUEGkESjsay1e0a7wO+pQu8RV1vk2In4ehkRQ
 5njhqCHJ1bvChmN0C8NB5USxY1U2B2pQevzmR+Oi6Xlz4QITvM8K9Vki76wFYq5jUo96 hA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjbkuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 19:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R434s2JLs9XJ0f+B1r/Tn6Zuf67ElaI5MZ+a/pMN+Zz7zbb5rZVxPQzvufgzaPP3RlXvD/CMlj0zP/QCAD5ILYd3C/3Lx7ov8w95ePcIHZRU7cCmLYcYGub7tPbdT48MLsjextszp4QSN49jxXkWk3lrwFgKqaZOTOov1MN7AbxU8zqt+iE+i1jnWEA2cikCEHGpBzHyVeWbaM+b+wzbirOexfwhWltBACHnDR19yKBwTToVL+YrB3/aTb8E56RO60PGEgMhILTcBU4/t4B3YvOxUL924z2WlfxEpWrbiVkLxojeFSJnZdo3b+9zMcZ+vwYBhtEeELU/TPlvYYM8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46nvt3EHqIscAFy/t+Y4iyoqY3KFis1gWi/8/fSgWZU=;
 b=k0qXo18ACwcs/E6ruXH6L+L7RgDpjo/4/36QidnQXwcgAiDxHzt7iaT3FAfTg3p4oswukDHPcW09fbX6MZQ3Ns/ETTX/NfPinQ/aTWkwGHwWvr+yRm2AQCTPf8v9klMWEEt4LQvIfzUE67cMH4O3KqqFjhc4/qPo2RGXM8KD7gtXDXERviEh17L1WOXb5Tfa4qUN/cJbe8bu7DxoBQiL3Bd3It/qd3a8P05bSRuDF/Fx3WwQzt7zijyzcxbbBQwkbE2WEfMYtwBwnjJpAvdQbwvvvkWf6zLo5DqKw8qXvecwpOotHMjcBD6fRh7BLV7OwAzK6uC7U1pLsN7iQ9KJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.41; Thu, 13 Oct
 2022 02:12:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae%7]) with mapi id 15.20.5723.022; Thu, 13 Oct 2022
 02:12:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: Security fix CVE-2022-37032
Date: Thu, 13 Oct 2022 10:12:18 +0800
Message-Id: <20221013021218.2078676-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0336.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::13) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW3PR11MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: c371ea7f-6e1b-40e3-fb43-08daacc0627a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lwpJ2zqjhRKxJF5LdT3JUINB/OPPI4AUzv5WSTDYRyxdUemieVXevnKbJu9YhV1WVN7kuNwhPZAuMUtS9dQZxGLrgJs88mmQ60dgk++X2GoClYIjqehzkVt5ZMaV17V+6OAtJfGjqYHAh16CQ8D3JHAtF0M5ijc/Qpq1MnRCZzXdY+b3pbe3WXWq+Wa2JkZKVD06+Om4fxajufdlxrAR4AYBSyGxG5u6g7xO7m5GceJyaNOz9YHv0NnP9+q+JI4LuVQZT9NhF3w57we2msRW0strD3R6i3OkGFjswl1J3IUprWwqX2hGyAjN/oA39kYTAp1z45PmMS0kLzM5TLwvcBmdyGWYtln8ei5Qs5GiddBkJ0JR1vQppn2IPZC90wGAubBzmscUx7P+eSOoe+OMwOOlpcg2fiqeSsrdEGHckwlsvArtyi62wpEnx2/GD7vHT2IfAzjeR3OQ5MYMYWqAhu/YjGLWfgdd4XP7gFRcgGmutuCh0rLSFOcR7MUPUkm5HG2ITWe8FY6+isRgLi5ccFyDOa+x+COzpaSlwfcQxAeUHwJVG6QKgj900+y2F1eJKhFaNGGaJ3cyQy8S6woXrV5eGTvRzR/d48x05imeT0tAekyEOOh/FxZDLODrdRa+Ljg9Na6YK6xnJC8p25ranchWz9Y1kW6YDfg8gL0kUHa3loJn6WG0Jcmsn9sqaRnZGUW4Vh0/8ShscTikyPBa79T56fPx1n82cpTcDi3u/dMcE6XM4/7iIurIN8ec5VE08nkCvvIDeTWHEQVIIFlePXz8NgslWVlwyLJhp+Qvrw5RmcraHKWmHIsvt+wMuocT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(39850400004)(396003)(451199015)(186003)(86362001)(5660300002)(2616005)(38350700002)(38100700002)(1076003)(44832011)(2906002)(41300700001)(8936002)(478600001)(6666004)(966005)(66946007)(6486002)(26005)(6916009)(8676002)(6506007)(52116002)(316002)(66556008)(6512007)(66476007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iV6umrOI6Wd3ZSsD3yYM+OFxb2Xslf5VICzwMxTVVCE4N9i2iF52OJa17Ub7?=
 =?us-ascii?Q?X1RObDuJ/9Lk/1EdOkWSwxWrh6faeQBFJTxpvwpxA1Pvqc8n6NWphoab0c/r?=
 =?us-ascii?Q?JJFHtuPJ7+WpU6pbaV4tYv9qa5+EMzht//g2s5NL9IzhhTwaHi/h3nog34Hu?=
 =?us-ascii?Q?efhf60Whr1NbdW0zyL01KAAkbGHcXH0avdBi1DYzt8b6SoM00Y9FnKE8BNcK?=
 =?us-ascii?Q?5CurGODWsk3qLaNWVbVv973KTuTmD0o7tRUmY/lbvjQftcWp10ZxIrfosJd+?=
 =?us-ascii?Q?4yZTrQdubclVC3CSAw7ZaZdJAWUaSLgQT+5JHTc2zQPnHkJViCQzw8+mVdEO?=
 =?us-ascii?Q?tjVJhl9IHV1IrSvDWxugYxP6F9R2VSsQsOVFLutm19BNnjt5NlI76fww3KI1?=
 =?us-ascii?Q?YCvTt05SeYMnXrMltv9aLR578XNlje8mlsbcub6wiO0zXzng88UjOo4xlGwm?=
 =?us-ascii?Q?quZykWO67Q/2OtVXQLJZdZiXo0PyC91fEUxDhML47cKSaXZ3f8SUUiNalrbw?=
 =?us-ascii?Q?fR/GTubtMC45JpxxEenu3vlDReuf9YR+L7+33ngo/YUicxKUk+bhvh0IJ2Q/?=
 =?us-ascii?Q?IB0Qs1gtPKYytzdwuZSik36Xz9m+3sX6RmPJAUuq7JJgaEtY6Ice3HCDXSfP?=
 =?us-ascii?Q?YT2QJenAo4EnHIA8xBSvHyzR9P3sloA/EZQ3Q/5/W8EciuVCOlu0VnSPTm1L?=
 =?us-ascii?Q?BY2Rd03ZnbD0xCniXlZPFUs38tIe0NvtP1dSzxb102A4kVrG2HskNtd+TfLA?=
 =?us-ascii?Q?4J47pcqJ+pLjippNqQ16b1/FDXXUngt5EVfQd8ANLq/mXFS3My2cBGd9VJjX?=
 =?us-ascii?Q?Ntt+ZMLIW2pQrJuqBSnWCL3NKpmDYtkb/z5uIrxR68pv1lnXmnHRGH6uhVQe?=
 =?us-ascii?Q?zzmyVm3VBgcYcQgNL57Y7DBvB6dGGHO2JmTMG3NSYG/BL8EU6RwLUzzdIW6s?=
 =?us-ascii?Q?rFtm+GFVDsE9ibKI5tIvpU90A2FcrvpyOHX/daYxQdB4bVJCwQXa2Ruc771n?=
 =?us-ascii?Q?ip4xKv5VWzJl9oiocuNC11tVi1tJmGmlwGoTx2oYIKX5QDD+k33qIsjbtg9O?=
 =?us-ascii?Q?qFkcR2RrNrATVy7OQILQHCRAp4jxuNV6jsvyFuFOIksCFxGjWnrn3j756QF0?=
 =?us-ascii?Q?Adf7Tr1VtQKjdVEXgcFDJJOJ7ewF82rxHNaDueizwnqnA8LXugM9/PdXkTny?=
 =?us-ascii?Q?RjNxF9gBagEzPPn/eUBJgYxDDseq0+YFAssoALA8mehBm33wzkBtzG4/krRo?=
 =?us-ascii?Q?8tb9MyGr6osST5lNQQufh/yAI9+4ue4Gylg0iuAkHT9b5p5wi16SVnPHyXF0?=
 =?us-ascii?Q?pab6IERZFdVHiZUp5aNCyV8MWV+a/uewNQsi0FsY/wQP8RfZr3lUEAmfTuGJ?=
 =?us-ascii?Q?nNQ+brXX7Gg9YfUuwW4RKiufomxn/cu1rML/BuWIrHaOiK/RpnMVNQASJWvs?=
 =?us-ascii?Q?Ap+VVJUtfum5pQH03PAGgZFWAIdBOwEZH1D4kaSSpYCxetdsaQTs+GTgZrBz?=
 =?us-ascii?Q?svzU7nHR85tpZ9S25paf213JVoqBB71XoOn+Sn6V8JM3Sxu4T1L6LsxYrqq8?=
 =?us-ascii?Q?bKjkwj4h+FxXSw/jQs2rpL+AU+ASEObA3uY3pCDC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c371ea7f-6e1b-40e3-fb43-08daacc0627a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 02:12:31.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sTlZb17GujUquQ9zXmYFLYNMXKpGbm6RHVATxKZ8INoFeSaXKkSvUlMl0POX7a6jpW3OHFv5x9fZKeZ5I7sLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-Proofpoint-ORIG-GUID: _XqTwzBDyN-yBszla1VzPHp8KPBtp5A7
X-Proofpoint-GUID: _XqTwzBDyN-yBszla1VzPHp8KPBtp5A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_01,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 02:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99153

CVE-2022-37032:
An out-of-bounds read in the BGP daemon of FRRouting FRR before 8.4 may
lead to a segmentation fault and denial of service. This occurs in
bgp_capability_msg_parse in bgpd/bgp_packet.c.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-37032

Patch from:
https://github.com/FRRouting/frr/commit/066770ac1c69ee5b484bb82581b22ad0423b004d

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...dr-length-is-at-a-minimum-of-what-is.patch | 43 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.3.1.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch
new file mode 100644
index 000000000..52b39c1e8
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch
@@ -0,0 +1,43 @@
+From 066770ac1c69ee5b484bb82581b22ad0423b004d Mon Sep 17 00:00:00 2001
+From: Donald Sharp <sharpd@nvidia.com>
+Date: Thu, 21 Jul 2022 08:11:58 -0400
+Subject: [PATCH] bgpd: Make sure hdr length is at a minimum of what is
+ expected
+
+Ensure that if the capability length specified is enough data.
+
+Signed-off-by: Donald Sharp <sharpd@nvidia.com>
+(cherry picked from commit ff6db1027f8f36df657ff2e5ea167773752537ed)
+
+CVE: CVE-2022-37032
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/066770ac1c69ee5b484bb82581b22ad0423b004d]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bgpd/bgp_packet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 7613ccc7d..a5f065a15 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -2621,6 +2621,14 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				"%s CAPABILITY has action: %d, code: %u, length %u",
+ 				peer->host, action, hdr->code, hdr->length);
+ 
++		if (hdr->length < sizeof(struct capability_mp_data)) {
++			zlog_info(
++				"%pBP Capability structure is not properly filled out, expected at least %zu bytes but header length specified is %d",
++				peer, sizeof(struct capability_mp_data),
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
diff --git a/meta-networking/recipes-protocols/frr/frr_8.3.1.bb b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
index c69720e6f..1abea6345 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.3 \
            file://0001-configure-Check-for-readline-function-instead-of-mai.patch \
            file://0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch \
            file://0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch \
+           file://0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch \
            file://frr.pam \
 	      "
 
-- 
2.25.1


