Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9EACD68FF
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 08:09:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.85896.1696925388574540856
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 01:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Mi5vSoMa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86479ee0b4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39A5lv6g006008
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 01:09:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3+5oQ6X0PsFjvw/zCe6qsBwJOqQ13Ot5tyvCxBde1Y8=; b=
	Mi5vSoMaYBxHy563ykd1sBJSJjOJN05VgCy5NFUQ/Vwu9J18ITTKW41A4nqbGLlZ
	koTm+jOoBiwLdXicdb7W2IMW21X7EM954IgfnhDMvtGgUrpglNPOhnheLd8a+3wO
	P0hILo/QdJdrGVdSoB8q2JHCtt/1Sa1ES8nOjuON7MKL0VyTAgayu0N3q711MagI
	pbhB4C8YoknHHEvuO59c848ZNt6aKy5Tki4bSAhkcfpzZ1tLk/5EAkRDQo/vbDZp
	qI4OIpi+8/EcXc3Swf3ueDP0FqxlAadwRNQ0ov7LR9hubeRGrZhDeDU332+3OiAg
	gjpOM8pZZhyRF0kxRQtanQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tk2m0jatx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 01:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DraUOXzLbBsOfc0ZBOAyzz/UDj7o0/VfSY5jZ6v3IC4I3cZSa4GPmIscntgFu9RkvWhG94Stxemkb8nZoo+zY36ONwtOgK98+W4vPrjBzaJKSFvsLb2mfkHxQuQiFIZj/xrWd25vWCQuYf3bQWEhbUp3mZa5GcvG36nYXRio9wchRq0XkemARe9UFUukKXh44VNMrc9x/nf+carLvY8nP0oGYVzXVT4919n7r+VMnv6cC5DeI8b/p5nCp/M+vmYZmgtKqFd6azije4DswRVSi6O270dZilBswA3wEchikNXqeRG6aiiwDh3zQ4Rzi74VMP7QMUeDtHeVJKcrqg/Gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+5oQ6X0PsFjvw/zCe6qsBwJOqQ13Ot5tyvCxBde1Y8=;
 b=SVwVwk+89Y6BWEv1wLxLBkhi/1iRA3qo+JCB0Sz09XDOgvO80vjM5I24Dtg6gRJ286+QNJHqqw8Co6DCv/ZI/5Zi6rqhYLpSynVV1wmqxsozuWTbMPBrfEl15K5V4KSyc4Xwm1pdErLR6osvXEUh6wu+SDS/cz6XwsRX4pzHGaiKEkk+W+3gLnJnVoILH6TlmnUw5ztFM0bj/9lF8ylJbbweqtgnM3/Slt2D1wn1rAQRcel3N/PRBsIOqr9A20WeHjiiQX5Bj5ZYI1nP126C2q5cU7Eb9vDgKzSP6S8wRpUAW3sX/ctX2us+D0YpzZ13troe8x0IgBFgTUClACgd4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 08:09:46 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 08:09:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [mickledore][meta-networking][PATCH 2/2] frr: Security fix CVE-2023-38802
