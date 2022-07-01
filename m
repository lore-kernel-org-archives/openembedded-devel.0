Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F51CCA482
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:16 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.44])
 by mx.groups.io with SMTP id smtpd.web10.35683.1656663726996712514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=pApWaXgI;
 spf=pass (domain: kpit.com, ip: 40.107.222.44,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSFew+bsL/chXY4GCw4IID9HSziorzw7uFjsAubocUgkinVAPZR26txM6OSRZNhlHHGPc3eRuHQKI2IciE3VHRswP6e6kfTBbobaq2VNDgQvw5C+1+ZccSC2Xy+d5n8D7Dp5yTXrwxfMW+554qaoncZOsguFOVuD5z7QSfMTMwKeo1QBMXwVMPDFZqH8LGFERtAgVpGGxyCdvI6UMc2UlIBa/Xv7uhfN8TDpvSr5epMt6bcBvHqYN4BT4YVUXQLzzvM1lK/9cuPoho2uufRz11ph0HVSLjClfaTRPc0vDlioPeK+JL7tqGj0VX5osFe5Mlz0CylDASkKUgy/+NlvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnQNwGAAbfabSZpgjrkT9H4tMiulVMLlv2rpTkoiYZs=;
 b=Mzu3SYHkioGp/ncD/Fri7OafUOYjKmDC1F+i4D9Z/wJfMUaYN7UpkmzJbu3yDYnXQHTJ+8wg1Nc9z3Fqp/ziF1oGzwG5kkQ8aFsHMGOtV1qli+uH/ALc90x7QUNOIK9P+YiRfprDeiIynTaadgN0Kfxywl35YtRLAPFvAfdCFWhWeftcjpvp0TdnQci0DLIGffpOZUdmL9gwzgdvv7HZsb120a+HDH4RdBkSJxoeG/4Qbk76ozr7zPpyFx3XiRTObY9csD+mcS8JA+V4oxdi7bFSHS8TuQ9GJGoy996CgnsYrrFyDhXSMXBN27mCntEJ39r8I+cCGuZ3McR0Eo4bUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnQNwGAAbfabSZpgjrkT9H4tMiulVMLlv2rpTkoiYZs=;
 b=pApWaXgIQD7dIiFwRWpaJ2kuVFEXJ729q3nMwFnoTU+GuhRyBmtwlEJowexfisXSjTyaIIoKQh3xpyrCHf5E91uSG5/sqw2nuM9o65NT03XW4AKEyHF3lsQf4ruA2Ry/O1wzULKZFxzxElgS7LHG+kmHePRSmUf9demu3ntoG0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by PN3PR01MB6983.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 08:21:59 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:21:59 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Omkar Patil <Omkar.Patil@kpit.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 1/8] ntfs-3g-ntfsprogs: upgrade
 to 2021.8.22
