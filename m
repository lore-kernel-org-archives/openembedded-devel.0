Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC62FC97E2
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:58:42 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48031.1774866311860803730
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=l4Q34oTK;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.69, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQYnUH/X6lNcUlSp6y5BNVGGyC1RxWNK9f32sv87HB+9FnPmhwPhoufQT8VSNmBlh8oT4vbt1nuAKYxa5Lf928flfiOYsVdYfSYzSMNLPisHF6zR4h8nIc6gHNUXyZgWMxJBpwGLDDh//ItU1XC9qVdvM2SUe6+i1YWaj346BkBi1Lalpsr03FqlNxAKHTRNv3ylrwM4zo5KQd3TmM5+vRhYB3N5EVVc+aI1+2P3kVK80WLJAAFHjuzhBbYaAFyKvOwA3YtZrBgB90EDUtEmXqhci3Mf8wBInlHsLFRLEbaZvr+81d/A97130gM50wDCO6x0VaE2VyNaQlK7aFsahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+eYgI+gY1/NS2PZD2jAa3kwy1Q+7ART7D20DH1UICc=;
 b=wmMZvMBtaFW45Ub22uMlpYYP3HtKs0FLxyj/7us9g/3/c2ekFUloxlm0ghXZeMJWT8Y/6AVasdKR75Sdu2l8alcLVE5fgwKPBRuY/jwRGtzNp3h1mkXVNS7ETcf5zxbnSV6izecnXmc3bBUf/pB9i9lwcjZ0e3UFewH+rcdATw9o8JpBbRohZ24/OlE2pcZVVOo0fIHMDx2g3u35dSbqNNHxPlFMzAw85sHxsY8yvCp7OEbB0CZMmNIAclbAOV+wGnRzayhaJniUgJvKDRJZmd9j1vAZgic6B420JsrGKVxLvHeh5I/yE/CurozHi11WH+Hk0Qe6Eud2SqjZn1KXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+eYgI+gY1/NS2PZD2jAa3kwy1Q+7ART7D20DH1UICc=;
 b=l4Q34oTKh4llal7CSpbwyyPNLhIjRGLBRpuLdcVYwcxGq/3ZMwWHGai5rfs2BkYkYifrZTan9ch+pc/Q+k+GRZ/Il94h9/dMX9JctusYBqYCI1J8HbdSJWPkJGvIgrNvh3TSX+HyvqeEGQYyuTbDhE6jwSjryMLoA4VwRXjm8AW7qcEHUGEwvKUxXzhpb8hSLjrvFBitr+bW8xOjQBa4aLsnF+KOI3H6M2Japf8Bdu4inpwhtBKk1H9Uh7OXDdyrT8GR+6izlFTE8zb8LwV7miTe5l/eHkaP/64XNbac87M5cpUpIN+/bGQDvVi7VmPPKKnHNLHTriKbHHurRBR5LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN6P287MB5279.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:08:23 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:08:23 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v2 2/2] android-tools: move android-tools v29.x from dynamic-layers/selinux to meta-oe
Date: Mon, 30 Mar 2026 15:37:44 +0530
Message-ID: <20260330100744.739123-3-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330100744.739123-1-git-patches@bmwtechworks.in>
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
 <20260330100744.739123-1-git-patches@bmwtechworks.in>
