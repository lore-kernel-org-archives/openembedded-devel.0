Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA907C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 07:46:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.105])
 by mx.groups.io with SMTP id smtpd.web11.13399.1724139970739074512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 00:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=sBfz81h6;
 spf=pass (domain: navimatix.de, ip: 52.101.70.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4dUlnhyq7+liOZkmmgb/3wWBJdTpWVeudgs6A/Yfx9s7o4gDRleoF4Vwi1hsjZ33EUw1Z9N9rP1fUrh/Abx7pU5SDTGMFhNMaxIgi9lQOVgPMd4oIGwKyV3yZS/L4FpMkX8hDTOX1aB64jOBWyxISlbb530Nb+F4NGeZqtgFQWxNv6zaQv/3EDd2M1QPJlxp+au2NAjB8FQXrSzlIjNRxXvuRii5y3GJH4LVabNkDRy7t8AC/O8dXH6W0+C7Z6zYHMvKijA+LQH2LX+sv+crEoq5d8vszeGKHxJAJyOOyftNT+m5dG/pFc3K7fPx7JTJvoMnFHIMd5VUjSnufyjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNe/DK2jNwirsxU/72th43ac+6zk7i/EiaE6sbtUNBk=;
 b=lpN0wF2agaYGiRkd4ipgOr6YPOLp4eBs3BQ7WAlt1B8GP9E/jXhzShqXOrarl3IwuIE1HqhAn86HM/25abLGgC4d2pelbdY+RdVH/nT3JwLgiNaSkS4XQXf0850bn1icD+fqPIPoF/LMlOHMFXDgoFMPCABnCj2ZHcaBcbR8YTnJpZNd479RDrUHCNy3efGKbXnScxHV9L0O+yPgf+PbpoOHstWYtOqwG7kAn7mo/HLkVhvyCsldD7k82yCl1vhh9ZJGYD+8AwhNzcMgt1d2ZTNle14cjxeLAdddVCcNzlp3K3x57+5ok2VEPH/NaqmL6oQ5QaHYR4SbIQBTesV6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNe/DK2jNwirsxU/72th43ac+6zk7i/EiaE6sbtUNBk=;
 b=sBfz81h6CO0BsIf5lFAzpWkz8kmnwkplp1hqJUC3SmUEdmsa2cm/Q03o0oPqg5NomBgQwyXcY+ue4IMkOM7wBfFE1LdXaf1Gzo0qRtoCX1tNzG2eYXA+a89Sj0Ss4Vq1CD/tGBKZQDuM6jmqAQoPtMJ/l0i5B5DuSJ1LHwyQ3BQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DBAPR01MB6710.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:188::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 07:46:06 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Tue, 20 Aug 2024
 07:46:06 +0000
Date: Tue, 20 Aug 2024 09:46:04 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] gpsd: upgrade 3.24 -> 3.25; new gpsd-snmp
Message-ID: <97f4ddbad67c532f329c8b2368e1c150cf97d593.1724139964.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::24) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DBAPR01MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc928e4-a4e9-41f6-200d-08dcc0ec25cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S7tw68HcJgEoKvB0YNtpNInHGfKO27IhPZyRLD7CWHX7RpDb/c5eofDFgLY3?=
 =?us-ascii?Q?CzGnmL4wOa9aXYorQnDb4j+e6RSfBRSMnlamf7JNFg+9uxKVOaaGVJIg8P29?=
 =?us-ascii?Q?05KtDrNOR6ot1nsGxnMMXMZqb0p6yM8nkQ/BSfv7aLjivd8Jeo+Q8QxDKICY?=
 =?us-ascii?Q?WD+6zYbDkjgBLP3gSHcNzX63/9EsdIHuIAY8iLuZVBpuxWZIIKE8YqDIePax?=
 =?us-ascii?Q?aNISJNH9dHHRZ6G8AvA/k0uinyaQ0qjkPlqa3UWtpXFUw3b/pfE8YvsJoCVn?=
 =?us-ascii?Q?W4PZD/VZCAIRbj2E/2ajImSO3oQL20yEtMwW6gG/AqarGpb0xdbODLXWCB8P?=
 =?us-ascii?Q?gARcir0lczT3OqFnFjHz+qApUDX0TodGeziDM94EbA9rpP97HtYI+buwbkst?=
 =?us-ascii?Q?eBIRddWPY8+R/gN30byYjpuyZ4bH2EV6Min/Oce84JVEIMcPVDfnlxEZ/Afh?=
 =?us-ascii?Q?qOVGjx+5sQfLf6HZyGjBJhEjkJ6T2hMRHR3MJDnMPLYyKaft5ZvdbASDKI8G?=
 =?us-ascii?Q?bEUQJ1rK4B3XiKIPRhTSUmWs3K2c/vPaiIe1mmsQ3lIH0w6C0lc1N0wsxf8U?=
 =?us-ascii?Q?ori1YI1V1zfL38+qSre8tTzb81akYb4zkxbmY9Y+bhGX0z8Jy0PE9nIgzWQs?=
 =?us-ascii?Q?8DwWCVpraMuUhAyYh9HcqPbHNbHq3r6Ktk7NQbJGfu7YAdYjv1qYEub4OrPc?=
 =?us-ascii?Q?fr71zr1c4tIBnjkOL7zlLKKRQh9+D/Amb+po0Eu+y7lDOERsGVGa/fbq0ZE8?=
 =?us-ascii?Q?PpNAxGk6vpmFpdjMre0W1Hn+djTSQ9oSlwE/iEyA1nP0vVX6QlNg117VmM+d?=
 =?us-ascii?Q?fCfFV6u1UXLCXcsCJeSrPsQ4Jf06/sjxJOyBYn1rFlebsaM0Fg6bkJWTNRR5?=
 =?us-ascii?Q?ZrWs33uIvESM7d2XahIEW8dGfOlTMcMchLdx1OopbbCFhr+NCKj54tUBX0OV?=
 =?us-ascii?Q?YxdxknJYiOa05mFiFIPIL1XWwb9ybYARce2fSK6BUmHCDI2Wt+6WOMD79Exh?=
 =?us-ascii?Q?GjvFsrV9yNUNeGdmdRN6kEa19DUt3u22/1zMuAbHgXP7Ob+tvAnbhEUmIXI1?=
 =?us-ascii?Q?0B88JHoxOvAn5cYm505KKqlB9zeOcKa8eE8u5qLunNPln3hqDpGaldsIHvcU?=
 =?us-ascii?Q?DOdfcKYhYp1MndQEzJ8EBZHHf5gmsSh/sR2euFQK1pjVoJwYMC/r7h6W8kue?=
 =?us-ascii?Q?RerMEGhLAWadTNk7xz7tbgQ1g1j/68ANjqoSbI0GE0PtaZI8sRT4AYYsbjC3?=
 =?us-ascii?Q?MWrTreTr5SmeAh7pavMhch8qyzVHaaiYBraWUZNVRK1cBT+GHmhZ4o2AI7tD?=
 =?us-ascii?Q?Jz9zxeWzg4AU26yOPUrKvkjxHjR4cTWBZGI+LJaXkS4z/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g5r2JpUFnbn+8nKiKIQFfoB1x223MnweBq3k1IgjVQ4u37b7s2kDi25E3+Yr?=
 =?us-ascii?Q?XH3KubndXyalQcoOrjOiOwue0nCo40cVpH73zZsnyG7/kGSmn0XsY9JjYYko?=
 =?us-ascii?Q?EeNhCIr8X+9RSvrH1iTx0nyWqjP6A6YCXngEb9+Ls9wk7rJZCF0X9LEFSSjU?=
 =?us-ascii?Q?OBgGnrWaLhQk9tyBCojlrexdZf2qLmuFWEFd138ssiDpOWeOmDeo6cme9amg?=
 =?us-ascii?Q?EYbMD0aRzHR4ym+jbJiXwp8BDI1rkWmCUT6Mn5frvgnHPYP1Y16y9YNQ3Ia2?=
 =?us-ascii?Q?CXd0/vre1UaBP348g8qN8/7YAz1cboy4mLQ7w98tfjXgwzH+Qo5+0WaF//xR?=
 =?us-ascii?Q?kGRA8skNPVbDFjcAVOOEgt1XZK0TumtQUq5juIYbzwa56At/12CC+yLjLbNA?=
 =?us-ascii?Q?XX2mwl5SN0Z0PYhoHBiggRIbJBrDZd+17PupYZfeIKlpVwOhdRzShsnRpxVH?=
 =?us-ascii?Q?7+HSsSiyFO+mGbahCcI79Q3O/mwj8u3JcMBZNFYy9nvCMWvejE4XSnbU8gwg?=
 =?us-ascii?Q?/3LJ5ezOeKUs9lhuebM5FNdITVzW7P6VU2+RvXwyjciWjOV9o4W+lS87AVJD?=
 =?us-ascii?Q?LPAUztE//gh9eQumNnFsTf7SsEOQrb4sodpgYJxZ7F9MKp+WShPyJrtzWoF4?=
 =?us-ascii?Q?dbutXAaddoeltT5UUQZIe7UHJ/ht5UfSQsl3v26ijzXI3Vjoy0h3mtvvXWOC?=
 =?us-ascii?Q?DVQxgwzTlIB3J6D08xV4bmk6L37UrHHlsnvGZzvn0xMXkw4azQD1OTjivi7F?=
 =?us-ascii?Q?L7F5AideSXdgymDHb252HZuuS9CMeK8qPAXgmRAAqBeYEM5uURUXlImLytJc?=
 =?us-ascii?Q?FhoHCtQdFYJrDTO3tePEUD1GkPcBrU9h4peKr7meM6V8igF1jhrpmCjNHgmA?=
 =?us-ascii?Q?x92LqmyqXtQN15ITKEE6Xgnw+QPg74xiQpN6YO2SpXYP/Pu7uEAJbOR1o1uu?=
 =?us-ascii?Q?4T6xbqqbnVShbcJkUSPsIeJJTdWvGpsFaOJ/YoFE8rtjQAU0c0/Qtbr++5vA?=
 =?us-ascii?Q?0YtD7kqHCadKENBL5X6obgVC1BO77tp3VrIxZBy7sijPKZpgNh2iJ7wwPk3h?=
 =?us-ascii?Q?Q4lM3Td4EJT7TVBAUV4RTYhHN7aviMHdiXcvtyMCragMg17zLUWbM1RCbZ/2?=
 =?us-ascii?Q?r9h4qRRjCaf8Xtu3equCTdNCEtU2S4IaXen/O9/XzypofP9+eXYPGw4VHoBC?=
 =?us-ascii?Q?Rsc/uowfKOyTSj7jfQFBl3yUJ6cTKLpqcfmZ4HX1S37tluBi+J1LLub0ATl4?=
 =?us-ascii?Q?UjGMQHI28nmkT9vqBHEEDKt/C3cqdMLu511h6vEREB7BnboB5snMDLaRqOrD?=
 =?us-ascii?Q?Dhf8g+ZxhXrKrAWq9faTzA6ZwtCtlmlMWBDVEtFpGzdR5lfSn6Hs2x13r9F7?=
 =?us-ascii?Q?c1Xors+QN2DgRH8GaOmJGzE99XilHRT1Kb1sEy9vdYyz7fL2fScDwFmmxKDm?=
 =?us-ascii?Q?S4Pf4VoZaLDB35TkviYoAMK4xWUdnpDtQaffqWvaNZ4xM8iLNgpmSQYa38+e?=
 =?us-ascii?Q?Qiw6/qbtDIdfibsntb8xt7HylSDiFfGzUud/Y0vXb7bag6B9Cd6QXMB/WARr?=
 =?us-ascii?Q?/o61YMm3f0ouoRE2wE31JQko9RagTrp6ETxcCm073J4Syz43iz8W/iQijYlm?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc928e4-a4e9-41f6-200d-08dcc0ec25cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 07:46:05.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKdbETIbrOuQSFQSIwpewMQVJRQJ6o89VLDQ/06YNsy47Ua3HQ8ZuroGJfyC3b/Mk8AsIVo9L9KvdzXCQdQnODwg0Vx1GXNQfpyoJ4oi0QE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6710
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 07:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111865

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

