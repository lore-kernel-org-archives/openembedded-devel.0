Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50282C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 08:00:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.2723.1743580796921383355
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Bdf3OQNJ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.138, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6sjswH3YSy3ZVqO3A/pLmcI7wh3yDXcexBAgr/c1BrDoKkv4O5kLj7qxLgI2grUXuPkmLJzVXUWzUAJSWT4736/+jmJwWvfB8sTuGkeMoX/lYCGzMAspU4V2KWibEJuNxtm5gwlgwrvJb20s70ioA3aEW3Y4BnfAxLsUAB2kHfkoxxAv+JdKugDKwoTNmL2nFkxfm5kqdnahbWEiuS4fbb30aS+6yqfgDgCe+amZ57ekVAUJPy4Sm+3hzts2V4del/faqfMcFY414XxhDvt25aXG8dZlzaYz2tNmsHqGv52lu0bGRwY94ywrIe+TzQGSImgyIS4T4JLgniFAh5z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DpjSNh4OzIKv5LqQP00dqLlNjOFimYVAdFrYKPLdtY=;
 b=WwvZorD27IeNLeUC7zcWpsucBBbuZrEZ7CO8EeF0I5TnnlY4oagAHLjIwQ7/EVNEIfAXRrKrPQ9d1Urdz3fnqIu55bedg1GTbMVRdBkV/ZIc8BZryfyS5SneeWmAek+EdJ2Z0mT7JLij7duBcmvp7yf8xgnS+8At5EFC0qEFWcFnNGJzx1lb5MF4/vJ5UCafJApq3pm+PLEzeWpA2tqQJ8HTK3nBZy+pUTmnKPp8vXge+5nKVgysVuAlj8YNDQRFKjmNEOGoo7yBfjuVEInWhPqqcNSSd9Ssz7eaWA+gFhzjMQXIvrV9qeYtJKVPs/u0uzKOrWlGawloXI93bIDxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DpjSNh4OzIKv5LqQP00dqLlNjOFimYVAdFrYKPLdtY=;
 b=Bdf3OQNJ4bbl02vsTl36junp4/DER7J7hOE0OpAIqhdjQ6zQEYGOSQa16NL0RH7oZFiFq5l6KO2YYMtpUlGijogyRu1zdtFf0lyXsajtzOju9Y2BHnUWmjA7gDamSrJSYqrKNXr72mP6Ng1xizYT6Xkqm5ikOpMsVVByApn93eVUlvSCP4TGUK7/sv3YJQc2im2N215aOW6N6tS5jPHMeSVy2u1Ete1nkfUwFt/XC3DgIv8LEvNh0BMPasYEJ0iZ8uWSBACKBS86aHY6RWUP/i8LH2L61j8ICvQgeNsEoL+0XNiOvO7b3T72UsrAwKqCNthO31ziHH4RAXca7z/IIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM0PR06MB6436.eurprd06.prod.outlook.com (2603:10a6:208:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 07:59:53 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 07:59:53 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-networking][PATCH] system-config-printer: Update D-Bus runtime dependency declaration
