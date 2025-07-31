Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CDBC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 20:28:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.134])
 by mx.groups.io with SMTP id smtpd.web11.72215.1753993695944767183
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Jul 2025 13:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=I8Cal0oK;
 spf=pass (domain: navimatix.de, ip: 52.101.66.134, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJV6HfsjZ8WUfxcl/fJgnjFPmnxz3zvsgna7pfe8BMIamMLxSM8w5ZwRvKqiq1CBR6+uyO39usVwN3McvShnujO7MbcDw3FKJZrAB1A1hiGn0UnPNw+9uVcNnTRA3bdBSf+1LuE69mTGHhcncFBfB2CQTU58iYCWPcoGAbJcoEeg2jJDrb3CeCnXUPzEGm94rXAOSlcCrRt/FhjMt6kFjFsAE+rP1rX4eeHYGjDKr39abPhxdFjvrMWG2zDRAH4yQxGDN5Tj0m45C5DSoi23Zz8Hrr5MxZRuYsCLow8RdHF+imtbhGPzPdrnGn76pkwIcMe0CvLAyisCrA9RuxUbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3mUmx4q48gCQeadB3laxnRcLGA7j7F6nmcrWXH4hZE=;
 b=RpgT7bk1DO+7KEGSnytNIQPIYxWdv3EOphd3J30w7lxuN839nayuAoqiB6QWf5CjlSWrwFhjgPXPhwu1PPyt6ZOySj4qKsguvtRN+bskvdolRHHwzDA4HXLTAMpEqMWp3i5Sko3ek3UaJke5ThAG0khYXyermuMZzQ+PlYK5wfq2WUxAxFk3saAbLRoHkXNNWy8cPJ9Lg7ylePt02F1nvrTpgBEdXMddWr0dsnqUtSY9pvAyitivgXBlKO3NWgLi0rcmzJIEpaJktbPijWqbxyGogsQrWUUGqbsKewbwY6b0sZNhWQwqjBwq6GA0jnfFqz/P+v6LCLe+Prt5q96uVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3mUmx4q48gCQeadB3laxnRcLGA7j7F6nmcrWXH4hZE=;
 b=I8Cal0oKX7hy2+B5T8AG4I4Jxn14kH7irKR13jN6MiB+TPLuX7ptXeNkF0llc1asXtKtjT5iuckZrosKmvfTCbAPOtEdw2ZOdWPRCEoaKN763O60Uek24ANkWd5kRdJWWxvX48+xwqIl3+xTN1EIMK0YJQ118nhP5Y/ogFsEmXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1e0::6) by AS8PR01MB8196.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:34b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.5; Thu, 31 Jul
 2025 20:28:11 +0000
Received: from DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 ([fe80::22f0:b679:b124:6e81]) by DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 ([fe80::22f0:b679:b124:6e81%4]) with mapi id 15.20.9009.005; Thu, 31 Jul 2025
 20:28:11 +0000
