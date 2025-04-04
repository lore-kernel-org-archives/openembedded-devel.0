Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F1CC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.76])
 by mx.groups.io with SMTP id smtpd.web10.8468.1743764081901910353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=B1FzvoVC;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.162.76, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVX44D3ngn/jPq1YOUGb/NqvpADn6tqe0HDuRwlnhpMu/9xFOSNgoEYth5eONebLSXq8aVxTQLfV8BTbJSSVk7mVVx4qTg8IL/s5PkoHrZypOitgQ4/tyT/XetLMV4s1RZkqtMlDycKBIsCtBQqRNuM8Q6QAoHQPAsv9taCKmQiuf4GQRQjEaZihSqAuWgDPaLrjrFbtrfiDb3vGdHSAyOwhaPzTIpnlozyp07wIxMdDPyvTjxvEkiJ1xFVOmg4dJRQ96hUegtOeZU7j+yE7INc5XR3BU3cYsbWEd+qHO/pTOBH1FUtxEtAKe+NbuVESu84k95LP6Vy08e1OF7rFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTXdyl2H4Kre66Nq7w25uZCB3X3wiwlkQPTmeoVhQJc=;
 b=f04wxdGPwy+6MWG3aYjhyLRRoO5rcoKxGKY0DjG3MjpY1idEl7oKVMwcLsOwf7IdTLJyxNlzZ0Vc88xay4oY7C8IvYMmZBhi0tCRaL0cB8KetJtm1kEMb9OIIFg/OCjzQMtj7qv3IL9emrHYNzGQRp1xvx3KtMCuc4WCYKoYrj8d29X00MIzwMe97qYhmkv5JPqhQ1OXBNLbXAZi5lOnPSkUl83ze/f5TMfz/3gZ7de7ihiNOFaAgXsItGdT7PmhJ8R8BHMinpLdqN9MlVNz0q57+vUSBquIaH1owI/Vpgn2QS1MGZ9YzraqmZuAj2e7luPpI0BuFIOFDKOHxU7HCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTXdyl2H4Kre66Nq7w25uZCB3X3wiwlkQPTmeoVhQJc=;
 b=B1FzvoVCGnRpHnUQESkULOBKinSFfAcFMw9hsQm7usA9qVt+5ucBDF2/5Qr1z+CqsiDzFigIySnEVzZ8z2cMg5sx5G1XfUDmtGr2+hLBDdtQj42MNmqyfew0BV2be6eDGlk8yeMU64TO2EItg3iRkN16ujxOjcqq2H9JsOfWgUYxtH87ScBRyNBAOzM973IPvHgDcu0IKmzFPu1v0LmXCEWy4Ycr3MhWzHwaqPv0NAZcqsMOWh96xVVkaJ8XTVuHLobb/5BjjmO1//9uPBA7m0Vcx4Q2C3Sx3FFbNRApx1qK3+nmHosQNGH/G/2gTRMvCeYAhyh6l+Pc9vVGfIy0CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 07/11] upower: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 10:51:46 +0000
