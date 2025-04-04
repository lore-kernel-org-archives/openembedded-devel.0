Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02511C369A2
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.112])
 by mx.groups.io with SMTP id smtpd.web11.8085.1743764082344333991
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=I+XAIOWl;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.72.112, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoO6LdrmRc4lT47E/RZVRfNqmrqw6M+lvvmHR0Yy/YeMXrl7YL7mlntUa9N9h4sCPmj0znpHt34awzSyVn82MBLKhsmefWO7IepF44h3a/WcpC/+CUXJIYtKWMR0YjoIgb05yneYBc36aDT3h864y+GHPmm8glc+6OgvRTWALz3S0p1JjJreR1ZIpspWL/TgKfyHTzmXfInZGsliWKa0XU+s7zycoyIEhlkn1NzAyso6HuXHXz2p92QNfMdd+R9olWejzY3tKHBkCPksCuPPizXl6Knn3D9rjyKdYzPh7GG4Srwq9wawx6AVz7sdlu2m3cbdcVOoMqShkJ39hd4y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkpKEYwc5plrc553qkzT1gN5a1BQGeXt6XpHcCrL+Mw=;
 b=IWqSQEEUTksE/ZgUyuk3/ieGI8U8UQfHqEZ7VLpgB5iKAfLV0zl7ZpKDkZUDRThXul6G1tcXz8LTOV26EudbtYqGX9A9yx0IjD4/F0vPzHlTjNCRCbgCgt4sR5oYl56KZ0AxoTN2ybyt32LsCZwdP1dkUy9Jb683So7UMv8ubuK0lX83dSbY9x+55pOOPQtQmKcT3afJO61edGe1ETq9k/dN0PWyR7ZtqIgRiaToUByP1zofmfQ3B4nMxWorEecu3WmMep2/6oxe5Wkk2b9sQzcpToaAC67tdPE3xf42iGbfN3d2hWSIXZ1/2WMR6Tig9hMrZj2abmjgVagqoKV0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkpKEYwc5plrc553qkzT1gN5a1BQGeXt6XpHcCrL+Mw=;
 b=I+XAIOWlDnJ39cXKN90aWjw1n7kgLs+fd1JInhSadBF+dUwT5wvkC1JYkhcqk4/behLjJbhA2kKuCgxkCTTmNWrIiWv6k0o8EP9a/vgdCHHVoWUyDQ3Kq4PWUqxAhTHomTlte1vjZmPtdxZnH+kq8eqB+nzeQEGDeco2h5D6BfyjuAcLefRSRW/mLOnicM5ty3nzyfc5KrjTK/2/39eopWvlBIixl2lz6N8VJVRAwwzxWEb/Pl86xb/0IEwmz8oEYA54M4s0ToBKdBqrAkj6UP8gv2FLeTNVvNWuTukeF3Zdq33Frt9njaHNfsGNH3rX8lf8BuIlJ4oL55iSZ0DNgw==
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
Subject: [PATCH v3 06/11] libgpiod: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 10:51:45 +0000
Message-ID: <20250404105150.870898-6-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: c448b04f-e05e-40a2-1e7d-08dd73671648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rbuj4ccvG5lh+hTJSIosutIYN+7j/bF1lwG1KBKa9IPSP331NpJZu+TifOCV?=
 =?us-ascii?Q?tFBynpw5c6subYEQNtuwxoCKCoij68DXBQNqlx9y1ZVRTApFcIACt/zmqn1G?=
 =?us-ascii?Q?O8ltPw59GetrIsaAZrRrOiMUQUQ+fspFB2JkyrJlemXly7v8obYgfE0FLb2J?=
 =?us-ascii?Q?RwiUi/ZiXMjGr8RUVVi50ZyUcWWVOYi6UbmWLYCgf5uj8qbcuXgeb/oAzUqR?=
 =?us-ascii?Q?0pmlEm/pHexMCvtgtHE4nkNZw8+wWMv4EdCgYqdI4cX1U+iewkQBqEN09THn?=
 =?us-ascii?Q?4qWMKZMgb3Olhmylgipmaw7VanpLz3VbEKH9T4SnbHeIZLWJb52soqhVmi4p?=
 =?us-ascii?Q?sxsvTplsELHaGoQg92s/9nCxbrS7QkgLA4btz7fjOI/gIst0NLB8PjrEpZM3?=
 =?us-ascii?Q?Qvs2tJ3sSqaZnMedQkyTCDRC4mglfyR1QQ65epNnRRn1Gw6vOzBGdx+XeDex?=
 =?us-ascii?Q?Kj6qSr+ci10XYvcPVaekacLrF0mgOnsBLi+Gz+dJELSEIPY5iUCM2QwFtR4C?=
 =?us-ascii?Q?fQ+TKMOL5DR94CBV2NlESGYDPZCw9RF9Ot2SAC1fnz9Lowr5k7cWy+idoFXg?=
 =?us-ascii?Q?3xect31UBTHEJY4bUKrpUj5GDywhDByIknwxxtPQ9ersbFIIEAckRfYKk5OP?=
 =?us-ascii?Q?U5ESRb2F+0jS29/Y1aTrZ7UarF4wel1DpJ57rw/loj9vHxcDtfGXvVC9VhoA?=
 =?us-ascii?Q?4vbxzV6B8nEvr9K94EK40c4WpdSd4aSEbKK5HOATYwR5KTbtX5sXqY21UprQ?=
 =?us-ascii?Q?KlLYmw+Br5oxM4Uaaa6FpSQcguIZ0EL9XvIG3sn/EiNZqfMDgMQ4QLLHzoTN?=
 =?us-ascii?Q?2sbltHa0gD2RxTLlBBL/dSkdafxMoKU9uE+NCkX6CXSuguiwC/P8lHpXa5fk?=
 =?us-ascii?Q?QRZBl2b/eRxiphEjdZKbxxgHMooLNQN+okpoDfVeG8HnQLf06DDvtxx+0uzL?=
 =?us-ascii?Q?daYlbjL0Nc0WNiCsgMFhrjomj1F1cVpzudHofIelmPata95PnQz46ENKucCD?=
 =?us-ascii?Q?0RYD2d/HWfUZwKMl+hTexuMbsda3hNhq0dyTCygIrq8y6xEv6iiwg5Cg49m1?=
 =?us-ascii?Q?r1c491/RVwNOgNfBzAOAtVsYFZrLMRWxn5tCgaO3ZMA0XNtNCRLjiRjCvM9r?=
 =?us-ascii?Q?whBfVZb7mLQQYrrnvkJMTVTQCGJSq03qzkAjbos4iR40Be8UVPn+BN6WkZM/?=
 =?us-ascii?Q?3YaYXhO4v3YbmFbwAX7o5gvsQy7P2IZ4QhGGXYic9LW2PXE7LLN3ZJr4bkdb?=
 =?us-ascii?Q?d50G4nMRw6pclEvEivAFrLLl7l5jlsYFgMj3X4htruKk1gnuBogvTSS/GCOs?=
 =?us-ascii?Q?8DVrXC2Xpkrxmk4IUtZTF0Jm2W4YDI29f5fre3hF/ZJaSwlPP0FvhdxDZV0w?=
 =?us-ascii?Q?lnX9FgjY6Jti/5Njn6RJ++IUDFnl0DSIPIjffCNTnvtmk7nS8t29VfdWZ6s/?=
 =?us-ascii?Q?UZHN19Mp5RY/hAYhH2PiZf5WyxTEG9/r?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mJJOOBU9njXfU3/fDgUmpvK+uuKvNwAs9F7tKVyANKUCYK+xhrn56oT8Q2/E?=
 =?us-ascii?Q?uRJqkJ6n7qTqGsTA9Sg1nEVSHkrVB1zueGo08gLyd9YFkfaCE+xct0HZZzPM?=
 =?us-ascii?Q?tXlDKlFvd++Y41Y9FUosoCAN/vJd8RtKItaXvT7RCdtFfLd/p4fC0qygUcxw?=
 =?us-ascii?Q?nKqix+PpfE9dYqmCS55PNetuHdv0v0hbKyjcBHD3cA5/kmFFEUaJ/xEj3BnW?=
 =?us-ascii?Q?A7c3uEeUFqgXwob3fyY4FVvhx7mAWClnDjBKCx1hezGK1NYjbp7+46OxJPN8?=
 =?us-ascii?Q?KSDgIFPlwosPD1cnUonLbwbVnI2btl4NT+VGvVTUQ/C/P5Q9tg84/35bSS1h?=
 =?us-ascii?Q?/aRcP3dhilTi743AzgpmnTlbg74ooMFeXeHerikkO3XVdD3a/M9HY01rUEPs?=
 =?us-ascii?Q?66byIMK8RIPl0UtofWlj2IKB69+CntI06xyMoRLmrUszVY6xfYHiGXtbdTRz?=
 =?us-ascii?Q?xFbIZV91YAu63qlGUkjYpHoT/npwmzzPhbNQqvn9i7XfzB5/W47bXmQdgyQy?=
 =?us-ascii?Q?OgAyzuoIc9O9Xn29A8Kpv5/lKoAxJ1XEn9c89ojAx7UruTYzmhK/qN1mLDyS?=
 =?us-ascii?Q?uL4TehcRZztqSz8Iu9XxXwb1GG1cCtAz4XYEetsMmegzEiioIvaMC8zKsqVu?=
 =?us-ascii?Q?stQz1Ik64jC6Ycrq4hY7aoxQeXlHRUpLI0JiidDD7LSTKoTJdEh3mgVv9vIB?=
 =?us-ascii?Q?6pl25aWFbCNIJSezMUses0WEeVTzHoMm40WyJhBjN3X+xfq+osXROy9voHVE?=
 =?us-ascii?Q?FJxHyFIk4bnPiCXo7RuXnsWimLaBS74AZGtEeCabzrDYTxEA+gkYpKtdaKw9?=
 =?us-ascii?Q?RQZTZyFp8QajepUnea76tfIZ3NlCd3Tclk2E3b/P47ityvN37BqdGOrgdNyN?=
 =?us-ascii?Q?UlbMh5kWQdue7XX9o2ZVzh8SCPU9F6i1yTG4VaXrRVRCZTO/00oI45EPhqcL?=
 =?us-ascii?Q?SsIuE1zSkT5iUZpU+vIYTuT5k82f6ykRxq1KAc2GaqRECQsI78N0GD0/1FoN?=
 =?us-ascii?Q?5Tn9N96ozSIgrr5GTJB5+XHSFMVqicDR/WteHAqQAAmt/cFTjfEBQ5GhaAMG?=
 =?us-ascii?Q?c/A5gbzttiIrKCyP8Tzpw8Cw5OcKJph/EPjpulDhtWCebEFzVuwzigf7wIoN?=
 =?us-ascii?Q?+VO2srjQN7Vtz86T6OVdVhfCrHG2+6PcMWfQtNDBPPSStYXNM3XtYJls6EJT?=
 =?us-ascii?Q?h5gboUU/cr+YLUJUUdtPEZBTcUuLJFhmHd2vMnEMXuL4Wh1/fhRRCdsMKcim?=
 =?us-ascii?Q?PiPRTT0xh6ZnnzV0HOmWEapAkB1E45r3gTTLE9dZ5kYN+oZpbi5Nam9OZW0D?=
 =?us-ascii?Q?t7dvogtPU1CobaiXFKaY1pkgAcXCP6KWy2itx3GYZzdYdSw5ctQ2kdygcmjo?=
 =?us-ascii?Q?Q8qrFDhXdlSZyuljp6v5Z4ukznftbIwo9w3Lkx0W0DZUPGus+0QeaeR0/1qo?=
 =?us-ascii?Q?Q4wbsTkNgTf62HPq/S1xGxgVOlyyN0E8tztPigf07Axrl5wUDCer8GWRZvWM?=
 =?us-ascii?Q?8YAAtFHCnpHw1Qvxm3hJw+7jJorlQiITEiB2yWo0Rxd8HrK8chRcOMIiSdm1?=
 =?us-ascii?Q?gtLZ6cm440ggWlBjcUJCVbU+71bhtbkmEpflkO6XH/J2XQJEOz+iduGvnUCK?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c448b04f-e05e-40a2-1e7d-08dd73671648
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:35.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zu/HjjCO6tvCT8d58ZoZPIZL6nz7ZvsZG00liKwVaQxU1AdxsOoTEILqig/u2RDdZPGuXoqRIa/fcCglPZHdfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116577

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declarations to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.2.1.bb
index b72d960c10..93c3e3b92d 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
@@ -20,11 +20,11 @@ PACKAGECONFIG[tests] =3D " \
     --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-=
