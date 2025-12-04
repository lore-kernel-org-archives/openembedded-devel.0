Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80BBD2CDE3
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 05:08:42 +0000 (UTC)
Received: from ZR1P278CU001.outbound.protection.outlook.com (ZR1P278CU001.outbound.protection.outlook.com [40.107.168.136])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54299.1764881399806043755
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 12:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=JytRhlUU;
 spf=pass (domain: spinetix.com, ip: 40.107.168.136, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ythg9xVtyqddIDHD2U87fLiqPNFANMvO2H8kf6zhpy/q84YOkrBvGbedot20969VnXYnIwrdsdp57QFMtoZhfEeI3EfvkvsmmoNnLSWSTSY1HpcMuAuhgiDMqNIpnROWE7ZOU21bk6nheP0A7E4qU9gtKHv76wU4cyzEOElKUZLA1a4+fI4q99jPeGqNy5qvsKeiphOUoijzIjyXgmPpKkusudVt57C0g44f70VUEARzCFJ5LL7aWrr88ZKimf3SpJwIfWoWJH4PihF3XV54jvG3Up6PUrf0NATLeS78tWjjnzG587Qf2luPGtQIXAL/Gn+X8PvGlW3vM3ev2Amh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PlLDzKOXjyp0SnNRV/yHAyhRGLJaHnmWGXbI/u/R+U=;
 b=ELzUmEQfFX0CH8Psz1R3Yo0ahbuoOd4uWH79oVpQRq8ZLPQZK/xiTHNb+pZhhdNEz04EL9p7QvvL2k49jgQXuoEsYUdUE8/QmSEEPBjRsCmTeHAAwrjpqWjpCwUUR6EGjmEoop/5biuuCiUVXJOlvbjtofgEMQTJp0hfSPi+mZ2QZ2YxJtdUpPALpBVw3zzD3IR8XdcQIlWiD+VE1KWFTt9G/Ldxv7H4EjQP071t9SSd5NeD2g5On05uNNaOUwr2Uej3cP1AabfgiGsnhtPNvTb7yL/I4hMNgE7UniblR3ZkPxdZMcPqFDDyw1Hw0A1hgol/AHaZFyIA57K4/3DhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PlLDzKOXjyp0SnNRV/yHAyhRGLJaHnmWGXbI/u/R+U=;
 b=JytRhlUUvfuSsOLeyas+RKM5T6xKfzOc96HcuMOVsWt4RKgMxSB3fnOxubxUvXc7brscypotGDfOPJL48t0h3r+ewjVKwI628+25f5tVbkC+n/a8ei3ludHEPA0uLSDNk5QjbnE3U/WgZL06S36h3JypciD0uGCEAEHV20v9jCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZRZP278MB1924.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 20:49:54 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8%7]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 20:49:54 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Valeria <valeria.petrov@spinetix.com>
