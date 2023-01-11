Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C090C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 02:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13734.1673404424691711090
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 18:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XCuMgJYU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=037537a996=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30B2XiLt007639
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 18:33:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=pvSHUWQCBq956tP6IiG/B4TrUfZ+566mSsny3RQmaJQ=;
 b=XCuMgJYUyA+kvON6QJvD0jcodmtnfEVs87F+v1t79FCpX+ht0tL6G719FEA70b8f79uA
 45bcc56yztvS+UyUErD+P9mbwk1cySRHwz9zD6Ci+cZxvVGnQO3xcqZRelpr6YCKGLRR
 PsU4o+/lp3WSsXocZ+Oy8XdItNaQfBjeGbly8SAja+otSxqcrlCxJLkjdBVyJ4gzzC0C
 5moVpd82YbgCg61qYtqafnY1yIDGwSaH+H+j8MvdaonJ1ieTGrCA34XWs5lQ45O+yiTl
 dUJAz72rU5iJ0/yNqM4EB/z4y7nNgBq9Lyg5FvULbog68CqvTZMfsK9NZ44jckeP06bb vQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tg257-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 18:33:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXsHnVURMwAAkkwIhewf10D7c2iqhE9huFKFnneZXYmec6bxGdP+vN6hODUXHLyvt6XmvwUf8N6ssdI9BUJjUcs7f1lUU7yyDVFrkXnOSgscFlYZ2hZ1y9bdmXbZoFe2I1yoYfWekmSKPKu4SlCVdhopdXy1r62ZNTVuJSZsQbdys5kqYY1ApNeJ4ZXqDUSnnHDVv+6QJwTL+DONyiLKVRrXD/APdKcZ992w28SPy+/UXOZq/gHJiZlWtLyfPnckrcC6bmiJQnnBaqD0IawCb19y/5YkqPcvpnlrTKcpAA2g9cX/FLt1Pke+v/bOmLoJnonISSn6LBBm/7YakQ7QuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvSHUWQCBq956tP6IiG/B4TrUfZ+566mSsny3RQmaJQ=;
 b=hNtFJBBWHlVAqegrDzWg/ar9RutNasdvlxnSu5is/NGrEkU6GoKzj8BkGrZlvHEhJ/yfXg7i4JQQ0cEvU06mxowOGNpObUVGiYjKhEPZ18EOqZN6Ni1zLBKDITJ0HP8DpPcKfBIza/8XqD4sYh18a6w9XiP8mKBV74ebVWV0KcW7+tOmTMHhHN7FV3qN1DZ6h8z5Wn5Hsb8WHhRpoBndu50QBjiSbK22s1L15DjXlnE8ZlTYNYDUFIAadV2I8KMP/qjbQuJPw08GyM5qpOKetEf6L6bzlxcHaUg88TJKUOj4jqDHP0DPTOFPLwGCE5rDm6bNib5c9hT6U2Xss9nCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 02:33:42 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 02:33:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][meta-networking][PATCH] postfix: upgrade 3.6.5 -> 3.6.7
