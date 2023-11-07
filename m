Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A28BC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:15:33 +0000 (UTC)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.138])
 by mx.groups.io with SMTP id smtpd.web10.8127.1699355732562291852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=p7vcJcF9;
 spf=pass (domain: ekinops.com, ip: 40.107.12.138, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz/6fnHzecCSmWgHrFffw+/1H/X9jJfxTPwbFKwQ/gfn1Vkocg479Jb1mhNnQma1I/xb3D9n9XWljbtEbK5TS2lEU/Kk9rG0UPhTN+9M92Ax0YHP9pIFKb6JNMxmtZPzcF4M/qnCjaYZtU3Xsk5NGvuiXBYQRqtcl+psy7IXbNVDyVPhMjsie6qT1IrQ4BlgopFk/eyRHiQAUybUKaJ1RqWsDt6W/dWLbnfZaaYvkqGV6qplEkd6qpXij0oylrFF6n4ry94da0Q155EiYqY72m0sOX1yifmccEdWh4omfSTNiID87tBsUtG1KFiqXuOWUWVJ1K5ocU4pnCXcdV2bDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgBo5repiJQyWtpsu2XfU62B1e3ztzBmqENzdmNkglY=;
 b=Clz2Er6fBqjYu/eKtE6q59D7sOQRZvb8/Wg7nE2ZcKxT8ILuHtRk1H1Ynz68g0n1xiqGEqFpfHqJvBU0SpkmEGuNAJaqeXqvLSe3V0ddxQ8zFlsWXPlDPBai3JuQ8D5U52mqfDtogPyaZvZTzP1uPgD+FROv4U9jI3pnH45BwnqqEOZ3lLsSTWeDyfFOeH5Qfkq06G4i/HSV+k149eL8lPpLYD/7wB1mQIZRs8idS9EyBpAvXHSstvotW7IIfTfbc2O/UFggXdoMNZO1MVv9anXJHIzMD0SbLOb6j6ZL3I87Fnx8acIIRzNnu8uLtfFa5dDrkOMjUUh0ecX0vTDEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgBo5repiJQyWtpsu2XfU62B1e3ztzBmqENzdmNkglY=;
 b=p7vcJcF9YPS6OpLa7cmjUKlzTZdZaEIFi/UyvYbQsOsjw0wod6lOu7SM15fkr/F1yTdD7Ry98WX0vJ+HsKc/3bg6OljAkV6w6WzINSCHGBELYgmAO/H9VPIL68AGc8iaM/tSRmOMDC0BekY8hOg6PDiLc7DmFuu9tEuMHdeaq4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::5) by
 MR1P264MB2209.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.17; Tue, 7 Nov 2023 11:15:29 +0000
Received: from MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5826:6cfa:9d9d:872d]) by MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5826:6cfa:9d9d:872d%4]) with mapi id 15.20.6977.017; Tue, 7 Nov 2023
 11:15:29 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH] libsmi: enable native build
