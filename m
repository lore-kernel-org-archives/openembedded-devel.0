Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.18857.1609405423451370047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Dec 2020 01:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oF2T8dmH;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+o50x9xX3n+/mhnGavAxF3S6nFceA/M2lHEffc/cpGVfRfJy6SFaTmQhfxLE9jBhzztY44xrIJykMhp4vxgHsUF+zSU0zJ/oZ+JgPZX5XoAdRh+A2rq2yNMq5S47/5JG75K/8HzDkAbYq7yv0yjTa/jvCwJbrXmuygGr5v2yAZeEB0yAWPlSv0n+kSR9NhKtz93N5Gnw1jwwuUgcwnqZcnrPhNIAPI761GpNzvMFojDJMFvVfsf36pJVTjhEmHDsK4U+kR0xI06UrfFaQsQL0qRSi92rPniTqfBELQnRHvom8VqP/YdF5sd0gUYhMxwdfGe/s5fThnpy52u5ZViyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiWIpdSwDT4ot6kMp12D9IGYLNGqEkLIR7p0UfcEyE4=;
 b=e82O0i4xw/I5pSUj8Vk1Ct5bWvhZk/15sOK58m+l5CrjGWhiVNPEUX90HtdYXfAk3x8+SCsKP7/83HMavx7xQuSIVl9+8+6PnATvYgnZGZMFljGpwf3OdDLori20wpFN/+B5MMliTAlR1/Ttr+snlQfpHHbTdhhD0/q+V160/WJIeLfq4w5YHJ/ccJ6W1FacypnoK0oAH+p12hcPZOHFPa5BwcuYngzgwd3JobMZ8oCC8XImgTiMxOHqcFFO+cebTvXD5yzkdAlctCX0ndlSxsHmN+X9fIeSkXCp/qbjVUbBBI9PeE/dtOoy80yapw7W6EZ19stJXtycGDPf0RxlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiWIpdSwDT4ot6kMp12D9IGYLNGqEkLIR7p0UfcEyE4=;
 b=oF2T8dmHMxpePWy3QN5ArdU9j2o0Rm6s95Vlbc3f423rdMyFQBaEw5XDgGxERqelLdf9oXk8QzEq/mBQ1AhId3HSUA2QK36to+5Q+RyP02ZrNh/B8tJhfQSg6YoZUvbvewWaSgqOcT1S2cAYMxjgpC+xtcYRuTKBj47f95sC0/o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 31 Dec
 2020 09:03:44 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 09:03:44 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] ebtables: do not install /etc/ethertypes
