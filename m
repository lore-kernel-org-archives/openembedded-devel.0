Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DFFC433EF
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 14:39:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.19347.1643553580934264092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 06:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VHwgpz5p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90298cce89=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20UETMJO002529
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 14:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=cYXIEtZORCjZsJxzVcoMbVGufEisLShp7pNHmRIv4Rc=;
 b=VHwgpz5pQHtvdFY5auX84d9HCgtLXolW7dx6/mqFd5FDcyLjTMDAwyERkynL2l8wgXVy
 p8EfegXTwPQYyf3LNL4zgkjVDCINkfqGox3eXSBjTj4TpKQeIT0HknqSycY9jwrMhsg7
 AHbXmk8TGy3moAG/SkFJFd/XcJqKsm/x/r8KOlH+rLiCr22/IxkyrepN/UBpzTloEI0z
 /yYSm9g0oDB3OWn6vRmoK2bKx4YeKBCckxK9tTzUaI8Y8UDr9ijuEMhzStg9t+t/Ksfv
 xnADMZSblwsT2z7N+hvmipwDmBpUmZ9LClbsfFhgRDYqXGpe+BCdhVtn9NhpM5EqYsjc 3A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dvvj6rr75-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 14:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXTO1+mlUohgxxwekUJnKnoP4N8XlUu32zkEUU5uHvZ9XC2y2okX3KBMumx0UOrf39x0ih2dL+Ad2sCNp/I6rYpitio4dikkghinIZhPQMnm1UfAgSN9JJ/9ry9/Xmy/I/ESRrbwPMeUXO9DVLdNdPvoWjhPQ7r9aw2poR2JJcTm1fzlJzzRJrHraMK2K8gQGxT/8lwuTubHQ7EuScsJHN45beRU4omUPHzRYArjAcxzzYa+7YmK/VRTJ7ZBql7SzsDO2Pf9Ea8+avEu+lQMFlJjd4bCTHgdPiTYP8UHRQsJZAfQHweoGucN2n9mYqpEMMZJLuCItYPV31EpzCHmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYXIEtZORCjZsJxzVcoMbVGufEisLShp7pNHmRIv4Rc=;
 b=e7gvwBdOWr73aN5w7SET0bEH4rZ8AVnnDkvDHZziJn7rdu8/aJXHGMEU3SRSi/cqY8ocRQcKzMZ1bQCpmviunDLKjq7ao8MfXnM2npM8JwNavOrh8Ly9gAvOV9fJsVt/GPCEUeYOgs6G/WKJ4aMUDh4prNP1QhTQvvrtXwBu6yqf6maQAVeQ/6jdYwLTKJjgLXGbkWb5L4y3wSIGJ79tGSOINsjllXNVB6DJSHFckgdNd7Zw9pPkZlz8VYUHH8IPEh9obQ5DcEmkp8UweG4gfMG24A0KOCZ3WylrL4lVBDPemGc5/mhmdtUu220A+gllYhe2hGLLb5G6mK2pFHRs3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Sun, 30 Jan
 2022 14:39:37 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%7]) with mapi id 15.20.4930.021; Sun, 30 Jan 2022
 14:39:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] tcpslice: upgrade 1.2a3 -> 1.5