Date: Fri,  1 Jul 2022 13:50:55 +0530
Message-Id: <20220701082102.17835-2-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73ab0d00-0f5a-4da3-db21-08da5b3ac49c
X-MS-TrafficTypeDiagnostic: PN3PR01MB6983:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9ENoZHgl557KbTm3LIFEGD58JFguLPSGmMe3bsOdMNWMj5ZsQ1bVj4X2aGYpNcuJDgVEz6X3Sps2Dw5epHo8hcGmvJhNjiy1CNZOi0o7dzp0cuGIO/KD39WfPzVHZzXQmMAEhDHJnKC+EuaVk+84ToARNZOY8OTAVbs5b/bY2qryXMVX2v+OKlbLi5VuGSbq/InPuL9Cr56VIXI99SWXmZzTnB31B4guCNKWEcjyfIpbnVuV0c/LblD1pCdMfrCSdvGte7Yh5BvxrkRWiPJkeNjUAzgmZtaR7tKtqBTS2VXkSiTqhkrwM6T+pxZsrQcxYjLp/VpVifzAu3aYvf51v9+MHb3v8CR8dFKpBvjXcjKczza/19rxXJO138GTqszOYwYWyQ4krJOd2dabQBEVDfTu+j6P4Ib38SDS3cnS3iMdmkBarCaFysUcWocxdyt2edwFBPB0sEnJwToMbzt0tapAoyHdgy2OQBkMF3NJIcDhoxDHVjNf1Eng3b5pkb7xNOQkasneBqSVZWSKgRoS1b5uiiJNVtvWldEGAcB8NUz4Q4fs0WmKbXGLF77LKU3fJFYLNt5M3pyLnajdDHl+8xKydOmJILH1hPMSPVhCVigJFEvtmWgh6u1gTub0asj7QYbq4WzYXpggrT7sD5ywX7ET1BrZyYU53RUj6QxWn1LLCn/VHgweFJG1kWdTPoQFFXxkOZPVpsu4NU0L9/7ZLyjK4PPcWJYSGlRYeca9dPCffnPnGySEkDJhRUR7njjmIKbY53KXlqoqJD7jtleQcTk/uPSv3naDtZ4S747LTgs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(6666004)(41300700001)(2906002)(86362001)(1076003)(2616005)(5660300002)(966005)(54906003)(6486002)(186003)(6512007)(478600001)(6506007)(8936002)(107886003)(52116002)(6636002)(38100700002)(316002)(36756003)(8676002)(4326008)(66476007)(83380400001)(66556008)(66574015)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?flVWkdWnS8XGf5uhb4a3RNb+T0jDQS1DMk55fCHFnt4fG8W9MFQTAemM+sK7?=
 =?us-ascii?Q?T2qjjSo/OmawJcvSJu9xTRhrZU0LLsQ6qJ4/Ruk/3eKAfOOhm4F1hIcq1LjL?=
 =?us-ascii?Q?0mvar8f0CwzGPzfhIaUeQshEEjzHFgK8Si9JOXC7i3nXJiuTuDZ9tnf8mIPW?=
 =?us-ascii?Q?uYR2HEhpOc2wqobxzdColNeWQhcrrNeMsuBy4G8SeUSba/1Aw8TeSZgZBabf?=
 =?us-ascii?Q?fMpKIwljP0f5VyuYf1O58nBxXL1Jenuu9wJ98z4sIbB5FIbJVh8C92Nfy4ip?=
 =?us-ascii?Q?4jyJIoswOFw7e3DWXPhVqSGsN/sPScXh0YvcACGsJFZffo4DCVtCtiHYEaxR?=
 =?us-ascii?Q?rhudB1ClQ0ZavuHoCgvF40wBJCHf6Rhg66O4tnCAnVajbFWCQY3Kk9GVUIg3?=
 =?us-ascii?Q?YOGvltqbBb2YYdokQr5tVg/i3LY+hKiuTPsdz9o4p2mLWuoTCRR/6hgwWUsF?=
 =?us-ascii?Q?IKS7MwGzpJX3v+vR5FgaPOmMUtZDfgZlH20j3Js5KJ9Q1/9JUHMSGeSylpFr?=
 =?us-ascii?Q?cVnZHigD1odP+U+6nsfkWfhObw9oCBjdpJlKlTUaPnFpfSuA8szuycSk0hIl?=
 =?us-ascii?Q?tt056NSfJDCS2Xgi1XycxYq2ZPoJhO/5tfzgwQyg6xmjq8o2JtIuH+6W0gl8?=
 =?us-ascii?Q?wl/NdQ1PTYkVR99PWQYxPbc2Ics+OFe2diGQvtFLNFM0vluoZOgIKqXVaODi?=
 =?us-ascii?Q?XTT5egiiuzyypp+uozq+uDxg7XYb91t+1KN9nF6FkSCx3ZJSsTITyV8WG949?=
 =?us-ascii?Q?Ke9W+/DNKN+BjpePOO4359PYxhQhFE6uNxiiVtdYhGTEZHtR8/P6w0kvv0aX?=
 =?us-ascii?Q?A3NA8GoK+ZcJwhaPZLHArq2AckS8EStoq1aejYiIreTGn5SZ4rsrcstdO2aa?=
 =?us-ascii?Q?VAziegm1vzel6gtdkHZK7ep28TNrFq1j83fuYgptk3Ykx645+dPSagIShaD0?=
 =?us-ascii?Q?NOQaXktNtPWE7ie4O0MdIenSdPNNnmlvZGya3cMYLpxBKgxaEYNxvdYTWnq+?=
 =?us-ascii?Q?fZRuMA4rTtLhN9ulVuUMOGK1/FtMrcLVGvweUaNpil1y0c8QQd4UMIzJdAOy?=
 =?us-ascii?Q?ei0Cmp+T29weEWguGSrlI6wuSGwKHHDxt1G3sDGadp9AWumhE5wkUjioiqpm?=
 =?us-ascii?Q?ZMgO8PO0E3yxdbYh+BVncVdzhsaTqNkgRNPfwVtJCG+IUBmhDVLYwBHkTLa+?=
 =?us-ascii?Q?P5LJHxw26uQYdEi4z3iTO9jnGIbFaoU0pxX0iqy1LBGqqIR7CpEi60HHjvBw?=
 =?us-ascii?Q?Xg51esoNJw5pO6yBjrCfgpRrjyZVZb9AKDMHF1kIvSJQoXunbjeN6jTr2jdn?=
 =?us-ascii?Q?QW9d2OBbaiZ7g/njD+2OqeSoo7qhWCuVPnQA6kt3rMDca3qj1RRdS2CCuwtQ?=
 =?us-ascii?Q?RGKxh2rNpSfYFn/OtGKvhVVAhPfOhJeLAYcnb1UipLR2tZxprybBlHTJ4T76?=
 =?us-ascii?Q?NktaP5mnOha7hYCnntI+UeQ2T67pys1JoCuShapyF04ahel5o7TZ5BgPdmIb?=
 =?us-ascii?Q?LyDV30s1QqeCndaFE+YBFe6fhuj1WVU+5duvw/DfF7dJ/3abYey+ZFT0H2kR?=
 =?us-ascii?Q?tildyE07CIjjkMqV3ziErf+xZY2ab5LVQ448eIt2xvORLagcO+jHwouYlZCv?=
 =?us-ascii?Q?/iOCaHlQeKxD1kAzq6u567JY/S4pogu96doMXcW52Qo4hNVSaNDLKkNxcgyN?=
 =?us-ascii?Q?tcGbvQ=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 73ab0d00-0f5a-4da3-db21-08da5b3ac49c
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:21:59.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FY0MfyXeoM7WU6HP9gHqhWkUn1/o6nJ+0kJ6iT5vXfB1vNE6YvHC6faG++Dj/VhzZ6WZ8fZ3eKYj47A48kpBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6983
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97653

