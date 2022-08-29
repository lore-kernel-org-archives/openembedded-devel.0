Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F35C0502E
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.72067.1661786673484259336
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EbZBSJe7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TEnYWt009599
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=0xoXzCLjzQS6PrTPU0I7dZc7xaOZAu0WSF8ZSZhsmDY=;
 b=EbZBSJe7q28t2cT6GuMxiNzt7V6qmfQFFHg40ccglPAeixrF3JYwIL1ok81RkLCsHpBv
 2tZmN+Wno1ZH4yQNoR0pOHegVRAvRJK0Fg2JUXijMmN7ubpdR9NXeUFNmj9Sv4k1+VQK
 fyvdGAtxoPTa4QpqsZ2zMI5O3FQgsz6ctwf0EXAjbw4uZjct5m1O4kSy89ER+UHsHDGf
 O8lnOwde+GgdT3Liy/hjWFqjcbPA/wgGyxQqnK0uhvgXgbhNDdPBOMXHlqgYs3i2QKaa
 x9NuVXDVmLZRJLwWaTygOpgiEY2wpw0FxKACwR9XCzImnawp9IKLDP5OR6JMR8nKy7ZG AQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:32 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFJeFM026042
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWH1CTvWBFu70qlB0En74oMRi8KrcYbI0e9epg5mm+9iCF70T6cpE6oTmNcPXNE2iK8otezVJL4na5IbqP03Q4C5+mmx6HUCHstH/WOkJ9Tofccs3JJrf9fkce+cVEhb0DwHgOXPUffMZ6vwDoOtEM12flhmMsx/OGYdvHfiU2KkeXZgu70EzShcFXtkEiPGModVvHQS1KfDfd/b/SxlidRcGlNWd0Mo07ZkGBhHuqdn5GvMGK2wZFFVDFi4dhyeBd36tBJM8OQhw2oWJ9Xc8HQW90yBdVRwyDOr/rg/WUX1RiuBg564lEBcsebEG3bxJw5y2S8RcVjjI3deMKt7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xoXzCLjzQS6PrTPU0I7dZc7xaOZAu0WSF8ZSZhsmDY=;
 b=cWxwHJmYAuTZgUBQf3qYhUyEVYmlxD7DMGg9u+iSHeHNvQ1e/WBPf6keRd8OthkuK5ShxfjuX3Na1PIxZcgRdWNgou52L1b5pAEm0cwZ/4Icxvx0RTcjRKk1l4Ie+E00aBka120KzHqZzQkPBLinHzN4iNZfnWbOb5OW6OXHK+ORwfxG0ClRxspTSBSmMXqA+1gSJwkhIwRb9PnunoWyT1fkjbpqtgel/OSwvMg02/PN9vmxxm1WhTqVa7NxSfskcaMVqoeYQYAuME4muv1eOgRkU0UEZNcjhlNhfHXSGMiqAmoiAClWbYxQPdbwu5d2Ir9oX5lJJi5Z6VK5HHEs/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 15:24:31 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:30 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 04/10] libdigest-sha1-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:08 -0700
