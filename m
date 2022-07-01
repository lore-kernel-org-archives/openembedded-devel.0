Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0570C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:16 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.44])
 by mx.groups.io with SMTP id smtpd.web10.35683.1656663726996712514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hx3BYl1W;
 spf=pass (domain: kpit.com, ip: 40.107.222.44,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbq8goSIMbs71D+ZsVuGNU8Pip3uHIYHiJOWUFdYuY5MHW5KJ076vDAfKU3XJ2dnsAK+PWurmZHz4yF2I/OF95/1pKvziFKTcnPJg1+S2tYf3l7MXi30Ksi2Is+YtR5aT79bLOmzUtyXZNDEaNbrge/Q4uicQIvFFriMuxD1pMnFh5OaWFdKoLash0R09b54MngZSuBzRMc6gsqxo1BTF1Goc/FDRs0O+B8Q4og3hPD3SrKjG/NEXRqFKTaWtg+MvgY7nuHEzf2F2toKb/IEhZYwZZ+R2OlTvdQQgPZTpp+y1HUlb9mQ2vINcNdolm0u59aqiKsc5hG7YAgTTdsZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1Bf0thflX9dPtr+cAdCWTDZWxGkwNTA2MPoGe1DxWY=;
 b=XGrMyg1HUi71fyyQQOz4AB0dnE6Z4kG720FeYn46hj1yBoCSCM1Kgce7i/mRiTb4zM8sfCKIeZPO8QJQDkRk9rxTn0XuZyMqEo9HywTTk3ZplF3lTDHcls9KWJq0Y4LgJ2kDa79+704qKNZiN2Q+J27QKT/HyhnsTvCk0ZL7ziYjn2gRx3/1R26qThVne1fFotle0sYDosXx4YvmD7p+9DDWNEM0AeKHjrl7E0KZIpYQMN4gy8oRPpO8MU8GyBDvhvrv7AAI6QhXruwPDyQmoTYOAjdPkKTirItfTWc5bhiNcv7Nc0TR/ixqRpKJta5wMmY/7nbcJv7LruYDdNm9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1Bf0thflX9dPtr+cAdCWTDZWxGkwNTA2MPoGe1DxWY=;
 b=hx3BYl1Wty0taOQfw9KobTM4f+ljUHWNLRCYqYK0oIP1ClQ9iG9DoAP2iqPRvhdRiQS0/PsObekWrp1U0ib4gHg/2SolQSuaPcgFDOODqaVE+aHJ0Ed8jHICFfulhdsM2WFCBaE9p3f15OOcypBUzF04+YxMu7za/WOh6OLo6yA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by PN3PR01MB6983.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 08:22:01 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:01 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 2/8] ntfs-3g-ntfsprogs: Fix
 CVE-2021-46790
