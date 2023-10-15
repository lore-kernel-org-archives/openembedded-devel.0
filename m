Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544EBCDB493
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=fAXk75Tk;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwyzzETY9jQ6mV7j7b0eqscTYP1Ap0LMIhD9g8pmDfEdDw2YIX8yg0TNCjqSHvm/81G9wp4gl3JHTSvyilTz/Lkj9hQ4MtMktDuKM589FX5gFhRmuslgYTriwCNxoetmqHkE8fFLxzRWWeLNtnGCuk/Fm8h5pTgdBL1ufjVTrsShv9IRoGZjIYN/hh0hEzyShwP1CYfDlo8zdPl6N84UHClkmGlUUpPXlaHn0UShQ/HhbGeBoiPLwjo3vGXtzY9NolhaD8N+mVuVBmxlgVpverfVHSNXkMwA617KaQ7ilIeJGPAunt9i+ahQBQ8MLd46awCID928Ki8FlGDN8egg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnX9tAVxLp4QlhJzMxAxH/3nnIEHsh8J9yRQjoMvhIs=;
 b=nrqCFwpMQSe8oJCdT6a45vtsa18VH6Xp2JNZKvM5/Dac6lfS+mv8JQq1tHgn2gsiU1XzVG5bczN3GfsA/cGXR/PXCD277PsLAXyTMsip3OKJ9K0Ig4JuJ9lePURSRwjGo6gogYqX9JDOhFTMCqQwJLz+mja90Ktpg4HvAwh0TrizdkEBU5/rQ7/CjhHO09ayJyI2tLGLM3OPPXXMqZWLFStrF4hN8fD+tNLYnkQeSGnxm+0OPj9vOTxggULvR7hCLTndqQDzR/mYV9FHJFPRoQhWo3nABMCJ203hinaHfMZMO0yWBfkkDZzVa/QFKqKbH3tRwltbSyBhjNPGkpIqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnX9tAVxLp4QlhJzMxAxH/3nnIEHsh8J9yRQjoMvhIs=;
 b=fAXk75TkwL7/hXdVz6TxqfdmYzFTr8Gbz1qQxcGS5nHp09M+fEW4DPu5hHjmV0pe5yZMZ9SI2s9mVlYF9PH3QjouraMc6bHGce5uaU0uuumN0U1VLFMkejlEawa6Mu3X7MBMy0N0q1KPTJffAjxh9n/bMXcnPumCBio9JIqCmRaCsvpuXN1yA+U4lKbUWOc5EBtSEwFrDzg775RPPsIszTdhhSKEOzUoG+9/xcy7Y9iZJ7ey7NARLvn4Y/F8H0ONXZxxqhU+Kzn9d9dIylOvPWaXMzhm4kEhXgycBi9x8z1hUn88USJWULq0d8UAMpJVtRArwxrGemwWgo3+E7HabQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:49 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:49 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz=20via=20lists=2Eopenembedded=2Eorg?= <p.lobacz=welotec.com@lists.openembedded.org>,
	=?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 04/11] path.py: add support for ACLs and all additional attributes
