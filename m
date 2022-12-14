Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F2AC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 09:35:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.99208.1671010494536848604
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Dec 2022 01:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FgUnBTsf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9347ebeddd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE8oGtw027798
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 01:34:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=AIKRL8peu7E6qzXZv+21dQakksUn05i2ckxhlqlfDAA=;
 b=FgUnBTsfjD+wlMfHJVrCjmOQCes359J3Ced+b916zGUT1O4qw83g29NTjEO7yuQOzqIp
 7TE3omljFNoEK/gfOeuymDfpfkwz7pQT1NPQ44EVc6ohYAsAw+4/gPHJos3W85/LQ/PH
 1J8ht8LHDhCWlJEBPGr8Gd88RjAIGA0nKJ6H0JWHsxtNx1QApQGNBBGxRFYno6kdeuaK
 uoI+t1/avs/5dl4iDJMy8tFvP8T7iz80cZ7mZOZ7oeuz+NuAzwXREQuROGgKldpUgTFN
 aMi4BDRtYM07I+WJteScx46hD5GniHCzzjA5m1ceoyxCblVcgTbfASV/fkW03JN0pCGu ow== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mf37u8a8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 01:34:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRZp6KHBkmWWhL5opUbmT2cATCaxCDszFGwueKmTcDGawRsGu0RceFr3zKeWVHRUdwLAj69SK16Up8p+L/fSmqsfzguIRSTPM9FwvQaaCh7SVfPU/kLs5SP0ekqwtWxVLLV7s4AFGTFyD9a3tkzX1xwxBvV72PNLp7486fL0TPG+zevOKTfnFklzwEmeLGjvsQSLaXttR6EQEuCBoIxROjKHpkYXBSeWMXw068UhMyswLMK/zlsOg2FK9TMs+Ha/BBZRLHPnCwpXbMKXGiO0vuRAxMyazTgzJDXfx5W46A4hwKx2O99U09m7XtGakBkloQsiK71nw9RAOSnJE7CQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIKRL8peu7E6qzXZv+21dQakksUn05i2ckxhlqlfDAA=;
 b=KAWCQhWlwdPRKHbv4sSkN3SY3fULJWehJ7fkjHSr1AhfCUyggZ9KF2KJqrvToBrx5tMOT0ZLP2CFexPcSB8dlQP/uwsWBW5YJJt4H+wBK0ZhwgYVHfQwxku6tJw4/f/wnTDpVKBdI2/HO358EZ/cVnCpPP/mdTEF9qbo78ZjNFD0o9sTu3VaUps/apcXOikbyutLISV4Pu5x64zxixyvHB7N4QSreLWs/wgV6dxK18CIuXGOB2Wh1uivTf56M9oP230xqe2tk+2zueO9MALFdFbHhtHbYtA3JGy/Z0O1cOXgnOaufyfdhrz42RX/7xcwGLTJOnCV0kWSecSYyBRUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 09:34:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::da58:a4d0:f616:928]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::da58:a4d0:f616:928%6]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:34:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 8.3.1 -> 8.4.1
