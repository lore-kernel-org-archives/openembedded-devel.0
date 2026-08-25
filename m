Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A031C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:02:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24086.1787670129015584401
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XG7KF04k;
 spf=pass (domain: est.tech, ip: 52.101.70.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4Q5n14e2pBd+aw+/KwyoK87XrWH3OjTTrW7YoPpeeZlrAQxw+Rm/jYLqjUILsY1AWQlFb0McgS2fqoAIjEcxee6t6Lp9VZMfa9Ji+fFSvCbNqaqVfTYwNzXag3P0esFeJh/Xrq1oDI4R5o+1aKaDmkzNNrwECjqnF0LRKyZlOHhBgSIKxCAOjXG1zLvf5vU4RCL463V7fS/CkoSj54VwedQrdUB+riv8CVuws8ku0m0m2iRmaitt7GirWDw8o4KbqYAz90TprDIswRGpLdz5wNcUIckOg3OR+Fq/+hE0krfqCCg33jJABLjh+WFNixeab/d3w3pryvLuycr27tl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jjt8Xz7zL6Nxoqut0cYnhoubDX4F9YUjsAuoVqJe8s=;
 b=svFVxskfAHTyjXf1QnddKkJNIOP+D+/4BKMhs7Evbh9c1oJmH52nC185Zj+b1BCf/plOE0uDl2z1t0gkNlE5QC82v43hAOa6w2sB7HU+pG+n4LD09bLqVKr5aM7vg6NLuDz92uq1zFS6359dEExIhEBUrj5sbbM2tg/bkWELRkOiJgpz4EygS+XDPeY39jLG1DLyBFtFpO7EZA1jYN5yRLi3ACElQ9YIeiLPFfpFuQbFO8TiaNnxFOENKbc1gek7iifg9v1AJzGtFL+zT/svEheSwyNtwg5tbdFONWcvkv7cS9d/qJkLouiVmO4xTecWjb6rmA77c5pPLw4RBpYRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Jjt8Xz7zL6Nxoqut0cYnhoubDX4F9YUjsAuoVqJe8s=;
 b=XG7KF04km2PiIBsW3FQA1TI/Z7DksMHM+l8v0Wu4+Ys6XQx4YphIGkuKa7jlbw6wJKEQLE2DBCsdX9VkS3zQW1frBYYAtocfPWyv63ZfpDlxabKhu9EdjmeytvGbwSTAbhtZWC+4oAbbjUNgTUoBBrOs1nUI81JmE5JjszvQ6z3x/B9YXG7ywX2s2EMCmaTucpL0Ds+D/vGBP2j01Gl5tAdCD0Uwq0Eav/0I3Um+ycub1XBzwnCwDADLhgKtu4guZfKV6eDUwP6dftB61Elc7mcPDlLolvigQiEpaTIOkgGLkB+tS0LOtMX/nGxBr4idL/1SmKicuL+vrf3gwizE3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1068.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:02:06 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 15:02:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] meta-networking: fix trailing whitespace
