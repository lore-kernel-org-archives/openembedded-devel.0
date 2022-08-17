Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B687AC32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.30337.1660748967107288429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Zi6EJV2C;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HBuGBb027432
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Szf9/A0XcjfuCnoA2Lnwvdhq1bJ1ED/PKC9SzLRBHMM=;
 b=Zi6EJV2CcIFzS8lEiUTynMiqy/SRWV0mYg+vYyCRrb+npIN21raNrVjjyy9McVPTxH7U
 2rwDyZ2zT8ko90zFg6FUfWhBOCEIuVf8ALVWH9UaaKQ+ePdSgQaEBvj2CXdv0dQshRWa
 7bqHENZ5ug0IKB1dycPLmhfSvZbvoowu4MXbcjOc2F8gjhO7fBthewj0hbn38DlSUbrE
 BETHZSuLGv4/shehltWZ2J5Bruc4kbMTJns8DBMpgZC0idmEfhuwyPnMSGW5tHR3VO0k
 GqnPjWAkzz0r5oqI/il9kz77MEwSguMnNkpI2PoGw8GA1uTR4xkzPyMNIKo9EMCbES5X Mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:26 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9Qaa017296
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:26 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpRZOA9zxkLZ7zuAOvZ/LpdhuLSxCT0FaluY+HQ4fiAVj8sSwCZ6EHccZWuHHW556oAgeSpuyikZSIbreUa3ag3w8gq9Cwv4jbaqMAqGtJzVEU9ud5MEIcGpTNm6tSr+blZUf7wXdlAiYwIDKqZKtf1GEkTBvdl4tQSKyeWeRk6hesP+yqLatQUOBQ8bodffo4u6qTUm3wVbShsilMeXQWp+nytUJu0Z0X1RNxj1Ej8svHr8M2T6TbncOyIYOnvF09YcUbeiY0eaiwmOrCdsAZFgYw6UOLTuYvDXeKDl3kyhpG0exQ4TzUhh3NiXp+sjBfKYr9gDsp2GBhc12aUBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szf9/A0XcjfuCnoA2Lnwvdhq1bJ1ED/PKC9SzLRBHMM=;
 b=dONI5P8PSpUMPZxIbgYy/LbDprOkasxgcB7RzLx32F7cMxn8RyKLs8AtD0V68dgq0NyWh/tbofngbYstAxz+G5EO8c0DpY436279wplfkPyVI8bmDAoHH8feLYSUbrH0/Jjjfi9OFAZm/JCIdJjrrZ81pbEW+IJyD17OaYSPrU6uzFSEm1/H7OTF9LNUutsRF1GO0+2fiFaEZqLiEC/cUgf0+IdCsyGhtIUd0FfZvT/TramVT5n3Pc+Xd2rij0DiJ6FyM2Y0zYjh2M5nrdvkdDqNFu5AxY81xHFB7frjt3eE5QDnPBX/CIAIhJVwgpriwGzM18OYqp/RF/fJt6Fyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:16 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:16 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 02/10] libdigest-hmac-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:45 -0700
