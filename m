Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39DDE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 09:54:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.127])
 by mx.groups.io with SMTP id smtpd.web11.56184.1736157266896413669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 01:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=EvzxtxAr;
 spf=pass (domain: navimatix.de, ip: 40.107.21.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWVOYY3dbMjRpZUPiAYEW19VzQfbVlQMg5IeRJY4PWuXSB64ZFv40o/MrimUiwDu94dXe8aSY56GwydIlOZBxW7O392uUym8FljbF6MiolKwHBW3MZ406hQQ/VF8D+r/86detyLffMgNJ5W6udUcGVsi2/DuF9czFkXMzJO6p9BII06n3vHAjPilxahwvA7GZl3jpk0AchQRpHd8kQZUyFLmaONHL2z81wkEAkSEtCv0pe0lOZWiABVU8eVrVScN64ond0BEQkD9rxN+l8gLHUGUO7u9o1qcD6pdbP/JVHOZV8ECPztrfJLU9ahJUgCtKJv4QMKRRjNxDUUASdOiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRGI0eehtYkHo4t3B1Ok2c+bxDyyle3lO3BxTAe7z1s=;
 b=JSUec06tdUR0TJNxYzZpOzwPMg5hc2sc6tG9qMDWLVh6luMkn/KquCLd3mQ8bUnOC6or/bqFjs66FhOW/kbfrsWEI08TBzBYhl3dCc1XkuE1b2G1eIOfYr+dMXTh4oiBM799hAb0yfNdv/t+cvOWSny7cHCuN8nQia4KXrEMUP3Oozh4oqR6Ocw9xJd3jhMxNzr2YU34FCX13WZjUmb0+5trqAXeHBvOuY2dyqm+/q+lIVQOygD7wwcWZKabheqiyXeU8F9pYTCnH3PHtxtUfqPMQ1ZJC1f18oZchwcizulI+jwfYI8+0PL8PDFjNwLVJfv2sYUr9OrdbQV1vM7i2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRGI0eehtYkHo4t3B1Ok2c+bxDyyle3lO3BxTAe7z1s=;
 b=EvzxtxArhCmrl20gOR7uYnzhyX0Vn9N1+msKt5GWsZ0RD7kQwt66ITB1qQKTfF/tckh0F6xBCZY3oMZXr4wUninkxOu72G/g8MX91Jh/LsMUAVeqmU1faK2yDL4bsf9h/5AAhkVJzXGCwJoj5caLmC7zdzIO44TTG20f/eTwszY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AM9PR01MB7314.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2ca::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 09:54:19 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 09:54:19 +0000
Date: Mon, 6 Jan 2025 10:54:17 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] kernel-hardening-checker: New recipe to check security
 options
