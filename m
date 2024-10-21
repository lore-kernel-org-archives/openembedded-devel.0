Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FD7D15DAB
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:16:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.104])
 by mx.groups.io with SMTP id smtpd.web11.48596.1729523798564282022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 08:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=2aiLR4+H;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.104, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qkb4ze8sVZAKO2dvj8jQ9WTXuvr6lvD9xtoRmUKWChufvjJCibAkrZBt3WW9GACZx08CT5a+s1oFuexHrEzHco2MY0la+pE5i/ouE7jDT/moRcBgpRC+WsPwJlyQctgKB2dsKGhrAZ8Awoft8vnbSHoihlFLysuMT/EIxcUOUdc6nWQYWFHMA07TngSo7aL+TW3+KPMawOXiRubNGaIGfz/tVSLrYnvOT0LpZZi7uJ3AIEmcqLGApllO5BrdaQ/3umUkd6VkpqX6eOC14OC8CRlrBcCcvKnIhSCW3JJpqKzhHq7rksqtn5yk+1vYLM5Y7hDC1PVtt5Csjb328L6YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K7kRgLXgR+vov91qL/0lZAyBngtmORkFM8+HrOjb8E=;
 b=Rml5QbvqB1lvalE05715bqDt3qC22eVVCgdG1DFg3ET3QgnxUpmdjO/5bq3SVOtZTxGuuzFacRy4ebppgeczcNreKRDMTVKQAQafch/PrZHKze+hoS3cIVv+3h4KvdPZAoetvX/LWfOCrS0xZZpsDuapd1BfFDXxY6pZxc8XbIHovjL28bQvSM5Ii9n09gUTlWwdcfRzLH6ebD+bEW+FqIHycAu9sH3VQvzYN9I725ZYYIjQyR5qvAdHzuaDItCQQh7Rdh2W8+LqA0w2gd6Y8A0apHdFuwmXVkDIN5kuqYNYR5TM/d2JEt+Q0eRVhzW0xsYO0Frk2bT+aIpDhdgrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K7kRgLXgR+vov91qL/0lZAyBngtmORkFM8+HrOjb8E=;
 b=2aiLR4+HVb+NJi8O8M6f+QVdQH5xlTuKyqz2jCV819Q7MGJ+OLhfwSaSYqh1ILpn2crsyD0lPV/7X5hVOYuiIi711lCO6Vlb00KMQ7ayhGssc6gfHCDKM6iZPPdORDknqll3QLDB1LHzn++sE9EuAtlbrhUfEzgfnRW+0hv0shchD/hoSn7TcebZ8eraUqjoIbAkAZesFHVAJIWHDFKO80R94GYCQJOhTEghll7Hx1A/rF2lRZkoz0bgy8OA8W+fkvt3lgyVgsOdus2e7MuUFjdutwywUh8XS9rHqN/3I6XyZbKQjfSO4kXoP/2k6x9yRwp9OQQI/n5LHzeyfrpEXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA2PR06MB9164.eurprd06.prod.outlook.com (2603:10a6:102:403::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 15:16:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 15:16:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/2] dbus-broker: Add missing systemd user symlink
