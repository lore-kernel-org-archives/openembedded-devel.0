Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D627C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:57:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7520.1678283843346694968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=H9a3gjZ6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24318e24f8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328Cr5nC024015
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 13:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=gwTUszYwHaOB5qvriB00g2rybwEKqBQj/2ilcxyS5Nw=;
 b=H9a3gjZ6ddBrKTJEN8iAIs0IM9QE3bQaxJwZKJcJVScwsHhqEPxnkqu9cD1eD359U3Px
 5NYKWukVXmA72RwF/aRzYOHba5Msvh4DwfqJV8E3T883cDAwVJ8ozQMFc+9oHtDv+WUj
 YrFwasU19/+DYjB8Z4dQENMduG2CG4XlksXQUFfiP3Du+/jTru2QKZbGXpdyLzoVcRCo
 eTwGYEVfHIiAOJA7LB+BliS5/lkscjRMPHbODw+8PQUggU/Q/M4BkoLoqZuvXyl86ETD
 BMGnwezKLvk+Kp+KidtzI0ELxT85Uog1U1laeEIZBttHmdIkVP1VZBaSgEyMFaIiN+Ne yA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6ghm7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqOhgXVo/zJSA+sxB8LRSkZUm/xtcUpio63EgYHwX1W3V1fNy0ETXORBw8Tmev4c6vGZpOKdojR2YQxog3rEUQgAatk5eltgB4oP3deS/wkHcOuG75K2q5IVNrv3JYXzqGqwldZBWsDTBa8+elH23+eOy2MfVR++c7MPpF+hFt1oAwqheYKmcZzZ3+PKU0jXxUlesLNy4bfsMw2JT2Bezi2UR+NauQ5r8AI3fU4g90AggckK1uLQl+nkUT+KB+oH/kYGGDDofy5tUy6QDLa40pCGeiW43qeuv7u83dnD1DL7JUq06WfLMitJa4CHLj7l6CLFHgDhtIFIfXe+2mGrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwTUszYwHaOB5qvriB00g2rybwEKqBQj/2ilcxyS5Nw=;
 b=nyb/qLDpZwj3fnqspzhWBb5UtJs1U3FlQrQJvSsTONC+OhcZV7jUoMjRMM9PFXjfl2gAs6xMqsc+02d/bV5tgQ2G4FQmY84gc3EpVu9TAdX58F0v+7INKmGGkyNaEX8LazPpWUT+z7d6J3HKQFOtPrJBzxblrJAsmUOGTTe9+cTsZrgcqstLcUHDRCfVVRp51RkEMXRdFwr+UNx/zG7uBGPGCxm6wmb33hCL+RvZ6i2qIq0hcxBQHWyX9+Nvo6weX1dftZzDTBGrXFZcV5UsYtLhTLKlUR64xCRvWf1wzlclF0u2AmRrPrbxLjke7aRYnB2F0N1lrnlQG1P5Zf6ruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 13:57:19 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%4]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 13:57:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] netplan: add missing runtime dependencies
