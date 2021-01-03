Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web08.22127.1609652965455797646
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 21:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aDlwa71B;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYdzPt8AQAb+1X4OIHAwpgXWvAXFurlmY2N57AqLhEKnHhoK1bybQjGA8OrCdFH1EwB46292vjvxrSq7LX2rSgmKGtNzQKYcrPzltmWWp5YajEoRmuVNq4pbgFMP9a/N7mx5My88+pz4zEhlnSugPUUd1/d2HISzYLprlD4iFrYqpyjAdorEVRSbqbTdLpOX6qRG7um0QZWgyLTFS8ICNKXrxiNL/UIfFvYHJGw46+PT7KOv1/KxvkPDU03k0363FfmFQG8B+tMrDNnPfC1+4VeTP/kKhISsfrUksFM/69036fKWgLCMsOieLRFAMUi4+4jwBuc3LNg25zDvC944ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mCVGjtcA/OvW3SXiR7kF3Sqm0iaOLLA9hcr7TX6k+A=;
 b=dEcB6byviDH3mFWYAK4ahLRfGJDkrX5meEkmKkuvGxaGfRhmokcNDxGHv+gZojt8bMARBR+r0/BXKqPi7c2XmDgspK1ltBcRDsVsP7wdHvPYJyQc56C5Km8GAVdb45rjuQNkGdG1pfN7/4AJSrTpVS56ghOA8JYLr90jMN2gM4ZojeYfYzSZMIfjtnfvf4u6/LDB9o2eDVCn4MRuf8dqIpJcvc4BtDL6U2OsRq6CjB2IfdMiMFY1c3PrpZPW3j8vS1XPCuQZNklexD2LGdI06dcnM9HwVT/xROs6nBjZdqR7Qvd1rx6g+lBg1kn+nG+woTuIk7fIikhkAtmG4RDBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mCVGjtcA/OvW3SXiR7kF3Sqm0iaOLLA9hcr7TX6k+A=;
 b=aDlwa71BMV//mfdhuuSOaQSBRPKe52h3GCTHwvvXlu16CUTlkUEujuc08cHtEbCtHQ5gNDUIg74QfawISGHQW0DcTaat62cxfuqB0aVtpMDyhzada5izm5LVKM0LKgS0Wl8LRpRPvaGYh+8PUK+kVq+Yn9HQBwLXlFfP7qDuKus=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Sun, 3 Jan
 2021 05:49:24 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 05:49:24 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: upgrade 049 -> 051
