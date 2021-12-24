Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCD9C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 11:01:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.87])
 by mx.groups.io with SMTP id smtpd.web11.44299.1640343696863120307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Dec 2021 03:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=TyaUFx8B;
 spf=pass (domain: outlook.com, ip: 40.92.90.87,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikSlWgov3mrmWqDi+G776sP9rgVVG60FUzPIeXYCbRjYd7LaIE/svokglx2L0g5QI/L39W7RJfiW5gGm/ZmbyOacKVU5/wYpjkj+Isadokwqa7zRaceoagqDUDpX8Byycr8hPBAABp0kjSdUYGvpxkcFY6Qa8/9lZyO6liFvNSF1RFlQIejOVOfNwli5o+MgmmFc3acK9MiD1EhbEx5GJ4fcvY9d1e2zphDyekuCVVKzJT1n4qpJfXNLa61rPRvxQ9vP1Z0fGV3aTOiuoSMLwwXbkOrJkoO9UNHlICp/yoSA2Bc4fmHzgSaF8NfqcUe7QlFCgKbtXn56Ti8VOMviZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0UYHZsa7CQn+0ya1LFspOTprMRVXeQ+7Xy6Y1QHvFc=;
 b=adT1eMffQea6IJnRVT2Mf3bD5gh/jw3jDx6TiZGtWO8jiBWooNDQ2hzJCiOwstfNKbmuKQb+18rdzOIRKTF5aDJAgPqJpobEHuz3ADK8cjicZXPzo5953BZvKVpdBhJZz5lu40YpBAsb/3HpJ16mdPOJeSuXMnIwjkISAyTm054G6Xa0FgjZL8NTPNOariE9d5zjGd+K+8I13mVL+Xv7gZckToUSG7L08ODgB1bduGV9pXZ52SH2Bj7MhN3Nv3b1Sf4TtCzGARukV8EqOZf8keFuSE8zCX2ru6GJvQ8x0S8HxX3n0A162qml3pshE5lD9sXtQwWMhDAFVWsS2g3FKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0UYHZsa7CQn+0ya1LFspOTprMRVXeQ+7Xy6Y1QHvFc=;
 b=TyaUFx8BtSAGYlBn/jd2Y+lSj/VF3B8uuTkgkeQTOCuQkA/wBZO98Gfr0lNft//8IFfsU+Z0N7hrya3kQD68ySDGgvDLtjLHw4bjNXJPQXkWdpzzdmWfHe363FTKG30jvtbbHRGLfeDRTyi4J6HnkereHQ85VexV5ahTq3vCnPFxhrXgPVviVyZ4nJ0A9IJG2toPFgt0/Zld9Nw+8wV0UVvIFwjzM82MsQURgabppCFw7EAIE24td9KRhkg6qu0BjBmN5JcEUgzVToMvK6XF0jEH6Nh0huJdsum2kI8niKIl7Eq4xRR/syeUx5oJ2q6VEeac+NGW7HGmWfDGiqWlXA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4065.eurprd09.prod.outlook.com (2603:10a6:208:1a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 11:01:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 11:01:34 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-python][PATCH 1/3] python3-lazy-object-proxy: upgrade 1.6.0 >
 1.7.1
Date: Fri, 24 Dec 2021 12:01:16 +0100
Message-ID: 
 <AM9PR09MB46420D92F84D0B3A473A5B9BA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [/WNzZKNDEDYIMWbfGKVbw6df2Dl92hZUVB1P22eevS36evwNUAOMrp+KPGpAER5y]
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211224110118.1632841-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11325a8e-f15a-4a51-ed0c-08d9c6ccbf9f
X-MS-Exchange-SLBlob-MailProps: 
	g0UYh8+NHeU11dQGJ63XuVu2fjQ99yNqGlXdCvkkg5f6Mf6jFfg5m5HKvPyDp86QoSelZ+3VPLyK6DfFNilbIGI2ZNyVWTCyrOT93d7YFnvQzChVoV1/J76dcsk6DyCIs3OuocrRRUf++oNs/B2+3wXLRsFwbUm8w6bQmnpTElh7dWaBVqwtERX7WmRXS3gqKt59KT+uHi8ShyRpfkT1oHsQnByw8m6JIGaj818pQIKC/jPTi9aCdAPgZwoRR0s0ayRre9JsAm71SbOLj7hntP4xJexqDs2Y+4co5p68aLIsIdCi+tvsor/YnzAnu/Ij21DaRfH2QUhMTMsrmDRsSRV+xd0dqA7Hdw6sVHW49x4GN7pTAjPXEdaOW9TYlT5otIRJX44Q+nswl3W9cdu4Wefdg5LJ2Y5eD7Go4YQuFotwk5b5mOR86o/LWEPQ+zlOu+Hc9L5UeMEgGXx51pvxdClP7ANsZ3nhRAL/FTJjI5gORPwtPH1y4tnXV1gMjvuTb5rTkRC8y8NccD5249r7gJXmrLNcJgOsO+0m2jy/r0P0+34ZMOkxZZ/VNGJGL/r36ImxqiJFULaBYofuYjX5GZlsBOPbyHp8xMnmZJGbdx39iz0EMSx2dxPONgv4rgo35XFPZRkDiAGJdBmRUBZDp8aWYe1M/6FrChpVFpcYLQTye4msdnOzrz2CFSljk9xb9SrkukdzSaJSC8hvu3OBDDkaBwf/VgrnH8cnBgBQuzbGdyIMx67rpQNwrJF5v0YVlkKtMLvERlM=
X-MS-TrafficTypeDiagnostic: AM0PR09MB4065:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9t34Tq7HhKO1DQKFFP/bt8uPEdokDRVf8jQhcIM3DRwkFD4s8YfJhZyQSQbsOlXevdzNPJkU7hdFi4q8mgM/cPbztq/rJbyw56wx/dDFn7FPnlEyLga66YU+leW4Loa6Nnks6WrLef8cdFFmHU8q1bxz6AraG54HQ35iVo5Jz1ULBgDUpvIOcnhVRle39EWroat2pynGIHEXmywzTgCbQZbivE3JhKjWBy00zsgyMrCPmUHO//ZX59//EMJ9NJeFiLw/vqS0rTOUyJlVn3e3SJKIYXnsC+edb0JIBU9ZiZUnCddf7ZOD9dzCB7MGDRB6g+FKfYlosyvqq83iqg7ejHtBt6FkGc/gkxn0oZRoXJ0CnpbM5Q4UypaIl2UcsMq9d/cfETxr8e1AVWxfVhGVxIrs/WjN/ATVhbdHReg10XzL9dp5BU+RiBxYFrWgx/OkWITDcDJjUDLRGQi72Lro3/4j3sZ8qOfRtu27JGTcJ5JQYD2kP0UcdnqBleWSNhPeE9UBxV2I+K88erKzM/tNHGNa/z3DeflHCHkqNwCEFxGZXMvTw8ny/bDrBK2RaWApZbMvy+MVanIPKcu5FJgULQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b0fnvcnkWX2LaG+WUv3QKLKmnzmutmaDoF5FxbTJKxk+qVNqrNDTHJbdL/tU?=
 =?us-ascii?Q?vCbX7CfEBjYqDk+JjZ5x9ANQHGmPFbk4bQdwELCVULZIk7f3sR0fYW1RrJx1?=
 =?us-ascii?Q?0z82bcq/O7KeDzIZupfKAoqYa/ajR0/I3ZcPZZXoY0b5OEgoFrgvjdqV3b2T?=
 =?us-ascii?Q?YVLhVsbU579BSriSZHW+V6xHiinu1fsSq9BAVwP15HAAvdJyzqu9x1iZIsSU?=
 =?us-ascii?Q?U+kJ4Y6epmqX/13rC3eEdc55tkakjA5UMWtmT026yvkTiXdGioHBC1C1irx4?=
 =?us-ascii?Q?oUQkzS1v1O5mNQBwur4rsIdjrwB2rqZW7MdvnUVxlAgfFQZro+fF7guZrRwq?=
 =?us-ascii?Q?NqfdRQvJiWlyX20ULu87rrOWYjzXUxD+LIEEqmBk6CakD4yqkyYtAwXvB6yQ?=
 =?us-ascii?Q?2wYNfuU5pkWIILUGY8a74JGpGMou3qdZjvMbT6wh/L2OwEj0ZSl46whEudI2?=
 =?us-ascii?Q?lIyDOaV/AHe6EFmJjMeomZ1abv0ycaxJoEXr1gzLi2QX+eDzYBGH/T8PeGjf?=
 =?us-ascii?Q?9VcqkqVwvySqGOLs4rG6Nw6Dnk3r8KcQI366TI6lL1a3qiLjqnnpGXu1k3PI?=
 =?us-ascii?Q?mhcjSAr7owp1+zdFYZNuCwJmgj9f+L5QYmY4x/7KS0Z9zY7p/ckEY9PEIuLR?=
 =?us-ascii?Q?FPMAvpDTIbY4LusUTqenc1PN2qx/p6RK4j4KdRurMG8do3tlH1GPPdz3B5ot?=
 =?us-ascii?Q?thra0ngFpFyMpk6QLc0yTCHTTYkEC4lg/PYm3mMXQkrX2KxDjuU3G8GmJtri?=
 =?us-ascii?Q?XIT60d9Nj2kp3UjDA3hwISAF5f/LBE6HjQBTKxZ/a7PGZhkOj+3Eh3pC3BSW?=
 =?us-ascii?Q?fJ5+vamgR1pXIyqAIWyqHCdF65KqZg0YTqJFDfxaT0m0L/TIXdMXuMkyQGXs?=
 =?us-ascii?Q?ESCSOVTob0pGv3pqak0oJqKljbC1whJ6PmbXU+DYEkJyBHmK7zo0AnCcIweJ?=
 =?us-ascii?Q?bxQCFIxv0YP+XK7t+cb12Hg5xJg4OdlbFfVBWm+egOY1qhbJ/+7klVM27GHw?=
 =?us-ascii?Q?jmgXBXq8Yi5sezo5obz7WcrYgg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11325a8e-f15a-4a51-ed0c-08d9c6ccbf9f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 11:01:34.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 11:01:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94492

this allows usage of setuptools-scm-native in version > 6.0

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 ...object-proxy_1.6.0.bb =3D> python3-lazy-object-proxy_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.6.=
0.bb =3D> python3-lazy-object-proxy_1.7.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_=
1.6.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.=
7.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1=
.6.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.7=
.1.bb
index 60eb2a62b..4c20fcc86 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.7.1.b=
b
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9c5c2c7437082646=
8065c5702b8a1fcf"
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-pip-native"
=20
-SRC_URI[sha256sum] =3D "489000d368377571c6f982fba6497f2aa13c6d1facc4066096=
3da62f5c379726"
+SRC_URI[sha256sum] =3D "d609c75b986def706743cdebe5e47553f4a5a1da9c5ff66d76=
013ef396b5a8a4"
=20
 inherit pypi setuptools3
--=20
2.25.1


