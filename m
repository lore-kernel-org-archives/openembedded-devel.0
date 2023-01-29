Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D529C05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 09:50:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.69])
 by mx.groups.io with SMTP id smtpd.web11.13547.1674985801830501667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 01:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Bn22vNwa;
 spf=pass (domain: vaisala.com, ip: 40.107.20.69, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP75Cwjddbh2PWfl/xRNH5rymgdEYwmtU2tD6b14sMmVq3gyEnZ5nmXDGw28mVcuNzJc1H141BL/EG/ryel88UK2SX8sX2yRVGUBxEEGKlK9ZgKDPzXvuoorHm9mBl9hStyGCdnrOLPMCAI9gGdxmYIo5iddZCs5d8tOBlxZY+cS7jacCUQkh5oJGLI8IMKXZZP3UQBIyQ6U2I1Ff8JuGFo8DuIkIKcIIpMutP5wqbQEfARUkEadKlulpw06tF6NYBvFJ+DugigJOtrwGaghVSD89+ibbjTO6jrgBdVg2deVgkBaFe9MFvhatNRsKlpY6hmb3qkQ0pPG8XeQ0ri1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwEf4lNpsR0BpbjT17mH22ncReazkChPEyJWz1UaF1A=;
 b=VAI5drFwZGyfusfmTQeng/A+Ohe6Ecw6+4vUe9aX6x9AVfBw8qzdgn0/jKy6ijc0gAmaUkUsmfPacTB1RB59HzHtlpgOYOOO0e4l4h15mYCx1TdWCeGIVNyUXAAeK8WBUVzeZy3BSwOT7eg7Ga3/j1hkwGEN935iUN2AFQ53m3b9EhqtI4JbBq8H7jJcZSeU79A2iTz01JEMsMUOcYhZyDY5C/MNnKh0XYml2FU3xzxqvj3RWGxIP/0Deltjka3Py+CCR4PnAAERIT3j+tu1TKCPbdiw92bMTvGXXqEeXkOESFGphtMw1Iwwx/EDbRIEyGsg2KVuOlzNaVF9Ras4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwEf4lNpsR0BpbjT17mH22ncReazkChPEyJWz1UaF1A=;
 b=Bn22vNwaOD1rZ9rGSU01hfh2mKfJ1NdWFTLBDd4GwFNA4c27bMdaTUIAtdSXzG2a3vHM/b5fVSddEmLCDEyIhYlYEMoBRNM6toUjLjHGgunc9izBF4d0fKBjoVcYlnFTdr+gcXfcg4JlwBDfeMu8bXnwvCAevycAbLLNWNucse/vgpTBSGWQQ/b4RJN0r9sWiY0PTyJq/Vg6RIq1mVk50IGHZLwPZzRuPwRz0gsj9nxmFJxkviJd3AkKIMEoInwULfzsprSRBQOmkygl1oAVMQbsZH+xHSHg39ikPkcVeJe4hMsw0XDfC2OYYyjtJ1OAmoYFZMtJ1FytsGLBZf6Fzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PR3PR06MB6889.eurprd06.prod.outlook.com (2603:10a6:102:87::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 09:49:59 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%4]) with mapi id 15.20.6043.028; Sun, 29 Jan 2023
 09:49:59 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] Fix missing leading whitespace with ':append'
