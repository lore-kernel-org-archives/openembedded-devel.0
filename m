Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96DFC48BE4
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.30338.1660748974999527240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iX0lItZ4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCvQTw030208
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=VPrZ6XOp2w32KuJu3W4RG97oa5GrBM51W+2V1ydRMvY=;
 b=iX0lItZ4pusddm1aIRdcH7R1wvo4H/94iKSBeic4uUvpDW2YV+cyf5xRf0+W9ILESyEe
 CAY2i/vYtKqvBntidwIdIoEZDPHfdAxyWEpntTqPBr9bMi78tXsEUwgCqI8MF1D9cLRF
 xa2mv0crQCaczDCWrqwkVGRPZKlW3cJhG4NvolsSzmwdG52kVOQt1U3+OuWAd+CaH566
 sOcZ6vUNSh6mwa2YjLGDypumFdOorAzru7HVZ+iMNIPcQFYdpso2AexpnVs9CT2RCvhu
 rmdD9iuSnvjbPpIWkP/Cd37/zdI3ETphA+4zWWvs81v+yN2PkT3UkhZNxxcvlyEA2q7H Ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160uk46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF2U0Y012695
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160uk42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 15:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWQvQ/ANWbXvhSKhualn23uQPh54zEW4I9BWAw3VpFUJ33+4QyhRAg3vl64ImxsPE4+T6l5wHwCfiu+645MkdB43kBUGAr8sD2RMtJn0qxGPXiBvstmnhflRvDCYU4k2Sd/GT3qp292FVeHJHn+ls+oF9NMm2Z1RSAUOAWPzyAANEWDcJ6JIpBDxmgzs+0qoaJudOisBDVksKIw4LeUdhrtD4B0IWRJgXT7ABusH1amnJTitdOgSZooVT8fOCeSI8i1+1NmWcdFnUnGcQa/69ZOF6ttkvvHtdAUODd3evYG2U5cWKdKpVH9CSPt3Q/W0IeqxykXtMUOXhgI8a7r8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPrZ6XOp2w32KuJu3W4RG97oa5GrBM51W+2V1ydRMvY=;
 b=FR9hDvLkm1Z9lTD0KgXadHHuhN2mZ1ju4s/FcJ8cuREFFh8IApYWvr6GK9DSx3slfAzbPOc3ksqENggUA7fSZBNMXm1KX6c4H0tj1aQP2EbMhvg/0HtzfPFwOT0iKa9RKqYPp5k3e0oRVaow61tE+tjgvL5cnM3jS5pHNddsydF3L04X30PmnHr3xPHD8EZLnHtIT256WAXB2Dkgf59sSHWs5bosd1i9MmNo/H8l+j+3PxVSJSRvz8FZRr5JcmtzS9UIdULyvSdYtValSqQ3Vh2WrXpr+YtLX3sV1WEBRl6tZFlSqphtPLwqEOX0NW/KDuVW2q40dBQrC7d2YDO+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:30 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:30 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 06/10] libmime-types-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:49 -0700
