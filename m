Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2A0C0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71589.1661786677509965655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TcOpd5YR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TCuKQ8025506
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=mOH3dnhCw9Bxc+jcx76GqzhjfbXxc/Zv0BW3g8apz9c=;
 b=TcOpd5YRkyXQchC8EiVdps5rNNn6VVUwiil0bdjYAQVpEvXFP9bqibTTYGJw/TSlYRtQ
 EW8kKxYDrCwL8kkAHH9Ow0MBDW8SLybYCkJzEX1AbFmigCP6DhskM1pSJ2f4TW7vZiBg
 liWBxR+/RzL3ocWIXh4Gcr9NTR3adbMJ0rvaV3RL07QLNAH2CwSJVETPgi7Ro+d7kG1R
 p0A0NyfMTW1q/lsi3ekh6xbCLJHkIOwBc/57GzcvSFbIR0KAgjsl2Pgq2Pyc3gJDdWLY
 hMzOkDBy4uZGOWD08qem8GRIAmt/c2QUZElE2u4DGpZ7BUy4Lp+/McNRsVYFAbZhlQo4 sw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89hr7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:36 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFLMmQ014844
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89hr7u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZv6iZoQmPQYlJpj/NuLYvjpX6RKzbnJEoYeK4uwkOvvgR1tQqxUDNrZiZFMbwcxn5xpbnOKQ1wQWN0GaWdCU/Y4oNjXAqFf4MiTxq2UpDuFb7etp4E/iksqX+G/5KSvyqBZsD7gizkrABGtO2kvWzq00yKVa5WI98x3ZjV14FCPw9O2zp7Jw3pvVV1p4kNaxrTYXWqjl0CmvNIfoVomfSehcS8SfxXoeGDZ5FuOmtPIJjf3ZwBWS+UyGrck1gETt250kkALNOauK8fSSjnWO3j88QYD17G8u+34MWaQZK59+WZ6G8huW4k0rXncczxq4LBDUzz8ZWqj3sJYbN6n5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOH3dnhCw9Bxc+jcx76GqzhjfbXxc/Zv0BW3g8apz9c=;
 b=d6Ua4m9kssDKOAl/6+Y0NCg902v5LXZHyJF22nwzxOK29AQIupLDDJF+Hb0AJx6+PsjqFmtYdKzit5ykKLiDIINspOgxNNskavPKG1uYsX5zx9gzzE0ssG4rGC1UjG2YK2H/KPKNhQBkJaAVG6MNSb2otgGl4P5naVI+n54A0qvpKkaGIzLaRvwbRAcV2Wn50f8eaCQcSip4FhyV6ozDgnmKTJO/8ZxRU4nSHkeoT9i0Mqdbtr0PcusDX5G+0n9J6fxWlPHZpPIwdyz20dY5j1POXDGejbfEVLvFEGqFVPAa672BIfJXeJG21eASU8gL/VuHWVUr5KCqMTTICf92TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MWHPR11MB2063.namprd11.prod.outlook.com (2603:10b6:300:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Mon, 29 Aug
 2022 15:24:34 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:34 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 08/10] libxml-libxml-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:12 -0700
