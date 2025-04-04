Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BAC369A3
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.112])
 by mx.groups.io with SMTP id smtpd.web11.8085.1743764082344333991
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=zzgLt+3Y;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.72.112, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRsoSAw3cWcp/yCQXpgbycyWtOF8IzavYpd4b63TOZKzCikwDkEvtqtFLeCLREOTdj7jhREp6hUwrS7JXNEsINEKNwWsLZBuRIHk+neSeQB6k9Lapoc+m1WnCQ541jbGv8AYNA/jTF/fG5G8t2B2yaEicrjaGXL9uJtTQ2eB/OD2GVJlfglaL0sSPrStoPXaKYCqNa1BapU4XDxyWxeZLCdaw4ofDPnBxvQZlLAPUj/QOsnYza+A4BWBCu9X9BIIVj/1aF4cnQeylkRqbSELqQNAx3tj3LgnOhSR59V1QwcKXBC2VKTS9irIfW80ZJxiOp+UvC9CXFul8PX8NRFMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlbcn1mmY+8QUTFjqpdCMI3tDRXvrJHThvVuJJWR4e4=;
 b=Ns38pCEAk05IkSdufwXaLgSoCTOYtK1xgfpl9mxurUuie4iGYEFgMPaYYMcrXAisSRzTLBmplZ7owXmdXsUzqPV0qpXWyreVtW4Ll1hvF15FQI8VKhGBz34+rS1g3adYMaaLJGUNQly9Fs2kZIEt181jG94XjM/SNr7T7em4w+ka1c9nNXe6xTm1WfdeGuE+XIqIafC2p89EubOJ3oCMJi3GclvwMe0lbDqPGD/ENGcNxFI4UQqGJKTdr8QFRXIvTICrpWdStZVGVf8zw0tBf7VsaidbCGkCy4gp0JaGggP/vkRwOWmnRLtw56i6oYDMKihhV6mHOq3vI8RLU3YOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlbcn1mmY+8QUTFjqpdCMI3tDRXvrJHThvVuJJWR4e4=;
 b=zzgLt+3YbJ6SxRp5cVLRVjMgOXx8KhuXmDwbO6KtgWkB0G2Og0FrtMUcUl3UtluB3KajiWpIxdwnW8Dh0tmplZM0j2YDUZfz0Sx97p5308VFKSgWMFOqaujhJBZYsz0LuFf9SPiTsH4Ju9xvY2aZgq9Ql3C19Xem0Lm+dpfUwlZWjWPCKQC9RwVC2SuNVnLnikU8ee/17v8igin5G5Jp5Ka2DQhtJbV5t1mM27qcaoPgL8MBoxB44AiXKjA3SmhYprLSPqHr4V9NsrvcSJPItnH8IbSdZZ8hgODs04lc8011EGtJ++SBl9W9qlLx8Xjq8D8b5aADyvrXEQE/VsRnEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:34 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:34 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 04/11] iwd: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 10:51:43 +0000