Subject: [meta-oe][master][scarthgap][kirkstone][PATCH] apache2: upgrade 2.4.65 -> 2.4.66
Date: Thu,  4 Dec 2025 21:49:11 +0100
Message-ID: <20251204204911.198119-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR0P278CA0098.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::13) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZRZP278MB1924:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3e5607-c0dc-4dc6-af94-08de3376ad0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kv8j5vmnGRMxQjvK78OKcNergbmtPj/SrjkcxE0i65T7ZgAvbO9JfpjAb07J?=
 =?us-ascii?Q?FnoLS8C4bgmWNnThjDG1Xd4RVVfpgS6+xy1p/jX658m8fV/Vo8gnQvr3gHtI?=
 =?us-ascii?Q?RBSpvDoBMimveLnVeFTs5+5Ufr8QxTlqzm/MNb7CXtj4r+JZg/q30004lqN7?=
 =?us-ascii?Q?INJfB2gT/EeHxZeFACOWZjulutMIJT5TaQ5/og5n/IEo7pRyd3xzjy/QhD7W?=
 =?us-ascii?Q?t17lMAmy4OofDmgLmvV2MA1HST2dUBQpTzv0yrHbuE5hdloRWf0uI4r1r6mf?=
 =?us-ascii?Q?UBic8atCy051hv210Rc87/1thfh/tFuViMvWjV3v357WOyhzzjAPEB9s2OlN?=
 =?us-ascii?Q?oK1VoCkVWGo1vrNTmJri7JcL6GfbCvNcmdOqngQWMI1s+WiGwuEYdJgBohnh?=
 =?us-ascii?Q?7b79IUjUfp7VoRd1cQfK/98TJ0SvsG1V9WvSCjjR/IcgEis5wUFAmPUc4sMy?=
 =?us-ascii?Q?gcHaIN2QbosjG0pn8fx+DzF84xCv+/iyt0XMX5m9h8NrfgDLN3SJ6G/8DROz?=
 =?us-ascii?Q?0+6doeMFEgM5sI8YFDI7Ysv0AV9gZ2Z5fur6WgzO8dYW1G66fpNoQsLS8rgK?=
 =?us-ascii?Q?vJDguH0253BTpWb2eTdH8CMaEb447NEWRiDzazyiqvB2iELjBGCjw7xNMA72?=
 =?us-ascii?Q?1gL4Nw/VX+xU9z7Qs1SpZ/PGaWccCMqwk1VMDogCF0n125bvJoc2pvoEMmD7?=
 =?us-ascii?Q?uJtXqHl8XThG5xA+mV5VkgRgHof6FeDLrLxpMiy58tAsXzr9JGAS2+IslPc+?=
 =?us-ascii?Q?dojr/N5NDvAxx36/F71TqC+Ncu6Fi4jEcaF/MawhxeOkEm5ofA5ZMLu8CWcX?=
 =?us-ascii?Q?ASO695b6AayNCyrflowfhqCaB0vNiIlwIaNo6hBrHFrsyWV2mYwkSQjjWnhE?=
 =?us-ascii?Q?us0L1KdguDvK5RDL89n8mBL4YfiYsDkFLD+lVaFkbWPiWmE6ZR79yQ80uH59?=
 =?us-ascii?Q?3sedusQHHi8vc6hg5OAbAfGF89zjd3ZaURcH+cC0ZLs6c/I9gKFEIARpfE44?=
 =?us-ascii?Q?rY1NWREL9HtSWI0TqLFRXH1h5QfUHxoYXNLnbcR8uIh10l9S9S/OfDW35tCX?=
 =?us-ascii?Q?i+xq197RXskB3oxFA5RICT0PefvvpyZwi5UEmRyd4Z7ZI16uXyO10LQ+Zdxv?=
 =?us-ascii?Q?pn48yogYP5fPjmvwF+Dd20vz7Bpz1j31eWr9YuHUqga0LZtBcsuJazmnr+hN?=
 =?us-ascii?Q?m8AzITtbE1w1jAE5Gp4+RWcdwqeNnU5nIjCn9zfvdu+WMRTyv6nE8mWRu7+B?=
 =?us-ascii?Q?mYP2uJW0pv7Z2cfvEzMexk/SSaoIrYbmKymZZFA2xVoAgMuIspdJL2wNY8zd?=
 =?us-ascii?Q?jxr07/joVN5+MmvYkwvTVzi+H3/AwrHk3WGIhVFpvdn+4WFT1LanGiLMlha9?=
 =?us-ascii?Q?XpOI/AUde0HVxQVT3pPPgsQj57PKu/tcxE32JdD9kk0tiIkYrfGfulS4rqJp?=
 =?us-ascii?Q?oCiYaiWYYZIOWmrc3de0APCnaS/nZmPEldiZisvcb2BOVTxeWeg/AMIdwBEk?=
 =?us-ascii?Q?9V1o6GsbptSrfv6Xh1IbYtgpt81OFH1wvikD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v/C391lptlw+i7bW9ethemegA/tZ/+ZBsojjC/3caFmGXUaU9K3KmZJ9eVhY?=
 =?us-ascii?Q?xzBFH0EOGbJNFHAQ+nDrXpSDiqu4g6Ukv0bry6lgwK9i+Js9jgLdm2ZS0VH1?=
 =?us-ascii?Q?dTMFS91+6t3bWtpj5QcaZKDmUtFrxE2s+wJemeGhwMeYrtW5bsMyvj1Vm/4P?=
 =?us-ascii?Q?5EgO9o46vse8KO+22oakBhtUqdJvU+xrBYYuHLgEKNcdCAnKZ4lj6l3YSKhI?=
 =?us-ascii?Q?vLQklYzSZ7FDovzd8eKHjVLqHFqlT9LPlFuT0CCcJfsHTaH2FnGC0Yh3fR9t?=
 =?us-ascii?Q?0j2sK6zOhmMrphfX1yyAQeg47QH+bYBdB2REjocQxZc3QQVNk/hy/bk5FEba?=
 =?us-ascii?Q?h+TosTqrOYhxlQZPN9iQfuihgB/bPjTb6aMPgNA1koORadxVnhRASbuBtuMA?=
 =?us-ascii?Q?W0k8F4KIE1emGMgvZJSe5C6QoAIZdYEaczAJa8155bpei9GMl3PtoQ9urLRk?=
 =?us-ascii?Q?MhkyWzF/YZWzmyyQL5j8Uz7M6chaUoJ2AvjqA4g9q3nvbL+woMY0YV3MqJ2n?=
 =?us-ascii?Q?M7+mRf1apex96x9MBBSTGh83IUXesKXdFwRwVcpW4YY0nHdz4k85paL7omae?=
 =?us-ascii?Q?QXMWDerM7iFEQPy+GR2PHAF+BMKp5601XMmcPztwzLuoIotWQJuuLVkI5hzD?=
 =?us-ascii?Q?yPvNAbXtwSrwU5y1D57A3V3+7A8JA+OOUe0I00IQ1jLEIa+y7332KdsVLlVD?=
 =?us-ascii?Q?JMWgJI2yRDnDTAVjQ0flSaxcG8ytNvtusHXjaJcgq4p9IFpkG9re4ct+3WJO?=
 =?us-ascii?Q?61foQIfsnweLgzF6lGCbzVDwpdLnFOrUOOfWawSOpICBGWhG+dn9/TteiEix?=
 =?us-ascii?Q?Lrz0yITxWMhZ5+X8e6PQXOymYURJ4mZQNACeKqZg40oYX6ACr8qACF5jyrjO?=
 =?us-ascii?Q?3KMuFzdepRE7nxIejVHF+srTTVj7ZopYTZunjclsha93kY2dEUziCEl9+XyC?=
 =?us-ascii?Q?USLONj+hJPAMeXRkcdSQmRIU5vk9ofQT5Juyz9w6f3XQN7dr6xT78hOxGJbj?=
 =?us-ascii?Q?nK/9d2NbIGbvMLOCw7XU+s/4GljngzyLZbsAjBkVA7rZkYBrlk/onehpnlpj?=
 =?us-ascii?Q?snjCcLs78XTS6vK3GJJhG2V29N7K0U9XBXVh06eluaAYbxnWonRaoN4aeyVX?=
 =?us-ascii?Q?n0C9m87ZDx2SlVChInozhivhyC4PyzFX6pzmEn4aSEWuNM6HUChnajED+g8t?=
 =?us-ascii?Q?jZgorP3YI7r+ImBjeKX4O03TbMWENMIna7fUROtPH3U9vYHAEzf4I2v/HmiB?=
 =?us-ascii?Q?bCvFNqlppMeyeELN2sxHdwZUvLJSqaWZ4YRT3LRYUsLklSgd/Ufrdxb3hd82?=
 =?us-ascii?Q?HKETdr3LdP0tp+TpD+968GcszI37bqdg86ZaK13F9qoS46BqgjnyblAzFVnG?=
 =?us-ascii?Q?K0m5wtSMYIdCJjs+6oHRsMPHg4PS2kjgH05gX/cfdfugOibVGoQDwdMaKCv2?=
 =?us-ascii?Q?tFktZEeo3XPK7dHe5kRNlwY59nHl69+sjKqa59v2xA+rM19mSOHuQfvY9tBO?=
 =?us-ascii?Q?qOnK1M4+zcyc8zlZtPp+MLG/8diultbJ+4PsOtap9XQRWlefpXI5r53kD/8p?=
 =?us-ascii?Q?qsVaNUwue1C26YgnHx3Hgr2dOvgg2nT4veVqfN/+s0QbLtGjY1PZWmZxJ/JO?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3e5607-c0dc-4dc6-af94-08de3376ad0f
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 20:49:54.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bokx2xHkyjQJLe5DvM56fsHIFs/CrrAhPh1/3jFdVcz/0JepEcCw8EeWNCywlo4RsH7XvgJkGmepdApwHA0Jm5wi2yBKqhdiEJwIRH8YxY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1924
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 05:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122334

Security fixes:
- CVE-2025-66200
- CVE-2025-65082
- CVE-2025-59775
- CVE-2025-58098
- CVE-2025-55753

See: http://www.apache.org/dist/httpd/CHANGES_2.4.66

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
---
 .../apache2/{apache2_2.4.65.bb =3D> apache2_2.4.66.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb =3D> apache=
2_2.4.66.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.66.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
index 58b324795e..630c6f3b1b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b5341=
48e3296c53b8b3"
+SRC_URI[sha256sum] =3D "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596=
e4116efcfea25a"
=20
 S =3D "${UNPACKDIR}/httpd-${PV}"
=20
--=20
2.25.1


