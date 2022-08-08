Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B29C25B08
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:10:08 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.86])
 by mx.groups.io with SMTP id smtpd.web12.26055.1659967800505477410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hc747xfc;
 spf=pass (domain: kpit.com, ip: 40.107.239.86,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSizBdAJdZHXZu5c4roZJUu/g4eipCUbeTNSGYB6lcLPcfgAG+M4OiesnSqO67dV8B04Nu5on2G9SEP4n/U5TXbfv5lIZKe74IkjOavrajwU34C8+QtrZAWmt+8ae/6CVPpa8KJNkOI/b2NpMOXEsH8qYMNJTg4tNRH65AEGCxsdMEkLIOuGRL7O19AUm48of1fBBDYBpupQmjbal2UMbUOEjdXscQEtCvrQf9z8krpJJMCsqbAoGNYtTJwrQHQHwQtzbkEZqFewli7uEO1W8LFX6+4Fdk59RfD3yBfjh0j//cgpANljVbyzXbAyil4rrlxSUkvazLk8byjfHPTS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzNIF7qttuhVbV2DLX7j7zu+xSuusGzL1BCzsb4fJ80=;
 b=JGibcJHgyist3XmqmFefCqI/0sbFBlLbBNulmAgLWpWNqjc1UsbfMVTn3WOZ2RevVVpOTTx+1Kyonptif5SmSjneADkeQ6o27jBB9O570dI3WEKZE8b6wuKxjfDd18SgY2T6gQeebb2Bo0bgmXIARTsiWZ6CO6v4A91wz7edWoxfQKuDB6VfGnZC4f9RHHzpAJUrVlmvyF0e7NkvBb/Uv0ktREH6iHYiShaaRmZhdIyeYVVAmygMhQdNPPUphy8IDqWvYvDCK6y6WXSw3WHmihz9Mlb5KsUg7aOKe1eTOJKMWW7AxhqrMepV8GilmaZlB3SkqlcQ2b/0OJrgFFJx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzNIF7qttuhVbV2DLX7j7zu+xSuusGzL1BCzsb4fJ80=;
 b=hc747xfcDeI3j4eSX96loj6wVm7uCLoYqKL15qsljJWsKv0M2uBVpwWhKRRL4aEm9pZib3KZZ9Xq/WQ8cuwRUmSwMdaWeOp8oQX9HK7+NXuQ/9yHekLx0nuBME0bME1b8vRhv55mrXB/mBQNko3FlngSgKlY8ezzEan/djDe0uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA0PR01MB7867.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 14:09:56 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:09:56 +0000
From: Ranjitsinh Rathod <ranjitsinhr@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [PATCH 5/5] c-ares: upgrade 1.17.2 -> 1.18.1
Date: Mon,  8 Aug 2022 19:39:32 +0530
Message-Id: <20220808140933.25968-6-ranjitsinhr@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220808140933.25968-1-ranjitsinhr@kpit.com>
References: <20220808140933.25968-1-ranjitsinhr@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 834da466-4e39-47e1-b499-08da7947abb6
X-MS-TrafficTypeDiagnostic: MA0PR01MB7867:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9RSClXt51zh91Cysqgqi7vTWvYk2T6YmHU09198yZbznwH+n0q0tBGCCVtynePYWEqM/898+O6sQyVYQUyWB6wYsuXHwkpqynL1EJE32xaTH2T0q4MlKuButXSCbTKc9NpZ6PQAUpCNHtmKOmeBAj48WYf0HH0qa9VqO2Ga8Ui5oHpPNLepQqxGEte8S1wWf66MwFhTzohTLCq5aR3y/QLnBubvt/mslTd7qS08xzlroJdrkeNduK2ijWpP4QWOJPOouFf6eXfG/tyyZGD0HWJpNtlQX5YJsPp8FOnetgsppIn+aAPLkYvvb5cIeq+ICHp8O5kd9pstoQLiQV9hLa9BuuA3kO8AlCsXGOMFIuzPBh5EGqTioqUiPYPnK1R90exUZuCiKJHM1S6Xo54z2YKeE2immKQY1JzD57v+dDp6gD0b8fpQUlVlQ0+ZG4E8kEN076W+K/lORUG20ZXqhbDuvn9OdpcmbFRhg7FGA8xrVDUNcfK+ZxfE6kWTdsIdXfqVk10dTAMv1BvoKAyCzMVVa1r0ZFq37SSRZz8bsZ5odtABd9fUQxtC71SorTrU1jJlNG3rg/dDtZZL3Ek2DRwY0hjwRrMpey4tcgUeWughHZ5GURHv6e/Uc55guQNtmOgSes5ZwDDzFYc77lf6qfD8RvFhShFK4s3tZMXY9/SCPahCs9bT6keA62trjdxOjNj/31pCI4ynMTZk/J/KGcfMej6QICDrr8phsijUumajBUKk2VFKAKz96yYowq+pdOBAL6R7RJIS8u47KIWUdJ0DrnXA1djxNxKMMSjRKvR9P+IEFnH6+5m+NEXVpWAyz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(41300700001)(6512007)(6506007)(26005)(6666004)(38350700002)(52116002)(38100700002)(1076003)(83380400001)(66574015)(2616005)(186003)(8936002)(5660300002)(66476007)(66556008)(66946007)(2906002)(8676002)(4326008)(316002)(6916009)(54906003)(6486002)(36756003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b5BBkr613lIFVIgckYovvy61ux5YGYNvo+HZzaP9ORfvL04P45WQ16jW3rz6?=
 =?us-ascii?Q?jMYsjYMqzNOA/yZA8yUyvNwZwd7MX1enyjZtyR/3gKFqJbnP4Db06NGpyFG/?=
 =?us-ascii?Q?V74T0Cnw2YtQ0wnV7ycKWJICjoKV//r6TgwcNKhvFLpdXD8hzncq5elZHR41?=
 =?us-ascii?Q?iA33ujv6/ZfnhiJWUcidZfmJWmWEcTo3mJPC2fx6XQKI/V1i29ejE2x/bxg1?=
 =?us-ascii?Q?m+6OsnNfaTh+qaKeqEjJg3zMMs/iU7cVeeHh2/fUEvJPMZrcqxZIJJzY4NHs?=
 =?us-ascii?Q?DEniggSS5eQwnbhEWkr3/60ih3enWttkebjS6MASXfmpHD7xYZPALTbx+PZu?=
 =?us-ascii?Q?pmrf3IPdqykxUqFSYoF2qmSj7Gt3DdRwXgj6dZJKVcjA4wPgVQ9ioJ7ajbHU?=
 =?us-ascii?Q?xIbeZXPLggUBn15N0/uEDVMuif5kvQrnEklCymja302C5VGh3Jo+bRAfV3Go?=
 =?us-ascii?Q?okpsBdff8fO3KCm6pwMNsIc5JHr2ry+gMgDHLFpi/l+gSI5TPdjR2tlhEEfp?=
 =?us-ascii?Q?33cadtvoriFme8BzCPFsr+Yuds7EqpYbw6AB745OOz3OKjOmnB8a3D7KXJ1z?=
 =?us-ascii?Q?uPGL5+jPZOh3v6IUTQcSIl4NXOR7E9PZpiBAh0SboqERQVR4Q4U4HaXMUWKX?=
 =?us-ascii?Q?NwJxFuy4iI+LnsL5BUYZBBG5cm/kC7GxI+N9MtbufHsMagbnMiaPovvMBq0R?=
 =?us-ascii?Q?ZNwN7qADT82cdlYc0/ZNK0xIIJz3zT16lB+TNnWb5SF86TwCMWtwu2zRwivK?=
 =?us-ascii?Q?6wh4Es2iA3CKjrtchMmaOR1QYpUM4FhXubMON6EEbEE/QujwWg1MqAnSPcJX?=
 =?us-ascii?Q?80R+W6lSo0klRolyayq5tuMQOzMweDbv+B8FZ/j5HNDMwz1T4Hw3N650E4qV?=
 =?us-ascii?Q?yF2eVUAA1G98prSwIFuBYWBYQB9EVP/vDlF9f6jahjaRsbIzZvYe9+OL1puL?=
 =?us-ascii?Q?vMQJHFwv8/HXxpAERSzQw4RjxxukHTHCejjWlZuv3Zbaxzj5JmOGNtkcwHyp?=
 =?us-ascii?Q?14z+v+5b6zY5P15KOaRa9scVX36yb1wrb2CJ+stDRyWTAnlyXDn19vmbzKHA?=
 =?us-ascii?Q?fyXY/TEAbHj4FdR3gKSMgnMtExEqz70b5zpjqgfxr0p5JK/ZqhQLl8NBgy7s?=
 =?us-ascii?Q?KMX3KtRk/eCvxf2n0/bjihgfaU2wbS822dcFTOaIxVlOA3FGT3TCWT2GO7Z8?=
 =?us-ascii?Q?9LRH3J6gJSbiFkI3tIf0Ttk29u6KeGwP7NEH4ynCqDzezYMppNaTvjzJ4OHz?=
 =?us-ascii?Q?xgPSQyaC+kbGh0Nmz41aC6yYeejIWaEAe9My+P0UHuovkTda84gvh9g2zJbK?=
 =?us-ascii?Q?Aqw/gPpqjC8sBvR0Y49D3WCfyhCBRvLapI7vuH1+I3CWwc+lRm/SXGQII9rb?=
 =?us-ascii?Q?7qKvUMng7fuSfMwTOd6bbhJcKZgr3VtX1WZhfRqYF/erAzcFxKxPTtDorM/v?=
 =?us-ascii?Q?VdWEAbwUv1vuJnM3nADl94PLx5znNozMvX4OgEmQdwmrXYz4EvbElWYy6Qlv?=
 =?us-ascii?Q?dKIHl7dVu4zBtEApcZEPXMNVMDlUwQCgnauib6qLilantWJmXmhro1SmiRWa?=
 =?us-ascii?Q?1m1ldUMUk0IDjFf+/5EG7Sa9JfAKSobfgz4kNJawDIkShqq+4pyIDJtqKnN8?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 834da466-4e39-47e1-b499-08da7947abb6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:09:55.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vpbPmxoCzBUnh8bzBY+YOnFL3LypJKbntXzsPwTDLmrhN53+3Jt8TQVP2niiOoTmpaSGcDaRa6KWrE5Rfeg2fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98156

From: wangmy <wangmy@fujitsu.com>

c-ares version 1.18.1 - Oct 27 2021
Bug fixes:

ares_getaddrinfo() would return ai_addrlen of 16 for ipv6 adddresses
rather than the sizeof(struct sockaddr_in6)

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e251d7b827d63277a36f1b8094d992303329b866)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../c-ares/{c-ares_1.17.2.bb =3D> c-ares_1.18.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.2.bb =3D> c-ares_1.18.1=
.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.18.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 80d711a36f..6e0d0fc38f 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48=
b006"

 SRC_URI =3D "git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dh=
ttps"
-SRCREV =3D "6654436a307a5a686b008c1d4c93b0085da6e6d8"
+SRCREV =3D "2aa086f822aad5017a6f2061ef656f237a62d0ed"

 UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

