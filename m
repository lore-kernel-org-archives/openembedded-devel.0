Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A3FC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 11:30:30 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.89])
 by mx.groups.io with SMTP id smtpd.web10.5556.1648553427697598257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 04:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=CHu9cnPW;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk+yzVU5+UWqtllwjGePhvg0hvMobODb1nCO9Xgnn4EIuQ24fdN1PQ2ZO9YDLN10CgNSdG2PIQVK+IiVuCghaaWxGluwPY+8Tg7Yij+njcqQeWf/+4d/npmPHCMWyKAPsiEem7FgNRIrwyTNWNp9M8/XvWnfmzL3l2BLW9ik7sgKwg5W9KNXIMnN4LIdxtfrxbE8TpsaAnjMBn6IBnSABdNWN6wwiVEU8H+diXUrh6WebKxCNwUnHlPDjVbhNw/+F/9MXrSxkplEtDitfni9TfeM9YZs5b+fEiUea4OBBvJLcIcYDsQt7qCdqqh8NrVF/UrA9ZSEQ5bffY5njeZP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xan/gzV5YRK+1gLUflB4NUPqz9iclq8X8nqyEX/rBQ0=;
 b=j0W/BAWkP76wNk70a1EpBUqYhBN88vc22Zgim7iWccVG9/vZYO4b1Q7QSRUVofCy7nTpT4oWw9dE/KdofwyDQkZHjkuPAVkq0L+kbl6Mpd8vT3Ahr65dynTZ+3UGFAKIivod9XFFIaumQu3ztkslTDkQ6gzt1hzLfYWeRivDv0AYVxLACSDhxviWmdfwdYYQDs6AIQmIctTrS70SfEKuv+swtgmBauKpXZDA2bzVl92fn0PPj6IFhdCD+p66082E4TJcprw7AJmOFGWBB/O4cAia3jybZm78MC0sKVL5l4eA9/QQIEID9AA/J3BHdEO48Nq3mHd9dIdZyphq0MAdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xan/gzV5YRK+1gLUflB4NUPqz9iclq8X8nqyEX/rBQ0=;
 b=CHu9cnPWGbzwhTY1UQSmI09Ec9kVLFXYTjxDpHw8VR+tccww7VqgEnZd5HvQPz5RWYF1ZfvFZ/T7T1vmjID/Z2L/p3ErAN4NJQ10KSJQzLpovlLAHp39OK9C5CqQNgHp2hrzAE6/1LNHV5unzd1fvO12izTOuNoPIjsJh+6YINY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM5PR0801MB1827.eurprd08.prod.outlook.com (2603:10a6:203:3c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 11:30:21 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.022; Tue, 29 Mar 2022
 11:30:21 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] spdlog: remove header-only leftover
