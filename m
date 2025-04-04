Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19215C369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.76])
 by mx.groups.io with SMTP id smtpd.web10.8468.1743764081901910353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EIP+yDbO;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.162.76, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXn8vIA/06xUNPZNPCalNDLL7EluTj7U3WsKE2OyA++BjyeiSy9wUX6Brd4VADIrb9sLVi6clICbfSH8wh3V1jg5OE/Rln3iaxt+9IFhOhGF7mG2C+lDyx4krEty3B9cOen3yXFBiiVYd7Nc1DjPIkC1R/kfX59SoACSPF0RAPBVAJt/4lIit+/2ThD/x2aKexbhAzP0zTEEB7FTguMFXzwz64iZ7KzaapG9XjF04olcDEw6WJvGqZ4fhJZzR+ucLuUU5M4EioTyGNO4dsFgdjoEUcbtv9WLbppwuZv3CGELPumJzi04ZOx/PJD9Ri0BgFwbWJsmoLft9CIYuQ0gtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUbrYGSTTObL1b4OHEi+9pUeCUTlAXyNf8lpr9lLi7I=;
 b=TDBWEGI6QaGc9zO25NGFzpW9JV3fteGWBjkCNYqmzkqqh61bjYSHAnpQ26DEYPfM0nQxPM6cPODFR2Wbh/7xMh7Ibki+cNq6KkbJv9ojqRgHnchK6OUgsoJ30GlRu4/rNw4wzExNplZppHMRKyXP0wNA0H8giF4p18/ZngE5vuDmmJw83q9ZMFKfY7MkG508rjcEzl+8WtYtxbq5Gc+zT4CsQTBTHjv2Wvd1SFCxfMx4SSLrBpBBWb7PgpD/4+ZTn2OCThDfy+ur8KWs5qgYL+du65s/ETCp3eZJuLLUDOGQYWNaTSaJWqO7EPVBHZd857EJ5Q/e8EpyBNY/MjAMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUbrYGSTTObL1b4OHEi+9pUeCUTlAXyNf8lpr9lLi7I=;
 b=EIP+yDbOLdXKWvtM7BCyfFhd6NPC7PxpDNjafnaLc2MZYQDZzkHeiKfOEHD1ijH5jfnuk+HFU8PIt+gP2ZFh4ag7+KNEZshMHvv9N0vLQ5Eyc+LDdUhUuYjJ+X/ezLp3JdutBhGv9SiZnmsNvzTIsS5pm3y3i3MHb+fZlYPRWdkCjgN0/gN+GnBmGGVbbGqYazMsrmuP352PHfk+aCy7E0O916jDUH/1Misc/Eclb6G6H9xI/zSW623rMD2ebqkkf6nW7d4WDpwPF3ZIvWuTrgK/HgJdw1PdI1BTwh/0ai7e5CgytutopSQkrPnzNzEswBO12J1Hua8yCxCMd9GbOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 11/11] xfce4-session: Update D-Bus runtime dependency declaration