Date: Fri,  1 Jul 2022 13:50:56 +0530
Message-Id: <20220701082102.17835-3-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba63420c-c92c-4252-5e92-08da5b3ac5b1
X-MS-TrafficTypeDiagnostic: PN3PR01MB6983:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DLW8PcDOpidGFFmZ0i5SIvKi4zQYlgZ0xNqWX3Bzp3jenmxe5fTXwI6eLagmUM9m+o77ZsvONkx1/p4psvRd63VRA+YdoUukapbmR55YmMHehGdh3yf+TFJBW3AECC6g5ojxCiZXP4p9sSFT2o/A8D0Dc9E/N59DiybxUa7WVM0y+qeLem5xqyTHhMaKzbHcikhF4NmK5c9ktEeVEY3lxJry1baKymOhwhFsDTjAYjfGccTyYTvE9rsDeZzVCX9LP5zfHLeczESTYA/H8gLIqwPo/9meR5ojcwFmITCIMUNS0jWQyRzV0ZFNQOqR4ypJJh7M2AN/t6dvp1h+rE2iclL25VRkenTlJaId2VZRG3D7D9TiRUuVWytXOmVDebPLenA7q3t273YB4sCXKb3TOFGJfmsfoDwsmpcmR4sa1FzJFQyee24XCT7Dx97aAMBPLXu4jGmtYg1Ju11rQ2tCHk1Imtp/1uANC0uyRKySc424iE6aqTxm+/8W+FVnv1KOr9PFzgmO6dF7cuxJJWFx1blFaV6yt9aT+rI/paNU0cEVbKHRLj2jXvtIFKm1+2u3Sf9bEcCPHHjZJ3XVyFGfgZfbA+sFBT7K7WXSfHlO9KBDUmvu2bxdUFiT4DzKBY0nV1v6rM3HGC5eX0kpWLWQ73tltBOeYqD359f1ud4gRHAyudHvkSqTzkXhUflMZVQpk2aL+uEOIda8oTa5Pa5EukGPXKfJLFTCIumIY5Fuqi2QXdnXAH1UpuZJ+h2yjlBZrbOOBaMfLmzpbffWhjJBUg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(6666004)(41300700001)(2906002)(86362001)(1076003)(2616005)(5660300002)(6486002)(186003)(6512007)(478600001)(6506007)(8936002)(107886003)(52116002)(6636002)(38100700002)(316002)(36756003)(8676002)(4326008)(66476007)(83380400001)(66556008)(66574015)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?43BPait2x2j6cAY9huFfkWma68qCK6AIr81xzuFu+vsLNvd94k7QbNeCH11F?=
 =?us-ascii?Q?g733GxT+ReY1JMTddlmHnb9CzaD+v8RXohBO1vgL7BxeG1qERJLhQGR7Dgpm?=
 =?us-ascii?Q?AKRe9bZr+iHU1X3ieytALbprDy/4vAwLCPisXkhRgM5gWvvFmn7EDdU0DiiN?=
 =?us-ascii?Q?XljjkxdgODLAFcCz+DpSi7RWFKurDoTnhE2E63SFSJu64prMNDczjyy7MuML?=
 =?us-ascii?Q?vSlmpiTRI0Tg8IGMKfK4RhqYQuHQ3rGDvCJq0qjmqVc3sgiN42ritqh2Mi8u?=
 =?us-ascii?Q?X93gn+1GRIX+/aWTKQIB2J4Kp87P4UzUF9DhprzaXHgUHiCsIAHTMTYLfr5+?=
 =?us-ascii?Q?ogGZHHLPq6SKM9lR3otRKUGiy5EGSNOfyQN9A0IjHFiR5o1Lis5YbqvKnRXX?=
 =?us-ascii?Q?vhktBc692c4F6So9VUYUIi0RCS3x7To5rdw6lmMz9I7Ba+CaHAY1FZWSv3sU?=
 =?us-ascii?Q?Dlu86V4+RqljcsfRIQFJgeSY8p6BwjlzvOrXrXD9aI916ZTKUP3X0FJBnDoE?=
 =?us-ascii?Q?j40eTFQQ0TljBtuA99w5K/a8L8RnsnU7mzToBxHmzjS2uM/pDN/+UF/6bQON?=
 =?us-ascii?Q?rPPere7dVQ18Wajsbk80a5ABuXID31Yvuiy9/phj8GhSu+xfBrFAAwTe9Ys5?=
 =?us-ascii?Q?zWWB7bOkdk0Y/F2vN9czVN8arf+NqpnzQxxGlJgtsqabOwHgJK6D4JEPhXIt?=
 =?us-ascii?Q?3rfBXfANCYF69cFBFTYN4liELYRBpWlTs9CDGR0wz1NTUNZ9pvu+ysIPNDKZ?=
 =?us-ascii?Q?qa6EDLyWU2Ui8oO+qrInhW0s1oVW3yvV63TGsbxd4UpJlNTCGA1Cce0DL8OY?=
 =?us-ascii?Q?qWGguA7ngnMKBsmzWvb1WLbDUmvcwmzQ3ES8UzOeOShl1+Ne1YgrUpvJKYqz?=
 =?us-ascii?Q?WMkefVkDmd9ujlooRyAko2KnOtXO3emAgV3IVQGs82CVv2F2m4lvS8OvpDlR?=
 =?us-ascii?Q?q96NsHwwoCihoCbXtwh/8qVgaNIu0qUxOpU+xByejsExTDxuMq8BzgPDJG40?=
 =?us-ascii?Q?l4VQof32NidTTnnkwk47JdVFVtguaIrxVTF+Se8GWUQYXyaicpM+HO+1LjDR?=
 =?us-ascii?Q?eRYIXqDjRzG2AE5iWPIRKt9BkS2fVGjX2MgYKyG2ntdGs0aoFSXoWQBSIZ7b?=
 =?us-ascii?Q?jPj3kMgA5sRo56CUaMYtAE14nSYIdUVf+e9gPo4ywVLXiT7NNteVmcjENGuS?=
 =?us-ascii?Q?XKmKgIbvgEtpJ+oOtYs/AL1Nq11D/0dD5aYpdALdM35eUZsJzOJh933cbqxW?=
 =?us-ascii?Q?lw4zkWDgsyrxwWsHRIEOdsyBbCEqNVwfGCAsR621d+j1PY2PngTuPbzmGt7B?=
 =?us-ascii?Q?MWxyqngk0zf71924+qerHR9qdv0dgH0miyZxDHFhxQ089cHeEq5v2+InTTqs?=
 =?us-ascii?Q?UNGxAcE23HgJ4rxrFPxHqcZ6H/AZ7zLD6Gmmpott/kfvskmzlYubS3gQLWxU?=
 =?us-ascii?Q?shKgJOdb3puTuiYUcNeH+yfbXy7o1Jwk+hsIUkt8c0+ijN5o7jI2qh+UcJ8i?=
 =?us-ascii?Q?JpanJxhIEaeDvFbAGYj1JuOAkHcQ1E0+zgVU6x8atCoNm7cfWx1OusrS4Agj?=
 =?us-ascii?Q?2xM003xqEpWQ106oPS1QNlOAhxYvVbh0DajQij2ABviFusyiRZeap2m93S85?=
 =?us-ascii?Q?LunwEVRtBRjr0L19buDg6wf1nIJ0LrDf66L7jN8IZRBe6sdh6napDPc4ZroT?=
 =?us-ascii?Q?Ta+BnQ=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba63420c-c92c-4252-5e92-08da5b3ac5b1
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:01.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ynuygVmrrfR/DqNQGmbeB5/d8CZBHZdrG4ns1otgot/JCS9gs3nIyTTNVQI8ZAU0WHLnZILKPLnoaCi36mRkJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6983
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97651