Message-Id: <20220829152414.1757540-5-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 79fb6d70-e853-4991-0995-08da89d2919e
X-MS-TrafficTypeDiagnostic: BL0PR11MB2914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HxQH+EFjhhrDy31D14japZB2jxQ6xZqmPrhGqf66i2OHLg6sGZ9ZOY+UwqTadD2tTTh+zmZGAgngVTLjTbjB6Fprw4PoKTlxswDZLYzobjb2f1oevvGSHR8kAbDaP7UQBSYNisDpEsKz4UsQojv8DMklOkomXj2wlWiChZPQT0p5xM7VDietNdt3ufBIc5gCpTt8qqJYjY/FMrlmoEEvmWt42O7zPSS50ISzF/rkMR0ymUkf4pMRtmOJ8n5jyCbI+42vg7Ffs/vBMelSPNcYKiQBNUpNsKdOruzmBxi+qw9tCe4h0b04vodyglZBmyniWRBHYf2nQHsgXOQVlJIBBH8XfRlJpkCYKQHs6WeLJd9957qZvEB7DqQBqfdKM2ThNmp9borlc5ua5G3AYVrdDPJJfqWZKDOu61cCw+cVibdDwr5HtgSPKdFIFuuQVvMwZ3eQwGUCKBSx+vbqhlupNpcEEeVSgR6cq2HnhbuJIqlINSzqHEPKek2ykS5JWV/btMWPnTnzoORVipSzhrPQ2shpaGDqyPcSOVLTphy//t7+RaASkIuAbKzrl7JlK4DbJ/HuHOhHbc19bdupyX8zaCTI8zFEuH2GarzeuEqGRmC+UI6mb3n7VPJ1OXK/PnPopaUssiwGzQuYcSMf2GnrR+rJnlnuCxF0QrzHEYnWfPkY0r9+X63Im9+OGEpGUo+pLlvt4lIx2tbX2G/2C3iI6L3sVhw9pgQKQH2IaE3sfNJisdZnmsmRYg+peSHZ/Pp77P9yQEdTvKsVKl9NVspADzF8O5p9W7XKNuTUXiRNGux/B3xBANiJZ0ziVnlfOMIB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(86362001)(38350700002)(6486002)(66476007)(66946007)(66556008)(8676002)(5660300002)(478600001)(38100700002)(41300700001)(8936002)(316002)(186003)(1076003)(2616005)(26005)(52116002)(83380400001)(2906002)(6512007)(6666004)(6506007)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O9jWuasey1OP1iXkwiNTXAFElPT5AUVu2CtIQ52rynQwprcnCHE2eDR2276p?=
 =?us-ascii?Q?V8Z8yBM5HyA090Smo7T7ciCpNiVp/kt9UcBsKDxX/SWyvT7bZUkrMx1EtJPF?=
 =?us-ascii?Q?J6k/+X0bGrlnb2LNgS5CB0TS07zzETXMlxxTXVB1kQcTSeGfw5Kpn25WxMVA?=
 =?us-ascii?Q?uqinp0QSX9dMR5dwzaGhiMLc6T2TzL+IOvNPnE6BXWqvLINqGHfqfgg427xU?=
 =?us-ascii?Q?aD0zR3wbRpcNijPepPHIxhidw+to3VQWYv8mgUAVZK/wLs3NG6utUfPRmRyW?=
 =?us-ascii?Q?hwC7Y354kmM3DCvGt3tqXmtoDhMqCcSCFQZSbZtHXRAxzMzUuWCcA9iFPUTs?=
 =?us-ascii?Q?sz+rfAT9+7desxmOux1m93uGOBoCUp3hYtCDryExYXlN5FyR1f+ktB/T0dmN?=
 =?us-ascii?Q?YQwlaCj2l4h8c4vBFKOaCB/63Eqb/1SfNmX75UYP48GpoWDwhUE4wgnSuW5m?=
 =?us-ascii?Q?2YqSEPKfbd+4n4d1Q/vjVkt3WfPxwYlDWI5l4LcMSytxkfV36eonhSwvZHc7?=
 =?us-ascii?Q?3Ym0y3H/kMss6udvg7/xrsFmh7P6hfJZls/8fyvhRyrblEiYv5FSBkz7bIvy?=
 =?us-ascii?Q?pAczFW1g4TadohETl+8fdL40/ol2CbJnJ1Vii8rpFJQScYyuULYmFz5LXXWk?=
 =?us-ascii?Q?/wxAERGSOLw+47aawsrw1of0RCrsMh+amjuKO4Yt104fnSXN66Uh3ct/1ZYN?=
 =?us-ascii?Q?DgMxjOksWVdAuxJwBOiRoFtKl/vTXMrj23A4NO/SwO5xKWWwAB43QpN4NjHL?=
 =?us-ascii?Q?Sy9L++blrgkIi399SBLRvSTt/80kXV+1+hPRkoh+MHnNGuVVObHpn2zb1x46?=
 =?us-ascii?Q?pKfAFhAqWx6Vik6KqPSw5kWQ4MIRGvClLWMS6aPYgdRS4VRlZRZtWwx+tkBC?=
 =?us-ascii?Q?JDB8KPyeO/lAQSgteydTMmzjGzlJ1KviqKFaCGoGetu2cP9dXuJ4nEPs96p8?=
 =?us-ascii?Q?eHQL/T2tOfsF8rV5Mm4bLFB0ZCe22cbN2ozOZNvrFyfKhPbkl2PV/EnAY8XE?=
 =?us-ascii?Q?j0UE/f8TLBI9QRTW8LaqnKYA5Iw0l8L4ELa1sICqD+xc9xIfAatY99XyTg8T?=
 =?us-ascii?Q?pj8csX3M5QeG70qD/HtmRh38LLl7xrCcqCVsQDcq3mHxYFleZ4kXgocw7MxZ?=
 =?us-ascii?Q?w6J2UuEI3pVipvcWYF7uddeB3uU4EzdCNsiR5g0nwfr68R/eONqIC8hZ80fV?=
 =?us-ascii?Q?8z3NM94hzBb0Y2GIOqfXZE59rWZlYJFop+IzPNYK45Sva4CaGSDGS+WMeY8N?=
 =?us-ascii?Q?p4NjDPN3Jw7rPaSIMHoIWpuPQ4bdVYuOB8w6etWp/s8QQ8KimhL35Yx5jUMq?=
 =?us-ascii?Q?Fzp2tl2PSVdWNKLinc3e5Lbm5g9a4lai7hhM3qIq6hdnFG4OUqGFl0Qeyw0O?=
 =?us-ascii?Q?hE1fDabpoq7z8v6Ylgf1fXgOH8ZjwhHezRovZI6yfi9Wg+Fw1lU9/vub9LbT?=
 =?us-ascii?Q?eiSAp+zpIARVmzFbDzxTyrN4/yJ+zg0oDmrxE2c9gN7hR77sM/ek4PRwapgt?=
 =?us-ascii?Q?UMoi2Y/GuRUxchv0fgxdDgKTzW9UzUyfGYml9C5e3uHVVXM0iOyvDXUPmihA?=
 =?us-ascii?Q?RfqBnELRsKcnWdGcV+74F+C8LWfqYD16sSLwG7F59+xdlMmLL8Lma6V0WEra?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79fb6d70-e853-4991-0995-08da89d2919e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:30.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U6rJKgcz/CZJ41p4v3jJzeTjFiQZ3EKbx3yNHyuSqLUiBO2ruAjLhvj77QZ9Q9df4R6q5aEGNk44NqLd2Bhbmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Proofpoint-ORIG-GUID: w9ZrAT0RiDK43eriacaJfAY6cXdp4teE
X-Proofpoint-GUID: 8gZ68uNTDF71vrZpq3g2QXBIoVinVJLm
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
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98528

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index cd6367512..df89c9bcd 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
 HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
-- 
2.32.0