Date: Sun, 30 Jan 2022 22:39:24 +0800
Message-Id: <20220130143924.44775-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130143924.44775-1-yi.zhao@windriver.com>
References: <20220130143924.44775-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43f1542a-6b8c-4af7-75b7-08d9e3fe5698
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32567E2D7B79F7A2880A99D4F9249@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j63LrRoamdVALbSA0unf+/9spr01zwcFWTD4n+aMSbRDU0LPMjWJ0cpvWy9DurqHJ/iMP4RACT3jg59pbhR/TRsEEoL8QRlQcTXAA/1psLU07EyUVb7e35fUhJjjSgROHdwakddP0cVwLjjHxw/NnmdyZeQ6OeH6NaJEdZ5vSHeYio0myIUcRkeCCTQQpJjSiXntmVcMIrZcV+2HM1sxyIF0ufkG2fBYYjYCrmlKhPNrABVno8pnJp+0T2sPfEhkA1hxgEdDknpEqfSjFqLH143svdWzBkmLrCHJl1InboDmsJCqGAiHxYT3tgxZVlhUZnTEOEUR47P9VsUeyW72RhcWUo6ol6Tckd9VQ7H82eywoedP5inKeWqylddRfnKc7BTF9gm1VBU5XJIzySaIIERBaOdBovAwj8WmzRQBgUsQGKdd3vVdZV+ctxdIeNw/0J16ue3Dl4KW3jCDOj1GCznj1wGeb6Fk3AFiqWyerBtTT1eBdOWUj9hlQQp0g3ds1eYhhWm2jiHGNJpQdPxjc4hNd4Z9VIYeq2yfBRSyJejDoXcNpW7XFhb7iVWoqjrPc1DROf9wPEemGAy/f+KI6jJZto4wLX7X/9lER9HEvsQtaKtZd5ZwCDgGKObe7DtN0bnIGX+tg5clPOOsavtxWZ5Q9asIni6md3NEkthpXXO+W5TfuELr8T7hjH/jgwl8w3iFCQqj38Rua4ZjffI6ULfBU0QGdXa2NaheQEsw3Vgd8Bq+6YpHETbxa+Blz8mNOVXCA/No++yk+x8II9SrAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(2616005)(5660300002)(66556008)(6486002)(6512007)(26005)(1076003)(316002)(6916009)(84970400001)(52116002)(186003)(86362001)(6666004)(6506007)(508600001)(66946007)(8936002)(66476007)(8676002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TK2ssRP8ICxvHFVZXtIFDCJOH60LeyajQq82Vo2gaL9jrwILkTKv9VZiDPA1?=
 =?us-ascii?Q?4806iDGg+wGGrHiaAdA2yBLXC5PBSB58Wo7AyV/efBUADaTUiLZRlLKoSpeC?=
 =?us-ascii?Q?WmWy2qktoUoSiwgAldSYmf8UcEVmqMU2obnpdfCyGVxk1mSRNI1NDOPpttfm?=
 =?us-ascii?Q?C7DYXMKg+c7A9uY+D1L/C161fYLN/xr0uB67IiCjetJG07iV/dMnwjFIBQQY?=
 =?us-ascii?Q?B+J/rUN2o4R4LRv5a8KLUGWuHhNYkW7Bd3e5tlctqyhlf9fbWuwctTmSLrP6?=
 =?us-ascii?Q?SHtqtDhxEioO6jctIWywp969JQ+paW5qgjyHhZEMUuKRxYhRdNpebZxfPIqe?=
 =?us-ascii?Q?k683gY2lweGoRoJL3PGChzNgcJEUvt5xVbRpb8J3bHh2tMwn1kKmEB5+lfkV?=
 =?us-ascii?Q?yQbCbK2JLmWVGPIbrLaA57hyc3p+6nnrEbSD2X5JCxFQfj9Ff9yS259BcuCW?=
 =?us-ascii?Q?ffCwwXUioMuQS7XgfBH7s4Cpd+olri0vbhYsVqPI26E4HFkS0U6ooRpgn1Dp?=
 =?us-ascii?Q?tFtcGi9hBpR+lhOY862kavt1eiKmg8MscDEbAfe86JcZy6Lm5x+c7pqzNcQ6?=
 =?us-ascii?Q?XNmuLWucavqKPLWf6WVou5VGgD0Po1yCFOrXSG5/zlGumWhhRCwXfZq/zFZG?=
 =?us-ascii?Q?l528GdZot33aBVPg6E6S9Sl2MUf3hL+/SjVBweQMINZqld/Ec38g4ekXR5kk?=
 =?us-ascii?Q?cQbT5w4jz861PY4n+4YxbQRf5/LbwGXNJiWptGW5EAQr9HELZ4W5lVvU/XpL?=
 =?us-ascii?Q?wclqHWk5B82R0PmYv7kiy0TpHUC8dKFbnrGUhcqtIpPmFkbS5kDbxyZJxemb?=
 =?us-ascii?Q?L3BdJkPH+pJGrWFoIs0YUFKdLmziD6i/+lTBFKJh8I8M+krDVTyWzd3Wj+fe?=
 =?us-ascii?Q?x5CEZdrnisY3957h/XW0MvSP2P94EnyKG+UHM3J5irDA/xZ45p2iKZVfVgsS?=
 =?us-ascii?Q?X/+wekvEd031aUKKrIbCjwvUVsiyIKJ1ICK+2lO+OvBteJYYtHACohAozphu?=
 =?us-ascii?Q?F6Bl36oOF/k+XVqwXGXJ+My62UXLLp23oiG+B2InW8NHicYGwvN97j0sKr/W?=
 =?us-ascii?Q?Epzo0bCeqJ8wQKySMqaqtknq09OHKcdUe40Kv7rumuj0Opp7XbI0/xVfMwni?=
 =?us-ascii?Q?AoXyhG3o/CR8AA/MdoLasMrwRz0tCRCvdk9ueHpfyc4vsbuQdUSqyZ5cuO8q?=
 =?us-ascii?Q?aZ/046OK2IRF3jucPLJB+vbrSZsqJnscYzFZpHW+5hPGoWsBnD5by0NQrTEd?=
 =?us-ascii?Q?EMZFrnxRVHIPYpNXAdh022Q7srkFgUt577jXPgvl/JayhJ5ksqVHIjJkgFyp?=
 =?us-ascii?Q?TEBUNB6Iv46PvVW85/QOrUM5P7e1CWxTb/okDRzY74CCd5XZ3+/UY8wozGMH?=
 =?us-ascii?Q?h1FlZgyNOrDjQ0ReTDpJEV8ZRk2IuNI285/iZMMKouuNs7rZmCQMr5Mdb70o?=
 =?us-ascii?Q?+c9qort8cJtTxySVBr5HvSrSRtj3WLBWMsYSdJfgxCSdMPUKEMVOAhxaIjPc?=
 =?us-ascii?Q?QP9ctB8edVsDoWK6bbxBBluDcGP0zErzx70eoA98iUgz/edV2ElIbkjrCSLt?=
 =?us-ascii?Q?1sw//Rh7iZ0vaGFNzBdiA1cfP+TcBTAYCGmAgH4+Gy8bsV/Aupz/qGXdNXUs?=
 =?us-ascii?Q?hrkFneqUWR9BVmblYqCUH+8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43f1542a-6b8c-4af7-75b7-08d9e3fe5698
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 14:39:36.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 o7V979GDVFvzyyrha4GNxrqkB1YXDna1XcDflD4UKNyzNgnx96iOkZ5zKlk3KOWwKPAXjbmj2A47+8f8N6L7EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
X-Proofpoint-ORIG-GUID: 6A8271_ZllTmI6_WD6m5wUNM-2gSP4Pd
X-Proofpoint-GUID: 6A8271_ZllTmI6_WD6m5wUNM-2gSP4Pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-30_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=846
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201300105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jan 2022 14:39:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95178

* Update SRC_URI to official download page
* Drop patches which had been fixed upstream.
* Add UPSTREAM_CHECK_REGEX

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tcpslice/tcpslice-1.2a3-time.patch        | 75 -------------------
 .../tcpslice/tcpslice-CVS.20010207-bpf.patch  | 15 ----
 .../recipes-support/tcpdump/tcpslice_1.2a3.bb | 36 ---------
 .../recipes-support/tcpdump/tcpslice_1.5.bb   | 25 +++++++
 4 files changed, 25 insertions(+), 126 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch
deleted file mode 100644
index 386b7f83a..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-time.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Upstream-Status: Pending [from tcpdump-4.1.1-1.fc14.src.rpm]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
---- tcpslice-1.2a3.orig/search.c	2000-09-10 10:52:40.000000000 +0200
-+++ tcpslice-1.2a3/search.c	2006-07-28 14:56:55.000000000 +0200
-@@ -53,7 +53,7 @@
- /* Size of a packet header in bytes; easier than typing the sizeof() all
-  * the time ...
-  */
--#define PACKET_HDR_LEN (sizeof( struct pcap_pkthdr ))
-+#define PACKET_HDR_LEN (sizeof( struct pcap_sf_pkthdr ))
- 
- extern int snaplen;
- 
-@@ -111,16 +111,24 @@
- static void
- extract_header( pcap_t *p, u_char *buf, struct pcap_pkthdr *hdr )
- 	{
--	memcpy((char *) hdr, (char *) buf, sizeof(struct pcap_pkthdr));
-+	struct pcap_sf_pkthdr hdri;
-+
-+	memcpy((char *) &hdri, (char *) buf, sizeof(struct pcap_sf_pkthdr));
- 
- 	if ( pcap_is_swapped( p ) )
- 		{
--		hdr->ts.tv_sec = SWAPLONG(hdr->ts.tv_sec);
--		hdr->ts.tv_usec = SWAPLONG(hdr->ts.tv_usec);
--		hdr->len = SWAPLONG(hdr->len);
--		hdr->caplen = SWAPLONG(hdr->caplen);
-+		hdr->ts.tv_sec = SWAPLONG(hdri.ts.tv_sec);
-+		hdr->ts.tv_usec = SWAPLONG(hdri.ts.tv_usec);
-+		hdr->len = SWAPLONG(hdri.len);
-+		hdr->caplen = SWAPLONG(hdri.caplen);
-+		}
-+	else
-+		{
-+		hdr->ts.tv_sec = hdri.ts.tv_sec;
-+		hdr->ts.tv_usec = hdri.ts.tv_usec;
-+		hdr->len = hdri.len;
-+		hdr->caplen = hdri.caplen;
- 		}
--
- 	/*
- 	 * From bpf/libpcap/savefile.c:
- 	 *
---- tcpslice-1.2a3.orig/tcpslice.h	1995-11-02 00:40:53.000000000 +0100
-+++ tcpslice-1.2a3/tcpslice.h	2006-07-28 14:56:55.000000000 +0200
-@@ -20,6 +20,26 @@
-  */
- 
- 
-+#include <time.h>
-+/* #include <net/bpf.h> */
-+
-+/*
-+ * This is a timeval as stored in disk in a dumpfile.
-+ * It has to use the same types everywhere, independent of the actual
-+ * `struct timeval'
-+ */
-+
-+struct pcap_timeval {
-+    bpf_int32 tv_sec;           /* seconds */
-+    bpf_int32 tv_usec;          /* microseconds */
-+};
-+
-+struct pcap_sf_pkthdr {
-+    struct pcap_timeval ts;     /* time stamp */
-+    bpf_u_int32 caplen;         /* length of portion present */
-+    bpf_u_int32 len;            /* length this packet (off wire) */
-+};
-+
- time_t	gwtm2secs( struct tm *tm );
- 
- int	sf_find_end( struct pcap *p, struct timeval *first_timestamp,
diff --git a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch
deleted file mode 100644
index 0a7359311..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010207-bpf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending [from tcpdump-4.1.1-1.fc14.src.rpm]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-diff -ur tcpdump-3.8.1/tcpslice/tcpslice.c tcpdump-3.8.1.new/tcpslice/tcpslice.c
---- tcpslice/tcpslice.c	2004-01-15 17:35:53.000000000 +0100
-+++ tcpslice/tcpslice.c	2004-01-15 16:12:57.000000000 +0100
-@@ -35,7 +35,7 @@
- #include <sys/file.h>
- #include <sys/stat.h>
- 
--#include <net/bpf.h>
-+/* #include <net/bpf.h> */
- 
- #include <ctype.h>
- #ifdef HAVE_FCNTL_H
diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
deleted file mode 100644
index e65739a5c..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "tcpslice"
-DESCRIPTION = "A tool for extracting parts of a tcpdump packet trace."
-HOMEPAGE = "http://www.tcpdump.org/related.html"
-SECTION = "net"
-
-LICENSE = "BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa62c64e"
-
-SRC_URI = "ftp://ftp.ee.lbl.gov/${BP}.tar.gz \
-           file://tcpslice-1.2a3-time.patch \
-           file://tcpslice-CVS.20010207-bpf.patch \
-           "
-SRC_URI[md5sum] = "e329cbeb7e589f132d92c3447c477190"
-SRC_URI[sha256sum] = "4096e8debc898cfaa16b5306f1c42f8d18b19e30e60da8d4deb781c8f684c840"
-
-inherit autotools-brokensep
-
-DEPENDS += "libpcap"
-
-# We do not want to autoreconf.  We must specify srcdir as ".".
-# We have to set the ac_cv_* cache variables as well as pass the normal
-# cross-compilation options to configure!
-#
-do_configure () {
-    oe_runconf \
-        --srcdir="." \
-        ac_cv_build=${BUILD_SYS} \
-        ac_cv_host=${HOST_SYS} \
-        ac_cv_target=${HOST_SYS}
-}
-
-do_install () {
-    mkdir -p ${D}/usr/sbin
-    install -c -m 555 tcpslice ${D}/usr/sbin
-}
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb
new file mode 100644
index 000000000..4909acdee
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "tcpslice"
+DESCRIPTION = "A tool for extracting parts of a tcpdump packet trace."
+HOMEPAGE = "http://www.tcpdump.org/related.html"
+SECTION = "net"
+
+LICENSE = "BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa62c64e"
+
+SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
+           "
+SRC_URI[md5sum] = "8907e60376e629f6e6ce2255988aaf47"
+SRC_URI[sha256sum] = "f6935e3e7ca00ef50c515d062fddd410868467ec5b6d8f2eca12066f8d91dda2"
+
+UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit autotools-brokensep pkgconfig
+
+DEPENDS = "libpcap"
+
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
+do_install () {
+    install -d ${D}${sbindir}
+    install -m 0755 tcpslice ${D}${sbindir}
+}
-- 
2.25.1


