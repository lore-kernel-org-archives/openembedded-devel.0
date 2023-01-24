Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949B7C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 12:13:59 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.58])
 by mx.groups.io with SMTP id smtpd.web11.13284.1674562430158618742
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 04:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=wVfhPiyu;
 spf=pass (domain: vaisala.com, ip: 40.107.105.58, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fglkjBOP04SfnFg8Zw+x3cFfmfGQQi47h+HWij34zNqFwL92BhuXssbLBJRfooqoshjvPWyWjmKy8JmDVrPy1geATc8+igGi331kl8YEQTs2bOga6YSsiTJ/Pz3AU+OgRwIZaxM1Xwah/Aq9AHefG3jG3BW8EmjIsmBZhntPq7kgG3/32izI52GlUBwk3J9cPlVXEBdP+7uk6rVT+sj6lMoRkLjkEuAE7kGfq05Gs+DX9T7fnFkBDJ3EvuYgQA188W+4yAvarH+yQpfxxk2gKtjMbSzFom2zSq+a9DxetCd50JZQ9k5LvuViS5wGxlCKmN1oyl12vn4bZrPzq3HbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wXzt9zLnXxcDAYM0K2D7Q7yYK3/0YQ/ml0fF7RQMTo=;
 b=ALdhnUZZKb3NLzlBG7LEfNBUCSowzjWYmQIKI9gzwHEvXzGcfc70VVoES8sT2adcfWAfxlmdMMFqsjDY4g1852a6wrihgDh086Le8dd4QeT+t/R3168sGPh8VyFcT/F1LitzAIL07te9y6DQVzRFP08Rj+Zfs6hUHwbPO9zfsode+KsixIjNaMer3KaaY6ytQZd+4/p8UMoK7CtF/xPZKn7mlQ6rr7NPY9RmIXLE+/hYSygV++4uXSdYQnoRrPbKRXhCDcADiWeNaAqvH0rUVi9AYSavqXFZgBPHl2LlqYo6uBoB1YLU7Vrou9emq19YrI6KJSvEB5eUp2wTATQtWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wXzt9zLnXxcDAYM0K2D7Q7yYK3/0YQ/ml0fF7RQMTo=;
 b=wVfhPiyuQnno8yA6pTBKXuaziZzOGQNZ+xuZTjQInQBwkdmjsxxlA1aYJa2/imsjWN9XzHj+M9XRTmMHsSdqqpz/c8BEP/Tut/VNp4JOReuYrycVlM7fx/U5v250vsA9uEGPpbPFLdGixQ/5ufKRSthC6GatExGHIV04JW8GXQ4+6xmiC7wpM2C7vdrDSzkJ+sJRXGi9QxzXzxelytpUxBJC1W9UviyO4rMPhVHF/B0CXd+4IryhyMOUSXNunhyPPH+LdRkvDW8VNYY0/AAiqrMuXNJDv4j86C1/5hG19NTsbiNYsu5zMVs5i5MAri+Zmj4g+wnIMCpLPhZoo788sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by DB7PR06MB4425.eurprd06.prod.outlook.com (2603:10a6:10:24::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:13:46 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%3]) with mapi id 15.20.6002.028; Tue, 24 Jan 2023
 12:13:46 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-networking][PATCH] nftables: Fix missing leading whitespace with ':append'
