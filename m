Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF48FCCA483
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:16 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.67])
 by mx.groups.io with SMTP id smtpd.web08.35522.1656663731775507795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GZb4CmtL;
 spf=pass (domain: kpit.com, ip: 40.107.239.67,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itnyAKTiUMedEfZwoT2Y8Epyo3TKXD98qiSG7Wfz1S975iJCfRXl/DoKVPze3E4RVrUpImoWzQHODbvLSsVLJct7ILa/yktEwQ/Zfzri8xiXMqCXxceMKoeL9gWOW2sX2urJleKIK3UM/OMN1ov1OF/ek8GShAu8aMyJ3FZ9F/Ow+CQRoq61AwYMCp0Jn20P3Yuob0WcNCIiKqu4gQYYyRnfojbxBmRayvfllPmqw6mC3s4643ODmmWxHkyPO1HNEQ1nhvwyCpZ2tvY9LcKCTIE/23ETRTVjHSFQSfaponGUc6Fb+ishQ9gqrpl9kPMmDZGuS1IoT+rsURZu83sLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEkRju/UjyBkYYsXgjphrRCxZzI993CiZ4Ly0r0y3NU=;
 b=G+bp8MZMrv5gii1DFc0nY2NOTYRSzyP2cwh8m0X/vGu4vIIe2TY4RXXceWwTOJkolxfhKChRZojBXtFCPwD1rbLIxiG5nnisY4PpQRb3WfkD7i4HtJvmcE6GR6h8MiMIkmLCciJUoDrNhGBt+mpioOwRQ6980xYH6syUVlHLh/wtaoy+Yg0z2VB5y2JfecT5p/zw4jEK+jnJyuqcknVcZ9a5ApeO/xo0njfxKj/47JqEzMgQ8nbg4mlAXmLbFJuZiGpB65LwS17oLj1sTs6IdvBeN2P7LaZkKz3DfxheX7gg1jI7Ks0C/h8ScGMddhcRrvwTBwyOUdopgrBS3ECmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEkRju/UjyBkYYsXgjphrRCxZzI993CiZ4Ly0r0y3NU=;
 b=GZb4CmtLOFUHnqLkfWBr5WWc3yZ/DJpw9PNdTjrNOJkfMPist3eKDm5j7MxsRTutaPAdgYyJid9GY0dFXF9kq3DVeH4Y7WGRBlBKImYSq0SJYbfD3gyuLxC8y9YnuuDoNdkQVs4KMJ6xFyPWoSIWPzqDBwrXcTC+dgxBx1kkWtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by BM1PR01MB1044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 08:22:04 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:04 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 4/8] ntfs-3g-ntfsprogs: Fix
 CVE-2022-30784
