Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF28DC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 15:57:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12714.1648137477910541363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nIdiDAS7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=008297714c=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ODBFje020587
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=yrk8hZa/gSCcz6jIDZ8s3a7kvYjJm/zpyJkxQpPg1UM=;
 b=nIdiDAS7+s6sSbYLWFwZFLgY9Ry33QDT7DriV5B23QhTf2iZHUNOXgPLGWEEyCURyi51
 R5tJHs5PwBOYeM9TxL1g9H24SjZRO5QBDy/Cini7WdcVxrUCRlpjoiPWUbRow5EG4V3k
 UoLqKK7EjUk/LNB6IklYk/OhGtUdUabCdrFk0O0K3ocFYzgHrBqXo0lvbKcq4DNbJckk
 sW2ygT/w87BxwG/xP3D8rwEzAGIgJpdtzzR+5yUpurme9HOIIWTWzQy7F1ab0dFuA1/O
 TCd57dkAuDh3oEWL+mgU7hGc0UH+YiTldr/Pt0f6a29QopM27lEiPkwqU9VSQuxn4Xiv Aw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3vjfh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIqIwInPkrztUwahqU0s36HocgZvL50II/n+ftzr8vX8KHZ114gITsq1cZxl65KiyUZNbX3flLWfK09RvpYZm/DJD4p0aJi9a86TnJns6bTGEirBT/O/nDrn1CJSfG7H8SaJ5+MErpsZdQqxFHo5Rswvk7zUyqoCPUTUkteHyhzW0yDtLp1L08XLC8Vy8AVPkLIySVekTh8ZVyToilOrMHb+k5f63YTDu2WjSjJBibrNaNnxRdP1fN/epruaeGpIIwbgjlxD8dGvbuwCXbWOrb9sV91teDXh45YtfTf7slBzUIo5hBwOceFdBgf936x/iUyQNCbPUh39HqZO5WTqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrk8hZa/gSCcz6jIDZ8s3a7kvYjJm/zpyJkxQpPg1UM=;
 b=fyFbyXRsZrhTK4CpnG6lYqES9NECbmnlMszI4BX1hOR4SrHXEBvaGYM/DpHLD7KGOlhjK77OlMk4uEMTPzlTw633lQL9sMBLy6v63pU4joOF7IX0NLowNwraI+Rb5MDQPMjh14KRka40MeXj8m6u1w7IpWlKhUuq07vpFebcPnZapdeWHv614HV/5PRNgyIqLbjZvqouml2gSXdyE1Ha79mmO1u7flP6rU6hT8NQM1HAfoGGcZaovEkN6eyWzzCNhHf4htIdqeIkEObou/8aAgwo/K9sSD8IsAII2JEiUEckbwg6YHE0I7xwRFSgBYWrZfSgD8t6d4kX2+rt4qwpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MN2PR11MB3869.namprd11.prod.outlook.com (2603:10b6:208:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 15:57:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Thu, 24 Mar 2022
 15:57:55 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/4] python3-cachetools: upgrade 4.2.4 -> 5.0.0