From: Chen Qi <Qi.Chen@windriver.com>

This upgrade revolves a bunch of CVEs. See more details in:
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp.

Fixed CVE's:
CVE-2021-33285
CVE-2021-33289
CVE-2021-33286
CVE-2021-35266
CVE-2021-33287
CVE-2021-35267
CVE-2021-35268
CVE-2021-35269
CVE-2021-39251
CVE-2021-39252
CVE-2021-39253
CVE-2021-39254
CVE-2021-39255
CVE-2021-39256
CVE-2021-39257
CVE-2021-39258
CVE-2021-39259
CVE-2021-39260
CVE-2021-39261
CVE-2021-39262
CVE-2021-39263

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6791dc536444a1dd0f473653501ba43fc84704f2)

Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 ...-ntfsprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntf=
sprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-=
ntfsprogs_2017.3.23.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2021.8.22.bb
index 6f5cb6cee..19b2d6ca2 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2017.3.23.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -10,8 +10,8 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-hos=
t.patch \
 "
 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[md5sum] =3D "d97474ae1954f772c6d2fa386a6f462c"
-SRC_URI[sha256sum] =3D "3e5a021d7b761261836dcb305370af299793eedbded731df3d=
6943802e1262d5"
+SRC_URI[md5sum] =3D "90da343e78877d388eb34cefae6799ae"
+SRC_URI[sha256sum] =3D "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d=
1b8b94bb202efb"

 UPSTREAM_CHECK_URI =3D "https://www.tuxera.com/community/open-source-ntfs-=
3g/"
 UPSTREAM_CHECK_REGEX =3D "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
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

