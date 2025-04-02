Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4C7C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:53:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.137])
 by mx.groups.io with SMTP id smtpd.web10.2706.1743580421335688877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=gAsLn6ls;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.162.137, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSU+cnDx6DDFTQ57lUg7s6v5VehlH+wVNepSTvJHYa1yjRQ4EQXeME8GczqzH6ierjnLXlflS+nXttW8E4XbeELHyagYia9Y9hevxqrYs5Mv+VdUlLKjOWJ/pUhH9Tb5yDwTpN08eUQn3j8IiPtgWiGjVR6qFe5J7Mc+7oX/PYUP2mvtNZfhHxLQk2fOHKWp5JF/RM4+ORkiUYmQuuhiqnyusadXpRkMA3jzdi25RPROcIX3aRtR0b5JXwiMZM+hKSHpNT2zLtxOcp6uJpKaxh8AfhgdnLFhOV5fwzL2lvw0DEJUewyeNus+RqnaOLCnmpzJTxnCTTzbj17oeRXBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUbrYGSTTObL1b4OHEi+9pUeCUTlAXyNf8lpr9lLi7I=;
 b=am26PqmzE4MX2sMVCi7bpsAAOtmM9r6R7FdfclU1E3HUL8TZKAwWSnGQsl84zAQzxJr9TaEWOyCBEv20LATdcYgTkyA7KUQtkbe1FQeXljnSleh7SqQVzkSbsR+8OvMp2Xbe4mtF5wza6g8fhAMJ1h1LQhqAYJJBTh43NCAloARyUQ5ufpT1lj7aO7LSWxpU7MLlDa3e2TyvNkXQKv/EQTqsZ+7dlctXhBXQbw/9NNz+38gvWDFeQUsDr9891T34A2hgRnykNOzUCAK28RLZ5IvINei4U8dYGTLI3usDUAfBf+0TNvyXGJsCIRaJF9g+D6RbBsGoJyFPJzUoZM5olg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUbrYGSTTObL1b4OHEi+9pUeCUTlAXyNf8lpr9lLi7I=;
 b=gAsLn6lsKDbF+qheK0lRf7qsW/ixc62fWhUTqFuUMF8u8Y42dD4lRw8fbQulV6MLvvaeo6FvAyyZo7nE1PS63gpVSK/ruVWBOAZ+0Xy0T74x9cydhb2th1TGJ+17IazO4/+6MofIuS4B3OeInxRlTqsE55uWPGTEdqLPKyD/sRTw8JdSGf2jbxrdyT/ftsXZI28vue9nHTaG0WvH1Ms8QNWIe3hFGjFJmiy49QWPcSsFn0BgD0a8nYl5xhoTPlq3uN0QkF+XeE8TrOAJ+mqhW/S0lljh4FI57HBq7mgwUx/P9tfaS4wDo6Mc3K3SYrsIntn70ziyHOXZoHbQkKzlIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB9069.eurprd06.prod.outlook.com (2603:10a6:800:1d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 07:53:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 07:53:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-xfce][PATCH] xfce4-session: Update D-Bus runtime dependency declaration