Date: Tue, 29 Mar 2022 13:29:56 +0200
Message-ID: <20220329112956.2752-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b768a3a1-fc90-4909-7926-08da11778261
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1827:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB18274A47CF2A29659797DF8ED71E9@AM5PR0801MB1827.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xeqVpPsYP+p6kObD2Dyjhcj0U/kdqWmaFYXEBf5II3GvIB1BH1BnV4D032mMPxGSxprR8Z0k7Ndddb67iNZLR/LTu1u4uLW4uYFtZWcLe2taBVavlqGTkuRDSckdEmmrIbreaJ5RJjTl7Vv9PooPd0RaHJ9DSkstuBcgRMVxTIGu+ZDn1DG9Vyfx1ldQYJsFMWj76oDfl3p3WhOm4PLq2+/ql/5X0Sn7pwPP7r72BRkJrq7/9RHpHXw5LGNc2P0OhkoNZ5Wo9V0nkZBRKyNOXTvXc/0StSyL1+8n5FSGxvSSSXqbarWezHeM/t/Osy5u4pD0TSkBa/TzWPeHiPmkgBXZ0onF3w3YSgVXJGiZXQGgixygEx0eswT5CrMYObunbjWWy5RgKjsaifVGUchFrZ5wJXBniUDE8JL2gzaFoep0eDSoBfT47W5FMQUNbz7HxLKGA6eVeOB6/zJNzvQKAHtSY4BQw9DZBJ9IlDzFNuOVOn6vtV1Jyu2CMc3GDKwcnQasuyWe48bAVpa/yjt4+e01WsoQ7tyFp4tXOi5ROj2z0feRjAwr0LikTmonOE+ThRbF9ZdqkWNjCpiEJUU99D1xPKbxmMwKDfguVfuLP4NreneJ3ZMfUoxNbDvhDanzwJDY5uitQSbs0rnUg01TPCcBP0fPxXvha+nNvHpnqGfGZ4fk0JXw9sGZsv7MAHetg3IYLqxPzq7FAx/KenasbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(38350700002)(316002)(86362001)(38100700002)(6916009)(8676002)(4326008)(83380400001)(508600001)(6486002)(66476007)(66556008)(66946007)(2906002)(6506007)(6666004)(36756003)(5660300002)(4744005)(6512007)(52116002)(1076003)(2616005)(26005)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zobe1FV5qPHg1DrNmGxL1CFVxAHxbXiraL56xrsaynXugmNzQ+N7HHqbJNMC?=
 =?us-ascii?Q?71dnzNkbPM6W3B7pBmNEJOq6Wjb85lYXZFnZREv4nZtSA8yXGA9sL7AcW1bR?=
 =?us-ascii?Q?BODWb2lCzM3eG1It3bGZIxbA7tLM//5oRmtyw3aLhlVJxPz6M8botZX2xvYk?=
 =?us-ascii?Q?e89GAjAmouKgNWSdfbExZFR8bzbvP31D75yIQUiqGGAW/7FNemaLl4MJb1ny?=
 =?us-ascii?Q?LYwz1pBDgsm7dwwHdBghZ1gT8PR8TQUQRfYbCxKKKNQ9Z+FcUEgrKLp9MvD9?=
 =?us-ascii?Q?YEJbvqdhRqdGWUHRnHt3Kbwy+axK6kcIYGIUPvKbbBDLmHyz3dV54d0roqpT?=
 =?us-ascii?Q?O4R1btWOAKkCUURba8DEvcuSfsq9SwViVmp66zKSSxvLOXOCqd87fpSLoIjy?=
 =?us-ascii?Q?G3Q61vaWCy8RPw4WCyTUaDzY0wBYCP81EBdkJwQYwteZmS3XCbM60KVkB/Kv?=
 =?us-ascii?Q?lqXfcZ9zI5gr4RKeLwa++sQ6aviLyu5KUJFurIXfhCwMo1WtUm3K94tivvuu?=
 =?us-ascii?Q?BKm8Z/6a0LlOO0DJYLnAMcRaPn/d1QXnsyBPuacE9x/HaHBNlmS4Z67bMem6?=
 =?us-ascii?Q?YfjpXsKghAeL8RbwoJv1jlsxDQbJkvSCF2f9cwdNIj+QInoN55jhncIbnG7V?=
 =?us-ascii?Q?D/vGdmFbXMyD3pef8qv2hTE4vitCSoFEIS2581K7uxB/hke7KrNhABRKV1gn?=
 =?us-ascii?Q?Qyror9dXj1oiKfyQFOXkhRzl/FYVz3jiZFZJJCf9tOnjUkx0bWIx9q2VH5lf?=
 =?us-ascii?Q?3NnLfMaYkByhc/u+qc/57+0raTVNE3kefod/eKm9a3XwKCpfhEoLa6H4OLBr?=
 =?us-ascii?Q?u4qEH3jvABxhrK/JbFYeFLlZgfy2WryVRXhyaxt2hj3vXQ1tM+ObOytUkW46?=
 =?us-ascii?Q?5gZvhf3sr7DrZPVb8ufTk92Bh/fyLfWQyZJ2AM7lDNu0ub5993bIdO7zz0gN?=
 =?us-ascii?Q?Gy8eu+DLBbV48CuQLfKS7EwqfX7PTjAqFPZgtp6EwFg60kL+THYaTJM7CGBJ?=
 =?us-ascii?Q?p1Yk9PJR7Jjf4phoU68UrbGdT3/8nI0wkvqVzgymtT85oKJw9UOZFa5N56pw?=
 =?us-ascii?Q?2n3mj11MpHAw+15oFMxu1L9lix/ZW5SGY2sd+sZSMoGIusiXBC8SjfsoPudk?=
 =?us-ascii?Q?a0+wOvv7r0BrYOSAAEvuSkiKxb77XJhW+GgTwHvwoDNK3+rqfrCmaxY20Wyn?=
 =?us-ascii?Q?2k+bcJX1sqLWEtpKkjPtZF8gEoL6x79QXhKbF/c8976CsDqTehOoKGdlSeDv?=
 =?us-ascii?Q?dZZ4VLRKI5Kg1crrLY5QGajr66SSotgugB1FHOIeRBYJQvXmSkiKy3gAXML9?=
 =?us-ascii?Q?xv+3vK0gqOS7K4yhiFWkWgt/M8rPB0RoYt72LFUOwIK6tcvuSRMQ3rQn5HoX?=
 =?us-ascii?Q?wzArwKM+l4DnvRXFEml0OWz8FyKclwNkGQthLdC92KC9LczLWPMop/JXsaVU?=
 =?us-ascii?Q?+0mG84yl7BVMaboK4Zrl6mPbgVboZSREiT9Da0wo2L+NP9rAzq4oS0BEiCPi?=
 =?us-ascii?Q?QgUMd0CCKeSuTXMNvtbObzO3bfVJCnsNjA27CDyje2ogqPxDUUf2jh7hOhvQ?=
 =?us-ascii?Q?fsRXxuf1RFGEDQFqVgiXvFGIFc5F3kQANpgrjMSwTrn6ZDWC9JUVYba5p1Oa?=
 =?us-ascii?Q?sH2xJ5G/WiugnLO4ifZO/gbtiOU1m3ufypB+5nj05fD7y07DsACSdV/swSIp?=
 =?us-ascii?Q?R/1Ow+2rt+lVkEF0qKw9XwisETdHIV7hJSLCROU3sR9n6JtB6RaC3Pl+l7Tv?=
 =?us-ascii?Q?+GLiVVUjGqbw9UrDS9JIkWx5xkbl4NI=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b768a3a1-fc90-4909-7926-08da11778261
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:30:21.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3Zc0rJ2ZRtQGuaGfpTomuhvsAurs2+eRZIVtt5NQ+pMi4hOPlAUEdutUwz8EsacqgT7aaPG9KhR1U3mEPkVIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1827
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 11:30:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96255

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb b/meta-oe/recip=
es-support/spdlog/spdlog_1.9.2.bb
index ba6bbcce4..d377241ad 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
@@ -16,7 +16,3 @@ BBCLASSEXTEND =3D "native"
 EXTRA_OECMAKE +=3D "-DSPDLOG_INSTALL=3Don -DSPDLOG_BUILD_SHARED=3Don -DSPD=
LOG_BUILD_EXAMPLES=3Doff -DSPDLOG_BUILD_TESTS=3Doff -DSPDLOG_BUILD_BENCH=3D=
off -DSPDLOG_FMT_EXTERNAL=3Don"
=20
 inherit cmake
-
-# Header-only library
-RDEPENDS:${PN}-dev =3D ""
-RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
--=20
2.30.2