Date: Thu, 24 Mar 2022 11:57:44 -0400
Message-Id: <20220324155746.2341330-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
References: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::41)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f18598c-5a25-4879-ad6d-08da0daf0ef2
X-MS-TrafficTypeDiagnostic: MN2PR11MB3869:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3869F9B91AA3464A507AFC479F199@MN2PR11MB3869.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fi2994L0yi98Qw8/byd8gtxxjsgZThwxACn4DzYKToEbbPiCH9J2X5owvWRMfkmsreGm32FBm7bRsYRuH8NuMKQOru/mqCy1DeKvy+L2C5UD+Ij7r3yha4G6H51a852L+Ud7p92kwz4yIhL+FSuetQfvgAV1+y7lhUV7bPFaDwbXx4om6u3KumUofekKhfIcpTNb3Ay48QRhGMeFWgasYww9ztsd9FheIs6EiaAusRC/NmBVKnkcxGmj5R9j/NR+ZDEVM9XsXyZUUiL9afsw69EIMy+PNBinugVIk5UiqnhgUXQAGax+e7ATUYj32WpATYz/pDl5b/GSi841of0aOaKlxn1ob6hnjwXls4qJYDqlLuDOfJPildlyoyTtnocCigIyzFcCBoaEoEbpo1x8lmc6WV2cNCQ/VwPA5O0lAEB8PN2FjV49ehamKUREurQgTxbzJ52JY4Z1IohYps57iH+6emvU/cIheshAEYOF8iU2EQskt8osW7j5GxVpakqbRIeqZJg1XJOnUIV7jU0yye8lruDDlSzWlOHTKjRvBgudx1kzqSeafdMlA005SeZuXBfDq55b1/umpqTtLYPTO8HQ9mbkkr1OAJwSq7/cSIMMWisWVcj+XFqoxpiPEZKbdwdgDKiL5utOipiihCsGWhGuGYq+Hlb8TYKRz94Fu3brXEgVZUKjIeJ1Y0f/T5ZQpDGVGOhCSIYPvBy+c+9TCS1XN1MlwNIesGZM1zyZ+G1ZW1QqyrB+5Zg1tl1PPFZ166qicg7v9vtriVU4ArRZtaDzpFQVRUo6eOBpDASY6XM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(1076003)(6916009)(38350700002)(316002)(26005)(66946007)(186003)(2616005)(66556008)(86362001)(66476007)(6666004)(8676002)(5660300002)(508600001)(6486002)(6512007)(2906002)(52116002)(6506007)(8936002)(36756003)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yYeMcFaGlQrPD3EjPtc61fpPUPi9ATwq9Bv+o3K0+K9z2QpkvH5u2+ocQj/H?=
 =?us-ascii?Q?XJPNHn9+1RpflNzCGHSlYM46SeV0NialJ4pUbLfzwAspWBUXg2g0kJFicE++?=
 =?us-ascii?Q?D+JxO396i/ddDAPasTWn2CMFWyBq+ZhP4us3Bw4Sy7sAMyYnlfit7sinCxSw?=
 =?us-ascii?Q?jVc1MyWB9s5fUXiLN7sUZ84kwoyj6A7bk0i7nAh7wdWd1F4534WQE2RGo1Jy?=
 =?us-ascii?Q?tWOlmYbeP1dHF9nyp3oa86yHhueQ0q7Uvp1r13zOkcwl1pKrLBnClMY5znzA?=
 =?us-ascii?Q?xUs2pC6hzG/nAILbox3O9Rr+vxqQOcA0FbOTjAQfq2O9gFXI7fdK4F4gbA3y?=
 =?us-ascii?Q?Di7PLeOSucrZD0IreIwE3iPbEF+VP/gvz7KwDjS9dHrhE3sR1dOpAmhxjRki?=
 =?us-ascii?Q?FW2VVPXQAjK3dVDCaQBWod6CoGmMRWrSqxihksLxrqMryrxlov8NrgERrc4D?=
 =?us-ascii?Q?YpSIACW2SdeElRq/ioEk3rYwAwhuvG2zpz21zz3iZz85AijfFiEmbpb9e2sH?=
 =?us-ascii?Q?hxno8JmnPArUpNmSihOQNYgW1yicOiMX+FnPBJbQR9uDZMcu9af3PhL/Rj1a?=
 =?us-ascii?Q?/J+a0mtweopgHoilcFZYn+ZP6C4iPExu9+5FBJY1uO79edIw6JmlzeFcO3F6?=
 =?us-ascii?Q?CX4+o/J4WKCgPq76hknuIFdk93245ypxY2HEMprG6IXDqxdld/dyRYvglUgD?=
 =?us-ascii?Q?OL9f5PL2bpIZC6F2m2tJ5YF85ejOeOvmOTcB4N4cgq1JO9d2UDV4/sE5yF3J?=
 =?us-ascii?Q?0e/uoEjNQMHi8LK8WLX2S3x/H97TLYdg07pptQGTazVI5cAf+J1OgmEHJ1uW?=
 =?us-ascii?Q?PHBVIVEikYSlHZh1GN220CzEa2KaSh3bfOb7h4+g3qbuoqTYFpKXV1N+qkNJ?=
 =?us-ascii?Q?xdCy5W+PY5dnEqDQtnXWby3nK6jLQaWv0HykQz09u29GWFMXpuIybFTZrdEx?=
 =?us-ascii?Q?yInlzP+katoRdtJI5hK3PpVyC6R2ox6KvGPwJQpGRQiOw5NJ2V1LFwipO3bq?=
 =?us-ascii?Q?HZiVcPo9fmEUPeBpAAF4sNBYO6OuEBp5c32U2n2ZbTcGY3KXoAKa9jKdDlWu?=
 =?us-ascii?Q?3WHsI1oSmsCV0UG2yh8XY9jZbAwWtUvL+P0kbqardGFJHdL6nBcxAY9kB7sR?=
 =?us-ascii?Q?/1yVmsoC7Mb5RML7MojvpFtOeXLszmqhg1WhLaeUEuSvaX0xl20SRnKw8uLi?=
 =?us-ascii?Q?KXbKF/zvRvi1eEl9zPkg0JDO6KkmbualdGaBBDrl8LmKbw7xD+krzQpLbCwu?=
 =?us-ascii?Q?bFA1rRbdgtwtoREuwelBGiiCNhDS9NKkI6muiXwWkyjByYkNTPzLZ2S4zg9K?=
 =?us-ascii?Q?ggLpfGGbnQkZaPl4qkusEPSvWPnGLzvqraeiBAtIWBmTT7vXurxTWc9N9E/6?=
 =?us-ascii?Q?4c7rIikcxDfPJfqzQf0uWlJKcSFzoFywET9+R7epvOFijcDTj80i/ytvzsjF?=
 =?us-ascii?Q?lCFCjqyP3Ltp1JXvpXIEtCS9Gog7FPa68tVtpgN/rhg8MgDEfrCPyw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f18598c-5a25-4879-ad6d-08da0daf0ef2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:57:55.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 scM4carStray8+OTgjQxO1KjkZ+Jid8Kad16ybOeyvaOrgC76Ii34AFvxvainb9x+3YFoAHIITDCzu2ERCtdOpAltqX3wb1a3xuHEcguwLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3869