X-ClientProxiedBy: PN4PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::16) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN6P287MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 980fce77-7292-4292-dcb9-08de8e4446e5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|55112099003|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	M01FiQf3uA9E46UfW/Ejuc43px9adCNRkXKuxubtZnb5kN2PaD92sABg4hDkVUe6FQL8ooNC3zMeRQ5Qfmn9M8oExZQh4aZ8o90O73QrJQ6gnADiS/sNPhCXs+i8DMU+6PhIsgmS/dx5+GTfT/l9JcY7AQ6AwTSU6vy8H7k1QwZ0Ej+3dsdg+FaFvfY2q2xyi/2EvDdHW8ZPn27mioMPOvLfoPpDBPY+EG4KNx8aR6jerLLsvOxD7eg5QkSoiQCn52bia1e4YUaBrM9kxRu1LeBtXvvdB5MFnwbJxCY7jSH7IZZppu8s+Mnjh4FW3JHJQ0FaQd2EDJWBTrtTK+2IeVxAeI7wAUd8efHUAnTbCnRmJUQNXYqfd16PO0lAoGb7a6UaaX6f3N4O2ro6b2C+SVbowcOSmbu5uBU1gTU01DSH5PzvmaLdIwKLmJxmBgei5nLrun4BixZksDZolXSz0XNGzuFo/XPJU0PIRcbFY7FVguBaPvO4mGzXzJfVNT1L76ulf6X3q6xhlyv8LavHrV7y4Ksf0ObI3dH6pYwGHLS1zhlNKDdV4G5TFzGe7/6hnZjKV6mDaiiZ9JwkUqKDfzK+Q3fKKLX30BfxqniWWmpPic2c4r8P32obNOgWn3zXlJptwTeQZuYA/8U3HZ1FE4s2nUZzO6cnRLZ411SdtkPX/AnFydUkIy4OCBjeAYud9z17mSd8NJObYmAU6bV5/dYgvbBoXOb/2okaNj6kbaBYSlebEhnr1xKU9e1Ri0KYyWPiT33snnzSU+qwo/T3Za9djZmEDkHthoI7/VKAQNo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(55112099003)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ATFQxjmenv/OkcgK0sU78OSwW9mWNaYhU3HiWlWd4jnzixLp47Oo1w4lRQWo?=
 =?us-ascii?Q?iLQvl5SK1duye5WKk34isWPkFqOHIk6u1edQWpZp8z9rNycZEq9gGA2wZfls?=
 =?us-ascii?Q?N/0bWxaoQJgtzimLyz1feQyZwF3M6UpljrnwUlk2XBvxURS502oxcM+uGYZf?=
 =?us-ascii?Q?E9/6Rnc0R4JiG+QvikpukJa3srJsksRBngPn5bBYYC3GMmKDuK723+JT/ajg?=
 =?us-ascii?Q?JYqhCUb/SbFfnQo7STCWbLyWq3PmI1fQmUy6QP8fg6+YoC/co4tehibxJUre?=
 =?us-ascii?Q?NDyV/j7thaP7Ehh6rGeqSJ2HXguQGnKpWowx9bigmj8w86DnJrsTuQuhp3CD?=
 =?us-ascii?Q?FOvbcSqVMGAm1Y5LJuJVpncVnuOWaBHxKblCxPEh2BOjuoL4uKSyw90YKFzi?=
 =?us-ascii?Q?jpmYRYh3+sL6vvUCeghbBn9KHcwKErFSVz/sVZgxrUDralVwAJGQEdCPJ2H+?=
 =?us-ascii?Q?o+GimLBf7BRQp0jqfJvAx/rk+6LD4vffMjjNUrMeIfHemUfPVT5tK7PrYNXl?=
 =?us-ascii?Q?nmukMsNMuFhUFlys3zF3bxQg6Uly6OLLEQKae9y5VbH5sGRZ+/DvcsPRicua?=
 =?us-ascii?Q?Qlj8mfBybqHC3eVyIgOskAM7xBam9gR4OT3FUv8t0Ykcrgf0DL4XZGDHnCqD?=
 =?us-ascii?Q?gickYcErLOwToZS3Oh3s9Caht5k8D40Fai48FmDRfIqi82SY3QI8uIVlH3ka?=
 =?us-ascii?Q?GT1VupCNYM+HyPmo1WPuFwcGsyUSjBT8GIOuZGCJHShKadtWCi0vwfjibzd5?=
 =?us-ascii?Q?KIkFthU0Zisw3xTyT0q+H8XAWq9u9SGe4oxOseOdz7rz+auzUkvQagEvATWl?=
 =?us-ascii?Q?4SEL/leWzxNZzYGnc+hGl8nh/O4TVqL7sI3KoCpQlXdcrCk0TFDsyDIcDRkw?=
 =?us-ascii?Q?HGiogq6J5GknpGZofNIoMV0DttsjGf4kZS7vOaOiR8URaNnWoVbxw3EEsUew?=
 =?us-ascii?Q?VjmqqkAg0VSPs3kNpP6Bl/BFVg88cxf0MXA5RaKC1LanDmDiKZXq08RS7Xr0?=
 =?us-ascii?Q?POb8u9wOJ6t+v38s+CgZ/A53++7WRI+5RmftNIbn//2frHNXWXpNhIBtaZm7?=
 =?us-ascii?Q?4mIF6LV3QJ19JM/sdTW+LwnGdHg8NlDi6xn39rsM2zoB3w6LvA7UeHR5I1o3?=
 =?us-ascii?Q?UbVlIoStozBNxD1GmDyjmR1sTYBt7JmDh892PL9WEkmiM2ofLSMykOqLfO8F?=
 =?us-ascii?Q?fUIkXFZDjkraZK/Wpo2O7s8Eju4AtrYNUXIQLsrTvG/yvBAPrOQhn2+vxndC?=
 =?us-ascii?Q?LSZrHmBj/clqfStvZm+JWrQnpRI8xfBdlVBACF4P2URn9Vn9ZIRDEILHSGnu?=
 =?us-ascii?Q?w9m1V3keb8kk/XeF2Yil02Txz+/Hx93COZzkeeG2qx9U3dEE231172G4PotH?=
 =?us-ascii?Q?5lsOEKgW8lZEH6h9HF8XBEq0kK4GeMr6fjK8H1RAW41yPDMLrQfcpj/24GkK?=
 =?us-ascii?Q?YWyR8gPv2Oz/iTssASd3lOZ2eim9xhtu5vbg64mVvigrqNwNZcjupd9oAx/g?=
 =?us-ascii?Q?Ovzcdw9Q8YG7KNWjxFxI5Qk3vpOv475QmF5ZMklMAKS1amM5mHw4Uhi8VWC/?=
 =?us-ascii?Q?ZG1iyed88QZHODikjVPfcUBvUidJ3a/k5K25B3LdefrBFT9HNwuavIzMjVsN?=
 =?us-ascii?Q?4uE/ToeLxJkYRNzdW6vX1dLZxrNBkEQtc+Q+NeqxCUyW5uIGGAmurXfw8jwU?=
 =?us-ascii?Q?MSl+Qo7DJN5gc3HSSZywREMgJUzVQLPpZhm4ztJeo3bXCYZpXtbfnP3AQMvf?=
 =?us-ascii?Q?CWkURu7SwW00gjY7uLnm8UPQPRT5qyE=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 980fce77-7292-4292-dcb9-08de8e4446e5
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:08:23.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHxlhwERoaCqsZa1yVjSre5/RErfUL9MblNbodmKer+tzVZWvF/B0DmV4tIxSHupqystlt9tXE7ndx9bnCYXt8PASD9aBXnein6AR6yvdrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5279
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125863

