Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3C8CEDD84
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:10 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.78])
 by mx.groups.io with SMTP id smtpd.web10.10852.1728460218705848714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 00:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=rVUQhcbb;
 spf=pass (domain: spinetix.com, ip: 40.107.167.78, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tp82BpFG/jX1DM8nhPj9WwxttIxBM6xDo9N8X5y06J2du7B+W9wAlUcWQ3Jwopij6+HvMX7FJTNNkwgL2c599xhk9fLhdL4Ea4tsWGx2qZEkHv0Mg60vUwK16yj4LHrFvDwjle9a30tyHavB/nHXGiDT2KfINETVZwDGdzmvJJfDw9ahgxatnwyQJkcDF/wnifuMXOjHxO4/4TtvMhSvum0TS/WXig+zB0JGaFZDu+L2sstFWCp8dab0b5ReJFaJ03svOG8kyyFMErNpqn9oU9KnowuqpcbtnVwzb51cbct6SKSg9OPSyJ3av+ZEWnRPTB3DFOIRjorwxCY50VSiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm9gDmpL6CefCn3HIo0z/o2HNakfprdpGpehiTftzU0=;
 b=eAGumxwseEnXpjhJ3loPtqZFZ6vnXHxQMW41VTAFKq0Vf6H0DEFaOl+8kSG3bJNEbA5Z4idtytIDNEj8WJmwJeri1/amoaHpTraq7VvsDt8dWNDZ/+tVEnSohSMKw/7NWOJjTIBH2VULmJg72NSudd0xIPvuZLqB1+qdY5bvVoxYVTC5k7gvTPqSWBv3TjQxwOXeZlqYqM+FdJIW0mgU/aKsx1X4Jw3fzvqIRxj9eywOTl3/H1UPEnQqk1GwAMsXW1g3bpvdMNbla3Pd3IV+gcAlBZgl4EfYhlsgtD9Xl5ZlpsNCaaYlBjRyQ5ObjwqSyRJPau/Xz3xmITGLaX1f5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm9gDmpL6CefCn3HIo0z/o2HNakfprdpGpehiTftzU0=;
 b=rVUQhcbbO/+++j4mq1RqturSf3/pTy53cFIMhEZ1V7F9ZKIdf8TLFxvvmgM/zy1blquEu2Qacg5u0f7NA+tlOp4mhEyYyMK2OmfGv53KD2jWsR7RH4anbBNMOWSG8QA0CMRtEZmvHC+o2ERTU13uxRwxAL7ZcIY/pdAZNygP+UY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZR3P278MB1372.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 07:50:14 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 07:50:14 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Valeria Petrov <valeria.petrov@spinetix.com>
Subject: [meta-oe][master][PATCH] apache2: do not depend on zlib header and libs from host
Date: Wed,  9 Oct 2024 09:49:55 +0200
Message-ID: <20241009074955.637495-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR0P278CA0197.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::8) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZR3P278MB1372:EE_
X-MS-Office365-Filtering-Correlation-Id: 826d9185-6106-41ab-816d-08dce83702b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K5ldrIKLj/vdpbLSAI/61g39EMuF5LCsm3DcdwEXsmQkf/BLToXgMRKG2k6V?=
 =?us-ascii?Q?YwRKlEoOLUuBu+MAjWciROLabjEFjUbd+g9DH5hJ1U/xNelSBayXdIjeaj28?=
 =?us-ascii?Q?yTbO/ZzICSBMg3YH9HUHmBED97tqKLM0nXQSEJb2NYAhcNl4gu6FAoITHm0D?=
 =?us-ascii?Q?C4YsE+9Xdu3eoTNBJPQwwrmmyazJtEscA0mJbuCQCHQaJ/PIeZ9Djg2z8MHj?=
 =?us-ascii?Q?fJ4KbN5bmjbnKaw/ZcLIC1smjm7BWMi0S+6NfHMgeTTnOZtwueF3N13xHPgC?=
 =?us-ascii?Q?giHG6bUZg6v3hwE8Ois/S9Z3rRGNWloWkUNAtMQrguLg28vSk2vdVM1SZisk?=
 =?us-ascii?Q?QPL9LRUXVbQiiy9PuxbJ9z2NZjYyPhiubg5XgvaIus3ccX8n4WpZoyPEqRou?=
 =?us-ascii?Q?9ABeNAoa+v1DyemHjcdbLfhqganwaStA/ov/fEvbkmBaHQs+nqpnVcJiA4BJ?=
 =?us-ascii?Q?KdewcmgUH6ReyMcl/Wtwr2G9vulxPrHZ8OLdBNB6SPuCfEbntSHRec/9SpAp?=
 =?us-ascii?Q?lBEdXFvTxTDiUM3yccsE+nGxydyR/7IsXkdXGo28z6zoEKmBBh5JmRpYdXyl?=
 =?us-ascii?Q?X32DAVz05XZci9/qtoRQTZ73ECAsTCQ0uDS4jQKDsJN3lrOzhTPJP4GPrXqM?=
 =?us-ascii?Q?/9xHeQEtP7XvncELmiunY3liZFb1GYERJFsxOIT+L2wVGOaGpdzh2ChYX2yl?=
 =?us-ascii?Q?qmfGdNm73ufCJ+WhW+hWADtGuB1ei1thq1Vemi/xMg6FB0knAf7NryFJVVO9?=
 =?us-ascii?Q?fS0X4T/YgokkzKmi0W2sX1MH+o3afshIb5RIZXCuRiFl8QqLGyrlXSoH8Ich?=
 =?us-ascii?Q?6vPK9nJvB8x2OyXMQ1hKQGKPOpeJVYdd2O/2q2HLvuL2pRlnfepBI8GkxghV?=
 =?us-ascii?Q?ZQDPYItpbEQT+ZeG0VsAObiGyxddbrUaKKlh3Uf7XFr2sdrnyZoeG5CwEiql?=
 =?us-ascii?Q?N7+nVFSSzCg+JnW6e7vv6Rtb4X7jBeYNaUjnXZeYd4fz4qsPH0CZ0AGeIcX7?=
 =?us-ascii?Q?AUAV+J62kN46KPP5TbvYuFvih4N0DYDvHWIeC082fBaqv3KNtvQ/9/O5m3xf?=
 =?us-ascii?Q?pFLz8hT2qe9fRQGVlNTSiYuPj4iv53FUWfbPfS1qthOZ1qCcj1ESL40MvVIP?=
 =?us-ascii?Q?SeuXdDAZY2VQ33jWpdC54lBFY5zxKCaSG+x11r5+wDQPrhgUJMELFRs2MJlw?=
 =?us-ascii?Q?aIeumPcp0meRdrcAZRHKHeQd6jij4w6Doxjvw8mp4KK+S53MPOIsddKN96aW?=
 =?us-ascii?Q?SujJPj+cFM+E2qg2gz3kXFTo5CTy+lS8ViXVTgv1W6C0FDThhBKBKMTH3cmY?=
 =?us-ascii?Q?XmTUDZTDEbzW1FSQJD0QxdhyIu2NWO2HoW+yubk62u7LIg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W4WthGIpYg2be5g/c418f0wdMWLIoC5X2f0c3ag/krx8XFAh59UnpXGBuObA?=
 =?us-ascii?Q?kuOMcA+9k9ZsVoo4FwrZG07fOXAulOHgJ82ZrVehQwaWRZ+XYa0Ebi/n8NQW?=
 =?us-ascii?Q?bbsPlHyBBV2ervfdWmr6x83Lu7f8OFeok3DJggaP3HTl8/RMiG9MaW8cvB1F?=
 =?us-ascii?Q?MJq8w1elzGcUFlGdFUefu7yx9yPRKvZY6B7hbX/EZPy935swsSLSVpDFXdQs?=
 =?us-ascii?Q?0bQMhADHZEf3zWgpbigEX+tjw2+xq8+/kAebox5kbbb/NolO69d5PRyAF8F4?=
 =?us-ascii?Q?YLIma8qmVWq15KyBVZIcXYraqBtZDXj+ipoPn5Jer1lz2YhOnZyU7pI/K15C?=
 =?us-ascii?Q?bwLsjAkUl0Ufn2zSqM2BeTJf0MFLfqxGAJ2o5S1j9MInpXZ3KLDe8k2H2L0E?=
 =?us-ascii?Q?93zBGBO/cYcbHulfWfIZTFR7k6sWf/mBOCYKjBalCnwd39PRK/7QQKBCWJgo?=
 =?us-ascii?Q?YRRw5VbLwnKWKl1QLBc3tc+Rb7q3bClUtLyO1vd31ryUEHDvnmNeG7ZSiZBp?=
 =?us-ascii?Q?oaluXz8q5moLqppdjmQ91jEdFCRsDyJds/shU7FniJfU+AwqoxNRJ+1NsLET?=
 =?us-ascii?Q?O6XyWmlnYBlRp+FIbmy8LV+VwcJa/UEhaO5PNaCG2KK9Sj8/rpi0AKTzj+ga?=
 =?us-ascii?Q?KQbM1mHjETM11GDX6l7yyq42uN/LMQ6xY2hQ5gnONT8fXUVLQphWN7TcCWzv?=
 =?us-ascii?Q?AI14UiEW6XMff8mOqRO/adbNfNIMELA/iwnfGfhLAga19BIUkqPHP0oPTNIj?=
 =?us-ascii?Q?WBQ1oR0kkB/HUNDHuUsFlOq7zSizPLukvYcww1wEFeAoIdsEGacK9BJrnCnt?=
 =?us-ascii?Q?EJ8ohi0zNdN1faqf1pwiTl+zeYcOkLfy0/4WUketEY6pbcDvlXoGwO6rlItd?=
 =?us-ascii?Q?HAjTlepGKx3XHKamFv1jO6pCHaI8yFWh/lo3M2buW8K2uG07Lw1jCPFj0VSr?=
 =?us-ascii?Q?bx2Ur3j0gjPb0U3S7Ue7yDb3FRRaIYxaLkUi4sCjShrbFwBMbOvIdEvzD+ZB?=
 =?us-ascii?Q?t/3KknNHIaE8KNC+fjWZ74B3AwqHsHpR9mYeDembbbIpdEXgHxq+JBRzX97e?=
 =?us-ascii?Q?FPs/FOZlydzV3wqQ+FyZ2zXC/qBJgELQLDR9YWvpGyXYV8sz1PrHLvTHofsK?=
 =?us-ascii?Q?es+zZlyY8XtAk2POY9vhXqlWqHZr02bf6sncxQFUK3jhB9ZP2U8bJ2zLvH0p?=
 =?us-ascii?Q?DHzwyyublg0qAAcGgv1L8I4vrnoWbDySKxQmqXncjmM2DkX7IAZ/DESGKAqH?=
 =?us-ascii?Q?rBrb6x9OlmHTGb1a+1EWVowpgQK42jD+VFU0CAT1GsPI2MKW5QTcGUq8D9lk?=
 =?us-ascii?Q?bz/iYVGKRQsgoJ5pcHHEDtC9vyofT79ud1Rfs7Ag8xSHueCeZ9kupCBDSAeb?=
 =?us-ascii?Q?UsdNdgGeUvlgN6YizvsRpDuqrleykNa1DEfrvgzTEeyiCFw2F9qVPPSU+Uwj?=
 =?us-ascii?Q?+JBGnYXo4RT+pUfEwwxX6B+qZ3u2d/sibQ21jag2vv6PXUTw5yi/TS7fXCPE?=
 =?us-ascii?Q?7qG4zy+GFmHldcci3f7gZnS6b3MxgdrSzzQqjpyb4yVG6yTYKoDMY3QUlKfy?=
 =?us-ascii?Q?7sKdg3Nh4k9yFWh96JIOG7SuA5Z+TWGsRTUCAfnACGL/6CovhTEUFTM8u+Ix?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826d9185-6106-41ab-816d-08dce83702b2
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 07:50:14.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfKKV9VLs/UMM4EjdCjhuYdWzlCsUjGb5iIuUGanuxIzbZhvM//PtNTdlBM9j6m/Rb6G1yMRtiUEsb6G6LPcvK31UGLnp8rodha4Omg3g7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1372
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112726

This commit modifies the PACKAGECONFIG entry for zlib to ensure that the
mod_deflate module is enabled with the appropriate zlib configuration.
By adding the --with-zlib=3D${STAGING_LIBDIR}/../ option, we direct the
configure script to use the zlib library from the staging directory
instead of relying on the host system's zlib installation.

Without that configure will search the host for zlib headers and lib.

This change resolves build failures related to zlib dependency when
mod_deflate is enabled and ensures a consistent build environment across
different host configurations.

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 364b4c674..7d6ea27e7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -50,7 +50,7 @@ SSTATE_SCAN_FILES +=3D "apxs config_vars.mk config.nice"
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinux,=
libselinux"
 PACKAGECONFIG[openldap] =3D "--enable-ldap --enable-authnz-ldap,--disable-=
ldap --disable-authnz-ldap,openldap"
-PACKAGECONFIG[zlib] =3D "--enable-deflate,,zlib,zlib"
+PACKAGECONFIG[zlib] =3D "--enable-deflate --with-zlib=3D${STAGING_LIBDIR}/=
../,,zlib,zlib"
=20
 CFLAGS:append =3D " -DPATH_MAX=3D4096"
=20
--=20
2.25.1


