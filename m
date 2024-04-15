Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8809CC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:31:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.95])
 by mx.groups.io with SMTP id smtpd.web11.18706.1713180692022426133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=MjBvAgYU;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.95, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX8HJsRA3esN6aKY82IbmeTXpVWRMFXxjNAmVoA1kB89V4W0sy+HcCXzVr/4bed00HJ4qunO40JjvvZQzcFOn7Ufkw3riBZNfkZV/C2keyigZdr9kL27cPrjaWjjqWHBTAh4cZxhGtSbr7c/zJBFCTdMPgPvYuUYT0xbZ1H7dEMQT2LIaBAgm4ciczQ15GaHl0JIzK6D37RCcQeDeBYn10mlaFjWObMx4aX9XWmtpS9emAaW3LoC6B9LBpl6Z/fPGr+B2Y4QSiNk8gooTlotgRGEKRTx6/esEnK8DR0WLveZ2etzozDywjoSwEXCCuRVzAxuuhjUYrlhgq0Hv9Ad0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpnKvkR1+DwCxUh6Hn0PPOgyypfLwQf4iSW4uzZicNE=;
 b=UiuMdRdiSTMvZoRP5CT6rvzyQyr5rq845Al85PgslpE84pawcSaOxYJ0e0fUEFZfZCviWnUVl34vQsobJuHqlr2YLdRN24k0YB5pEdUUXQxenUUbmF9WqTdwh5UidG0ypnN8H/pf2wSe9BoDURLWiLRGaFKKTQ3p/oVcyp1XkSG4VE/MA5DclNTeiwLVYU15HWgHtRO/OSXZ2cBXNd3h66CuWsrzh0cXz0ZsCfOopiawMXV/PZmoFuD0nj0CfIXcvyM66IgumT7QV9NUtSpGGd27DxFuvBn9YTDT75a/LU9jb2vHntSztsT4wUQga+K/kSsHSwF6zO2jrdI1IFRSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpnKvkR1+DwCxUh6Hn0PPOgyypfLwQf4iSW4uzZicNE=;
 b=MjBvAgYUMRpF6vkAvE7F7PUk2xY2ut4zs/6o63/pQWqSB6AvTgx7WlVqWPeLYj2EU6xVcK5IuMSKccf6sR7S3tzAXMq4zpBWmSSt8geR6lnbcH9viMKT5STNbjJNC7q/1G/PLfdc405H2aYBYhBk8OlcDuW0Ru8t6KhnOtin81cmlAsS+8SCeZRNKQ/4ZTVdgA5U7pg4acZkh8O5I8czqedrd+Ig7mqg7+MVIBOQ/bJj/xqh7caGaeSFLgL91V7y1/fNNvxHdTU6vwNjueq5F40k/Cis9O8rogViEfJ4CJXJaxeclmi8wpC1q3jDIJfkGn6kffVZw22z1cKZ4Fn0hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by GV1PR06MB9342.eurprd06.prod.outlook.com (2603:10a6:150:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 15 Apr
 2024 11:31:27 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::caeb:9c64:8a5d:b578]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::caeb:9c64:8a5d:b578%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 11:31:26 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [meta-oe][PATCH 1/2] docopt.cpp: turn boost to a PACKAGECONFIG option