Message-ID: <8a7e342f75d3437817436be02500418da215ffed.1736157256.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AM9PR01MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e89263f-8647-4510-9461-08dd2e38168f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RhK/RTO9Nn90NKTOjHUPejV/UWfzuD8jVhRKMKIY1qNhLqEpx42j7cum5J0F?=
 =?us-ascii?Q?V6+rj0HnYZo49FeE+f9QI5YKrocgR5T31LfdYp+9oHMkkBqc2xULCE9Y10df?=
 =?us-ascii?Q?tFNRO2JpZipgEwZmQ2I+prrW8wo7p19NXdv3r+QNRK156zRC3ZEiputby2eS?=
 =?us-ascii?Q?vfS/5dF1nAeQbAfE7jkWpETprPqGQD6e5zONRcvSPlASXZP6Y1rRvhTDuY22?=
 =?us-ascii?Q?351pVT+4vO3wAKbUk1UKRa3/PaP/4LhAlFDwv5QmG/6qkrneStM5oOgSqHL0?=
 =?us-ascii?Q?/iS2Mh2nKq23XG2V49FtK/64Ikdbuyo7a2UNUFkT8BheX9pK7Vp1iQ1gaz6c?=
 =?us-ascii?Q?YeFvW46HlIcGaYUvU2HY4MjZvUm5p+TMnXhSP74x1GLODsaQasMCWaX5GiwA?=
 =?us-ascii?Q?KZqCYLwovgrt1QeZQAlHeM8joW7+HZvNpRvgwJhsYSapti55v8/PyrVoN9/+?=
 =?us-ascii?Q?aJL2Vp1AYUpViK/3Vx/j54aI8o4v3DTSL7Veus9r6l7MiCkJy9LqyDva8kWn?=
 =?us-ascii?Q?5yrf15rIaiVuLszm5sfhhbZG6UJnkbQPSCClZL2wYG/zM2u/KURuCYhfFSuK?=
 =?us-ascii?Q?6uPH4xa8RGd0BCNH7VdH0mq5lSm4aACHlyObpEkEuu8E7pmJ1mo2JJ+dQs3t?=
 =?us-ascii?Q?eLyOiPBD33NyAihAt6zkSU3/uLz7O/jnXYwikQykxj180tvRqfOJ3loVODeB?=
 =?us-ascii?Q?MGLk5f2g4sxtGU+I4tMflyCUVbAmY0Uezcvo1c829RuS+sOkuriGpGIjvmfF?=
 =?us-ascii?Q?eHl7Y4Fw5OxYeybYMuCMZzGCMImRq/44eB5ygMx6qSQq5Hb0Uj5Z1+stE8bm?=
 =?us-ascii?Q?Ycg/SyYFz7tp6FUIGJJxUwh+JAbdlHGgySaxRQfZhrh+iDs4jVgBy7arNJMn?=
 =?us-ascii?Q?dYrz0G4HUPiklSqVRMQ1bIjFRD4dAkNowaFyGPvvgwWafEenjyTXB7h1tPmx?=
 =?us-ascii?Q?Xb6wTjjuJ/JrPR3IuzRFEWE/pKNXgKTmBS+/FT0Z2X2Yt5voPgZDdcJCPRP1?=
 =?us-ascii?Q?XGxsOLOWQibFjxJfWuH/+CLz2kY8KpIpEhl51S40IPAov8x97YGPi3vAZ+/K?=
 =?us-ascii?Q?UCiZ11H6Pl8DhkQ0qyMcWFyw6NfH8PI2JMXaox31lFj0/x/oldSB6T1t55ye?=
 =?us-ascii?Q?PCH7n5IbMFfr8upge3VME/OOOEvA8MDxeRDvoe5iGPpYz5DqJV9bg0AiA34D?=
 =?us-ascii?Q?Zz5uAeq8oZYRZVInsVMAwo6AeFDWryc0Xgweef4Uo0/+fAiQK8tC1iG4jNYM?=
 =?us-ascii?Q?mmC5IsUvEu/6z8jv+toMf4Uov3+Gba0RgYjMf3F2UQa0dJYeyYjCk3f+YkLX?=
 =?us-ascii?Q?XsBHDdzUT5IH+kr56ZJgBfZsPp6r5DSqfajb2z/UtC/858QIWL/zNXTSWpyD?=
 =?us-ascii?Q?WX2n0uqu/3vvrqxku67b0CNnmPfW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VZ23b2H6swQXI8u7gaxwwLnhw/Fm9cjWE410gCplr3c7IJp4keiXQtWba2QW?=
 =?us-ascii?Q?lD4MTd5bDofoLzPUWL9QFanb/I/n+sxIzcTzmrDERZZzU6KXw6sXUJC+Lg/7?=
 =?us-ascii?Q?2ENAGrxWswhJp5rgBCg8Pojbs8J6GES202TkgxtKaZdU5fRBo2wXL2iKwlDF?=
 =?us-ascii?Q?DfTM0Rh3DUh9tEh83fbLkBZwbktiQPoLNURYy2CkJuioZfraY+mY8TPe9XRY?=
 =?us-ascii?Q?mk19RNnoOkZ6Yibda3NojkYP70YINxgNb2ftHQStLNleMFQFQV3X/8ZP1VF9?=
 =?us-ascii?Q?UyoaxkSwhE8chn3ZHuqONGt41tb4MoUSPCH3Zs0ZmjAM6M0/m728SrI0L6kg?=
 =?us-ascii?Q?qIjEE2xsS4NxUofk680AQ/nHWq9xey2ApWwoFJ3oSar7HYZEJbjt2SoSAJ0r?=
 =?us-ascii?Q?Nu9+OL0Z77EjJlBod+El9OySRGb9WRDaykRAUm+S/Xh9et6PSiISeqQ2Vi97?=
 =?us-ascii?Q?OmurLmnUc0a59c2oWm6YnGpgg11vn+J5nV9c5nntSbtdsyklDLFk8Yzxm0TH?=
 =?us-ascii?Q?qCiDabOt/nFtF3NwzTrfotC7ROSN/IOOeqwfwNWqbSWQV/ba5VcYpx2wPuEX?=
 =?us-ascii?Q?LiyRoQTFieKSZZIzkExH1fKN7NvisKOuJFzEgEvzqBHJM6Cm1caPnkILtIIR?=
 =?us-ascii?Q?u7KWz6VEmtlAC4xTjK8NwoHZSc8g2IGl7yqbxv75y9+9AR7zMM2v19kO9Zie?=
 =?us-ascii?Q?f8Qa/9amCMlttYtVLGLh/Kv1UkqlXugS9S7EJIymJCSrpOsLFoZFwhX0D2oo?=
 =?us-ascii?Q?F3OqdqkFrAa1rokc+V3xP1HEgaOw3YHZ8SGfpE5NbPuXPQoFH96oU5YsRF+W?=
 =?us-ascii?Q?yKxfeKLBzak/iC6FEz4VxAOKmYtMSUZQaI9pkCShiv7XXomf9sTb0y2bNzyE?=
 =?us-ascii?Q?evkFzVu40zRFMETvO5wm1Tzn5Q0iRTrTRBOIMMATE42lHZ9wnfbRjD1/cgBF?=
 =?us-ascii?Q?OrdA67LLNPyAx+qC3a6qP2e8Pe+kCkOm+dSxDOPJXa+5x+6fYigZcjqNLgcA?=
 =?us-ascii?Q?zLkBw6Jkn3fJHlhX/ZSzith+dxyxzrG+mFM1KvTsENM62PTTIqWmK0cuyGBz?=
 =?us-ascii?Q?53ZKXdFOsbgHC4sXpA21oRLdIA9M2Z5eTtlTjbLOfSPWyrgILEPcpG4PrNXX?=
 =?us-ascii?Q?/e5prejYYhHk0eyDksCUkR3rqPYGcGdFCjbpmIsUepMVFuLq945poTecwrGp?=
 =?us-ascii?Q?SozgXXKxKVXFWPk7YriQsl0cLADDzlJDfQXZEZ363JIsNZsfGJRndjfQqdgN?=
 =?us-ascii?Q?gGz5S0ocjPxdJHtBuBR5pajx3d+sL0ECBdSWlGskt98WKb/vwAoMJO4aWxDi?=
 =?us-ascii?Q?Ky1G6wzB/E3il68/q9WdzBn158PsTC5nZOcXHRNZQ1LScWXz0/l/hVkq/1A2?=
 =?us-ascii?Q?mQ5+SGsZnS1M29qnDiG1oiW4C1wkTCmnxBmrCdIyuUJwMb4v+8Se3mCDlLKd?=
 =?us-ascii?Q?CRIcG02wZv+vcBELYw347UIHmJvv3oyAeztj5UYRNjWlMcHrpEbFyQBhy7sY?=
 =?us-ascii?Q?8Ekhl9YEVOp+XMQHGNJ9RYpKjxSS4pU4MIpdOmywAmIEVdbNlFrj/EoUK0/U?=
 =?us-ascii?Q?qdjwNlOkbdBj6h5BISdenAdPIKsafWqSwZBDygkRHZMCSK6NZm7YmDJ4Pncb?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e89263f-8647-4510-9461-08dd2e38168f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 09:54:18.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNt1oystw9XFK5QO07zSRnyCoiOqgsPsma2jwAwkJJje5rjufjAxPUZmTu0Uh9E0CiaODgu6ijF1dfkgakodSxZAsR0LtQMxkQ2XBEp3ClQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR01MB7314
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 09:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114660

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../kernel-hardening-checker_0.6.10.bb        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/kerne=
l-hardening-checker_0.6.10.bb

diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-harde=
ning-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-checker/=
kernel-hardening-checker_0.6.10.bb
new file mode 100644
index 0000000000..1daf5d8c70
--- /dev/null
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-ch=
ecker_0.6.10.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "A tool for checking the security hardening options of the Lin=
ux kernel"
+DESCRIPTION =3D "\
+    There are plenty of security hardening options for the Linux kernel; K=
config \
+    options (compile-time); Kernel cmdline arguments (boot-time); Sysctl \
+    parameters (runtime). A lot of them have to be enabled manually to mak=
e the \
+    system more secure which is difficult to track. This tool helps with t=
his \
+    task by checking and reporting about the settings compared to a list o=
f \
+    recommendation. \
+"
+HOMEPAGE =3D "https://github.com/a13xp0p0v/kernel-hardening-checker"
+BUGTRACKER =3D "https://github.com/a13xp0p0v/kernel-hardening-checker/issu=
es"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
+
+SRC_URI =3D "git://github.com/a13xp0p0v/kernel-hardening-checker;protocol=
=3Dhttps;branch=3Dmaster"
+SRCREV =3D "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
+
+S =3D "${UNPACKDIR}/git"
+
+RDEPENDS:${PN} =3D "\
+    python3-json \
+"
+
+# /boot/config is required for the analysis
+RRECOMMENDS:${PN}:class-target =3D "\
+    kernel-dev \
+"
+
+inherit setuptools3
+
+# allow to run on build host, if you don't want it in the image
+# oe-run-native kernel-hardening-checker-native kernel-hardening-checker .=
..
+BBCLASSEXTEND =3D "native"
--=20
2.45.2


