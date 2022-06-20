Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA53C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 08:48:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17645.1655714934997869101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IeetiSh3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31700bd967=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25K8Mrck029979
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=K9KcYCf1LpcqaVLuEPXJK07NDFcgJ1QysGwK2M4cBrk=;
 b=IeetiSh3RyTQxfJCZbJp+smEJtDqss1uai4l2qxjn/ifBgy8tZ8El2aBlgDmL+CQYK/g
 ESugeS3sVwLZFwbX6gg3bfvmbrg7TZtiGJZenfLPuKbm4mrEvxE/mnHE7YIzHyXaTnZJ
 64jZ2xv2jswF7dycUSP9gEhIDG6eeKjaMnA/6NcNG1S0y4QVDWI52IzvCTbL1DA+6rGY
 SU8dhw7N2PxRELToxSSaED3ZTF0PEwozzFMno7NidpFUvpNtrYze6RqF99xh5HQlL4Ws
 NksxeHnyJpa/WwSi+K7nGMGa+WEEPSnSCf8Bw4IjbdSvI/2EFSOzdKCbZxhitiQ5t793 +w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gs3x19a1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBHe4lPdVgfSAlSCFSXwvb0ou5ybikkcaZKI2KWmLCc4SIFNO0JkYAAQOeGSFImSWUH5+u8yUdadOyDo77PIbukTjSq9596Vhn5CRoheZ+/vbLcInXoxspWDfQzaAGVbLYf0njlSjDbKyu7NUs7uILAB1h9Eq6zKdGwd0jiOLh8eCkBUkIzGAp/0SjfjAaajpVGofswWNPKsscuvZwbjj1hI+2KoLCl/g/yc2BupUTqa4RLV1NuxNU62tWH9oiIGS5F4w0t/CRbfU8Ia5H9Z96nkp9LNIKRLOaz9sXaOD1Q9ex0pOab9WD5XnlI1Jwp7griRQnohmvKFWQljZQO45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9KcYCf1LpcqaVLuEPXJK07NDFcgJ1QysGwK2M4cBrk=;
 b=mdoNI+YvkGjuCqw63ClDZ+0o/Yg37nOfW7VQkN/btw8sWzr6Yu+LPRP0NUPDV8pQhtwDeBWHG20LFf6bQ+efwjs9O/Yl936o+1iNyCB2v7Exq7lV3CPTy3vX09zI8afZkDeEt9beCokJmBGtAf0lBfrbKblDQZNUXXT9kIbwZPVFSYXyjnLBZG6foCzsE4wJmTN9YUTlT9ucbac2Y8/3H6+FjiqxR7uxYr0ydZM32JHUAN1+lwLyzdXxOcMsTv4mcwPqimnToIKoeZTpW/3KyxIWTUi017U6fAnk3gJdMb+Nwpi9pdDHjgczn4bfIrjnWBJogZk4XG+VU+iMaFhitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by BL0PR11MB2913.namprd11.prod.outlook.com (2603:10b6:208:79::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 08:48:51 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 08:48:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][master][kirkstone] dnsmasq: Security fix CVE-2022-0934
