Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C47C67871
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:45:20 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (CHE01-ZR0-obe.outbound.protection.outlook.com [40.107.24.80])
 by mx.groups.io with SMTP id smtpd.web10.108709.1673368727703835055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=gIuWeeq8;
 spf=pass (domain: spinetix.com, ip: 40.107.24.80, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtL/hjpU8dVFxggF9Ue11NHtW0OOrRzlBNA98NeZh6QwLnxNboCae7s4rD0iGAcE3Lpgg04ctaR0uHd6W5r/pNStj3TT/p7f8n9Sm2hZr8mtxArQyaJYptbmnY5D9lZoTaY9vquivBMpyTcaN7Dtxd2yOPzoBH5DdXne6oVjsKTtSIhKnzC+ajHU/UZDJyNN3PL+L1yvfvYbeVRfSpC2EyT8lwB1PG4rtNiRepAelrYPfEVtzxHwcr1IVWEQGEzACjYDY/X4MwDNex5M6FBe0LwHrRHd+Svsthu7oE2QgE+fiscXodskwqSKRAJFdBar1L7lz3pPMg6b+7MK74e4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHU92hlU7ISfYISuMHmn0q+Fb4QNiyRwm6Zl9WpAIVI=;
 b=ZHm1nL00x8ySFKiMvooi5/bwO8MSM+NaR8bu5aBf8GYWcBB7w6e3p/F5/FX0rnQlj8TqRSPZ6qc7D6tMFU2uKyj5+J/QjHXkno6r3ypV2Z8XOv/rlpxUV1XHNjChhJG0uF4ya7LbUQB1aeG5qv2CYVEIud4Yeh1J2FhBpX5ZC2Vdhm/q53Cb6dm3MJyFHjIJnKxiHY7aUwr5NlrVDk4kC0XNIergR7a5F6AMGYRVU9LNg8V8VB+5HDkTY3Fn52zBGVz9gWSQRfisTHRjBMByRLk2vxtkelzoFHwcbR3dJEuO4qsbxqO9wEgKhApERfn0Qx1d6kHAtiZGOdNaVHzeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHU92hlU7ISfYISuMHmn0q+Fb4QNiyRwm6Zl9WpAIVI=;
 b=gIuWeeq83FLHJr7OZaGV+qVthN+op+PsKXoyhhDGIWmZWJ5pcY49SERTb0SR90TgbJHzqqFbp7mEQOvdmnCMj60lc3vmTXR8UU7yAKWJ8uWngmoQg5Gsllps4sJdl7eaGP+SlzceEssACbCgQ/r5z0GqPQ9OsvjafMdTfQ1J2+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZR0P278MB0845.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:38:44 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:38:44 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Valeria Petrov <valeria.petrov@spinetix.com>
Subject: [meta-oe][dunfell][PATCH] php: update 7.4.28 -> 7.4.33
Date: Tue, 10 Jan 2023 17:38:01 +0100
Message-ID: <20230110163801.13481-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZRAP278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::13) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZR0P278MB0845:EE_
X-MS-Office365-Filtering-Correlation-Id: 5585b38a-19f0-473f-e18e-08daf329239f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7JbgfVJI+dZDOVnGwnsAOOlfBfHLWOC81CpUP5MhFDNpxYKjkj2dnxyIPqFUIAT9sAvux59owYYEP2+eEV+jTzoFDP4lbP2qGb4Jb7Qdk5iyVij28UJTO4KmmkyAv7Tm8t7A0QAGTsG46U9KydSqFKuh/chQHXu1QloarAshMLGlkmNrv8cyHgLk3k0DzTzXkgu37xXmRh1jUs5sgoGTQ0URVM4KRH0BAzyLJ4Nf2O+95QVykmNa8+jhFMadMQpGmpUoSpiSWLePEhdds5T4k9ppsnbXFt4zyRIRJzbb3tYmqVNGeKaKzqf5veRmaX8rgeIPU80Zk15ON9FgGLlGTgJJSU2JlGgH8ve/usr9R9gDZJykBC8xitcbSbm1C+gEdqXwYFtYoJY1fa7PBwkZIPn21F8obH4Txqgm9+jvOHnmwIgEdxcM8GEiUfg8s8XPSZUzRGNgzQGaXXhjx9Y4ci5IrLpUBMZdgdI2zEpuSZikfBdXSCKK6bGyNSGs7QxU0XSQ6ST1Y33ysxrAxj7MZvTC9ukaJ/aDYcJ+2+8OeL5kjCh14f6O5baV/LO6d7w56bLwb+EgiDI2j9kPj1Nm7V3dUN+fGLg+ZtvsJ+I1K2rbAwILDOkCHkRVpKdZWeC2KKOZPMDV2F432+lIzH7Yio1NXGzDFieMFNN/dNcD1DtIfw4w8zUWTJkb5PZGd5/Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(39830400003)(376002)(136003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(52116002)(4326008)(316002)(6916009)(8676002)(66556008)(66476007)(66946007)(44832011)(15650500001)(26005)(6512007)(2616005)(1076003)(38100700002)(38350700002)(86362001)(186003)(83380400001)(107886003)(36756003)(478600001)(6506007)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KbXVnGH62tP7O8Ntqnf1zMbfWhczkmDEOqeEUvpudQ4H3yB0knwGBsnHIb7m?=
 =?us-ascii?Q?sMZZOFiF6nsVRvgjMcVHlDU0JbxKaxYO+SSatLoBJoC4+DrAWb20Jyg5OnYq?=
 =?us-ascii?Q?SrXzdDN+pX6Xjy5vF/AFNjAIuo/fVf5yAXqlOS9D6RIx42hg0BKjEuwABvEk?=
 =?us-ascii?Q?Axf+GdI/B4NMIY7bdnJbuCsUSYZ/kHQnaHdv55GGRwVwlT9R0V5OKJtBiFOf?=
 =?us-ascii?Q?jEDfxzZTT0ZLoAdGMDkq+mBL7cw5HJ4uBiCVCwZkXEflUnQibezUjX0f8vdJ?=
 =?us-ascii?Q?U9t9vuQ51bf/P8qEQYTwdY1gYVtRaS6Qafz7UNhaAMd8hfZVvPUYYlhOJctH?=
 =?us-ascii?Q?OxS4ju58jwFICa+dG0j+RDeFwpMnxMq+bpIZ0lIcN3Vzl6osJSLtwcGvHD7X?=
 =?us-ascii?Q?afaZ+nAI6nFx2JqDn0KwwcIDTVWTYqu+I5iLtaXzscyL9ufdoX2eBlb1VnMg?=
 =?us-ascii?Q?8KKAbhgpTaSJZ62TAUs7MzUBSnrMYrYL08Fzzw4vQ5+/x+0PkVKpqd4INYcp?=
 =?us-ascii?Q?+MsraLz2FMTpFLq9hs4l92Jpyh9xgq9m+gUqPrsZ9LA3QXgDAnAmm8Ezxg8E?=
 =?us-ascii?Q?5YouBqUcv4eybMPcmvq4zENTHia8H/4ceCljj8P0XzumxxqDv/3QBlsCt5P5?=
 =?us-ascii?Q?5O8r0kFqyj+9vylWXUqsR6Hb9GZbJz09Es+XGfFWg/zgQ51wiVySgsfqsbVG?=
 =?us-ascii?Q?N7XvjKso2QkGIwQGeFqCGgsoc6gF4biS2IqclCa4ykKuMYsoJ+ydSLGiW+yI?=
 =?us-ascii?Q?r8viZfYSI4L2uBgJ3skW0olY1RumMM2oE0rCTVce0uco7Bfcqjdz+c8kv0qM?=
 =?us-ascii?Q?8q+EWt+MTZbpB+BNp9apJ0dBdrdH4J5ki0l8x4Fv163x4i8aV8xnb2JS/zkD?=
 =?us-ascii?Q?mB+jEir6cAZF6ePnczNJOxFVE8eT/6CpICQIx97BMMBpqtlIsnYxj+kZow5v?=
 =?us-ascii?Q?XpAcKRHIV9k+n8wWkDaNn9ey+kClX/Kx6euZgiK8QaswhmvciNqj7AbbarqO?=
 =?us-ascii?Q?p7Xdsw3LHY1zGV4e1YRUdLMbd2SzpAap2TkZE1JEQPCJWP1oWyfwD53jSMi/?=
 =?us-ascii?Q?OB2P5fqmUj0D2jjol8ECPi5O1NOpXQbcehAVCfs8h9jJs7RqyiJgmgHfNiP0?=
 =?us-ascii?Q?YH3qzwsedAbI1kFYmlXDmRmkg8kOhV0cuLo7dhMNCJ7ObTFd0VRC0A9k19tH?=
 =?us-ascii?Q?GFZxauoS9FcsFfaCZoGUnhX5/WguMh8AUk0ydcNHSb9mpgRsv8/dhTfaH3I+?=
 =?us-ascii?Q?rhCi326xooOS66DloG6HE29Yit/ar58pWjajOD5+VP7/AGlrBAB8M7yhUGSQ?=
 =?us-ascii?Q?1pJaWBlf3OeEh0c0oT9Ew22GcxBPNlTwZcmVTV08/XjvyuCUnEEDQfokTHOd?=
 =?us-ascii?Q?u+16unMrKS05nDBHsfkDt48g0kNd8+sokMUHAqNm7qGAYPbzV74vBhnlcwNG?=
 =?us-ascii?Q?nTybGSqpTom+liVJNsVLQEEHeq6Nhc8/pHpilz1/AtWHMp7UzAt6jgGtAif3?=
 =?us-ascii?Q?Z8QRgUIdYPfVA2hFDoXOnQ9oYwZc5yOcwEAralMtkTuev8MbLid/0YRAM9lZ?=
 =?us-ascii?Q?v6ZSM54nONnXUQuw7Ba70r7Qptx3ZWxq/5RYeXxYo8ZmJAySvZny9FQ6xldG?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5585b38a-19f0-473f-e18e-08daf329239f
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:38:44.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irnLkJmElSz7MFPq4LU8z8kBGhKCr9BXIwAkBS959d8DaxoFmAN2Rnlhv73BdOIW9baHkb3uTc1kjvzKY6n9NjPygA8QVMS9dR+Pf0RPwrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0845
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100549

    Update php from 7.4.28 to 7.4.33

    Fixes below CVEs:
    CVE-2021-21708
    CVE-2022-31626
    CVE-2022-31625
    CVE-2022-31628
    CVE-2022-31629
    CVE-2022-31630
    CVE-2022-37454
---
 meta-oe/recipes-devtools/php/{php_7.4.28.bb =3D> php_7.4.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_7.4.28.bb =3D> php_7.4.33.bb} (99=
%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.28.bb b/meta-oe/recipes-d=
evtools/php/php_7.4.33.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.28.bb
rename to meta-oe/recipes-devtools/php/php_7.4.33.bb
index 3970ce097a..caaaa23426 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.28.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.33.bb
@@ -33,7 +33,7 @@ SRC_URI_append_class-target =3D " \
           "
=20
 S =3D "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] =3D "2085086a863444b0e39547de1a4969fd1c40a0c188eb58fab2=
938b649b0c4b58"
+SRC_URI[sha256sum] =3D "4e8117458fe5a475bf203128726b71bcbba61c42ad463dffad=
ee5667a198a98a"
=20
=20
 inherit autotools pkgconfig python3native gettext
--=20
2.25.1


