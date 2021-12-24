Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BD7C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 11:01:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.87])
 by mx.groups.io with SMTP id smtpd.web11.44299.1640343696863120307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Dec 2021 03:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=PexlefYO;
 spf=pass (domain: outlook.com, ip: 40.92.90.87,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5Qx/wPfPHSbHxA70sRWalRQGEX5ak2RCXDAkXwwC+AsOYNZIiLoDPZ8n2LDJyph34RFB4LmYx5AyEeVrv5JMYE+2M9be7rqb2tshRROawzgxUoiT55SC0uHmpcpQmqIkYnHYNDwo5kBZHaodRmVgQm4g9fxl2KjQvUXtD3B2pwJ9d+76OihcpWQXUWCAPv3FeWN01SbO5b37KirVQpGB3UkyuqTx6GdVqZsmnB3LruX8Z4Y83J0/qSn347oCdBrUpOXXDul11yHfnFUV1lbD7+FtGE4hvTgAVl23eLoNQFNG7eEKZLi+8tn7hCN9fmzeFd1fbF0s7P3WJ8quZttQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qztrUangNUFcvVv+Bf2D5idXAPA57MUkVB+TycQ1Ay4=;
 b=B5Ibpy7iP45Ft+xekcunwN34cCbepuQyHz72zWeHb5yYinCxhgUn+R/6yXQypr+fcCFiurFghOGB0lohNBX4U9EcbZDp8/eaWllXkvkQAi1HR9TgoEn0EEisnLJGR7zhxcRyHG7I1XzDUvI0HsAwM1yx6SKm71a6ulEWly7HNyWF+5WZzf/VgZBVUWJfQ8La6uw6DT15uiZ6nyov7a8e50QF9qKuSjJG7iyGEEWcJl3ejDrUJTPs/GAFqHVA1dNIait1r/jnIqvjNc+9WOenxzbAOH7nq1UXGAYC8WAxa48Cp6whAUufMdebzDfcw0m2qqC01qG+HbCcv7xYCC+Qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qztrUangNUFcvVv+Bf2D5idXAPA57MUkVB+TycQ1Ay4=;
 b=PexlefYO8AisoWJp70dAIEatfneP63qodF5QEW7HPaqHPEBHqUJE1RNX0kPMxjg+nM1PTj5zSLQOjvCZUsQFNnhSt+M99pAm+Y8iEvCh6JqdmafFAKRJUMEMYsLAwzrq/RuVIVE3c4agchgaX6E1Q9sgAFrtzggiPXEqV87AN0yeLTWkyXLyg/42oiZ+39lbtE+bjGdLIJROLMxj1T0s6sCWHrWoAAbKVWU918qBKdBv4zPL81wFC9WHw4wud1Xihb/zRLBf89aiGYeElfuCPkGwilE4/wfQjrxcK1N/3PnWTFu0/VQFXYaoRJZ8xPW3IBX1mwXqQLQdbIJ1SH5Y0A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4065.eurprd09.prod.outlook.com (2603:10a6:208:1a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 11:01:36 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 11:01:36 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-python][PATCH 3/3] python3-wtforms: add missing dependencies
Date: Fri, 24 Dec 2021 12:01:18 +0100
Message-ID: 
 <AM9PR09MB4642C782A86D2F74C57D71CAA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224110118.1632841-1-kweihmann@outlook.com>
References: <20211224110118.1632841-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [YaUnZc0My02qmiyaup6EAVglX+y3zxePFsOyT93ffj5T6ohMxbyBCZOEBsaQsEJx]
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211224110118.1632841-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc7914e-aff2-47da-9863-08d9c6ccc044
X-MS-Exchange-SLBlob-MailProps: 
	ZTmCor6bjd+hW4gLxOsJl5joX02ZNnAy0fRh+b1BbB/fdlfLsJ4UyEkDRIDG+fzpGet9enqvIr9M/zwX0xpWBYvvyprEx/njuP2T7tDaU3I030ZTUVlXOOfF006ASGhUKpl34GnZpe/Wmc+PSe/MlPBXsWmJ22sfuAbqpkHFsnZQmiVYaSxfOIZs+r6c929J4e4WtSVhZROtDN6CwfBDl5C0r98gP/yOx60nae8VSJUQ57XVm0Yb8r+Qjt5RT0ahazKTc2BN/BiQxxO8To4JnzmIXuZbZkp0u7bVgI8nTd42001o82hlfO+mi6gVB/cnFwL3bvN8p9JWaJEsIOQ9fV3wVSRDAMla42+rF2qTjk8U5fRE8B6GCLYqKVrRdaIVwuA7rp0N+iNBKIAynKzDzmpCs/Ao64XNEq5nGafdkDvjlneb0/khEUiJCk0cpK7Mg5XYIsTIPZeFFVzrx5m7i7czoT0CexZZHblEGbJ3HKayP0k17Q2tgtWZdnID6EdjGzgEySqUBkjTsohrLiKTsQCrmwxSJI7CUXVP/gmkca8Ta5IQk4bplDQJ4GQhHPmJ9JXQqtU1Ig2vmNHc//tEl/5E0bAVbsLla6uHiCdvQnLggO/ynr7ESKM+JmDdL2bqj0f0/5VIXyzbTx7ehWqRS5FOvu4LYP7yaOCPmuas62/+z4BidluiB3swyEVAzaQz9B8veakGnPGTOEtSretpyuHNlmIIhsTOlSBniLzbgzrl9gsdD6GYSUY16zv1Cx1CTlZcB8kp/LXkpQqnbxogZYYTrICz2ixYBsErnrZ6acN2MEQV4ANruiILjdYxsYhT
X-MS-TrafficTypeDiagnostic: AM0PR09MB4065:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YDdEPvJN0s4VBkST94bBRvsSiEw3Wu2JiuTpm1A2mgU0Jfw2Y/hAhDy+fVSRj8JO2oyi14uGmFuRtKIsmbG3fW1a+lPS1CyN5XitWlW3dMIBZAn82A1pIw/ySw68D1q3MGPkVyI1ATg2jyQzWvOXvI4uMHV6wKDhP3kw6DIHV4ww1nkOzr3wdZrLdUiGms7hO2XL9nTRyfUPehKAXmxx8mP/fJHx7I2DfZ+2aOvht3b0wVFWBN+2jxBxcLF2xXeiA9wHi9tl5SmQhpKrD4rg/3GcZcuu20Jqy2i88qbbaken1qy42WEgf2PjDYI5+mVIb2Et/dufIvvJfJIMIM9sTMUScET3oblb09sCCuRvX7Sl4lWPeYfov6RIaLMHROSAc3UuIj2xmmP1kr3vp6VU3VT+20tLRxJvuJyVpmZ5t04zIi6WqHFbZ7/qLOy5YRu6c0L4Ve0omFbMGJncaz1rNRj5MZ4nXMumG7zVfn+eNxMK+pBvk3s4HdUaO8jIZQLsERQaJK/HLH0K9qp22fKWzUBPcASp1vBKg8NHgmcic3C8BlMZquiuw3xmbspFYKYelAUzMBogR+ZTrB830RN/Ywnh977nfB+ItWy93EMlpuRbSbYg1r8/F8gCfQzycZyu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gq7+iXvxaNF8wsL+JjuKqFSrEK7SjIa8W+o8yMXYAys9/C9PytuFp6nkCBpb?=
 =?us-ascii?Q?V9aIE6LPWI4VJt7/m6LBCscpEzUt5HwZbRSUK/McT84BQwkuiMHLp5B/Wb3U?=
 =?us-ascii?Q?IA62nzJ9JmZrDhB+3/5EpY+NaSnE44L1pPf7eqghzdvm/D9Up2X7me+1Ot8P?=
 =?us-ascii?Q?kDQoS2kHNe1bxf4hJIEJ47ozCQYOZvZwix+raPfQNdq8Q5PDajQLCULbyeeK?=
 =?us-ascii?Q?NBQ71bBLWAIAKrO0WbjUchW4000l/eqbeTXbbd3V84sVqLOUHJeUWl5AyBYL?=
 =?us-ascii?Q?MzsEC5LlfRXRFIMuZLkcx1ekxeZ0jkaBy6TDxlWsLk6Oys+PPSRjD+YheniB?=
 =?us-ascii?Q?NJKgIwXhIAb9IXoBZBT+ooXStnJOAuK0owwhHjwMV+QPe4x6+rHLkY6uovUy?=
 =?us-ascii?Q?QauDGA1W4Jpf0JMoQJLiHNAIkX7n8AH+4P+t2tm6+pw4Rd2bPr/nQU8FP46t?=
 =?us-ascii?Q?tEaoC994g9Hf5jQ5cFSLdL8DlBocqCcio12FvfmkqoP+QHyXyOdi0+FGe8kc?=
 =?us-ascii?Q?SfOZ/gPT7dLYoPTNLOLIZcXNazml319QnLNsPa/IyjSDwRmyPp3ZgM0E+3h7?=
 =?us-ascii?Q?zcPwEll6al+G0BF2W4bTY/ZyYcsEDAYJH+fMqJpeGGssS0GtZmeLNBL2wAox?=
 =?us-ascii?Q?UHwPfoClVb9goYMXK75RsN0Yi0RGLGX8RP2wGpblydnAiftcsmwdWZaR6rOz?=
 =?us-ascii?Q?ri/HIaWlvCHVsjOEtcqehO2IMhrtslJcE0zlgTr/bX61rhnIvjxuzJiwnZEX?=
 =?us-ascii?Q?Gm79jhTIRs1ogrE2919f3CMvpaQfZP7RnVeQWVUeiVTwHYCzcpnzOePYeRy2?=
 =?us-ascii?Q?LU6yWmqtNWmw5UK8Nmev1jj+dmlyzaZhW7mfsIHv7X6X8RhHHinlQd9O64A7?=
 =?us-ascii?Q?vWHyjD7iLoY6AdB3Xbe+LnruZ5pODdIVAsirrLTg/hcVkabAvrmFsX/Ehi12?=
 =?us-ascii?Q?Uw+MgXs8Cr/E2rgAD0zdQOoOInz+iU/JTwhR8BgIcL4fQlpU89MX1XR8FWWp?=
 =?us-ascii?Q?tp+O9ULw01vxH9hhzlEGkEz4+w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cc7914e-aff2-47da-9863-08d9c6ccc044
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 11:01:35.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 11:01:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94494

like python3-babel a setup time and markupsafe at runtime

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb b=
/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
index b63be8203..c72af7451 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
@@ -2,6 +2,8 @@ DESCRIPTION =3D "A flexible forms validation and rendering =
library for python web
 HOMEPAGE =3D "https://pypi.python.org/pypi/WTForms"
 SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
+
+
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D53db=
fa56f61b90215a9f8f0d527c043d"
=20
 SRC_URI[sha256sum] =3D "4abfbaa1d529a1d0ac927d44af8dbb9833afd910e56448a103=
f1893b0b176886"
@@ -12,9 +14,11 @@ inherit pypi setuptools3
=20
 DEPENDS +=3D "\
     ${PYTHON_PN}-pip-native \
+    ${PYTHON_PN}-babel-native \
     "
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-markupsafe \
     "
--=20
2.25.1