Date: Thu, 31 Jul 2025 22:28:10 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH] tcpdump: Remove patch fuzz from CVE-2024-2397
Message-ID: <129b72ccb76876396959d3024fbe9935f25aa2dc.1753993689.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::15) To DBBPR01MB7723.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1e0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR01MB7723:EE_|AS8PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d035942-d0ef-482a-7b7f-08ddd070c4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lJezTie673JoHulLcKWAcHCrRay/4SgU+6F/oo18+qZ58ixWJi/mkCdz2U0F?=
 =?us-ascii?Q?DfqDozJ3qGMFtPWY0wF1uBYgoEjAr546po4oMDjPP5xgnSQLivGrM9b/ru1H?=
 =?us-ascii?Q?nLvRJKF2k3pn17+jjXy43wYtObyGRAy2y6czm7xFz7chSRl77Ta3snx7eg/b?=
 =?us-ascii?Q?JtLWEmaQtUi+PJ4kwabpHAP4ElAdCaTtE2g1om8fCOLPmrA0vSKD7f//xtyE?=
 =?us-ascii?Q?MBw/+TUKcZkSTyhRp9ydPqS8M9wB0uv4EjUBZGkSCQ4Cz6T/u8ZqKV5WZ8hu?=
 =?us-ascii?Q?CBi8dyfHY8Oxo/0e2oibaYYCshTrED+pMFgoi+xcVaC9t+QCmsUATUIvrVHD?=
 =?us-ascii?Q?/kgNfpGUpDyHd0YeGS+aKWmp6tG/LCse65QPJ1SZZjljWymDLCGNWx3li7gV?=
 =?us-ascii?Q?Gaczo4DqN1+5EI2eIFb0uqgKYclxfyZen5e+v4F5nD54YGuizIEGKsbBWT7J?=
 =?us-ascii?Q?h407wZmXHQ2TMm9kY0p+wvl3tcyWJLifRr+u7lEdeGFF0U7DLeG65iRAfkI/?=
 =?us-ascii?Q?h/dX4JIlIBC6khKKf3wC3UNPirHs3LFGZQ91G+R7QfvmBatAEos+Z3BOpCpx?=
 =?us-ascii?Q?EOYSZjhmJSNYDzZPDOAB9rRY7X/Y44Ro/8Ce4BwLrV7WHk+18kYWhCKH8s1J?=
 =?us-ascii?Q?tVpKsd8VkcLUHg+f/qgGDYZRcfK6/p9+ZtFapJgubgYKyKugtrKnV7PLtmT2?=
 =?us-ascii?Q?4h9FV3nbbLzOx+gfgT+gD5vYflFBgmOFgo8E1U2nzXxeI+biy9x6DguCdlqO?=
 =?us-ascii?Q?asefRspI9js3lx8zr//WD445AorVZ21kdZJV4MmnnZO41Ia0vDIBVsWF0KmX?=
 =?us-ascii?Q?l56gruSNiPUydrEafENtQZY3OgGAFgV2AdqNs3SbrCoNCTeKTxhs+866jVmq?=
 =?us-ascii?Q?HQ7BrnZGDyw8nM7iwjrzvdVRqmh+5PYij1uMbGKVuWrGZWvdDGtWGhiQlEkr?=
 =?us-ascii?Q?3IeFL+q5kz6ugzR4v8TpJt0DyxIzbOiqsNovefr2aAOG1xM4U6icuYengYq7?=
 =?us-ascii?Q?8IAY++h8mUzghohEt+GwRN0OvPq6qowlmy0TNfr1UCV6XNEmRQqUnMlcNyy2?=
 =?us-ascii?Q?JHnWXEgtAv2mpsuooiuFmVodJmYcagUysFABNNHLsY03f9ztd4ovzzYx3VBh?=
 =?us-ascii?Q?kDixBEI6nXin1VSkiZyI97pjG6MfDQyaHxmbp9/rPWIJ7RltAhonS2kLOT5U?=
 =?us-ascii?Q?3MityIwrQeFeUeHWQDQn7/rPvTc6nrSc+10xmYxGBIIoj+l53C/qvMWZUsVv?=
 =?us-ascii?Q?Hf1YFxvoPTbTg5+b8t6YQggahy4JtQCjTM1EgZK1YfDdKJ0jiVfHaZxCYoGM?=
 =?us-ascii?Q?1aut9GhQgS29sN6C9MQAjcrfmK7rxryo5nxjmBHAIJqy4aRfXiEn5L4srgos?=
 =?us-ascii?Q?Vumk41FB0Quu+x0Iu5g7BI8YXMg9yJSJ9GF4rPI3lBJ6PO6Q9clbl/oA0U85?=
 =?us-ascii?Q?1u0dhm8Xfec=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR01MB7723.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7BmXmXcUHkgGCXNzS8M7Q9Dm/xXUTMdZRaWyWHSpYR1rN6FkRX7Bngjz3kmD?=
 =?us-ascii?Q?Il27LSyoWai/SxOnqkWdmIh5ljCeeGqV7kMgP7dkarp/0Zb9X3ULCEcJjlT7?=
 =?us-ascii?Q?QfyaCd6X/4/dA4I6J14psScW7L9fpgvatshktneOGdmtUgq9nvLfoijf2wQ7?=
 =?us-ascii?Q?HCt4J09efbRNAU/Q14+Bt1FFaYq7XZbQAzt9gtjyKWl7bkuwxUoEROyPHka2?=
 =?us-ascii?Q?2eHk6V7qHeNFznU8so0Vf0mh3n/sC+KBjRdOjS7bzigzzIBV0vvqo1+6EeBK?=
 =?us-ascii?Q?RrjOyVOgBAMXjWiJHisH8NT3Cj56wsf6dZpUT+HAXxYaLXv7GjoCX00DlRQa?=
 =?us-ascii?Q?99e9A9EcfGGzm+1DYB34D49pImQ7J4dgE76drN/iI9WpOP2XE8YsGM+CBMST?=
 =?us-ascii?Q?SchHHRIpbUac2g2YJpAb12fMwOLOic2jqYWscLK46wKnJhylcTN6kRyQ8Peo?=
 =?us-ascii?Q?faptklpHE5PODdntPBvKFnycfOnzkqJlIt0Cr5yEyuGzHv4xFqoOUQezqzWo?=
 =?us-ascii?Q?7oMLtWzuUP/VK/MaRRrFZ5RtMxvZlVNS/ObBl8wwwzURQTQArO7Zk3sFYR/+?=
 =?us-ascii?Q?WRhzvOdV7ocIm7HN4QHimaFOrWrmPOV/GbDd7EaoPU6Noj/MMbw76+hwWil3?=
 =?us-ascii?Q?25uahv8eLeWld+zOsKwH6tCc0MAZ70e1HiI4Q01xLjyk6ENRVALiIRTFPEG9?=
 =?us-ascii?Q?zPLprG024ukOmIT7OxzK2xsW5iBvehBaHOwSRCUh5Yee2lDCB1kCjX4yYjBl?=
 =?us-ascii?Q?oqKh5PnLxN2/uJB+tse7OT+n/uNL0nca8ABnfcUMhDyqXPFtddEXKCcwZvQD?=
 =?us-ascii?Q?1btd74mHg6/rCEXl9ZtojjTBj2UgE4eZo0j3rSxzUTmQZp8RKatY0QvIOf3x?=
 =?us-ascii?Q?gYGj+4TDyi2bqtLGo4yVOfUUj9KIEcBfOI8yYgEeCGAbXq+DYyDV58e43Zdl?=
 =?us-ascii?Q?GKowohk7TKMf36sUKRIK5b+w/Dvn9Zl580xr6okH46oyygqF7CfJBGiFfpjD?=
 =?us-ascii?Q?FDMajlzI6tH6TF6NuMxsotd5edZXeYAo4FmUh079plmZoNRyI7Ye1OjpgAZ2?=
 =?us-ascii?Q?u4Fng9D93xRYcmpVqM7FKSTNTqPX7QLBz+ghZYL/0yF1YIVlLuSutYabbfYQ?=
 =?us-ascii?Q?4BH2tVJjP+we6K+OwsIb5JaGw9QuNYt2maOINpc5+DZYQH9Sz7U11krF5bxT?=
 =?us-ascii?Q?f+WdHfwuZhKeTYmEpvsZ8II89q+aApzJxGCdqtelM1bfXzfkdyyUXAOi7oeV?=
 =?us-ascii?Q?JJ+3DA41q4ObHjsCfI19GEDQS/9XmRQdHIsoGkgD1vVXcdgU718FdXaSaZZ9?=
 =?us-ascii?Q?MdkaTI5HzJiazgChegUKZa7rnwZst6MQMQY5fyvg5mjxK2hUt+gYFAoefXtA?=
 =?us-ascii?Q?osjKCcAwPhRf2678KlcJer+H7ihW8abLU4XUPjkSzlpBb4C8/lS5FE/fTcm6?=
 =?us-ascii?Q?1ggEriWRYUyVdU6nsfBDuavJUSE9nWpSHH8ueXnQHQBmYVEBI3hWR1YePQn7?=
 =?us-ascii?Q?jAf4AjIn9EATJZskFS9ZS3RyFJmbNxHzTjeRAJCllvsC2WVFMXWJFdzreoVi?=
 =?us-ascii?Q?RoBBmDhoJ4/Q9h76YUU2Hems+lozb8Dfng9zXn8Hv1u6COO0FOYNaCKfHfNl?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d035942-d0ef-482a-7b7f-08ddd070c4ce
