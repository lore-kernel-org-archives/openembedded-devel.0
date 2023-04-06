Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD15C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 07:44:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.152951.1680767034175214446
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Apr 2023 00:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sVOk1k6+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3460328d5e=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3366pFSS010882
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Apr 2023 07:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jW2f6Ka4hCbFCWrxsY5haKSACtSPKd6ftOay8IJt/tQ=;
 b=sVOk1k6+T1hOYBXTn2fZGqFv0p+Yu9EmsHsXNcl8ODuHlRoQlQwh43171Kbx0xAtI8Nc
 cH41U0LplsPwReCtqR5vkDQnYFrPuZfX3KImv+z2QjxbKezXphHaioFZmopA8q5k3usr
 HKxVKzCiF6+cJQCb/Q96Bvjk9UCm1YhnGWkTU26iMdDmFfrcvxuWWQEW1CYmcSYVgMBh
 wn6C6ISsJC6fp317V/Rq2Axk9Zv27xhL7THhfzPU1E7mfLqIWA8Vw2ARY6hALBVdfPGf
 Y4DNGzw1ILrWKSS1VNHUvzX0E7x5ecCXhCuPv37Zy1BUu1GrZF6g6Va11NJF/o0obYF8 cw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pp9u4nfhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 07:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQ3oJMvfbsi/8xW/ccF1/nXImZN7rsrjNflfBPn4MZ7a+SO54Fyvvgm7wquAQJcGF+eUax5HXoRNJXiiCMO/EwLq7aHpFzriajLryZwYdyBTBDoV0X8dy7CnnE5PX2zgrz5V6TN+3bw0iXcPzCVJ7swgjP8o6iukHESkinC7kcRVGWt7KVDwfr4ZGBepgwZZgZB7HiNzq5Bh5uVJnu/dQzm1uC8oKXUUk/ZKCDMWkHRZP/jncVJUgrgkXWnEcfZUjxZS8SVVNpbIuF2O/G4UB1dyDCr7QIaHcvfDlcGJRkQzF7UAarPJ0kpZ+qLXCgK/K2ROZxtxSN2i9uBLWO8tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW2f6Ka4hCbFCWrxsY5haKSACtSPKd6ftOay8IJt/tQ=;
 b=AKxNnjr7e4MidP6VS0jFUakFG6xParti198FMITJIkxb5IVHT64gtIFpSTXdNpm15xbLiEUM//Q1+kjM4puUXi6wCaBuvnexcj+CMC/a3wt7ZrVh7Oo6Z1wIILCDanIvDwSsZYy/S/RWGsJM40FCkKdb8Lm2wLj8YzqRsKwZiM6nfOE35iliPnbBjgjNwn5zOG2M9ZCkGt/YKfzG9el7j/EiXPApG+b7saBg4KCiLil6ae0CMTqyQoPlQVlAgI2Qqvbgxd9C7GS2OeYDkWolNQF274HTCu1rhejvnY2n8DVX5jxTiVkeKxdqxlfn5GkPIqnAAljO0Uq/K+Pqq0n1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Thu, 6 Apr
 2023 07:43:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 07:43:49 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] android-tools: fix systemd service setting
