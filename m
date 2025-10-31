Return-Path: <nikhil.r@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3B6CCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 06:24:45 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.86])
 by mx.groups.io with SMTP id smtpd.web10.8730.1761891883679158605
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 23:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=zjJjM5d2;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.86, mailfrom: nikhil.r@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLcpgoR6VGyW2vIxIt6lJoC1DIE12uCjYGNzhj/407a3fiqUf75wDGkeBM3+YgFNeykRy//bvPlpzUBHNbBc9gmxj9tJtHtK2SyQZ5bgesUMSg+t9MvauXx2YZz0LQUfT5WGBEBuPTQKxc79FsKfKSUw1CavS1693w5dO8O/6GQiJSqUGZq70W6CESBvgJLSRoQQzhcQ/dQHR1wcZLdeNmrIpqb+DOwcs0Dn9GIYeYmSF7sh92/BF3pkFWlhT4JJnHNRcMs5rCYGIs7a6AJTbDN0D4qhO/etnXNTO6IYszV5yjJwLA8fl0TDgmj9iU/cnmG3rSs1FEcD1Og7tIcvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzFsLcl07uWIc+vrG7aWPgqxdiMUgQKOI+AfGb9Sxlo=;
 b=h1X/8Tg+Fl37pnXdrR3IUq6EYhBfZXCiP5vmgLdzehClO8nBRHzlEBWN1OSfGqC1A4xlUioG8aJSL6EisXSLtw9xqDC/8KSG2/N4o/OJGo9XC9/Ttldo0tNdhxIaj0Q+LOgIe3i5WkPsxNAC44IHD85QoBpzpyvqGuycciSljhgFmrSF/b/IrtqNufpcS9bHSE1EYCpVL/z3UbB09qO1apjnX99DbHBAHif34MmlL+Be+EC4FY7aYf2wOZZ6yLeuVX+py57MoMJnqdy2vs/IgCnM4yWn3g+6BaaqYLB0OSszSv1cs6sfoBj79UcII45C/NhsLEBC0Xsq0TkjycRr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzFsLcl07uWIc+vrG7aWPgqxdiMUgQKOI+AfGb9Sxlo=;
 b=zjJjM5d2+noNDjfxjKXEFe2LSQUWCco/W4a00t85Bwd4dYRMOP6wc9+iel4WAlWwtw/W4iA+mt7ZfVLJ/plkHuArWhr/ehrPFjZhSZ1aDOaMyyYBJTnztAm27STQRk6PbrHj4KfDtgNx4kxm/14t08MHqeBQvl0EPmdZ3oWk4UlOUeFekdLoRIhKYFYIIwOZCk72/CPvjwjcMTEGBCrdCOCRmfnJERwCBqHSrzNkt7vCQ6kdJmwpvUaqHR7aBcE4cTKJyoQAG1Jcw79pJF6gkKDkue4LEB52ut6dTVbgIAYlWRkwL06G1ANXTHPqNxeLUATzPCu8RVVE2q7nFwqFpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::12)
 by MAZP287MB0685.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:10d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 06:24:35 +0000
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1]) by PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:24:35 +0000
From: Nikhil R <nikhil.r@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Nikhil R <nikhil.r@bmwtechworks.in>
Subject: [oe][scarthgap][PATCH] inotify-tools: add ptest support for inotify-tools
Date: Fri, 31 Oct 2025 11:54:05 +0530
Message-ID: <20251031062405.122538-1-nikhil.r@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::8) To PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1693:EE_|MAZP287MB0685:EE_
X-MS-Office365-Filtering-Correlation-Id: fddb06da-0e5f-4ada-19d8-08de18462963
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vt7DshQbyo5HsJpVsjG4UY5LK5jqQYdEuBL1GeKr7a0ZC3Gaio2PNlY7iyY6?=
 =?us-ascii?Q?Q2/lsJQqgpG0yrJgFtVhJyGlvPX6LbAj12ikc94QnweQqeKlsU53zQqohz44?=
 =?us-ascii?Q?6JAM1LaQkHRfm2z8X5oqo+H1p/xImx1hzXVPMO7xU8Md8PtaXVOCnA6+lXMj?=
 =?us-ascii?Q?y8m8yOgtROLRR5zYu1GiupLQOYgIBH+aNmJONHy7wKjTtj4f4TYWNzqXOl0a?=
 =?us-ascii?Q?ZZhog9CbSDAHY80/gTxsRIdSBlD5G9yj7scXAvSv4MJYZWCOJWUKk25duC9l?=
 =?us-ascii?Q?6HMlALbV0ZePy0CicGF/ps1qE0ubSqb2X5VAhCHqy+9B25AbdT7UBmatiXHJ?=
 =?us-ascii?Q?QcghAQHzcib6n+csnN269T/mk4g/NKnAGmocAw68CZWfgPbONms6qRhGKOie?=
 =?us-ascii?Q?rT8DXC5IdD9zRdl1GhZibkJv9HQ0ChX/V57YLKtSaKXf+aK/bfnyG1zPoX0u?=
 =?us-ascii?Q?nD4aIQG3Rxlb1htWcBDN9c02yhM4Dwi7lbYbdMwii7ik+meUmBVjGt9krrDm?=
 =?us-ascii?Q?8xO0hZqDSULthPlNeWw7SsaeqZ0Mq2dIgrJyEPeoTJ1cnPwwUQ8/hupKaTku?=
 =?us-ascii?Q?0doY28fx/P/OAPvluVxpvv36JJPczdXEC20gavNylkuLNaM1cuuD3Vm2weGh?=
 =?us-ascii?Q?2SLKzbZM82ntUtrX28S4FiUbnABFgcyRRwAAUNJLzNyl+z/Lg/QjUMdrLNuE?=
 =?us-ascii?Q?OGWWK5qrshqF/jstG38vFkGnayS0LtLB/kuJaSabDvMt1jUb7zY7EM/JfH46?=
 =?us-ascii?Q?jLA1OWlx0j1UXHHv6que5tG7s2UY+ccRkgcXBbcnG4dTppU5KsmSqOYtgU+5?=
 =?us-ascii?Q?UPAERzm+x6VhLy+2RQ5VD1uLwYaVCGfIWZiO7eDimTBShyeGpI6HGvvTuCR6?=
 =?us-ascii?Q?y0ftc+rp53Xu/y43w9tiCIN52E/58xeta7z8vucWqr0a6wAtgzVNU9rgMNrY?=
 =?us-ascii?Q?uXiFsw0Dm9Oo05KGYWupLI6o8+sp+Pe4eb+/94bywingP7/9LVfSg6aj2N8a?=
 =?us-ascii?Q?kXlkTNsXHVa35TTdJnWG5QaRaPpaRhgSi6GjwF2U2A+jRfy4IaFcR06+I8Ff?=
 =?us-ascii?Q?1XQoG0Evhyo0x5TeJ0/suDIraT8SJLSf5+fm73pD6DHG9S1gwpeV8FZhwq0/?=
 =?us-ascii?Q?4LvEbVJkbkStSrMXaUErTYu4e9ilNThBZlQxGnFsqxVJsANX5l7bunNMw4Fk?=
 =?us-ascii?Q?kEDsMj2/Y1DChjn8mls492C7KoUvROArkhIJgM9P7bYRMOoYwdMwpdqc9Y72?=
 =?us-ascii?Q?jr6G0MeBM2FqWso31AMPRM8rC5pCVr2+JunYMe0xj75kBnJoxv81vckGaR9E?=
 =?us-ascii?Q?s1GGqbeR6saX4IF11qB6axjsGNc3+8xYIdOfkVi0jtp7wL5VwryW8wALtMoe?=
 =?us-ascii?Q?sjoHQuEzZ7cfFycstQh0tZM+IKbOh+IA4/AtbZYR1nR+aBCZTUekgnFUH27E?=
 =?us-ascii?Q?Y3frTQkIYDLe5yFKZlWGeqK0Z5WDR5N/NNy8/Qcdr0pq86KKw9Mv3PXR7pyH?=
 =?us-ascii?Q?RUpaEMOfgfibZZJ0Q6CisZ8QvT+bHu3666hm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1693.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dwjT1jNLsuxWiTWe60i9zgF1uIGBhhCgsCjeib5DkMVY8xuq13cz7InVZnkx?=
 =?us-ascii?Q?bL0iFwApUI/uFT323Pmz2SYvL2aENGs7lCK2XRlSD+8L3aSurUXLldUAmcFC?=
 =?us-ascii?Q?gxTCwj6LrkWOdhfXBtpuF4oWO4Miy+2RRIEKx9fsMHfT0LEn9pxonO41s+9/?=
 =?us-ascii?Q?QcXVG9yPAn7leIwA7q3RewJ5G3sih6dqLC5JskoLTU8HwDJtE1dXG01YHcFk?=
 =?us-ascii?Q?nFCCD3p1t4kF1WIg/vAB9NHbE36H3AzR3hr3R0PT+FF1RgiyXtvMkh6/w1jo?=
 =?us-ascii?Q?w1KePF0OB67K7KVSH2RJQ52BUKjU7J17qAeeU2KGYVG5ZIjgs3//CbBur2Qm?=
 =?us-ascii?Q?1pabmMQu2fl0sOSVKygamRuBlG443A+j1W1b52nhOsH7ZBs6QDdEnKTCwFPv?=
 =?us-ascii?Q?LnUzcVnLX5K9hntPSuWrG5wO2ZZlWwnZMO+fxF652YhTbkaJphvJvd+tqDml?=
 =?us-ascii?Q?3qvWby33gW+Nr/sZbnx+NzJErnnuyvIZc6Q7bRiDbnIBgnwGQINesmZThDYA?=
 =?us-ascii?Q?5blHCYf2xY9OUU+G+7qAvo/DkhsR1Xej2F4Xj0lZaNEEHe5IxtDC1JqLMx5R?=
 =?us-ascii?Q?T6PSDbfbLH5Z3tkPHBQaAPIoKPVxAO86TwbZ+5DRuWAcFagQCrajmiXiK1vL?=
 =?us-ascii?Q?LaTT/Qo5E9kU153KzYlVSTGDkI276hi3iI3169CLz0i9FhWA7MIYUVMfGB2M?=
 =?us-ascii?Q?rXdfEn9YGbG4383k/9iaqNRcof8BQRv1+CWISVEZa6h6prh/ndrDHIyYavNG?=
 =?us-ascii?Q?QCByQgqolPb1hKTHoMTGM3h8/JkmDwIx8zE8H8QwOhoh4YnRO+2qmbv5V4rI?=
 =?us-ascii?Q?7MMKPZ6vgu3RgFrMCjvBwaT/lZWBzuz8hiki0T9iTPGAY/i4gUqloWyg3BcP?=
 =?us-ascii?Q?qQKUiXSWEFFb/6jE1+WpSqGfAzB8ugxlSACQtmQKNFhFmk8pomxBHNZeJdbj?=
 =?us-ascii?Q?eRmmqEPFxd1d0JtkCA+DzRoQN25/xMWa1OMWS4p29F1A0+HC63TKG3RiVPlX?=
 =?us-ascii?Q?QBsuWeG0BQoPfTu3pizTfa8hs5mzHciS9wdARpOkmgVcamYHmTK1XjnfqBYw?=
 =?us-ascii?Q?PKyXqdmZn+YaiKC/MvocJ6+hW6tqiztQ4zC9xLjo1VMDPT0C/cCkemrfoF16?=
 =?us-ascii?Q?DBYbJ80ic4m7sZcXxMhbVyeepJjzSK+3zF3pDjf9iVmbF9q3e4n0GIRNeYee?=
 =?us-ascii?Q?Uoy7ufxTZglMa/Ew0Ug+OIJUg8hnCESFC3iX7REnj15vKkYC8i5IJlV0fnMl?=
 =?us-ascii?Q?KSq7i6UWXJSY9ll4VSI07hINHam+PU2YnZr9evCJU2+47ah8wZ5E4+XjVRPM?=
 =?us-ascii?Q?O1N5Gx2OonXdbgg9gz/9rzi4d/IrtNGhaVJrEdTMRDIxkdot5JWjUmUd0yya?=
 =?us-ascii?Q?rhVdOrmr/dGrVuW0mR6W42hiot4E+4rU4aWDTixhObRTQqtVqckIj+L9KKMv?=
 =?us-ascii?Q?iGsQogR68Zqni/jE0AohQdMSP5EAWYhqFTBar6Kb+dxJSwMtEToahzAlwL0u?=
 =?us-ascii?Q?LBlKw3V21rjrlG3HDXYuZR0X5gANxypXcRceLO+St1gKwYR38N0Iwuo3nOeG?=
 =?us-ascii?Q?0MW3eAmuc2YmKZghDWckgm6p2/w4g1u0sV5zimOdJF/UuelGyn6aY/5/XQWT?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: fddb06da-0e5f-4ada-19d8-08de18462963
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 06:24:35.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aMej+JEwcprwLaZfZgUcnD3+Mi2oevU1qVyoYlob6XDNk3rcU8yyfRI6/BTAcz13TCPXEwcV/3Rw3Ekxak4jG+AN48+LaU5FPH8q+SsLc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0685
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 06:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121224