Date: Wed,  2 Apr 2025 07:59:35 +0000
Message-ID: <20250402075935.2165902-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0199.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM0PR06MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f655f4-2e61-4764-3437-08dd71bc59cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uXH3UauqxMu+rtW/91N+xPdW1zMi5L2KHs7A6GmLjs1SFqnMmuDg2VXFKZCX?=
 =?us-ascii?Q?PiWn1AeR1glzxcML/3gk52amgfBM056/6zR1IOfDnvqooYHlzHEULTmNewDR?=
 =?us-ascii?Q?56rT8snT79gmYFwoBq/zBDoHOnwBZVhHOMBw6aqVF97UzepdJVG27B/9zbOa?=
 =?us-ascii?Q?x/YEmDteOpkGT/sGLgJIZwrZTUlynaBC4XHS9lzVGw+U8oIIpA/0ZqgNBoZb?=
 =?us-ascii?Q?0IGn+hLXiQQHy8R6xr892RJruyxhI3PQV94s5h/VtyIyAtgipeNLKmbAED7S?=
 =?us-ascii?Q?zUJjlALC5x+siAmy3vCX4SViiks2cjdoTyF3yEwihgnHOsXXuRtGSQVU03bK?=
 =?us-ascii?Q?9BLPEvPPv3Y/z6hJ46G7ynaUpvPuK5TQu5qhaqsbBrx31QwUpz1MBTO4aSGx?=
 =?us-ascii?Q?KlLGX3vjJ1ZQT57EUFBGjWEWJraKve8uxd6M4gXnwORWBwf2X0dhqOJDJggc?=
 =?us-ascii?Q?JGkOaNf0gGDLFa9A/2G7eLL+Qdfu/LSIZCqmmoE6qU1QVoDETqC0iFBcesQn?=
 =?us-ascii?Q?Oc8XdwNhBcnziTDsZvhiVfvPgXTuc/33mL5Sw6Q5HNWFGdvMdojAxhIYsHeU?=
 =?us-ascii?Q?ARG3sQthTlvk2r21k3yHTUMD8jplkf8CwqSpYjLuVO2diaRv2elz8pWjv3M4?=
 =?us-ascii?Q?VURXDCCxyryJWzYop5LEiLgiOd473BciRQG85H0KONu6DZunh2MFbc+uWdZi?=
 =?us-ascii?Q?+CjWKyEoed2d9vRg5rjS6ZoCPnVPlGrhrx6YbUoTFoTNYzricaW7kqPQi3/2?=
 =?us-ascii?Q?cnfZgbmrX8Cr67ijKYvl2nB5ctPOcnY4VjtP+F6EkerzHjo1xZk29q7HRKF2?=
 =?us-ascii?Q?g/W8g1lhAJXWcU3Qw8o262VtnUD8dqDXwlWihryqf0q14Fs74NU/1zvvCoEs?=
 =?us-ascii?Q?lwiuR/0Si6Tz7lairRfCjI0v/+RhEjQPCbSJcHyEYr8OccLTWpXKbZRnKymg?=
 =?us-ascii?Q?GMWqh4mLQKyymg1XJolTtVoaO+qZIusnAkAuapwnu91i3mdwufDp44eb2ZM8?=
 =?us-ascii?Q?VBEKgcBJ2Q6zRKrtqB7NS0h5RDCpY/HQz0LkKrsH7IHbK15MWcFRGCtuMeHM?=
 =?us-ascii?Q?plQqU6HSOFfDnUfF73qTPVIbf1UpJRBeFUBb4E9Yv00dk9GpbMGeVHgv21v3?=
 =?us-ascii?Q?QoyHcPkMGzeKzYNw/F2BuOwL4Ek+APiNN8xi3aKw59Gc6yiXRtHtFnK1azis?=
 =?us-ascii?Q?1xLSyWyZFs30ByfqMd1++LODwuOEzh0Qv4JdXokBB8E5WRB0DHiI3Slk+bU8?=
 =?us-ascii?Q?vOonMKOGQe+kYQyN0IzwZGbs+J8+5fS40jkgZe2Ehj6nVAetm+eJTwrvnqmL?=
 =?us-ascii?Q?m4qn6ZeggmtXuiNz0H4trp0TA5uvdYzckyQVkODm/qyDhRObEB9yCkFVzxOZ?=
 =?us-ascii?Q?3pQSEuWyuLmxPI114QKKN95Rzy+oKdYSUOfO+m7O0k54CCauusSAaRdyW6WE?=
 =?us-ascii?Q?tdMy1xhRvPJLkejNOrcyW3cwcakTtFHEe3NQblN1/cMyUrMDGX8Wag=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pvLWRtMJ550m42u0KWRcD+saXplmOk9GGMROLmseoOabN1K1nQmsRSNj99no?=
 =?us-ascii?Q?ztmoPZweWgKwre8X0A8SJaoKbpsIi/hPox5vASv2ql2hYumQz/5zJq2E7zDH?=
 =?us-ascii?Q?87F1238GOrx8svzMgffjvtux8NYp57TZrr/KXz72E8VKLyzHFZ5HOEk8tIhz?=
 =?us-ascii?Q?bWa3eX5E2zG7/zaLd3Ick3Xr1Bv952CvQHQqFGhJEB36Od90ZxmGHlT4WOCI?=
 =?us-ascii?Q?ZOxRn9uox44eCKwWh0NIv80JI663t7F39BJK+i+QGvb4YaZg8dLsKFTabhJm?=
 =?us-ascii?Q?XYyQ41XPkzYDFl28pjAcJyKxlOWN7TSIAR0CMBu48xVnhttZF5BTM8Q+Geqx?=
 =?us-ascii?Q?iOKiMZHwrL9qLwuU76WjLHZ2cZhtHvc+zaQZp0cEdp/9J3Dz2zwi6uIsIxKo?=
 =?us-ascii?Q?7uvvoHvn9KZXKvALiOCSFVVZqCcYEa9arJmssQ0DXu4aV8RAHd25XmSTCNEm?=
 =?us-ascii?Q?1K27irZAVOzgMhOMXD6DSPXN3CwTYz1E+9+idnSuwC43ODRJ1zxCE9kOHxBk?=
 =?us-ascii?Q?C9CPU7U6Pbt5LzNC6C2SkaOFq2rDLixfgrzcwoRTRtztUKoSKXxznuM8PeJb?=
 =?us-ascii?Q?oxj2Y4ftzmG02v+IwETIx7biqeinyZACcJwejZDrEE6R0ShgesCxLwkBCujl?=
 =?us-ascii?Q?ogt2vcHn7Bqi2i+bgtVlnLBSvhHrelPLJKXaWAUMaAtOolPCrMt3IGBgfHyZ?=
 =?us-ascii?Q?+bGcfI9bOexrs0uiQA2QPT0HFmHESTCbEou0f7nQmwc+0QDMTPRec7SSbivv?=
 =?us-ascii?Q?izHKVt6ZiZny/UfbCB84VzpfKFA7BfDQ7Huq7S9Geldx7HCoZqm9hTTGY3cn?=
 =?us-ascii?Q?SyFqdD0JXoSvwzNMGc3eXQ4PiioafRHOm7VmQYxHVuWiD4hQ2ECGAuMAUNbA?=
 =?us-ascii?Q?J9/Hx2WJXihajtJBhiVFfGO3nK3dqh6mgQhrguQElQ8mZGjMwH/pheh3GBWb?=
 =?us-ascii?Q?7SIDw1CB9HeR/ioNdvSPG3nqGTJeEHwSKFteXontCCd/DMOeDlhLzJrSeZCy?=
 =?us-ascii?Q?I147acBG4f/vMGic3KRB+Nq3Eb8u3d1WgEVXD6JPlRoVXvIn5hDgmbP2cSB1?=
 =?us-ascii?Q?1aCzSHyriSm82YRYxlXR73aw8u5BE/6NEAz2DFTpeEGUjgppDwuMfSSZPsrJ?=
 =?us-ascii?Q?NCLjb6WWyqx1ni2H4atxTfCwnVCl0O0SD+YJMH8++XgWPLG1aLLMM8/SzQ84?=
 =?us-ascii?Q?1VVxkMgjak03LPVzfPNBmewq7Re3NYhSd9msaOWVtEOPKAwxexJ0nMJmotct?=
 =?us-ascii?Q?0DoudUnlpCA0HlYVvLVkB2pgwhQSdxzArhmbW5NABMwsZi/qK2DV5mPC+SqV?=
 =?us-ascii?Q?si1OKXc4ZvX58J/fRFkZfryAptDMJielcerfPzDries1IsJpIUzJqaH12Fml?=
 =?us-ascii?Q?DAjhAo3qe02ZMRcnRdeEucrU+TzVCW3EgLZn4NDD0nB75nF1U7wcjxYfPGJs?=
 =?us-ascii?Q?fuUhQySarZc++KL2WLPJSSFIj6tmeX4NT40nN4PYkNAJVRVAXLTf8jd0u4pZ?=
 =?us-ascii?Q?fHnK2Ewo/nmquLGF+HG5OUcDPUvE1Mmc2JFChIZOpqDd4Nr3hA/nxKkO5pAP?=
 =?us-ascii?Q?Xud4XOqu7fPZ9vDZnw6T2YAuFuAIIf4sUtEp1Bv2BC43jWfzHtmdCkZ4ituO?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f655f4-2e61-4764-3437-08dd71bc59cb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 07:59:53.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok/tB/EF+UD6iQZ17OGX33oRRyDRpfyC+W8liqbX6dD3IgsEtc4m9bGMZ1iwgAx/lJS8ZrjS3ZvQmzzI9PjzHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6436
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 08:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116513

In order to facilitate users who wish to use e.g. dbus-broker as their
runtime D-Bus implementation, change the Freedesktop.org specific D-Bus
runtime dependency to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

With this change we also align with oe-core commit 5dfca64b78
("dbus-glib: depend on dbus, not dbus-x11") which mentions that

  dbus-x11 hasn't existed as a package since 2012[1] and is just a
  RPROVIDES in dbus, so depend on dbus directly instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../system-config-printer/system-config-printer_1.5.18.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/sy=
stem-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynam=
ic-layers/meta-python/recipes-printing/system-config-printer/system-config-=
printer_1.5.18.bb
index bff16b4412..f9a5e15689 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-co=
nfig-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-co=
nfig-printer/system-config-printer_1.5.18.bb
@@ -38,7 +38,7 @@ FILES:${PN} +=3D "${libdir} ${datadir}"
=20
 RDEPENDS:${PN} =3D " \
     cups \
-    dbus-x11 \
+    ${VIRTUAL-RUNTIME_dbus} \
     gtk+3 \
     libnotify \
     python3-core \
--=20
2.39.5


