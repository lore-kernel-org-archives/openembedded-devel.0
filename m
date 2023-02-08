Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92403C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 05:06:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1597.1675832768162987027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 21:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pkkwehoT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14035990f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31851sHf032208
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Feb 2023 05:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=eOFkjgr7NGVPF9GTPKLBhaHhVvbeWN5ymcWvrZycK0I=;
 b=pkkwehoTkEZs5cMyab+nXbnsr2NJ7DFDqHxFIsyBye1vnj4QSm35PX7LX+jiK7Xcp91j
 8rraAmAK7AkR6Z4Vc7eopQVwirl3wWQLTySWET0rJxCe+d9exOR/WAOsQ0cO7IufdK8Z
 WhZTaOU1iH8w6T5/x1JBlfO7YZiB1K5Ia4MGLRGEio0bSbqWuU7wArsFPInz4WYn8R4j
 e8D5cQm/PzqyZTyJiT1BSSiBIg+27/ieen2nlXVmSvJ5ECq1JQcoWA+h2rlM5Ynic1W5
 O/i0NaONIDRBid+XoZOp8nTmw+NKPY2y9M62QTjIKYprq58eBXgRnrhOvHlBVLHpSjJy /g== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck33r8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 05:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR/dTZADtUN3tkLyAmqasecX7wUfzB1Rm5IgLty03fL2qvplhNva/mBe7gXqhLci5dVxDg3R/0koIu13tOLyN7Jq3buiRMW4COR7ys8hi3i2eWbNMjQVgbMAIN6RkyR1WrhC/Rr7Pjj0c0if5TUz1SuVIEmiupzubO7oY8Pqp9WGGfY9RgcMNBa/AVkAfsVIYorURIQpnAQM+wPJ4zp0JKlkJsCS7/FE5n14A3weOYi/MFhWbEGx/C2jEexEZejaq4voKwnxphUN6rFqD51KGTVDPzQA2b8/XsFlK/4wbByYsDPW7Xaw/DjdamYnIDng/dDm8pmMkfeLg9vqjUzLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOFkjgr7NGVPF9GTPKLBhaHhVvbeWN5ymcWvrZycK0I=;
 b=IkILLgG+0E9jXg+QblgGqlgqd/pAYupo5ms5z9UnJDsiLwZBnIaQ3A2yAuAnTLE80uSxO6+SMDeO8TAfV7USGeK5eeaSgM3hJiEoH8dvGqtlzjmuVrdbDpQvIAM54o5r4pnbNKt8Do6ZkQMJc2y8aFncyvgGg/8jF3vcGIG8xYjfhalzXt78+JOEaLk/WlANx+9QghZJ8CIVXFaBqVzw30iKF/WolD4enJItMGu9eZnOC+bOVoii7M+wNsSBryALiymQV9eaXkDWhJpjzfLpDtrDPpqYiyhwbvywAOa/jsXcH+PReDQQAI4plBwfmTKDdSKW9doHhp4uGINExrareg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 05:05:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 05:05:48 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] nodejs: add CVE_PRODUCT