Date: Wed, 14 Dec 2022 17:34:40 +0800
Message-Id: <20221214093440.1187290-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0204.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 725ead08-85b9-488a-9d67-08daddb67385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aJ0pIUsA8EdjmFkMMBVdXa3jOeLEwc5ADeoRUDK0UGBW3kr47lnKHOoqDUOxn7Md4y/F7C10F+W6lZV7b9AJH0tnZdBS+3An3fTGOoEx2CRKCtuu1dS/1iPzO74Z7/a2V2h+vSjT/nt/4JcSvqJbUCHmVhH34RedOeXHAzGEbo1sPGYu5id4hXWAmgL9g4LttWItVfh5gNEAAIF0Mc4iMMwDh+rlWjCVmEVwPgkDJomSvN6E7uFavnMr03lSDYBZ0ECMcmqe6n2Ij6vfyxr/5G8vMEEz9kZKe/KsymBkUDC9clAh9yA8uyv3NIshG7BA8xwkcMqnA7BsizMMb8kuB9lWpA5oqr7J4CD5il/qCPMrhF9oLrcvx95IiYz4N89MPeoyyNY6zPewjLC13ZLWtvIzZKrbqaadi0ZUw8H+D7sWznqgN6p2BuXq8iE3urgfRbBdukkRr4M7SohxFUvjrhXO3vQWLkV8OuOmCO4oGfsWIBMg/QSYBGYuyTbn5DEsp36AOSTzi1DJmTOveCYz6z4hMrzSsoxoASBDgHnPQjLes+bXEnONgUCK3NiNmw72xHHcpvyB+05CARADn5zHj3f4JJ++HoZHl6u+ysfjuzDix7TawET8NA+U2PNMPoeA6t2xrKTNkvlCkYn7QFbigw6lqySySTPH2UsrGau3QB9yKzORJtsHVvUZNVKtXnIOkYOmm2yg/tiKMNr9bgNOf0eqC/+bhKEHa6CmAQb38sYvTtHDi+ZsN8s+MhIcEZ4Alc13W+qjA9wt6vwXJr1Vkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(39850400004)(396003)(451199015)(66946007)(66556008)(41300700001)(8676002)(66476007)(5660300002)(316002)(2906002)(8936002)(6512007)(26005)(52116002)(53546011)(6506007)(186003)(6916009)(6486002)(966005)(6666004)(478600001)(86362001)(83380400001)(2616005)(1076003)(38350700002)(36756003)(38100700002)(44832011)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MGPirTHyYpYdA8JLgYCtNdMKzKopkt1Bdydwd8IJ2gO5reeN6ySHc5TVfKRR?=
 =?us-ascii?Q?BBwhKapZrTqY8P/DtQwJhdigA5QSLindvqRwzIYOJQeWKv6AkHVCjU08kBfQ?=
 =?us-ascii?Q?zFam43JUUIf0MO8JQIJrHSB1aoooR4XnFO4ONwaKPn6kh30d70NDTuiWHihA?=
 =?us-ascii?Q?Wm6nadTfFwN8UKDWzr7UBe061l5VWMZK3DKVnZFGLeosQ79OElGkprmMY1M8?=
 =?us-ascii?Q?Jyy/sA4wzOZaECD/Hr8cUJCJhLFvA6z+3ravEd63SRZm0xtqnXh9jJJRmIPl?=
 =?us-ascii?Q?sm+rZ2O6HaBkGWqUgoQ0Ewoogxoh1DwNM5SngWWzUcbrqFFYtK+SZDaH3UYd?=
 =?us-ascii?Q?yxKeBNFvjzrNZzB/cTTSHxWFk2Go4yHBQtcqQgnicYmNM+NHGjGVLY5e4nlk?=
 =?us-ascii?Q?BnMTkT2kysnmgXgKLPvv9pjSbVxYZiYYmadgIny751O1969GlCa9JPpAz7om?=
 =?us-ascii?Q?jsfRZpC7S7SONDo7poOZYiyj1Gbh8YDzX1vT9yc0+DRRkK6gb5Dc4ssnFDHH?=
 =?us-ascii?Q?R60wYZkIL6A0NZ9nME4bnjCuvyWGiyTvg1zVbVxqeiAgCXALnBUYSSTzB3Q2?=
 =?us-ascii?Q?KZlTeCUGT83aNnBVLRcZRm5dVCJ090fcbUy/244VWle9gJXBVp37YvAvNwh1?=
 =?us-ascii?Q?gi+ZF2xXafmDpvCd20eL9F6o3+O+wnG99N1vHe1qicJibj5Wsd9jYe8Vq7DR?=
 =?us-ascii?Q?HiczsHtc0iDaef/ndQbXecWUpURbZ+V3+qj6bhpWGsOU976t/t11F9JK6HJa?=
 =?us-ascii?Q?s+P+Ir/bwNMaV6ZwAp8DEZONfEhD4B5JJAB9+oS6ugHaWSmWNo2KPbNr54eB?=
 =?us-ascii?Q?hvIlKYMx1/MN5zoXLGaN4F+dqvOOeRMCzvbSFemRjpMuhTqPcDvfqOx2v6Gc?=
 =?us-ascii?Q?KbgaLY6o77ta/Sfgb6K6FlZ+fxiwmxC6hAYiWchy2CFQf5A8LfHJOlnQ08bu?=
 =?us-ascii?Q?ykzyP3WB5+uMkZDgTOSRSCryoHEuwpA5N9CruT3GbiCKn0GMHb6ASi/HldEX?=
 =?us-ascii?Q?ebqyRQf//HXfaz97bjQGNpRUXJXXNKP64ihVCBzVw1OmgviLkaDGA5RQLnHH?=
 =?us-ascii?Q?5iWOV6URwU86g7HETolKyi74nCSdZbiZiaIfFqTodw4BM5/tyZw/0xDwDxGK?=
 =?us-ascii?Q?lWuMDmS7L5E9r6nTr56IzidWgrXoGKHitjhvuv549dKFRPGreMJknf/KR4El?=
 =?us-ascii?Q?4sygeHaXjOY1Y3EtoUQX0UpQdvssGFy6Bbmf2NheNLxaEYjtr6FM1XexSpXt?=
 =?us-ascii?Q?5B1Ked5SFBokUMhCLQQxyiehHEK8WWm8dK5EoKlR72smO5KgYZWmcj4ETjoS?=
 =?us-ascii?Q?uzLTFbWg6gpTUmorpLRVsyOf15tfinklfRu6YMVdxlHvo9ti7TfqY8Lcdzjk?=
 =?us-ascii?Q?RHd735GVf7VW9bcYtTPWKJJmyFfmZjs2+Jockz5nHLDDRVjbnAEsQ0MVmrWF?=
 =?us-ascii?Q?abDNHGSui39C9GgWOEsSeujsto9PesRJ+BorZq9X9hxq7fROxrSiTaJzhKM9?=
 =?us-ascii?Q?+E1HhWIVxB6BNejV/WYGi15hQ+vQz0EQGKLeaFqx6WmUT/b72qiirojWZRlt?=
 =?us-ascii?Q?F6gqTpaNlXRWlMXW5VEE4kQEWSK3uTISqMeqlCxQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725ead08-85b9-488a-9d67-08daddb67385
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:34:51.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boh8K2nklaLq2c/LchcKis/hWNEn8CpuElkLttXnLSZTamZRMzQ4HmNHPhBDMVAIANvdgAhacVGPU7gMFw/T+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
X-Proofpoint-GUID: UUYTdwyUcQO8eVhYU7EoQ0vz_M2sV_Nr
X-Proofpoint-ORIG-GUID: UUYTdwyUcQO8eVhYU7EoQ0vz_M2sV_Nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212140074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 09:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100076

