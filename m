Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1555CCA47F
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:16 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.67])
 by mx.groups.io with SMTP id smtpd.web08.35522.1656663731775507795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=K1SK/BEx;
 spf=pass (domain: kpit.com, ip: 40.107.239.67,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VArJ7Hy01zbOY8Q7GZ2FIjb4pBLrw+YwPULTVjj/XGzMl3LmnNJPRE9jo0y/rpmLUaEB2/vd2LxGSLhuqeDGWzWcQ7CWslWj7czXwW+xTXK4r0kpklHxbNUqoHCPeqSj9L81pO19eYezaq206WUApRiNmPTSd9Gx6LhAjHOCfuF2bPHeo/hvf7HmYYXQ5ReDwxkenR51VpiDf3Uet/aOfTfW8wSwQ2gKpTnivp5U9LC6uXhJAAvo7XMKWDKEj3Y52Z7upkDOduJc6YmX5gggNECgh0lF7DXe2PeXvY4a3XW7kScpjxBUl4KMQpDhpqu9hTFdiuwWwVO6mvvpo+5JDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg7/PyijWXR4J6bJ3hNQ7//bntiyA+GWbuQ+YKeb6hk=;
 b=JUvEaNuULatMylpara/0Ee65HI93S5IlDzDyezMP+KP8pbh/jObPJ1YOQwysdvPRJFlfGkFBOurNBPRX7fGnURyZsy3efII0eJBDyJx08B8N+J9Jl0kt/yLyL1t/e8j/bSU+4PBZZiVQEj89WDMka+NI/+BfJEClQvGyHK9Ijjazvbg5ma4W3vk+MRsEPY7VAHgh9g/ZgWzF6KwSYLcJ8ffGo8ZLIADho4KTN1gijFIjG4fO3VLCu42Qs+Vhy2iu/vxxZuMJpY6biFz3QhmS1mrn5R5+GVlcZrOkgaYsHjNZdE6L9V+9S+mmG92UxxcZennO4kHKd2PgKxPRuqz1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7/PyijWXR4J6bJ3hNQ7//bntiyA+GWbuQ+YKeb6hk=;
 b=K1SK/BExTa09botaQeiziFxySIVMxoHtWvt5OJz95CicJ3ZNxusgwON+GUgBAz0xnlENuVEmOAonk5NlD2PXoQVjvqcI1Ts5ebyT8fDIrTbXK+1BtgK9N21UCgQ7LR6TIyppp4wlRXL6FKHu9oIdOxfTsLk5Mkvv+xUWUrG/pNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by BM1PR01MB1044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 08:22:03 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:02 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 3/8] ntfs-3g-ntfsprogs: Fix
 CVE-2022-30783
