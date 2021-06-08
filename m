Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.43])
 by mx.groups.io with SMTP id smtpd.web10.11268.1623153483736217730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 04:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kpit.com header.s=selector1 header.b=OuYIXBDU;
 spf=pass (domain: kpit.com, ip: 40.107.139.43, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6uutL8I+vp9H32IlLvKF3Z2vrvN5cp49v9uxen3m86WNTYzT/U5v5oc7PJp+6ROOvkwcEI0gS3gxycjrKWD2v5S38ppwcN8ot9vK0CpSodIquiyoyysP06W0nlCiJt3491MpKowlm7Eqp84k3ZSy1/0sB0qA7Q08oF/cXqA4wwynlo02qMqIe3TQYbXzP/dtOhSvnbRKq1ppkLF0XIOH6GEc6JleQ35eFSHjI/89+5fRORNX45KeSMH/a5Lp2l4DCZm2iIxgAyeNXmR0ILAzUuK9LTPx3qMoIzPMY1Ntm2VS/Vj4/rcjWf+KDV0IhKfzC+TbPchKAdJMCT+TcmFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgxKWUWmTrlHzfn9NYQARdPOUsxeT4BOogZWsiM15LQ=;
 b=i78bWjFdpggnlceWxtwRvglBbCU+KLF5OqX6sXVEdLhqnvljBcPw+KJjrt6PWaQzJhXvFRm4rQuEMf2NDPYny0oeyfpKy5wvmsJhHf2/uyod+nDUxjT/rgPHSTw2y7xs6U+dU+O7wuNIZyz8oweDfIwnLPPxBljkkGEfpb94e1iw6OuEG1PX8XWA7G1wtUM0LNAZvGzAh0xm7asgXc9xMgfy7x/AJdKl9QvnndHAfSWjFzaVOwZuT63ezcwXz3FNGNLA+9ekiIv13VcAH/iwdCzA57asczzkrYeL4i4ei/JEu9c9pCyb36BsAvF04RKi1BZlfofCsc76x2jVtNjbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgxKWUWmTrlHzfn9NYQARdPOUsxeT4BOogZWsiM15LQ=;
 b=OuYIXBDU52e7OMT6HIEPgB+xIacoYNCyxZE6ENIVVrnLrKXIqFnZK1snsjWgBsSC24d8pGSkaHs/aGU3FipBvjswsISn9EYTSPDMQVFaUg9ZIqP9OKZLsqspalszqfoJ4eBho6x461Vjgls8vUrxx6J0E/tzixxjyz9t/VSpECY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN1PR0101MB1615.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 11:57:57 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 11:57:57 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
CC: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][dunfell][PATCH] sysprof: Enable sysprofd/libsysprof only when polkit in DISTRO_FEATURES
Date: Tue,  8 Jun 2021 17:27:44 +0530
Message-ID: <1623153464-18648-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.110.167.10]
X-ClientProxiedBy: PN2PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::31) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from L-12026.iballbatonwifi.com (103.110.167.10) by PN2PR01CA0146.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.15 via Frontend Transport; Tue, 8 Jun 2021 11:57:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cf12f94-bdc8-4932-7623-08d92a74a807
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB16152199D73000514EA917BD8E379@PN1PR0101MB1615.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jYPQRA7VDjrC4RmMeNNVjycF8oXFzAB54BKMvRKzUqwxjxX5YTi/mrRlHRig+774P+haQrJmt1rmuIfn6BqwwG1GzfiM6R+G6AA+uaziloR9yCuSOvExqOXMvWRdF4l+A7Mreq3xDgmaw2BNrRnaXRqe2kmExEEvbQ5wqhZW/cpG9A/9CtHh+4kIkxzu6wnzLwY8IJMWNWRID50cRMhw5SXkLUa/7JionA7ychWjELcaDjlSrcst5mFxTMZpYNcIJ51226OiOCY5EdLo6ejqHczwkZjcexgR1PQZ31q4f0QHT9p8xjanI9pNa4ESuL5dH+9mgI0FE2zfZy+JPPH90B22WLAT68TgL1fIaOROHlfrJofBUEwHCn71nWjl9QqN9HYQMXu+egogCNxFbp2Ck7yURpya4xFklbnyR6HaCxGttYaYXCXazSAB/Ilx1s4xLKrxd9WoyE+9rq2u6ErltQL5kMnP35sjlXEFgTvI3URRmZtSmMzQm9vejU8QibAG5Blv+mMs/IGnSu5LzpV0X0rsGeCurUzvoRmg+gRZaY3K2fyPHDUyusVQhPW5nBHHRrmFkVTTpLe2AdOPssQKPOViSp6DB7k1wcMNp8fWWs2wr8XKCgGEK6G8elfKb2CNa8Frwndb5wRXrIhD6SqowU5348dLuxUhHhMeerCLvms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6486002)(4326008)(6916009)(38100700002)(38350700002)(186003)(36756003)(2906002)(16526019)(6512007)(6506007)(83380400001)(54906003)(956004)(5660300002)(66476007)(66946007)(66574015)(498600001)(8936002)(86362001)(8676002)(2616005)(52116002)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4MbKg0baALJDCHndlHdBAk+awikTlAQE/QlaMWyyG/JHxjgilY3+ndeEeW0Y?=
 =?us-ascii?Q?+R7mLWfTM7lyOyas/GevtJ/7qzbhApC+yslA+4JGVRllU64qvVJp7edqsVr5?=
 =?us-ascii?Q?XyLPv7Cq1BXohk03P/nZTdvwre/eL92od/+/Ve5Of3/IQOExu/aBdqdeFTt+?=
 =?us-ascii?Q?FZU/LKJ+LkWzC4GmuH4hfrnm+ojHQQqsPYHTNHyWwa5bxu74V7QUOdaSF82J?=
 =?us-ascii?Q?MAfDrrgQ7Gyup71MBU06rDSmqQRSbM0NS5M+JlShA3/8uGlTXUZKCnYjfROD?=
 =?us-ascii?Q?J+tAVplzp9Q3xQZvEQok5R1F18ZS2S2YGsJTWNQx3cMUsyM+mS2R8nWPf93Q?=
 =?us-ascii?Q?i6HgzwQVujEfi/qfbMFyeyQj31bqVvVlqn5fhs6nXbv/ilO6E//p/eO8wuFw?=
 =?us-ascii?Q?i/kGhRgPp6Stfh6SMwztCKhqvuNTeMcpQr5HHJ5wCWf8wZt2JR8ct1CycdK1?=
 =?us-ascii?Q?lxAA7fUSZiv1OC2e8rtS9OHTxVxKeSbDdF8RQBCUanwSLBT9CV5kzlpddzur?=
 =?us-ascii?Q?cmYBBwVZyVuaKJWJCBy1PWSFbY7+FzK/2STgTN/twhdavJWYsSaTDnmIYdqI?=
 =?us-ascii?Q?ZEJodgqcq82EFd6bKLYhzuFhTBBl3Ga39Zh4wyqjIXG5aaRQkLrS31PxKTPS?=
 =?us-ascii?Q?ulgM96yAEGg4g/Wmqa+U+gujtR75kKzVkFkEkRM3bXx2l/nkI43pzHutfF4O?=
 =?us-ascii?Q?MRPfK6U4zjiBZxEY0G2BH+pZ7/nl5h7204agCbmmHcE0RYvzLK7SdWDzjzp4?=
 =?us-ascii?Q?P57E4x7kngsf2XvmuiOAD1mMYtrgYGN+F7H2uT05Si6k9dzBhTiSS1UjGzAB?=
 =?us-ascii?Q?YfYv31MAYOzysNXf3bHG3Ft9/F5m7p9RX1rokIP/x15S8u+YPw4kZjt1i47I?=
 =?us-ascii?Q?JcHktSiNQRUut4tpzZSDheZXM/pg9BqkqCHr7QsXoLB0MXFb0vMHD8ix0vVx?=
 =?us-ascii?Q?la8TlKFoesgrv4JkPsPSpCKH3s6sw4csgN6zbdPjetGE5v2umfKygQsCiBAi?=
 =?us-ascii?Q?WgL/SWSmEKaxceLZ69J+Ysr5vM+s+rNAJRsh5UNj/S6Te9DOarJg6nqr6ql4?=
 =?us-ascii?Q?OHB1mWqB7+yaJO5PvYtygSfwq0CxYpCoPjxP09K0syNNJBQX0sOUb2EvP6Nb?=
 =?us-ascii?Q?y9CBHaafxIoND+NUXwp1CINpMgRBz+DaHENo8gioA4caaMZrosTsdzVHQMI8?=
 =?us-ascii?Q?o+bLFePksKLoWOfpLnf3cttBkBBlgTOsCsf7jhLi98Bb9qGDNyg9H0d3rhcV?=
 =?us-ascii?Q?nYGxKN2J09k6ZBHNfzlcK5RXVpIeywYX6UrFolHiNAPBxHunmLMtF/Gk7xNp?=
 =?us-ascii?Q?c3pk6RQgfvghrqP6Br4CHU4t?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf12f94-bdc8-4932-7623-08d92a74a807
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 11:57:57.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TZvpLrXoJjx5n3Nk6TNSrbBXc9wRIp4nfFyCI1A91BBvkAjL0EAM1pUoEUBSUKhdIP3of1GiH9b7FxhAG2WZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1615
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Khem Raj <raj.khem@gmail.com>