Date: Tue, 10 Oct 2023 16:09:33 +0800
Message-Id: <20231010080933.344216-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010080933.344216-1-yi.zhao@windriver.com>
References: <20231010080933.344216-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 485e6227-fc00-4a36-5d4c-08dbc968445b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DAFSNf8NpY1RRqLwCMfFXxVomou0QTEiXRqZO8BbdXfzUB0FI000pjkSQrxiGraNkTobKJYt2xE/2ENb8oKB+lKoNSSvuWiSybGjgMq3hU8K3xQXm1W12BiFVA7mv2lnTAq9gYblknNSn7JURJ3Ft0hmDxrnwq9r5ncOOySJGt59WJYSLzrXVc7JKrlbj1rY6FIVzhpHb+QARo76qYRP14wZV6CVHhTPDWJeyCiqpTdvxeIoG7LQrpHrkNH/PGXZjSxBhtI2d0N/maQtnwcITUk/2e7IrK2lyF+9JqkeJ9k9arGTl3OONElJdQlkg+dDdGczrAUn9JBu486Kj4HEqTVSBrd9ZldpN7Ee3+oqfsPW705McebL7kLdLFfqLK/mPwzs1THKLsxaf6uqw3MsUZAwmtmbbfnKc3lANMNjjIhktB4EcPv0/NGcX1/Jk4S91196TI42jwfuoHYNoKChqJdtz6ThiezLz4TkjD1nAKCydDeGtcnwi9AYDywOqlLK/pN4bsyOzreiTutDyn9z+v1eYKMGqcgpimrZiN5T3rhoQoZhg+4g8qwtVa0Tc7G1kzgH6tux3mPpcHfC+xmlh4Sjc5Req1/uLThXozS1LoE/S2caG65aITC/s56RkGAMaHvMUvCA5LM+ZsE+8A7ibw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(52116002)(1076003)(2616005)(6512007)(36756003)(38100700002)(38350700002)(86362001)(26005)(2906002)(83380400001)(15650500001)(6486002)(966005)(44832011)(6506007)(6666004)(478600001)(8936002)(8676002)(316002)(41300700001)(5660300002)(66946007)(66556008)(6916009)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8oKeIrKukihgg9lwZi7qC911AlMrQMa86ADnNmeyoqd37i4++1MRupkjIhi3?=
 =?us-ascii?Q?qvoXZNbrgbIC6wkCYVKhVBSjO7Q5w0tDBcuDl3ve+FbsqvenlLf3EDRhHG02?=
 =?us-ascii?Q?MxLidM5RJCAx6vC1B4A9kpdP1M8cSy0sQCyO9ski9E4SRSwafnJaUZVJGkBs?=
 =?us-ascii?Q?0Xvc8t8KbsF5SLevD4s2EeRIPPuF81ZeazXCToj31n6YCGoJgKd2wsNmb7Nu?=
 =?us-ascii?Q?6CE9n0zNol5QaKmmgm1WyWw9zUOc/jWP85jXu4RWc8Yh8gpozlGaqUody463?=
 =?us-ascii?Q?4zqYRjbCClMBeXTalr6JIbaNxCNM6N75z1dGB8up4fZoqNmon5GbSaOTmi0Q?=
 =?us-ascii?Q?uKb5fCjLtOv0X1ezKGoO/QS0gU/1GOIciw/IM/C6n9nhKOWJjQwdcHcC9PLV?=
 =?us-ascii?Q?iRhUzebfNxe/DbpUJjoK+AzSZ5PddIcoU2sKtDEh5pHkMjDMqWCbNvGRv2OY?=
 =?us-ascii?Q?72m/9aJhkMhXIX84s8F6iFd/GJkhp0OdPziHRKH5cLyl17i9ln8w7DdKyoR7?=
 =?us-ascii?Q?RtQliYRr72KU2ARD1Vuo4TE131vMCFQ90TCsdXofYT9MjS5zx3Ub1svJTiPG?=
 =?us-ascii?Q?5rRJhDE3smzJGghAdBHe8MeHPmN9rj9u080rlKenyW50pWKrG+Nrj8XqhQTT?=
 =?us-ascii?Q?ruNp3aXycfmbICn1HmTHzhWO+3fiiY4FuZFwpUHCdOWY/buGw1NT94Q/KrVN?=
 =?us-ascii?Q?8pFPa8O8Hd3fiOEmgu3VAx6/L0PEYYO2CL+kW9lHNBwBQKOEIVuQESZuWHDy?=
 =?us-ascii?Q?+Zt1sjUVL73OjZrXyGnhPEdY8miaUlkS1TInS2PJiUOd2qONGI+pn5wxHc68?=
 =?us-ascii?Q?R3zEK/gcJN/ziIfgfLqTWAsASBasM2tOv9WRoKiveB+13hLUo+yN1YjVIZM1?=
 =?us-ascii?Q?tSbs3CLsnjPp1IxJ5GAG5PwLYRM4o3iRQ5su1K+6XPLcOOL/y8JU6jLA9uAa?=
 =?us-ascii?Q?MHBVbX8fHIRjwbZBrEUSBZGZ68C1YHZkwlOWWt3JEIZXZ+r9/2SMHU+G4bVI?=
 =?us-ascii?Q?Ps0IpjlEaQJkQHAPB+5m1WfsECZfyZTlp9ObRCCehk9acr938eLch3ahko9T?=
 =?us-ascii?Q?8/hDyX4RzpEagLCvTbCTzLJI2UVxnlrNXFpa8LXpVJGz/QjRlSqDs1BK9cMR?=
 =?us-ascii?Q?fREXsXObCVhSrRmhD9eZhpb2o9xbpt7n5zpHgfFYPc78B7w2CirsKmuod2pL?=
 =?us-ascii?Q?qNR0vy0Ew2howTO8PwrV+vrACjfUPK0cksfYQC8orzJOZbx76tt/vekdLULI?=
 =?us-ascii?Q?32mrJMfq2Qd+uNpbNjBlJHWtD5DlYlFM4wUa9vV2JB7FatXBldpoWTgOCcBx?=
 =?us-ascii?Q?8AC2GWiaTDCW3JdWMSoTXrrUjO+EHQqxKx4yJcOIHHKMrznLUd2ZsYLqIWyW?=
 =?us-ascii?Q?Hmg1v/BsDsnL9k+0VuFlhzzN9QiAH/0EFVPE0SSNwQAWFuNz7WfG+mfFgNR9?=
 =?us-ascii?Q?fM6MefklnAbFbNnFnQwyMcj4dQB6KCAU0ZRZYwWlusO4wm1tsirR41BKjOeH?=
 =?us-ascii?Q?h9HE/zhLVMkNcH0Yynkh6QnU0NWbHzeifmRcOnUTrGXAfuG5w5yKhNcpJQGP?=
 =?us-ascii?Q?aawioPlz6F18upIpNyNpvxfQUzl5JrWD/BRm7WEF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485e6227-fc00-4a36-5d4c-08dbc968445b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:09:46.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUiGweLNy0LDNGk7OJ/TdaQmIs0gRKr0lWx3OAEgClGbzn2QNzGH++IPCq22PQBmIIMv5Ygeg6CwIggjPkHdNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