From: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Relocate the recipe from dynamic-layers/selinux/ to the main
meta-oe/recipes-devtools/ directory.

The android-tools recipe (version 29.0.6.r14) was previously restricted
to the selinux dynamic-layer.
Investigation shows that version 29.0.6.r14 does not have a hard dependency
on libselinux for core tool functionality.
(adb, fastboot, and sparse image tools).
- Basic runable test was done for binaries in android-tools-native
- Checked for selinux absense by looking for selinx using $ ldd binary-name

Changes:
- Relocate recipe from dynamic-layers/selinux/ to recipes-devtools/

Signed-off-by: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../android-tools/android-tools-conf/android-gadget-setup  | 0
 .../android-tools/android-tools-conf_1.0.bb                | 0
 .../android-tools/0001-Fixes-for-yocto-build.patch         | 0
 .../0001-liblp-fix-building-with-GCC-14.patch              | 0
 ...roid-tools-modifications-to-make-it-build-in-yoct.patch | 0
 ...ate-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch | 0
 .../0004-adb-Fix-build-on-big-endian-systems.patch         | 0
 .../0005-adb-Allow-adbd-to-be-run-as-root.patch            | 0
 .../android-tools/android-tools/adbd.mk                    | 0
 .../android-tools/android-tools/android-tools-adbd.service | 0
 .../android-tools/debian/Add-riscv64-support.patch         | 0
 .../android-tools/debian/Added-missing-headers.patch       | 0
 .../android-tools/android-tools/debian/Nonnull.patch       | 0
 .../android-tools/android-tools/debian/Vector-cast.patch   | 0
 .../android-tools/debian/add-missing-headers.patch         | 0
 .../libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch       | 0
 .../libunwind/legacy_built-in_sync_functions.patch         | 0
 .../libunwind-fix-strchr-conformance-to-ISO-C23.patch      | 0
 ...unwind-guard-unreachable-macro-to-avoid-redefinit.patch | 0
 .../debian/external/libunwind/user_pt_regs.patch           | 0
 .../debian/fix-attribute-issue-with-gcc.patch              | 0
 .../android-tools/debian/fix-build-on-non-x86.patch        | 0
 .../debian/fix-gettid-exception-declaration.patch          | 0
 .../debian/fix-standard-namespace-errors.patch             | 0
 .../android-tools/debian/hard-code-build-number.patch      | 0
 .../android-tools/debian/libusb-header-path.patch          | 0
 .../android-tools/debian/move-log-file-to-proper-dir.patch | 0
 .../android-tools/debian/simg_dump-python3.patch           | 0
 .../android-tools/android-tools/debian/stdatomic.patch     | 0
 .../android-tools/debian/stub-out-fastdeploy.patch         | 0
 .../debian/system/core/Add-riscv64-support.patch           | 0
 .../debian/system/core/Added-missing-headers.patch         | 0
 .../android-tools/debian/system/core/Nonnull.patch         | 0
 .../android-tools/debian/system/core/Vector-cast.patch     | 0
 .../debian/system/core/add-missing-headers.patch           | 0
 ...roid-tools-scope-write-macro-to-prevent-conflict-.patch | 0
 .../debian/system/core/fix-attribute-issue-with-gcc.patch  | 0
 .../debian/system/core/fix-build-on-non-x86.patch          | 0
 .../system/core/fix-gettid-exception-declaration.patch     | 0
 .../debian/system/core/fix-standard-namespace-errors.patch | 0
 .../debian/system/core/hard-code-build-number.patch        | 0
 .../debian/system/core/libusb-header-path.patch            | 0
 ...ziparchive-fix-missing-fixed-width-integer-types-.patch | 0
 .../debian/system/core/move-log-file-to-proper-dir.patch   | 0
 .../debian/system/core/simg_dump-python3.patch             | 0
 .../android-tools/debian/system/core/stdatomic.patch       | 0
 .../debian/system/core/stub-out-fastdeploy.patch           | 0
 .../debian/system/core/throw-exception-on-unknown-os.patch | 0
 .../debian/throw-exception-on-unknown-os.patch             | 0
 .../android-tools/android-tools/remount                    | 0
 .../android-tools/android-tools/rules_yocto.mk             | 0
 .../android-tools/android-tools_29.0.6.r14.bb              | 7 ++++++-
 52 files changed, 6 insertions(+), 1 deletion(-)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools-conf/android-gadget-setup (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools-conf_1.0.bb (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0001-Fixes-for-yocto-build.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch (=
100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0002-android-tools-modifications-to-make-it=
-build-in-yoct.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-=
new-kernel-UAP.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.pa=
tch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch=
 (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/adbd.mk (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/android-tools-adbd.service (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Add-riscv64-support.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Added-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Nonnull.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Vector-cast.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/add-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015=
-3239_dwarf_i.h.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/legacy_built-in_s=
ync_functions.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/libunwind-fix-str=
chr-conformance-to-ISO-C23.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/libunwind-guard-u=
nreachable-macro-to-avoid-redefinit.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch (=
100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-build-on-non-x86.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-gettid-exception-declaration.pat=
ch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-standard-namespace-errors.patch =
(100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/hard-code-build-number.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/libusb-header-path.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch (1=
00%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/simg_dump-python3.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/stdatomic.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/stub-out-fastdeploy.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Add-riscv64-support.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Added-missing-headers.pa=
tch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Nonnull.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Vector-cast.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/add-missing-headers.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/android-tools-scope-writ=
e-macro-to-prevent-conflict-.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-attribute-issue-with=
-gcc.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.pat=
ch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-gettid-exception-dec=
laration.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-standard-namespace-e=
rrors.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/hard-code-build-number.p=
atch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/libusb-header-path.patch=
 (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/libziparchive-fix-missin=
g-fixed-width-integer-types-.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/move-log-file-to-proper-=
dir.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/simg_dump-python3.patch =
(100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/stdatomic.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/throw-exception-on-unkno=
wn-os.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch =
(100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/remount (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/rules_yocto.mk (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools_29.0.6.r14.bb (96%)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-t=
ools/android-tools-conf/android-gadget-setup
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools-conf/android-gadget-setup
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf/android=
-gadget-setup
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-t=
ools-conf_1.0.bb
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools-conf_1.0.bb
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/0001-Fixes-for-yocto-build.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/0001-Fixes-for-yocto-build.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/0001-Fixes-for-yocto-build.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-f=
or-yocto-build.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/0001-liblp-fix-building-with-GCC-14.patch b/meta-oe/recipes-de=
vtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patc=
h
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/0001-liblp-fix-building-with-GCC-14.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-f=
ix-building-with-GCC-14.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patc=
h b/meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools=
-modifications-to-make-it-build-in-yoct.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0002-android=
-tools-modifications-to-make-it-build-in-yoct.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patc=
h b/meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-=
of-usbdevfs_urb-to-match-new-kernel-UAP.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-=
usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-sy=
stems.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/0004-adb-Fix-build-on-big-endian-systems.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix=
-build-on-big-endian-systems.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch b/meta-oe/recipes-=
devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.=
patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-All=
ow-adbd-to-be-run-as-root.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools=
/adbd.mk
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/adbd.mk
rename to meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-=
tools/android-tools/android-tools-adbd.service
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/android-tools-adbd.service
rename to meta-oe/recipes-devtools/android-tools/android-tools/android-tool=
s-adbd.service
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/Add-riscv64-support.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/debian/Add-riscv64-support.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/Add-riscv64-support.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-r=
iscv64-support.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/Added-missing-headers.patch b/meta-oe/recipes-devtools/=
android-tools/android-tools/debian/Added-missing-headers.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/Added-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Added=
-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/Nonnull.patch b/meta-oe/recipes-devtools/android-tools/=
android-tools/debian/Nonnull.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/Nonnull.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnu=
ll.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/Vector-cast.patch b/meta-oe/recipes-devtools/android-to=
ols/android-tools/debian/Vector-cast.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/Vector-cast.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Vecto=
r-cast.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/add-missing-headers.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/debian/add-missing-headers.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/add-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/add-m=
issing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.pat=
ch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/l=
ibunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patc=
h
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/exter=
nal/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch=
 b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/lib=
unwind/legacy_built-in_sync_functions.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/exter=
nal/libunwind/legacy_built-in_sync_functions.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-=
ISO-C23.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian=
/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-I=
SO-C23.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/exter=
nal/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to=
-avoid-redefinit.patch b/meta-oe/recipes-devtools/android-tools/android-too=
ls/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-red=
efinit.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-=
avoid-redefinit.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/exter=
nal/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/external/libunwind/user_pt_regs.patch b/meta-oe/recipes=
-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_reg=
s.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/external/libunwind/user_pt_regs.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/exter=
nal/libunwind/user_pt_regs.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/fix-attribute-issue-with-gcc.patch b/meta-oe/recipes-de=
vtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patc=
h
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/fix-attribute-issue-with-gcc.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-a=
ttribute-issue-with-gcc.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/fix-build-on-non-x86.patch b/meta-oe/recipes-devtools/a=
ndroid-tools/android-tools/debian/fix-build-on-non-x86.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/fix-build-on-non-x86.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-b=
uild-on-non-x86.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/fix-gettid-exception-declaration.patch b/meta-oe/recipe=
s-devtools/android-tools/android-tools/debian/fix-gettid-exception-declarat=
ion.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/fix-gettid-exception-declaration.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-g=
ettid-exception-declaration.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/fix-standard-namespace-errors.patch b/meta-oe/recipes-d=
evtools/android-tools/android-tools/debian/fix-standard-namespace-errors.pa=
tch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/fix-standard-namespace-errors.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-s=
tandard-namespace-errors.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/hard-code-build-number.patch b/meta-oe/recipes-devtools=
/android-tools/android-tools/debian/hard-code-build-number.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/hard-code-build-number.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-=
code-build-number.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/libusb-header-path.patch b/meta-oe/recipes-devtools/and=
roid-tools/android-tools/debian/libusb-header-path.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/libusb-header-path.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/libus=
b-header-path.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/move-log-file-to-proper-dir.patch b/meta-oe/recipes-dev=
tools/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/move-log-file-to-proper-dir.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/move-=
log-file-to-proper-dir.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/simg_dump-python3.patch b/meta-oe/recipes-devtools/andr=
oid-tools/android-tools/debian/simg_dump-python3.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/simg_dump-python3.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_=
dump-python3.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/stdatomic.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/debian/stdatomic.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/stdatomic.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/stdat=
omic.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/stub-out-fastdeploy.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/debian/stub-out-fastdeploy.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/stub-out-fastdeploy.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-=
out-fastdeploy.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/Add-riscv64-support.patch b/meta-oe/recipes=
-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-suppor=
t.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/Add-riscv64-support.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/Add-riscv64-support.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/Added-missing-headers.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/debian/system/core/Added-missing-he=
aders.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/Added-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/Added-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/Nonnull.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/debian/system/core/Nonnull.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/Nonnull.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/Nonnull.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/Vector-cast.patch b/meta-oe/recipes-devtool=
s/android-tools/android-tools/debian/system/core/Vector-cast.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/Vector-cast.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/Vector-cast.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/add-missing-headers.patch b/meta-oe/recipes=
-devtools/android-tools/android-tools/debian/system/core/add-missing-header=
s.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/add-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/add-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-=
conflict-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debi=
an/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-c=
onflict-.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/fix-attribute-issue-with-gcc.patch b/meta-o=
e/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attri=
bute-issue-with-gcc.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/fix-attribute-issue-with-gcc.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/fix-build-on-non-x86.patch b/meta-oe/recipe=
s-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-=
x86.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/fix-build-on-non-x86.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/fix-build-on-non-x86.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/fix-gettid-exception-declaration.patch b/me=
ta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-g=
ettid-exception-declaration.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/fix-gettid-exception-declaration.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/fix-gettid-exception-declaration.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/fix-standard-namespace-errors.patch b/meta-=
oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-stan=
dard-namespace-errors.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/fix-standard-namespace-errors.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/fix-standard-namespace-errors.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/hard-code-build-number.patch b/meta-oe/reci=
pes-devtools/android-tools/android-tools/debian/system/core/hard-code-build=
-number.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/hard-code-build-number.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/hard-code-build-number.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/libusb-header-path.patch b/meta-oe/recipes-=
devtools/android-tools/android-tools/debian/system/core/libusb-header-path.=
patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/libusb-header-path.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/libusb-header-path.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integ=
er-types-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debi=
an/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/libziparchive-fix-missing-fixed-width-intege=
r-types-.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/move-log-file-to-proper-dir.patch b/meta-oe=
/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-f=
ile-to-proper-dir.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/move-log-file-to-proper-dir.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/move-log-file-to-proper-dir.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/simg_dump-python3.patch b/meta-oe/recipes-d=
evtools/android-tools/android-tools/debian/system/core/simg_dump-python3.pa=
tch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/simg_dump-python3.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/simg_dump-python3.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/stdatomic.patch b/meta-oe/recipes-devtools/=
android-tools/android-tools/debian/system/core/stdatomic.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/stdatomic.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/stdatomic.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/stub-out-fastdeploy.patch b/meta-oe/recipes=
-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeplo=
y.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/stub-out-fastdeploy.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/stub-out-fastdeploy.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/system/core/throw-exception-on-unknown-os.patch b/meta-=
oe/recipes-devtools/android-tools/android-tools/debian/system/core/throw-ex=
ception-on-unknown-os.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/system/core/throw-exception-on-unknown-os.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/syste=
m/core/throw-exception-on-unknown-os.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/debian/throw-exception-on-unknown-os.patch b/meta-oe/recipes-d=
evtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.pa=
tch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/debian/throw-exception-on-unknown-os.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/throw=
-exception-on-unknown-os.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/remount b/meta-oe/recipes-devtools/android-tools/android-tools=
/remount
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/remount
rename to meta-oe/recipes-devtools/android-tools/android-tools/remount
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools/rules_yocto.mk b/meta-oe/recipes-devtools/android-tools/androi=
d-tools/rules_yocto.mk
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools/rules_yocto.mk
rename to meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.=
mk
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/android=
-tools_29.0.6.r14.bb
similarity index 96%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools_29.0.6.r14.bb
rename to meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.b=
b
index 3d4e95b496..3340ca7827 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-=
tools_29.0.6.r14.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b=
1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d691=
9e203a55f9 \
 "
-DEPENDS =3D "libbsd libpcre zlib libcap libusb squashfs-tools 7zip libseli=
nux googletest"
+DEPENDS =3D "libbsd libpcre zlib libcap libusb squashfs-tools 7zip googlet=
est"
=20
 SRCREV_core =3D "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
=20
@@ -167,6 +167,7 @@ do_install() {
         install -d ${D}${bindir}
         install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
     fi
+
 }
=20
 PACKAGES =3D+ "${PN}-fstools ${PN}-adbd"
@@ -191,3 +192,7 @@ FILES:${PN}-fstools =3D "\
 FILES:${PN} +=3D "${libdir}/android ${libdir}/android/*"
=20
 BBCLASSEXTEND =3D "native"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 's=
elinux', '', d)}"
+PACKAGECONFIG[selinux] =3D ",,libselinux"
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'HAVE_=
SELINUX=3D1', 'HAVE_SELINUX=3D0', d)}"
--=20
2.34.1


