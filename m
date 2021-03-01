Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.77])
 by mx.groups.io with SMTP id smtpd.web08.8434.1614574710174611534
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 20:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KLUGVOcM;
 spf=pass (domain: windriver.com, ip: 40.107.92.77, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr2lIn6VMLB8hGBfWhI3t5ufuaAWGPxcst+JMhYpmh159LTgfgO+VifqCi5moHHWn76PIq023JcAXjWkHz14WtQa8LyLJQ03yWIzKCp3zIKo67cDN1Pu49RjEmb5MaqqAZS1XbsMcifcLjsl0O/M4Xu+mp18SKIZ5XNFeojk4T0jWw1XcuH4WKMmG1HFhBx7EwI+xupl8IsINxEs4YJ2Tih1Jso4GP4V2trVJJb3gmLQrBQij9653fJ6e0PQbPjA60qTsz1Ot958zjQSSq5cm07orYcVKfc419Im+TjOVCFJ9tOIrWScRJwew8ZgALaw/p4mss3tVmgWiLFyewNBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCQbHhPvm49WGrAQQ0vfeqrTWC+J2q8VU8LLbiivQaE=;
 b=X5kwxUQKyz8RquRA9E5BTXN9jbC2tXclfTNQV/8XfgS9DDdFQX+QdD8YJd2IpbpNFSEI10gG/VBPkQ+xPHd57K+Yolq48MDzusAnrKygzvaEjFS/NO2PIV5dcaD/JLjRewjdl16QnOeb3YhN4/JNPfCR4V3SeDAIuAypPqa+jLjcUG0cgvPT5O5ZgmXOuexEX4e/jaS1VSXNyWdCcVFNbroBeH9U1brpJaAhPYtnEZP+zNbdThKA5Xi940vyteFOmWagII4dTOrwuTS/six6ZXeRiiPjFEzE40MdUzQGYOPij5oPjUhADeUOmIwyucg+tY/6gAwJ8Ei1db9H5Gf4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCQbHhPvm49WGrAQQ0vfeqrTWC+J2q8VU8LLbiivQaE=;
 b=KLUGVOcMAfn5T6xJ7SVVDhUEQzQqE7h2AqN+b6kcppeelQxqHczT5G13bwk5A/GTlO8xucBvHkZLnQ0CnctlNJnSid+mZ+qEJx4eXfL3pRGoPJmAN54zFoC8C1YeTVlCpBemhvM0Vaewyr1884lO0anUJO2T7jtAecZccSFjVkQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 04:58:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::b954:4302:820c:ca28]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::b954:4302:820c:ca28%4]) with mapi id 15.20.3890.023; Mon, 1 Mar 2021
 04:58:27 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] vsftpd: allow newfstatat and pselect6 syscalls in the seccomp sandbox