X-Proofpoint-GUID: RcYqaB4ccQHytE7JJHA1O6NPHKv3o7az
X-Proofpoint-ORIG-GUID: RcYqaB4ccQHytE7JJHA1O6NPHKv3o7az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310100060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 08:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105395

CVE-2023-38802:
FRRouting FRR 7.5.1 through 9.0 and Pica8 PICOS 4.3.3.2 allow a remote
attacker to cause a denial of service via a crafted BGP update with a
corrupted attribute 23 (Tunnel Encapsulation).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-38802

Patch from:
https://github.com/FRRouting/frr/commit/46817adab03802355c3cce7b753c7a735bdcc5ae

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../frr/frr/CVE-2023-38802.patch              | 139 ++++++++++++++++++
 .../recipes-protocols/frr/frr_8.4.4.bb        |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
new file mode 100644
index 000000000..f9fdacfdb
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
@@ -0,0 +1,139 @@
+From 46817adab03802355c3cce7b753c7a735bdcc5ae Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Thu, 13 Jul 2023 22:32:03 +0300
+Subject: [PATCH] bgpd: Use treat-as-withdraw for tunnel encapsulation
+ attribute
+
+Before this path we used session reset method, which is discouraged by rfc7606.
+
+Handle this as rfc requires.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+(cherry picked from commit bcb6b58d9530173df41d3a3cbc4c600ee0b4b186)
+
+CVE: CVE-2023-38802
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/46817adab03802355c3cce7b753c7a735bdcc5ae]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bgpd/bgp_attr.c | 61 ++++++++++++++++++++-----------------------------
+ 1 file changed, 25 insertions(+), 36 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 058fae23c..1c0803cfd 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -1301,6 +1301,7 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 	case BGP_ATTR_LARGE_COMMUNITIES:
+ 	case BGP_ATTR_ORIGINATOR_ID:
+ 	case BGP_ATTR_CLUSTER_LIST:
++	case BGP_ATTR_ENCAP:
+ 	case BGP_ATTR_OTC:
+ 		return BGP_ATTR_PARSE_WITHDRAW;
+ 	case BGP_ATTR_MP_REACH_NLRI:
+@@ -2434,26 +2435,21 @@ bgp_attr_ipv6_ext_communities(struct bgp_attr_parser_args *args)
+ }
+ 
+ /* Parse Tunnel Encap attribute in an UPDATE */
+-static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+-			  bgp_size_t length, /* IN: attr's length field */
+-			  struct attr *attr, /* IN: caller already allocated */
+-			  uint8_t flag,      /* IN: attr's flags field */
+-			  uint8_t *startp)
++static int bgp_attr_encap(struct bgp_attr_parser_args *args)
+ {
+-	bgp_size_t total;
+ 	uint16_t tunneltype = 0;
+-
+-	total = length + (CHECK_FLAG(flag, BGP_ATTR_FLAG_EXTLEN) ? 4 : 3);
++	struct peer *const peer = args->peer;
++	struct attr *const attr = args->attr;
++	bgp_size_t length = args->length;
++	uint8_t type = args->type;
++	uint8_t flag = args->flags;
+ 
+ 	if (!CHECK_FLAG(flag, BGP_ATTR_FLAG_TRANS)
+ 	    || !CHECK_FLAG(flag, BGP_ATTR_FLAG_OPTIONAL)) {
+-		zlog_info(
+-			"Tunnel Encap attribute flag isn't optional and transitive %d",
+-			flag);
+-		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR,
+-					  BGP_NOTIFY_UPDATE_ATTR_FLAG_ERR,
+-					  startp, total);
+-		return -1;
++		zlog_err("Tunnel Encap attribute flag isn't optional and transitive %d",
++			 flag);
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++					  args->total);
+ 	}
+ 
+ 	if (BGP_ATTR_ENCAP == type) {
+@@ -2461,12 +2457,11 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+ 		uint16_t tlv_length;
+ 
+ 		if (length < 4) {
+-			zlog_info(
++			zlog_err(
+ 				"Tunnel Encap attribute not long enough to contain outer T,L");
+-			bgp_notify_send_with_data(
+-				peer, BGP_NOTIFY_UPDATE_ERR,
+-				BGP_NOTIFY_UPDATE_OPT_ATTR_ERR, startp, total);
+-			return -1;
++			return bgp_attr_malformed(args,
++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++						  args->total);
+ 		}
+ 		tunneltype = stream_getw(BGP_INPUT(peer));
+ 		tlv_length = stream_getw(BGP_INPUT(peer));
+@@ -2496,13 +2491,11 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+ 		}
+ 
+ 		if (sublength > length) {
+-			zlog_info(
+-				"Tunnel Encap attribute sub-tlv length %d exceeds remaining length %d",
+-				sublength, length);
+-			bgp_notify_send_with_data(
+-				peer, BGP_NOTIFY_UPDATE_ERR,
+-				BGP_NOTIFY_UPDATE_OPT_ATTR_ERR, startp, total);
+-			return -1;
++			zlog_err("Tunnel Encap attribute sub-tlv length %d exceeds remaining length %d",
++				 sublength, length);
++			return bgp_attr_malformed(args,
++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++						  args->total);
+ 		}
+ 
+ 		/* alloc and copy sub-tlv */
+@@ -2550,13 +2543,10 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
+ 
+ 	if (length) {
+ 		/* spurious leftover data */
+-		zlog_info(
+-			"Tunnel Encap attribute length is bad: %d leftover octets",
+-			length);
+-		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR,
+-					  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
+-					  startp, total);
+-		return -1;
++		zlog_err("Tunnel Encap attribute length is bad: %d leftover octets",
++			 length);
++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++					  args->total);
+ 	}
+ 
+ 	return 0;
+@@ -3396,8 +3386,7 @@ enum bgp_attr_parse_ret bgp_attr_parse(struct peer *peer, struct attr *attr,
+ 		case BGP_ATTR_VNC:
+ #endif
+ 		case BGP_ATTR_ENCAP:
+-			ret = bgp_attr_encap(type, peer, length, attr, flag,
+-					     startp);
++			ret = bgp_attr_encap(&attr_args);
+ 			break;
+ 		case BGP_ATTR_PREFIX_SID:
+ 			ret = bgp_attr_prefix_sid(&attr_args);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
index 826b68780..38be4a2c5 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
            file://CVE-2023-3748.patch \
            file://CVE-2023-41358.patch \
            file://CVE-2023-41360.patch \
+           file://CVE-2023-38802.patch \
            "
 
 SRCREV = "45e36c0c00a517ad1606135b18c5753e210cfc0d"
-- 
2.25.1