Date: Fri,  4 Apr 2025 10:51:50 +0000
Message-ID: <20250404105150.870898-11-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0e7a0e49-eabb-4828-1f6c-08dd7367179c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qum+ARV4wCzTqOT0BmZQYGJxsGIIYbpJM2395ypc5EosNfZYmXTTMHYIzfoI?=
 =?us-ascii?Q?LmglXV+SeFHB5a7XGA6bYyryJnE7Ud0+GykQ5mG/uokV6Wp483i7VSYrwG9w?=
 =?us-ascii?Q?yXisCr2QIgaCqUQ6dE4Qu5vuhM+T6i125K+LM0Y8JBv6VbB1zJA0barNg17u?=
 =?us-ascii?Q?pjOiWY/fpeBvELkkRxE4ePnWAI3BJF82IzlgXeDfvcQcIjyRSKiVFKKS/AS3?=
 =?us-ascii?Q?X3NGcYX6gqju2P9nwVH3W6c7W5JZqMiT8UwNCif/O/QejtUEO/Gxyd9tAioN?=
 =?us-ascii?Q?eahSeNlcGUbpXKAsqCjCFhrF1pDWlf6UAi5DXAZWhYRfh6lxOhkoLhJEccWz?=
 =?us-ascii?Q?HwShxPuKJ3WUuJXUEv33w/0jg7inj6UpaHtA/CzWh9OIPPl/t1u+tzqZkw0O?=
 =?us-ascii?Q?G37FsVtBA2QLFQLhyPRxm3IQA82ApmZJwGcD5CXpPsD/0BC0NaV3HuzYY7mf?=
 =?us-ascii?Q?gR3jkBj6RQ88aaOZDUolEJ/wYS9VrNDCU8UIxyPRP5XvsgZS52MjJb5AhC0u?=
 =?us-ascii?Q?NY7Ch2kH85tu+INq5DK2HFy0f6mZJraZg8IypCukjVyw+4tP7NMS5grN8UHi?=
 =?us-ascii?Q?fOeE5CrXwVvYLkW5hyGtmQJDBvuMeEVgMepYvCiBCyXi8Aes4/RU1Yul8pI0?=
 =?us-ascii?Q?PRYp45aTBSJ6WdS/9VBlt/6ttUxkH84+2bnE91mBPEXa7Uvph3dVvLuPiqB4?=
 =?us-ascii?Q?d5FI/NpWLLyAjFRQ+cY/C1QYp7vb2DiUGcqjwzLOf9cwQVw3eKgtdBwzIZ9e?=
 =?us-ascii?Q?0/Trarf0vBfe/+A/Nnb5NT4n6gcp/4kZrzV8eXddnaMzdFTSotdh8+dCap0H?=
 =?us-ascii?Q?wa07smD5vebZAaWslPt/o2bMhtQxnKQz80+7X79HII4HI2NKPHn+as9SUpxa?=
 =?us-ascii?Q?lQvZbH2cIdsrGY6B3sHALSirw70AXFeMs+kA/Xes/LKNVqrwI2NzYEnEg5do?=
 =?us-ascii?Q?7mFzTDLNxWwL6Yw5QW+1HjgKOq3SLzydwW/oXMLAq+a3PuWXBMspL9lkjpMj?=
 =?us-ascii?Q?D9Iunb7e0ZDe6VV/Zpq9S2LwmEMXik2m1PDYd9JXnhD6tYRYEUBrz9iqXr2Z?=
 =?us-ascii?Q?R8Z9VZ67g/rTHtgr30wScDmDQ9q+bEmIXMZvc7+wSTAxpDKQ0SCsq2PY2fzk?=
 =?us-ascii?Q?o8wKNZpnXllqlBnq7PqoLv91u4gIUfFPndH5SaMZe+sGMe+xOQWzUACUQcmV?=
 =?us-ascii?Q?mjeed9xYIlgKoQdasJy8U+sxhXQ2IkBIIO8DchFJGwSpeqmymXteOe9n1hcO?=
 =?us-ascii?Q?kuMKrIjQHxTqCnUuM09qP+V8oQlQzYtMl5SnXpvSweaI6D6QiMjSd/9YdDCT?=
 =?us-ascii?Q?7DM9b55P0exyzy9zJi5QxJ026XUpCnDoKd2wweFrVLE6HicDMJE3SkQHhxuE?=
 =?us-ascii?Q?zqcv1xFA4ivgCIsql5aTe9udaFZm3c5a8IJmPlKW72/TDCDy1AdaLurQDsEu?=
 =?us-ascii?Q?aD33mfLeEnR8NIRCSdm63v3mYYaOQlSr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vu4+S57ULgF4htFnuQunRJi98nMKIH4FQnpNSEYhiLizxsjX6Kjgn7IuzZ7M?=
 =?us-ascii?Q?3OYMWvwMn1czFRVYZoALv3TXdSQtgjgZ0eqf6nRtUJlY6Dtcz5iFATRK6ZAD?=
 =?us-ascii?Q?UOPoxKhJZTlmqsOpNT3w3X3HkdeIjBu5T0DW2FJe5FbpXoeCGt3XzrsFWv18?=
 =?us-ascii?Q?K4bfVjMhBPZ5cZVH4lDMqyZ/nIgvyv6eCG1ddVUfHNYvqXl+0CWRGX6Q4a/X?=
 =?us-ascii?Q?xCd4KxfJhqpNuseR0wsSPn96IE07/eFdQjCOmjd3QW8WBN6u0xWJ/ljD0G/w?=
 =?us-ascii?Q?uXzqsmf2652MI4jKw+5bw06k64fIsSZzG/Gcnhe5UxEFIFwXGuyJQ39rZPqt?=
 =?us-ascii?Q?0Ieshn5WjQVNwD4LO0d8TIIMMPahENVPJBa9BhQ2xtElqO4R+ofjjfjlPL0k?=
 =?us-ascii?Q?++qPhsw6u2RX3jJ2wne8cltszY+x8BMjCKvh7gxaqEU/j2rph5vVjH7wF1Mc?=
 =?us-ascii?Q?mBSREgYtxCSu82CtIw/D4ZpdBD0nsRpll2E9OYZJ7G/Fx3aHCTHQEvtdMnQL?=
 =?us-ascii?Q?NbAO391jfsedVz0fYR2q3Ftut9I0h4rvfyEoeJVSUAo2la18NqXsVD5DTBWM?=
 =?us-ascii?Q?CuVRlDTlXM/mzARgE68U12ycOPI2eK8KLR9iw5xZyEl7IP83rz9QKDDW4gXs?=
 =?us-ascii?Q?PtxG+OMqDHFfATbGnRdRKYy1/x6WIGvn9Ljp7xIZ5nqPEkL9QDKjHWRQXcP2?=
 =?us-ascii?Q?iTZy60sdTid6oq52OAPZoBG3DddmgSKz+hb3kM/7qBMVqLbrZ7tmUQ98jBQs?=
 =?us-ascii?Q?s6H35kaSus+K4ClJaP8vWeoAuPFgAtlHmV4gemXUuZPvHsIwQFNhhhYBAXua?=
 =?us-ascii?Q?husqWbwLZdTm6RtvDHQkEZTPiu0o5+fMLufBbGgxbSQJl4FnrwfiWezM/sPM?=
 =?us-ascii?Q?lEC+3U4WbAm94C+QUyVGasD6gNgUYlEgaAU327e2oU06Kx6HMRg45HbOgtcq?=
 =?us-ascii?Q?7NpYmFgITPlCgHkPAxTdGHlT8fL1Ks8/XMqQXqX9uxjVifi37C212L5+ZG44?=
 =?us-ascii?Q?rJk444CIJt3HoHM0iYHfzlZLkXmp3GnLx+Nwa1Bg+FvM+R/EoEgdpk7zcOqU?=
 =?us-ascii?Q?CdUcT1AUbUHHcZdELPmDzM9LUGPUFG5EEzlvsbhrh/AsFdn6WXetuY47QiXy?=
 =?us-ascii?Q?4vIh1t8yLd/750M2R80pTmYQkj1Q7UhnRXM7VBNw96ddBKiEeBsYDBWx/C8n?=
 =?us-ascii?Q?U3NX6rpnXewYlzL/fcgbdvye9x3sHe/8HxO79sX59Yh4remgL9WvvXPVxjEp?=
 =?us-ascii?Q?hu+asLaisDX45FJ3JJerTVWDt2s0g6JZE2U/Oej4YmenjKjGGmrcGFJaJLVR?=
 =?us-ascii?Q?u4oYta6LQWYa3Tw9qZ4tESyeKcJrKMDi7yZbJcM0jAZOIfeBNuEZbq1aCY5o?=
 =?us-ascii?Q?rLtnWWRM6QSYbb9sC8uqwryykE6raouAKMdBwN5WBv1+2Nj42J0vc7fzlnca?=
 =?us-ascii?Q?nr9ny05RV8HC3Fpu+uBlJjuhsHdI8X8DC5G4t+xmGl9KbYnrinG20NljTQVN?=
 =?us-ascii?Q?R3TO08oKiTCWj7QweJXCntD5YGz6QP5vJDePJ62XaZvxV/FDMYmMPXwYzQ6o?=
 =?us-ascii?Q?Bu+0w2Gj5GdJOwvidBbh0tCLztr7WKD2PbUKqmu0JGcMx/uUhFQQpoLZqKTh?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7a0e49-eabb-4828-1f6c-08dd7367179c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:37.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g5Mf6EwhtCnkzfJkvRhmQYF2I+L7Px3HvMQ1PoekoGkhv9jOMtcvs5lpFjvt+rgJu5qC52yDfJGffbk1/1wEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116582

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
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb b=
/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
index 6ed03efeb9..fb30ba789b 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
@@ -32,7 +32,7 @@ FILES:${PN} +=3D " \
 "
=20
 RDEPENDS:${PN} =3D " \
-    dbus-x11 \
+    ${VIRTUAL-RUNTIME_dbus} \
     iceauth \
     netbase \
     upower \
--=20
2.39.5