Date: Tue, 24 Jan 2023 12:13:34 +0000
Message-ID: <20230124121334.3889094-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::13) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|DB7PR06MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac907ea-eee6-4982-a6ae-08dafe047144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FNxzyhWL214kZdnHn3RGz3w/PzSn/dvRSYsP3k0IrYPsKk0qv/rTEl+MPfoP+PlUSanR8nt2scSwX16hq0bD8gD/IulIyo/7yzgh5t3/eWlS+rYewFDZLC5ek4do5r8Xa4R7GtEXRod7OgJ6BG4adWwAYt3SlvTVD2TTbH+UXzacGq7ylJWQe1x7tDAfqwUn1jizTOvvPuDYkb9piZpz+NEIRBMP1qGi+O/NRSeu77FBqUApAi0tUYGUYx5+Ra5NcXtLutUPkqsezyeZ0nf7V7wnz7n+STCdAngqdWE6AKo4tIaZkKa1GsR+Y8IJLeiqM9t8C+2vQ0DgmnYdqfktUgIWWCykgl9nmsbfeJcTotogRSXIJb5N0fpIkrj5oEXYplJBet43EL0zJZ7wA0NXEnSCzmfVD5VQBZfG+L7i841VY2Vt+gUnlDnuGdhutFG0uHFLWhDA2b6+Sz2F2QYNeGf7UysZgAkOvvOsHhLINUZC9CXAS14mb4sfF9e7TQec9nRA/ve1s1kWGt183sPpXUoNxp5DomLfG8ttTzVozr6u3lga88i+Wu2LaKny9fIA1euPNiE4i7YOSwP7Togr3AYYMVLTvHtX9XmaE6BdFQlHFOEBOAemcig3lA+MJIDAS+07dBGWQqATCIiPIl8vKtmKrifFI8Cpi+OV0RmLLxRD03FyBGpJA++F5UXY7FLjZzd3NR/EE2XFa36YlY4C5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(451199015)(2616005)(1076003)(4326008)(8936002)(4744005)(83380400001)(41300700001)(6916009)(5660300002)(66556008)(66476007)(66946007)(44832011)(8676002)(38350700002)(2906002)(38100700002)(316002)(52116002)(6486002)(86362001)(478600001)(26005)(6666004)(107886003)(186003)(6512007)(6506007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RxvMtz1f2FuKCC0gKAzboMuWTF3uqjVAPLWxym9212QUqiJ43qFdRU2IbTs/?=
 =?us-ascii?Q?JPTpP76OeTp61DoASNdGTpdwL3HEz8cUQEItmwNvjLJRXz6uIwrtXOC8wpVO?=
 =?us-ascii?Q?FJPbHp37+rnv0L5Rle1MVxWHJh1sD3O8GE8iB8y1Ki6IhJpg0KEtv7R10znM?=
 =?us-ascii?Q?pImnAqPerJSWkLmdihl41VHYM0+PVNWtgTwv+nQznbpBUSGt8HZmLShkcOr7?=
 =?us-ascii?Q?rjnKPYbW1XQdJAelYFn0pIH5Bq+rNwb6KIQS4GLnHWTYiejhCGwEPkXLP7b8?=
 =?us-ascii?Q?M3FOT03a2mJrg6YfWECnVdqK5SYzRAN8ICIM6VpVtrdvNXQ8cYXxACCEpOL5?=
 =?us-ascii?Q?lsIkJo6CtCaUz3PcrP7Wi1o2A5za7I/DaGI/PHyEtDPYB/+x9ur1EElQvTAM?=
 =?us-ascii?Q?peiMVBiyhb/MgFsnMCCxlj+VA+eymv06KrS8SrjjATtbg/YvlmQ9Utg9BRw5?=
 =?us-ascii?Q?Z6erbrau7Scnhvawh3epfp7tYtG/7VNAjmjTKdbbmzaJGqinTnZye4MBuS4+?=
 =?us-ascii?Q?dpgbZfEwSCY8yJIF+49RuESKqv+eS76gPfAPNr8uIKVs1DBO/ZDuJLsBtAhA?=
 =?us-ascii?Q?Wy+hpZ1RA999smssor8YqckqaNOol6yGjrK+so5r0bTwpWkb1xWoS0RZFdx4?=
 =?us-ascii?Q?v3ANJIHtNHSIKkMT26GPXfFy2dsqaDgpWcfMan0oZvxjvtDaX0R/EZ1brzeG?=
 =?us-ascii?Q?0e+sS3WqEme/rtN7nJsq+aLTjF1BXgOixph7CO3ZbvFofiNkOFbmdVqtNc/Y?=
 =?us-ascii?Q?JiD88GveLcYW1bJR3mNYg2CLvcf2fSc/txQfgPIFP5r3IuCdqYL9yCa2pCIE?=
 =?us-ascii?Q?gdGWpXhh0Z+MUhJpCagYMaJg7YLPm+zGyvAkqe3IkDQ9K0/6JiqRB+aS2bx/?=
 =?us-ascii?Q?r8c9xR34HbLTFLWyzJfVX9mE4qsTyfr/b8032o2N5ysprrAeGa1gAXYF8KR/?=
 =?us-ascii?Q?+EFrBI1HGmt1vva7qkSQW0KqqJaHQQa9BT3n/boY0jPg4/TP4Xf8iSvqkHW4?=
 =?us-ascii?Q?4sKHlJFgHi3c/JCnnUt2xWlKD3XO16qB4KQCzGvgbc5yWvBZmbHIpsAPowzL?=
 =?us-ascii?Q?3e239/2XMLcgoVrc3Py/+PsjcZnFUMz6SjZ5lfWeLmL3bQBYN3J3Ro/yBXI0?=
 =?us-ascii?Q?XIiqTV+Msoo71jb8SZAqjO5cutaxzCePsDFxFkKUYdR5Q/5Jpb7O5lLfjACe?=
 =?us-ascii?Q?MpU1t21+eu846CwnUF5kT0MKaddT5zJ5uPF37TDK7FjiGHNJlEvs1ZcUbjab?=
 =?us-ascii?Q?bOO1d0fivOAaOF/jMF9MKI3S1D6V57nkrm6Aqh7yUrrK/yXRkEgfgVHnjM2R?=
 =?us-ascii?Q?F5yeSPPRg5D/ZeSX8+l+NlydGT+MP8MFMj/Ih0fya7BZvHfZR8KHUnFAXzQ/?=
 =?us-ascii?Q?5eurFeXyNvxWl6cVCiGTPGLa7NeCt6w8JGK4WLP0UWC4+4nfPi1VxzUITZpV?=
 =?us-ascii?Q?+TL7TcDzRsw9O9YeMP8pn3wJR1uWuox5WY0XOlgZq9hzOoFaS5co1feduZ3b?=
 =?us-ascii?Q?d3Qp2zDrcVbkrZxlEkij38gfwIbpuKmGn8jKwU7nHa0sL22kHzCi569Kq9Tu?=
 =?us-ascii?Q?6dUFsLx0SkuP/2tpI/RSdpyFZsAbhTK3IerhlQpDE76kqKN/OLLwyJ8UHhW0?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac907ea-eee6-4982-a6ae-08dafe047144
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:13:46.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpRnuzGKkeeQxWlX+4iIBlZoKIkX034zk1VItCmRCKN5RJf4LUSByfSto9XFVJaILyOjK6aSAAvtdBuZsat2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4425
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 12:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100719

Mitigate occurence where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb b/me=
ta-networking/recipes-filter/nftables/nftables_1.0.6.bb
index fb9c6e7d6..f43a223ac 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
@@ -37,7 +37,7 @@ RDEPENDS:${PN}-ptest +=3D " ${PN}-python bash make iprout=
e2 iputils-ping procps py
=20
 TESTDIR =3D "tests"
=20
-PRIVATE_LIBS:${PN}-ptest:append =3D "libnftables.so.1"
+PRIVATE_LIBS:${PN}-ptest:append =3D " libnftables.so.1"
=20
 do_install:append() {
     # Avoid "contains reference to TMPDIR" warning
--=20
2.35.1


