Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FD9ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.71832.1661786678490933144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=G66gmCDB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TActA9003662
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=OQJ79KDBXa+3oaexeD2eN6CbUgqa25GHFW5lyiMTTvo=;
 b=G66gmCDBGHz1yNKNNKhZPA7mF6mk7aXpCJaINrt2jhpTRR9Y8uH0caBGaBZKSAyyLOmA
 3zl8sh9+Ul/f8xOaqmNrLuFwRBcq7HxLJKRKUZDmSX9BTXOlWycgjX6K7ovjVVFVSgPa
 F/O/lcRpASZUs9LqA9WaXhLJszKCr4i87p3a7JTdQUrrYEsuVL1TY31ogTTk+s38iDMr
 RO8DmkBqoMmNukGq4hPLHIFEApDMrzlAOAkxEaS8Ls0AMUqC3PcPS4nEWz2BGBhxqRbP
 lO6VniuRXDIXLhFBwmE5LlopGSjIpGeohFYIBHSFEX53psRd8t5g8buMNVBNTrqU1GxE 6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hswe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:37 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFJeFO026042
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hswc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/tMQpr2MfybII3H10BQTRMioVusHHBEp1DuwngPagYEzAtZcgrC19OX0Ct5pTIU+r/YdX5zsBSCAu8pfDOCHJwewrCCw99V0y6DbLP6oRMRY8AQOS6xU/VT4nLPSBQ18Jo+GVh6iockaUD4F5oV6ERXjeQaK83oHNvxqj+2OzFHHNR/Hn0RFZAiZujyx836SLKkQkXBvcdFRMPMc4lBkRiu0mjEJT9cat+iCSWPayDAWLwFYHUXYJf1akLISgHGXlLF+rO0N8l4VkfYQv2CsOHsEL2HQ6KJlZz245WrUi9p0oRzxueS7r2jjd27id7gwqyNMABUXRuwonINbMpY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQJ79KDBXa+3oaexeD2eN6CbUgqa25GHFW5lyiMTTvo=;
 b=bZV8RoBH5s7btVZWSSbAjgVOsx5+K6T5BIUdQVpx285c/OiKxBr2dVOZ1/eAKmwNv7J9Wuvlw7B2IDOFrakjX22H9gC0hP120zOW2J/bBKrGgDX+s/C9TzhmB50L/iY6laqP5gNE8oP6MnOHlqNtCCaNDv6xenbX6mTRPrZgky/18TcB/lEtM1x0fpop+uhGO/INJPvSDq2Z5+L6JIGXNspnqa63hhLUvjG0QbXcIHBwd43dQBA4kJM89qWbPNl9dkoGBb5pmeSmWmTFV5OMLfXXXrdDqukm0hcDjrn0913nvLK9Tj+Xzv5oLXzdXZ0rrc61PcGDKYPfpVqPBCITSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MWHPR11MB2063.namprd11.prod.outlook.com (2603:10b6:300:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Mon, 29 Aug
 2022 15:24:35 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:35 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 09/10] libnet-telnet-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:13 -0700
