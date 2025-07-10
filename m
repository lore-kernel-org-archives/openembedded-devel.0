Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447C2C83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 14:37:54 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.71])
 by mx.groups.io with SMTP id smtpd.web11.10426.1752158270943861331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 07:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UqhDbg0A;
 spf=pass (domain: est.tech, ip: 52.101.70.71, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vieqPsoJ90/Po59N75bfmyvpZ8z0vTrp0Bgru0HugL9dV+TQHFJOFA3L/XE4qt4INW7jORDDJ9Pe58EnVMYV/woXx+opsInndpylNIeM1KDj57gG+DnT83ZlyMDsBiaFza9E9+LlAErQA4KX5uZfIzibVBh30vyM7xAK6pei7ZJ9+NuPsrxGb01TvVetGMnWvI6mdLBYUrlySBkDRmrAjgNnkmOTwT29eZjL0vvkPtS5STMcukCLsZLRQ3zVGKe6XJNpI/Z8jtbRvbdlh5By1ebqq0tFPM+VVzMROaQzqWi3MBbqDoN4wUU4uRLPjFhrN6VB01quYEzbqRrkKXZXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkO7PsQd5gnpQ22kOtZG8K5ATIe0QIJY14W14wT4+R0=;
 b=bW9y9XCW8+Gsd+PdQggslOMWmODSeBHvrUJn2bvPTU7t7dH/ZRZM6wI/3YJaCxzSAI4gK5vcG4eOsJthe4/fP9hmOrFT9oUkhc6rUosuVD8KKEydaNbd/89IQrlhJlW0MRq+mE2GdnzxiXhVp+vtPSwmfKJYl4JCcQ/KDz+9BWXDfphUBOUvOZml4vJrQIzn0L3PdXq443KWQSX4F0DC0FsPOD+r4kvpOPK7Fv29pvWb3nqTXJMEeTeMyZ/NhvPx+P57fXVZtoDHc9V4LAM5kJY4KZ5hna6zq+Rrcjd/pF5uajF3GvFksnRta2e2duHjf0SLkqaY7ir/ikkXb9dI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkO7PsQd5gnpQ22kOtZG8K5ATIe0QIJY14W14wT4+R0=;
 b=UqhDbg0Ap4+T0XG+G9wUvQbhdwBSz50CKiCvrxXAr0hDNTh7+zlHNaijhYg1R/6D+hljjFEM6R+SlHBjDU9zPzCaRyTGYxnyUDEwZ9io0Nfr0aZHtWOS2xrzsHRYgZE7VD55zSJJ6ukFhTX1MOdKtryxxzb2ubmr0CubtZARWqy7Qs0UcxMO1idyf9RGBLmK/l6XmdEGoQYGZtR7PNljvgHOfrPunVe+hfPhNV0Bnu6MkB/HKh8LFyvrk4ZytrzcxJdwjjurMh1SJ57Oe9OKU4GJoEfjUEVILK6sLEs0hpSsOcZx83kgjCnvB09FwrKLsguRX+VSVE5YJ9KYSSdW1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by VI0P189MB3221.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 14:37:47 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::e6a:4d86:109c:d394]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::e6a:4d86:109c:d394%4]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 14:37:47 +0000
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-5318
Date: Thu, 10 Jul 2025 16:37:36 +0200
Message-ID: <20250710143737.49615-1-ravineet.a.singh@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::12) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|VI0P189MB3221:EE_
X-MS-Office365-Filtering-Correlation-Id: b62ddb74-223d-4d24-53a2-08ddbfbf56c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F0rjZY0yZ5YSCBJwZn0MUrIyzRtfsK3GbHHsRx9qUHeLfSCK2oScc0seFd5y?=
 =?us-ascii?Q?aTCc4wxD8j7zr9tdKp5swWshvcPtEU07cfQICvuG25OOsff/ytcITB0SnEk4?=
 =?us-ascii?Q?Wa3QaajO4djUrMYmskyyaE+hkS/r/CRN2z6FCilg2QfO3jHiGCwl2hrmg9Eu?=
 =?us-ascii?Q?OYLgbGKbSlyDku37CM7wicZrmrskde5+e7wEFFHmwGpz4Q0h82VDxZIJEVH3?=
 =?us-ascii?Q?+XDyo3UBws+X1v0WrMCStXaQz9xj/8luCHINEdGJ2kmKPr7uHI2x97iMsCjC?=
 =?us-ascii?Q?VG50qVWRrXCns3mg9mFR2gNCM/k1xEYFvPQDzaEB2V9qXYtJ972OVFBNZIg8?=
 =?us-ascii?Q?+54Jdn+4R70nF4Z/eVgsmFaX9BjHjdyOC9PrEuk8tQ/jRcvd+QWTdtty9xE9?=
 =?us-ascii?Q?d0tPAYmyKGqtG7jiVpEvBmVrkr36zyFZmJP3527sGzxjBJ5SMAfBUlwW9/nv?=
 =?us-ascii?Q?yQydpU8+pyEi98ijxHk+8OvPqw6CMo5MZGz9WbgWM7w6AXSOZL/A1wEs1ZPA?=
 =?us-ascii?Q?Wz0S/YYi3hZ/gYWMsXQ1925AmUasvUxD+1Nc9pb1R/Q4I8Oh8kJ/+OUex3pF?=
 =?us-ascii?Q?BcfmtfvgpM2sQt8CNhD4331NcMalJsRz7E7tKCWuAb9+YIO6JfdJtNUFUJtu?=
 =?us-ascii?Q?sQkioQHaIqzN8w85EM6u0+L7WYQ25z52JFXnIxRl0CSE4Vz6KlNEnCyi/rDU?=
 =?us-ascii?Q?/F+gv/TOJg5rKbdKs3ZaiFlzg+zSpOCjhydXDtzquwARAxPav6rYf2c7sTMz?=
 =?us-ascii?Q?FY7SjRNX7HdoKTV0gPVLuZzJzoOSdj+vxOa5cPlAwo+Umqzrh1OyuUYLJa0V?=
 =?us-ascii?Q?Jg1HyNirwTinkQFw4bXL5aHjOk2WUnp/XQ5/NnV/FRKDCpectm+u9AwAyVMG?=
 =?us-ascii?Q?/l8wDDBQYnlFG6SwVCpo06AxMPAg5mjaT7JWizH8bzHE6boPOdxBvhDjLTAR?=
 =?us-ascii?Q?FEOA1too7vhzhVyom4iuBCuV+t2zTJMb3FK0uDuBlzi09181hy2gxukLGL0i?=
 =?us-ascii?Q?MUov0ke5LzERmuELnySo34O/YNwJYgxQR430VgkFTdtu2ZzwRjXydjeE5HAz?=
 =?us-ascii?Q?Ev73aPfRUo4vtpXvYMW5OTsnx0OLExQtCB8ovZPT9NvCA4igTYkaMEMSIyLZ?=
 =?us-ascii?Q?DzlM+mHpStTBKJ5W4EWwUlYXpP7vUBFxsk/9Ifz/bfP9fwTActjsA0sqZuMg?=
 =?us-ascii?Q?UVcWeTYo9qvES8M+nDNgJl+7cWBi7Ejts9bPz3iDIWaE2CTPels5lAidB0Bn?=
 =?us-ascii?Q?JJ8pOZJ9SLbGcZeflBfJ2ItSXHCRRZFmg6x40eCCeBCVJbdPc2JhVdx74SoV?=
 =?us-ascii?Q?lQ/W4I3erl36aALPpQmpBjO1iCVlmcKOG4puYL7zQWSg6uqxwlQscPBbHuki?=
 =?us-ascii?Q?RDnGOW0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3imotQFd5LtA0DLCe3eM9RNv7KezZfDFOxGgQd3tiKy8HCU3U9aruUCwlz7f?=
 =?us-ascii?Q?nTiKbhGo1YKIbSBFPkqr+VoElWGbZJBYXV9XjLgzTanBi3a6inkf3IvZa6Hi?=
 =?us-ascii?Q?gOKNDSk4lQja/fTDW5tMWqmc441vMJuQf/zJ0B4st44F608eNp3R+mZYW0v1?=
 =?us-ascii?Q?WIQGyvBlo1d/TBa9QpGSlgPIHn9exAevO2WigxbZhxLF4SIPsCB5XGMDi1b2?=
 =?us-ascii?Q?A60zCBNwO2QKO/P7NsIIr6TeC5wr2JKbtI6p4emKIqldZtt9h7ThTfXNiomF?=
 =?us-ascii?Q?cwj/bxFRoOeqZfGnTcuBsXPKUJVYyj1oq4wX0QsatlxFOb4Ca2LE7h3sTwMm?=
 =?us-ascii?Q?DLUEvtaFO5g3EYtdTrmPtdlWVogF2n1Ln0JHc2iqcUNPlzOAYJH5iuA8OUfk?=
 =?us-ascii?Q?AnRStPirhCvk+WQE0OZoqkJNLo2/lthOMubrNTMVd8iAzUeiZXxrH/T0Dvj4?=
 =?us-ascii?Q?THOEdbSRNuGdo6M1UfBunwinIPVQHXMF3IFyz/lVygbdll6OrDBwWiu0gzhX?=
 =?us-ascii?Q?HPmq2O/VfIN5+vxu1Ec4eHlMXbV0sKU+hN1I6QVLF2lhxXzlA9iZw2nO2Ni/?=
 =?us-ascii?Q?85cXvyR76vJjWTk8YjQQHhrHNFAM0ygHGODJm3srPoLhpG0hH/hVOf23tKZL?=
 =?us-ascii?Q?/kV4tfwsC3gdnTgfs4rb+7+CIbO3Mi2sF7YsE6sIm5OLPNYMjpknAD3bTmuJ?=
 =?us-ascii?Q?8qm2jN8NE7w87tgA8qErDw8ke61vgS049E0Pt9AwroJyZj3DQ7b3JyiW9nUG?=
 =?us-ascii?Q?W22O7ytGXSLwAKtDCP/nf+Mlyh02Wt3IZng7koQ80DCOg4ZZL+jJfgVODf2e?=
 =?us-ascii?Q?5fICWJrdvafhZjqf4s/Oltnf4+WKRsI6HEgLCrl673NUf3MrRU94UJTPozAR?=
 =?us-ascii?Q?V+jLjlmXSCcd3OePtnE5saF5To3NcgSdlTQlw+jv+TvE9nliMBJg92BP/dcv?=
 =?us-ascii?Q?1nOCuSDavfrsL3vO8f00NVg2d/V5w/hcvVOUkOd4R7NWrEfxhpe4eUiZTikN?=
 =?us-ascii?Q?9FE+CVpj2cC8k5LbBZ3FenxFsYr+WxmHAoO62cOKpdhQ694o6T8Uw6M/itQp?=
 =?us-ascii?Q?XjGg+UobMeGVwFcFjDVQ75s1zlztojjG3TyTIfL0AFwkkzcI+2dP97be+jZr?=
 =?us-ascii?Q?kagLj4WqvB1wUBW5a62pHbZu0pEc0VX/gKOSiZxx3vtW820KLxaXuL+Bs2v8?=
 =?us-ascii?Q?+XYp6n9BM/ZesIIht0tug1+wXVbpNbGun7ngvMlpLmJx+fbrM2ZZ/YfLjxR8?=
 =?us-ascii?Q?PeRFrYgGib6H6kGH2SXAjf4LD5VLhQd4KJ8EZJloCaDCgF8pfkgEA2D5hJh+?=
 =?us-ascii?Q?w/OtaqhDsI1GiVZnbBQA7+8ga4UbuvuCoY+LFq/T9+vV9i+HHbDTpUA6ISHY?=
 =?us-ascii?Q?Zt55RGyulqj+/QoIJaTz0VmeEhFyNapZtNOBbgfPvPHHuRBJoWCRf+jHCUYW?=
 =?us-ascii?Q?Ln71hYG1xyhSdcyNn8vjS/0S8m/beTTY55Ib3Wo4l51xzHw2kPkFM+bhIvde?=
 =?us-ascii?Q?TtsNborusVCdyeEdizHGOSw2P1Hxbs572ddfTRiAYtdaVg12kBI/Dyn1vI5j?=
 =?us-ascii?Q?hfnUrqJx4hbwfP8ucHbnwMebaucDC+7iRSoERIELKU1aizntKmEMtJjbNYa5?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b62ddb74-223d-4d24-53a2-08ddbfbf56c6
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:37:47.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4B1uXm1tIJ6mlUD0pUKGBt66y0/7nCH4Sgt8ekLr7Kl+l/CBSc0vmHzS/KBBu++VWiHAppfDYEvyZBdl8y2fF9Bz0yY7g+K5VqF+UB+VHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3221
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 14:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118415

