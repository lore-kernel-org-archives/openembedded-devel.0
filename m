Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1277C54EE9
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71587.1661786672114049087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=agcho5iI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TDhOxu009749
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=G/vtVKuaRnsb9wGoTXaPRIqE7VdaPqcPsliaLE+zoyE=;
 b=agcho5iIbJhKUvwJTQzu6tWFcGeKmOam7gfyehW2EOTwkWikuUJtnkF51ZCICbM3q/XP
 B9YIlqh81EUxMtTAkePhHIZoZT9FpMcRRex4cqsg8K/WXimevIvCsqdT/kA9z16hBm53
 PzB/DX7jbQCj3cSJJnXmi0BVdC5ykVZnTNKYXOhYFpyNtJgXyeWwkD4fQhCEJJ4tqCXM
 C/HXLz5MuD4zG2eyum/Mk6xMcx08IdrPdvw+PYU5CbT5Vk/dUthtQWJVm4kRYysKoXw3
 e+8Sz/rdbUKTxhaA/3Q2oCJ65jX0yekztGmzB7NRYqvX99r+uHaki6sieYsOZXy/tiz9 dQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:31 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFOU6O032698
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsvx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnUWgLWMFJlYucA78ny4T955OHldHrBHWvs+wazPZUOPeMuria6nLGymXWFUtgdyxmC5eplrQJcTrCU1wRVpilaeNUbjg6BrSg0zP1HkCYY/ARXCTlTzmmlWppREqOU1KRU1EH3SY4GaRLaR1Ji0rrXp+UNV6LvK0KF+zwX8GHyEGTTEsGIRAuyAWRY8J4ziL9AOaJfmCYWaXGNOwRkG2JKVMYMbuKZM/eeXyHp1ppj+bMCvsI+pQW5IqupmMnNeVff8efGMd/Qc/Dz9a7H8WYXwfel3Ta+vxaezvyscVPk2s6c4wQbhDy1dWXaqkwWESIPYtFB0Y1qS4n35WAt1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/vtVKuaRnsb9wGoTXaPRIqE7VdaPqcPsliaLE+zoyE=;
 b=UHj1BwE/BnqZmY18jbpWg83Wqn8feGDHhInGtFQ+y+9EO8pMqNeLHmnHfOIzcNcpcA7JHWEYwnG10UjAFEIif35L61ZP/PofmcIUEujP4ufM8LtVlQbba74XLMOa5ac2SAkHhO8vzAUZpPmiGgcCn6uBtnRpwkS6C9/bnUrKzz352tadxAp/c50NyrFVbTEUNm04UBTw+L+I64el7sEDTdaMevT0II851GcRODjka/4lMQYETwcRUQ0MAy1QkY8WsTrDLO3PR9ZDjulTxJnDfJielJFqdVk/D5sGvLt8Z5lgAOZVMsQMGflt7FuXZKPiM3uTNc02xG74CjC4ZP1Img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 15:24:29 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:29 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 02/10] libdigest-hmac-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:06 -0700