Date: Wed,  2 Apr 2025 07:53:22 +0000
Message-ID: <20250402075322.2162189-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000385D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:d) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0eaa8a-e489-4ee4-49de-08dd71bb79b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?69HKN2xYUBMKaMGhQ0iCwg5JBI6LdMA/5s6TZckAIkyyzhEiQr2rBsgogKU7?=
 =?us-ascii?Q?+c7MVv4FbexzEm+ub4NYZt3kNrjavn3vM9nFC3LjTbspE4QEXc7IkAuYBW+j?=
 =?us-ascii?Q?FLGeatebHOeSXu92HC1xzKUXLj7b5ELBpdm/LzZZFpX+AOTKOgmB1mPp4Wrs?=
 =?us-ascii?Q?Ysxu3L7h/Zr293xkaLAG4Hm1278RMsUbNtil4aYVTJ7VOtAZirfuT6ukvxyW?=
 =?us-ascii?Q?+uTpC6DmA3z1JfGmmjo32Ck9su7LhkHdaEJx04JpovxPIyfbC2mHHs8XSEoB?=
 =?us-ascii?Q?6Q+XAzA5NLtnMA3Mq1bgeumNpJ0mAk0zAnoURL+nM4xM/PTI15hcJi9pS0z3?=
 =?us-ascii?Q?kXVp2C8xvc3nOz55xUD4StTOMLTMLdVh35XilvKp5FkzOINFNogF7WfhRs8P?=
 =?us-ascii?Q?wAq/aUqhZzPZdKTpL4Uis/pCwCfvn0X3/ghJ0uqZVN3VP/jPRwPpw1/rnBLL?=
 =?us-ascii?Q?glInm35wlCBIfD5Kn9n/ziDemehrsj6uMwNcsYAw7JSOXEgDSMLGoO3Hc4kO?=
 =?us-ascii?Q?VeU3ofPHq6zerFqHwrv53bkOW6juZWtvy84JTtH5r1Rk1+xQnQ5rKFlWqgJ0?=
 =?us-ascii?Q?wSuRF0qK94y7RKIU49KrNuTi9j2PtwZq/Cw3smO4K58tm6Kg0XdBQD5C01tC?=
 =?us-ascii?Q?biwV+jttpWxIif1APNcOGUsMzN8qreBqu0THZ2X52xNsKQJm4HyRK+jdrbYz?=
 =?us-ascii?Q?TNHdVNG97ulU1lkvWQFz8fOPHerrszZFzKFkrGqDblMqHUCimIL85lqW8+Tp?=
 =?us-ascii?Q?bEIqE/zlTXuvqyP9DKJlvhbvPmcwcJ6QZwg8XUUwlAzK2ZyoqHRR7Tl6pZVT?=
 =?us-ascii?Q?AxrsffPhb9q4irs33q4l29oQgZppB+/GO6MjGx/W8ARerPblEcrW7GsUXC+O?=
 =?us-ascii?Q?0xRpf42O1n0/OMnsKjOIlfBMSBPw0GXPB52ensfPIuZ2Zy58F5BibpKk5qGr?=
 =?us-ascii?Q?Hi4FRZrjbsbAHqou9JR/IBbF39QafPOhJujArTR3uakBeGXIdJPu/mSdKChP?=
 =?us-ascii?Q?rCL/cy8LYPUDMMAYAjfMO4/gAVMsHT8Fb3+tLPg9HE+RL8e4HD8xQVsnV8Lw?=
 =?us-ascii?Q?E22nlBraUydfkMTie6j6P6cm5WjyHBKBgbWjoOhrL/HJxVPOZCMNYeMc//UK?=
 =?us-ascii?Q?eOMs+sWdzdtaFJQoUDMJsbsOLH8cKMPJH+Os7XR/PbVSrCZWYAFxSaCmr0K9?=
 =?us-ascii?Q?cqizXo9yszl+hJHV13MTzgNqYs7aCYdLqUKqcZ+XnIBx+EUP6RbQBsIoM2Ro?=
 =?us-ascii?Q?Ds2ufL3l0f9VR6bP6i1lPnUcN0v4FDUc/vV/ruPtVrfJo9HLTaTRtg9ezEq+?=
 =?us-ascii?Q?DNRhYlkUrPLyywPgD1r75HcUOgxmR6d9ZrhkTyatmrDsnblEGQTBUjUYORXX?=
 =?us-ascii?Q?IpsmCRCLj7Lcsh4+YOLwJGmCm2buy2XtMdn9LT/pd2lJC9+lkuASFbM2SEz1?=
 =?us-ascii?Q?5vo6k1Lotm6v/mNOPw2sUE3Xlcy+edMh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?miiIQmBOilKlBmUg0a5hzZPD3FeDd0F2h8g++S5V6fc0tqoiKM5gbTGchY/n?=
 =?us-ascii?Q?f3Ch3M2ny+9Za2NaiZo8O+hI+Hl1w+i80mzfcF9lU554ZOoFysjeWYULYvZ5?=
 =?us-ascii?Q?HA3TMn1QZTk5mhPKtaKSxYw3CEsqgMDFpB2BQM/51J37pvBgEZUXHgWfwmpE?=
 =?us-ascii?Q?jnqBpeYGCbS9EbgAaIA/dLyQ3WzGvdi4/jUaIHMFlQ3RA6VG8ESJ5MEDpDz3?=
 =?us-ascii?Q?3NTPTlocjovjQRa4BynpmnJTTv5ArL9mKPSALOLEH1gFFR8ZUl1yh5N0buv+?=
 =?us-ascii?Q?uaAgJv6Prq8H08PWTs5ToY3Kxm+n97qBzXW2dGf03wxfrkebWYArgr2A/C70?=
 =?us-ascii?Q?JtH6WilUPLcB9RMAcJrIS3ts4A7yw0ufbCD8uQpFAumBn/bPdDPJnTDonPqh?=
 =?us-ascii?Q?6U4LtsGYwWTcGLHOfwWOW6j5vHwkCHxPGdX54rAE1cpO42AnizyIBjA14MyP?=
 =?us-ascii?Q?oYbfQGaTvZ7Q6nypKtZaU+s/0dTPooIair/BQD4tuRxd3aW56vj5wMaSp3on?=
 =?us-ascii?Q?dHBTcncC2ujSVLFBfqUgUZ1Lb0nbJKVMS5+rUYUQOpPfI8JugVoEWq6ngHUY?=
 =?us-ascii?Q?ISHZwz1PVW0cLoaXjEYxmuTpHC3ZH4VAeluj0Ad+DSxGHJo778pdS71OwupP?=
 =?us-ascii?Q?+ITwBEwjIpqquvRZeCIXkJpP8AQO+W7I40KQs12FAUz7rwLJy6XPjIBNK6J9?=
 =?us-ascii?Q?9fNDvNe8q/svqmY+VsV7e5AlAoLaghxXu1FFP7m7+Y8Z+5ip+rWL1MX0M/eq?=
 =?us-ascii?Q?zZmwyNynsmOZ8TBGaJXofWjK3URob+GSLoKEle/z5WQelz/xmQgMr9Y+QXRH?=
 =?us-ascii?Q?rlLzJEyvIYJiighW/g+E/u4WplmA/VA60lgsvJ6j7zIJAXMceTOOSIvWLNpb?=
 =?us-ascii?Q?1EaFfz7jzndfqAD/9huPPILvrCVhjNjUgA09qCNNpAjryEk14zPE43L4oJGR?=
 =?us-ascii?Q?W2ukqCPwI/BPrTD1+Q6eEkFaDuqeKS1XdXJOx0CfW9+/e5OD2hCL07uwC9pY?=
 =?us-ascii?Q?b4Q0ROqrUIOTxof3BC6nDPAEe3YIoNNv7ypMW+kUng7HaLGtqwEwdxku9XTn?=
 =?us-ascii?Q?Zy4S3RK+hUHMtlzstfOoG0rJ/ZQt70BFpr5nKkSihPajvDvTs5jpwTrq64K4?=
 =?us-ascii?Q?2BGkiftX3Cumd4OaJAQOj0sBZ8dkjLav/UOH0Zhr39GQc86nOVT4KLku1VIs?=
 =?us-ascii?Q?3mSUFf+16ziEM/vwBYGDiA0ughDZA5L+sTCUHZ+f34vx7TSuPZl1pj28xkzu?=
 =?us-ascii?Q?I0HWYyE6PzGqrWVZNONVfy+XZb7l3wP04SLWK1iw3M+QEev8OGseSMU7SZx9?=
 =?us-ascii?Q?pEnyVSKeigvrEZ/kD3aiR9TCszVMh2BkzoT7jI1GM673ZogOMc3Ezx32tOVQ?=
 =?us-ascii?Q?hXpnHaKUuw4lI+zBiUW0yUIrX95ssOHkqhzbX9+KhiL0yfqBA1y59W3alkja?=
 =?us-ascii?Q?V7ppYzwKjcOPdRlIttLQwGIW3fOKZ89WY9wmgZENPPB96K3dVo/bgyHksrn4?=
 =?us-ascii?Q?imwJesCMh2UaPOBzhC8KfShUkDV+1V6S70HNWU9UsvS/6LtKU2Rh4lE+WMiA?=
 =?us-ascii?Q?1KX0jFiZu5mLIth4qxzb/QjJwaXj9zveidATrzmbhbyeNZMp7NnCns4p/INk?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0eaa8a-e489-4ee4-49de-08dd71bb79b5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 07:53:37.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rk2291x4SzkyJDlZfQBSB3omm8tZHdry43RRB/bSi462Ou3cEWYqLZZ+zChh6RQNLsUTtm9HmXZn7Z9aDtfTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB9069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116512

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


