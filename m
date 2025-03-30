Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F06C36013
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 10:31:43 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.98])
 by mx.groups.io with SMTP id smtpd.web10.28244.1743330693592790054
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 03:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=r8AFcg4h;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.71.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kag9T6EPdHKXns9M1S7fXq0W1vhucQZkaLeyC1pAdDUux+YgZXz/dWUIHpd4NbVqqy5L5E5/VxRcIhpOO9wd9fLqUKP07XSjy7raGaziIzJQBfrwIcNumeRCd9vAWBAPkUKf8z43pP6f1CDIoip/HmnXTbqxJvCTiSrel7ZkHAcoIDAxV6C7uqam+mg+EX+d4hYAdSFDKWkK7aHud2hPb2ikf49SKid5rEnyyLnqkDSqXLsMqXUf9rPN1k3BjUGhXVJpUOVqCZCUzFuPcOSOZkubj8ApXTS89epQMgV4Ti2wHBqQ7EQbwFL4NmizV0UDjo0aQ8HVW/9PkQK9s7YfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6J5n0X03yQPIQmfF0XfMr6kAXeqanU3SMzISitzPQk=;
 b=AhhnKHOhPxJiSuEJEZVPxvk2sdRkksB0WH2mROuQ2KIAN6lIGJ+aafD8D+qetELERHpnEd7f/v9nCAkrygLFoOi7Eu8NhlrHYB1SAn/R0PKT9ZniBY5yyTWRF8loPqwuHhTKL1Dt/DQbxKt3cmIyGSoRr289W1gaBrQxOQajZq7ejfj+r/5TjLhEE/ZZZNFk1fAaXce9RuVB+JZpKvjRPxtlFY6iDotVgRfSMkzMD55QeEafWh8bDjDRztHZgPzjrUz8cu0Gp66DVs2AUXLekT4SkriCVwAk9JgrCY+bxPxB2ps9Ms57g+4WupnXKvfXikQyIxIQzhqtkbmk/Vlgmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6J5n0X03yQPIQmfF0XfMr6kAXeqanU3SMzISitzPQk=;
 b=r8AFcg4hyvsA3bB8jsUOSTbd/ByvOfBDWNyQIeouUNDtga5jrzVD2rkYetGUXnxsrbMmvepZ2v2X3LQYk48YSkzAoPOmt+z3V+prLxQH3j4UdIbfgQsdtWWXMWNcEi9DL2Bs2bcnbV13Xl6R4lIvQ2ENgJYi0jmUz/7jxFGKK/GFDDzk6InLNMOFJOT9qhyfvrobplM1zETPp8Mhsgm6nF6wQIuKjxnFO3D1KM7zssfVQHGA54bhhe73gLVwspVmJzv3H0BQGSjr1Ya7iJcuwwCEHh31UmGt7nhUItx4C4Vf7iOj/2u0uZomxSkV3lhVQaCXQpUqU6+nygN9ySmRhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7100.eurprd06.prod.outlook.com (2603:10a6:102:8f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 10:31:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Sun, 30 Mar 2025
 10:31:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-multimedia][PATCH 2/2] tinyalsa: Remove dangling patch file