Date: Tue,  7 Nov 2023 12:15:09 +0100
Message-ID: <20231107111509.111957-1-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::9) To MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRZP264MB1781:EE_|MR1P264MB2209:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc85c29-e5c1-4883-6e88-08dbdf82d9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CwDwKHHfQw3J2qKM8hLG9JaiND+Alba7zYCsm1fJl50HC7XA/2fvYqQtbIwNCs6XY9SUWpVA+DpgL+R1V4PMFs0YlZrNjgBoKE6n1N/+UfBp3MrrrsIyOxMpFuLxnN04CLR91K63dSxcsTQ6Vt7sJxbW7WS/B4mUSj+Zs4YPNmgxNhDGZnvDnfzngI6ShtOUgHqJQa6OCFloZwAnIBvHrNrTBeC/l1/MY+bPoFSZMUTxP1rZp6O+xESWj/UckXfiw2D4ae1OWmSj8CUuPo3bHWz2ofr90iVbe5nVZR7vpM77UwIDDRAU8cGV7TVTAm6LIVngZZZXo1N1/wSYwCvcidLnSsjmfuFb4QLX37wAXyU/pbYlFVqNKIFaAS973aI6PfYWx1SR0gk9cawmsMhEjrZr1dyr9pdE5LZlJOKHDyVLOqJeTj9emkc8ohc5AMM6FWg7ENyc38Wh/cObUwTMySkp/pAkfF+91cxjsK+ZWNqjfVc8+T/JVRMX9BTa70C/Y9stTEcvqVa6JMHfoKXIlZnqKPX5jtwjCoeDqHdoTcXbNWiJ/dY+sR87FSpipmxJ3LGyaoK4eYcNZhoXavSxfreSvLvzP5/n4Ef59e1ehPE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39850400004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38350700005)(36756003)(8936002)(83380400001)(4326008)(8676002)(5660300002)(66476007)(26005)(66946007)(66556008)(6916009)(316002)(2906002)(107886003)(44832011)(478600001)(1076003)(41300700001)(6512007)(6486002)(6666004)(6506007)(52116002)(2616005)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6UH04q5ycaY6RWL6G9cAoX29NpGMr0+gVJw98oYQ+8LJ5+HomZR2uZhsomp1?=
 =?us-ascii?Q?6QhOhbN7RLzPNRINWWr8X5Y/K1BHA4q/oSgrFd67T3OfsoQJenSDnlCdUZHh?=
 =?us-ascii?Q?jpsLuG23353vCE9OVULUO0k/Q2oeWt+Sj31Ke9tEfzmPxSFfOTYikIQNgoZ/?=
 =?us-ascii?Q?CauoUFIbcO++b2nEp/J7ZC7XWJGe1ZHJiZkMaXw+f427m+KYY+dGr6JejKTP?=
 =?us-ascii?Q?VBWXoI6lq+geiZoaptAxY/MJ2P1lyr3+aN9YPYJmFBHw0CQDXDeGtJXUGJHl?=
 =?us-ascii?Q?cY41mAP6B7IVWIapPRkCvTjTOx5ScgqhU17RaTqDAaU87RtGRrClGOL9QoZJ?=
 =?us-ascii?Q?F3SJ665MSKvcYbIvbmPZXCzMGvR+AUQ4hNFFjkZthxl57B2tI997I4+IgiGu?=
 =?us-ascii?Q?JdD3YEn/GB8vq8Gjz1im3Zr4bW663KnBgO4djfYqBE1imXw4KphD0Ppid02H?=
 =?us-ascii?Q?NhWgPiCWIhWeIOtZKggv13Vh/gi40hS83TCzM+or2eSEedob1aBNZqBvwX9U?=
 =?us-ascii?Q?Z3uU1qNp+NySLp50dBs5pHnCW2zDK2SvK6D1w2Bo5pH5cTbRgd09WkWID1/o?=
 =?us-ascii?Q?KpBiEEu6RjYJ0uTNuAomk8vPFzl3/uOGBTqk71bg4pqpDZS/sdljbaXzH5Iv?=
 =?us-ascii?Q?e7ePbofGlo8x+kVFDtbLXUSxBg8YUiIpPSmccIGo4sBD5628y4TNSjRtCWe9?=
 =?us-ascii?Q?qbHuV4oPWD0f74RME40mC+fIv15seRz+P7PALYJ1IR+Y/0GrZrLAHW1Pzr0e?=
 =?us-ascii?Q?scyyqI1vBi5dNF5uwEUlfA28UmOFFMmOajfgTut+DLXGP1OzQsjfIBOefEBA?=
 =?us-ascii?Q?4kYtQQvSmQ/NlaoWEYje/VEnnkvIyH6ccmFU/Jyh8Oo1hibmcG1uOsCvtxA4?=
 =?us-ascii?Q?TyOd6CJwLzgRkppkTMNiUjlv6tr8P+jnAHTDNcBVUQwfsbCeEttMDNih1GuU?=
 =?us-ascii?Q?3Q83qqqhA/vttWd2GYGPt9QceuSaCsz0lq/BEc2wyrC5kxxZXmG1rP6SeC4u?=
 =?us-ascii?Q?f8mEGy6pNegpcGSasuutSsIU9b6lU5YERKSXaIRSUMhHjRQnjsxQFswZ3AmH?=
 =?us-ascii?Q?XUfQTLOst2I2ZytiQkxsfLkfJ5OYI+s/49iNfaSZvCOJWSBm+HoQC7WXcClp?=
 =?us-ascii?Q?AfIkRmzoJrGBTWtwMCVb8enjqAs79Gi58JNatHpn/LWqUTIVZovmZiZeuqny?=
 =?us-ascii?Q?sDPE1VuU3PwEPpW9u7MK4E6AckBVNSxrfGgo9/QXXgJHKTziUOFxxmOIldbs?=
 =?us-ascii?Q?n9XavZZKI09nFBwG1PKi2NGrmxL0ASdqDT4SUOnzDiyKQFc1gcRDgGdGFaBy?=
 =?us-ascii?Q?Y7bJIT9yrNniyYeNPDbiliZ8VwQG3REtAcsc3sEPHGBDyIR1vidWOrcdg5ce?=
 =?us-ascii?Q?CJ1hsZfTZ1lVBsOpX3fZ294HPuvWpGRktwDPtvWkCr35EOLdofLuKXDZ0GFQ?=
 =?us-ascii?Q?A69R9lJaxRM0hoY7izyOMA0KZDcmyEdAVLh895rkAxQkLYqyeIFrYcWj34zo?=
 =?us-ascii?Q?BDeM040eqn8rPzG+nSJQBM85cMfg/xvPv1BPLLfTGVlrHWAJo6Ggqs1/89Rc?=
 =?us-ascii?Q?BQGeUtlzdpS3M5NZulBPZVJfLtjbR3KIFw+wFYaFOXWrmePuZWLXiyc+yspg?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc85c29-e5c1-4883-6e88-08dbdf82d9bb
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 11:15:29.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1OCx1RZb685DDOxa5SR6P4yn3YxBy3fBFN5Ifl7t4kR88sAO6kMCOYRMVLAAosmnxIrqTJY1ZhrWSDQublB5J6Y7m0J835TmUN2oMQT6c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2209
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 11:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106450