Add ptest support for inotify-tools by introducing a run-ptest script.
The ptest verifies the correct functioning of inotify event handling
and related utilities.

Test coverage includes:
 - File creation, modification, and deletion event monitoring
 - Event handling and command-line option parsing
 - Basic consistency and behavior of inotify event queues

The ptest completes in under 20 seconds

output:
:~# ptest-runner inotify-tools
START: ptest-runner
2025-10-30T08:38
BEGIN: /usr/lib/inotify-tools/ptest
If you want to do a malloc trace, set MALLOC_TRACE to a path for logging.
event_to_str: test begin
event_to_str: test end
event_to_str_sep: test begin
event_to_str_sep: test end
str_to_event: test begin
str_to_event: test end
str_to_event_sep: test begin
str_to_event_sep: test end
basic_watch_info: test begin
basic_watch_info: test end
watch_limit: test begin
watch_limit: Warning, this test may take a while
watch_limit: test end
tst_inotifytools_snprintf: test begin
tst_inotifytools_snprintf: test end
Out of 362746 tests, 362746 succeeded and 0 failed.
All tests passed successfully.
DURATION: 15
END: /usr/lib/inotify-tools/ptest
2025-10-30T08:38
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Verified that enabling ptest does not modify existing package contents
for inotify-tools

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 .../inotify-tools/inotify-tools/run-ptest     | 21 +++++++++++++++++++
 .../inotify-tools/inotify-tools_3.22.6.0.bb   | 16 +++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/run=