This change is cherry-picked from upstream/master.

It fixes yocto-check-layer error:

ERROR: Nothing PROVIDES 'polkit' (but /home/builder/src/base/meta-openembed=
ded/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb DEPENDS on or other=
wise requires it)
polkit was skipped: missing required distro feature 'polkit' (not in DISTRO=
_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gno=
me/recipes-kernel/sysprof/sysprof_3.34.1.bb
index ad69ab6..cee4ed4 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -16,7 +16,9 @@ SRC_URI +=3D "file://0001-sysprof-Define-NT_GNU_BUILD_ID-=
if-undefined.patch \
             file://0001-libsysprof-ui-Rename-environ-to-sys_environ.patch =
\
             "
=20
-PACKAGECONFIG ?=3D "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_F=
EATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'sys=
profd', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'libsy=
sprof', '', d)} \
+                  ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTR=
OFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] =3D "-Denable_gtk=3Dtrue,-Denable_gtk=3Dfalse,gtk+3 lib=
dazzle"
 PACKAGECONFIG[sysprofd] =3D "-Dwith_sysprofd=3Dbundled,-Dwith_sysprofd=3Dn=
one,polkit"
 PACKAGECONFIG[libsysprof] =3D "-Dlibsysprof=3Dtrue,-Dlibsysprof=3Dfalse,po=
lkit"
--=20
2.7.4