Date: Sun, 30 Mar 2025 10:31:16 +0000
Message-ID: <20250330103116.405060-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250330103116.405060-1-niko.mauno@vaisala.com>
References: <20250330103116.405060-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 300f3856-4276-465b-e2ca-08dd6f760924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vgjCa7BZT+tLMiP02UIiaCAmPfLNIroeDmfWxcriPcjGyLq74P0+1yBiq5K1?=
 =?us-ascii?Q?ugkGsZga2ij1WuxfxEtqzX9W39kwV/vj1pTwDZnI0FzlQyKMdencIjOLvfUg?=
 =?us-ascii?Q?Cm36tJxybqj/gO6puLTPGzRLRAUh3JlyqZ6EZt58hJUzUKOUIqLw3ySRjqT3?=
 =?us-ascii?Q?QhVci1DmIjgYYY0ccubHMw2faT5ttdHCi46sFQAAbQJBZ7ks2yETwEX9jxfx?=
 =?us-ascii?Q?fyeSbrSkIfbr03updQCDRsk1rpTB1Fd+FA7fHaRU1l4Tjqq3rXnPwINLPfhA?=
 =?us-ascii?Q?Jv1saKpb4ZwxW/ISxbz3/envEM2q70j4r+H1LZjJPNJRucRO1uw6aiw/1dxG?=
 =?us-ascii?Q?JHpEE9aiq2JrwrGH76ZpJArUy9drPDGq6VqKeClfzzdvLlDSNGlUPYuyqDon?=
 =?us-ascii?Q?yiFlOiBf9+QEoDn4NY//dQ4gscCr0pYb4K7ouLlNuen/Whtp9NFgxay9EZoq?=
 =?us-ascii?Q?iteljYOBOktpjRYEWrHO7cka6wUdpS6fVAJpLzSylQqjnNHtvvk3UVJtJ2gU?=
 =?us-ascii?Q?EzHCHBQnBOCvLX/Z3otyV2mdhoAYVPlMuN7En6kc03XMrhMscKgwda/n5+qC?=
 =?us-ascii?Q?CaZ0/mwHtjcv/m/OGAOMUc6HE/4hNDIhABdQIrYDqqLDEkvh3O2pB3+0QBHL?=
 =?us-ascii?Q?/o4gcs7l8l04kPG8CgGFDtOuFq2HQHsICFRZQoudWr8HUxE1rcAiXJn4QviT?=
 =?us-ascii?Q?pvcle2gMFqGkr6JJE2yN1pa2A/eEOa56G1U5smeZd3rH6PJfP46MUc/hvELu?=
 =?us-ascii?Q?rbu/yQKP4MWVczVt9gT9KxdLz/cHdQktgKlqIFmhxm8K2baVKMojkHL0C3n4?=
 =?us-ascii?Q?PADY04SfZZfayoUgiGpP1f2OVKZnjQu9rEogg6vJsgYNWABqLHtUN/IsMW0l?=
 =?us-ascii?Q?jydVJWlHsNp7xT+c//hilGAyzCP5y5kAjh2ruRKwjUa28n6TAgwBOYZ4U2PV?=
 =?us-ascii?Q?RD6Mekl1itz4uDAG46JMguM9v7LqzDmdZeeZLEHIqBEpmCEdPhWRd9vKajbv?=
 =?us-ascii?Q?w9s9F+UiCULz7J0vBsVmy3fRpL7RpRbJTEx1G+dR8FxxsjnmsZnYfYk9xu97?=
 =?us-ascii?Q?49/elKKac8Pko9dpQ61SPStzb69qDSC4REze+KwVsq1XIrjw9X0bY/YbAqpz?=
 =?us-ascii?Q?mcYICqLxzsdo5LsMBENZ1oCDJ8KS4HQoFbRiip7uhzjAxZ9y4yS9nxCHVy+j?=
 =?us-ascii?Q?3uzmGVyio3YaWYHuc1rap/ZavO2SYLjPNEuEK3sjwTtibDEjSenvINaqd26p?=
 =?us-ascii?Q?CTgZHaSOoOWr4OSfoF0nc6AKDXlkki0JJnC24TVqM9QVzQbWJ/tfRBPDBSHb?=
 =?us-ascii?Q?mOqOIuHQ2TOGXqZiobYfDWIcUA9sYL8Eqpus77uzSr5rgdXMcGVJ0TfI/8x6?=
 =?us-ascii?Q?vf/fBlELsRNKBGdGR5F293diduoqYEh+7YibFja1RO18vFzqe5BymojOcUQG?=
 =?us-ascii?Q?9dISgC8i+AwaJsUB7/lo4xXrtF5WsnYu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?943Z1cAc//Yoyba8ycSlXTC/CVCaCgM6sDAlDhvWTd+rgA/aTHG3ntkA+cKD?=
 =?us-ascii?Q?OkUgyh6KRFDEb0SI1y1sw3scAkAJNhdgHUngZsAzV1N864tQoLK9XCbBTi/7?=
 =?us-ascii?Q?GX9pn7JDqPOME3CjVhRimPnbC9pr4KXb5WjkAvndcd42+NwhQK1JmU1XT16z?=
 =?us-ascii?Q?g/0139hN/FJHZHPYn2iV+h6xemK6ng8dDFO+wXiUndCnm9dLXjleg8eMJQZF?=
 =?us-ascii?Q?kbYBe1R95ThUu4noeMwcVK31GFjfeZnu3+QGXkZwWpbMszyHUar+kEKg56N6?=
 =?us-ascii?Q?YAJFBrFdhRLBO3fXU/gfDa49VK5BzCrs4Au00S+mT540mGZAPaQWbrTHF/Jd?=
 =?us-ascii?Q?KRwywRr6L6lDggvm4SpRKDDidlxZbhuiXt6cvrZ+DpAlRrr9Ky0rSV0pw/UY?=
 =?us-ascii?Q?EITXmLoNZn0uwWyPc0e0dprhnOcz8hveWzz3mJr387HnQGf8crRQ3KeZbw5i?=
 =?us-ascii?Q?Qn/uD9muHbPQbMrR1SZcy7F9dYsfQt8bPgBDsVe3IvTnfG2FBqAzBZZreqBG?=
 =?us-ascii?Q?WCjxTGEVZ1Rc5TvOVjz3NFvtL1RSIronLk2aiRwdNXHxNN0/FeDfaJrQrZzN?=
 =?us-ascii?Q?34LtjHrG8gu2SOGp3MJ3hCWOERlG/ZAF+mbq8MohdaMb9wKUNpGv11g00SII?=
 =?us-ascii?Q?UUYEItgwxbSt9mhe9+wEekrvRpigwevyvVoHObn7i4RVa2O72srsWyzbEgcd?=
 =?us-ascii?Q?oWrVb7EAiIBB/rOdctXmAzej3lV3CqJkGWaRAwmJOIkhy8ND+QU6E29zQNpK?=
 =?us-ascii?Q?Kc/sax2ozsrsn8NiAgJeQ6O+ROOXznheqICOAUBo0bKj6cRVKqXwzxxUxkg1?=
 =?us-ascii?Q?SOc/Lu2Ta0CzXepfusAQNyXuCceIIM8IK4nz/18cwReWgpZA5s8Lr9Anur5O?=
 =?us-ascii?Q?KTwU3Va3167orMyOkg7IWVYsTvllsbAPHLXZoVVRCvP3SjwMT1KlGZa8HDFz?=
 =?us-ascii?Q?KmIu3UI0EuBtE7B5EgPnEQtWlO7dtCXyfeEpbHbEveveWUbsxRDkBcMx1ndq?=
 =?us-ascii?Q?unuf9uXtnKS16cO886+YcQ+PVMVobS16CoFpkrE5SD2iJb4JfHKu3vPB9nfT?=
 =?us-ascii?Q?H4o/kGZN/3B8mAI5wMu5a2g5jQbROirztqRDGazWyt22uRr/461Tc4FcGn09?=
 =?us-ascii?Q?eumrsLqTvJXae3LqsBaEJhn71rD/ErDLbF1ka6/cWhQa7gdc6SduJzm+YNUz?=
 =?us-ascii?Q?wN28QOkqQZqp/dSr+Dpl92ORoZ8w8tkuyGyFhSHHkK3ODi+VdezMp/q18xpD?=
 =?us-ascii?Q?ohn+GnSBobpyTDzQ+vnZdLYdrgtoDj1/XpKMkWF6Ux7eynMqSeTO6W3mdEyc?=
 =?us-ascii?Q?Q/UggePf3P+7vhxx+no4WzL69ICN2yCtqraMSJeA83LNIp9CaOpHogn2ANa+?=
 =?us-ascii?Q?+dPllODQfzAjW2gLXF4Hv2tkKB9bfn0GlNHHRXPXx/1txDp3bhMOSJ3Gd01W?=
 =?us-ascii?Q?T+CCQkyQzh63LrUsjd7kHMj7dlUO3pESkXWvN43gej1lpDZlXsEbcwHEA2dp?=
 =?us-ascii?Q?gKTDaitUiULT4RrU1Xh2BJBc9zm8tS599Bek0+Y42vyfwOek2lWtjtjqjEW+?=
 =?us-ascii?Q?+fXyk8HzK/+pxKMgiTtmzNKhW3NrxP3OCSSIgXCc+ozxzUCSdkFvcj2QFZfa?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300f3856-4276-465b-e2ca-08dd6f760924
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 10:31:30.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfB5kwd0QHhftb3bPJYyV0A7rZU1PGZdcGz9hIz/S7WH68Ew2Mts5HXt8jxfPE9Oj6RcsmBGCgoKZdxoIvjlsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 10:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116389