Fixes a likely read beyond bounds in sftp server handle
Reference: https://nvd.nist.gov/vuln/detail/CVE-2025-5318

Upstream patch: https://git.libssh.org/projects/libssh.git/commit/?id=3Dae8=
881dfe54214c0c0eb88345c35e15a14081b3d

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 ...tpserver-Fix-possible-buffer-overrun.patch | 31 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-531=
8-sftpserver-Fix-possible-buffer-overrun.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-5318-sftps=
erver-Fix-possible-buffer-overrun.patch b/meta-oe/recipes-support/libssh/li=
bssh/0001-CVE-2025-5318-sftpserver-Fix-possible-buffer-overrun.patch
new file mode 100644
index 0000000000..de9a43b944
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-CVE-2025-5318-sftpserver-F=
ix-possible-buffer-overrun.patch
@@ -0,0 +1,31 @@
+From aa1131c9b16478630d41c1e067744b83474b1886 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 22 Apr 2025 21:18:44 +0200
+Subject: [PATCH] CVE-2025-5318: sftpserver: Fix possible buffer overrun
+
+CVE: CVE-2025-5318
+Upstream-Status: Backport https://git.libssh.org/projects/libssh.git/commi=
t/?id=3Dae8881dfe54214c0c0eb88345c35e15a14081b3d
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
+---
+ src/sftpserver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 9117f155..b3349e16 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -538,7 +538,7 @@ void *sftp_handle(sftp_session sftp, ssh_string handle=
){
+=20
+   memcpy(&val, ssh_string_data(handle), sizeof(uint32_t));
+=20
+-  if (val > SFTP_HANDLES) {
++  if (val >=3D SFTP_HANDLES) {
+     return NULL;
+   }
+=20
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/reci=
pes-support/libssh/libssh_0.10.6.bb
index 31f29c1b7d..454c7b6f35 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -9,6 +9,7 @@ DEPENDS =3D "zlib openssl"
 SRC_URI =3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;bra=
nch=3Dstable-0.10 \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-command=
s.patch \
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decr=
y.patch \
+           file://0001-CVE-2025-5318-sftpserver-Fix-possible-buffer-overru=
n.patch \
            file://run-ptest \
           "
 SRCREV =3D "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
--=20
2.43.0