Move wget and awk EXTRA_OECONF parameters into native dependencies to
not lock native build.
Add missing BBCLASSEXTENDS to build libsmi in native.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recip=
es-support/libsmi/libsmi_0.5.0.bb
index 33e1b6fab..07e2e2941 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -14,13 +14,11 @@ SRC_URI =3D "https://www.ibr.cs.tu-bs.de/projects/${BPN=
}/download/${BP}.tar.gz \
 SRC_URI[md5sum] =3D "4bf47483c06c9f07d1b10fbc74eddf11"
 SRC_URI[sha256sum] =3D "f21accdadb1bb328ea3f8a13fc34d715baac6e2db660658983=
46322c725754d3"
=20
-DEPENDS +=3D "bison-native flex-native"
-
-RDEPENDS:${PN} +=3D "wget"
+DEPENDS +=3D "bison-native flex-native wget-native gawk-native"
=20
 inherit autotools-brokensep
=20
-EXTRA_OECONF =3D "ac_cv_path_SH=3D/bin/sh ac_cv_path_WGET=3D${bindir}/wget=
 ac_cv_path_AWK=3D${bindir}/awk"
+EXTRA_OECONF =3D "ac_cv_path_SH=3D/bin/sh"
=20
 do_install:append () {
     install -d ${D}${sysconfdir}
@@ -34,3 +32,5 @@ FILES:${PN}-pibs +=3D "${datadir}/pibs"
 FILES:${PN}-yang +=3D "${datadir}/yang"
=20
 RRECOMMENDS:${PN} =3D "${BPN}-mibs"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