Date: Fri,  1 Jul 2022 13:50:58 +0530
Message-Id: <20220701082102.17835-5-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193ad282-7776-40c3-e55b-08da5b3ac790
X-MS-TrafficTypeDiagnostic: BM1PR01MB1044:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmAe9KmGtvVDif3OQNXuvmdtog+e+7sBY18F1oepZz61QHF65BmvzKp+Et1XQMdfvyaOO07+NnuhxOPL2EHFzO5FHwpxmMZ28Bs3yua5UY2Ndo8Rm6KhJyoBnOI5LPrEKDHpeEX3Xm3vwTprCWG7TWNNN11Ka5n2Yo7zH/FG35nAXGWDPlS4KyrXkomdKaBqxFa91gj6LMxOmdUKEAEGtaB/8WsKDiXhDikrWuxEsU2IHg++A3ImmDkInaFOwuUdCrUiN3jxON5279r3hEibRsQ90NZ3gh/kLhjDgN01/n3JR+eOuRBQt1R/21j2c48irzsV6VapXQ0lTx8CpnJNQAVGLa0BH4LSR8Pb27UPXJZ3OtTH/sWmPMFTGsFLDpTaWNv/s8mKw88qzGMmGNE3bbtHbmcookHE1YrTwxYdJ52cfYztE7uhQTklsatKLozyQIh1MUuzfFRJ+zaUjWYH2RM7XLonzRKkJeUAHombBY8F9ua7HK2wYqqCK9dDuhoCKZDPygpMZORsx6v5Wt5mWVsn3ch+KLoCNviAzUi9NdSe4p8xzv79iS1d49tHJFlYS+zN4G6kNlvdfJ4b+A0NnDHNdxl9bLQiA5X7uVczxPyctVNvLI1pf6uIxRHmptGdvdpH22njrkqYoA+ErgMvLbRG5S9qrS3763Z1YyM06NbvgSPAEPDpHN+bmZM90bip93WPHKxkrmgek4pXl1+Gm2RLhVvUboD/+SoW0kdxvI5UHE1kI7MJb8bOIdzcvXnrwsUxkNtN/PFtqVe7zPAgqP+d6LolH4jm74xmAQiXhaU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(66574015)(83380400001)(1076003)(66946007)(316002)(6636002)(6666004)(66556008)(8676002)(86362001)(36756003)(4326008)(6512007)(52116002)(107886003)(5660300002)(8936002)(2616005)(6506007)(66476007)(478600001)(6486002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VM4lzbn/CJ+iWeErE/r1TBaHEvSEdMUkD8m92k0XQwCxxTIVwH9QzEUr1WWk?=
 =?us-ascii?Q?hC+o8ZC4s4PVh+O7xU3dUPhVObEaSsWWGC+D9ZxaIf/tp4I0/jiYrWMuXg5V?=
 =?us-ascii?Q?Ruo5LDrIje33N25GYGZteOomnxSpjCK3gT5tX5xkrSiSIWI1FDIbMOGOo74x?=
 =?us-ascii?Q?N7OK5dSojyP7UtDhfUT+1PYDyVe1RCuQl88GHu5WR2BN2L7Q0cjld8RG2xZQ?=
 =?us-ascii?Q?iewpgMR1ic2QCpbmT6tae4xuujSBd9Wrvw1jq2tyKUtjlIkSE1FUpafMru/R?=
 =?us-ascii?Q?BapdvGpel/haFJEh3oyxJEX+LR3E68KkI/HP2QkGF4Rz1ZII5rNeakTUCsdj?=
 =?us-ascii?Q?+ewyV1AOP3sa3eLOjwQxGe8gZzy5D1ze9ZcDTBwaMSN7jqe/2Fy6O8155M+x?=
 =?us-ascii?Q?bxFMG1vtkh8ODks/S1g6Z61nRqClRoszRdwTEbLUdDOQIRPoOBFsr9cb6pGg?=
 =?us-ascii?Q?zB9pvANNXvjh3dVpHsVZhtWYkxOzbIdfYtEKytUc4i3hKaqKPOJxGZSA9Ge9?=
 =?us-ascii?Q?swdrt5goa8Qj3yrEYL8uTp2d3i8qcgZ9+R+WJkgI9+UHlKsZz3IL2Oo7v1vY?=
 =?us-ascii?Q?E5Yr9baGxjCXTMZztedlGAGQFzcrYD61pkXiSuO2pYAkU6c2HLkqg9nbW5U4?=
 =?us-ascii?Q?hNUE/VGygxX/ccluovNT6s1HynFJyPGV8fqmwXYQGIrOUJ89eDhmXdxnH5Ez?=
 =?us-ascii?Q?8RIKWkbG6nnaNOTkcwpidwR6ly1ETbe2EyQ0o/V3PRTDBS6NzdzySZgHu6JC?=
 =?us-ascii?Q?yytXk1nx5BwW4X2Zqh8bmLQgzgRhJMzqvPmHK4dL9PGIPx8BBFX8vEFXS2Gr?=
 =?us-ascii?Q?kum6bandZ2a/L38COSyW9h70QDNPn89Yko2F1YRp6OVlWaGRfA8AA1gyUfho?=
 =?us-ascii?Q?41zAAgm7e8iF8UPocvGVUmOakMeLvtxzOsxXj2lAmUzPExOqDdjen0Cs4NHl?=
 =?us-ascii?Q?FvVKF79VNL6kig6BM1xsoXJIqTGyaFpsGMzT7RdiPBSP/01zrqWziLl+dD0s?=
 =?us-ascii?Q?+044UCdtHl/p1ZwxWk3CBVj2N2NZNQyNZzcQLvEYpXg5obApfJkYi34jWhym?=
 =?us-ascii?Q?GTQXrMMWLIJnYUVTJE+VGALHNXpNjpiyi9hDXHz8SWAGc4fMOuqnlzcsuCVz?=
 =?us-ascii?Q?JiXJ8xp2knI/IXNIlNP30bo2IPxf4BayYVQ0ltPTTmnX/6CNtLVvrof6TLF5?=
 =?us-ascii?Q?kv6FhkZU0lTnMvwm1R6Xh8GvIz2M5N1WWsMougqXkx5oU7Zm+02QAy6D7GBa?=
 =?us-ascii?Q?GIpwg/WwHJjeWjdKjAKvHKhZ7UQt9ulwJz8uFoukTkoyLgHpaBaoqrA+3OpM?=
 =?us-ascii?Q?1PLfUReyd0cHuy+Wu2yXVTVeiZ1yab9FkJjeKQ5Ll9NFAlBOh2efRWJKCXI8?=
 =?us-ascii?Q?KTHwlwwVYlQPZCvczNl3IVnCnzgEpv9kKlwPJe2Rlp/oxReQc+tuBRupgSLy?=
 =?us-ascii?Q?yUZ8eAd1R5HPTugVTTXE8RGHPa4m4sGqN/SAtZKKxYSmYgDRLONbaMN1YpPy?=
 =?us-ascii?Q?1h093H7fHSiQiZUgJmPqgPfrjMo9ch5AKaTjTb7Ybgoep32jHmWAEMHTh5e3?=
 =?us-ascii?Q?3nyzvOBzShPs5jvkomw+p9x1UE6BGhgMAOr0mqdeGmE4vUYUbGEctwdaunvG?=
 =?us-ascii?Q?EOSg9Vh9dhBaR4+wU46XQMkyD+8R0o0DOgjk7Ll7FW3PXn6rP86ChU0OOPhk?=
 =?us-ascii?Q?kbhs2g=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 193ad282-7776-40c3-e55b-08da5b3ac790
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:04.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uRcG2ggCxg5QoyMFIatqKuvEus8T3WqjTsQrH2zUIRuhmjvffQHrvGiaSU2GsipELaJ6mXOZtPq4GMPcjx5OhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB1044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97654

From: Omkar Patil <omkar.patil@kpit.com>

CVE: CVE-2022-30784

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../ntfs-3g-ntfsprogs/CVE-2022-30784.patch    | 74 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30784.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30784.patch b/meta-filesystems/recipes-filesystems/ntfs=
-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30784.patch
new file mode 100644
index 000000000..ff4ee6df0
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30784.patch
@@ -0,0 +1,74 @@
+From 60717a846deaaea47e50ce58872869f7bd1103b5 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 21 Sep 2021 10:56:06 +0200
+Subject: [PATCH] Avoided allocating and reading an attribute beyond its fu=
ll
+ size
+
+Before reading a full attribute value for internal use, its expected
+length has been checked to be < 0x40000. However the allocated size
+in the runlist may be much bigger as a consequence of a bug or malice.
+To prevent malloc'ing excessive size, restrict the size of the last
+run to read to the needed length.
+
+CVE: CVE-2022-30784
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libntfs-3g/attrib.c | 24 ++++++++++++++++++------
+ 1 file changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/libntfs-3g/attrib.c b/libntfs-3g/attrib.c
+index 00bfca84..51c8536f 100644
+--- a/libntfs-3g/attrib.c
++++ b/libntfs-3g/attrib.c
+@@ -216,6 +216,7 @@ s64 ntfs_get_attribute_value(const ntfs_volume *vol,
+               if (total + (rl[i].length << vol->cluster_size_bits) >=3D
+                               sle64_to_cpu(a->data_size)) {
+                       unsigned char *intbuf =3D NULL;
++                      s64 intlth;
+                       /*
+                        * We have reached the last run so we were going to
+                        * overflow when executing the ntfs_pread() which i=
s
+@@ -229,8 +230,18 @@ s64 ntfs_get_attribute_value(const ntfs_volume *vol,
+                        * We have reached the end of data size so we were
+                        * going to overflow in the same fashion.
+                        * Temporary fix:  same as above.
++                       *
++                       * For safety, limit the amount to read to the
++                       * needed size, knowing that the whole attribute
++                       * size has been checked to be <=3D 0x40000.
+                        */
+-                      intbuf =3D ntfs_malloc(rl[i].length << vol->cluster=
_size_bits);
++                      intlth =3D (sle64_to_cpu(a->data_size) - total
++                                      + vol->cluster_size - 1)
++                                      >> vol->cluster_size_bits;
++                      if (rl[i].length < intlth)
++                              intlth =3D rl[i].length;
++                      intbuf =3D (u8*)ntfs_malloc(intlth
++                                              << vol->cluster_size_bits);
+                       if (!intbuf) {
+                               free(rl);
+                               return 0;
+@@ -246,14 +257,15 @@ s64 ntfs_get_attribute_value(const ntfs_volume *vol,
+                        * - Yes we can, in sparse files! But not necessari=
ly
+                        * size of 16, just run length.
+                        */
+-                      r =3D ntfs_pread(vol->dev, rl[i].lcn <<
+-                                      vol->cluster_size_bits, rl[i].lengt=
h <<
+-                                      vol->cluster_size_bits, intbuf);
+-                      if (r !=3D rl[i].length << vol->cluster_size_bits) =
{
++                      r =3D ntfs_pread(vol->dev,
++                                      rl[i].lcn << vol->cluster_size_bits=
,
++                                      intlth << vol->cluster_size_bits,
++                                      intbuf);
++                      if (r !=3D intlth << vol->cluster_size_bits) {
+ #define ESTR "Error reading attribute value"
+                               if (r =3D=3D -1)
+                                       ntfs_log_perror(ESTR);
+-                              else if (r < rl[i].length <<
++                              else if (r < intlth <<
+                                               vol->cluster_size_bits) {
+                                       ntfs_log_debug(ESTR ": Ran out of i=
nput data.\n");
+                                       errno =3D EIO;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index ccd18f86c..9e233e127 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-hos=
t.patch \
            file://CVE-2021-46790.patch \
            file://CVE-2022-30783.patch \
+           file://CVE-2022-30784.patch \
           "

 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
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