glib --enable-gpioset-interactive --enable-dbus, \
     --disable-tests, \
     kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, \
-    bash dbus glib-2.0-utils libgpiod-manager-cfg shunit2 \
+    bash ${VIRTUAL-RUNTIME_dbus} glib-2.0-utils libgpiod-manager-cfg shuni=
t2 \
 "
 PACKAGECONFIG[gpioset-interactive] =3D "--enable-gpioset-interactive,--dis=
able-gpioset-interactive,libedit"
 PACKAGECONFIG[glib] =3D "--enable-bindings-glib,--disable-bindings-glib,gl=
ib-2.0 glib-2.0-native"
-PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-na=
tive libgudev,dbus"
+PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-na=
tive libgudev,${VIRTUAL-RUNTIME_dbus}"
=20
 PACKAGES =3D+ "${PN}-gpiosim ${PN}-glib ${PN}-manager ${PN}-manager-cfg ${=
PN}-cli"
 FILES:${PN}-tools +=3D "${bindir}/gpionotify"
@@ -43,7 +43,7 @@ FILES:${PN}-manager-cfg +=3D " \
 "
 FILES:${PN}-cli +=3D "${bindir}/gpiocli"
=20
-RDEPENDS:${PN}-manager +=3D "dbus ${PN}-manager-cfg"
+RDEPENDS:${PN}-manager +=3D "${VIRTUAL-RUNTIME_dbus} ${PN}-manager-cfg"
 RDEPENDS:${PN}-cli +=3D "${PN}-manager"
=20
 SYSTEMD_PACKAGES =3D "${PN}-manager"
--=20
2.39.5