X-MS-Exchange-CrossTenant-AuthSource: DBBPR01MB7723.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 20:28:11.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8YBLmYjpX6T0vhwidZO2otNj74YeecxGru2a+HRUhFUF66ypbc+SeoPzX2Remqfy9SzxXNcMXYH6H6FQfAK2+e9jzvEb1LciDdBNvNUkvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8196
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 20:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118818

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Applying patch CVE-2024-2397.patch
patching file print-ppp.c
Hunk #1 succeeded at 42 with fuzz 2 (offset 5 lines).
Hunk #2 succeeded at 1365 (offset 5 lines).
Hunk #3 succeeded at 1372 (offset 5 lines).
Hunk #4 succeeded at 1397 (offset 5 lines).
Hunk #5 succeeded at 1447 (offset 5 lines).

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch            | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.=
patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
index 169ec6be70..142b059ea5 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
@@ -33,16 +33,16 @@ diff --git a/print-ppp.c b/print-ppp.c
 index 2cf06c363..9aed23eb9 100644
 --- a/print-ppp.c
 +++ b/print-ppp.c
-@@ -37,6 +37,8 @@
-=20
- #include "netdissect-stdinc.h"
+@@ -42,6 +42,8 @@
+ #include <net/if_ppp.h>
+ #endif
 =20
 +#include <stdlib.h>
 +
  #include "netdissect.h"
  #include "extract.h"
  #include "addrtoname.h"
-@@ -1358,7 +1360,6 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
  	u_char *b, *t, c;
  	const u_char *s;
  	u_int i, proto;
@@ -50,7 +50,7 @@ index 2cf06c363..9aed23eb9 100644
 =20
  	if (caplen =3D=3D 0)
  		return;
-@@ -1366,9 +1367,11 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
          if (length =3D=3D 0)
                  return;
 =20
@@ -65,7 +65,7 @@ index 2cf06c363..9aed23eb9 100644
 =20
  	/*
  	 * Unescape all the data into a temporary, private, buffer.
-@@ -1389,13 +1392,15 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
  	}
 =20
  	/*
@@ -87,7 +87,7 @@ index 2cf06c363..9aed23eb9 100644
  	length =3D ND_BYTES_AVAILABLE_AFTER(b);
 =20
          /* now lets guess about the payload codepoint format */
-@@ -1437,13 +1442,11 @@ ppp_hdlc(netdissect_options *ndo,
+@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
          }
 =20
  cleanup:
--=20
2.50.0