Date: Mon, 21 Oct 2024 15:16:22 +0000
Message-ID: <20241021151622.3432996-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241021151622.3432996-1-niko.mauno@vaisala.com>
References: <20241021151622.3432996-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA2PR06MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7a4904-ac78-42b5-0738-08dcf1e3594e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3H3DLGxc/GMaES9CO7I65yL8UolVoPc6ZrDliKCW2JioaYkBJpob3vXyM3rS?=
 =?us-ascii?Q?c+4vqCm8bb15n0lsdAADAtT1MxO6IfmAupjTGFRFAYqD9dIVmJFKVjW+jDR7?=
 =?us-ascii?Q?6K+J40oOkayNhJkk8rC70Sbf4jbgXiSPv1kspiYnnIfFipcmURVwGevyBzqf?=
 =?us-ascii?Q?xvbaiuKEqjr+Vg9oCzF97Gz7XrX/hJU6H8bM66ESP+RaNPjarK3ayjROrMZJ?=
 =?us-ascii?Q?r3PJ0SFm1izpe5KEbOPFW6/n5+KPg527jZjWyMPvPY146ph1X4n7ui0hQ9Yg?=
 =?us-ascii?Q?52b1NVz8jkYbahYFC2Xw1kJ1yVa2IJzr6GKzGBa0we3ebuyQrK1uPRUUOMtd?=
 =?us-ascii?Q?eKB4qn87Tu2+D7+8esyOO8REbpf2gRMoOlZGoJDAxU71mQKE/w/EMiyMwzBX?=
 =?us-ascii?Q?3r6sZQqqClWNyeEsJiQbfdq3mpjfRExFx0mxjR1ms/4wt8z2w+QUhT3pIUb5?=
 =?us-ascii?Q?5/3m4Rxef8lhEAms68qCjg6Ann/QazhpLk/UmCnQPJKVYNCVsb7Nzvtx46hu?=
 =?us-ascii?Q?iz0gH/+xvqI+neCX0GRq8yCSEgA6nVspA9GXi4IDxO2hToc4Y21nsqQgG8v0?=
 =?us-ascii?Q?yHYG2htj9B7O1NbvftQ+3/1A2otMXTf5c5r4yhppU8By4MZ4oeaF7+2secPl?=
 =?us-ascii?Q?RDKQtaWWBth5+O3CaxDOaegNs/pHwKBh+FCfAiE0dpau5Rs9CyEAeDBgW8j0?=
 =?us-ascii?Q?2Hv1eSbQMnYKAywE9uKao3hYJgt0v8JcEeDCnqhJq6Nswn6SGvxncuAlbV4V?=
 =?us-ascii?Q?43aGE1ue+KSXbUALGTcugRuxGNiippTVcpSw0EiaNMxu3OdTd2LkjkQc2sNe?=
 =?us-ascii?Q?ca9tNPWb+VwEBjUGMvb6PvzcYKZeRFz0LnJqeODGf0hKmtuyzl/dkuA3TuRE?=
 =?us-ascii?Q?PZIcK4B8Qg4Vza9bTjY8oUrGDC0SEggiSfksbzBAz0qhHi8CJlqZa3UG6pBz?=
 =?us-ascii?Q?V3jsjFSvH6jSHc9hhTOuECvmNPLflRrw5MZd52I5LQUGVGN+YakKTpFKvbv8?=
 =?us-ascii?Q?qH90Xd0Ka0I57VtnvEHfbUqwDwQvHqn7/X6sGw8vKd5fqn2Pi2UI4B9aALi8?=
 =?us-ascii?Q?ObYc04Yez45ECu0ySpV7HzuqvtbEpMR/QcsD6LUaMEQ79sPTYH/4J6KJU+fv?=
 =?us-ascii?Q?OdZDYsNICGWCmbXo5bwD1xgnPu9wxDemGMuUWYGmnAb6HrEZTxW+usX4eM6q?=
 =?us-ascii?Q?Y+IIzKlOfTFnBhV2LxGbEOf7N2gE0IhTHml3M+aOdLTk44MKcYGOeFMx5Thd?=
 =?us-ascii?Q?RUVC5OW/aptyBdBg0RanXU59GgWMjDveCcnAQ+gQ/ntrK0lVTW9wcSLEkaba?=
 =?us-ascii?Q?is3E0oyZNhSjowZ0fUQ5uMlk62VZ6NKiLsCa1aaCQNe30kVEIZgAht4OW8B4?=
 =?us-ascii?Q?O5ahLEk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M0waoEe9cmipwcAiQ2jl0fqDI1e9XDyn4qOh4JkdXyN+If6myy5VwRYfMms+?=
 =?us-ascii?Q?KX37nejq4UhEswsx40MrSpkElSkVkK8yGKSVqG1dbB54lk0AhWiLDuntZjrk?=
 =?us-ascii?Q?TJaWvbMfcYlzqa3TAgq7W2PtxkarSwmttCAdLQ4+273QV5vqCMHOW3QEq5pj?=
 =?us-ascii?Q?wn2ocRVskHeVSgAp7S2vAIVXwMdLOLPq+wZ/ywGdA/OX7N8/z8y4RHY/ZBRf?=
 =?us-ascii?Q?J2kdFuGGrzKusaD0Etb3Ekpj8MG1rQs+8sS96dYYL2ZCrjHI/CikBREHoMI6?=
 =?us-ascii?Q?1e9jPIcvtRH4tPvSVWQPPvwSeg7hsAQ752828Wrrg+Toa1+zukCxNxXjGX+a?=
 =?us-ascii?Q?gmSVCxmP5YPaX1c5bugpkkg3xaJDcCUbvoDv0ZZo3zW+tPOSDDWd6eui0Rc3?=
 =?us-ascii?Q?Ld4MXtyt1nwOh0J0k6xTSJ+W80qJaTgEapJj2P08Pq33l+r+JlHpS+SM8R9V?=
 =?us-ascii?Q?dP1u7+8uds3Vr2V+yUXux9FcGtetKUoy6TuD2PFKLS4+/E/wvvemzgVV1/it?=
 =?us-ascii?Q?Hu0x+Jc12HhLu8LSi1e0z1Azrjmsr6oi/NNF04815Uu9aIaWfVajprlKlUdz?=
 =?us-ascii?Q?Asv7ogjwSQ0rzljycm3TgFViofjp3XGsuOfQBO0l8S90c3szXy8Ne+GD6Ks7?=
 =?us-ascii?Q?TPhaH6w8b3NQxfyvez826HxoSjE/YuvsoopBDvjehtO9ETfegmFGYZa7Oz/U?=
 =?us-ascii?Q?G+SSTEpMjmMjjFzE9QS/Ndg/pAqwaX6Vxn83PjyEknfHxTWvPf3qrZoDw2as?=
 =?us-ascii?Q?wM/VGNY5inA7sLpwTyMEDzctNMjhf7bvDMTWjGyN6SSWG9b8JTrBo22WYN0m?=
 =?us-ascii?Q?G8OcceTc8NZmp31P3RqwVmfSOsoletAY+sbOiyTi0jZWzlP6gzd6XJJuQN45?=
 =?us-ascii?Q?tqA1dHlttl03n96n32ubqSO2CXXyH2cY/CTuq04H89BitJ1d5hry5hKV4l5Z?=
 =?us-ascii?Q?m2vt41VHuuH/OorDFqQ2utBooI1GXU6p+eFwwbsCaDRcGi6YYOjD+Tc2dAGa?=
 =?us-ascii?Q?qf8LW/VNQzE1pJpmfBQbyfg3xZXvqOm0DbF1QfCCoJPYQdm+cUnpXuq9DnZ5?=
 =?us-ascii?Q?/vXKrb6lF50JZGqhDQAuwH6waW396rlGybKdNERqrM8H1hYaxTHlFAGowfl1?=
 =?us-ascii?Q?OV7n38vr3SenbY+0349g1DADk5WiAFP1MJjFVaw34cmwv24WyCl2008zJ2zq?=
 =?us-ascii?Q?RQTRBxGJ0wCEZXEaKSjr/GU3FQEHKzFl8H8Cl9QiV4Ut0lUevV7O+lYiVudP?=
 =?us-ascii?Q?EW4KSayOiRauLVxXQSX6DfYmujC1o4Ird8ySNPRk6AxHXFuSqEkUNF4F3eUt?=
 =?us-ascii?Q?MeCTGwutzhqSRoNV8jJ0QnbT8R8mA/GYDlbn0iUlBbgy9dP82oSQPvk9/xKE?=
 =?us-ascii?Q?+0jDyacIfbuMvQGk3yCjCabkHfyPL/0B/TxAlgYEhVL2V1gcIaI5WCU1gctN?=
 =?us-ascii?Q?mvMfWnWCehWprb2oKnU/sVxXwEwXKlzf9Aegyj5YNheWb5O4vg/py6vlaLiU?=
 =?us-ascii?Q?6q5nbeFBYcNHLF7xTAqb8ONOllmOIyiXhfL0B3HGZqIU43cdDHIQRSA5S9oU?=
 =?us-ascii?Q?DziebtbAiIz9jVnUl/nmWEEpgglkGyVXMuRyhd+2pgjR6UjOjicE231+uVTF?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7a4904-ac78-42b5-0738-08dcf1e3594e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 15:16:33.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GflfhHt1n08v01IaxcRU26WRDPN9bRG4uulLABliLZ5rTu/dvtap16ktYc2QJp5plkTowf+vUyaxPMHfDXtOew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 15:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113079

meta/recipes-core/systemd/systemd-systemctl/systemctl seems to care
only about "system" units, so create an Alias link for "user" unit
manually to avoid errors which are indicated by following entries
in the systemd journal:

  systemd[381]: dbus.socket: Socket service dbus.service not loaded, refusi=
ng.
  systemd[381]: Failed to listen on D-Bus User Message Bus Socket.

which take place for example when DISTRO_FEATURES contains 'pam'.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_36.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-=
core/dbus/dbus-broker_36.bb
index f0f427ba0f..5b4915f968 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_36.bb
@@ -25,6 +25,11 @@ EXTRA_OEMESON +=3D "-Dselinux=3D${@bb.utils.contains('DI=
STRO_FEATURES', 'selinux', '
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
+do_install:append() {
+    install -d ${D}${sysconfdir}/systemd/user
+    ln -s ${systemd_user_unitdir}/dbus-broker.service ${D}${sysconfdir}/sy=
stemd/user/dbus.service
+}
+
 RDEPENDS:${PN} +=3D "dbus-common"
=20
 FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
--=20
2.39.2


