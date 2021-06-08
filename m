Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.84])
 by mx.groups.io with SMTP id smtpd.web10.10639.1623149256483982343
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 03:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kpit.com header.s=selector1 header.b=jq1Cyt6k;
 spf=pass (domain: kpit.com, ip: 40.107.139.84, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSom08FLeYofaS3L/7W+FgbXM4tXFVXNYEGt5IWz/UYvIdDblXMNK0L/w99LJg3eYwXvA3nGpSfn8FTeJZ0jxoEudSUD/AM4+wGEby6FoClDZlE35aOO7gdBvBX78VBdEel7GbKX4l/2oTqVuQ3C9/zm1UCuq0U9B3xMkgi0xdoNE/KUiTpZnoF8YLWh83u7stdr7LfF5s076K2CynjcMjbladgmgmpi1U1XAemErtDLlKThfTa9AqyOmQttA594A+B3boy5cPgkTdNVd21ajppWL/XT1kVFK8T9CCZKyXcTvAdsLtUe3uMwcaHLaHdF0Q/kvia/dY4/n1H287E7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVzygjXRLQTHz7CB1yhm+zuhOmRj2XW7PQqD9svUwQM=;
 b=mEPLWvNSj20VXfX2Ft7l47UzsjzznZKfa85JEp/qFRrT9VgmFh625FH/JU811JBt8w3+MwB+otu1SSrsrovUmC2wYpFC4yW7q5zj3QfQxnGAPya/99jVwWadjZlJtCfhAXie9faD9xebLXO8Bd9y4OPaY4Ym+emy7LB7LiEkR4Meew1U+PX1+bzngpR2gMA4VbvJS3ySSe0r4SAy34A9Z5JrmEZCUsrwOdpNk+fTmFjlYDFJL4fFL1JeSJrO/DUI6CFd7xc6VjnY1BmJZawGD3R9wbD5qFxdmEm6w/EZKvKXvJeI/j4gN1ROvuD/gwkaiQObXmQ4EQTJmWyuZKsT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVzygjXRLQTHz7CB1yhm+zuhOmRj2XW7PQqD9svUwQM=;
 b=jq1Cyt6k50MXN5T7sbnSX7nTbZb6n4/ksLveTV8xKs7M2mkbXgEACqnaCNTlYBVbz0QHC2NEDot7lejB6Gdp8qT0ZZgsvuwJYmmmcVjLDwH6CiLdZA0NoBnZ1ms54EBktNXlSk42xcH7pHBvT8RX3LSxHJ6pUSPsqj+FDDmXvXM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PNZPR01MB4558.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 10:47:29 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:47:28 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
CC: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][dunfell][PATCH] tracker-miners: Check for commercial license to enable ffmpeg
Date: Tue,  8 Jun 2021 16:17:06 +0530
Message-ID: <1623149226-11995-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:8100:22ca:2763:15ef:fcac:f672:8a58]
X-ClientProxiedBy: PN2PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::11) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:8100:22ca:2763:15ef:fcac:f672:8a58) by PN2PR01CA0156.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 10:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b9cd9a9-6472-454c-1a13-08d92a6acf3c
X-MS-TrafficTypeDiagnostic: PNZPR01MB4558:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB4558A74D83B59CD6244717598E379@PNZPR01MB4558.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uVVIDz98SnyQwt9RhKwUh9kYks3X2nF+jdkRGIO7JOOuHLUWCHaZ8JxIXOysI+WiVe0E7+LE4wmnIvJ1iXhZVe9a93NRtuyjLFzc5mxDVUOm3t/zPbx294esv0k9DzrzkvXmJ++nCoeibcSwtYWMRLvBg3BiIT7BA3C4cGc6GpSRE5P3cqkrSXMUNOApv7hRc5lVS0Z5mRRJp4vPR1TNPs1ssnR/zBkXmLAk0nyCeIaOxlz7De7/1FDt6k0yIszZcmvOlmYttVGQo/wq8go5eYq3MbOlBLDLSfsoFId6FoiiTjFdnfY+OwjriPjbWPAOH2omfrHtLcNRxOxs3OsPrJrKsR61vj2jdCnkEn2dv1aYv7EBsjRnuMmak3v4vd7ZrdJlJN+lXJZzSwj2DruPIekaz3qfrv7jVVCZhxwWJFnQOzMqsoKwMOPcZn1DAH9a8z+1OVPaC/Ez6qubVzWDxnAw5+blawzNONL+1yo0NEwGLO1/557Iz9cMHcH3juJCVThLccEpW2jFdixm5GlokHK7+lq3d+kvr7wuYIEBikPPiYqynNpB3qAm5/TP9hVAVVhWdAlbkzqvJYNIsyZLoi+MN/KZnuG5tzJHcwTKNBA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(16526019)(186003)(86362001)(2616005)(66946007)(6506007)(54906003)(6486002)(6916009)(6666004)(83380400001)(5660300002)(66574015)(36756003)(38100700002)(4326008)(8676002)(8936002)(2906002)(6512007)(52116002)(66476007)(66556008)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JSHOlxcY8O2js9L07kKtTXqO/+WP4Qg419vAOHkv+g9QfA5YIap4L9SRUL58?=
 =?us-ascii?Q?ev9tx70zkTpOAyqxhLvpYY57wSiTILgOxrVKrgPyU8GyMyQmcIOirnEIGOi0?=
 =?us-ascii?Q?/4e6LluDoYQ4qdbcRpAg7eFfs6LRR2k/rZClwG7XvPEgxF1agJyIsMCVHxUG?=
 =?us-ascii?Q?fIW8FA3vt0JD4G2oN/+JNAxnY/qX2zp2XgxulCoX63KM0al7f2gZBxbbWu3T?=
 =?us-ascii?Q?Ve15mEPC6QrTfwBzXXvkfl8+5v3jnjBZ6WU2lRUFa++WJVZaCbMFsoqRwzOo?=
 =?us-ascii?Q?UMPFj+Za/wSw2+cE1oiTEWoKZz6024PvbdPzNkEwnYt3pWBOaWoxo6c/ENWd?=
 =?us-ascii?Q?70DlZGjcpH8KSnHhF+sYkUmGVzS5igvss44kN95Fd4qIY0w01kwcA2LXcAMD?=
 =?us-ascii?Q?oAMTZhdkvAHsOIZkcMbVoPRCE+TJ+EFte3H2jAo98PyfdkCdjWTnUiagCL0i?=
 =?us-ascii?Q?t+DxsWKFUNwNKBZ9FX3/f/QwzJjBWn898lOYM4G/U5X/XmVoPmDvRSdlRfw+?=
 =?us-ascii?Q?7Jr9UqILhCUvjW/L3fAkaMkZg9ZFunzvghFwPD59VmSKFH+1m2dPH6FlxG6x?=
 =?us-ascii?Q?x4XR2OWxswa0sGeW+6M6dEFPO8pRhKo7aQ0Gclsee7iO9p5Ag0qWqYzvDjpa?=
 =?us-ascii?Q?D/IcK4KsUOn2oDSiZhiqzyYdBP5Aw50oV+QhpjuX7a3jONWGj1dPk9zGjnka?=
 =?us-ascii?Q?vfx5zXKlV/yHNX8HYnn3QowcO6ER2dRSZYN1BsmHKt8x3E82pzipgpi5KmTC?=
 =?us-ascii?Q?PHZi9qQ2THcdQ8/j0P51eEjcNUHaQjdIe8WbKFYadMHkYETBflgUajYkP7dE?=
 =?us-ascii?Q?Nz6dVKZifdkw72kdPh0jGvRf5ae51IwFJ4DeNFUe/ER5dHDCBH9h4eVyZS3S?=
 =?us-ascii?Q?QQrArIOApdjUYJluaKwk5KIi1wPEhnr3Eq09ZpP31d0z603riH7IjZ4yTGH3?=
 =?us-ascii?Q?Wpdw7jRolrH5gcumoX36hxVNzCiRo5bnq8b1wT0XiLCjt8eSckyMZTbiKG44?=
 =?us-ascii?Q?kg+BB7YuizyLmj6iIfdOKKY7m5oB2uCpD3hAoN+11TWxLyHn6rxmke/s6r5E?=
 =?us-ascii?Q?tvd+yTyCskuuOJAKmFP1h9Tx/1pz3eQVbFAq/dZzXeNaVs0FuoA1M7bLISwM?=
 =?us-ascii?Q?g4l0ZjMYlc8xBPWeWfla8ImzACorfcvBRkUTcUFbYPC5V9+2urwJxxA3H5CW?=
 =?us-ascii?Q?SrgXPBNAERJy1oh4uBCyecssNQD2wyP4YxQlqtzSfUCl5mbHXcYDe3C92OUO?=
 =?us-ascii?Q?ccHXInT9aFzBaM9MkBT701OakhZo5MYceKh+mVpBe2KUgwh8x00oQixA4pld?=
 =?us-ascii?Q?kO4hn4uiAxWmbub/S6jmFEpGQrWZK0eWFxthf4WF578QHSyyXQKC6J6Bx5LR?=
 =?us-ascii?Q?c2+vQVtsquNCYRALDl0sLkcT8crmMkZUGCOw1syMjaOcEtjVhw=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9cd9a9-6472-454c-1a13-08d92a6acf3c
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:47:28.5875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1FGwTNof2YpVdTLTQ2FOnSOX/SYfbuDhEB2hVUChH6AMeevbRvKhts0q+O81mFx86cLq3DrkwRj13CyKYr44A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4558
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Khem Raj <raj.khem@gmail.com>

This change is cherry-picked from upstream/master branch.

This fixes below yocto-layer-check error:

ERROR: Nothing PROVIDES 'ffmpeg' (but /home/builder/src/base/meta-openembed=
ded/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb DEPENDS on or =
otherwise requires it)
ffmpeg was skipped: because it has a restricted license 'commercial'. Which=
 is not whitelisted in LICENSE_FLAGS_WHITELIST
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'tracke=
r-miners', 'ffmpeg']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb b/met=
a-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
index e2ced39..aa6492d 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
=20
 PACKAGECONFIG ??=3D " \
-    ffmpeg \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "ffmpeg"=
, "", d)} \
     flac \
     gexiv2 \
     gstreamer \
--=20
2.7.4

