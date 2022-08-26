Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F39ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:05:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.32484.1661479505901669701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hnM871xv;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52378942be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27Q1gONc021303
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:05:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=G20UK9eKLH5V9igSEQFG29v1ela3dq981xysij6aijQ=;
 b=hnM871xvzX+GTE2ajX5wzX0KuubOnhy+pbdzdpA1ohdfHnZ7tWR7cuPtgd5n9PDUm71O
 shbko3mosy8MJgat2leJOZmnA+O9xIzHaLOguiFIxw2hY7S2OE9/gKPSkNa3Qq/JyThv
 p7VlosgTy5FcNz+woEXChKrMQjfHYV/dt7atwILn01rU4OIdZdNjgNYc3MI5YW1bAby+
 LMQbOvGZ/Rept/p4lDC4Pda+vJjEF1tapILwd2haSH310xq9I7SsWl6OKRVNqXE+50oW
 NFDfvbYBgDrKw9ndxSV9dm6WPPsLZ/hIOAqqcGW5EGfKmc/60/AkPL5wZ4o7S9H8d4N9 YQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvabfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H29ny87QItxNCNqQZZBAQzLObn2c65aJ381PJY/iFFRp+AdKDB5OI/iCZQPfttRZepiclJd2qN/1p3twgHnR+att221U7L7DDDwPzor1D4fVy2UUm9m+jcY/3EQiNn+35OS0k5eINOybJcKoF/rGJsKbnH9NEB8rwbb5bYnx2IBjudzzC89ZJi8FZYZEgtCFpSuXcz+fPBVvNKuJalHvR7m0YUcgNksy7BM01B6D7F8DSGJc8dj7/dkpBRJDDAmnFRjGZnymwpeJ74Eyhulp2JFhYucip0YC7Ppr/oU2miIlvT/xBlRRlMhFRvY2KJVMOsG7CK9jS2O3ZoQnRITtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G20UK9eKLH5V9igSEQFG29v1ela3dq981xysij6aijQ=;
 b=RJlvgkwXlKwKP2AMXK7aWe3YOwipbsfBavTPmk641QILHCHwRwiB3E2hYHQosL8O3a/HpaDmDse0upvy/D1Z5ElQWhzAkv2Y7zUrPFeJa2h08CTlBGmrf4+Te0dLzb8yHin7btrKsAzFJALKG+mQpmcWmy9C8VOLHbIVwFeYnEgT6YTJaZoTS3DGwagW8/tMtirvrpEqPluEgb2AUvg7V7zAhIWXk8hOIDOMZ5wGSqUo9fC0JzQvtiQmvoeSD/9xJw7WeLiK6Nmis200SCLUIpqDRd9SoXChzpM+Vk2SjpBoQuotcqIjwYRf/xToGoAANQQ1OLATSxxoQ/k3L1rDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM5PR1101MB2314.namprd11.prod.outlook.com (2603:10b6:4:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 26 Aug
 2022 02:05:02 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec%6]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 02:05:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-jsonrpcserver: upgrade 5.0.7 -> 5.0.8
