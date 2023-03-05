Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EEEC678DB
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 15:49:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.11183.1678031352981254773
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 07:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=U4g3VeTl;
 spf=pass (domain: nxp.com, ip: 40.107.20.81, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juz0/F/YbeSC85LO+ASuhvYgIm5MNOzeqIkWzTO+v2VXvAwCMu3/wK5b7igVlz9IAhsq9Nnw7YxxYgPk0rCyZm+oqZGA2bvSoxJn/tiusjxvSOkCy3RgrsRDwl6RaxgrWr2D8h/3PM4Jor6mhtPGxWwL0lFa9kW8ForHmaGdYRISS0PWvxR952+Odr6rr+WMnAkFiVJc5SlJH0jtpJgRI51X4AMW7LjkTYL15cjt+kJYzp5NVCBq6k9WycxjRvaNl9zOE1cSMBfe9d920mVyzOZlYM7Zs7W01tJhGGW5mb/YL7niLfHDvNXIkX8qyjxnT70CFSAWlruWL+N2VyxctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chJYBQVVyOn6L9znpAxwFm3V6jQVETuXEQFxv/t+FH4=;
 b=e53TjCAVZ8/de20GQ8mk/S0P0r/rwMDYqOCo0I/g4i0IxGbFXQl2Fip4LFp7pVWm2TJwD/wnCtJDjN+mcBi8CUu9WXWSRCR5hglcU60BJzP2uLIiPS0HLk5qWJOzOpDWbMRspU1nUUuWO06FWpKbNzgcvCMmj9nLyimc4mItZXuR8bG1T3euYV5CnPDJCh+Nvo02pYDC8T5yiRXGmwbMMOsi4+9hIqvUlJ4LqugXQxSi2/P1PcdqVc1L/WNXRHch8AuIFE/d6XhiRp3dBaBj6pm41O971FCqpcdy+1BZW31toDLYY/R2jcs+gFhmdi8uYLl6iVz0Lkzl3kFZqnKiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chJYBQVVyOn6L9znpAxwFm3V6jQVETuXEQFxv/t+FH4=;
 b=U4g3VeTlcKTDY8h6xmpSQwVGBlHHXot3dQjohn8lzALR9Mly23db7nqddUIAoVZr3+265nqgKN0NoWTFOmNcYoR1sQJOcR47B23wLVoj3kkTm1sV75zNyz9HgBtZFvZEpjpVgGePQOW5Ve/cszeM3IJeJt6yDI18sCuV4QrkgBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AM9PR04MB8683.eurprd04.prod.outlook.com (2603:10a6:20b:43e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Sun, 5 Mar
 2023 15:49:10 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6156.027; Sun, 5 Mar 2023
 15:49:10 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] nlohmann-json: Allow empty main package for SDK
Date: Sun,  5 Mar 2023 09:48:54 -0600
Message-ID: <20230305154854.2516570-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AM9PR04MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 60099322-4c72-4071-655b-08db1d9128e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZuUOudAh2jL4iWxixW3UQVmuCKbWMi5afGgrIdnmX5Z2WjUQUYYNlLpIgdWnHBb10t6akwCKMGjknP/99KorjTBEgXJzFnu4GgFHeQX5iU1akP+CFQqvEdXbiOXSYuTIh2Zk7nNE8CVUGyPmeSSC0JFcWibIMByxLlkpWlPFgl1Tgt/zC+Zd5fQpza/ttg11Cv+GBHVrSj08fTONe1eBAvEKVZvKVEEvb0yhcuuPSwa+Y4EgJZX8TEn60/k7ONMOdFp/937na63zzrJgbEHCnsP96tJIoTZIgYH8KTSrI9+ovBZHvsP5iXIuq5kQBO/7h0YhwM2W7vqO7t3TAPDfBFcSDOE636iAsq5I4nWYxHwsFWSiO4FYmm3VZouDSal6NfAABNG10pte85w2zf3qgi0HmbBdoNAf4n+CkKIhhZgXlzhl+jFWnpjB7xBDUd0ZWufjdjTjyKJHsa6sunMEAg6K6xRkEkSma0yxD7oydrtQzljbEXYK33PDUuFzkJMOjKykIp58+K9mg+jsC1BE2V4nLKgJfHHyeLpthJEh83VvUiUN6Yi9lTu4DlTRvXPgA+HUEsFQXJNI1qV1KYkc0GpHuPRfFeLxtX2rvhSflkcf8an83D7rm4yUYq1NX/9a8PhEYCy3YpSeoURrnqM4Ea6E5kNLEuliKpTJbblGhh22LvK99b3aaRJ13AZw3U1p8oXV+d5wyNltkMpLUKsfog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(1076003)(6506007)(6486002)(6666004)(36756003)(83380400001)(86362001)(38100700002)(38350700002)(6512007)(186003)(26005)(2616005)(41300700001)(66556008)(66946007)(66476007)(6916009)(8676002)(4326008)(2906002)(8936002)(44832011)(5660300002)(478600001)(52116002)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U6bVdDybkPVNvU5+Zklpey0QtWyzKrrpchwOOe8dYd+Dok3ecWbdS7MvCHpw?=
 =?us-ascii?Q?ub2KdvtRWhV5EoWRnPEywwQvFRm6JmhfNIV98LCS6wMDKJQ0xTfnoIzXo9zn?=
 =?us-ascii?Q?Ezul2I/lCHePPd4XbliVvJlqWctC5HPZYJwFtK1NeWY4vrlHN/u/8pGZxx1y?=
 =?us-ascii?Q?Ad/5V01Ebx4t3r95BIX9wIorgJt4Abtf8sDsGIE9UBV+Xs5h6KlqhU+GndjB?=
 =?us-ascii?Q?cZD31bqUqhZxGi9rLNnnFMyWrsKzhrXqmjpzmh5gjaY6iEaF0xhiBvBksyJD?=
 =?us-ascii?Q?H9V40AHBi3aIx1SI2LtGJGFEwGYfK+iKbN6jTjF/4goEms3/TdD70UaXqe+K?=
 =?us-ascii?Q?I0oxcrSBhZoFCO1AzCeTzpmjqbtcucF5IHnuuonIhFFnEr2KdwQUAn4sztce?=
 =?us-ascii?Q?2W3cQgH3LAkUGYfKa7xh8SaErHr0ywT3bA4Ki4N1akDSkCp16Q9OboBbgSba?=
 =?us-ascii?Q?R/RnWfVSkQSt7jJuXRUSGjovLgwCG+2WCj4mwk5zmeSq66VW1w+I/fBds9z+?=
 =?us-ascii?Q?8tjxHUANLB9EQQhn+u4/k04KVdQUcpFKQvXmmyoLX4xieJCgAaS2zoohKelD?=
 =?us-ascii?Q?Q7FEw3scJNs2DLj1+2/0wdwDEXnFnEqkVlxRvK/vfRzJBNvV5tu4gRJ9Ev5q?=
 =?us-ascii?Q?09PO8T57zT8Y+5vw5plBHbtBk4g93spdmlfKiC+/74cQ2cqpqJxFYPhgdOF6?=
 =?us-ascii?Q?KLxUb5Cva8Pem3uXI6uDBxUsDPs8ierwsQzBU0Q88cHKvvXUThEWFH5HFPYy?=
 =?us-ascii?Q?4gys/hY9Jior/7E5ws8Uwhj2kCxWW6nbJTd2pPyfQiPoyNtu5caZgJcoQuAk?=
 =?us-ascii?Q?HQdmBfLyKx8YWmmddIDEK8v1uKgCLYLLQDv8vLqHa0mD8xHQjUG9Ie8L1ev7?=
 =?us-ascii?Q?cJPNa10mLGf/Loi1LdRvr4ltcbydxDPaVi9c1LCY6V4HyxozJ0jYT7X0wHgY?=
 =?us-ascii?Q?bky7N5KYDsivm/XdQoG3LEi/USfOJngC6yVwWYm7sEXm2x1dwXPiUV2Tu16/?=
 =?us-ascii?Q?DBvTiNlYIGzcjMTyk75lZe4tLduc/2SihlHnBIphspA/QbldSAQ86Dz6I8rY?=
 =?us-ascii?Q?KCECdOVSERzYDQ3qngs5YetxcRRDwKEXelKMIjEY7yDzptqb6Hc8djktKTfZ?=
 =?us-ascii?Q?SIQGMwaTRpmxqgFcjn46ZK77ael8JQ02cApKTbpYfmbbbOTJ33mVQl/xDL37?=
 =?us-ascii?Q?LHzwwwD8hEbOeyuWRceFBflfNXYmLb0h5uVIhtAm9NmGd5ZgeKtG7ydUBOUv?=
 =?us-ascii?Q?HzKZ85NMIy7KvcIiOlbx3dTJZGwkl00nnTzGW8dt92Cz4PfNW7G9ugndVOnY?=
 =?us-ascii?Q?uN+D7DeREVexrlKFuR0N8M32+0FeuiW5riTJWW2gUZUDO26EgBR+0vNBESPV?=
 =?us-ascii?Q?Zhj8xMbDcq/CAkeeyYxjhrs/SdtjIF+BTjfdvtO3P8Edmj+oKx8AAVHIuG5w?=
 =?us-ascii?Q?kEkyHCfwdBY/QB5cCNLebr/qWaJTGUdX8N2q50WQ7gX6IUwFs7QWeylG4tPZ?=
 =?us-ascii?Q?XJTYnbD6Or9URs6CXhC8UQ0az0rzHhq696wTlpC422Lp3sX9ZPqiQpp+ISMF?=
 =?us-ascii?Q?cpQo6qCxHBZHjAgHBgVMRv3VPJ/34arma85AWpyDypzcSyaDcNo6giF0bnid?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60099322-4c72-4071-655b-08db1d9128e2
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 15:49:09.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9TDYbKk9zH8EDZcjr4nSUKJ6pzTtf9IwcVWCWOwNneTf/AqBuTJnGuayoscoPXHEbG6+c7te9V04D7I3nMEgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8683
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 15:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101386

The header-only package cannot be included in the SDK without marking
the main package with ALLOW_EMPTY.

Fixes rootfs problem:
```
The following packages have unmet dependencies:
 imx-gpu-sdk : Depends: nlohmann-json but it is not installable
E: Unable to correct problems, you have held broken packages.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f9c9e7a448b9d9f7d54bbf09970223db467eedb2)
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb=
 b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
index 0cf6fd36b..4fa2aacdf 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
@@ -18,7 +18,7 @@ inherit cmake
 EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"
=20
 # nlohmann-json is a header only C++ library, so the main package will be =
empty.
-
+ALLOW_EMPTY:${PN} =3D "1"
 RDEPENDS:${PN}-dev =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