Date: Fri,  1 Jul 2022 13:50:57 +0530
Message-Id: <20220701082102.17835-4-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f4757fe-4f68-4a67-b1ad-08da5b3ac6ab
X-MS-TrafficTypeDiagnostic: BM1PR01MB1044:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rh6p/FTCYvd878rOCRDm/VurVNnd2ETCh4u+xRYiHk7xu6QJyaRhnU/5+70+EwAcUFPvtBE75eDhHJbIjdjPVOa/o5ju2lqoAkrt+WsM4HhQfD8/p+Ma0IMqvZvi42Sc38aMATTVTUiKD2z9cmzvJS8E7YzgDfeo4mZ7D8iplnlC5EgGJPuj73Bl+1hP8CKX/LFL+7XL0mAn8LUNhhgeGTje2EY5QkuSjEu06AyDWOTszO5w8kIFqxlc27zBb6v/hfXDzVs8IfhuHu7/Mz1rzRoEgaig833kW89trVIdy5YwdVNj/MmwAdsClNlKWfeOhCceNyZHmvAV+uWfygU8yxGOyrZgFRiArcDz9Q3//U4DVSg1tRFvOSM0NJSsbSjg6Z29GWWzi+G5mXLRhgWIlWfl34ciz5+Uu6zrHsSFEHh30j6J+JDn9jmjoS5PUvEeBVxDE6ziuJZIQY7ABfWuCJ5ojwd4WVLGwlge56rEiHrnkjZAvqNpX8yTrVK1yoeZncfS33gotw5BljZm0QRZsko52zh2ajRrmEAaxw6hsZ7T5p1SFMbPnjuDNet0VnBzEXhr8eYKVEBkWc9klygOeSs8iBJZHRmhXRdNHZh+Rcgrb7DjBZjloYsr+FW325VLI3dI3aI0rh/SBNEKxSbs7wRrMVtWlEAxBdTQXMkJxjtjEtWWjKBjJI3VgM6w4ftqKO5Q32YVKDGdZy76QpNTlEE+EizMRHRufzkgMcDVef/OnP8szA5UMzQJUl2np9+cY0Ncxn9N+2n+3iV5IJwlOQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(66574015)(83380400001)(1076003)(66946007)(316002)(6636002)(6666004)(66556008)(8676002)(86362001)(36756003)(4326008)(6512007)(52116002)(107886003)(5660300002)(8936002)(2616005)(6506007)(66476007)(478600001)(6486002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ThW+Y85uk2KLuIPWtKrPnG9Tk/FNQuAtkKkv1QRJmMaYmSXSuW8s7fSGHbo1?=
 =?us-ascii?Q?6sqcmcKSBvY9ScgCr3rHEzo0768UHUxg4LUX+bEBMafftSlJocQ5AtC9wMDk?=
 =?us-ascii?Q?krWZbsDQTCvX8HJ6H9w7MKsXKVFC6l+SxnFIRQGTEDhmG/qHaFStCWyjxx4t?=
 =?us-ascii?Q?pwUgf+0b2Iq7LTL6Df7LLKhd9KRqb7ZlX208EnDLeMls7SM5i+gUDEfEjMVW?=
 =?us-ascii?Q?Oiq91rz6EosygHRav7wP5IpcMwRqizoAX/dsaFNhdvnVlWKHI7bTf/Aej7U3?=
 =?us-ascii?Q?zQIkon943++qhwFgxmwhnh2TAwy624dvi0PwNIA99UjEHJjeZhx86WtM0X3h?=
 =?us-ascii?Q?K48rkVwXLfFfRzmr8yUMfZaqHTnvt+02BroOaDRH0lL2nyFX1fR9xjWhpH6A?=
 =?us-ascii?Q?RUwltAy2dWt34IWi29eBcofk207c1rf0PcmLDBtdlV/9qlNSjmre4X17w3r/?=
 =?us-ascii?Q?5R7OIpnj7uhl/EDWnxxThSxZJ4cvZPiQFoxnYOK6dsi3JGCD4UDQo82rvSG5?=
 =?us-ascii?Q?K1IYpqwUr/mXxO5344mIOcTNr/k8USQ1d03MI3J2uoFC8YwMh2CaRGeYtmi2?=
 =?us-ascii?Q?YEUYkQ/q6cH/CNf1UzquQAWxI7ZSgpMLNq5NgENU3nydN1pUZJfSa3WxZzxr?=
 =?us-ascii?Q?TYRAXd4FUHebrnD93CFfcXwNzCqQdsuzxu2EgDIy9klQmnRm6cHfpGGCMR0p?=
 =?us-ascii?Q?IGoJKw+dNuK1y/FautUvKGvkKFTuKW6xH9hCpD9FfvaKXvSjQF9ZiIJ4/snK?=
 =?us-ascii?Q?zx/PnTfBpvGEAjR+i1Bh4DNVERh1yl4nzHwlmg9NMU/tP1LmyAX/MdCxjc4X?=
 =?us-ascii?Q?MK/UTe3847o/9VSd6UVOmWKwBXrtXDlUKOeaxmwVj+08Q0wFb8eo8N3874aX?=
 =?us-ascii?Q?uLVkV5pFsX2ApMY6HpEAWzgHImN4DWYLO9RzkaDadEAEkBq/RYEwNivbn19s?=
 =?us-ascii?Q?DEc0evonEKmeBx2868AS4irPoPNF9Fi72tJEIaY7UwC6ojXl+7eoDFDj2OoP?=
 =?us-ascii?Q?4a+9y4OaZz5IRagMQ2msdQJMfSRDoZAafukaCudGOFk78AbiVZGmiaEE47Tb?=
 =?us-ascii?Q?IE2TZEhFTm7DAXYPWtv/9fVKA4XvcbVyea0eMxWfKUU0Q78YCKBacLUDjWAy?=
 =?us-ascii?Q?jlu11IavHF7M6YPPBLGaDilmf9Ymi0t0VAs0KYsyeiHhnv3LZMigYOxqiUnC?=
 =?us-ascii?Q?OG35O6QsAloSJ8Q1HkBzKkEcGFx9X0mHAG5A6ePal5h+mkNSN++apX/rp3BT?=
 =?us-ascii?Q?GyZ+oPLajB9KrMV72BOf1QV8BpC7fJM4/nCOCDO92xlMhdWlnAh9NxpDSorM?=
 =?us-ascii?Q?7pN829X5Q2ElfKgfGpSjKkiAZFtJUvn65TnTSRsIFsAwm5dCkGvihw4UN2bZ?=
 =?us-ascii?Q?wD6lWOtDnPMo+A/60J3q0voPUkbD2UC/QRC9iV9onWCN5DeGS+Bu8Dsec7XU?=
 =?us-ascii?Q?ASlT1+fQkQE9gXNlnObfCt6veQHzy9Cy42g11owzjsBuZ7Ngo+T23ppBJnA4?=
 =?us-ascii?Q?iEOBwKuQlILYS6/nNhQJNY6XefHh6zzKEo55b+yFMjGDxlJEKajVmfHi2DuI?=
 =?us-ascii?Q?NOsR9DmzAxVlfoxSYiZeEf4KGgNqwDWHwfRaAlQFHTYTED5nMF9nnnLKinZr?=
 =?us-ascii?Q?+ISIZsrM8AV+1ZuzFRK96ZLct1qYfYxiTEUnhYh9fMoIwjg/FPbaPfcxrdsH?=
 =?us-ascii?Q?Ms0+7A=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f4757fe-4f68-4a67-b1ad-08da5b3ac6ab
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:02.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p8a2XCmKkOUmaqIND9w0qtzEPLhOtaka8HihUpgNYR+z8tBj0MDp/9TERjC0/uS0xdn/gJbkv99HgT1NvXAN7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB1044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97655