Date: Mon,  1 Mar 2021 12:58:15 +0800
Message-ID: <20210301045815.25985-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:2c2::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Mon, 1 Mar 2021 04:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba52dcaf-2493-4746-d960-08d8dc6ea5f8
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:
X-MS-Exchange-MinimumUrlDomainAge: security.appspot.com#0
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB453968D384391D31C7FB5CBEF99A9@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4OU9JEFatCvfiK2jpWtqtqgMphi5mOkZuNuTFoDKViiEhP+23zVVTzyAxR9ztQbZYS3zX2RbhBevN0jR1eg3qiRJSkp8w+lb/vXIh8KZeiAC4oGkuE70TzM52RefM1QOEaMEZNFJUM5ykA/iq/3my+Dm9t9swaNgZXIyTSTnTgm5etfqkjMylIbDDmB8RYXe9x+sYR/dWSo3ahRxFNVyJTZtZJVSXVenAfspCBy3jI1CYbt7aPsEupKpkrX90IJLISGPN7gcDgkyZbZAMSWx+JKXOLHhoEBXp1V+aM+7OSIpD71O0ZzPiSTNf5z2G/DXJeAHIUp2d+q2H2F4mGVhz2W9POlSg1YXXHy+4NttWk3HSK3Ic2yg/rB3QJEv4qWbjn+XjQ00FyINXectL7E0bWX/NP3XAlgfj7zEJ7pz0gIQr1TXmssqPQonvvB2ArUqhRBGNaVeXd9byTmzFAHc2S9k+KVWoEjFMgFdZ8tFqx7CMX6zblL33JDwPIaRIKe1UTTciwNqn0ZLhTWUEQUelge3yRsUEQqphg0xlJ6GFlq3WbY41am86g0aOXGxC4mauBn+M6BKKZWdbbqr3lu5igXU+l4OjwpL0E9fdvw50WKFmYnWkRjxxm60/1zvXmae4ZgXOGG+haysMs90t4cVRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39840400004)(66556008)(6486002)(6916009)(6506007)(36756003)(66946007)(5660300002)(66476007)(16526019)(52116002)(44832011)(6512007)(86362001)(956004)(2906002)(186003)(316002)(2616005)(83380400001)(6666004)(1076003)(26005)(8936002)(478600001)(8676002)(99710200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?G+vA2xcX8fFKi4WTiySnkrtBJCetuuIkFpnxEBm250DbzeNkNJ4p/MQw/xwn?=
 =?us-ascii?Q?5nYI2pL3nbz4/IIZXZuQbuF4Nt4irgq/BQtNENoGovsePFtmEEsi+tlI6OIU?=
 =?us-ascii?Q?R5OxTGIwEo0etiGr7104p8MbV1yOUUdrKMZhNofl8P36xTiBafYMkKO/bn6Z?=
 =?us-ascii?Q?nVAsmpYbIjOSl/rmTWXfUN8dAVjN1KGimCeqHeOBMqYDZQ2S7I9el1KaC1eD?=
 =?us-ascii?Q?GPlJqfLdJJ4hos5Rs+hPAk/4fqzB03x9Q3tZAY9tw+Lysu+7DsFJjZwWezwP?=
 =?us-ascii?Q?+O1UZOny5DUAbFpzn7fJLrabjZx1mkuTYJcNxCyH7OXY2VMUB3EO0Dokob6o?=
 =?us-ascii?Q?zuCmMvzjTaD6dMB6hPmsf2Ncp5d0VlNPVnpxRqQVsX4tM5ZebdDcMfFiWGLs?=
 =?us-ascii?Q?bUZ3sCLCcu6/5sVKDl4tJ+0rFo7dsVto+SjNfRbIft/RTnzIc951/j3SN7H5?=
 =?us-ascii?Q?suSdWsGeZSlDk2YPbXCgQRpXE8UsWVSDCmWnWBxOHdboOtoZ2jAQN0RrgJzW?=
 =?us-ascii?Q?ohQZtCpp0dDFAH9XvlQFcOWwD5QNiDLYre+T3fwia7Ko46moo7EuzSKUwJ3D?=
 =?us-ascii?Q?zun13DGFkoLrceKYrRvm4HNe4FEZOxtceH28l/Er+df3xYzpfZNyQSl/k6mD?=
 =?us-ascii?Q?aUviCW8HXERjTUZY+d86b97dL8M/Ic9I6cL4FF/VfVWBbTS/O2X8soPnDstu?=
 =?us-ascii?Q?19kevQqXCAVWS7o8I+NqNvL4XEJogyiYduWRCJjr9tFsHzHjK0CZ4Mx8cLDY?=
 =?us-ascii?Q?3py+y84hfz/2VXut6Qkb9GnBIER/5GXYr8E7ORzA7JVNPAFReyg/3kBnlsB/?=
 =?us-ascii?Q?o8lpgzy1HyUL5DxplfCkSnm5yKpSlLBKhS76CjUiX0XYp5Lj1wlrvF92saR1?=
 =?us-ascii?Q?skHKWwnoE/wNd37i17osNgh6Hd25feacI9b5LfK8W6G3socF09xLfYnQaAsf?=
 =?us-ascii?Q?oGD5oRcnXt0RWiesrWD2BGSiLabpGMiT3LapaArcPPsB325ENY9QGzC0l8yl?=
 =?us-ascii?Q?JMJs8uK6TwQk5O++X8lQGV6wse5P2/bQ5uc/ItGZ5FvLvHhnaykVs4XXtDed?=
 =?us-ascii?Q?Me5Fd4viV5tpdHIAxGeKc4fW8gfB5MKTr2c6q6R/Ovpgd1Vc6Y+p7+sYNwQN?=
 =?us-ascii?Q?J9u0fOv1IckllHdGyvy8XaU1eG/m4pNHOW5uGh9xay3Yk0lKimkiVNhjELuj?=
 =?us-ascii?Q?Z6KoWmiiDh86qmKDM0MoZN2Tr50qq6biqu5bS1WX+q/F9Id8oSCRcKsvz+yy?=
 =?us-ascii?Q?/QfeHNWKgHdQrYgM+gy+r7zKrSY9w5O1uotPTBmEQpxraDsGzDl2sc2DgG47?=
 =?us-ascii?Q?OizTefZdk78sjQ35t1O5THwK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba52dcaf-2493-4746-d960-08d8dc6ea5f8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 04:58:26.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6cs9FDWKShnKlGVfbp3JUX9mmonVZ6C6GpYpkKiQHCqf/UsR0GdpEyJpSKJfssk4EyL+ASv9P5qceO172v8eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Allow newfstatat and pselect6 in the seccomp sanbox for glibc 2.33.

Fixes the following OOPS error:
root@qemux86-64:~# tnftp 192.168.1.1
Connected to 192.168.1.1.
220 (vsFTPd 3.0.3)
Name (192.168.1.1:root): anonymous
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
OOPS: priv_sock_get_cmd

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-allow-newfstatat-and-pselect6-sysca.patch | 51 +++++++++++++++++++
 .../recipes-daemons/vsftpd/vsftpd_3.0.3.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/000=
1-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-secco=
mpsandbox.c-allow-newfstatat-and-pselect6-sysca.patch b/meta-networking/rec=
ipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and=
-pselect6-sysca.patch
new file mode 100644
index 000000000..29ce85cc1
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandb=
ox.c-allow-newfstatat-and-pselect6-sysca.patch
@@ -0,0 +1,51 @@
+From 7bc261076ec94efa3197beaca39eba095d162b5e Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 26 Feb 2021 16:32:27 +0800
+Subject: [PATCH] seccompsandbox.c: allow newfstatat and pselect6 syscalls =
in
+ the seccomp sandbox
+
+Allow newfstatat and pselect6 in the seccomp sanbox for glibc 2.33.
+
+Fixes the following OOPS error:
+root@qemux86-64:~# tnftp 192.168.1.1
+Connected to 192.168.1.1.
+220 (vsFTPd 3.0.3)
+Name (192.168.1.1:root): anonymous
+331 Please specify the password.
+Password:
+230 Login successful.
+Remote system type is UNIX.
+Using binary mode to transfer files.
+ftp> ls
+OOPS: priv_sock_get_cmd
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ seccompsandbox.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/seccompsandbox.c b/seccompsandbox.c
+index 377c50e..f601241 100644
+--- a/seccompsandbox.c
++++ b/seccompsandbox.c
+@@ -267,6 +267,7 @@ seccomp_sandbox_setup_data_connections()
+                        3, IPPROTO_TCP);
+   allow_nr(__NR_bind);
+   allow_nr(__NR_select);
++  allow_nr(__NR_pselect6);
+   if (tunable_port_enable)
+   {
+     allow_nr(__NR_connect);
+@@ -411,6 +412,7 @@ seccomp_sandbox_setup_postlogin(const struct vsf_sessi=
on* p_sess)
+   allow_nr(__NR_getdents);
+   allow_nr(__NR_getdents64);
+   allow_nr(__NR_sysinfo);
++  allow_nr(__NR_newfstatat);
+   /* Misc */
+   allow_nr(__NR_umask);
+=20
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-=
networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index df0d7f455..024b776de 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "https://security.appspot.com/downloads/vsftp=
d-${PV}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://v=
sftpd-tcp_wrappers-support.patch', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC=
}', d)} \
            file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmp=
x.patch \
+           file://0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysc=
a.patch \
            "
=20
 UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/v/vsftpd/"
--=20
2.25.1