This new version installs /usr/share/snmp/mibs/gpsd/GPSD-MIB which is
packaged in a new package gpsd-snmp.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-navigation/gpsd/{gpsd_3.24.bb =3D> gpsd_3.25.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.24.bb =3D> gpsd_3.25.bb} (9=
6%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb b/meta-oe/recipes=
-navigation/gpsd/gpsd_3.25.bb
similarity index 96%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index ddea8ad2e..3d817172e 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -8,7 +8,7 @@ PROVIDES =3D "virtual/gpsd"
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] =3D "00ee13f615655284874a661be13553abe66128e6deb5cd648a=
f9bc0cb345fe5c"
+SRC_URI[sha256sum] =3D "b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf798=
7a73c7b4a9afc2"
=20
 inherit scons update-rc.d python3-dir python3native systemd update-alterna=
tives pkgconfig
=20
@@ -79,7 +79,7 @@ do_install:append() {
     fi
 }
=20
-PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-ut=
ils gps-utils-python"
+PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gpsd-s=
nmp gps-utils gps-utils-python"
=20
 RPROVIDES:${PN}-dbg +=3D "python-pygps-dbg"
=20
@@ -104,6 +104,9 @@ CONFFILES:gpsd-conf =3D "${sysconfdir}/default/gpsd.def=
ault"
 SUMMARY:gpsd-gpsctl =3D "Tool for tweaking GPS modes"
 FILES:gpsd-gpsctl =3D "${bindir}/gpsctl"
=20
+SUMMARY:gpsd-snmp =3D "MIB for using SNMP with gpsd"
+FILES:gpsd-snmp =3D "${datadir}/snmp"
+
 SUMMARY:gps-utils =3D "Utils used for simulating, monitoring,... a GPS"
 FILES:gps-utils =3D "\
     ${bindir}/cgps         \
--=20
2.34.1


