Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CF7C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 10:01:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.99])
 by mx.groups.io with SMTP id smtpd.web10.59924.1707127309954435535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 02:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=No4Sl70G;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.20.99, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhC8MU0EatcKvKqcQQ/YdddboDa7+npC1soZRocc8HQhbPv7vK3x+iTenmpLoTntfphvipUYwSrrMAnR/8r3MUhjetJrtZWkI0VzJo/QtaBhrshJMVwjDBzFcodfsGYbGcQFStac96BjIAhK1SKJoqgyedVjsJ7EnOGOd4Z6TXkYpdpJw0NEcXir++g2Ug2rZ4/RdhrvKwYNj02rvFYDFkwviwBWeBinSo7/HT71BVqjB7poMcOrNfRZt2i81jPwMhfXr0iGnyKQ0lcig78uYbq5//WxhKIDAHlu0uloyQq68WPlP5AAvFb8JiUFYREeiAHEijSExUrrQusrcSiuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvKd5GKRRpp2rwOtauBhntP6uB29jtGN/OmwTvVAzYc=;
 b=JF1URa5eVSDlQCZ4zSSJIwhgxkDXCIzw/7TGGAIck1JwF0PuU+BY2y06MQ5eOh2bXt1vM4c9zFGL/7SCX1Qvc37n56SJewUMYlf50VRY2FQ46O+XlUl2a2KO5LBLVIU+YxsWqlNAX4JypBXhMj8brfeLG+8qprge62etmEEqEO/4dXEkuswC0aMo3j2gYrPjZVfD7zRSyDPgZlRhvrXZcY5MK+a3g071g78x09NDOZCpvGwPP1+js80X/0Hzqeo7R6dffE0PepyhXT3E2lnPTrnam1CY45kIb74QWrp207Wuy/p7tAhs3j3uoyHjEtVg2L5KONLwUqBtS1Ag92QEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvKd5GKRRpp2rwOtauBhntP6uB29jtGN/OmwTvVAzYc=;
 b=No4Sl70GMFM1xWu0b4ujNmRHYQPgV8eieuR36MkhLEg8XWNNS8hDO/LIl483tLC7ZIKCvU8B4CL4Z2v6WTk2gLFGMDmt0/C27wpw0OXq6J1mvkg5RZb/zyWbJ45y0xdTuwLXU4y8DSXUfDceGcr80VH+h19N5WyPRMVz47N2BRhmxiUE/d1bFSaN/WxGoPN4EpbsCNNkYXMhrLBcn9V1GYw/wn6ppMYkm/s/2AiyBRgXKvP5lH7DCkbMlWLUx1XOHgN0QZ1aN3Ap6iwCPcRZppInn6TkfVl4PpzUSO7YIN9EWZTH9auzknmDGkDXdfJttQoZphDPOx/HDZL9k2lsXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by AS8P193MB1797.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 10:01:46 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::73c3:5c8:c1de:ef5e]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::73c3:5c8:c1de:ef5e%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 10:01:45 +0000