Date: Tue, 25 Aug 2026 17:01:45 +0200
Message-ID: <20260825150145.64061-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260825150145.64061-1-jaipaul.cheernam@est.tech>
References: <20260825150145.64061-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1068:EE_
X-MS-Office365-Filtering-Correlation-Id: c41dad5c-f3a8-4046-c39c-08df02b9d45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jf30TA4xmFLZWwoaW2jPgsofaQDTWbr2lo5gPLQViJkc5P/hz939jmMOyJBuRGlvDLoN+i1qzei/jXGTNjZVWu0aHzf7707DqVtqFwzVD9ncr437L52DdUU5nf5b3h4uhxQlLFs9T4TTotJ7CwG6imm5GJmDp03bHC2RbBj9+AWdZ5ci3Z24p2KXr5RaRyTPNSwSmS9xfQHyGu10QKS+K7/mlLeTY77H8sOqP7ZHJs5qtPJaEtTM4qph6+tuBU2sSwD5EuflN/CZucmc0anep54/hC3LDVpaalqwnydTlRs4hlMBBXIzJM8U4DAVs08eRSkmhE0w+jVZhUPEqId6zdOAPBE+Y+lCcYNnjiJvvd7PVrA4Z4mMx520rCgojzmlceJ7BT5lTt1rm09EPzh5svY3RKft1zPDByzwlv6I1+PX3NIbQvtcnmiutDgFYI2M/8NSCSWxFjnD/h6bxP8Ak9YYR6P2ga8H9WvB+5/POWfy08XW4tomHWh/KTWXt/RVcPNpQYxRDOYRvI9P6Hha1r5g0pDOTbbZ+wHbIFMJPTCeLhXMPr32K8T3ZVYFD5HNOv8HmTA+9P8uHqvLBLGb1SEYCMt0Cu4LcWsRn3Vk4nBF4SJpvm+I5dRwW9Mg+Cyz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yhPrd2PejcnNGNqshaQ8f3lltdEvoeAgwFC75t66OnXFGrAQsADTXmUjAYQd?=
 =?us-ascii?Q?xGn9yUFTHOxgjE37FZx/1khFMIj7SDi807yFuvoKbWrQVl8ErLt3EICfSjb4?=
 =?us-ascii?Q?y4zmdiZYuWGpq+YYqnSS/u1509Zu3be0LS+5xpVH7vW7G9vdxnYIaS/JQuLr?=
 =?us-ascii?Q?fTgcFAwsLlbYb/uJKxkXDgXq//3xwxCnkGvAWscSSkXj2p5nJ6X9pftrxCD4?=
 =?us-ascii?Q?zWDR65JC+13BMzd4B/GLml8SCSxv2xe5er1DlIela0nOkzYcu2xFQfpZnoQ9?=
 =?us-ascii?Q?9SFuMqxXBP1F0UxvT6aL9xvZ0qwH5X6RCIiEGVTn/3z9zOvsCsxFEY82AgAE?=
 =?us-ascii?Q?dn7RVK/KIgioG+pTeo4MJcA3Qc7CnCJoB+bnV9kb+1W23zyH8C/Hw/sIPA9F?=
 =?us-ascii?Q?5EFPQTppX2wuHohev58MLbOyXPjkZSb+dylluRFpI3tJkwelxaRTsz/o/oD9?=
 =?us-ascii?Q?iFpSigpXrd+OC/PWum9o14Fc91L3a8r52DJoT3M9698ZoE1c02+VLrtn9UY3?=
 =?us-ascii?Q?9KkbWTrZv9sqZMXxXPvQmmu1vWKZQNxGN73nyy02ysYI2HgtRV2SUvoQxPCF?=
 =?us-ascii?Q?vQqUrE2mAxmqRH5GQqm6fR4EOcIt5sZAjzqZiLhCUJsUOQWW+p73qrlNim2y?=
 =?us-ascii?Q?G+wy2aoI/htPF3OU28RD7lM0NlLQTNo2mDbkDyoWgtooCCh205AcfN0j/PMA?=
 =?us-ascii?Q?f4JbmM6f1aXQGeJWOBnt1kenjo5Ga/jL22gzdhxaL6dT9w6mBwNVjJtuOLC7?=
 =?us-ascii?Q?xww3L0bgEDdjaWsjWxaqGK86bBky7kgTEmDdAoBiN8c3T2B1yC++4Zcc29cy?=
 =?us-ascii?Q?1zFUKXiTVeaZDg2TUTpLypgBelQRV8NwcIb7g44dgdrQauaSaTEA/Al8nSUQ?=
 =?us-ascii?Q?E1Uzri6z6RvILNW3grQyH+iyHGBgF0RH1+MRIPtS/1KHpdS+uG4j6PZPtUsU?=
 =?us-ascii?Q?CrrJHR1uAvYaKHwAH0AyvmVIoHo/Ts7rsyUe/H14ySXcmBR1r3JDNoXQz+5z?=
 =?us-ascii?Q?qnG4p3sG8vfsEMNQDgwAB+uesaXjc7rjGNpZeTWqoV7FCt56oW+EqWU5SFAK?=
 =?us-ascii?Q?dVqpVarQ9qh9paMt9oBUiTYfoQy7lXs3VSrC31DlKc+2hFIEyCtlkSn6hG9t?=
 =?us-ascii?Q?ag9QTwFvwAlib+CyOQX6NvF+Cm4D3ai1o8jlrjqpUq/5gy/uu1xoITIHBMAD?=
 =?us-ascii?Q?ousDa+kQLgFA7T6VZqarpDKQAWhgioVXsugkYdL0r78aWlqFyfLNobSNedNU?=
 =?us-ascii?Q?oyBl6wTNyZkdti+pWy6nv14f7sTEUXEke4tJavqysGmyYB+GILDe/L3Rs1rY?=
 =?us-ascii?Q?PZoJHhHIHlFTPyLjr6xR8suDQ+L7A3B+PGPWa19t52VOG8un8SRbPN672NM5?=
 =?us-ascii?Q?S6OpPd+y5E1LCVWlc1PEqVGlykh4Aena6AIsYs47v/Q4fGJC89PbSbARulZ3?=
 =?us-ascii?Q?auXdmeg7nIqYtaBq2dhcf1FGdGH87UxXAbCE2l6g5EKDtPdU0vlrSQ3NEgYi?=
 =?us-ascii?Q?NFSlPcnKUKunMAJqcgG/GLGD8HxXfxyI9FXuPoAGoMHtGl/cj+F2s+ODlGra?=
 =?us-ascii?Q?Eq3gKyEHLvlcXGSgIUWI2wlwoiYX75WKC/qfpzHeJqBASp+Y8NM311GAAvaB?=
 =?us-ascii?Q?3C6yyp+lTr9nl1H2RsHVF0+EmT9v/eb2MtznnI4gjyEA+BTmg+9z4a4TjWSM?=
 =?us-ascii?Q?uUGNUVpI+k+cb6waQLvwQiOZpmjUHF+UXQmi7NRWSqMKR41Ul/nzIqA5/6oc?=
 =?us-ascii?Q?/NPksJ1SPS4OnhUq7iDUkrtc+QuDrOAWErv1kqs8TiBPSH0NXh0sRju02SRy?=