Date: Fri, 26 Aug 2022 10:04:50 +0800
Message-Id: <20220826020450.2839319-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7213e267-c81f-4786-57ba-08da870762b6
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2314:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A7qwXCElN3+O+JUo3TDf6My7ZX+soY7u17fV7/FD5ECnWU8pZXGIyKdCsqU0yQVxMQirXJrbK1Sbf2H1L5IQ0qWWZB8wyBSwsKaTcHhgrV2fOFrmp1ytjkroZw31f8pkg1rZqyn3o+B7nUpqHcr8aYZZIKCTxXA3Jtzi9aeZbhCLROGpijtqXSDsiPQqAjbNrzPLHmgb/1ZQJ21b6y593q1MkxDbEtZVAGU7A62dOW8rHe4ezwAlDgKsSyrHExVsafzxgnCDG2csejZSm1BNQNU4w/gjcjUq+bYFTgYL3AIOSEWnEQkuf3vsszkNO+FjuOHARAQgoRqy6zT+6BxdkHZAz2XyaGH8Fc4ZXGuVt0ywu+VkmNP2OVnfY12AnZhP9i7IkXa9UU9+VlyoVc6n/2PXrHdXA7OhMim1woAcky6Zt9Fif6ezfRp4X8nGgq9yrO4A7MIMI6TVrAK4vI6LTW2G/d2OH7sFXH5aU9z0XDt0O+mt/a3NE8RtwBZqJNllFFxu+gaHazP3u3cDqOB/t3unB25e7Xm56SGqHyWF/pW7w4TywUk846c13bHjBQYJ/VbYutmwlodgv3YpWF6qVFZ6pxBaG3ZnUnwHylLmO4jePGUwPnTcP7ErDV13JrDcMseOLSMgCGK2RDl3JMyUzv3ao9ZFWzJSgdlRzFHDHVi8Vq3crBsWfjxyiUhYIBuh8o5b1ozBsxRjGaJz5X0TN2V+ZHr46FZgMhUuZsOBfKQ/h9UMXtFrTUYpDFvmkEqExz2bmxj1T/aVLsnfQHXNwB1GitberCggx44WiB8BmTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(8936002)(44832011)(6916009)(6486002)(2906002)(316002)(5660300002)(36756003)(6512007)(6666004)(52116002)(6506007)(26005)(478600001)(966005)(41300700001)(8676002)(86362001)(38100700002)(1076003)(2616005)(186003)(83380400001)(38350700002)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mhOVi4HFL8V1VzdxPIQ4De0hTXl7O4VqCPf+H/txhP8u0X+B/OfRo9nydsZz?=
 =?us-ascii?Q?jKmjAgEBaqCAPknEnij9dpqA+3Hkv9hQHB/1awpgQ5kxkXlJu5RaWHIHm+Bw?=
 =?us-ascii?Q?ZxloBlnu5Sh9WHvuaQIUU168k+m8hhjPg+c9zSmWe7QC1g7KIurnUr+c2kDH?=
 =?us-ascii?Q?7PYjm7D78kq8DVm94fyyZXUufZFmhva3HIqcntB6NH+eAUxBM469gce06RQV?=
 =?us-ascii?Q?L6AoQLEfQo/uHZWMDpBDI8e/4Xl3vksd1bzt8eNHjFB5OmkBB65oQnlFPWdG?=
 =?us-ascii?Q?svWBLRo1rdK8QQJpO2fSsUHE5CFsFzrrnDGhzmhUXN6nHEeiEWINTFBa6cLy?=
 =?us-ascii?Q?tj36RPYlWlRkE6Ed4AOAV4Vyq3ie/2pU1SOwTU5H37HvbriF37VLQJC3CEVp?=
 =?us-ascii?Q?+7tratkwHT8K5SNshdujQ7LuauLXqvW3dgZc1bElNPHvgvBZLK0cVC3U+nyY?=
 =?us-ascii?Q?cxL0u0l0ngAY1zqvcb0e8lpAk1k4rp4mTIQIJUQvONi7tLRGvBfIfqp04PSK?=
 =?us-ascii?Q?VInAYXV9rx/xKg9/5v/E4nknN3Lac/swxn+n3O/NsOoxYwWsht4wTb8Dps2R?=
 =?us-ascii?Q?snPf6TsP7kLJnQW8LhDT08X+o8x/QB/Up1xyl9Z6rTerjobu5mS3AYd2wpNW?=
 =?us-ascii?Q?8gmhvJlg97b6HWlbHT2r/HWk/SU3P0qQ15j+eG58VoStedwV5MDWwpXclk64?=
 =?us-ascii?Q?/K7CTmOoP38kenf/X7c9pd/OoNjgWTYbAqCiFW7vKyYsVLkfB7f18fppaCbl?=
 =?us-ascii?Q?bBB/UYh7uEQWTiHUYhpA7CKsG5wkxKjheERxlbNtd3s5Ygaefuyg506kmeRX?=
 =?us-ascii?Q?a10OA9SRdfStzZiO8w8z0LGZlsd352XcRUnseJeGQmQM5rIy6yQqEl3Wyw17?=
 =?us-ascii?Q?u7bY9IuMS/xgrrAwv6YUFdSbLcYUEVuazAJ2DUoDCH+h/bFTIOUX0wya0Zi4?=
 =?us-ascii?Q?4f11ACEH1XevvFVwfg3hbfXuFSBtkzHojOwTUOiN05tjwJPbOanbkYulGHlu?=
 =?us-ascii?Q?uapOcEEP6q9iLW0OPZn3shhIvfYUo3iU+2uMC1PzW7pr0QkgqcmStDbJDtgC?=
 =?us-ascii?Q?//KCagmEfy1RVij0kGnkPMMgZbJWlTkuVRRPQL/Mrfw6mgu01qJY/fd9+weX?=
 =?us-ascii?Q?8Blus1t7iovCakrhsHY3z4gNMq9xwjLUJCajg6Ejwf25ryQJW1JrWcCuGMwE?=
 =?us-ascii?Q?KNgiaII8yMz3mRM60pvFhRZlVlzQb/uG8shNLcWB+FJyb67FsdH8UOnK6e90?=
 =?us-ascii?Q?yXC+w+e8rjLGKvQGtE1KyUxWiKExjY7wtlo3CSOUalaPVObWavnEIH6VKKNQ?=
 =?us-ascii?Q?HrsB7huK4pXovwbSaWLsEk3tyPxgHT8ctWPSDQ5MiPxp6nmIzBppNyGNCyHW?=
 =?us-ascii?Q?gDWuLbu29yIwca7rVvgajbvpaRXAALsqaRNqAmbEmX/ALnthhaqmR7rzV1pb?=
 =?us-ascii?Q?x32DumkkG/x3uS6LtxjYHW+HbTsHJMfwDLclJnb1mS6UTIxlPKJxwFttqvlf?=
 =?us-ascii?Q?Dfsnwu31FXAj30HaODJOU77y4QlVIaWB6F/0u2wGR5qMVuXz5WkgE8Juf0Ar?=
 =?us-ascii?Q?knmLhP/S2Wx4RfQUT3v8ifho3tZJO3EaEJ9xSRSW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7213e267-c81f-4786-57ba-08da870762b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 02:05:01.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a3D39tGwxu8UQ/bDx3tjDWsIorRA4OUr6eUU7eDP7pKUSpcQYVzX0wYKZIbPoyKWCcS0H7Ne+FMnJtbQ+IwYVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2314