Date: Wed,  8 Mar 2023 21:57:05 +0800
Message-Id: <20230308135705.796596-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308135705.796596-1-yi.zhao@windriver.com>
References: <20230308135705.796596-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ea1237-bab0-403d-7d24-08db1fdd0871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/OCXkit4G9eBLjCZ59qYry6j9ym1rWztuyMIXAIPaz9wq3V6M4PjR4eRXjDj6dnugewspUWcpVB9IQ2/xDx1BukDV2qULCtfITIKklnQql3mUXL3yaFHKuFhL/OkS0RdeMQRCV1X3giyPxH0/ze0yF7krk5MFwhrSgeH6Xfh3cTPLS7E/fzqTwrJefW2/6SymJ1LCqGm7drdgclzhskdMQeM92NvwgZJQtlpKHdTbzfNthQP8Qtg7LQ3ThBLp/V9V4frB4RFbcfErGduirLU+88IMHw3RWzXtiwLRhLO+VvRGz8BI5lIpoLpvQaDeSXdZ6//Mv37EQ25YkCCJjOuvqVWr/hiIZdSAKSeFKiEMFQizF2jGn/hY7ihA+dyAAynitIlpuvMTAk+MnHpkF9vE8xRXWLrN+9TnD73V6aTnEccBY3dG/sQd9OT/+TCaBRFmu6L0FcVojC2U6Iiyao3znzf0rJ/GWsx9Ov/8Sj8d2hh53Tr0wmJ5XcppoZTvQ+V+5pbVqDCUejA9hEgcQgipfGrKW63huuYHsxKRWOp5L6A8b2taPEgTB8bb3POdRJJztpaoGHQh4JNKVfvPviKc/BbKm6xeAnFaqHC+HM+errCbb79kWKEOT69TChiGm437Pg6rYUhZyj/MsJ79pwEffn90+EaAOYJmrx808UTnmbG8b6YX9yXB3d6RI2SN5sK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(366004)(136003)(396003)(346002)(451199018)(36756003)(8676002)(66556008)(8936002)(41300700001)(2906002)(5660300002)(44832011)(66946007)(6916009)(66476007)(38350700002)(38100700002)(86362001)(966005)(478600001)(6666004)(52116002)(6486002)(1076003)(316002)(83380400001)(6512007)(6506007)(2616005)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z8iixuVB9+YG8kP/3JXtbYZu3UwCRazT+N9dX8ehVxInMmiV5lofjNmKDOuq?=
 =?us-ascii?Q?j5CVPF8pj+6H2oEpqNzG66oHkOKLahNCJqm0YUh9OqebXgqWWawyZgNDCnIS?=
 =?us-ascii?Q?E9d59ymQeixw4dU7nNbDc44gEBrCFiB9gJ1YGjpSgAn2114QzpwOckpmYHZw?=
 =?us-ascii?Q?Gf/12EQWiCIMbh8qz9YYJw19aiTb5aptvsQvQdqQmk76N5kKKn64mk1kmB+H?=
 =?us-ascii?Q?eSGV3LzqPXjZ4WbImMGy0clZjk1ohiF/At7V4mzynXp77ITCFPcCOTJEzCoP?=
 =?us-ascii?Q?Q3b+ax9gpGq3XokzaqXsdssP+0FwRQ9YdEFs7Ls4vB7bd1syJWyU2hcMdKI9?=
 =?us-ascii?Q?kuGWOuVIlki/pK/Pz5LaXTDVwrF1XcYG5sdqVdRKMLeI9S2WxZ2OuAxwFNJ7?=
 =?us-ascii?Q?oaGWcCAjURK0rwX9hxUOl4iWC/uk6FDDhUsAzZ5RROIp0cZlHdw/+Y2aL0pj?=
 =?us-ascii?Q?Mw6QKRjl7kAMS91MsTyeEO++ZooWgD5Vtx6oLjpne8gqYUqklyGTFzEn9pBU?=
 =?us-ascii?Q?Yiz0O74qRr4V3TJ6KpRfQL/S634moAzZL/+chJ/BPCbr1BRslZA93rhpjYle?=
 =?us-ascii?Q?NmgbSWvlxsuGS36ONgJu7k1Q4ecW7xi//et8AqrgG0d8gI1lJtPnpHxcCl2H?=
 =?us-ascii?Q?gHEVNa2E0h5rpLBcBHDoaw//Y8C5FLeWa90HEhcHor/g7T27UgLm2qSOvzNk?=
 =?us-ascii?Q?tUqmw/kzamVab9beb5JglEgRwnKirw34WAogWskVXLsi0sbcRajLzm/xT0WM?=
 =?us-ascii?Q?tx2pq99j0MjiP8Jap6uJlyabcVQHMQm1WoynrBEujpEIf4mIX09z3o/YUGub?=
 =?us-ascii?Q?9meFMB4+dHgryUJJ74KCZRDuYDRJPyaT8tFMvKQFYOXHOiEfHMBakzourceL?=
 =?us-ascii?Q?9Fw9gD33UKO55MTFvA5aqVlyLWIzfls4NllK+CS5cM3XbYHwgfKKfUyntRzk?=
 =?us-ascii?Q?Zs9jcfdli0l0QBm8G8U3j/SRzEVh90O2npTM3DKy4c8dGOgjPpRTjp9pnvrI?=
 =?us-ascii?Q?OfYW5OTMVgVEL7pCGCBd7XVBXW/LlzZj2KilSZ9/AxSMhJy1BgzXa4IRjL+Y?=
 =?us-ascii?Q?4uIvRScC/1UcRxKd4kjEspEczSF6UEGpZIap24HP8+pjWmRpfOTxg/w++Yzt?=
 =?us-ascii?Q?sBPXJUGpHJXiAR1FpE6i1jaDEiVAteKRX9zU+szDb9WzxWZ5p2yxwgGEzjXj?=
 =?us-ascii?Q?iTrUWaiGSCZHktXo++hjJ9Tx3+iJRnOOEsBnAzfr6VSHkiM2FIWBeAJkQd7A?=
 =?us-ascii?Q?sV3mhKdLQRCrzLfw6wVTMi5bBj5LT99+U/0HmY/CQdeCKsmQ9FvuYTLTAWTR?=
 =?us-ascii?Q?SRNt3r0h19I/FkgKbv1plweh1gVFjkrXir3/rPvPdqTHqth+MrsjOeHbW5Kw?=
 =?us-ascii?Q?mVuscB93b7Q3g9XJ2Gk2RFYw1jKXaXZws4+jc1m5VKqiFZR8ktUNE47ydso5?=
 =?us-ascii?Q?XWXZbhpp2Wr3vniiMRPChOHu+7fiJ3RmbxklRBvAt9K5UeRiXmRsuGUtNJYm?=
 =?us-ascii?Q?R/NI+8rFdSyL0v9NoYLJI/CbYXfOVaiWL2XSHTAIKxTi93lVJ+M89ffZKWDv?=
 =?us-ascii?Q?x5lSNfIJ2KfzvQzS5hpcWbjPdwCC8OTnOv6guZTY8ahbseI8zMGboh4B5mP1?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ea1237-bab0-403d-7d24-08db1fdd0871
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:57:19.5445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1NPyOYwItYVMGIWv08uU6VqwQbVKvh8errwIgK65w/O0HNJKg8tnZHl5YNG2xbGv/O/GmcJ+x/RLB5fgwLyjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-Proofpoint-ORIG-GUID: gWpxBwS257SpPW3dypAt-axEJzTEktSN
X-Proofpoint-GUID: gWpxBwS257SpPW3dypAt-axEJzTEktSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=960 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101425

Add python3-dbus and python3-rich[1] to RDEPENDS.

[1] https://github.com/canonical/netplan/pull/290

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../meta-python/recipes-connectivity/netplan/netplan_0.106.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
index b7fe7ae3e..8c1eaa550 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[tests] = ",,,python3-nose python3-coverage python3-netifaces python3-pycodestyle python3-pyflakes python3-pyyaml"
 
-RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan"
+RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan python3-dbus python3-rich"
 
 inherit pkgconfig systemd
 
-- 
2.25.1