Message-Id: <20220829152414.1757540-3-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7673cc42-b3b9-4073-8c90-08da89d290d3
X-MS-TrafficTypeDiagnostic: BL0PR11MB2914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5LRVRNvM0qyqrDxRjgxFfWUOy7Gl2eNUeOqrCWgHBLNj0J9p5JkCiMUgH9kCbWXiep4vvrd1rOJTARIa9ed6GORDWZyGNLKEvmzLEpwwIsZo9g2cHtDe5QWdcWA07NhR6/68e7yyLcjACAbAXggRS689FjiwV6ZdqTrAQnH5ORuBK5RgxCS7J9Z3qSPyaDi/2MQX31WCDeUq/YaAQ0szQpuF/LkKJW57lu+z7jqei7o3HFhXI9Ef8da3D2WNzZSi8P+bXP8GaFMobIhvFwQ9ZeJI2OH2QWfLTE+spATjefrFLIm9FBnzlHRnGZS1OqKBV5w3wLd1TmhVGUSf31aH14omTLHNl26tRRzFXohZyCBKEB00mwxtCjXoIoUbPVKyp3OxCLO0gfA7Kmc2ntRxKfGr0OOFPCIju0PCXN6YgHyq77ZA/RyBfLOHjIM5qaKqAigui8Uw9NKXQOp2y3694QhLi7TL/TebowbOFIG7dwpT/l0q0ocCIvl6h0+SEQ66USuGT+6hWWBG008EN1R00TkO3yZeGmwyUy8QdaW3qIw+FCZnN7+/PygoNn74jDlbtMXu198inb4HmJYfgq75Ij4xOLp6YvvTT8kPTETtTXRrqlXV+HaEnhx4Tvzy18p4zJ1PnRc+9m8aL+yNT8VyyGiuctfb/hdvlcUFZkt+0VptfCSWj9NrSVktAY5vsQ6tEz69U1z5kKghMSGRvxVGZruNia/JefV4yDtWZ/ZxIy0BSvMZeAhgKG12PM2yWgWxXpDdOMy5UD5FwXgqrshb+dTeUnGrOAHuGGcJuP0keuA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(86362001)(38350700002)(6486002)(66476007)(66946007)(66556008)(8676002)(5660300002)(478600001)(38100700002)(41300700001)(8936002)(316002)(186003)(1076003)(2616005)(26005)(52116002)(83380400001)(2906002)(6512007)(6666004)(6506007)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b2zkBqfa+DlgETZGQSKuZt3cYoxY4QLcOQ5yGK6vHxC6KnZGnsbA/wuevg4S?=
 =?us-ascii?Q?/TvucjlL65A93aRbWRKfVNY3/SM9EvbauY+R2FFuUu/OaCviO8WBNirnhTZm?=
 =?us-ascii?Q?7e9UMGh0ihWmBCOoTiD79zMMCXyTsUwnXkYbbSHCnKfVnNmaeE/hQyhHU7mn?=
 =?us-ascii?Q?hKU6yOSIdLq5IbxQkeN9eapnWi5Bs5mxgLESTr/AIkWo0k5aIGHnSSoE1aG7?=
 =?us-ascii?Q?29JP3gbSryOGNaLzMli5L84xr1gQU4o1uOnh9Pr+15o7bzF7Mbh/s9JMFP7X?=
 =?us-ascii?Q?kN5hAYun3UHvfbn7SnTWUdLHMMBV/ns17X3lrHdL5bhLsvfYWM+2Id1J2Tzo?=
 =?us-ascii?Q?ENv/HcK8wSgkmmFlp1UpqNc6hKWmEHQbniHMZAs4SBb+XUZQhs3ape2zCIWx?=
 =?us-ascii?Q?0HgVlZs5exWJIJhaEQ4FrDzGSiaq3BQwVZjGJ4xjPBu8doQoT/xIDrdOAqQj?=
 =?us-ascii?Q?D2tnng2j1naJKSQ0vEEtAek9uheMnS0oIXfzTTrXYKDMpOkVWVbFyRE+9FHU?=
 =?us-ascii?Q?STZWJ+nG7ibt87GJR8J/K2g3blGlzhfgAwcxyyMdqTpUGZJWT28kaKrk8FC8?=
 =?us-ascii?Q?lakhbNJROZbOdrSnByI8wR9gzENWqL6WLSwwXe3A3BUGnubrHvcxf8sZGwj5?=
 =?us-ascii?Q?aM/0cKqADc2wr+LDi7d18oHUbn9vWx6hU1zINT2bXP5FG3fs56+9x9OVgovt?=
 =?us-ascii?Q?mZmDTZkZrG0yJswyJb9xoe96BdkEnaPq/XVyxA+Gtv6c2o19yOgqfobzeKg7?=
 =?us-ascii?Q?1dxtSpYZaNxwUTEZOpySX3nPGfE+ymu14FAlfpLAt2cRrc4URI/7CFhAqGN/?=
 =?us-ascii?Q?ISCThXTm1FQAL6UXxBlPzTc31drwruNNShgIT3rogqTqgqBySa0PVFnv/yXg?=
 =?us-ascii?Q?AKbCePT0dZdRQshb+BMLg1m0PZyBobqKdUdAaoXM2SNDPIUUrQb7ilJVcvyE?=
 =?us-ascii?Q?wHntCPBjTn42QOYqjY+G3RG9Qyh/iPve9svE6KU/1EjitS5C3//PFXYKCEXX?=
 =?us-ascii?Q?keacZ7Mo50ewHHDSwUIEfhZotImjvM2XXSwH28vvpdE6Gcjd8FaO8+3xVWPa?=
 =?us-ascii?Q?48SrfpQOzsggTH6kBjgVS5B2n16zEureTpvnDyddbufFkjRKWJgOihdkemil?=
 =?us-ascii?Q?g1yEH0cZQZGQFci3f8zMck0F7fSM/xXEFZRL084Nhk7MCJn5OusqbvFgG3tG?=
 =?us-ascii?Q?mwatkW/u5D6OzSAu7ctK9Hdhip6BI6JHAeMhr6mwD89Zv1XARjYIxIjYtex1?=
 =?us-ascii?Q?iubP66dofsFDPYqNyMAl/uQrXTptXCmbPJpjV+6dMV2mpoB2WsI0V/dREqpM?=
 =?us-ascii?Q?WE1C3jB2LNtH5hQIXL8pZJqJNTsgXcoXdN5BnvyHc6v4HEd1YDOhZT1jBzy1?=
 =?us-ascii?Q?jpijIaaveZyn+ev31sUAuUszBsGYATSk4J/YY2UmEAEkBDPKWXbPuUVrCdIi?=
 =?us-ascii?Q?9AkCius3FW7SxxtcViS7MtBf2d7pHrh4LV78TL7XSzugVj179RJR40FGOVxj?=
 =?us-ascii?Q?HeLHU3iUyMYUrK8Rvxu0CZPpo+Y3FOZwTbXu1IJ/fv05JjLUrvQPQ9BXuaze?=
 =?us-ascii?Q?NmGLHhn8EoPRWQRb8DnOZTACbVZs30PbsNEGffuwPbEw65AYh1zEbq4cBnVd?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7673cc42-b3b9-4073-8c90-08da89d290d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:29.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zyhUdnsc1nSbB/Gh9k3FUg3al6aq/Vs/ztddZ9pDU8QYxnBCPUl9r0nuTnWHc0MQiuXh/PvyccJPGVeoM0OMKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Proofpoint-ORIG-GUID: _KKnIaYd9LSEaezLiJp57XUQUwMdBvVS
X-Proofpoint-GUID: TlTV7JNNMK028h34cEEKIvr46whqNEdS
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
 https://lists.openembedded.org/g/openembedded-devel/message/98525

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.32.0