Date: Sun, 29 Jan 2023 09:49:47 +0000
Message-ID: <20230129094947.168489-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::25) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PR3PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c23b47-c9da-4ceb-2068-08db01de2f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kSoJbrnDBL+tM4e2/SjcDIg69SEJslJZ613IroztM7nGuoBVaQvMY96c5dZIcAL2tXqLZ6eS/H/GFCo72EQk3hjQGO8LzuuG7CcHmJGTks+UtcmgMu32VlAGT7CUZ5K7dDa/C0I0d2g/kesvKfSd+g65/+w9YHOEG2qMUpRuYcMWIr9CaJgmmnpiGXiksBfN+um2tuVG1yMuuvPPsWHeMMgboyz1laWxhUeJkLvyk4u5Gr+DCHRraS9CSxzjvlrnloDoL+EEDzvnZYeUpL9CD4UTKs7WODQa/o8KdCDL1XM3oF/xT4OF1gbp+6NH/jRbBP7EMISjF7TIw+T3skaOxUjfHE/LXR9UR6mi/iUBrGC/4D7NafrSQKmX7nW7+5j4ADn5lzqJYjm8maGtS0xKdU+bzioyX1eefvF4nZbdXOjoUA0GXktIAU5OLNpm+GtpNSKeZhZeFZPJtEA5HO+/CZUYEH56iSZYgbFgfShm3/k2LdLFJZANOSqvQp2+jyeAZVfL1beQlLNkk+Ec3BWd+lVHGjieZIWeGmdOrw04f0PpLBL1zAi7a4ygzGonblCDmZHAVOD677jqhAUY8EXHAnaa8s6Vv9FUXu7+FTyVSlQzLw5cUMgqm7Lg3LCuIW54YtQXPAGKQJWzFY4Biy34KF387MxQ8YS7K9MX7wmQXacqAgsqBTP08UbZV3YnvBlMLiir0bjc6kfH/0lVK7qYVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39850400004)(136003)(396003)(346002)(451199018)(2616005)(36756003)(6506007)(1076003)(186003)(6512007)(26005)(44832011)(6486002)(52116002)(6666004)(478600001)(86362001)(2906002)(38100700002)(38350700002)(316002)(54906003)(5660300002)(66946007)(66556008)(66476007)(6916009)(41300700001)(4326008)(83380400001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?95oeQ9sIGQKb/TRLg0wrC5RvQE29zpusijBVPUmQ1JLg8Oiy8JlAWFk3buJ1?=
 =?us-ascii?Q?rkUqPAXJQTdtg0uhArM+3AWb7FPv5NTMVQ1WtZQLLE65QTzs2T980RWni+lO?=
 =?us-ascii?Q?3suOQ4V6ANW3c4xrsMmSfOS1jb+1clRUHTvgM9NHnvDSe6C4D8hDySuXG0RU?=
 =?us-ascii?Q?xcifDjbEylPsPCroMgi/WWVNcMfT4IgydCHsIqhpN0ofx82nzJBFg65ySHpz?=
 =?us-ascii?Q?3En8mWHIoT0CgZWaa/9mPJKXTQ7StNNW/kU1VO3OXTDhyBg5BmZTWFxuU6W1?=
 =?us-ascii?Q?wjnskOYvXDGiyJM2EXFUmxNyEl67s1CRipretG4nXM0COum6JHUWEvFOmTRZ?=
 =?us-ascii?Q?1tirApI5iEQ48D+Z75Cy6mlhEUbGy6fOxK43t8IfpdQyqYfi8JH+9NvUKbjm?=
 =?us-ascii?Q?YPFW1w/MBQY5Cjn3carnP8XBBY0SzdsQeJ4YE8yWSZpy8tlrZaq5CxRBYzEm?=
 =?us-ascii?Q?osfgkceQ6/tcHVeNrbyPvt0sDqrcfM3mBtokHcDctENwLDWCJ2FNKQdJGvd3?=
 =?us-ascii?Q?aL3JQldzpNlt2XnOnt5ctpuuehtFFmpRGUXzBDs0HrdewVYDpReng1+eZR2x?=
 =?us-ascii?Q?gPJYavKhF1+65iyPIlhbC1G6uKwRTAkJvHO5+g6yPZduXFhG4QfdTvTISuj8?=
 =?us-ascii?Q?1wdx9JtO09pVis51dPVnvDwhHl3bvKijso1pTiP0R6P4TYF8xKCI7smVduX8?=
 =?us-ascii?Q?LMO5is2juJx/KueDaxH9AsGrpumtZ7WgpH1UNXg9jZFpNFaKhaVBad5DDt0U?=
 =?us-ascii?Q?/rPNb8+NNQyvbh1BAi7Sv+5UEPgIu7Stfnh0069g6UGM2bGTjBiHM2dnOLq5?=
 =?us-ascii?Q?Dn2zDbqbMCpXWlmEhPWHIk5XlM/Fd5Y5eyRKm7Sfbek8geCYsBFdzYu6MQ9R?=
 =?us-ascii?Q?3abq2Ve/DJtCkkq/zza4Ji5RWgFYZilaCAm7A8BSa/XpuiYPNZUIE89yIcoz?=
 =?us-ascii?Q?du++EvZer0v8uQI1q3REbbFcbV37pbbKQbkw2nvWqnH3jhziZS1obSlYyUO2?=
 =?us-ascii?Q?SdkdqiAIfLfNKOC6oVluUUxyRBMAif/MrlfN/QtKEkZSZqUx9LgcL097rnui?=
 =?us-ascii?Q?CPMFUqZv4a4sUOc9pMomt4KXmubhP/66UIfO7zRcQoYT25pnAD+F0wWymJ38?=
 =?us-ascii?Q?o61EN9R9jfWTX4UzqRgm+kfrdBy8utrIJn6er5ivcTaTpyyrYP2r9AuAk6Gn?=
 =?us-ascii?Q?1g87owjGeH4+K06yEH/2dsC3rF40EFwdNvcDCtvWqc9HT6Yeb3kbmJ4J202i?=
 =?us-ascii?Q?LyI4zDYuDfhizvYJak1vfJdSwTTNyeeDQimjXK9lc+z05T6ytWhrXQ4zZ/dW?=
 =?us-ascii?Q?llY2UUCBxG5QkuGp1yQa6hmXpEnbhboLzsnco5mG1p/NfBHtndM0LVh4XxMr?=
 =?us-ascii?Q?fp8lewW7zERGlMeg8/1P7v29PifIp97G63I61GrZohrGLLCc6OMuyKmK0YR/?=
 =?us-ascii?Q?vn6WyhsNmii2mVSNe+VUpR0hJEAjieHrLmzmeFwrC8/8caXphpT5PatWrB1M?=
 =?us-ascii?Q?zlptvB0SCrlJgPvDyJBibYWOZvSvWhIemYrMCklDaPF6P1WMOhvbfzbWWO4o?=
 =?us-ascii?Q?iPdsC2oLbI8Tx3r3xfdHjY6xlLxqCrFr705a+b4HGdDbmU3tEsvOQFVWp6iO?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c23b47-c9da-4ceb-2068-08db01de2f51
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 09:49:59.2832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShhWs5Hka3SiB3rO2YRVJAxheVCLyMw6hqHv8KK28TrzXCSd8+lZTm8oTg3ZdOOIMX1twsldGnNZSyUyaGeOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6889
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 09:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100831

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a87f2ba9cdd4b9689b0d1c86b2e99071d1e069b)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb             | 2 +-
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.1.0.bb
index c8dabc5ea..44804545d 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/dbus-cxx/dbus-cxx.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0001-Include-typeinfo-for-typeid.patch \
            file://0001-include-utility-header.patch \
 "
-SRC_URI:append:libc-musl =3D "file://fix_build_musl.patch"
+SRC_URI:append:libc-musl =3D " file://fix_build_musl.patch"
 SRCREV =3D "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
=20
 DEPENDS =3D "\
diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/=
meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index c95a5b2d3..1c2c6e21e 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "openssl"
=20
-EXTRA_OEMAKE:append =3D "PREFIX=3D${prefix} LIBDIR=3D${libdir} USE_SHARED_=
LIB=3D1"
+EXTRA_OEMAKE:append =3D " PREFIX=3D${prefix} LIBDIR=3D${libdir} USE_SHARED=
_LIB=3D1"
 # We want to statically link the binary to libfsverity on native Windows
 EXTRA_OEMAKE:remove:mingw32:class-nativesdk =3D "USE_SHARED_LIB=3D1"
 EXTRA_OEMAKE:remove:mingw32:class-native =3D "USE_SHARED_LIB=3D1"
--=20
2.35.1