Message-Id: <20220829152414.1757540-10-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06abf328-56b7-48d9-3e7c-08da89d293f0
X-MS-TrafficTypeDiagnostic: MWHPR11MB2063:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cqn3FqpJmH7jqIaXuoHNHBgUxgkXpJTE+g/T5CLGQw+g5ZPpLRoRvjbF5rsAiZXleJKn0jIAuhsK0GBK6l4zshMhZ0HbrpeDHj/PDSZWzWsmqKpCYcN3vmFD1d7uNZH6ALPi0j9rwF15xrN1sMSK1VIssbnGfhrO6wvHfyBu7TRdj6CSBzf5SQoX9+MjLLc8B3cGHpC6qzmtakP8VGQPBW+znKQMzawbhOAzZ3qIWH+7t/F/zo6uBnSR9IeBNZPCwcXR6owOucA1CB6zXiND5y22B2JJqxwlbnmNqZS5+Bb7/B5RTdy/O5VNLXwBkowBOpg1xkT8zKDYf71Bzg7Uz/uDcN3XFSDKDN+gx/GhZMJRbXRq4MGdZJPQ1UlWwFV6UwkNIz+/f4xnS4olE5tIpoFiuyjmwNHhmxdlYD9iMLcaAEX3qBO1Q01FEe96Wy/BABD6SF3+WRmvhBUudqVVIyM0lbkzXyP9Ce/r+L6qOwPpPfI2xZsXvbqsBmMP3SfgAwB7xcXn42povUgOonbuUBbvJqmgQuM+rnM2uwxWc1QRw3SxvNIvKVlvf6CHpXkyzSTQMrWE6NndoocH5ZiMlhDz5i3z0bJ5x5/7ZU6AbbCXL78UwB9jQAPF/ZMOTKqaw8LvOQLEgchETGxfjwdeu8H8yr0eIWNLgqckQluead0b53sJv8V7X37hn04qh4nlfQ7JR0fLN9h9h3OKU5ip6Epx6KyH5gnidCMQhWN/O6ztxSRJNRfWTVwV6VDQUURHo/kysq9Gz0XB+3uh6QAPwLyHHc9UbERKtA6RbZdwBXK8kvE4RFnZkRjs1iEym6L5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(2906002)(66946007)(8676002)(66556008)(66476007)(52116002)(8936002)(6666004)(6512007)(6506007)(316002)(26005)(478600001)(41300700001)(6486002)(86362001)(38350700002)(83380400001)(2616005)(186003)(1076003)(36756003)(5660300002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MevJjEJl1vpDGuzo7Vg6K+gA5cQWF/CCjk8jgLALez8LJgvjf+xKbgdWuQbl?=
 =?us-ascii?Q?IUiZDb/S5s9peGFao/N9Wbj9IVaXbl7BVxHiESBSWDMiLNZ5+wQTfUCX5G2q?=
 =?us-ascii?Q?mUaVXmac7Jdtq19oID8O0tfHIU7QN1BviYoj9YCjgGvgyBAhQdvHFGSaQZmi?=
 =?us-ascii?Q?Wi2Tx3L9z2QyiFxTaAsTJNCAsbpoeQZ2s2d7UdhDDxE0xDteWgeUoA2B9D1e?=
 =?us-ascii?Q?a/FW3fhx2hG0SPf46at2TsdMErgX+BebIE2qLBD5c1WUgt1gIr3BEkmwYl09?=
 =?us-ascii?Q?SMbMM+HzLYXPojimW1gijUyefFqAlBv61rpyd8jiArUpqgQmmov+7znzzZVI?=
 =?us-ascii?Q?rmtS1Ydjj8Nvomf5XFf0K5NKqx27juE4RmmHmKO+1pwoI6p/XPV0YDXjo/sC?=
 =?us-ascii?Q?6WDaw3znDFE7eJNS4fVKP0L+raiXVtWre01A0ISn+2piF9i5yCWv+5VuU7k/?=
 =?us-ascii?Q?WCiAW/c7kFpVSjRDHgBqwpD5QFU3AZVVg9+SlemK+KdSYnDH4dCLUu8PwYXv?=
 =?us-ascii?Q?gDjXX84fWuNLsDJhvwHWspr3fZa691cDr+J2uDly29fwB8p6s3DFtte3USsH?=
 =?us-ascii?Q?vjNrh7u69T8r2mdBmmOd1HnKMo+R+yaLB3c/j+YJqnx+D3t3vt+JhFZJCxZn?=
 =?us-ascii?Q?8sc4bDc8l/EkhXqlVuS9J6JokAdCkcs6RBeMtnFusKh6EdDqXVlydJghVeTW?=
 =?us-ascii?Q?wrjGKF07KgPAFI0lZawqlnUQXCSzSWf82AQ4jS/AiyIX6k6QoAsBBcWvdMVH?=
 =?us-ascii?Q?snZZN6OjApMzILFEwgRGI6CHi/gUocSdOOy+0iskrYMBEdpNBCilml9GGn6b?=
 =?us-ascii?Q?Dup6Bn/xZALUKjhSs+vtBUpPd837Np+Fw2s8Huc0TreWBf8HQz9+bE+05008?=
 =?us-ascii?Q?XOA1lsD4yPgStihkq49FZN50grzswDRYZuXBf2t9MUxL3NJ+ZKDU43NQOH47?=
 =?us-ascii?Q?mtURYNQn7/+280S/6+kkdemS/YvcSXuLoWgfnOe49K8t5+ps2LHkDlWzrktY?=
 =?us-ascii?Q?7NnwMUku8+hZVUrLk6cbz4Q6C9YhvZLjC2ZUGpnmWPDTTiNE9tkEIz3O2Y1f?=
 =?us-ascii?Q?I1ZroYEInIpRx8MRgEet5dLyi0a2wmCuGCUvgVxToiI17KK4TAaT2u811Srx?=
 =?us-ascii?Q?22Do/UtoNtvjcWiWx6oMh1NS0J3yId1SK/is/s/rrgA7UFplXdn4J+L38iu1?=
 =?us-ascii?Q?YnrqnVya/OPTWJoXGI+XFuMyaa0w2gX0modc+Y35trDel4kQV79UL2F7uNYh?=
 =?us-ascii?Q?NJMHhyjTs1ToGWT5aJIFYUN8Oew1nKnh+ChkaQH750WngR4eBSp8DIg5rJXN?=
 =?us-ascii?Q?HLnqwhkIHRJ5nYy9Xbf/B5G2R1N0PxLO1So9OWuBcJ4s5SyQcE52Dnh+uvuS?=
 =?us-ascii?Q?KtUA9c5UQpsfE0nw6OAedO9H+Db97sMPL9/FWX4sZ4Hvx8Fv5u/vuD/4rrOB?=
 =?us-ascii?Q?4dte8WLZsoYvSRKTYvnDExOr+14WR/Pluuo4t/EmjDP03iQbaOo1C0uitAmi?=
 =?us-ascii?Q?63qktFiclOO+BiyaYijYhUv+mYicW66T1tLle5LDmQYyifJHOsCOxaLkAAa/?=
 =?us-ascii?Q?Beww8N3l2TXjD+WN64rdgN3q1MDT9kRNbsHcX8Hw2xOmvVLgeJnqrSu8f67v?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06abf328-56b7-48d9-3e7c-08da89d293f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:34.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mlQeNEy3+o47Z8raU8OkWTO2eCJu4ww5XliGW49pDHYlnQSjafrd5HNaIuc/angPRn+Lt+R3H3gugHFeB2Go1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-Proofpoint-ORIG-GUID: xyXGOsGnPVLyQw8GkzBekvn7bn9vBWis
X-Proofpoint-GUID: 8zUtwVvXWjDz4MAV246zA9uvZ2ZQA1gH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98533

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d7d420104..d1365f269 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -11,7 +11,7 @@ shell."
 HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
 SECTION = "Development/Libraries"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
-- 
2.32.0


