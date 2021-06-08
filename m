Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.87])
 by mx.groups.io with SMTP id smtpd.web10.8446.1623128414804280000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 22:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KoExCpCn;
 spf=pass (domain: kpit.com, ip: 40.107.139.87, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3euchFtnNspV/83zqw0JUjliA6wjF20V/S3EzU4Bghg/YvXe3Mi0ODNB0GTOA1KibWKhZCFtYuvFfeixizMAJ/5VkYWHAa9Utj045LxkPjwlxkURh4mCuCLPKHOn4G5MxumXO9OantxSAfVgc1SOjXvJEwmn7rW6B175fQXKCndqvi9R5SXMmfkr32pzCicQCp5pBfp5yqtUiud40VgnGkvzZMiC8wBQSgs919OAQkYHE57HCJat0g047hVz78zJEOQZf8rl3kjBnmYXe3JMcA+ofwJl6BvcH7YRbSHBkOfIYqz2RNX/ZtYKUu3Cnct9usnwFNzeIL0PDaGHsuVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8rTYnKxu+YgSZby4o3PPm+/9siIhkNfI/cca5kXbU8=;
 b=eXYVjbMl3WWvsXQBAEKr0/81totNjsGf8JCsc90N8aaReaS33aOEmsubqRrVZryNG/Ngycz8qIESHYQpvWQMoMdzfHuLU1iN+9aNvYeQ8LFuJUBODibHCyLkvEnYZMS4yOPUx4FoCKfi3xx1E3UJtJGqKu5TyHZj4P+VTOyLqcJH/+MnYU0WIUGufUxwcdXy6AWURzceQ3FFBq0fdBj+R4a2CfTw62gU/p5z2iTKaz7Xu/kE5C/WVsfvop+tvDoUYZUCpLuk1Oboo0ydUuSbVGTSQdi1SRR/4qw2OrX32DI0Ud+D8KFc7QkndlmtO95Rz/Y5EokeKj+ZjK+cc4D8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8rTYnKxu+YgSZby4o3PPm+/9siIhkNfI/cca5kXbU8=;
 b=KoExCpCn4E+4tELDeo1C7YD7Qg0cj20CTKYR/jWo3qJVU5jVz38OtC4xCWaToacXsJXJadL/k3tcZ4TcV41yyk+q5ujKotrSSqZmF5kRkddpyQuSRCqoyZNQv/UPNzr3hzB7HETmiYqgwCP9whesDI/bd2KQIhlXd/74oPGMKcY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN1PR0101MB1743.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Tue, 8 Jun
 2021 05:00:05 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 05:00:05 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-gnome][dunfell][PATCH] tracker-miners: enable ffmpeg dependency only if its whitelisted