Message-Id: <20220817150853.2823101-3-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4877de9d-ad2a-4db8-c0b8-08da80626ea0
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UEfWXuOkO+wI9l+e88Muid0JlNT6iCr7nhvv0Vk5vAt0+RcZAXJVAuChf2sNhvJdUh1GNif23fk4l3442S6EIXyJ4oVPwbGY+V3wh5gaEJjZ7VBJ5TLLskIWAykz464L2I8qNiCkS2lX1H2EaYj2M/ji/3OSITCcNMCqD0UYbaeLltxt+xrsDm3dknYdH7rZTq0jwFJyIWiSTVqHVk2t5Uw/nhdczEZVMt9/5kjtqVb2rox5wQsNhl9zmzc9ZrgqoTI/9lXUggNzvvvrl0+x77UwqkN/xu19iQdAG69D7mmi6oNPHk9ivP0Gkh4tJ6WG1QX0z3CFSGrjvpAx+9WYxY15uDH+K1GrFBbIl4ehM0TUxacQD2CElZYfqI8N+cVP3ow4MCb8XOmHsqQ8yMI9JTafx0gB0cUTUcbVwuGYhRGYORyhkZn2eqpBP8czhD2b4ftlbEDD4TseRFL3IZBjfu6sSn6SxaF72lVAPuO0eoDDolnX9LR0q2XVE+t0PpbwyA+cE5z48ePLtxB0XX4I9PfPnIXRy0mF5vo3ROtrXBftbm/Y2AwQfK58F+pmeP+c6IVUr6n47/zdq8g5hc5c/hYqK7N4bx456Iad3YLX+/iI9nvHysKS4av/zEsHDLjeZgoUfrZEIP9pvYQNl4PaxyNJcAoHDEvC5TPOVVHLDtl3ImwuAFx/1xSHclXzwVyt1pjBdhbhwYtrcrZukRUE9QbN+vBB+5Ai0WfZ9ls4S3/UYx7ICw7iqWDskDLuAAKgOJWeOKTUTw8uBHijfZs8Ntd4mG58XwTya71IwDkCfRVEe6AeVsBmoEJAVH8gAlBG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YeHSs/46BZBl/lQhaKM4oZTIbTKM4ndH59SBgMdK4UAH/lr9qduksqOGuNgZ?=
 =?us-ascii?Q?Jz5FY86+LFKQ9nxBf024U70G2Mgc+lS+viGjyE7vJ1JcJ9+uS1VJixCU9qZF?=
 =?us-ascii?Q?O+cg6fce6l5hxl4EUq/QbplL+uzHQdELNor7pyQU2qgBq/tUCoVdqdYG3F1J?=
 =?us-ascii?Q?vaa82F5sSl+bfFSDvjNbm9k8KbwFocPrYVrbzKycEuzlAuyULqW6ddiwrBxX?=
 =?us-ascii?Q?aB0uYtsV387OK6cC1zUJOb+VNkiIysusBHO7P6VFratH2uibi9t0DWpA0oVQ?=
 =?us-ascii?Q?jGMifP90lRwmWEGomO8s4sK+RoWPTyfGq0MSp3Yqr0SJrGFU//EJqliJHHmt?=
 =?us-ascii?Q?khI3hK1MZf1m7eCwXBnUkWLF9F9lW9LLMnB1uv0g7yhQ0jZ9OjXR/Fu5g6M1?=
 =?us-ascii?Q?UKXliGpWOnUURhvKGEwG7Hp6yAtlpP/WBouCMi7e0+gm3Vc+BbnkkZ6Mvy11?=
 =?us-ascii?Q?ZRvb2OxC1CDni6/TXzxAugY358WCIlenZ+MD0BbOZfIlsen08+2O+PBtb+fr?=
 =?us-ascii?Q?N6Ip/mRUykJxg5LMQ8XYiyMbdzU6BnaKJTSf9iC3YV3CYBvHBYybyxijWhTP?=
 =?us-ascii?Q?UT9fUyObmcUKNXIciMCSY9wT6Pp4f4T0qf6RO4cfJ/ExSMLN4cl9dZY7Tuc3?=
 =?us-ascii?Q?als/+Nnfc4tA8Ma2W3z+sIkemeHu+M9CIUSAqYxLmNhXa8DzJbnmhy8/dre/?=
 =?us-ascii?Q?ttpu0gVwJVSPPGboI5Tg5fKGBEf42Uipo3l2fd+aXwcVP5Xr23HJrSvtvVvn?=
 =?us-ascii?Q?yNi3UzKw9SsXZ4cHLPlHongIuXGplKNJCGs5+3fK6ptmArM+bN+SqrzKmFnx?=
 =?us-ascii?Q?X0fojP1ldd6DBs52Tkt6VLuPoJ+k0FbRJrjrlBhFRojIyllaOpxvy1lOjArr?=
 =?us-ascii?Q?bAxSbFLsT9dgR7+QXbP2F+ScQNVN3O1osAYiohFibi59fuMtHLjxKyhZtZp5?=
 =?us-ascii?Q?aAPSlORcKCmSc7K8owmaUayeqHc0J7xqWwre6h1Hj4jtjTPDaHAbDcy1lfdx?=
 =?us-ascii?Q?S4ZVhqNUWurDACwOsEkWBGKqYQkLf1SAlDxNcC5UW9fFYp9u5f8cNXlYMWg7?=
 =?us-ascii?Q?C5zb5EbCSP7SHojdvVjunngLO/99n2W0eNVN2aQfF+4L101mDdttC7UCXyNN?=
 =?us-ascii?Q?C6I6OCS679OGJZn/cSRBi8eJ3FsMnYwQ1YvKOGzzcFQsGSE44Jx9dyIrD+Hx?=
 =?us-ascii?Q?obEmO1aj11Ic6kiabgdGtCWu1OMz32NJpKF1UQ43y85cHe5wMoE5hzN38nqc?=
 =?us-ascii?Q?JiFqJb6j8GXKGgMMd9vwhzxiZ4Ieo2WcNQhKgmSRvWSBki+d9XrWpbEtGHwf?=
 =?us-ascii?Q?02jNU8A9sSU03XaGWKnZlZCSIlqE9KZg0Vc2XAjENUCCg61QPqRBY+44S/c6?=
 =?us-ascii?Q?vNKVCHgFmp+bNDuGDEjYygQQctAvNF8Na7gxP4O+LCw4Wc4Ah3zvVMtrnIt+?=
 =?us-ascii?Q?QT3XwCTE6Nb6tTJMMD5w47P3ikg0oVTIiftMNvvlnvym+N2M/MvmOyQysD25?=
 =?us-ascii?Q?J0kmwrihTiywDOG9utj/QFfkDQcxWzS4iVmih2qRBvREvrgNX+8NUdc6HFoZ?=
 =?us-ascii?Q?P1sBEGKINIwryDxwoUXl8TtpPMfCs1/InpU3K5C57rV0T5iSgqcrKJ3moLN5?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4877de9d-ad2a-4db8-c0b8-08da80626ea0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:08.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /G3X8thkrTPVXQ6DeMu7c3t95oKBD/xarRRj7Z4zG1K3IEIMTkloB+8CFvYEBbLV9069wdPrZ21yLtfqB0I1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-GUID: EJ-yoCoZ0sf7-ubajt5jmNK8Mnhu8Nh-
X-Proofpoint-ORIG-GUID: b1b8MUt9Akv0rpL_qnwev6h6uVvv-fC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98295

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
index 51a2ad349..43b7f4d5a 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Keyed-Hashing for Message Authentication"
 HOMEPAGE = "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=13;endline=17;md5=da980cdc026faa065e5d5004115334e6"
 
 RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
-- 
2.25.1