X-MS-Exchange-AntiSpam-MessageData-1: M++Rg4rCY1JJuIStY/mXw1VtijogWXQeUYE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c41dad5c-f3a8-4046-c39c-08df02b9d45f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:02:06.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE4EcNK91PKU+loJbPFQtoUs0zAkr3jDysZHoaIluJ/3k6gsvGMOf8QNwvR9Pue2u5ukXCCSnR1RFSuNzvvNd0c/1sPM6kx0lbMlBz5GryY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 15:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129473

Bitbake now warns about trailing whitespace in parsed metadata lines.
Fix the affected files to silence the warnings during parsing.

Reported on:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4284/ste=
ps/15/logs/warnings

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb   | 2 +-
 .../recipes-core/images/meta-networking-image-ptest.bb        | 2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb     | 2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb      | 4 ++--
 meta-networking/recipes-support/spice/spice_0.16.0.bb         | 4 ++--
 .../recipes-support/strongswan/strongswan_6.0.7.bb            | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/=
meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 17ef3c99cb..561edb48e7 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -30,7 +30,7 @@ SRC_URI =3D "git://www.bearssl.org/git/BearSSL;protocol=
=3Dhttps;branch=3Dmaster \
            "
=20
 SONAME =3D "libbearssl.so.6"
-# without compile errors like=20
+# without compile errors like
 # <..>/ld: build/obj/ghash_pclmul.o: warning: relocation against `br_ghash=
