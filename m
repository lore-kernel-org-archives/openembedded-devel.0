Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EFCC5473B
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.132])
 by mx.groups.io with SMTP id smtpd.web10.49386.1724665264443298756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ZD63VlvO;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efQeFvTgUYabxS1iO0mnAX6LnLZj3cQGd2/nLO4UVFtM7veIO+MPzFm1qHZ1sBopccHFwIeMrvAzXkv3+23T0uEK0Ex/SES/cLvM3Zx8aYUvHN/a6JMwHZyYz0FVEuO8cKi7w9L+pwcbGa6Nk2eBaYDVcV2/hSSYpEm47XtyXJBECZCEDTt5plBC6+261GW7jkUhYsuSBOyRtrMJ4Cvtq/jNRh63yKqla5YhWwfcBJ3mi6Lq/ZgWgw7qD7GjaE/BCVzo8TgEAf4OAunuzJsFq+Y2/CbeH+OQG+6yoBiIDEYI4r5Jgkc4eRaHCZP8MHCyiRFS8zgH0uJ5hQMYgU0p9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1DBveN2qexQ0Po3J0HvuMvf2r+MvIlXv2pyL5g8+v0=;
 b=JwkHGE05N+kdkE7opS7R5YGJ9Af/2P9MQ7TqtivGKi27tCcmxw8rXFQcRC2tUGug/7bXMYLbP1g7h13nNglzrpOLV4BzPVC5XpcFgVDE7kcikXl9YOyoNA4U2qQc9g4QliqTw4t0hHP78uVbXb1giHrLxsI+ymSR2++6Yc/12euitwF5FC0rcLJwj02kPDYogErWLTBAy2Ye+Xd3976eWNKHj/LU9iNU41sueIB3ZAK3WqXqf7ZxdkyV841UFIJic8EXlHeazFUW94TB77k9nt43D9ISknel/ss94XYWIpLJQIjD2YTD9UmTFtMLkQQAo3px1dkV1U2fO5++PdAjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1DBveN2qexQ0Po3J0HvuMvf2r+MvIlXv2pyL5g8+v0=;
 b=ZD63VlvOZag8ZZQrJh9eDRGfs9a7PKxuffQ63PoPnIrYbG5I8VLCmyZZfK9BK3k2hdMC3wRrdgz55VLzk6/kakdl42NBe1IHWwST46Am5NOwoqGKKkbhcGQ4MPdU7eiuS8oJLxFRxti6mIDWveghKv1xEe1XfteXyePvvwRD4u4ogRfaFugOZEhsgOX+4CdWgMHV+dI7enyc8FPpFK5AfDNNAaFVrvdPs7zcZIzn3nUQHO+Aj0L56Q7sO1PFV+CM7I11nmHj0WlqKyRQMRxgN8liK4ax87Fv+8kMVrN6WzGa7mJtiV8s936qCxaNPSjHMh7KCb6waKqjyvj4FyNHeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:02 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:02 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 08/21] python3-mock: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:08 +0000