Date: Thu,  6 Apr 2023 00:43:35 -0700
Message-Id: <20230406074335.43460-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:a03:167::31) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 34fb9796-df90-4f06-d639-08db3672a8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d4b8khAvzZPIzLBoSRcMR4SFs5XInp5r0oq2k6ddMhwsQsmQKO9P70zXQxisC3mwl2NRM/dvm7HbVKJejohO1hovQiscZGZI4Huc7tvC0bLGo2kTjsUPx/uD5OhKrqK6gW20LAsNphz6H6Psf72a1VHfzoytLjTIArQ6D8YaQfgyn2m7uNcrxyqxK966w4BSNpgDgD9crGI+vMD1UTapMDGaRrdwdWLy4d2xy4bI/rKJXw/Nf5QiaIATlGe9OUY6SogZBagdVJ7WFkb2ZmC/JdXfIYT/VE+RupHj1RBL9pH0OXX7btq3K1ihWyThTbaNfJPRHMj1SKKYuAOpVzccLOUrye6WE3mJ/GVEZeAqsVzyAFZGd7QTJxLhoE4UaNLDq43FhPlykWboZhSVKaQUUG85lhwFU1JANN0YtBR6ICXlm7vzQzaAYgttHEAZAmICxKbEx7W0oRQZ2Gi/EYRYSWag8CEF2PNfKJD+3saQmV3NwLpV+/aZwLr07/oM8o9GcWodfpkfbkWfbW5ewhX09oaIZ8lAro11itxNHAZqT3NkFn+dEA9Mf0OHl7jcUgVfMr27tDhNa92SQLSeUNIirGOZMk8XIC34/wdI9g2/l+vKhLESL3XLLznyXuo3egua
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(136003)(376002)(366004)(451199021)(66476007)(6916009)(6666004)(66556008)(66946007)(8676002)(6486002)(36756003)(316002)(1076003)(26005)(6506007)(38350700002)(186003)(38100700002)(2616005)(83380400001)(6512007)(41300700001)(52116002)(508600001)(8936002)(5660300002)(86362001)(4744005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HgYlBY3s6PaGdN62c8tjkL/CHF6nt3o8aibEHs+bYgzNfspyjw64dgdeReTZ?=
 =?us-ascii?Q?4xSluhN7O41ALUx+n4sAIWDHxYi2dB8hu6D12p99JHkjCXHLbdVG7eyYWGiv?=
 =?us-ascii?Q?ch7gyL49El8C+Bkf1WMuizPUgi2F5beuWx/j+CsNoNw3lOrECW3EtzXDnURJ?=
 =?us-ascii?Q?/NArM7ekdwYqPkXmOwARnfOhPKz+YSTfuehqZUD8yIMzqyFY+oEFu8oMRT2O?=
 =?us-ascii?Q?TLhrftS6Oy1ifh+soPc3Ym9IBwd0/VubHU8QJJvk04ngjTtUnQxtXwL6HsuF?=
 =?us-ascii?Q?lWiKeGRB+ad8F+vgLoAK/b2UExTtXrwqkN7Q8T7FTlxZXs1pPDXOM1E4c3uT?=
 =?us-ascii?Q?BYhknKZ/4LIWIauyJ0f9gVhTGGSfPoBjPEp7JERr14Gul2PnCEN4MboLmsik?=
 =?us-ascii?Q?apEnBVFd8yOGuoGnuwk2F2GC+Qwj1HteXkdPhGd5Va2IM5nuvVojTSIkf6Tx?=
 =?us-ascii?Q?an5R9GWhh12SQQub8yIJIp8+3ndWAHIWYswQhVcYwEYhkRyDm91hbuAlmxEH?=
 =?us-ascii?Q?hrqEy+q36PhoivAjApiD9ApPFahTym8UQT2ZTo/X/Fp19BNIjzClY4ao9DWw?=
 =?us-ascii?Q?7oGL6RpP6gw9cHKmeI4SB49HNYjCPJxZVcpiPqrr6+CHFPn9kdVfBU1sn5rT?=
 =?us-ascii?Q?BhXEZW5oRIkF81VJPMYTE7Rr4B3K4q4Xci9gIpiCwKevs+yIKhQ/w6Y0uJQW?=
 =?us-ascii?Q?AN5xpo2Al46/L3K3BYpm4nrcXgNy9khXrKt888CAOtXwg27BGpfimMA55ND7?=
 =?us-ascii?Q?G69dFvU4xCbFu60GlLcR3L38KIlVJFVZQWuD6ItLoAUsSZMY9NRK4R1NwIZx?=
 =?us-ascii?Q?JelWmJr4EjHDa+YyRQsADsCTJI1mU4wOOsc2DmK/N/22DGoriVyEljmgd093?=
 =?us-ascii?Q?RNGpggFPpG7d54QXdJGvuFVWeq8Aje6wtqWkfO4+o+qLiXsIWZL6NJztsv5D?=
 =?us-ascii?Q?vN7vfBXHA6h0XkEDO9xPcs7j9o6n/7A1vKKWd2qcroNnKjkuyLtaUTbdpoQo?=
 =?us-ascii?Q?cXTkGlkdiySrKg5a9/D+ZVHF51+tEqqS9o1TYD9EzQ9yX32/2PZNA8tPUtS9?=
 =?us-ascii?Q?jtpMueOrQnMtNojVdfrWQBsBbPYyVUwnCELH3nXCh/z7hfFXv49eLK6LxPVl?=
 =?us-ascii?Q?WxR4Vr8rmeMu41aE55g2/09mBEhABpB1R9Az4bp2SjbmwTzaKJUhBcQzzWMu?=
 =?us-ascii?Q?dH33g57fNmK+Oe36JSfGY1lWCldIZUXQstyVoU1VJ1Bak1iTUtSuWpBquiXh?=
 =?us-ascii?Q?fESIDVFoNFuZ3+6LtCXcbaav/XdS3y1nxoBddXb9N9d5mwAPg+8CG61FhA9B?=
 =?us-ascii?Q?2ERshkYBPyejsvlRkyPOUEueY5HdhCTrz0/DFAQnykAdmVqOOM84rqGQcwgL?=
 =?us-ascii?Q?hLNxI5ziXSEXPrm1QdJ33gttiCcX+etP5BGNN0SySEH2KbslOeC2mapcZVLJ?=
 =?us-ascii?Q?WxlvGxJjVCAl59v2F+yyb7N8h9u0tV1AyeV3jqkbCccOxLWP/I7uIdrfTj96?=
 =?us-ascii?Q?pA0R3wp9nhSj23nuSWPVJtF17BzAPq//LQdBCNygAqGJcpPgCNpYCiLyStDo?=
 =?us-ascii?Q?0W7H8O9evQimMklX0eHKNECDR9KPm9lkWDfQhUmV2ID5mrUVX5kSeDxWu50Z?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fb9796-df90-4f06-d639-08db3672a8ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 07:43:48.8828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTIA1Wb/tDim0LQIGA5WAhoTl2OxjXxwrQxhdLA6tzaW4s6mTzM5B7hebtsmadr1nWjLcHW2BbpdXmoVSFzTKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-Proofpoint-ORIG-GUID: tRYPgKRooOdL4PHLEOP3HpO0oYOK4emv
X-Proofpoint-GUID: tRYPgKRooOdL4PHLEOP3HpO0oYOK4emv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_02,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=421 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 07:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101971

The service file belongs to ${PN}-adbd instead of ${PN}.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 75e837f49..caf55ed6d 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -67,7 +67,7 @@ COMPATIBLE_HOST:powerpc64le = "(null)"
 
 inherit systemd
 
-SYSTEMD_SERVICE:${PN} = "android-tools-adbd.service"
+SYSTEMD_SERVICE:${PN}-adbd = "android-tools-adbd.service"
 
 # Find libbsd headers during native builds
 CC:append:class-native = " -I${STAGING_INCDIR}"
-- 
2.37.1