X-Proofpoint-ORIG-GUID: nsds-SKSp6YC-DsGOC9RUwo1wl8qiY9V
X-Proofpoint-GUID: nsds-SKSp6YC-DsGOC9RUwo1wl8qiY9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 15:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96197

From the changelog (https://github.com/tkem/cachetools/blob/master/CHANGELOG.rst):

- Require Python 3.7 or later (breaking change).
- Remove deprecated submodules (breaking change).
- The cache, fifo, lfu, lru, mru, rr and ttl submodules have been deleted.
  Therefore, statements like

    from cachetools.ttl import TTLCache

  will no longer work. Use

    from cachetools import TTLCache

  instead.
- Pass self to @cachedmethod key function (breaking change).
- The key function passed to the @cachedmethod decorator is now called as
  key(self, *args, **kwargs).
- The default key function has been changed to ignore its first argument,
  so this should only affect applications using custom key functions with
  the @cachedmethod decorator.
- Change exact time of expiration in TTLCache (breaking change).
- TTLCache items now get expired if their expiration time is less than or
  equal to timer(). For applications using the default timer(), this
  should be barely noticable, but it may affect the use of custom timers
  with larger tick intervals. Note that this also implies that a TTLCache
  with ttl=0 can no longer hold any items, since they will expire
  immediately.
- Change Cache.__repr__() format (breaking change).
- String representations of cache instances now use a more compact and
  efficient format, e.g.

    LRUCache({1: 1, 2: 2}, maxsize=10, currsize=2)

- Add TLRU cache implementation.
- Documentation improvements.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...{python3-cachetools_4.2.4.bb => python3-cachetools_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.4.bb => python3-cachetools_5.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
index bf225e60e..f2974f7e3 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "89ea6f1b638d5a73a4f9226be57ac5e4f399d22770b92355f92dcb0f7f001693"
+SRC_URI[sha256sum] = "486471dfa8799eb7ec503a8059e263db000cdda20075ce5e48903087f79d5fd6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