Date: Sun,  3 Jan 2021 13:49:09 +0800
Message-ID: <20210103054913.274351-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:202:2::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Sun, 3 Jan 2021 05:49:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1ea7da5-8251-40b1-084e-08d8afab5321
X-MS-TrafficTypeDiagnostic: MWHPR11MB1742:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1742DDF5F2EDDACEE61F7261F9D30@MWHPR11MB1742.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UOsxknjcZ9F4bBfS+Z21ASOii8yBiCR/gE0uebipNLUqc21aGeEtfW89ko8DB8Gl6H3d8msoQGgaNOUZHyIimBqv6YRtwy5NjxEMYh/vIPeMYUP+/kgwnD9LEuUc4xbDM56pOjYQbmzxwwl/8oo0Y5TTHQMoaMJowLtYQ4QY6Us3f8PpB4MmEv7UTJtHenxdlfl/FF4uRwvSS/kiJTnsGo1Re2G9RrDUHtFSyVo/EKqSjgIPQX0wftL6kjmtrDwoiz21aQ6FnCDN9WAvTV5x8yvjeNvddJfBI6seKhQJIqcwLQyZxlopFJ0Z0J0W6XfAhTlAvLgXLFtUEf6EVuZlaG3PvkIji+rhI9AEMAvEA7YmY8C2florW/yP/G4WW6+du3IuuX1pSTRPW5ii4ECFAo7nROcROOuvXwkyluLWf/eU9ExjsWSVVRcPQzKwKfMxYUtsMQnjpp1hZdbDobOEeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39830400003)(6506007)(316002)(86362001)(186003)(8676002)(6666004)(478600001)(36756003)(2616005)(956004)(6916009)(44832011)(6512007)(6486002)(16526019)(52116002)(66946007)(5660300002)(8936002)(26005)(83380400001)(2906002)(1076003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?oixk00/1dpB5njqwmVOekdi+/D3bXsLknzJlcK4t1fAWCY1ynhxUGlBHstSo?=
 =?us-ascii?Q?OkxB+PRs6Ts2os9qqg8Mk9pm8bJbw4RSqksd8TEGOB9mETb2YtK5r46v0PRE?=
 =?us-ascii?Q?U9qnnt5jCE1VJ3LQlPgGfjnSkmw3Mf6bxS0CIAF7LfizHZ/wJUPyMjovNp5a?=
 =?us-ascii?Q?jsKH9PCaRnfEyn2rrEA9/ns2TDyRbChn5t6S+Duhxj9PeFsQ3bvvCHNmjFtY?=
 =?us-ascii?Q?He8frMRtsDrEaHPLSqyiT1ewUhok0yWLmVTNxFeU9NaD5BSKKogzrJrRPywn?=
 =?us-ascii?Q?Au+4Bx4GTuRVawgCiZ6MJuMVEaVoch/CTq2YpiZqhWZvc9Mf/vIZZUkvZxgR?=
 =?us-ascii?Q?zetuFU17jJe7ewBNCMme547HI2lBMoE4/u9eEB+gIV9K1OrbKJ4N1IaU/gsw?=
 =?us-ascii?Q?ac4l4jR3CAHC0hw4JZte3l1hd02rFZQi0upSNxllqRzevCvUErZGipR9RZw+?=
 =?us-ascii?Q?C6YkreoatChKkIrfnwWD9kLjG19rE6CjSpG9cOh9bbLxQaglG02dcZR5kytU?=
 =?us-ascii?Q?HdOM5Hq/X//iHmAEcjIkbT+nEQjt0XCzDYVUGTqARFscrmjKRo1dGGw3e/jZ?=
 =?us-ascii?Q?wSWtCeojrw+pe2hz50NuHwwcD7uHj0jT0jfen4MjJ4pV3VxDWJdx4Z102DU/?=
 =?us-ascii?Q?duSbnwqhjZwk+0L0SHqBUjW3mRpbGwcbtt7U54fnm8POMZmnkUqI/7CxIFdN?=
 =?us-ascii?Q?ebDAU17BRJbZtYUbInWOgaQRNY7lPApkzR7k3F9BiVZmWtbtw4ycPtu4zwv0?=
 =?us-ascii?Q?2LtEgJAx8DSlJz8BSQ3AksZt3nm6uwjUsWpMcKpU77ilfAjENJzrY//whqyK?=
 =?us-ascii?Q?yMbYA2Fc3/Jq+W7t6B265VM8fvP0hRTDNQKbfWnQndgn/WOgLXF1q8rBvlBa?=
 =?us-ascii?Q?d0lyWvhUT1YPu0WI8LTn6sDQ8X/72eSHYFDNfFxjUE7gsB+JLwZNPHtoEyzR?=
 =?us-ascii?Q?EKnznL5yZKYHlGKlGL6BcR51W6ISoNw/xcimi6tOF+nZ8/MREgtWhqpoa1iL?=
 =?us-ascii?Q?sc+E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 05:49:24.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ea7da5-8251-40b1-084e-08d8afab5321
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUyeuiecIsOuCJqwWuseiNdEHE4XGpmLjHEjEvZHqTddEh8h0hOOuDsAMG7NM70DvRP8c4xWlMjgqc767YiZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Drop the following patches which have been merged upstream:
  0001-dracut.sh-improve-udevdir.patch
  0001-set-viriable-_drv-not-local.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-dracut.sh-improve-udevdir.patch      | 39 -----------
 .../0001-set-viriable-_drv-not-local.patch    | 69 -------------------
 .../recipes-devtools/dracut/dracut_git.bb     |  7 +-
 3 files changed, 2 insertions(+), 113 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-drac=
ut.sh-improve-udevdir.patch
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-set-=
viriable-_drv-not-local.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-dracut.sh-i=
mprove-udevdir.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-d=
racut.sh-improve-udevdir.patch
deleted file mode 100644
index 06e0a094f..000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-dracut.sh-improve-=
udevdir.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 974f728410052bc8fa18d93dc0c1a991bcdb96e6 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 3 Apr 2019 15:24:47 +0800
-Subject: [PATCH] dracut.sh: improve udevdir
-
-In commit [9d1b81c dracut.sh: improve udevdir and systemdutildir
-fallback logic], it checked a common binary `collect' to localte
-udevdir.
-
-But upstream systemd drop binary `collect'.
-[https://github.com/systemd/systemd/commit/a168792c2d95695fd30c0371d4b3890=
a9df1eafb]
-
-So check binary `ata_id' to instead.
-
-Upstream-Status: Submitted [https://github.com/dracutdevs/dracut/pull/558]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- dracut.sh | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/dracut.sh b/dracut.sh
-index 3dc2adc..cc8b01a 100755
---- a/dracut.sh
-+++ b/dracut.sh
-@@ -1311,8 +1311,8 @@ done
- [[ -d $udevdir ]] \
-     || udevdir=3D"$(pkg-config udev --variable=3Dudevdir 2>/dev/null)"
- if ! [[ -d "$udevdir" ]]; then
--    [[ -e /lib/udev/collect ]] && udevdir=3D/lib/udev
--    [[ -e /usr/lib/udev/collect ]] && udevdir=3D/usr/lib/udev
-+    [[ -e /lib/udev/ata_id ]] && udevdir=3D/lib/udev
-+    [[ -e /usr/lib/udev/ata_id ]] && udevdir=3D/usr/lib/udev
- fi
-=20
- [[ -d $systemdutildir ]] \
---=20
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-set-viriabl=
e-_drv-not-local.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001=
-set-viriable-_drv-not-local.patch
deleted file mode 100644
index 13d2cfa87..000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-set-viriable-_drv-=
not-local.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 6e0da103effe64832eea52fad5c44a328f7141b7 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 20 Jun 2019 17:31:11 +0800
-Subject: [PATCH] set viriable _drv not local
-
-If shebang is set to /bin/sh and /bin/sh is a symlink to /bin/bash,
-bash turn on posix mode.
-
-Since bash is upgraded to 5.0, it follows 'IEEE 1003.2 POSIX Shell
-Standard', to implement 'functions do not have local traps or options,
-and it is not possible to define local variables'
-
-For more detail, see variables.c:push_posix_temp_var in the following comm=
it
-http://git.savannah.gnu.org/cgit/bash.git/commit/?id=3Dd233b485e83c3a784b8=
03fb894280773f16f2deb
-
-The IEEE 1003.2 POSIX Shell Standard:
-https://www.cs.ait.ac.th/~on/O/oreilly/unix/ksh/appa_02.htm
-
-While /bin/sh points to bash 5.0, it caused the following issue:
-
-$ cat <<ENDOF>case.sh
-fsck_drv_com(){
-  echo "issuing \$_drv"
-}
-
-fsck_able() {
-  _drv=3D"_drv=3De2fsck fsck_drv_com"
-}
-
-fsck_single() {
-  local _drv
-  fsck_able
-  eval "\$_drv"
-}
-fsck_single
-ENDOF
-$ chmod a+x case.sh
-
-Unexpected:
-$ ./cash.sh
-issuing _drv=3De2fsck fsck_drv_com
-
-Set viriable _drv not local, get expected result:
-$ ./case.sh
-issuing e2fsck
-
-Upstream-Status: Submitted [https://github.com/dracutdevs/dracut/pull/587]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- modules.d/99fs-lib/fs-lib.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules.d/99fs-lib/fs-lib.sh b/modules.d/99fs-lib/fs-lib.sh
-index d39ca1b..60877ee 100755
---- a/modules.d/99fs-lib/fs-lib.sh
-+++ b/modules.d/99fs-lib/fs-lib.sh
-@@ -142,7 +142,7 @@ fsck_single() {
-     local _fs=3D"${2:-auto}"
-     local _fsopts=3D"$3"
-     local _fop=3D"$4"
--    local _drv
-+    _drv=3D""
-=20
-     [ $# -lt 2 ] && return 255
-     # if UUID=3D marks more than one device, take only the first one
---=20
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-in=
itramfs/recipes-devtools/dracut/dracut_git.bb
index 13cf5f6de..ce975f5a1 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -6,14 +6,11 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
 PE =3D "1"
-PV =3D "049"
+PV =3D "051"
=20
-# v048 tag
-SRCREV =3D "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
+SRCREV =3D "e473057ae1de303340dec297c786c4a701cc61bd"
 SRC_URI =3D "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=
=3Dhttp \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
-           file://0001-dracut.sh-improve-udevdir.patch \
-           file://0001-set-viriable-_drv-not-local.patch \
            "
=20
 DEPENDS +=3D "kmod"
--=20
2.25.1