Drop backport patches.

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-8.4.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...dr-length-is-at-a-minimum-of-what-is.patch |  43 -----
 ...fy-race-between-io-and-main-pthreads.patch | 151 ------------------
 ...for-readline-function-instead-of-mai.patch |  32 ----
 ...check-for-python-x.y-emded.pc-not-py.patch |   9 +-
 ...UPPORT_OSPF_API-define-in-ospf_spf.c.patch |  48 ------
 .../frr/{frr_8.3.1.bb => frr_8.4.1.bb}        |   8 +-
 6 files changed, 9 insertions(+), 282 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
 rename meta-networking/recipes-protocols/frr/{frr_8.3.1.bb => frr_8.4.1.bb} (92%)

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch
deleted file mode 100644
index 52b39c1e8..000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 066770ac1c69ee5b484bb82581b22ad0423b004d Mon Sep 17 00:00:00 2001
-From: Donald Sharp <sharpd@nvidia.com>
-Date: Thu, 21 Jul 2022 08:11:58 -0400
-Subject: [PATCH] bgpd: Make sure hdr length is at a minimum of what is
- expected
-
-Ensure that if the capability length specified is enough data.
-
-Signed-off-by: Donald Sharp <sharpd@nvidia.com>
-(cherry picked from commit ff6db1027f8f36df657ff2e5ea167773752537ed)
-
-CVE: CVE-2022-37032
-
-Upstream-Status: Backport
-[https://github.com/FRRouting/frr/commit/066770ac1c69ee5b484bb82581b22ad0423b004d]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- bgpd/bgp_packet.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index 7613ccc7d..a5f065a15 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -2621,6 +2621,14 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 				"%s CAPABILITY has action: %d, code: %u, length %u",
- 				peer->host, action, hdr->code, hdr->length);
- 
-+		if (hdr->length < sizeof(struct capability_mp_data)) {
-+			zlog_info(
-+				"%pBP Capability structure is not properly filled out, expected at least %zu bytes but header length specified is %d",
-+				peer, sizeof(struct capability_mp_data),
-+				hdr->length);
-+			return BGP_Stop;
-+		}
-+
- 		/* Capability length check. */
- 		if ((pnt + hdr->length + 3) > end) {
- 			zlog_info("%s Capability length error", peer->host);
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
deleted file mode 100644
index 40284d6f4..000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 71ca5b09bc71e8cbe38177cf41e83fe164e52eee Mon Sep 17 00:00:00 2001
-From: Mark Stapp <mstapp@nvidia.com>
-Date: Thu, 8 Sep 2022 16:14:36 -0400
-Subject: [PATCH] bgpd: avoid notify race between io and main pthreads
-
-The "bgp_notify_" apis in bgp_packet.c generate a notification
-to a peer, usually during error handling. The io pthread wants
-to send notifications in a couple of cases during early
-received-packet validation - but the existing api interacts
-with the peer struct itself, and that's not safe.
-
-Add a new api for use by the io pthread, and adjust the main
-notify api so that it can avoid touching the peer struct.
-
-Signed-off-by: Mark Stapp <mstapp@nvidia.com>
-
-CVE: CVE-2022-37035
-
-Upstream-Status: Backport
-[https://github.com/FRRouting/frr/commit/71ca5b09bc71e8cbe38177cf41e83fe164e52eee]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- bgpd/bgp_io.c     | 17 ++++++++---------
- bgpd/bgp_packet.c | 32 ++++++++++++++++++++++++++++----
- bgpd/bgp_packet.h |  2 ++
- 3 files changed, 38 insertions(+), 13 deletions(-)
-
-diff --git a/bgpd/bgp_io.c b/bgpd/bgp_io.c
-index 7af1fae28..f9bb8d518 100644
---- a/bgpd/bgp_io.c
-+++ b/bgpd/bgp_io.c
-@@ -37,7 +37,7 @@
- #include "bgpd/bgp_debug.h"	// for bgp_debug_neighbor_events, bgp_type_str
- #include "bgpd/bgp_errors.h"	// for expanded error reference information
- #include "bgpd/bgp_fsm.h"	// for BGP_EVENT_ADD, bgp_event
--#include "bgpd/bgp_packet.h"	// for bgp_notify_send_with_data, bgp_notify...
-+#include "bgpd/bgp_packet.h"	// for bgp_notify_io_invalid...
- #include "bgpd/bgp_trace.h"	// for frrtraces
- #include "bgpd/bgpd.h"		// for peer, BGP_MARKER_SIZE, bgp_master, bm
- /* clang-format on */
-@@ -526,8 +526,8 @@ static bool validate_header(struct peer *peer)
- 		return false;
- 
- 	if (memcmp(m_correct, m_rx, BGP_MARKER_SIZE) != 0) {
--		bgp_notify_send(peer, BGP_NOTIFY_HEADER_ERR,
--				BGP_NOTIFY_HEADER_NOT_SYNC);
-+		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
-+				      BGP_NOTIFY_HEADER_NOT_SYNC, NULL, 0);
- 		return false;
- 	}
- 
-@@ -547,9 +547,8 @@ static bool validate_header(struct peer *peer)
- 			zlog_debug("%s unknown message type 0x%02x", peer->host,
- 				   type);
- 
--		bgp_notify_send_with_data(peer, BGP_NOTIFY_HEADER_ERR,
--					  BGP_NOTIFY_HEADER_BAD_MESTYPE, &type,
--					  1);
-+		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
-+				      BGP_NOTIFY_HEADER_BAD_MESTYPE, &type, 1);
- 		return false;
- 	}
- 
-@@ -574,9 +573,9 @@ static bool validate_header(struct peer *peer)
- 
- 		uint16_t nsize = htons(size);
- 
--		bgp_notify_send_with_data(peer, BGP_NOTIFY_HEADER_ERR,
--					  BGP_NOTIFY_HEADER_BAD_MESLEN,
--					  (unsigned char *)&nsize, 2);
-+		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
-+				      BGP_NOTIFY_HEADER_BAD_MESLEN,
-+				      (unsigned char *)&nsize, 2);
- 		return false;
- 	}
- 
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index 7daac4494..90695219a 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -871,8 +871,9 @@ bool bgp_notify_received_hard_reset(struct peer *peer, uint8_t code,
-  * @param data      Data portion
-  * @param datalen   length of data portion
-  */
--void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
--			       uint8_t sub_code, uint8_t *data, size_t datalen)
-+static void bgp_notify_send_internal(struct peer *peer, uint8_t code,
-+				     uint8_t sub_code, uint8_t *data,
-+				     size_t datalen, bool use_curr)
- {
- 	struct stream *s;
- 	bool hard_reset = bgp_notify_send_hard_reset(peer, code, sub_code);
-@@ -917,8 +918,11 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
- 	 * If possible, store last packet for debugging purposes. This check is
- 	 * in place because we are sometimes called with a doppelganger peer,
- 	 * who tends to have a plethora of fields nulled out.
-+	 *
-+	 * Some callers should not attempt this - the io pthread for example
-+	 * should not touch internals of the peer struct.
- 	 */
--	if (peer->curr) {
-+	if (use_curr && peer->curr) {
- 		size_t packetsize = stream_get_endp(peer->curr);
- 		assert(packetsize <= peer->max_packet_size);
- 		memcpy(peer->last_reset_cause, peer->curr->data, packetsize);
-@@ -1001,7 +1005,27 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
-  */
- void bgp_notify_send(struct peer *peer, uint8_t code, uint8_t sub_code)
- {
--	bgp_notify_send_with_data(peer, code, sub_code, NULL, 0);
-+	bgp_notify_send_internal(peer, code, sub_code, NULL, 0, true);
-+}
-+
-+/*
-+ * Enqueue notification; called from the main pthread, peer object access is ok.
-+ */
-+void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
-+			       uint8_t sub_code, uint8_t *data, size_t datalen)
-+{
-+	bgp_notify_send_internal(peer, code, sub_code, data, datalen, true);
-+}
-+
-+/*
-+ * For use by the io pthread, queueing a notification but avoiding access to
-+ * the peer object.
-+ */
-+void bgp_notify_io_invalid(struct peer *peer, uint8_t code, uint8_t sub_code,
-+			   uint8_t *data, size_t datalen)
-+{
-+	/* Avoid touching the peer object */
-+	bgp_notify_send_internal(peer, code, sub_code, data, datalen, false);
- }
- 
- /*
-diff --git a/bgpd/bgp_packet.h b/bgpd/bgp_packet.h
-index a0eb579db..9f6d772bc 100644
---- a/bgpd/bgp_packet.h
-+++ b/bgpd/bgp_packet.h
-@@ -62,6 +62,8 @@ extern void bgp_open_send(struct peer *);
- extern void bgp_notify_send(struct peer *, uint8_t, uint8_t);
- extern void bgp_notify_send_with_data(struct peer *, uint8_t, uint8_t,
- 				      uint8_t *, size_t);
-+void bgp_notify_io_invalid(struct peer *peer, uint8_t code, uint8_t sub_code,
-+			   uint8_t *data, size_t datalen);
- extern void bgp_route_refresh_send(struct peer *peer, afi_t afi, safi_t safi,
- 				   uint8_t orf_type, uint8_t when_to_refresh,
- 				   int remove, uint8_t subtype);
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
deleted file mode 100644
index 20e847223..000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9399d58c13257849179d3c2b3698a2b43bc1b2a0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 10:39:23 -0700
-Subject: [PATCH] configure: Check for readline() function instead of main
-
-main is not a function found in libreadline, its better to check for a
-function thats provided by it.
-
-Upstream-Status: Backport
-[https://github.com/FRRouting/frr/commit/9399d58c13257849179d3c2b3698a2b43bc1b2a0]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b7e17d356..8c1fab0ea 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1372,7 +1372,7 @@ case "${enable_vtysh}" in
-   AC_DEFINE([VTYSH], [1], [VTY shell])
- 
-   prev_libs="$LIBS"
--  AC_CHECK_LIB([readline], [main], [
-+  AC_CHECK_LIB([readline], [readline], [
-     LIBREADLINE="-lreadline"
-   ], [
-     dnl readline failed - it might be incorrectly linked and missing its
--- 
-2.37.3
-
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch b/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch
index 9e5cfd8f5..872a67c78 100644
--- a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch
+++ b/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch
@@ -1,4 +1,4 @@
-From 6a2984718d7c47612b07be46d663e7b5e5b7c57d Mon Sep 17 00:00:00 2001
+From a82d704b1ec6ece47b01d12e0e067d4b62b10894 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 9 Nov 2022 20:24:45 +0100
 Subject: [PATCH] m4/ax_python.m4: check for python-x.y-emded.pc, not
@@ -7,7 +7,9 @@ Subject: [PATCH] m4/ax_python.m4: check for python-x.y-emded.pc, not
 Only the embed version includes necessary linker flags to link
 with libpython.
 
-Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/12298]
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/a82d704b1ec6ece47b01d12e0e067d4b62b10894]
+
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  m4/ax_python.m4 | 2 +-
@@ -26,3 +28,6 @@ index 91d12b99b..f5e603b96 100644
      pkg="${pkg%-}"
      _PKG_CONFIG([PYTHON_CFLAGS], [cflags], [${pkg}])
      _PKG_CONFIG([PYTHON_LIBS], [libs], [${pkg}])
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch b/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
deleted file mode 100644
index 09988946b..000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ec3bb054c331f9d928ac21a1747e0f921b51dfbc Mon Sep 17 00:00:00 2001
-From: Michal Ruprich <michalruprich@gmail.com>
-Date: Tue, 6 Sep 2022 12:25:01 +0200
-Subject: [PATCH] ospfd: Adding SUPPORT_OSPF_API define in ospf_spf.c
-
-It is not possible to build ospf_spf.c file with --disable-ospfapi because
-ospf_apiserver.c has SUPPORT_OSPF_API around all function definitions and
-that results in an undefined reference to the ospf_apiserver_notify_reachable
-function error while building.
-
-Signed-off-by: Michal Ruprich <mruprich@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/FRRouting/frr/commit/ec3bb054c331f9d928ac21a1747e0f921b51dfbc]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ospfd/ospf_spf.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/ospfd/ospf_spf.c b/ospfd/ospf_spf.c
-index 46492ff6b..4edc1de81 100644
---- a/ospfd/ospf_spf.c
-+++ b/ospfd/ospf_spf.c
-@@ -48,7 +48,10 @@
- #include "ospfd/ospf_sr.h"
- #include "ospfd/ospf_ti_lfa.h"
- #include "ospfd/ospf_errors.h"
-+
-+#ifdef SUPPORT_OSPF_API
- #include "ospfd/ospf_apiserver.h"
-+#endif
- 
- /* Variables to ensure a SPF scheduled log message is printed only once */
- 
-@@ -1895,7 +1898,9 @@ static void ospf_spf_calculate_schedule_worker(struct thread *thread)
- 	/* Update all routers routing table */
- 	ospf->oall_rtrs = ospf->all_rtrs;
- 	ospf->all_rtrs = all_rtrs;
-+#ifdef SUPPORT_OSPF_API
- 	ospf_apiserver_notify_reachable(ospf->oall_rtrs, ospf->all_rtrs);
-+#endif
- 
- 	/* Free old ABR/ASBR routing table */
- 	if (ospf->old_rtrs)
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr_8.3.1.bb b/meta-networking/recipes-protocols/frr/frr_8.4.1.bb
similarity index 92%
rename from meta-networking/recipes-protocols/frr/frr_8.3.1.bb
rename to meta-networking/recipes-protocols/frr/frr_8.4.1.bb
index 67d50e3ed..d3c86e7d7 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.1.bb
@@ -9,16 +9,12 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.3 \
-           file://0001-configure-Check-for-readline-function-instead-of-mai.patch \
-           file://0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch \
-           file://0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch \
-           file://0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
            file://frr.pam \
            file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch \
            "
 
-SRCREV = "a74f7a9ad9623e6f9654fe4a7177e5da0b194828"
+SRCREV = "70151e264bbb697a10fed711aa8c937d4f0009b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