Date: Thu, 31 Dec 2020 17:03:31 +0800
Message-ID: <20201231090331.223784-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231090331.223784-1-yi.zhao@windriver.com>
References: <20201231090331.223784-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Thu, 31 Dec 2020 09:03:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25d3e32c-2a25-4ec8-b891-08d8ad6af9c0
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21904525AB2E82F622E5C293F9D60@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v89D5LI5QqsH2Wk0w2FKDzA6s8FK8VLdNVwQ/fkpKeT9N3ENgvTpfpuSK14DEpiPYK3iT7Q6J6MKUBbryoXqwH7CAxt89/BqamgJnHDc9O7++DaYLrrA4z4/zccYkwLBkAgObMa65ZUzG6q91oNUxqTB8vtwMSkcCNC7wYXLjSpL+SUTrJRCF6xVy9Q/wLFSxdn6A3JiEwaCq/BzyDggD2FOT5sJJyPW9j4vuaF+bG16Cy+an8fiWTNEd1P0W2RoBLx+ncv81NIivDMeJfkL0OgPnEgOHzxLblDEkQb+J/laWgPGCTrjffEAredDADrEv8+V7BdYuy23DH+WfLUt3sZw9lZeqi5pGHwuiEhmZ7uj6HwZef5hzbiiMg/1h+F/TDEeisr2Ihyetxb8Aqc93iNoZv7Qp2Nfg9qYP47jOE+mAwZ8woNSx0irJzgI3/0JcHTBow+VYzyej9Z+VPRonA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(66946007)(66476007)(8936002)(2906002)(316002)(52116002)(5660300002)(478600001)(966005)(1076003)(8676002)(66556008)(36756003)(6506007)(86362001)(6486002)(16526019)(44832011)(26005)(2616005)(956004)(186003)(83380400001)(6512007)(6666004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?0DPYnnYqRYAN1oAWje7K0lmG4ZlJcwD5C5vvcJInI4oHCN5AQMjI+Nu99ebs?=
 =?us-ascii?Q?jEEYP28LrGQjyb1wvsoFNL+IfHvG6UnRU/Yh6h6Q3sHENIseMTlAHgxBUe0K?=
 =?us-ascii?Q?gjECkrX/qLVf79gZpIeFp+UgpWinJb8PPs01Otk00ixudOHmOFOZCdni9+CB?=
 =?us-ascii?Q?QfWxBV0p2UxK38OqY31QIijpmJ3X26SOKp4sVfZGa9rVdmmg7UdZk3KZJ0ag?=
 =?us-ascii?Q?5tpq9JlWxZ+E1SmCo1EbtmnIFC9o3bj1cMULpIbs83v5fjRB7wvnqS+xlaVC?=
 =?us-ascii?Q?PQbKXH/QghNPUeIi51vEN3CrpmLw24+NoWQ2E/PJBKApT01LfCT2aUM9XOvv?=
 =?us-ascii?Q?FwdcQmknpiSwonIv0jw5/jVBzvud+8aYh7NdViGD6IE4yb1F2GXTXn0pvwKm?=
 =?us-ascii?Q?16gzJVsazfTfarlYgfaqlEPyKLXL5qbPL7+a0hpVfz4lqc8aMlg408Ur46dl?=
 =?us-ascii?Q?wxSH0+GV+OGR4CjAO0x0JIVCQ1ZFr3DL5SlVbfXHUZYY68KtFfC7+c9EwDY3?=
 =?us-ascii?Q?8T373/XOchsheQ5lLEBmtxZHcfVKXjQDMCwEXjM4dptBp9TmMpzMbQ3USx9t?=
 =?us-ascii?Q?dImdtNac1k0AMQiV+joldfNjmOICm1Ka8UGVcGyUbvaIt46yx4qLoRAyUpPH?=
 =?us-ascii?Q?epZ8foi00EYjnDcjb9ToGSliATRJHxwcW/g7iE8euDv5tc5Oq8CRKz7hjbt9?=
 =?us-ascii?Q?w7EAt/HykyCqKWtNOrRryWGmNnfpsgKGA9FjVvRtSmj/Q/hLUpmR/QQ1xWCG?=
 =?us-ascii?Q?EYpqQmcsIuKaMlKCXUZnHNZ2IKNJNOeT9b8MOBQm2pOxvQwwyt8byd1ofy5V?=
 =?us-ascii?Q?cOj1HdC4rZsZXaQrKgOc9Y8X+a3tyAijlk+fjl4VLfwhwX7M/KkRBK1v9ges?=
 =?us-ascii?Q?O/0T6hjiecQQs4T32ALBfPSoi+k8OQjYPQcVye5JiOyBxP8U/S0/7UDawfBh?=
 =?us-ascii?Q?yk7MN65vM21Za8nh0UQutTr4V6lj5U7eVnsQ1QPOz/8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 09:03:44.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d3e32c-2a25-4ec8-b891-08d8ad6af9c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAMZWdmzAszO2a5nSooSDgLtciiT+DOSxm6BZGyC1fUsfY8Yuci9JroDZLOxDjwL4agieqMh2gQMhsZ8cvWMdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Refer to Debian, patch the Makefile to prevent /etc/ethertypes
installation instead of removing it in do_install_append.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ile.am-do-not-install-etc-ethertypes.patch | 34 +++++++++++++++++++
 .../ebtables/ebtables_2.0.11.bb               |  4 +--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.11=
/0001-Makefile.am-do-not-install-etc-ethertypes.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0001-M=
akefile.am-do-not-install-etc-ethertypes.patch b/meta-networking/recipes-fi=
lter/ebtables/ebtables-2.0.11/0001-Makefile.am-do-not-install-etc-ethertype=
s.patch
new file mode 100644
index 000000000..f2dbb552e
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0001-Makefile=
.am-do-not-install-etc-ethertypes.patch
@@ -0,0 +1,34 @@
+From a822e8dbca017e426a4c1c3ca835d0d03cbb4a4d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 31 Dec 2020 16:09:56 +0800
+Subject: [PATCH] Makefile.am: do not install /etc/ethertypes
+
+The /etc/ethertypes is provided by netbase since 6.0[1].
+Do not instal the file in ebtables, otherwise there would be a conflict:
+Error: Transaction test error:
+  file /etc/ethertypes conflicts between attempted installs of netbase-1:6=
.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
+
+[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3e=
ebf88781f609d35)
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b879941..2237002 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -26,7 +26,6 @@ AM_CFLAGS =3D ${regular_CFLAGS}
+=20
+ sbin_PROGRAMS =3D ebtables-legacy ebtablesd ebtablesu ebtables-legacy-res=
tore
+ EXTRA_PROGRAMS =3D static examples/ulog/test_ulog
+-sysconf_DATA =3D ethertypes
+ sbin_SCRIPTS =3D ebtables-legacy-save
+ man8_MANS =3D ebtables-legacy.8
+ lib_LTLIBRARIES =3D libebtc.la
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index be21c372d..c13ed7b3b 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -12,6 +12,7 @@ RRECOMMENDS_${PN} +=3D "kernel-module-ebtables \
     "
=20
 SRC_URI =3D "http://ftp.netfilter.org/pub/ebtables/ebtables-${PV}.tar.gz \
+           file://0001-Makefile.am-do-not-install-etc-ethertypes.patch \
            file://ebtables-legacy-save \
            file://ebtables.common \
            file://ebtables.service \
@@ -25,9 +26,6 @@ SRC_URI[sha256sum] =3D "b71f654784a726329f88b412ef7b96b4e=
5d786ed2bd28193ed7b4c0d67
 inherit systemd autotools
=20
 do_install_append () {
-	#This file has been provided by netbase
-	rm -f ${D}${sysconfdir}/ethertypes
-
 	# Replace upstream ebtables-save perl script with Fedora bash based rewri=
te
 	# http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
 	rm -f ${D}${sbindir}/ebtables-legacy-save
--=20
2.25.1