-ptest

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest =
b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
new file mode 100644
index 0000000000..1bd51248d8
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+# run-ptest for inotify-tools
+
+set -e
+
+# Run the test binary and capture output
+output=3D$(./test 2>&1)
+status=3D$?
+
+# Print the output for logging
+echo "$output"
+
+# Evaluate result based on exit code
+if [ $status -eq 0 ]; then
+    echo "All tests passed successfully."
+    exit 0
+else
+    echo "Test program exited with status $status."
+    echo "Some tests may have failed. See output above for details."
+    exit 1
+fi
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.b=
b b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
index 8a0ae17ad7..3629ce45b2 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
@@ -10,11 +10,12 @@ SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3Dma=
ster;protocol=3Dhttps \
            file://0002-libinotifytools-Bridge-differences-between-musl-gli=
b.patch \
            file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch=
 \
            file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
+           file://run-ptest \
            "
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools
+inherit autotools ptest
=20
 EXTRA_OECONF =3D "--disable-doxygen"
=20
@@ -25,3 +26,16 @@ CFLAGS +=3D "-Wno-error"
 PACKAGES =3D+ "libinotifytools"
=20
 FILES:libinotifytools =3D "${libdir}/lib*.so.*"
+
+do_compile_ptest() {
+        cd libinotifytools/src
+        oe_runmake
+        oe_runmake test
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
+}
+
+FILES:${PN}-ptest +=3D "${PTEST_PATH}"
--=20
2.34.1