X-Proofpoint-ORIG-GUID: KwJtbjXkgXudyHf0oWo9on9aMKrUjrw5
X-Proofpoint-GUID: KwJtbjXkgXudyHf0oWo9on9aMKrUjrw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_11,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:05:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98440

Drop local patch which has been merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ....0.7.bb => python3-jsonrpcserver_5.0.8.bb} |  2 +-
 ...b.resources-instead-of-pkg_resources.patch | 44 -------------------
 .../python/python3-jsonrpcserver_%.bbappend   |  5 ---
 3 files changed, 1 insertion(+), 50 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_5.0.7.bb => python3-jsonrpcserver_5.0.8.bb} (84%)
 delete mode 100644 recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch
 delete mode 100644 recipes-devtools/python/python3-jsonrpcserver_%.bbappend

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
index 12e900379..6dff9b85b 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
-SRC_URI[sha256sum] = "b15d3fd043ad0c40b2ff17f7df2ddaec2e880bb923b40d133939a107c97fde5c"
+SRC_URI[sha256sum] = "5150071e4abc9a93f086aa0fd0004dfe0410de66adfaaf513613baa2c2fc00d7"
 
 inherit pypi setuptools3
 
diff --git a/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch b/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch
deleted file mode 100644
index 2d1a8c97c..000000000
--- a/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4220c6a02bc03ff8c6cc4b3bee168a1351a3ce39 Mon Sep 17 00:00:00 2001
-From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
-Date: Fri, 29 Jul 2022 15:53:37 +0200
-Subject: [PATCH] Use importlib.resources instead of pkg_resources
-
-From the setuptools website [1]:
-
-Use of pkg_resources is discouraged in favor of importlib.resources,
-importlib.metadata, and their backports (importlib_resources,
-importlib_metadata). Please consider using those libraries instead of
-pkg_resources.
-
-[1]: https://setuptools.pypa.io/en/latest/pkg_resources.html
-
-Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
----
- jsonrpcserver/main.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/jsonrpcserver/main.py b/jsonrpcserver/main.py
-index 0397a58..ac1855f 100644
---- a/jsonrpcserver/main.py
-+++ b/jsonrpcserver/main.py
-@@ -13,7 +13,7 @@ from typing import Any, Callable, Dict, List, Optional, Union, cast
- import json
- 
- from jsonschema.validators import validator_for  # type: ignore
--from pkg_resources import resource_string
-+import importlib.resources
- 
- from .dispatcher import dispatch_to_response_pure, Deserialized
- from .methods import Methods, global_methods
-@@ -26,7 +26,7 @@ default_deserializer = json.loads
- 
- # Prepare the jsonschema validator. This is global so it loads only once, not every
- # time dispatch is called.
--schema = json.loads(resource_string(__name__, "request-schema.json"))
-+schema = json.loads(importlib.resources.read_text(__package__, "request-schema.json"))
- klass = validator_for(schema)
- klass.check_schema(schema)
- default_validator = klass(schema).validate
--- 
-2.34.1
-
diff --git a/recipes-devtools/python/python3-jsonrpcserver_%.bbappend b/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
deleted file mode 100644
index 23cdf070b..000000000
--- a/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI = "\
-        file://0001-Use-importlib.resources-instead-of-pkg_resources.patch \
-"
-- 
2.25.1