Date: Mon, 20 Jun 2022 16:48:39 +0800
Message-Id: <20220620084839.273934-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ab8578-f339-493f-0511-08da5299b333
X-MS-TrafficTypeDiagnostic: BL0PR11MB2913:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB2913A42B0612ECCD8ACF9B6FF9B09@BL0PR11MB2913.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LScYzA7SUdBYRw/b+OpfH14VBy3UIc2YqxTSjEcb2uFe+Iz5acv55ndHkpw93SPYpzjeAmIvQ80S0otG54aqLvPpaWN/J9vwUYNdG83hV0ULHv8mgwaJvI06FCLImqe3diQpwsRMroA6wbcC4pL2b89CAsU5EJtwSf61BJH/nPjkHWiasrigJUZY9rPe+fRl+mSrLdYQhiyuUl2NE3xLDYgx40yGuzlB7/0hfLt4BMFxnXK2r1lbEb84oJdj85Ycz9sHw1Z5ZQCnDytX+ajzH8x10bwr5N/1SOUy7iWwld92IpS5qFrVcvhqpy9VkL46is3d7MPPruejQHYmqee246W8oW/N+Y+bv94yEWsqMbz+pS3VniVxqF5TA3kJfsoAV72jnU5F8CZE08OV032Qan2BvLSGJle4YPkAliN5KsXxwtKBkhjuF11kDtRcqIyJsj0s0TMsFne2ahD7LfmNdrpqg7rMaj/V752DYB9KFsYSDBHyRT/QGOojHQTOQdOzXdH8wFlPIkOOtSgTzLlabfmfg5BxFjk2oGqRD47BjtPtZrVavDRZ3v8sHTBonCxkoax3FItEgsQiX3RSeIbZk/xnMwxpN77xhRSvgONGBuUVLiAyoG+0O+EWS31Rq4c7NKnztOHICWGcqy/yqq2F0kqQK3jqQyd3xC+GDvyXWWEhlHvM1YiLiZAS4gm98bRHuF6q3TNTPvyWtKkUUWGC0qJ2RO1usYyn4ow9gxeSTN9z4MkYC+n6sXEYw/36oQmxuu6GNLJua1uBXnF0cyIeKLdIzcDwGtkSG75lZCROcIU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(52116002)(6506007)(6666004)(26005)(6512007)(15650500001)(186003)(1076003)(38350700002)(38100700002)(2616005)(86362001)(8936002)(83380400001)(36756003)(498600001)(6486002)(966005)(44832011)(5660300002)(66476007)(316002)(66946007)(8676002)(2906002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LNO0JSRT/8Ba678yxMFMEib9MlNnI5vzLcOgcv1I2MjLO1AnKHCtu/KZwcdZ?=
 =?us-ascii?Q?dcDSBFIRSmtFRZCBIyDuGZw9927aGWvpxhg8Unih5xKzMErGOMAVYLYRapuZ?=
 =?us-ascii?Q?iqaSNIiWTaPn9u4x8NnriJT/kcNglV8EwuAa5LfbNYUXW6MfyY1x6RJuG/1W?=
 =?us-ascii?Q?taFz9Yn71XBGW8NXXt/rk7GM6rkptDS3o/QgBcnqYC+ZY57CQxNLun0EiBQo?=
 =?us-ascii?Q?/hznsLb3HWV3A8neHJ9m5Dx5AS6XwmPn12zViO42+1YIIwj7QL0J+tS1VX7e?=
 =?us-ascii?Q?AtKDexHK3nZibHHxtrpX8nRG0KUSs3h6UnjhRuhxG6OsIyUyRFl9Ax0DDF/c?=
 =?us-ascii?Q?3rcO2R9U8cEfm5DgltfFCjOYLfSMvb52fxiHtGbQpeJ7+v57lejRhh8JAzQq?=
 =?us-ascii?Q?M0k+KFacymXWfcOlPJuubeav7WeGBWLgnb8mjbcEid+YC7HeVUzmCg7zgiMG?=
 =?us-ascii?Q?cvGsRrcAmMq6EPoGjiP39Uc0iYWCzLVg81FTeTFSgoVzB02vmIqvgFUmE8eJ?=
 =?us-ascii?Q?DS67e4BJDATAA0UZcdeJbZeYALMRlfFTSleEkUq2/sH3lKUTzbr84ONd7Wl4?=
 =?us-ascii?Q?1iaEOUwGlcKx7ZVKQtv2NiPzdmLabTgVo75bsyTHPFR5OWh7+zq9vfF6kJxV?=
 =?us-ascii?Q?RIOzBFM0Hg9+7IvSuCGe3rPEGPhozg5ff1+r0lQ5zUPeV82WeOK4QvL6NTpe?=
 =?us-ascii?Q?x4bCaN2kuhCpjwOrSVPPypYloFNOk/fa/wdc2kLFhPmParxa3G3CEFA4UZ/A?=
 =?us-ascii?Q?T9dhJnnOpdlIxLXgqU2/1xE0F81hQNHAbYaUAr9zv7+xh7N7lOmg3ORPg7th?=
 =?us-ascii?Q?OTAYNVoYg3VS4nUnta/E/WGC7fuU9KqxkRifl8kJ7kOLIOWnfXOuS4g2MJOF?=
 =?us-ascii?Q?gBVCsTeDo51LUh9tT9r8elenmWN3ooQrESzLGQM8x7gFMCeXZEc0vdPReKdb?=
 =?us-ascii?Q?TInm+XGoSeWBIyn1g97S8cKArj7IXVohxxhky7KN0l0ea0H7yuzXxMQjQ5mR?=
 =?us-ascii?Q?BI2dpDFuITAEtM5cgHBNP/xH7UU0JQyTgfwC3TYcw7cE1Ark8PV/LD4vzOUQ?=
 =?us-ascii?Q?qZEgj4lL1mqKJ8dZajbZVM7mHLt80aaS9Er2S9uBMsY4VGAX2TvvsDwQP7Hr?=
 =?us-ascii?Q?GjkWjtbVgPDmH2YM1SQzQaFwua8lP90QvWAhfWPZFgu2cfenvd+svw//eYV9?=
 =?us-ascii?Q?LR/fC5WCao/mdN9Ry+rYqDvnyMPum38dxDBLCEYzGzz2/ln+JpxHb18f2g2N?=
 =?us-ascii?Q?SR3pOHsbzcl43+jHYpOUDuwoGu+PM+pPyXdSM4d7n3aZ5SBjjdaO9t8zKjJb?=
 =?us-ascii?Q?vcRwq5aMiplbqip3cyKV2Qvu2dEl5FtVfrZW1M52Yn43WTZQMdffTx+/HMsW?=
 =?us-ascii?Q?MsWWAT2xDz4hJpPOixlq509lHTC//sS3SAlhzQUlMUQA+niBQ0sDBhffoVa6?=
 =?us-ascii?Q?AhBq965yTPGz/AiE9SipSqLn3YDsj5J2HOho8AMsNKM7F4YK7mvWVlqeBEEw?=
 =?us-ascii?Q?OOgNYQ2KV+oPtOrzzV09pjoN/BWbj4HkXsxDmddrvL0ouar+T9rDtI6JY7Ya?=
 =?us-ascii?Q?Dryr+Q1H0TGRYzTqWn0eOTJ0JUqoqvbCnLpAfHltEq2udMARBw1nv71xhyGT?=
 =?us-ascii?Q?2810L0o0+SWnGJ/mTjduUWmakfkW0ByArsCjaoyV5VTlXKJMLbHSaxbNk2cs?=
 =?us-ascii?Q?uHsEcKyLBkxbMA4f270aj2H98AIUA82tMdQ5AQsNk36eCRM4AUI46AE05gA5?=
 =?us-ascii?Q?jXuFOCFb7A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8ab8578-f339-493f-0511-08da5299b333
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 08:48:51.7928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dyAroG5JfFqOQidZi6O46ZWYMCbaCZkpUUblT/mHP1i+uly2vqLJ0WkKiLLO0OqfkP+GVh+Ci0yHr7Ihb8u2sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2913
X-Proofpoint-GUID: vnZ3brRCrpxU-HCMQiL4LRS63EWfu3nB
X-Proofpoint-ORIG-GUID: vnZ3brRCrpxU-HCMQiL4LRS63EWfu3nB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206200041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jun 2022 08:48:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97547

CVE-2022-0934:
Heap use after free in dhcp6_no_relay

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-0934

Patch from:
https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commitdiff;h=03345ecefe

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dnsmasq/dnsmasq/CVE-2022-0934.patch       | 191 ++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.86.bb   |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
new file mode 100644
index 000000000..6bd734d75
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
@@ -0,0 +1,191 @@
+From 3cdecc159e0f417a2f8d43d99632af26beea630f Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Thu, 31 Mar 2022 21:35:20 +0100
+Subject: [PATCH] Fix write-after-free error in DHCPv6 code. CVE-2022-0934
+ refers.
+
+CVE: CVE-2022-0934
+
+Upstream-Status: Backport
+[https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commitdiff;h=03345ecefe]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CHANGELOG     |  3 +++
+ src/rfc3315.c | 48 +++++++++++++++++++++++++++---------------------
+ 2 files changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 5e54df9..a28da2a 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,4 +1,7 @@
+ version 2.86
++	Fix write-after-free error in DHCPv6 server code.
++	CVE-2022-0934 refers.
++
+ 	Handle DHCPREBIND requests in the DHCPv6 server code.
+ 	Thanks to Aichun Li for spotting this omission, and the initial
+ 	patch.
+diff --git a/src/rfc3315.c b/src/rfc3315.c
+index 5c2ff97..6ecfeeb 100644
+--- a/src/rfc3315.c
++++ b/src/rfc3315.c
+@@ -33,9 +33,9 @@ struct state {
+   unsigned int mac_len, mac_type;
+ };
+ 
+-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz, 
++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz, 
+ 			     struct in6_addr *client_addr, int is_unicast, time_t now);
+-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now);
++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now);
+ static void log6_opts(int nest, unsigned int xid, void *start_opts, void *end_opts);
+ static void log6_packet(struct state *state, char *type, struct in6_addr *addr, char *string);
+ static void log6_quiet(struct state *state, char *type, struct in6_addr *addr, char *string);
+@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_context *context, int interface, char *if
+ }
+ 
+ /* This cost me blood to write, it will probably cost you blood to understand - srk. */
+-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz, 
++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz, 
+ 			     struct in6_addr *client_addr, int is_unicast, time_t now)
+ {
+   void *end = inbuff + sz;
+   void *opts = inbuff + 34;
+-  int msg_type = *((unsigned char *)inbuff);
++  int msg_type = *inbuff;
+   unsigned char *outmsgtypep;
+   void *opt;
+   struct dhcp_vendor *vendor;
+@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
+   return 1;
+ }
+ 
+-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now)
++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now)
+ {
+   void *opt;
+-  int i, o, o1, start_opts;
++  int i, o, o1, start_opts, start_msg;
+   struct dhcp_opt *opt_cfg;
+   struct dhcp_netid *tagif;
+   struct dhcp_config *config = NULL;
+   struct dhcp_netid known_id, iface_id, v6_id;
+-  unsigned char *outmsgtypep;
++  unsigned char outmsgtype;
+   struct dhcp_vendor *vendor;
+   struct dhcp_context *context_tmp;
+   struct dhcp_mac *mac_opt;
+@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+   v6_id.next = state->tags;
+   state->tags = &v6_id;
+ 
+-  /* copy over transaction-id, and save pointer to message type */
+-  if (!(outmsgtypep = put_opt6(inbuff, 4)))
++  start_msg = save_counter(-1);
++  /* copy over transaction-id */
++  if (!put_opt6(inbuff, 4))
+     return 0;
+   start_opts = save_counter(-1);
+-  state->xid = outmsgtypep[3] | outmsgtypep[2] << 8 | outmsgtypep[1] << 16;
+-   
++  state->xid = inbuff[3] | inbuff[2] << 8 | inbuff[1] << 16;
++    
+   /* We're going to be linking tags from all context we use. 
+      mark them as unused so we don't link one twice and break the list */
+   for (context_tmp = state->context; context_tmp; context_tmp = context_tmp->current)
+@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+       (msg_type == DHCP6REQUEST || msg_type == DHCP6RENEW || msg_type == DHCP6RELEASE || msg_type == DHCP6DECLINE))
+     
+     {  
+-      *outmsgtypep = DHCP6REPLY;
++      outmsgtype = DHCP6REPLY;
+       o1 = new_opt6(OPTION6_STATUS_CODE);
+       put_opt6_short(DHCP6USEMULTI);
+       put_opt6_string("Use multicast");
+@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	struct dhcp_netid *solicit_tags;
+ 	struct dhcp_context *c;
+ 	
+-	*outmsgtypep = DHCP6ADVERTISE;
++	outmsgtype = DHCP6ADVERTISE;
+ 	
+ 	if (opt6_find(state->packet_options, state->end, OPTION6_RAPID_COMMIT, 0))
+ 	  {
+-	    *outmsgtypep = DHCP6REPLY;
++	    outmsgtype = DHCP6REPLY;
+ 	    state->lease_allocate = 1;
+ 	    o = new_opt6(OPTION6_RAPID_COMMIT);
+ 	    end_opt6(o);
+@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	int start = save_counter(-1);
+ 
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	state->lease_allocate = 1;
+ 
+ 	log6_quiet(state, "DHCPREQUEST", NULL, ignore ? _("ignored") : NULL);
+@@ -924,7 +925,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	int address_assigned = 0;
+ 
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	
+ 	log6_quiet(state, msg_type == DHCP6RENEW ? "DHCPRENEW" : "DHCPREBIND", NULL, NULL);
+ 
+@@ -1057,7 +1058,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	int good_addr = 0;
+ 
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	
+ 	log6_quiet(state, "DHCPCONFIRM", NULL, NULL);
+ 	
+@@ -1121,7 +1122,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	log6_quiet(state, "DHCPINFORMATION-REQUEST", NULL, ignore ? _("ignored") : state->hostname);
+ 	if (ignore)
+ 	  return 0;
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	tagif = add_options(state, 1);
+ 	break;
+       }
+@@ -1130,7 +1131,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+     case DHCP6RELEASE:
+       {
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 
+ 	log6_quiet(state, "DHCPRELEASE", NULL, NULL);
+ 
+@@ -1195,7 +1196,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+     case DHCP6DECLINE:
+       {
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	
+ 	log6_quiet(state, "DHCPDECLINE", NULL, NULL);
+ 
+@@ -1275,7 +1276,12 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+       }
+ 
+     }
+-  
++
++  /* Fill in the message type. Note that we store the offset,
++     not a direct pointer, since the packet memory may have been 
++     reallocated. */
++  ((unsigned char *)(daemon->outpacket.iov_base))[start_msg] = outmsgtype;
++
+   log_tags(tagif, state->xid);
+   log6_opts(0, state->xid, daemon->outpacket.iov_base + start_opts, daemon->outpacket.iov_base + save_counter(-1));
+   
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
index 31ca51ec6..0f7880ce8 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
@@ -3,5 +3,6 @@ require dnsmasq.inc
 SRC_URI[dnsmasq-2.86.sha256sum] = "ef15f608a83ee2b1d1d2c1f11d089a7e0ac401ffb0991de73fc01ce5f290e512"
 SRC_URI += "\
     file://lua.patch \
+    file://CVE-2022-0934.patch \
 "
 
-- 
2.25.1