Message-Id: <20220817150853.2823101-7-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a5b863-82f1-4105-e7e8-08da806270d3
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9YlkKvdMV3ADM57SZ/0+fJmCHhzwLifhmdTzPtRS72/kH7YntVAkcxRjqmvo4akKu1saQv76XyVsWsYAc0jNq/0FKrJP1N9BsOXtyiMp3JyXojJRhEgoS0XM4vsAZ0nNF6U6/q2knCb1/3Qd2qPeGOck0frKyokX0Tm7nuSr8BmRnDyN3ybvHCXLzB2mj11OPuPZpflXHNZmhNXALdde8wfvrMCY6grQ07fzSSNDKHXvms2DxYq7dQs0FHPXs2ipys+wKj3pr0TZ97lAl7UXZ0leNWYdzkXiSm5OpvwOCqB3lloLYQ9hp49bczIvbOjm0PGYZiSXz8nhdPAm2oczRDbuXrk/9vnMRDtMSEQUrnTOZokfo41MwTNWnPACsV5b2NPq7kTCgdAqfzksCwcB/YDp2UXYRiiRuJ9pfhRv7zqx1cbl6iRwHunmKDl6YIBiOj+/w0RiK0kTw5YqUEJuTX9A6NDuN2AvFDQPRB4qL814Xk3q1XfZphzpIf1g8RPR3aFZN0CRZD/gAQlLl/K5MVWQXc2NV9E9sJoDpkvw/zn3owdRmai7kVhjgI9ijdKIBkVJVJqwIZhPMNEETk/XhF/77Pp1QoaenkhS9WJb5D2ykl1ke729sVVfOeCCdBcvyljotavNt9/QtRIwxZFQr/ncZj48LhE6h/ktlImruntfVvMR32qPeBezAP/M9ogosBzH/imaobAocih98ChJ7dS7OgfGRwyo0ISc3yB6rvddnpNsTRZzpVgy9dpv2eREML1c6HscLwQydW29r7uaxofKsLweVyAhXHna/9AmxNywW8X8SerkY5LOtmJh3lRH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UyIDSltAy3z7d53JHROgdcyy6lHZsrxg69YnXD7zP32nGuR9Jz2FzsNuYmIf?=
 =?us-ascii?Q?OPrnBNA/sbs6HjYctjyTTmc+uM2xy9e+E7EO8sjqL9vK+1R6LajUsZ8v8k9X?=
 =?us-ascii?Q?T0Yq/Aqh7TFZ2oJONUiTEt8/fkmBIYUm2+rsdS3rUDpYDuFQoQbuxyH7dwI+?=
 =?us-ascii?Q?77lFwhZJ4Q5cWzvLWCOCEtB8nW/eAqkPz3VUzLl2RG5ugvXef+eQnSVmu+lq?=
 =?us-ascii?Q?FXLWFazBtVp6chhEE6uNJdFCCm3gDR1Xrcwvz9w1wgjExyjz3JyySm1sh29a?=
 =?us-ascii?Q?PDq3RjcSaVyBM922MDTjEw9ck6486JVPe5SagMkHjpLSZNPJGhyDgPgSVj2t?=
 =?us-ascii?Q?mlwaSdfuYdfZ30DZPE1hZwS9PhUM/Kno5p05uzgA5W0gn88J4opEzuG8yDAe?=
 =?us-ascii?Q?W2oBapVDAr4P1zWDFGp+mbQFjKUC0CDcZJLvE+rf9ZFYM0nCZJefQ629wScD?=
 =?us-ascii?Q?RXsLFMTyiSysIUP/rqQaRuNRitkFSbr6DdRMkT4F9RMZqtNu1Avgxaa6gy3S?=
 =?us-ascii?Q?pslPVCqNG80aROIp5hUTWFDFFDyFDBAUM1aSzRIoWAfZ+QKCNQhznRlZlwJQ?=
 =?us-ascii?Q?FDDja7t+eEGvYgQfmkdvm3oxcG0kQ+iGxRXf6PMR2FCoj5DFOI4QjEyBIXKO?=
 =?us-ascii?Q?NAqJXGbNM4fIwvqoLkJIc/bMJMEmn4Ng1P34vPiURhFah76z82a9336wzOxD?=
 =?us-ascii?Q?Loq1Z9MCagYvhyjY0GZAV20S9M09TnaLvR4kOuBrNzzYntIui0UX4YCGKJQ2?=
 =?us-ascii?Q?oMDrOM6jg/4g3KXYIHTd/39SKUI4+ogijGV3mkQEoPXd7kc1PgrEprevV693?=
 =?us-ascii?Q?n/uFuQwCB5B236k32pKp4t8nAkCLFcmnPKem3qM/k78JdI8sEchFVkGBwZDl?=
 =?us-ascii?Q?JZdKuCLAH9oR9PBYt6K8p/cMayGXyZsHElECR/j4vebSwjyueoQn1s1vjRej?=
 =?us-ascii?Q?NgKRYUpZSG+4b6TFm0m9k01rucBoUfXdWCROZB8xCChCjgRXI25xfJ3XNveE?=
 =?us-ascii?Q?iv6+6+bSc8+I81YZjBFJ4owFJOeDUpA4SB4vyWTE1yFtNVeFhzO/IFi69NV7?=
 =?us-ascii?Q?7YvTU4ZEqJGdFIOKh+qqsepATZNg6pDUgbm4gsoL5uP9++YILCUUKle+PYpy?=
 =?us-ascii?Q?5GxqxabSe8ptEyZJd/0BZ4xm/at7SI23KnvvCqJtqUF6YE2XEUv5s9mtU8ZG?=
 =?us-ascii?Q?cZNayKgP/onPRvctRHYOcMmJ5V0nhIx4Vas8bK9NgfDwpmhodxq+fhFJJ10n?=
 =?us-ascii?Q?9zJ/3opATVwNg9QftyXJizBHSgv9vhiIfVWIsW3v6E+dpOhUStkO+6Ri5PAv?=
 =?us-ascii?Q?COa/PyeWF3N6GtjB5B9+ZzOhOJzijH5N3+UIoVnTid8v4CGjWR5BHn24i07b?=
 =?us-ascii?Q?r6LAOhuyIcKo7RBQ2UMRCA8AEUKo9gUj+nKjn1nwi8FdbyhNZMyklLftXNsv?=
 =?us-ascii?Q?PmcJPVFbf1s+G2Di9M3GoR5sGXjpBVU59jGexEE7LoaRWbx3e1D9AN1UyP+c?=
 =?us-ascii?Q?ciN/+GkDQLcoomhwilQ63Sgcy54dXZieMzRnYzCqfNgRBzOfWCPUm6scnub9?=
 =?us-ascii?Q?YZWBF83E5us8DzJ+cZPNu6A9CAxKMTqoEqLAAC+fkV/9eFDuyuHb3iJr735p?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03a5b863-82f1-4105-e7e8-08da806270d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:11.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UKz1DZO7oksuO/xut26DtC8oVq0N2HHsuxSha8ARDy3bLIiPiTPjb4ZfrnFpB5LlxvRpQZxPYOsXNoW71kMn9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-ORIG-GUID: Uxlp13QSzPDzmEYvMrE5KVJmZDw8i-Ab
X-Proofpoint-GUID: xFYUhODKQhTamUXrBmNv4sqmfyT8TVJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98301

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
index 2c06728ed..d1f6f8c59 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
@@ -8,7 +8,7 @@ one known mime type."
 HOMEPAGE = "http://search.cpan.org/~markov/MIME-Types-${PV}"
 SECTION = "libraries"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
-- 
2.25.1