Date: Tue,  8 Jun 2021 10:29:52 +0530
Message-Id: <1623128392-11648-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: PN2PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::20) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by PN2PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 05:00:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f8a86e-68f0-4427-3d34-08d92a3a47c9
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1743:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB17435F9EE6BF3ED69DB2875E8E379@PN1PR0101MB1743.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zyzSDfwuUdQWqgy22afOq3Dqe1kpEP8JPR9DUQkwz43RD44qzwG1RcEawtj3Jpxz9icCzfUjvVyL/9Ikn+X48/PXHMG8LHfb5EtOnIP2Oc2B7hFEjO48FPQRgoGmtSe5UpZu3fzeeiRLxfcJP67bwobOpTIdo7GancYS/KnnEyyQ/grgXGHpEOhq2vA5XPh7XH+0gK7emHlMk9U1L8eMCB/cri9uL8x9wfk3VSur8Bibce5zXy2ykFbF5hePsTAuJSjiNyb3gSbDQ2r+i6U/p5Pimt+BZbCTtU8CkKHEbw7cU0Tq1phpPc7aDcFqyefL20fd5jfE7KeEIsyG1WMjMs/neTalUELmDtyI5VXlWTjPWQZNXQnfoewhXJkes5fuEk9l2NYkL9vus5sbeGvKKP8VGxLIQkKYjX/vZwBOFiZJXDmTXJJ0/0XdJ2JDDx45pzqCN9Pb5ADW422GupYnQmUV0zL4NC4lhUMQKqDWcYerF1iVptMumcyvo0owH9ZGfDLeuG6llHSgp+U9V9hrZVvayw8VwCzFbfnrWFi3f6+FvExy/mqEcaZKTjf8RJ7osMP4ceoE+8dsScDIh+Eqc8NNTx5oktuZUuH3936Mqy8mmxWAaY3c5iHjCO2EcfbdXOhZVkQb4G6cW9WgCtTkqSVa/v6i39UKdqpHUjzfGr4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(52116002)(6666004)(6506007)(36756003)(6512007)(478600001)(8936002)(66556008)(86362001)(66946007)(16526019)(66476007)(2616005)(4326008)(38100700002)(5660300002)(6916009)(316002)(8676002)(6486002)(2906002)(186003)(83380400001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZQBZdfzjyZOHHr5obq3kOh5qCN3yuFIoOAfn4YKg4OnXmUYjXYYeGWxOniu4?=
 =?us-ascii?Q?ei5TFGLTmlXCUxGZuRo/JzOK9P0sdy8qfQHakn0v0KMztKXtg1ox53Af71kk?=
 =?us-ascii?Q?8m9cZn6rBJH9/L+N9FgcuRMcbb7rtIWlxAFwPLoAvZjEcvU6+NGVTpz34LRP?=
 =?us-ascii?Q?U2GJ1P8x6wqzbGiSYojNl+SanA8UvAvk9WWKSfuyT02FU38zL5lY86olpOjj?=
 =?us-ascii?Q?R2kpCvOLxsTtxQoLRJ4GJVfIsD0Hd58EvIHK4iHR6bNaHi4r8bmyNECKX/+X?=
 =?us-ascii?Q?6nXLJGTebPr8yynPJo7Q2Ade1F+3HbQa/W6LTyQYNM3y2thoypZ21NHcuKFL?=
 =?us-ascii?Q?dLNIbS27xIt5maqeZLYqjCxyZ0Cuq0xoivtiLq/SPbgKrelNldTerCIGiUyb?=
 =?us-ascii?Q?yH0+buAl8umGQKqooOGwvGYefDNTEY3l1650c/7nnGhW6f1daZZy0hKTVZOD?=
 =?us-ascii?Q?ubMj07dM0DKiFIPpwTVH/oYKDWUA81X4QNK+YmsLvgUpF9fbXIbQPkKNHlQ3?=
 =?us-ascii?Q?ZsXOTOgBWpLpUoioVodWlJ11Jq/RtVfCdkE4Q68N9SndMMkl3t8bKaWFonUm?=
 =?us-ascii?Q?SCI//oo+WVi5xcCcCEp+HXOuNIWnIgz+RFNjYEPJthttQa/ndg2VoL+xdbHb?=
 =?us-ascii?Q?u4l+6Fl6D0vVCozNm3VZoUbI7yHO+lt4qd0U/FhxHF1Xw8AG6d3RleiC0Ja5?=
 =?us-ascii?Q?xdHgnK1agKKtn9JMPK62pedy3Cp0rhhXk0HP9mjhzOVZiki1j1x13oCdDHh3?=
 =?us-ascii?Q?ZCAS3k+F2IEiefWD3u3xDV3/ZzlgdQGXDIL3/6j1/czGeHACkaw5BEykH3J2?=
 =?us-ascii?Q?Vubjoongx5nzhCCVfIiTWmzaILE2uOBqXmg6b6fOAYDKZOl6sAOFacN9aDXy?=
 =?us-ascii?Q?pymLwJtPpMnR/vWaeBBDwzy+LTN/h/CvdQJLCIcrPu4Fts9LrgJoagy+BU6p?=
 =?us-ascii?Q?VKAMZNV28gIrlb8QdwXFn/4LADPRGXWW75k0r0pIILEOpVsVrqRHQRy2xLws?=
 =?us-ascii?Q?/54HkW5NTbEJL9MpB9VvFpSr3XnTIrO3f0BMmqse+uXqDB1u8ZQeGhClPzJg?=
 =?us-ascii?Q?FcLAOfon4DNdKgrxsYqdQqqKTAID1x807fNLwGl3bVwRl+/yOQcPX8GtqP+q?=
 =?us-ascii?Q?sXQTRr26jQbEtmcevF6TZWnLhcEWFRO9EkvpP/Les1Y8FTKgUZkom5Pwj4Ou?=
 =?us-ascii?Q?8TqvJ/4hyR4Xhym+Pgpj0JE9jb5t+u0VEctF7JBtf6ksR1dEk6uZKNVGhfZ0?=
 =?us-ascii?Q?YX78852V1GTaupGhNoSwk3G6yTiF5NHyTRcGE/BjAswczB/cWy2Q/EaFGZuk?=
 =?us-ascii?Q?ursskBG3kZ64uRtYQW2RcX57RQwwjEjDVwU18Qoixd3zDB38H5ccu+cTKapD?=
 =?us-ascii?Q?TEeuuxMIt0AEBcdLmKK+Vo1/1Ufa?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f8a86e-68f0-4427-3d34-08d92a3a47c9
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 05:00:05.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hH0lBd3UWa3c5DK3q9ys5vgf5VczScmjLgOcFHkSf8uFZGOqa+sGXxCxi+fhK9d3TBRMF45mYXTWGgE5P8JKmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1743
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

ffmpeg isn't enabled by default. Fixes yocto-layer-check error:

ERROR: Nothing PROVIDES 'ffmpeg' (but /home/builder/src/base/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb DEPENDS on or otherwise requires it)
ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'tracker-miners', 'ffmpeg']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
index e2ced39..ccd22a0 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 PACKAGECONFIG ??= " \
-    ffmpeg \
+    ${@bb.utils.contains_any('LICENSE_FLAGS_WHITELIST', 'commercial', 'ffmpeg', '', d)} \
     flac \
     gexiv2 \
     gstreamer \
-- 
2.7.4