Message-ID: <20250404105150.870898-4-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5e5c8028-eddb-486c-eddd-08dd736715d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ULdZuN8yHuRf0nOJxs86VpK6Jo8liql+4ySSOaKklOWTI7HGV3oM4sQL1oKf?=
 =?us-ascii?Q?JGCxGkRZBMGUjwVqwFUvG5WvbMx/EDNd48s7QmEMzX5/pVbJ4FR1kMJL8EGu?=
 =?us-ascii?Q?Gvd5wByAlWgfwmKkDCZ2hZ5kprpyknYa8cdcvHP3aAmdxx102SCEjz7CRgSj?=
 =?us-ascii?Q?P1fa/4xxnoOYQp3I7/k6WmIBUEM+0oO2BgBkfpVhY4ovqpvTH6EUG2pb6DEb?=
 =?us-ascii?Q?Y5bR/9APiP/7caCu/htnpK0gCrltvvU+TXRySIo0QhCFRrnHXHXYaLUumBv3?=
 =?us-ascii?Q?xeMdM4QeFRL33UZUWbgadigt/hpsPNflJQeHn07xb7IXDhlo9KyjsJ4gMtqr?=
 =?us-ascii?Q?BNlZkIMK1kA4OqVDvQ7QdqyDmo97c8VooFfN03kf6Z+ihLzmp5Zopp4/Kmco?=
 =?us-ascii?Q?bo7h+okX6dgj7Ew6i8LKkL5hzmvvo0KLuxox3wElcSZ7em2yCz29Rh6OxIrq?=
 =?us-ascii?Q?pnWEt4u4Jg3UHCEXXsxfR+nuQRvkB0gExwqxPsj0wzOrWcIVI2MVfvNOOXAY?=
 =?us-ascii?Q?vFg4Syta+jyKgIO42dG8hiZmj6Sxnn8bX7MVl3thM9Mc7ljZpWZBsXxWMfbF?=
 =?us-ascii?Q?BjmAleHgxmOnFA3WeT3Dm+CBHWIFTtQLDIrhsTqp+d/Kpa2WYy+5/m5hs4Pa?=
 =?us-ascii?Q?fgsqucP+wWV+j/1Tt9Ary74FkJEEwk1EUdlmIgNu3cPqbB+DqdRtUZVvaNAb?=
 =?us-ascii?Q?XzaAiiB5fo4DCY9K7BRQwkzBMvRbLJvM4bkTWl+q6dZAO85Xm907gNAnmygo?=
 =?us-ascii?Q?NGuJ7b77wUSaoCXGr9FNApkW/Djfv7+aZpP9iA6WkI3vW8gGHV6Qk2lt4B59?=
 =?us-ascii?Q?ogifk3Br2/NxSWZMevAI4YB36EtIfbwSQvSa+TqUTkwk0q5+8HerL13CkKFK?=
 =?us-ascii?Q?20KqkjlN2FW2UPSdj0mXbx1j4he6RmGw1zZApztZ91YlqGnmKCCbE4h3vB6q?=
 =?us-ascii?Q?AF52KrJ0WHTadP9qrz3ofqxtEkYard6wYUsTsuRSc+S16SRHQWxzBtN4LpK+?=
 =?us-ascii?Q?jL/beyJx0f9AesrqKVWBRKUq1Bn50dN7/KHKOlX0AD+9ydk99j9KUNDG9+Cw?=
 =?us-ascii?Q?Yf7OgvXP12q8AJiEhJzrvDYubIhkCUWxmnVzaX0fhuaw9ELU+X/3hqAN1hWq?=
 =?us-ascii?Q?gCVw3UD7Y0VJllZ7ob0SFBA8rMJVETuCcTxqk2jrbF3oJ08I9XOzJ/eTzE0I?=
 =?us-ascii?Q?jdHB5tft9IVBGtVVLEupKeYv+B8tXkjAnksSKuFSffbyai1Wcttz4xKxQt4i?=
 =?us-ascii?Q?97RVEevvbWUi1jdD0rghKI0BK01rveVZ9X0CFetEtUFwMTs5QEz7pDhSr1Xh?=
 =?us-ascii?Q?Pb+Mn4t0OqW6kiL/saCNSL8ID2DVdywwXZQQkG4eK7LIQWv4OJ6Nf28RjRWf?=
 =?us-ascii?Q?fRaleAOavTejJbhetr+hhaKX8x8z3BZuHNDWjmN9Pn87Htnuh4BBuWuH19Mn?=
 =?us-ascii?Q?xO5+KmgpeXVOyAXEKYuxGmB3Dmz41ena?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3YhnPbdJS3gbK3mU9/VTPTRy11m4OmPSXTQhrlJSfASmM2fZ7j1pP9DKEHUV?=
 =?us-ascii?Q?/pgrT6xpwSHzRU68M0wpvVLyqVbF3AKDOGFu1pPhTNlUop/yDWR0gKQ56fU2?=
 =?us-ascii?Q?EzfWm+REkY7dlL766YES2KD4FVXDhJHD4f67MN4FrsBdycfwtZLLe3A5YU/o?=
 =?us-ascii?Q?wEZ+rdzqxoDPdOh7sYuRlF/xyl18uNlH/MSkZXv+WMSFFUnYlGjJYDvx54EA?=
 =?us-ascii?Q?4zvzZQCIEokJWa0uCe7kFYw2ViIwv5wuvxWDvb68ZQIUGuu5ewnyUQxF5Sej?=
 =?us-ascii?Q?Lvqh4QYX1rcgz2J1UIDYyqePbL4Sxg+VFGc9hB2oTCd7tLM0fWMRC+S6eyyH?=
 =?us-ascii?Q?DyTzhxQcbicl6LFO7cMIgAmBbzzXTKK2MGPMjzm+9UepNeM1uXWjjWCU/UcC?=
 =?us-ascii?Q?0JLCDVVTDuc5gJ6xuO+teH3y06qsa9K6lbCsmZUsRzmqvHZ6XYD7FpUSZs02?=
 =?us-ascii?Q?3+fIceyWdhDE7nNcjN8jBpcGDYgrRxhmWXdY6WnfGkGPYI5OC0Aim0krIG+O?=
 =?us-ascii?Q?Hh9zDkt1W9Gk9gq8l8WyuK3OZ3m9fyHzYdIzRwJ4r8SPTERYqEsxa59N1EnC?=
 =?us-ascii?Q?aTahzUOUtJtEMvUzgJDu8GeXJS0uYdgy8/U6ZA/V91TfCvQdRzA6gFtcht3T?=
 =?us-ascii?Q?rlqA9vJ6x/T+VsVQof55WgVRvzx4n1VdBid4aTMHgavVoJv74UOUCOOYjwCQ?=
 =?us-ascii?Q?3i0ygT86x9z6RHc+70yvJbS6hkEzMFiJt+HLh7m/S3hP9v64lq9SmWS+ZD9A?=
 =?us-ascii?Q?N2XJ6b1VwneLyufh8u6H6xZYLbnmSzK7+ubtBvdEjWA466hjx8hfAbyM8hUo?=
 =?us-ascii?Q?uAf5/gOC7c14i0yWPo7feejOPMB+c+3U+CwCAYi+1JS6PjFUt1WjoIzJiGAM?=
 =?us-ascii?Q?vaHIhN4/2I15JQI0BeVidWvDmTp0RcZEBFCfwERsQEGn/LsnV4sQzhuDhpBN?=
 =?us-ascii?Q?zMXLeS53rDKoT071YaE8PmgtIZ8YUtp678QEVrM6vX2hkiMMXHJvyVbVzvaZ?=
 =?us-ascii?Q?gQAZD0k/VeW2cQ3ixiaugdbhhmd+kBMAHzLM+83wBuhQVaOU6CAww1ERQ2Ao?=
 =?us-ascii?Q?Ft0NtFVnn6slk5co/RGCPGlAGvbJf/STMIUg0xF9gE9vgGpmAcoF/wPzQ89D?=
 =?us-ascii?Q?hXv8RW7Jd3AHq2XXS3tYqolOk5yvEOrcEFkIpfVbwGperK64pqZZXdyCJUh6?=
 =?us-ascii?Q?uEaoqMwpgr0LMesE47re4gpH4vmAsYO8MX7QaZUjl5W+Ers9xxGht4SBga0c?=
 =?us-ascii?Q?0D7rO/0/TsCqyN4+sjGrm/mWAQooVmLy2aOW+Rjtn/C2x3vKZRI+55eT7fuB?=
 =?us-ascii?Q?gLhB4dSUtisOGW2pST/hpwct8e+sg4msjOdiAAeIOKUw0baD1MzL94fjkiHD?=
 =?us-ascii?Q?XX5xfTbJrHEoClesaQtk2pYpAu4evAGi9V8SqrXr0SvCvKOF68UkgQ/Y7NTF?=
 =?us-ascii?Q?PUv6bNTbNbyewNOb9kOWfwHidsl5ScydqhAaeRNya6fjuNYx5Quxhbx37sm/?=
 =?us-ascii?Q?3NXpM78qDg16+47V3X5kz+JGdQX6Wl3jQGWuIMrtKHWBaJ34OoVlma+0ttpe?=
 =?us-ascii?Q?PLgLem5mNcYRBfHbdFIXubt/Ja6hOvzIRQs8hWpZObY/Snzly8XUgVfEFnA1?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5c8028-eddb-486c-eddd-08dd736715d4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:34.2957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQ0ylRW3r2fV7rjhCoiE+17oNCbpYdV9DlrErA0I/jR8WE+8cY4Fb70urdsL9Tdhi4anw8Q399xNYgTMnFE9Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116583

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb b/meta-oe/recipes-=
connectivity/iwd/iwd_3.3.bb
index 9d5b3658ae..52502ebec3 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
@@ -53,7 +53,7 @@ FILES:${PN} +=3D " \
     ${systemd_unitdir}/network \
 "
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 RRECOMMENDS:${PN} =3D "\
     kernel-module-pkcs7-message \
--=20
2.39.5