Message-ID: <20250404105150.870898-7-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d37822-1bd2-4162-bda4-08dd73671683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RPUy65R2MgYVP6m1k9KExCo73kxZM0fHkCyyDGhvhv9AvN/13jlB0PLgbm1s?=
 =?us-ascii?Q?8nNGbHKXytJZ+pfdxO/C9ussBS7QnmRfJWRIlbiLdBNKzBAZTSBBMVWyeTKi?=
 =?us-ascii?Q?L6WWTEuovxYQZe6Vrqvmnkyp8xyWjM1qACtjOjGYoI/yl5sn8JXbD2pxjnlT?=
 =?us-ascii?Q?yBX6nxfpUBwqXjv/IYR4W3mQpOl+FcQTHnTS9QPXcvQUEfEBv0Im2RkH9KY/?=
 =?us-ascii?Q?3srb+E0r3CwKx5Yb1DHF+zbKVATKJwsJOoCk97Tf0PsmA8NKEB7771eHzLQC?=
 =?us-ascii?Q?sRCucfbLxtI/JpTVqyF9YL8m8gauLVFNWNBs6k78XCyJ2EDeF8v2OPZzXEOH?=
 =?us-ascii?Q?X1JTcbDgCalxa6+vT1RM7OH6bESNgTXhc+6csbQALFu/clOQwt0IXpPTvy8y?=
 =?us-ascii?Q?nkzIXsNILH8ayDATzrhkjMpLtwV7tA+we+qTgNCV+1WghWiDH3X0V/OlsNYe?=
 =?us-ascii?Q?ftoaDZN7x1eSQ7NdWGm9/Jz8m0vma2rq9KiXigV7Kmh2YIN4s4HRIGVk7olv?=
 =?us-ascii?Q?thdAGyUovxZq7LjPh5rt6QhG6oYflfAw0lIv+lwb7poWJe1W+KmL22T/qvyg?=
 =?us-ascii?Q?7ov+OJcWJrpTCEbh+lq8/YSjkS1w2U/TcMTh/g4niO4j+ybDAXD6wFAyWswx?=
 =?us-ascii?Q?F6MI5+A3qJpbJBVoVf+NS1OC9S0/69D4iL9sO2y/se6qAl/pkWuhfMJcC7d1?=
 =?us-ascii?Q?eUXZpOBKY7fy3s60KHsShlk563NOK5BFpEda5W96pCYbBngU/dswxEZXfC3S?=
 =?us-ascii?Q?ibEsphDpiGUnpN3+wSsp0TpcScn2a+6U4FajH7GEk1MyVzAHBBSFUWKpU9Yn?=
 =?us-ascii?Q?lO/7+N7kCpogyjjme3udKWGhHWfkgvWswqe0kBJ3BnXMVJD5xOHDuGm+5Ar5?=
 =?us-ascii?Q?aS4WPkK6hlAnFmFZ2It8Fxq5nZltk3zqw728Vavuan+8I2YlDSzCsIsjVIea?=
 =?us-ascii?Q?PWKzxTbH4jXmOZtPZdF7ViICale7j70rew1BXCvStZH4012CKO91okM6/Dhv?=
 =?us-ascii?Q?BoxAmaP+Vmc0nZhebGplA2dHT0BgP9/vXLqvjhheOzahbCzKmJakuNw/vq4z?=
 =?us-ascii?Q?rfh09u9Dchikk0ykDHATJMKJCF2I01Wcz22Y8RVPiw+n+y8d7wSyCJaTmV4H?=
 =?us-ascii?Q?0g45CxgH/vlzxcNoKIKWzB6j3vhxogm7pT77gpqkbyOU7rfO6dc6eaA/NTed?=
 =?us-ascii?Q?rQ4QpPklQZRDFMAUD9wrBYzPXE2euQhAfDUfKNTKnb8/tHimcDni1W9fbI7m?=
 =?us-ascii?Q?R6gMRUi33V4L3smvwYuvh8YfUfvtRcEtA1yIDsmdhh+Y6z5Vn+aGrb+I0QvP?=
 =?us-ascii?Q?fymYa1TAF5aoiPCkp5rc31yXsQz49kH1mNYR7aY/1q0lnmmCn4iD+mb3CbdN?=
 =?us-ascii?Q?kjmedvdfdnU23HC185oXKdr0WSbvP8Iwr3KKUpTNvaQo0lHPWTUth3PhmL67?=
 =?us-ascii?Q?hHq0z/8DYLpl8BQhKughuMbun0AvJ7z/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/O/TSGdYpxSULAOyIfc1xqw/izd0mTjsn++j95NDTwYrufisOGHyhVvnaKD+?=
 =?us-ascii?Q?tsA4zUFjQdxxzJ8lw4o25dir+ZpiYQ1eXJJB5nGWn2uk3lSpfYjGjHABPOzu?=
 =?us-ascii?Q?jLbsVS21KefcV67I+ASrTMue9sDYKMMYKiDsYDIQqNcCBgCV7DAooiVwz6mP?=
 =?us-ascii?Q?skxt3l86NUtjqXC/RDnDitX4L6KTr8988D8GHjO95EU6B6WnyPojYdZFvL5O?=
 =?us-ascii?Q?oRJmJEJGj3n2BxArmA3dnQemT76yOi1Dan6h+wBaUjihT2KHTWYmemWgX9W8?=
 =?us-ascii?Q?OymnGx/TI4q+4N4L+aKKTUYQXL9AS4/70xP8ncZp/rQpbViqF0h7B8JjaSeT?=
 =?us-ascii?Q?L7UGkbXLacBfYAv+tF8+JPAoeP6OjhVRHm15EtUucdP82xSFfQ0/RXYblfyH?=
 =?us-ascii?Q?JqoEbgEVy9J/huZbcIUvpl7DbztqS/l286QPgCIxXMxi5tTzImcV1Ofk7xv1?=
 =?us-ascii?Q?DDcyGRtyq1D44GEzdypcy0BNcdgwXXUuzEsTF9ypalw5RaZGj/K7U+GCRrEP?=
 =?us-ascii?Q?VZR4O5YXE6mixtgdCU53UfesZGaAe/JlUC0isjyXh2+/iVku4o05zm1DkTiO?=
 =?us-ascii?Q?zOX5urW0kMStc6/Kp7EHQs7aQryiv2B1RmTh81DRw82RjhQtaj25XsUsBgM7?=
 =?us-ascii?Q?4nifNsdF5YH3ZuwJknzu3OGUjBgHy/6etL4NoPCLG28MSzxDjAmIZnhjMvP+?=
 =?us-ascii?Q?XX2p43tiooIa9gOXf6Q1iXIp+jCPWgvRk984G2ahxCtHWL65fqXfJ83DrEOO?=
 =?us-ascii?Q?4Cj34PxfoZbKiYZumDMTbRYwNKD2rDMgpP2z+IeMb9jG4kxTIVhzx5y7R6at?=
 =?us-ascii?Q?Blka2WCTfVgPbpPckXIcX3kMOtyJWJQoHRGrMqkYMFW84ZEkRmNcD2aOXjjZ?=
 =?us-ascii?Q?6Kiz3Ghx4V8p0CxaRbpNOZjMl5b3RPfoJdJhGzKGxfZ0Rb37MGwyJJjriHXh?=
 =?us-ascii?Q?vKD8Sq67Ot7uiMnloblIlcmP3pWt/4daV/8AU/gElUvwMr7hdLpxpL5gDqOe?=
 =?us-ascii?Q?81hbX488ypd3D9FMcqX+KviN5J6L8zXGLUtvY9oqbphqh4AnbNHUGe4fRSMT?=
 =?us-ascii?Q?ELFofLyq4AprnF4NS2yLDHlWgETz8RGyBK4HxiHoi4oNly7y9zBZGGhp18dh?=
 =?us-ascii?Q?8PxOObmVphVKIOlKRBawnfK7B4cnQ7Z5GiiuW68cUMTn5E2nqmaW+hSeMvMy?=
 =?us-ascii?Q?3e5apiFU2ZEzHCVxoZyPTBpOkoByuT5zN3HISXYQgZdC3RUolPbjVzr0+lFY?=
 =?us-ascii?Q?3UEE3n1PVIq1oIINT0Pw+NmwNI0bXRuZQ8MxRP1aKhkVqEw9sfBGczzwcwTA?=
 =?us-ascii?Q?5Yvr2vJQmCLMgbSMUxy/kGN3G2gk+zKlYAnieG3Tlue/MGyrp3wO+ErGqItm?=
 =?us-ascii?Q?ZmCzvqsflkSdtZdP7eKZ2b7t0fEh8AQX2/2vx+zG52eIpBu1HecgqRAlJZXf?=
 =?us-ascii?Q?AyG49nj5MnQvCbwTNFjXUKt101VaAJco9U4Rx5Hsyqn8Y7xS9CTq3nX3qOPt?=
 =?us-ascii?Q?q7xWsBv/WYTshHq7gIFxzCX3/JHO55BlduFKSHQXq2qWZKkcW46nLXInpmH7?=
 =?us-ascii?Q?TcdTA6TYixxIQDjU/ezRpRMMleiKW+l/F2D4nmVnhPVTFlH748H31ITtlXwF?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d37822-1bd2-4162-bda4-08dd73671683
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:35.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+SupXIChgz9QXnYKjgRfxxjmEDck/nBGs4GtWMRI3SJdHiI3HU3tEtQy+tCNYgvSKjQtUOJzmkqwy8S3mo/oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116578

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/upower/upower_1.90.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/reci=
pes-support/upower/upower_1.90.6.bb
index 6d5fa70162..5bac85c57d 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
@@ -38,7 +38,7 @@ SYSTEMD_SERVICE:${PN} =3D "upower.service"
 # don't start on boot by default - dbus does that on demand
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"
 RRECOMMENDS:${PN} +=3D "pm-utils"
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/ \
--=20
2.39.5