From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
Subject: [meta-filesystems][PATCH v2] e2tools: Add tool recipe
Date: Mon,  5 Feb 2024 10:01:05 +0000
Message-Id: <20240205100105.4053-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0458.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::15) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|AS8P193MB1797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da4dacb-24e4-4dfe-95a6-08dc26317629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6hdvhVty8vHHrQ/hNEmj4ThuIyM2hDY7TBbQzqojxchiNhJVePiZggWxyd4/MnmSGZEtQSas9ELVfnf6HZW+cvYSeWSETv1kCOqmCzx3MNE1d0g+i0wrv7MVCw2kFU6W7TC9Vzd2RTvAI6tmvu+LHetqO/rG8MRNWssuBHJocEj9J11LblZjw6szBgSUlZpGtZXKJB0PtiHT7M+rM9ETl8h7ErCDY2cnmps7FeAamYNZUzpUKquMYHPDf3gb8Q70lGVdJsmQfgi6F0YZ34I+7+GJ5gC4j2SNyPcUeRzQC56L8VQo+hO2JEnd55JJCxarZBpODkUnvLD2FwqDB6LqmGp+3KZyZv21V4zG92LuoWPplwCQHGyRgwRVaGOgpocqkDOjwnmusCfo62LQgM905sNoIMqbVtyV8ALAo2LSAz+JTvj2wf9WXuwakduWy/e6FnptJ+7jp3ludNx+hQY+ZNbsfo/U8JJ/BWcXPBO49J9sZp3KiK06TsTQDNiK6ePyy0I95v+/VrlobZrOaLe81QtVVRtWfOepx9iqPP4sa/S/kX2lMVmiPhYLuBPSpu7lD9NMMR/LePqHtgGLbh8x0VqmrXRq9yJ+BT/lja/If1w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39850400004)(396003)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(86362001)(26005)(38100700002)(38350700005)(8676002)(8936002)(4326008)(2906002)(5660300002)(83380400001)(6916009)(66946007)(66476007)(66556008)(2616005)(316002)(478600001)(52116002)(6506007)(6512007)(6666004)(36756003)(6486002)(1076003)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nEqzNXHLnzquRVRtsyDqXF9Ej9B/KfRe07GSUbBhc88MgfMOhyHezlxS4j+t?=
 =?us-ascii?Q?PDe4TdKo+8bph/nZ546m6P9pIzrxJHJ8WbNGtJ5KgcI+jrgs/NKlSuBGSQVy?=
 =?us-ascii?Q?CoHDm1G7G4a9TcfdYQ/iFsYaPoFy9dFOiS9M0/Ilm64vwqi24EXw0fKYkDxl?=
 =?us-ascii?Q?kxnpL1QlOsNJne888Qxk1wgKEXzfYFNJsqOb0REiUF2Rb+qBcaHYH9T5DGLr?=
 =?us-ascii?Q?0VOhPP+Saa3AD3pv0KyNOITu6RUsdn7jzPev99cLjjC0q96GOPx+onnX6POh?=
 =?us-ascii?Q?8bqNSqn1UdOFI/5B/qzVVY6+Zm3u3a09ud0nHBzYuUD0vh8Pu5eKte2uKVha?=
 =?us-ascii?Q?GmWywBGX5vOd8raci5XhBdJ4FPJkjV+LPt++a+8KuQUlcHv20k1IE7Ybcg+r?=
 =?us-ascii?Q?JDdRk8vF6mHIDq3M2xNNzorKD5vzL1Jcch7ycFkj18oNRn03fe7J44R51jYA?=
 =?us-ascii?Q?LSfN22QuQ2IwDcDLYYPldesHZO6qy7R63xZfZrm5w9lGNyf+x45xfiH6UasQ?=
 =?us-ascii?Q?WpCxOkegqNtGLBUpQ/Crtu+BtYPIaCZReoHAnsIFi4m9N9xJA3dlBrEtux6l?=
 =?us-ascii?Q?NyczWSPxRXv1IUAzqWoqKPpEq+DQdPPM3UmwP4pchI3iOpm8Qxvl3gAwhbX+?=
 =?us-ascii?Q?aO5UxiWt3lLGx7KE33r3eoiiDe/bCHX1FbFz8suMvg/GVlI7qG3aKnmYyJwc?=
 =?us-ascii?Q?dY7uhm6vG1VbJXxHBWZEQD2pbRw5ccoz+9uWkrjL9zyQU1IZBDCzGNsqppMe?=
 =?us-ascii?Q?DsCkmAqzvjxb8scWNqnFY8Cf4ayHTink44QEwFh3tZaKj73/bPt31Ugnna7D?=
 =?us-ascii?Q?UX9ysXS4QUrazS8P7ZRxbI9SUfFobEyCjRCoeEjdwmHeoN9xVB9EBSAZr6Wl?=
 =?us-ascii?Q?sCXIezEMP6UUgGwsUw/LhM8r8EZynL96059tgIazenybtlJfEN0YYfuMCc4b?=
 =?us-ascii?Q?N31cBp/3vx+lzdPwkte1akePeFH2zGZEI2eqbmmuZ+94fYDBQglWvvnVgQVl?=
 =?us-ascii?Q?PpauyBTir51h9uYXE3024WctCItX/9wvKBWWGAQvFVx6ooz3V0CvmSmyyzjA?=
 =?us-ascii?Q?I+SVgWMEl1Y3DeSHT2EDVPDzKJvB+DuRhySD/KROsxi54gzbfW8wXYdS6G5V?=
 =?us-ascii?Q?TvXl3k1aSYtseiqr/4KqAYv7ks//Y+KVTOI0/4eqF83pYh8bzfFjSZgCBMd1?=
 =?us-ascii?Q?wOWiS6GpG2qO7rTFKTyXv4ynScUsfb0DAaW4BxBDHa3jnHXMwih5GSQDpwm4?=
 =?us-ascii?Q?qMyimXqgQ7sJvPTs08B+PYHO3eY51ZGlfEVJ6HwUKt0Radj18k8IKz7k8NfD?=
 =?us-ascii?Q?By+XK8kII0dKsZxVlGJ0X8z6pLX73xNImkA3Bm0DEwwM0i+tEcJYsazVf3y1?=
 =?us-ascii?Q?zISXL2pcPSKNBFPgEoWoss1R0N632AAHodskBueTMHcq7q+Sn7IZs8EHtTOg?=
 =?us-ascii?Q?S5r9vvOteOpG8fqQYOhB2jk9QFmMRQ6go9rAhGRzNSzqEO0INGhkqCI16KSu?=
 =?us-ascii?Q?5Aj55UMTsQBew+TocQ0/GfA9aViq7KFzCP20cemLTZ5AsggtD1rWLOj/1E36?=
 =?us-ascii?Q?H2h0MeasWdbiF5/w9rpWm+vk1a80zf6zEYbAmFoJJFnGf19I6ndzXpP8PFCX?=
 =?us-ascii?Q?wwT1Vfc3gZxTjB9/RskA4Sk=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da4dacb-24e4-4dfe-95a6-08dc26317629
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 10:01:45.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNErXdwDBt2XuYoJmh7/RFQbrb0H5aqk0grYi0Vy9vLaIeoyrLRUiAllq2a0Wvmykm68Rhjp+AshmFV461XIvZwMVYSIUJKMZiy0KzmJNa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1797
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 10:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108564

e2tools is a simple set of GPL'ed utilities to read, write, and manipulate
files in an ext2/ext3 filesystem.
These utilities access a filesystem directly using the ext2fs library.

Signed-off-by: Angelo.Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
---
 .../recipes-utils/e2tools/e2tools_git.bb      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/e2tools/e2tools_git.bb

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-f=
ilesystems/recipes-utils/e2tools/e2tools_git.bb
new file mode 100644
index 000000000..caf0025c8
--- /dev/null
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "Set of GPL'ed utilities to ext2/ext3 filesystem."
+DESCRIPTION =3D "e2tools is a simple set of GPL'ed utilities to read, writ=
e, \
+and manipulate files in an ext2/ext3 filesystem. These utilities access a =
\
+filesystem directly using the ext2fs library. Can also be used on a Linux =
\
+machine to read/write to disk images or floppies without having to mount \
+them or have root access."
+HOMEPAGE =3D "https://github.com/e2tools/e2tools"
+SECTION =3D "base"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+DEPENDS +=3D "e2fsprogs"
+
+PV =3D "0.1.0+git"
+
+SRC_URI =3D " \
+           git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmast=
er \
+"
+SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND =3D "native"
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