Message-Id: <20220829152414.1757540-9-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 477443d3-3b2d-47fa-29d2-08da89d29380
X-MS-TrafficTypeDiagnostic: MWHPR11MB2063:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IrzVMX43xIBWxH6TCEAb3bQ6rxT5ueie0QA+VPXdTEeWfMZ3657mb9/kvykrou31Kti5F6O4eL8R7Zj6zbwKWWKJX/L/6ZSBenUy49j/ir2Lz2eqSh/luJIQKnWnVgNFwEmbZ67UjYC9wWoSkBPBlPdp0BAtpI5xY4zyLZrS/OKp+tw9CmPxsvxDEDNXREQAhvrdkzd1uYjI2QBD+6+x/BekKnctMimT+Lk39bu7msA17p5NH8GVaOioNN+JpvYm0AaujrEJX9gXzwy6fogzKeK3IGb6Uk8pPUJmq3BKlqWvW5utR6WIls9h3jizFZMemnonNGAJPvTYtVm8L3YKKAabyqvwnI9vp5vQuvjhKDNrzhwgT3wOT5bRe2VoLmhprm0hN9wXwSwwWCIxnvtKvOK6sOdwO8DNjUrCxg94JHJAXxr2Xvp8jP7posTc2/vlHcAteqH0z70qiiOg5GxafBREWRo6axVtWbEMj1aMRWv4VfDp0H0J/MLuSIjDgw7eGzb7cMfgVnfq5ox0DmzLJI+LadWFnkcIPGGCPkuZsKFLKwo1i4SV496LnwRMAOvaZe8l74KrAhyhu+mqILJe2LT2lnMUc/CdQFz6RIcfAkTa0JCq/MvTQ5OYtvc5UZ1kM6jBJ/h8UOJm/rMgZfi50JXxMACamOUnrsBii2ELs9ICcxYr2CVXWnLHSloeOhqR+Rqf/i3qyu+KEVxOkndyl07SGePMKFb8diKz/P9Pa/zJg38C9qSwpqBZvMjlkA2GFGmcxw0pT4TauvHQg+cYENyFaZAnYB8Brl6GQMf5uj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(2906002)(4744005)(66946007)(8676002)(66556008)(66476007)(52116002)(8936002)(6666004)(6512007)(6506007)(316002)(26005)(478600001)(41300700001)(6486002)(86362001)(38350700002)(83380400001)(2616005)(186003)(1076003)(36756003)(5660300002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PWrXeZaUxD0COhJyfMJoaVTHyevtIvOax6dJiWUjD2ldDBLkkg2ZmsOvnFbU?=
 =?us-ascii?Q?MXSi/lf9yb+D2Sdo4E4kDE+ckDPfpclI0h8bqCZLmcKue5X0pRNR8koYnFMP?=
 =?us-ascii?Q?MqsRtDiRCk4ENGN6z6tsPouWPtBdUkqlZ8D9f2hnQaGe5LhaLH7vTS2ukC8M?=
 =?us-ascii?Q?qV5IGgOYOQJQsS+rqywmRj54i1C3ntcdmvN46KYb7508F8E9LAdkDjGc1U+2?=
 =?us-ascii?Q?MImdpfPgqhbccmAyakyLG5lnxIg/t3mdHfw0AAq3D3mZlgLuvE+FsfnHWIQo?=
 =?us-ascii?Q?JwGi8s8nuA+8wWbINMFdSiVX3kE2mbKhagu8MOSrAP3DDyX+Bytaa9sx0gi+?=
 =?us-ascii?Q?m2gabhdGAvAL2x4CTu7oNNya7RivQIBRVp5lmuS6GQblqaLPf/VVR25d4d3l?=
 =?us-ascii?Q?xpOwWs4P0+lTZE0CJasaPiSqdncpzgFNq7o3bl1GQnr0gyE7waFPh7FV17sx?=
 =?us-ascii?Q?EI4FAUbyBKaa0E5SCVLygBkGl+elktEOOCjYm5oqClQWDT7M4M1jlLctL7X/?=
 =?us-ascii?Q?f/kDTX/QhKGLuS3gqpg7C6rXaI4/yMepxtPKcO8RQ3aVbB4gE0cxMeMJI1o8?=
 =?us-ascii?Q?oNofZ1TvkE9ZgY3U4TvSX2vnckFx54hKQr2a4n9Vzl4DtHXWV+CsULQFDykR?=
 =?us-ascii?Q?jCZN9XbOY+l5ZxYYkVq9kK6pCkmBSpPiQAqOULn4cAuWd3h4mZJHZY9HXyiq?=
 =?us-ascii?Q?hiQ75XfpDLHa+8HblzW2LYInsjD8VjzjM38nzSrrQ0R96I98A7aE+72N59Eu?=
 =?us-ascii?Q?sebqbVQvstONrBkK2QA3g2RyoBi8idx9q0LBLUpQigngp4NC+rM7xyRtfroW?=
 =?us-ascii?Q?B7RjBDW2LqHqHBCDPLdHE+ELoszm+FppuOPnK6ve22GFKdEa1eWHL4l11vTj?=
 =?us-ascii?Q?cUIYT1nntyaZurmPZB7PVepicXsuJtfqDLXtDIrLjS5x2xenLgA/4BFsbFYT?=
 =?us-ascii?Q?fO/RZRDvxTw5XgktZ8258Z6IQqBy6nBCTJl2rD9vCbUo3fivhiPzkSluSQIT?=
 =?us-ascii?Q?M34YkBGGL+jIFP2FY8QwUgIlw3vJ+41+6oynWtm03zzvBv4BjJyMpiKFTmzR?=
 =?us-ascii?Q?TtIhGCMlpHFbvyewyOFCuKOBlZ3t533qYGRYLMS0S8QiZ/bkMvHboMljSTUE?=
 =?us-ascii?Q?v5C6Kl3sUVPHDznCOwL1zBGnAfSowb+VKcgebr8fFukNGfNAmcmSifcAKEYs?=
 =?us-ascii?Q?a2/LiZKf6wwkxmXds9k11KWsgjQm9g8CfnK8zmJy4EIxIMWe0YZ7wleMD95+?=
 =?us-ascii?Q?1ufWOELIDSbxw7WYi2HwggSDYX3hBYKHN9SEeejsq8LwHMAn3sUjIfAdoTmA?=
 =?us-ascii?Q?2YK86jkFFplS4yQ/GRdZYKuv6es0VLNkpiKU/Ba1Y26o2gvqU0+cjDG3E+6b?=
 =?us-ascii?Q?VI6cCV/c/GqSZdtQO52512b/LdgVTjY9+r8bwglFmickazo4AdEyHiJ1XPpn?=
 =?us-ascii?Q?DU3Cvu6xz0sKSqrkrkJIPaEmbyCP1UYsdzinCXITafH4yiB7moTTblKdalOB?=
 =?us-ascii?Q?AF9rdLX9ZHuAX+NeWbYg4ONyCEcI4hlHBhWJkYCGpH5FNixyQFRawpZXqQUj?=
 =?us-ascii?Q?b9oEUsOwvuCIgrI3qGxJkHAykpEaqAGNV/a2aGwQCGlZ6ph3UCdGow2GW6bc?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 477443d3-3b2d-47fa-29d2-08da89d29380
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:33.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 haq1VTU2uA5ZReLwZH3wuxzxb33dqp+8WIqDtamo3k4NzF2ObCLWRxE06KMaXfw45LDUGewDNvtBA0995rnqBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-Proofpoint-ORIG-GUID: OEX8axgjkR3vNTwk4Gtl_RVeXGSfdZiD
X-Proofpoint-GUID: 6MHIPel5lBmyfqAZhnunJhGt9OUHTpBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98532

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index c2898a901..c2ea47ae5 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -8,7 +8,7 @@ your programs."
 
 HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 DEPENDS += "libxml2 \
         libxml-sax-perl-native \
         zlib \
-- 
2.32.0