From: Omkar Patil <omkar.patil@kpit.com>

CVE: CVE-2021-46790

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../ntfs-3g-ntfsprogs/CVE-2021-46790.patch    | 31 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2021-46790.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2021-46790.patch b/meta-filesystems/recipes-filesystems/ntfs=
-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2021-46790.patch
new file mode 100644
index 000000000..e0bb1b77f
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2021-46790.patch
@@ -0,0 +1,31 @@
+From 96412e28e5c7ac2d15f1cff8c825330bbb60976e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 10 May 2022 10:30:24 +0200
+Subject: [PATCH] Fixed possible out-of-buffer condition in ntfsck
+
+A bad usa_count could lead to an out-of-buffer condition. Just avoid
+the issue and report the error, still not fix it.
+
+CVE: CVE-2021-46790
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ ntfsprogs/ntfsck.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ntfsprogs/ntfsck.c b/ntfsprogs/ntfsck.c
+index d49f3f96..8c126411 100644
+--- a/ntfsprogs/ntfsck.c
++++ b/ntfsprogs/ntfsck.c
+@@ -616,7 +616,8 @@ static BOOL check_file_record(u8 *buffer, u16 buflen)
+
+       // Remove update seq & check it.
+       usa =3D *(u16*)(buffer+usa_ofs); // The value that should be at the=
 end of every sector.
+-      assert_u32_equal(usa_count-1, buflen/NTFS_BLOCK_SIZE, "USA length")=
;
++      if (assert_u32_equal(usa_count-1, buflen/NTFS_BLOCK_SIZE, "USA leng=
th"))
++              return (1);
+       for (i=3D1;i<usa_count;i++) {
+               u16 *fixup =3D (u16*)(buffer+NTFS_BLOCK_SIZE*i-2); // the v=
alue at the end of the sector.
+               u16 saved_val =3D *(u16*)(buffer+usa_ofs+2*i); // the actua=
l data value that was saved in the us array.
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index 19b2d6ca2..ca8af163e 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29=
e73d4adb9f9f6552 \

 SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-hos=
t.patch \
-"
+           file://CVE-2021-46790.patch \
+          "
+
 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[md5sum] =3D "90da343e78877d388eb34cefae6799ae"
 SRC_URI[sha256sum] =3D "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d=
1b8b94bb202efb"
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