Date: Mon, 15 Apr 2024 14:30:29 +0300
Message-ID: <20240415113030.39050-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0043.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::18) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|GV1PR06MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: d554eb0a-57fd-4da9-5568-08dc5d3f9647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qVJFio5pHbs+Aejcxjep/8JrUqRQtpj67vnI/HNJpclFRvDJUE9rlRWWEFOfARIYLne3z6/dE2C9jBSo+okMYptelwEb4gfIR2dJsjxNKkSoHjTK+QJScHqWJrEFhaIBewUSWDsgUn7mG8CeZefqyHnWYvF6gr1getFKnRZrf2rHEMPVRxL7Ej/BGAXxxSHEXD4KoAy2RQniH6CC+wkhlHyykfVohqh3z+l3h/gV7V/UndjgSZpQ57pXZ3VK+zVXlMG2YaVsh/jKD5TkvIX0o+b4txYt92FiyHZpw0DZaiqqXPu9xWVfNcJ2uoKyKEOUEnHhEqFIiBzPNjS/ls6W13Kjb5ij/7CeYnGgAt9blxxqOujI8QV05lWk0LoZ58oMnYT19YCFVV9PPIsbOF7ZGecc5qcnzwGIuzX9adLJEgM0dgDWyGjOoi8CnAz3ktlzQvNPU0wP5ikYoRZaegr/r4pdmTMveup9wEcPf9MFwoqBBjzY2YQsBcJXLTD+Qry+bhez1gBaB59SUfWwWZrtXX7UxQTAX9B1GI5nDP5eH+xlnScupRwhtHXfbM1+/qSar8kj+PDUo8hZkK2wrOLmXNLBqReoyyCO7qcZM0Fwfyead9A3JNZ4vMOl0seJCUK/pkpVvQ3T9ox5UZZGZL+Nw/NHhxYh/yrA5MLL7K3ByZQX25RMDayGReRKO82QigNSIcxiMOsPz3UiBo7hX8Qunk8fjm+VrWcZV7fN+WQp1No=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Mig6L0Esd+BdD3gC7Cxj7F7QIzsy+yXr7aSIVVf6C1eZd6+jYkv33yzMcUr?=
 =?us-ascii?Q?6zK2z128OHcsWq7MxKA4koqi+3sVRaPIzB5hYFZLv8CwQ23S67Emk/AdrhqB?=
 =?us-ascii?Q?QWb66Nf9Pc2sHvYJMx0bVm5nDag8hLONfesYNhYrtA0US3nNcpe7XqOO91fl?=
 =?us-ascii?Q?1WEN9KP1MU7toZBFX+YwY5GOmYx5qF1qDTidnMX5INEcae5jm5NtMmyn4rr+?=
 =?us-ascii?Q?sZ/c3ti/E37k0p1STjgs8AvvMfycnvnKgy+emVmTgLh948UHM3FprwCeWLDX?=
 =?us-ascii?Q?jVaPzmwU88k8lvqmMt4TbA40tHaV1pnPswOrm/KA+wOUEetNhoAAz5BNog6I?=
 =?us-ascii?Q?pCPOAjUzTUlEnvCWJyM9FdSgMAWfTaZQrtCZr3GEH+F6yHT69yJvKPTw5w73?=
 =?us-ascii?Q?hEUvsvbyGj9Pnuvf2PGb8pjTjoPO7IP/WXKNpTLzqTweu+voHLH1vhNVVzDk?=
 =?us-ascii?Q?AFG4Qggu+xBKpeukX674jRi23SAC7cFyhOMyj4488omIbXpm1IXULSXS1DNp?=
 =?us-ascii?Q?H2XXrYJXxnLz4rDnuVMeiXEaHzBkmmSYogIcX7ep0HsztTLnzYM8V5qUFgSv?=
 =?us-ascii?Q?ofumWEmwSnPjyhaJbJ3ASX7zn03Yoba0mOkFcCJrPz7T9JWqwBV0eJfhoRyw?=
 =?us-ascii?Q?UofXHHMGrkUunuLn52dI8Ul6Q7UkDh1EITglJknTLP7RX5CDCJb2SFPdFHNe?=
 =?us-ascii?Q?Ms3tTfY3n9kPKQw6l3MRFXL6Q0uI++Hzv8jfMYelnr5KXB1MtzuL024VIJ37?=
 =?us-ascii?Q?mRtmZPuel7EANLdQVG0rwN9aeOk/pNz9HvLkX+eIRHBC5otblWvyWpia3DJX?=
 =?us-ascii?Q?qsuutI9WfIaNq+R3qKoeP+gGat4b+bD9wy78I6fgTaJvY5oixS8526UI9pN3?=
 =?us-ascii?Q?zoq4ZVTSDcaXfkgPYLpXe65yXLlvRdVDHGieC8fJlHUiVgXW91r9MBt6CKCF?=
 =?us-ascii?Q?RBe3XaUhtEISQ8lGE3ukclcEGyL3fhevMTjVVEHdy1R2rfVqYOWjx1jRdd99?=
 =?us-ascii?Q?vUJejktECUzQeuov6uNJjKFz2a+/3nrK9ZMhlfgyXfLNICeYj6Q/37mKEHtk?=
 =?us-ascii?Q?nJ5GqxbkVwJdmDJTVgY+EArgNwstVMkKkoTJhPSg/wl1KQidlDIaaFolWBgy?=
 =?us-ascii?Q?wn4yYra8nYKg/lSEAtiUAL+CLMJPBw3Xl/oISWu+m8xHesb0egZIsP/s3lAZ?=
 =?us-ascii?Q?3XJDuU9qdk+8eJ5lQSv9ZsNVs9ZU4FIxaClUsusi2rjB03e1L59Hr3qWsnYM?=
 =?us-ascii?Q?kB8A+d0GuseY4YXGoWxai3U9p+Fj2NKASwYxuoD5evWAKDXq6dDonE0yT5RO?=
 =?us-ascii?Q?PF5PAMgzR2qBWZ+Ch/meofbf58kYrzKvxR5HohH3JOAnBlQA8p9vXKB7MVtt?=
 =?us-ascii?Q?wPzkt6KWEu3ddeWggk1qXKBijNOEl/nQzPV12SlIPgM1Gxtm4mSMrJMVUbWb?=
 =?us-ascii?Q?JadFy/8VIr874zJfRZWrGzpVrS0y4r4bxXwKCQRtT1hoa/gC7i4PzytskLTJ?=
 =?us-ascii?Q?kTgMQ51WbgoFFb22j+MdVUE9PZ2gx6DMQ5QFgY5GICUo6tGQSW27Kx8xLxgH?=
 =?us-ascii?Q?MwwYsN4eqV2HO73wfZ0V4WgnfldTLMsqJwFTGveLgCIUDpYXqqhe9BjwaBJ+?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d554eb0a-57fd-4da9-5568-08dc5d3f9647
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 11:31:26.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Om0ZbMxZMJiqJdB7F8kpmgf2VTDmLZayakJYt5a/59AjxenHEUqLYw4/nXB8dTxefp7+3z+OJXqCjr1x+wfYkaDAuvQ0jqTZh0ijneuHdXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9342
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109956

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

docopt.cpp only uses boost regex with the option USE_BOOST_REGEX=3DON.
When used, boost regex is statically linked.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-o=
e/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index 3d438871ed..87eed4b656 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D "\
     file://LICENSE-MIT;md5=3D4b242fd9ef20207e18286d73da8a6677 \
 "
=20
-DEPENDS =3D "boost"
 SRCREV =3D "42ebcec9dc2c99a1b3a4542787572045763ad196"
 PV =3D "0.6.3+git"
=20
@@ -24,3 +23,6 @@ SRC_URI =3D "\
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[boost] =3D "-DUSE_BOOST_REGEX=3DON,-DUSE_BOOST_REGEX=3DOFF,b=
oost"
--=20
2.34.1