Not referenced since commit 13ddd97e4f3b2557aa1aea1212e8003a503415ee
("tinyalsa: Upgrade to tip of trunk").

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...-compilation-error-caused-by-strncpy.patch | 69 -------------------
 1 file changed, 69 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/00=
01-fixed-compilation-error-caused-by-strncpy.patch

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-fixe=
d-compilation-error-caused-by-strncpy.patch b/meta-multimedia/recipes-multi=
media/tinyalsa/tinyalsa/0001-fixed-compilation-error-caused-by-strncpy.patc=
h
deleted file mode 100644
index 64ebdb19c9..0000000000
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-fixed-compi=
lation-error-caused-by-strncpy.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 639650dd64e483074dd7c3c7ea6dc1b1bd542743 Mon Sep 17 00:00:00 2001
-From: alperak <alperyasinak1@gmail.com>
-Date: Sun, 12 Nov 2023 20:16:55 +0300
-Subject: [PATCH] fixed compilation error caused by strncpy
-
-Issue:
- https://github.com/tinyalsa/tinyalsa/issues/219
-
-Fix:
- https://github.com/tinyalsa/tinyalsa/pull/220
- https://github.com/tinyalsa/tinyalsa/pull/221
-
-Upstream-Status: Submitted
-
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- src/mixer_plugin.c | 8 +++++---
- src/pcm_plugin.c   | 9 ++++++---
- 2 files changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/src/mixer_plugin.c b/src/mixer_plugin.c
-index 34117a9..f608563 100644
---- a/src/mixer_plugin.c
-+++ b/src/mixer_plugin.c
-@@ -82,7 +82,8 @@ static int mixer_plug_get_elem_id(struct mixer_plug_data=
 *plug_data,
-     id->iface =3D ctl->iface;
-=20
-     strncpy((char *)id->name, (char *)ctl->name,
--            sizeof(id->name));
-+            sizeof(id->name) - 1);
-+    ((char *)id->name)[sizeof(id->name) - 1] =3D '\0';
-=20
-     return 0;
- }
-@@ -100,8 +101,9 @@ static int mixer_plug_info_enum(struct snd_control *ct=
l,
-=20
-     strncpy(einfo->value.enumerated.name,
-             val->texts[einfo->value.enumerated.item],
--            sizeof(einfo->value.enumerated.name));
--
-+            sizeof(einfo->value.enumerated.name) - 1);
-+    einfo->value.enumerated.name[sizeof(einfo->value.enumerated.name) - 1=
] =3D '\0';
-+   =20
-     return 0;
- }
-=20
-diff --git a/src/pcm_plugin.c b/src/pcm_plugin.c
-index 15bfc80..47bf4a5 100644
---- a/src/pcm_plugin.c
-+++ b/src/pcm_plugin.c
-@@ -153,9 +153,12 @@ static int pcm_plug_info(struct pcm_plug_data *plug_d=
ata,
-         return ret;
-     }
-=20
--    strncpy((char *)info->id, name, sizeof(info->id));
--    strncpy((char *)info->name, name, sizeof(info->name));
--    strncpy((char *)info->subname, name, sizeof(info->subname));
-+    strncpy((char *)info->id, name, sizeof(info->id) - 1);
-+    ((char *)info->id)[sizeof(info->id) - 1] =3D '\0';
-+    strncpy((char *)info->name, name, sizeof(info->name) - 1);
-+    ((char *)info->name)[sizeof(info->name) - 1] =3D '\0';
-+    strncpy((char *)info->subname, name, sizeof(info->subname) - 1);
-+    ((char *)info->subname)[sizeof(info->subname) - 1] =3D '\0';
-=20
-     info->subdevices_count =3D 1;
-=20
---=20
-2.25.1
-
--=20
2.39.5