Date: Tue,  7 Feb 2023 21:05:36 -0800
Message-Id: <20230208050536.110196-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7ec9c0-ba34-4b56-a85b-08db0992247a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	an7d43khUehwfwQ+1VxKyls+YQwZ51T6NqYk/Yqw1dVBVEhKG83iaxKNna+dzKsznWSD0z97sBqfdFQvzc4GGxXdEbicujedsEVea65lA+95dQ+LglDZcoMRPmI9iOJihhc8KKwGydCiFPX9yk9YvsLFZERZPyx8No+cxgTotQQdOEKhlLjFFLtAeaR8U+8Nr7PyX9Kc10TT2035PysMoiNa4YENbLdtKVIep7XmpF+Fto+7C1aU1mt7GvqByHZxqqd344bwJ1lMia9WcyFkfehSKGL9mnsiGKuaPTvJ/imPvpoJIl9ckdPGsDMS+U1o3ZPLJ7Hkroifgiyi19SzyjXTPj+ucZ+17m0UVAz05oKS3NQUiSiJp/D/qanj8dtAVxAi8MkDjuQ6VKlzAU61aYe7WyKg2717i2Y8RQ9hIUny3fFxzQynpVnk20NKZJtdVRixzujGRE7rRF+hOpVvI7drqyYVUGhyaMz5Yy5V6ajLJuxvQBoWYq4NZ9F3Mjrq+zJVf8dyPowZ6nBI8iN7T6i1GaZtzJx87xHviTe/6UQzYIQP5WTg7rpD9rvSdxibkBdlCYaDT2tZ6PI9FONKm5Q2rg+4Rcqczo5vm4zwaEtCKUiF/EJ/yjMWqf2B8q9AWoXGG8mS7C56mmqELdNPLp6ET6qnuiTSFak/QogBpd9q9DFrhfx+aIKEKzuL9JfpjWZVxStHwvbjNBZsug5HwOdHR2pu539QPqdFRkUeVqw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(451199018)(4744005)(38350700002)(38100700002)(5660300002)(41300700001)(2616005)(2906002)(8936002)(8676002)(6666004)(36756003)(6512007)(26005)(66556008)(66476007)(6916009)(186003)(52116002)(6486002)(86362001)(478600001)(6506007)(1076003)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+v74yffrSel1u61w/Jn2BZlsRRk1h7CtkTT63nJAGGt3rpPXf80YNerhgoDt?=
 =?us-ascii?Q?asktqsP4PUhnFMoQRnKc+PPN1+ypD09mn8juttRj/Z3Ycgiw0J4hNSArm4ZH?=
 =?us-ascii?Q?y6FlXneMbuxf8XO0/+dBNDOQTgdV+Zhzj4kM+/RN/WaVeZ+dW1i9IkFjOfRu?=
 =?us-ascii?Q?aS0BSpvhnqpOtoFhPSOkh30bi0R6SuYMsHxxSNxoBSxjkW2k0EIrZfteBBTM?=
 =?us-ascii?Q?9mFlwBlM70mXySWaAzFB7IXp2EsJvGHaPix4eSaQCWjsgMAg5F/cf24ylKLe?=
 =?us-ascii?Q?gXSnEHZRYCgJ2wngvgyhvtIDmUvY+gvQc3hCXBHseyQ/HGfA25dsGmDQJl+l?=
 =?us-ascii?Q?4ir2tkGGrE+qoVVs0O+vlV/XLwYYRTy2jZB0Ze2wo+/thDIKKgwuz+dZ+ucU?=
 =?us-ascii?Q?2D/msZ0RdYHK/MdARmSLhD0pUbKEliqldZVjOHSY0+7oI1wrAmBesKebll4E?=
 =?us-ascii?Q?kCiWj14w2NpXUDY/1qgQzxkSE+AuBXdoeDsgAyTB7wBX1T7oABmfHk+Gb5DX?=
 =?us-ascii?Q?Nq1BfdfCkVSCOCSuYabD0TVl3kbEKFuykOJD5DwnKBf/P7MvgZiHj9YM9o6V?=
 =?us-ascii?Q?tIaMu1WF7dQNGAR4GSOUZH6I7zkjOMQuBfP+jwQnmG15PjdHPEydy1mzpDUj?=
 =?us-ascii?Q?PKJQh/RdYZ+fh1CgrDQW0jl8U3SACR9aWl4Bb3leaAeSS8eh1d+oFkmhXRNN?=
 =?us-ascii?Q?M5gYz8nyGDryqByJqY4PCEvmP4Lj0vMe0c0GnlECJOGNx9Of4n8c7h8eTUZA?=
 =?us-ascii?Q?JblRsGRUFPBdQlOaYpQHessSwGGl9l8ht7HD/XC8315EOCOZwsxdv6ji6Sv0?=
 =?us-ascii?Q?j1MP5zxyp1DPcft64ugm7IENRa+O1OL+s8F0JhErY9ZsGLwU+Yo0EH2pQQKG?=
 =?us-ascii?Q?jENSARjSb0+WZDrGrUWhREHF35p0dc9PFDiicrIjBBtq5J2P+vqyFYRmuFZY?=
 =?us-ascii?Q?SgfIOJ/3BSHOuaaMqjD5foG0j6pbyORZbZTLosd4WhkY+KAQPnfvI0W3Aa0w?=
 =?us-ascii?Q?inBdwZONIwHwua174y3HIZm4Un1OYbQSfMjdx5f03BGrZJtn4h5jxkHsPibx?=
 =?us-ascii?Q?RTDx6AX+MEr3nGZPTDHSfNIxHHo19G9bVyep4JyDYypz7nSqhrSI3OyntMBR?=
 =?us-ascii?Q?Vx4fywFpiQhNCy7T+QoPHqhdHYBKeFC55ECwj7vWovUJtnBYaktcIkaxxkTX?=
 =?us-ascii?Q?n4o2CeltW7G261DTxtdHrX089YM+rvehgP3qIB9V8Msi0uW20xul0JxVljdH?=
 =?us-ascii?Q?vPDqh82DvHMxOhE8z+RwO8AEySGpafVJocVY0Hnupqr+d5wDF92H/hYl7q4C?=
 =?us-ascii?Q?0W/UhJaylchOaS6wrBst2IBJQ30CEbwVGA+/6OwzWb2APJazTyGQ/NDSOGp9?=
 =?us-ascii?Q?1Q6MsbiA9hkOs6IoGk1qsm1XN7Qqzl73DrbmiXSrRM4aQwarGbv7u25jR4l8?=
 =?us-ascii?Q?40Jc8qjJr7XxhDKgAZPd1SjaeeFE4nLYza/9i5YXLmWSfy6n/Wnlf2pZ586u?=
 =?us-ascii?Q?wg6kqWC4O/uW4viP/kgvZLdwDy4sE2TSrkXfIgmyxmXN2zHQgP6bTrdmNxMT?=
 =?us-ascii?Q?PFrCmHbf4ORCMH7epgA2Wb1Hdg3mOgY6Z2eajZ1O26GHgBBXhLEfI+rKKBV3?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7ec9c0-ba34-4b56-a85b-08db0992247a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 05:05:48.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aww/khIac5oUC03wrzez7fyaphOUtVePCvI/K1euCI8AdY3B03zQpNZsDF6gAmSYc2GXGHCRMgv8oD/iiRw8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
X-Proofpoint-ORIG-GUID: lkiemXAzpesncGxfY7TTuGpcmGyJkjvG
X-Proofpoint-GUID: lkiemXAzpesncGxfY7TTuGpcmGyJkjvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_01,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=449 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 05:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100967

Some old nodejs CVEs use 'nodejs', and recent nodejs CVEs use
'node.js'. Add CVE_PRODUCT to include both.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
index e96913e56..96e70991b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dfd7ae796baf5326016a3865ee1dc632"
 
+CVE_PRODUCT = "nodejs node.js"
+
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
-- 
2.37.1