Date: Wed, 11 Jan 2023 10:33:30 +0800
Message-Id: <20230111023330.68957-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e691b75-caaf-4e66-ac3e-08daf37c40de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EEX7aKZjgV3ytuBL03Q4RmWGXb71JnV1cbiB7ekiyx0qheeqRCdetZQGBm8fVx6Ha8Rds4JRLMt0l+wu8MVmJa1V/9dlmQMzndMTpR5yk3kWGbNjAsWeVuOR1GbHXPqRUXIflC7ngoYHOBtOMWp1NAPMYyCHyVkD6BJS40/G2g54NVDedE8gMpX3/O01ePrgOiqwZ+XRgA3vZJUYsSrrRGXpovLP+awax57FICIUm8ndxq4GAoDPnz9qUq3WRfBYwUauGZvKR2hwiPWRzp2AvEZG0jURHbTST/He8lZEpohiIDskzDxEMGb77CkLeIG6r/xjDysenS+I/eALPGAyewrMR17CQuCtFmUuE0xlpvn1OhvbT5xSx8kNasy576Zcp3M//e3udvOaM+Wvm2fqS0jTWetQE3C3nHWvz4WhZQFf0IqRMpEZ31dZ7WxvMuhfFWgzgME8CxNLi2f7O+f30EYRvt4plm7116P4oFX2rHohggR925DZJxmuBCXvCifl4EeeBd0gsYZTDaD530x0UXx5+KlVM17Ulp0Zrm5I6vVRwgXph2slWfWlwbc0ScRGvlTITC0qDH7K7IpzQkE4Vyspui2cX75wECxhDFpJh9/zwtPUM7qnNmA703Hx1qfU6rtm1/OraD4Cw/TGFm/keZ2ndTJKRGGL9P3WjG1ArE62eHl+6FIJ2sOoYGW/xlPzv/cE7IEtzN66mF2koFTVePtUPytUZwM1xiugd5KXTIE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(39850400004)(136003)(396003)(451199015)(6506007)(6666004)(38100700002)(66556008)(38350700002)(66476007)(86362001)(8676002)(66946007)(478600001)(6486002)(41300700001)(52116002)(966005)(186003)(6512007)(2906002)(26005)(36756003)(1076003)(8936002)(44832011)(2616005)(6916009)(316002)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ht8Le5/oYw7Evsk7JKKvsHPKj0ZzSGx11dfuJmtEfICJ3vI5y8+PgfxsY71L?=
 =?us-ascii?Q?SEEyd1lcnhBTVz9FI0wklUZ8csljfzlV5FxoQDjNIHG0k1/ijVItb2PnJpju?=
 =?us-ascii?Q?KZNSuV87Ah7U8yvI+QJWcZybDH24dEAYkcjuzQcOlUbn7L0ZDIxNoCj9Ip8h?=
 =?us-ascii?Q?lrrJpa+1U0OJEwSw9o7gueejM9bNpERjDKab8XhR7Gp7MIXFke1HnuVWFd8u?=
 =?us-ascii?Q?nqfU2N1Kial2yv6Nw3pedsJ7FIJh+2RzwFY13RMwGOzbFk6GiaG136iwEj5r?=
 =?us-ascii?Q?DJ+OarE/e9stJMu9AHmlknHfTalbsNDgWoNFIkrqb5/HdxdKILlc8a/E4aAi?=
 =?us-ascii?Q?RFsiC5PSwODjd08mjuVI6rFnMaVSysKTpDaRRiOFAWtN+Ew5KghdSidfErTj?=
 =?us-ascii?Q?CoAu4IxBqAyZ6n1yW7aBcAmDJM79z7aIiSb4KpNbpnERcC/ZG3rHQ3fDOYc3?=
 =?us-ascii?Q?H7qZmR8j1Y4vqH39aUWhB2DDEwY40ZTAyLxazgU67ftgbD/I6xuERWf7KWvV?=
 =?us-ascii?Q?qbJ3GJFvJElXUlozVIMHhEji9gS1acmIn+7PWKcq9v2m2DhGrfw0lngfF2Og?=
 =?us-ascii?Q?DFjseGyDK2Cb3rtyflr3xOQK4qyBHbYV2vKEIoI27OcvAfkly/x4Hf/+RJj3?=
 =?us-ascii?Q?5BzsyuVRVj5LEpl1AfMZ9r8JyOdjROc7XpZQdbRlhYkuSDJk5uxUEC7OFUlg?=
 =?us-ascii?Q?ksbqd1P5wXD7RCAu0QeMobpCOSrWDcHa66TUdkkU0Ir3WxD4rNaEnDZxBE0x?=
 =?us-ascii?Q?pW2kH4mDgp/z4K6cMFLIawSsVm5eNsuhvaB1JLws1wMxWL2VKozIO5whl2hC?=
 =?us-ascii?Q?NuZXJRz8oTn7y2anr0zOEdkVG5aVVXeOm6zyaTlDyuEQyKowrq2/Ep6ms/3W?=
 =?us-ascii?Q?4DoerFQH/xuMyXJqwC+I4JaMVAMro8ado35QhmpqmPZ5o1KnaE/ueiowhdLV?=
 =?us-ascii?Q?qlVKRTsHy/zbryn6mBQhZF9Slno6TOvgcNWS3q0Sau3FO0dD/i1Xm0iSVYyj?=
 =?us-ascii?Q?kESLRGmgnsGcjYAoMOCXE6mk8KoRvFnj/6RWaaYZdG2rjlpx/xRkTl+1FWpz?=
 =?us-ascii?Q?3S1VuzIs1I9SUIXY6E35AK0tP9T48/n17D2Dk/4YIoi9VhahKfiA/+XqzC+m?=
 =?us-ascii?Q?bS28MLoa2YJYXcGsy9tISTDbmwvc50ogrgnzkz7zVW4u23J+GCFHeV6LhkmV?=
 =?us-ascii?Q?PBdhrFrArXGyNCLfrRQYIJhpSkfn6tzW49BbIL670Jpx1Lg0hMGMfcZcC57q?=
 =?us-ascii?Q?S/PSNibRXNnNVAVmp+WUESGS5TVN60IwjI5lQJqxftswyY8BpayBExILg8I4?=
 =?us-ascii?Q?2koAc0eFYF9hgUbj7f7qKn+2YVeqHY06uA7PvmKdyS9TM79ABwjzcDZeCSDU?=
 =?us-ascii?Q?37loLHGsjf0BCBirzYNe3hENUEp7SscSEoeH7ADYgzEoiLrg65v21o/oxETZ?=
 =?us-ascii?Q?VydzuXNfY7UTGd39Ht5/H0HrwBgadYq84FyJMTOyD8GrZTqKmXWIgoV8uMoO?=
 =?us-ascii?Q?QLJVPHgvAe7wcxwYh+Uf20wZV5d7PengszlavzJdj9ZCKrFNEOXYZbFe4o5b?=
 =?us-ascii?Q?wUwWkZDEt949BBV/B8BpA7gxbDqm3OnAGFvcHNSJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e691b75-caaf-4e66-ac3e-08daf37c40de
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 02:33:41.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjXvt++GnCJSpm+u7MD+grCUrPwycaTB/tX4gO9ndzrznqwad1vVyD8gytGqCGY7Ttn9Gi+WLfzGOmNcFiK26w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
X-Proofpoint-GUID: jNcsgyju3Br6I3VpZTKvXh6cydq5iWmC
X-Proofpoint-ORIG-GUID: jNcsgyju3Br6I3VpZTKvXh6cydq5iWmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 02:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100522

Changelog:
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.6.7.HISTORY

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.6.5.bb => postfix_3.6.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.6.5.bb => postfix_3.6.7.bb} (89%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb
similarity index 89%
rename from meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb
index 343a8b2df..e91e67779 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb
@@ -13,5 +13,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
             file://0004-Fix-icu-config.patch \
             file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
-SRC_URI[sha256sum] = "300fa8811cea20d01d25c619d359bffab82656e704daa719e0c9afc4ecff4808"
+SRC_URI[sha256sum] = "e471df7e0eb11c4a1e574b6d7298f635386e2843b6b3584c25a04543d587e07f"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.25.1


