Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web11.2569.1630149921712462825
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 04:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ZW9OXEqO;
 spf=pass (domain: vaisala.com, ip: 40.107.22.42, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPoEsGPZW68wp+NAcfrUJIgNpXv3grsaADk3+uCfurccMaqGsVPgsYK4H14j4rJ/uSNd5Td/2XgxnmVI+mUe+rvOH1iS466ZRKz0pUsGlkxg38Oln5ugeHLCm4HjNm6gGFzwe3ASTPpoUC1VhihybHEyTCq3SDaWKy5bjde7w2OiEk5aFB+uVCjcFx/m/LbcA6AlQIOYhDLxXlOZ58ZBtstfWVvvcAAXemr7oDkqtKDt5AGkNkQM+BcWoga1+f7BfcJXPY2YATJxHjabfJOtfEEPyHEHdupWlRWXpZ1BN6fwfH1GoD5Dz0kHNsC23pv5LT4hFsLSrzNfEoOw2RLQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WmYSHmhPbWu4LgjvPVlSZlBzJtfZmEOGSJPw0yYkF4=;
 b=RX+6kb+y2gcZDJE9PlYHTX0v/D+lmaKWLGcKQK26LEC5a5QUtE38RttMc8QROyjTdoHzs9uDNrn7wu1kPcvV07y3Eh48fqAgUk5g7T9uoQsWOoGmuqAfFTtMljo81+u3qoZoJNVp9dz0Qq/+RxLfqKQ0nKTVMrbWcXz8IcleFeoCZbHhQLavHZuZr0or4EDuVGVSmrAXkhoKwKB314RjfXCXIB/+p2b+WpNBO0cEvMDNKrY+Rd/KKJktwrWIMLIYbcnH0RAVwHE8yyzoPQvu/z7KeBemp7OeW7NsjIa+CYF+wmoOTOy0LJ+RbOAnyTyD7wyidGkYfwg4gg0cpxmbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WmYSHmhPbWu4LgjvPVlSZlBzJtfZmEOGSJPw0yYkF4=;
 b=ZW9OXEqOxXjm+5xeMuDhB3S9rWVCCwIb2oUmFvS1YmcOxjgy+iMAUPsbshrwZdlitE+2DaqhIkK2dMrsArl8DQ1tPsJ6zhvoGgL7KuwTXbsdhDH1CvYC21NeUUFMqsCQ2swITGXuPW+JeQsb89/QzNmAZGsJZvKCxtWYaInsyG4Ic8PUX8H5eFj5vWF7ZzqnluAu8+PuB6IamoPMADq2dxUzfzHdvnqib1f6kPSyOyJth8ZQAAIW4O5XrbHPTNX6B8hEbc0XqNEsUIRBkFN6yvb/3pr0zH9uPO0kn1wk9vtDcfgsMceLu/oi/Z1I7bdp8KQH/wNHM8d5wQy0Hrby8g==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0602MB2841.eurprd06.prod.outlook.com (2603:10a6:3:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Sat, 28 Aug
 2021 11:25:17 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 11:25:17 +0000
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [meta-oe][PATCH] opensc: Upgrade to 0.22.0
Date: Sat, 28 Aug 2021 14:24:58 +0300
Message-ID: <20210828112458.247264-1-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HE1P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::25)
 To HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 11:25:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c94edea-ae55-4062-9aad-08d96a1682ff
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB2841BC868933FCE8CF91784DEDC99@HE1PR0602MB2841.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	asWW0nv4yvTWG3tWMVJjC2OuO573Vl6WQ4lmx1r3H62a+UnrLxoeNYT4g5IHdaDqdMFHeET9BreMuwvRxrZzbI18T7azOAMayHD1P/qDUmGuEvcYI9StwNn97/2YDHF45Tt+ZtpAEfMw/San8J6NZi/BD2ffVy9FEcnVVn4FzW87RWV1hV4J5bOM3c3PCEM55Utyn2R23IIZ9Eo+lWT0tQMoaxFMzIgl+T3QOU/ZACzR3fFdYrnVw9VkrLhIc/THf/B+8gJrdZdcjJ1xTh8mA/Ab47X9m16tTA6YVFmbsiRsIehBxgLuFrDibXnQco9vmdeQQ8t08JGRP9M5T6xArUNYMbHkBNd2yrO+XsSaaHhM51c/jA26Q4KcEUR4rovmj6eK/QBKCnEeBbSagPwKepPzxN0bKtOGHGZ3CVqFLsguonQZVrKRQNJeL8RmXHasw8bwlc4qjYlaK8/Y+juw5OWxslEPbIRtuEPqvEWLm8UI8NEQlMPV8lwQ3Vcqrqb0WFg5ja0nUVT2Cdh4f6J6CtgAxWeWRiT9gmN/OGkrwA8tPMQ/fjjf+ayV0Gv2cEsUnHpKDdBUHq9xafkVuzUtH8ifoty3QGONUqA2dnJYdUcn5LWAYuvlEHecIPByb4A9QoJiHQO/COc8uEufxV1Uh+U691YnKVBn0IcJfrS7z3opiIGkUIUXrNaqRfifNg6SqUkNLzlaSVX6//Z+yEn5Kg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39850400004)(6666004)(8936002)(8676002)(316002)(1076003)(38350700002)(956004)(6486002)(4326008)(38100700002)(478600001)(66476007)(5660300002)(52116002)(2906002)(26005)(6916009)(186003)(83380400001)(6506007)(107886003)(66946007)(36756003)(6512007)(86362001)(2616005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?953rPdDrpiwi+c3yHinrJkH5gShnHiXlLIrZvQaWp46+ZvVtlJusd5LaOMmC?=
 =?us-ascii?Q?teXOGa5pWiG+dq0RV28tij4ETrfcEe0iSgKw6xKGBnz2Us/puLKfCmQz5Eul?=
 =?us-ascii?Q?+BZXVdz/fN2hwGApB9ERyrG0t8CQZ/zFvaXVvI/q2J6XLV5MVt4prWACtAQj?=
 =?us-ascii?Q?VjT4+fuH4VkWUB/ugFSF5si9bPZdaR7qlJ/fF/F/scvo57BVs+pq4O6GWPH5?=
 =?us-ascii?Q?9REdfALh/QzhmmzwoBsd3FagjSJ319NnfrXG6996ULf6wsNH1i/cQFzrAtwG?=
 =?us-ascii?Q?PDYOympouF7vxyvPFX3HU60nHJYtuSvzl6m0QBUEbZsdxVjVmSIJ1hwIRG+J?=
 =?us-ascii?Q?LB1iK6MQFfuH6dsk5Gj8crRrjmoEzUq5G0VE48uTALQtyjpbIJr5Hadqxx4G?=
 =?us-ascii?Q?xa6mK4czzbDRXQDF0uF9hpQpw/x0WNdlv4hm/+pIDQLUw6+2XKBp3QrQM8q/?=
 =?us-ascii?Q?uN5TvXgEd1Jl0VK+lgKnS6YcRwBdwav1a6hbSzlfr3xvtpckTD6MM2+lbg63?=
 =?us-ascii?Q?MutAXGGkWFXeQvM9aojMqb32Mf6mUfBfAgEQGbFhzgCzFhZ/aXi9Tk/pXulB?=
 =?us-ascii?Q?s28nlU6O8wZD0PIAe5JU6kpcD5W4ry+Gg0bwz6eYLQ2OcpYC/4KHHrgG1eBG?=
 =?us-ascii?Q?D0ZIPV+WuqCDPIyeFqtIok2LOiZn1foxj3mBXzX+e4gF77asRYnE1nFBt2ko?=
 =?us-ascii?Q?3Z5+td/HmCaOdUT73lFmItEeJIIipmNvQ4V5mPbF69YbB6gqgDhVAwogdpma?=
 =?us-ascii?Q?YenOtyLWwvOUYpnziAHdWVxdtK2ebho6m096MX50RNeEnzdABcckXDNKeLbn?=
 =?us-ascii?Q?DSU1qAv4o6yrXIQ90YQcmZ432J2oVlSZnl53UCXqYRjK/ZFg34PcCF1Pb8sU?=
 =?us-ascii?Q?twvccG6Kugol8uaKb92RIbp0uu6ZOy8iGgrRTBeYD2tUXjla/tgvXfwLPa9G?=
 =?us-ascii?Q?fyCbD7VEhouuKR5o7l/Bfao++GK3pfwf1/1/iX4Kn8Jf+EL3WlBV6XIE932a?=
 =?us-ascii?Q?IClYqTtSwgPFxfS+bhczvf56Bp2ebB7OHaA07Ag26PZKFk8Q8O5ZB6ZbuJr7?=
 =?us-ascii?Q?nICopctqdw9pmcQh4whfyOx9t/gmZt9XD9uEoK3XzP3FhRgUsvc34fXNJ7Ol?=
 =?us-ascii?Q?XJSyCMci1KzI3Lih2Od/YFKdo2a9Y1fRgTSdgfFP6rHuhtRVWqm09MSw27Tt?=
 =?us-ascii?Q?2I8CdreOsBH/urJhqCBh1+Dc+PCH1FCRp5NhSKMClSZPBD3oOoAnrVJqGPqp?=
 =?us-ascii?Q?BdJXyPhS3BSjm32eZUFesx3dVhdGZl7JkIUKX59px8h+T6QPnQY2uGjLPP/e?=
 =?us-ascii?Q?UzsHcMO9qUVCzZGmqk53i/vq?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c94edea-ae55-4062-9aad-08d96a1682ff
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 11:25:17.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sr1xvTxYwlMtp+dqOq1DNFBqAnN5x4OKHRw2XNUPhYiOE0Sh72wWkU7ZKvapGhCZ5PfGSBts13TYVyR1mO+2d8f9fIAkaysZS85Nz8fOG00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2841
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
---
 .../opensc/{opensc_0.21.0.bb =3D> opensc_0.22.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.21.0.bb =3D> opensc_0.22.0=
.bb} (95%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.21.0.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.22.0.bb
similarity index 95%
rename from meta-oe/recipes-support/opensc/opensc_0.21.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index ea832ec0f..c17850d7b 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.21.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -11,8 +11,8 @@ SECTION =3D "System Environment/Libraries"
 LICENSE =3D "LGPLv2+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
=20
-#v0.21.0
-SRCREV =3D "30180986a08cf71fe4af4b50251a8bb5b1ab95af"
+#v0.22.0
+SRCREV =3D "c902e1992195e00ada12d71beb1029287cd72037"
 SRC_URI =3D "git://github.com/OpenSC/OpenSC \
           "
 DEPENDS =3D "virtual/libiconv openssl"
--=20
2.25.1