Date: Sun, 15 Oct 2023 13:05:19 +0200
Message-ID: <20231015110526.53738-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6647d393-fe71-4407-eb8c-08dbcd6eb091
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nEQAHAZJSo5kyV9iDx9KBroCEhfZXCaQkiLVf1O9jUQZwaIVsiCFiaf+wrBwGSja/ZxInJKKjP6j1QTu4/eXiPW/0n7ZsgYFePOBnWJI3OIcFUopLcotU7hTVzoZ2sF6ur91BTW6oX6L+angomoFH+x9Ls3J7x8QgVfSpQ4nhhPLOYxlqwKcUNX76GtsZG7H/P5YqCliLRInoty7Y9q7zEf529gKYc7bM9ziYaCbrEsGTQK37LB9yP2t4xihRM3AoaZsLzySsVivtuhkuCc59NFrwwChbE6YjErIqUVTPxvLojW51t2sWLFWFKkpjNQ1VygKvnqae4VflPW3UbfXo+kosSfyeMkkQdvdtfmYgsQHOT3m856KCxvge++0iE/1KN1mQrlIhaKwHH+17uTbXNVL97t5qYKjrT3jok+uYm908ugy/QL1uiJHG16ziXTVWCzMymjjJkEWRCb6U3kIjn/whzUmw7+dvoo7EOvTrSnKcXLkYtDJJZ5bY5Yjix/bmSzLwyg43cFUPDv1UUySO5lo2eQ2RFourwDHn3BoyHqxiJaBau703E7CDMCUGPi63vK7ADmb/93OdfyOVVkQL0tEBL3o0BSX3YKurdigwSVr/4l+Rnvyaw3Tldkps9hQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(6486002)(83380400001)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(54906003)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(450100002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p9ZeKTIrzmWaLAvzTuWCLWiIG6S1nceTGBsacE3AWFRRQAeKrtjMKADJ5lTJ?=
 =?us-ascii?Q?X1g+rU0Hdqe96q3OEqQYuoDue01FGmMhv2LGfErcXoNwA2KLdf6rvlq9400t?=
 =?us-ascii?Q?pFu6f9e9pVBAHRjrKx3HXxpLzLTX5faVG28yQoe1txy/I5X9KHAeYCWB6BMg?=
 =?us-ascii?Q?hISDhoQEkTz3Wxp9g8pjxL545CV63X9CjzgwbTGfKGsgOZdX1QT9spuGJ7Yj?=
 =?us-ascii?Q?3ij6kDI+Cp0BMr7vXQTVZPe9CruuAtWMWs5XXdxjAdemr38c4T2Y9K+C/r6O?=
 =?us-ascii?Q?Taej/oppGZNSZzEplqpO61Z62Ex32jHY7fgrExlNSRiSrL/hWttv1fpyXC4+?=
 =?us-ascii?Q?jEQ2aQCvsb7xQ7gwebP3KIKWn+Pos1d/NpsDldOtXz7ssdESFEhFmgzvRUC6?=
 =?us-ascii?Q?4ZTFdtA9wLDtdoe2Z604HZ5xscnyUGpds8ET7yyRnn937tIdNqRH835ZUyNp?=
 =?us-ascii?Q?QsBZi6wS94vPchs6KXfWfT0a6W3MpDglV1RXuUshDjL+DgN9LqG2TFhWzNeh?=
 =?us-ascii?Q?z7/CjEa/tssAcW1wtsKy3P9fcMzg476Lm4Gjh3H/ThQoGmCfX9zyXVkBlGlB?=
 =?us-ascii?Q?Izzm/2Den/mToA6dcARQi9g7wqbVSNrfBu1unfUyiPoiHTkRQHlJ++g0bhte?=
 =?us-ascii?Q?JNkQ0z2Zymf0woiD+AiUXBWASA3fTpb7DV/6WvfuVEYtapqQwMmfDca8nvm+?=
 =?us-ascii?Q?8ewsKHR4jT2pQdVlmU9EyyVgkIIDSNGoxt8oo0MUHFnFIM4wJi4SHylidQOg?=
 =?us-ascii?Q?evMSULcJ5HV6CgD0jCYkfOBhgTrF4JICgaJ9sZpCpwv2JN5oCB14QjyJO5sh?=
 =?us-ascii?Q?xjMamtfJJ5yVImJdikfZC/KL5Wy+2Yjfi2l4d6vjd0jytImfHOs73zxzDfA5?=
 =?us-ascii?Q?/Wxwf3SU9c6FNV9E9QWDFVBY+7nEoho/iDXfIF4CZFJCotyKZCrD698PQtvu?=
 =?us-ascii?Q?HlvpDszg+6EZ2jZmNSfIFZtp5ptCpgSjEiCy9vQSqgXEaRid0qFKpA5J4z8J?=
 =?us-ascii?Q?NOk65qOF/34aCx6G4WfB4hNr2d0/NCVuVmCx21uihtstUhXyf8QkDZw6Jhs4?=
 =?us-ascii?Q?Ha2yXGyQtMkpYOrcNGdqYiUB45d1UISY0GIpQUlrZepKWv3g/YDOWGyIoz5r?=
 =?us-ascii?Q?i/Ysnau4Waj5j2y05G56g0uigjGo1bljaRwwA0FXC2QnGS2zunrJK+sYfOf/?=
 =?us-ascii?Q?nBwFPqsmgI1i9DOZI8KHr+I0UZYYntds3F+r0Tr9wjbaFttbuKSsZnKJnE7b?=
 =?us-ascii?Q?IgUhGmaqbs9Gu/JAFwiDse+R+VKeT3K8jTPgH+VX42gDa7jUxglUl8pYEayb?=
 =?us-ascii?Q?T151pxSkejIEjGNgaetsOj6S6j0fKaE1/TidWGlcz5BipVN2hdecsaHGsYea?=
 =?us-ascii?Q?IqwInSkn6kLZc3JtblJcNXL24KIn8JJtzyZ2WDDrfBb3On63EtP+snvJeZRI?=
 =?us-ascii?Q?f4kjs/gnlUJw1sK/Y5rSDC9C9XWpBF2b/Ho9/eTa5yWxALg3EBF/wUAWzQuK?=
 =?us-ascii?Q?wnnHsKW90p5lCZiWaAW90m1aDcsKhkm1j4G76PgZ1QL5JrZAR4eEJXFo2dcy?=
 =?us-ascii?Q?BN5ZfsPDVuN+4heYrcnZ1jvO6OFpotvPngqybPlq?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6647d393-fe71-4407-eb8c-08dbcd6eb091
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:49.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wg9UBRHKmGJMyuDx0yYAwTu2xlGVVxukDYrNt50LxXwLkG2eLqJJ3PC6MbjC1POURVPCZDrb7vrUXWKOwhErHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105521

From: Piotr =C5=81obacz via lists.openembedded.org <p.lobacz=3Dwelotec.com@=
lists.openembedded.org>

Extend `tar` command inside copytree() and copyhardlinktree() functions,
with additional parameters, in order to support ACLs and xattr. The posix
format doesn't need to be set in here, as GNU tar switches to it whenewer
is uses --acls and/or --xattrs parameters.

Additionaly change preservation of additional attributes for `cp` command
to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
were previously.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/path.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..56e8e214ac 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -92,7 +92,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
=20
     bb.utils.mkdirhier(dst)
-    cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p . | tar=
 --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
+    cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p =
. | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
 def copyhardlinktree(src, dst):
@@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
     if (canhard):
         # Need to copy directories only with tar first since cp will error=
 if two=20
         # writers try and create a directory at the same time
-        cmd =3D "cd %s; find . -type d -print | tar --xattrs --xattrs-incl=
ude=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --=
xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
+        cmd =3D "cd %s; find . -type d -print | tar --acls --xattrs --xatt=
rs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --ac=
ls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STD=
OUT)
         source =3D ''
         if os.path.isdir(src):
@@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
         else:
             source =3D src
             s_dir =3D os.getcwd()
-        cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source, os.path.real=
path(dst))
+        cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, os.path.realpa=
th(dst))
         subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=3Ds=
ubprocess.STDOUT)
     else:
         copytree(src, dst)
--=20
2.42.0