Message-ID: <20240826094021.2744296-8-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d18205f-0697-46dc-1efd-08dcc5b32f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0AD/TRZGj2VlFAnd9PDA1aSuFbXcmE2HwP9vK9l01nFhPgMtQwE8GaIB4Wbn?=
 =?us-ascii?Q?LANQnY+MpQAhapIHZ1UwTmH4a83EAwIIEN068q2RGBGcx7MTmE+3LK+XDbxh?=
 =?us-ascii?Q?sNhXmUlI8R6kq7QwTG8noy3mRcers+r5EIbvLPBEmS94XGhPyWgpb6QlUwP3?=
 =?us-ascii?Q?2e1bBShnebm+njuz2Z2W9Tz0aIdr2CPwa8w6mg9ddfDlbQVtWMxaWpk6RvaF?=
 =?us-ascii?Q?z5a6h0wKhWLS1m6RCGwKkZegm8FACzB6F+nYePpXHYvJrieID3ez8jICRQtW?=
 =?us-ascii?Q?p6hKPDfauZCfUhKGoUvIy3oK5plaBKoO33XvwiCuZ1CSj5+ujR12mHVlF1zy?=
 =?us-ascii?Q?8X6Hu62TZAZbC9nulzc7Hwi5ppUOYZRDtIvpS6ffPsOOpjCwQeH1goUACgLk?=
 =?us-ascii?Q?usN8Xu33Fo++lYkL1lAtOAf/0hJOOkMeeDIwVG2EXI9Y4/y7oD6rJ5S6quFj?=
 =?us-ascii?Q?hvWHPER0YIlNc4vVKQNB9DTZEGoVIsWewaMLI+peMTMWp8L48QV7D8bfHvDI?=
 =?us-ascii?Q?xJdkTF0LirhqNaOgJuLIR+pVGJmy5sHdOr1ZlAw+nTSQ45kKOp2Jc3A3Wpxa?=
 =?us-ascii?Q?Oe0HZOXGLhn0SkgVpiw1r79QcT/QaOMkKn1TS7HTSm7MkBr5y78b16acgBB1?=
 =?us-ascii?Q?4LlX9sFT6axuQaFI+g8hgSbR9ZT6oH22ewmX8ZB0dk8hJv4noVmG0sXVx8Zy?=
 =?us-ascii?Q?vTkNzZ8pm7CZb/mZURal6RSbZCEJ5RlFWr8Bx6cKn/cWFLRMOX+mwdPysZrr?=
 =?us-ascii?Q?Ja9atNS1Gj19gEFzvfsnjEuc/1gIV7etZXX6zjMO+1vqnGLJUvTHyI/Oa4Ej?=
 =?us-ascii?Q?mTJGaU7XzXYonl5mBqNwAA73A9sIrLhTTxueK1Neo3Dx3YNfkiWsj+duIpmY?=
 =?us-ascii?Q?5l/jgk1DsyyeCDhfY3aYSV1Wo9D5QSqA5O49xoXcAqWd6UNonM4gujEX2p5i?=
 =?us-ascii?Q?I3h14u3HxWjF1fXmIpnDxIQYE7Rrh6QpZvAGi1c5wjybS2ssfTY45lxI/exu?=
 =?us-ascii?Q?fIvXupVUaZxOqHM/Kb59lJa7xTP0k9IobT+ZXo2kRe6iGBzK3+BWwJutWDP7?=
 =?us-ascii?Q?y7EOZCI9rXvO07e8y/NT94+aJe7fo9u0ONJSnu7xogPjZtkepZHrGuxbt6Im?=
 =?us-ascii?Q?2MuO6N3mXQu0PjxMg4ZyDFQrTSQyhf5rlj7LikB6c/z5MtXl2yDrBNg0LM2Q?=
 =?us-ascii?Q?6OrYfjg98rQe5PyFGsrp+3uEocbh0AllgUEFzN+T79dhS3n/xC43j29f3qRN?=
 =?us-ascii?Q?c/qLEl5Y+/jIIR1L7Sbehtbc1eQtzyrbtjdnnRhnTMkWEgxmIx0JzEBq1H6K?=
 =?us-ascii?Q?5Jn5J/g3BggOWxpUvUI+fR2ln9sLzisLHKV0qsZm5gMR8C9n7oNmy2AbDHNI?=
 =?us-ascii?Q?Ynr60HA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?opfz5QuaV7/3pJS5nCr4XHM7KHNsPOONDAqcyKmxHhNJBqM8sMtxO+Nizttt?=
 =?us-ascii?Q?bpu/NgxGclHyZNeBAq9ebIF4ujI8sSBXL4b2Nv9lo5/+jYDz+6RPIzH3YTDk?=
 =?us-ascii?Q?gTjCwdcpRTsVQR2ap4sS5IyUEkiZg5qMeJK1iLpMUddR79/hLwnkgCndtqUG?=
 =?us-ascii?Q?5OiGuMCXg/dXyjifw1nQ27BI4Gz45Giy+5tVm4o4zhao9BElgIyWTGKDxWR9?=
 =?us-ascii?Q?dDjHwoCf2junsBUpfDMBwu/+DO8LmSh8ilvPudPDAONSDlu5uIREKlz0+xUs?=
 =?us-ascii?Q?JvGsb7jfqu01BFfGlzlxrvYZnyvS1FhGRIPuncU5IVN5CR9TkYksECg/SwB0?=
 =?us-ascii?Q?wgzyaZw0JmrKxcuLqe9a/zaV/W1GQszeW0XaqaubQX5PK0EZen7m39EdXNyv?=
 =?us-ascii?Q?3B0mYrPFKDbdJMLxK+YEdFacIV+IauGNbngm6EMNfXDJ0I3OKKFgBH47q+sv?=
 =?us-ascii?Q?XSAf2ivIjz28GqabtaN2/XNeYpnKEnPkhpd7kUu98SIs7dELN6mh8O926TVE?=
 =?us-ascii?Q?2ZNz55n8aXQ/3723/KPbZk9pzgw5smPT9RbwI8Xt5h7xXnxt8UtBaNrptrLS?=
 =?us-ascii?Q?nZ41ri1g6S4U5ED/VxQUhJAKd7yD7YKphi15+BbtXt/RZzQk7zG3JQ/Y62rk?=
 =?us-ascii?Q?FT3Y6KsZy4L9Z6SLWS5mn1znnlp2r9P3jLgm8WQDW0bsSmrF+1VYCq5RH8Lt?=
 =?us-ascii?Q?c4fZ6XgBVnFB+kLRnYD5IgmebDGVXLW2pATEWmzh+HkkpX+N2K0HhUODZ6V5?=
 =?us-ascii?Q?CRcrA0rDyMY+XpRDZtok5Qfqa8LN+IYKZJlYby4wiChbCC8wKMYg+RpBO91P?=
 =?us-ascii?Q?7yXQZRP4wSuQ04KXDViyLFFWivn4wl7EeuwqIpodjlyTMTcQ64lOkbKjJkqW?=
 =?us-ascii?Q?x3vIPcWv/14Snh05UPuoZfzGogUklB1V6snTCQxGRf39E3kHHqvEiEUGKnlG?=
 =?us-ascii?Q?mRoJtbgC5xoUzfhupTUJXUk6L6aD5Bi/b5qO0GspgQKGQ2tD6eSi8m+Yu1PT?=
 =?us-ascii?Q?98M2C0rvkEWSy3ledwk9hhU60ZNGbaPBMc7HZhkPg9CM7HfZlIbAimaFrDi1?=
 =?us-ascii?Q?x/ymgX7JBxYIf6jwzN6jSIOOWrlaGaf4SdJahwTNvOcIXMdJoP1q8Yia2IZf?=
 =?us-ascii?Q?EUVaRpqH62rUyl/ID7r8U6sXBfPO6GktVl/npH7AHzfIDjcUnav6b/PqfNFS?=
 =?us-ascii?Q?0X8gdPP5L8V5b1VRvsbD2bCSqzKYErw6l215Rfvvz1HnfR/cTOw0q+zZXp5r?=
 =?us-ascii?Q?khnRGQKSHVKEJPmc3PejccdrUdDLXYb5NP9stWEJ9j5FVueybIRzj0JXjcS3?=
 =?us-ascii?Q?2tPBQ9kTgxHU1PahRm+aOsXc2zP6HmbJcM0qHjDXMwj7UyA5ogm8QdPc60i7?=
 =?us-ascii?Q?nODVo170MT371JBT7f0RprLxKFo8R9KGFgo4wJi3owshbcFYi2/tpFKCtWSl?=
 =?us-ascii?Q?as0OVd5pfndQ9LhMwzjBkHs08QsqKLRsPEcw0/NQi3EZdvjm9xDqEAIm8Xy0?=
 =?us-ascii?Q?auB4SDLHpmuZOUUMnX6ZGHXXc9c3WL9noAvfI4AVAAQm2674nq/M7JBIqeo7?=
 =?us-ascii?Q?Vy49Y4U4P3xg4aRMBa5LGMFbe0FIg38ghtNCOeYXYfpMTG5cxE0FJDj1xb60?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d18205f-0697-46dc-1efd-08dcc5b32f5f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:56.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5qTcMA7s9iu6a6P6dFG+ei3BcHN2geU2Tr9du/GNsRxklD2kCLRaOXg6BQNyULsQS/p+dQ9N2dwl+FZIfL97w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111946

According to
https://github.com/testing-cabal/mock/blob/5.1.0/LICENSE.txt the
project is subject to BSD-2-Clause license. (Also
https://pypi.org/project/mock/ states 'BSD License'.)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-mock_5.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb b/me=
ta-python/recipes-devtools/python/python3-mock_5.1.0.bb
index d9ecb9d4c..1b89260e1 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A Python Mocking and Patching Library for Testing"
 HOMEPAGE =3D "https://pypi.python.org/pypi/mock"
 SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dde9dfbf780446b18aab11f00baa=
f5b7e"
=20
 inherit pypi setuptools3
--=20
2.39.2