From: Omkar Patil <omkar.patil@kpit.com>

CVE: CVE-2022-30783

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../ntfs-3g-ntfsprogs/CVE-2022-30783.patch    | 75 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30783.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30783.patch b/meta-filesystems/recipes-filesystems/ntfs=
-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30783.patch
new file mode 100644
index 000000000..41f26503e
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30783.patch
@@ -0,0 +1,75 @@
+From 7f81935f32e58e8fec22bc46683b1b067469405f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 10 May 2022 10:44:34 +0200
+Subject: [PATCH] Returned an error code when the --help or --version optio=
ns
+ are used
+
+Accepting --help or --version options may leave the ntfs-3g process in an
+unclean state, so reject them while processing options. Also reject
+them in libfuse-lite.
+
+CVE: CVE-2022-30783
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libfuse-lite/mount.c | 3 +--
+ src/ntfs-3g_common.c | 6 ++++++
+ src/ntfs-3g_common.h | 2 ++
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/libfuse-lite/mount.c b/libfuse-lite/mount.c
+index 64adee7d..6ae29d8c 100644
+--- a/libfuse-lite/mount.c
++++ b/libfuse-lite/mount.c
+@@ -670,11 +670,10 @@ int fuse_kern_mount(const char *mountpoint, struct f=
use_args *args)
+         fprintf(stderr, "fuse: 'allow_other' and 'allow_root' options are=
 mutually exclusive\n");
+         goto out;
+     }
+-    res =3D 0;
++    res =3D -1;
+     if (mo.ishelp)
+         goto out;
+
+-    res =3D -1;
+     if (get_mnt_flag_opts(&mnt_opts, mo.flags) =3D=3D -1)
+         goto out;
+ #ifndef __SOLARIS__
+diff --git a/src/ntfs-3g_common.c b/src/ntfs-3g_common.c
+index 7e3e93d2..29021dfc 100644
+--- a/src/ntfs-3g_common.c
++++ b/src/ntfs-3g_common.c
+@@ -128,6 +128,10 @@ const struct DEFOPTION optionlist[] =3D {
+       { "efs_raw", OPT_EFS_RAW, FLGOPT_BOGUS },
+       { "posix_nlink", OPT_POSIX_NLINK, FLGOPT_BOGUS },
+       { "special_files", OPT_SPECIAL_FILES, FLGOPT_STRING },
++      { "--help", OPT_HELP, FLGOPT_BOGUS },
++      { "-h", OPT_HELP, FLGOPT_BOGUS },
++      { "--version", OPT_VERSION, FLGOPT_BOGUS },
++      { "-V", OPT_VERSION, FLGOPT_BOGUS },
+       { (const char*)NULL, 0, 0 } /* end marker */
+ } ;
+
+@@ -521,6 +525,8 @@ char *parse_mount_options(ntfs_fuse_context_t *ctx,
+                        * mounted or not.
+                        *      (falling through to default)
+                        */
++                      case OPT_HELP : /* Could lead to unclean condition =
*/
++                      case OPT_VERSION : /* Could lead to unclean conditi=
on */
+                       default :
+                               ntfs_log_error("'%s' is an unsupported opti=
on.\n",
+                                       poptl->name);
+diff --git a/src/ntfs-3g_common.h b/src/ntfs-3g_common.h
+index 4ed256a3..8ead5107 100644
+--- a/src/ntfs-3g_common.h
++++ b/src/ntfs-3g_common.h
+@@ -94,6 +94,8 @@ enum {
+       OPT_EFS_RAW,
+       OPT_POSIX_NLINK,
+       OPT_SPECIAL_FILES,
++      OPT_HELP,
++      OPT_VERSION,
+ } ;
+
+                       /* Option flags */
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index ca8af163e..ccd18f86c 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29=
e73d4adb9f9f6552 \
 SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-hos=
t.patch \
            file://CVE-2021-46790.patch \
+           file://CVE-2022-30783.patch \
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