_pclmul' in read-only section `.text'
 CFLAGS +=3D "-fPIC"
=20
diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptes=
t.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
index b6238d6100..0149cb69c6 100644
--- a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
@@ -20,7 +20,7 @@ BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in d.=
getVar('PTESTS_META_NETWO
 # box) and explicitly add up to 1500MB.
 IMAGE_OVERHEAD_FACTOR =3D "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
-IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-wolfssl =3D "714288"=20
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-wolfssl =3D "714288"
 # If a particular ptest needs more space, it can be customized:
 #IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> =3D "1024288"
=20
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb b/me=
ta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
index 95c9f3919c..28cab7d47e 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
@@ -128,7 +128,7 @@ do_install () {
         -e 's|-ffile-prefix-map=3D[^ ]*||g' \
         -e 's|-fdebug-prefix-map=3D[^ ]*||g' \
         -e 's|-fmacro-prefix-map=3D[^ ]*||g' \
-        -i ${D}/${bindir}/prxs ${D}${includedir}/proftpd/Make.rules ${D}${=
includedir}/proftpd/config.h=20
+        -i ${D}/${bindir}/prxs ${D}${includedir}/proftpd/Make.rules ${D}${=
includedir}/proftpd/config.h
=20
     # ftpmail perl script, which reads the proftpd log file and sends
     # automatic email notifications once an upload finishs,
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb b/met=
a-networking/recipes-support/openvpn/openvpn_2.7.6.bb
index d6c8a0e34d..930193af7b 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
@@ -74,10 +74,10 @@ do_compile_ptest () {
     for x in `find ${B}/tests/unit_tests -name Makefile -exec grep -l chec=
k_PROGRAMS {} \;`; do
         dir=3D`dirname ${x}`
         case $dir in
-            *example*)  =20
+            *example*)
                 echo "Skipping directory: $dir"
                 ;;
-            *)          =20
+            *)
                 oe_runmake -C ${dir} check-am
                 ;;
         esac
diff --git a/meta-networking/recipes-support/spice/spice_0.16.0.bb b/meta-n=
etworking/recipes-support/spice/spice_0.16.0.bb
index 3d7788f749..b437008430 100644
--- a/meta-networking/recipes-support/spice/spice_0.16.0.bb
+++ b/meta-networking/recipes-support/spice/spice_0.16.0.bb
@@ -5,7 +5,7 @@
 SUMMARY =3D "Simple Protocol for Independent Computing Environments"
 DESCRIPTION =3D "SPICE (the Simple Protocol for Independent Computing \
 Environments) is a remote-display system built for virtual \
-environments which allows users to view a computing 'desktop' \=20
+environments which allows users to view a computing 'desktop' \
 environment - not only on its computer-server machine, but also from \
 anywhere on the Internet and using a wide variety of machine \
 architectures."
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 SRCREV =3D "a6668fff651726e5d4cfd52cbf8669540970452c"
=20
 SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;pr=
otocol=3Dhttps;tag=3Dv0.16.0 \
-           file://0001-test-gst-Fix-compilation-error.patch \ =20
+           file://0001-test-gst-Fix-compilation-error.patch \
            file://0002-test-display-base-fix.patch \
 "
=20
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb=
 b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 9283815705..117c148865 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -62,7 +62,7 @@ PACKAGECONFIG[tpm2] =3D "--enable-tpm,--disable-tpm,,${PN=
}-plugin-tpm"
=20
=20
 # integraty configuration needs meta-integraty
-#imc=20
+#imc
 PACKAGECONFIG[tnc-imc] =3D "--enable-tnc-imc,--disable-tnc-imc,,  ${PN}-pl=
ugin-tnc-imc ${PN}-plugin-tnc-tnccs"
 PACKAGECONFIG[imc-test] =3D "--enable-imc-test,--disable-imc-test,,"
 PACKAGECONFIG[imc-scanner] =3D "--enable-imc-scanner,--disable-imc-scanner=
,,"

