Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB89CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:56:11 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.78])
 by mx.groups.io with SMTP id smtpd.web10.16462.1761213365873692827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=HpJ1DYUL;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.78, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJqGJuibMgDC9viZWeXIaMyi1Vw3MrEOWa1b/Zytw6R9v69afSwHN3O54eG6I7e7lcL/IHAxrmfcbffDeI4OmXVuIQefAG3QeoxIVwTpAAofPU9h7C/y8Ii0QpKkI3Gz8lSK4gT0CBDAFJahu1Kr23WaRHEmO7izPberI8B4tJY0Pu0XAIwUCbWO0hOcrJNdGuclrUDmkY03mhYDVsx6PfOomC9hAugikfRuwnlqqCpkJQbDn5HQI+OnP3fRcSG5M5U9mN58/kYXMsMZpCptIyH+th9NNNevJ6ljcrWW+oyKA58ng8WJ8v4IGMmW5hXfEG8o+Q7efUhph0QOkIdUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSmVTKReK7tDzIHyUEMYpkkqmGmnpIRFp5Kva9dk0lE=;
 b=UtzRpDq0ceue9ayT9JuzSxl57CmhqXKLW/ZVz838TVJsjwfh1oSZ4zjB7u5NpNg58mySumPwluYWrJXYjYSXpHT5oNCPAW7QjDtAUbUYyltrpMENHhn1ttnt7P0TvqcraLyVdXF8jFOevsnyHAP1JcB211+nghII6qg2uIy5uhlhO+ebxrdJI6T7f4Nv60x+c5cxHuXulSSL260m25dzHo22xtElbC3gyeaC7/SumErWMldJ1YXUot1QrKSmdNeTWEYO/cCfAz98z/5gCljg1b9CVMNqxIILZEdiF3WIHGEtPEz3y6l/LffV4F6MmfjuV1TxKmE3UQIjPdCS1u7N6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSmVTKReK7tDzIHyUEMYpkkqmGmnpIRFp5Kva9dk0lE=;
 b=HpJ1DYULxO62CN2U5Ei9GKIf82YNTJTTVawwOGeBCp4sjN1nhqFUN0tNaKT+9THO/cH5021k5iUsFNyJQeFEhOixonM3KeOrXVi0bWkUVsz8sOrKsriphIH1gQnYi5IBinFF3OZM+hbB+VnhN+WfeMiopqkE6ebo+Hpn1P+x0aWYIbZnYFcpWFzjNn3F1/2+eSVfMe/1evnHL8hR8wKjkJzGMAaFdtlisBrgMuBLHAX5pdaLR/+dmihSn4OaXr6rx7m5/LI7Ie4PKoShD5N9v0I0id+UTe1RO+93oj9gzqQUcavf/oM8Yni01w/sM+jJE3raZ/kurGpb3sYP9MODqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by PN3P287MB1800.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:55:57 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:55:57 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCHv2] cryptsetup: Update the license field
Date: Thu, 23 Oct 2025 15:25:49 +0530
Message-ID: <20251023095549.3125337-1-Sana.Kazi@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::8) To MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:19a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB4602:EE_|PN3P287MB1800:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a9d281-2123-436f-7145-08de121a5cd8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HBzt8egGs9KGOYpqMHNJGHUAdcRMTKa8y6EgyygEeC4jY+fRJpBUAcVr0N9M?=
 =?us-ascii?Q?oXIBxPcOHiEcVMQyFdF/uuNxowZVtx7DumnzdYQktDR9FbLWUGVEjTriVcOM?=
 =?us-ascii?Q?go2zpwF0xWmoOLXPHlvmJlh+9xNPbjXEGxbzDyqAuPm5IIem9mlvlukJHILo?=
 =?us-ascii?Q?OJ8ElloT/LnZPaip2nJoCH8ptEdIpYoJs9FMSfj8hHs4OFDFOUPTBYOsNxzf?=
 =?us-ascii?Q?cmYvnx6uqvDU3PCqcjYBQLbi4hE5fFwW+xoaWOZbJJlxZcctWJMpeIcZW4Eu?=
 =?us-ascii?Q?EmMPhlRsgCwlovRlg+z5G9OsvuqwLjapSbjWnL7H3XQejJRkrYAyfpKnns5i?=
 =?us-ascii?Q?glbFDI8eA485Gm16r5/ID21MsrmRuDEp/sIVp+BsVtk91L3Y1BaQzKNxk3xz?=
 =?us-ascii?Q?ryubosQupSP7RThXKFztXJVAbqpt+luJ9iAggXsMEta3zISEZkA3vNnkPdzJ?=
 =?us-ascii?Q?IBt58Wm8rFLUWAqWv6QD0XHFCqyUncAGqKtunkF56Qjc89GIUollMuD5VWnK?=
 =?us-ascii?Q?qMJ3SPdnnZAVG488uCPNNxcUx4CrsT/Tjei7i7cXSp6oVmhcoks8qNKu8yb5?=
 =?us-ascii?Q?d/3fD429Gi2PEZe5UOkIuiUWXAWsBGnxIvO7OdQjElhRUk9GeLq0vfNm0NlG?=
 =?us-ascii?Q?5Y6OtQMtGH14U5kj/cteFmhsCW613tqUPHFkgNhzms6y6pkbZc5jaDvO2Ja/?=
 =?us-ascii?Q?w/LTuEorv9goOanPMjU7W2UzCb72KlW6lEiOGhPKX6dtnofFWUEmCkeuYPYP?=
 =?us-ascii?Q?hJ2UmKUR42DhyoznYxa/ACNpvjGRbIwR+VOeEdrdtQ/maVJ2TjDb6D04KYyi?=
 =?us-ascii?Q?nkBD2Uogqq5wt3TXeNzZruEilRmqjixSD+lUMHIMgNyWOa/z6VkQcvfsH0b4?=
 =?us-ascii?Q?Bn7TyHIN8Dcnrxnu1w86+uhTDk1ZgeW2fMVGACJcOEEIZL/3bDfy2WFHjDD2?=
 =?us-ascii?Q?J1E9mrd+Ey+arMy/WTJnlumhOxrAL7+Szj7N2OSJ8H1zlhoDdBH98Wy3aTVX?=
 =?us-ascii?Q?pLrrW00+iTrXNXqCPHFj5vPdlRWXbPjVkvG3PBKt0ACd6DcHIfnv6WqjqeSW?=
 =?us-ascii?Q?83Eb9t//clYTQdk8dONMzm+zdbN+AOev97EYo//kiwEpi50ZlKESj/M+9u/n?=
 =?us-ascii?Q?LtMly/0I5THxk9L7CFDKezcImlqA+4CPZiPF0pA5UAl08BEUd5ozoSEi1o2B?=
 =?us-ascii?Q?gzldDCIbWP40VMFcVHJqvpyy32QUx8T47PwM++0vSrOwzelsxdG1joEVZKz3?=
 =?us-ascii?Q?k1lgI6pxqPON1DOu0/KbMptQ5Y6cl79dAZXEAurD/J3QqFVpIa4ZRxUhV74w?=
 =?us-ascii?Q?XlH/ZN8NWZ3axLB8vTQBQEC2vmLCtCG7+Pavi/Ae9TeHYz90a1wlk/6XzEAD?=
 =?us-ascii?Q?exsH66jOzHNiR0Rif3J0WaNeLgvUZhUTr+D9zYQpaBIKhXtLeaSBVOedBOqa?=
 =?us-ascii?Q?DD93FmeUqVP9V3bS/wqds5nKL0NTwARC0oQBh+H01E63ylAYfDW4URtck7tR?=
 =?us-ascii?Q?n+zZXd2h7U/FUJiJnNJXRIW724GyMhVqQLjP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dbBCDGrMW8qHpOujq/XEqwupZT+QMb5iyYhpHmltUNJG9L01kiIaFbyhGreS?=
 =?us-ascii?Q?fjAfzr19kYC2esDwYbtXvaDOGN0bY/P0wvnbhXpgzt5rx/FUZzQC8KEZp/75?=
 =?us-ascii?Q?prZqDhgEFZK5yODR139rFTqDjOLvZ7ogIgrKIac/jZ/2L9Me0mSxGlW96Ej7?=
 =?us-ascii?Q?AUSqAgU5H4YqYz4yJkd3lNUgawGHS9QDpM2b32d5/NKsZJSe2cI74sYfmPvs?=
 =?us-ascii?Q?3mxmBWe+RDzJ+TLKlvzyk8aVC5OLTEsfn9Zdvt+wy0llBVibNnZuZwUa11ap?=
 =?us-ascii?Q?LiYReU5g1dCGcMLjMe8xZoN2dXkxaCJLP/sKUUPvLWsg4pwXOt6UWczIV9eQ?=
 =?us-ascii?Q?btkZGL59P030hYTPfjXx791HDa+isuM893DUsOUZWQ5TCmzfk4zGcYjno4RK?=
 =?us-ascii?Q?gLaFkVzD8D3xJ66fuK/PBU4TkWE1dyBOwXPWO2CgkMrfh3a3QvaKrTJ1WUrn?=
 =?us-ascii?Q?tviGWFFbr+FzNzyU5RItfhUW7BXWlwTp/7ldXn3PGzfacG/ezNpTl+o4rXOj?=
 =?us-ascii?Q?bLHb+GxYxtp+kii25BXObP+Ws5vPCMRvx+IEnojQTA16GdEWQZan0KQwPNqT?=
 =?us-ascii?Q?8YzUm2SCZDRGXKhBdu1Lo8NmL3XsSfIrk2soXWs0ctWNdVHwa6TQ/Y4lGZlW?=
 =?us-ascii?Q?5Z7kgq4btkpp+wkCllgh/5ykyR5gA7hK+WqGOHVfXfjchQilUUc0JRBjyhqI?=
 =?us-ascii?Q?7j6NNBgZeYliaQvh7n50EM5TClAgXhm8ysXw6BrIZOKDCPAjYNbXBaI12MSu?=
 =?us-ascii?Q?9ULfjwxtM8RNLSGDd1cVb+CqfSzLUfg7ypl8Ptvcw/h8L2+c2OTThLuKyBmT?=
 =?us-ascii?Q?8i7sezNJpSkQZhIeFB2JCaOwrUCK9JCvf9qV6QYvP4JkJ9Ho7UXMrfV1PA4C?=
 =?us-ascii?Q?ao7DSX5o8F5iLsY28HvraqnPMHUjDqWTvFEjEyvHAwjbEzXzrPpQB8MXwvjQ?=
 =?us-ascii?Q?X3NFfuxy+oIWBg0GncUFFM088NsVqFgpMEPidTzTrrWMXUXS5T3hstu6SRV5?=
 =?us-ascii?Q?ssc+abCFqXt0+g+jP6oizsE7wIFfJ4G9yh+YwkyH9x7DR/+0oczZ3k+pXsy5?=
 =?us-ascii?Q?QFmWK33sSdt3xhdz3JFBACz/z3PEGaXrCs0jDJwjjxYK0mNnm9cvGe28vgoW?=
 =?us-ascii?Q?Vz0AVbD4eeog1HJZMNfWS6exNgX1I1kyQ5mklU//5iriunEiSbFo4gMaDC35?=
 =?us-ascii?Q?F3i1zG2KpIKqcDYnv4/nzAIGwDnrxeeGcOBNi8goz6GdRy4ndEfMAjEfK0S9?=
 =?us-ascii?Q?xx/4v909OfseGwlpP1ixsSlnJEx2s6rUkcO/Vqu5WMj82F+a+uAibz7b/rbN?=
 =?us-ascii?Q?/+RljUGLFpzVjE9vbXvpMkdcfyGAOJuzK8MvKmcC/pPcnlwGBLHXvKalTwgK?=
 =?us-ascii?Q?Qva8OgqzPPuhy4LmJ31GdtJ/LZ169T6hZkngEc9GU8oAmUKmrRZx8g+box2Q?=
 =?us-ascii?Q?mgNwYGJcscnrl5obRSD9cLRrgFajCI10Va5Jb1kRN5cDZqtVNmvzsXt8W7YK?=
 =?us-ascii?Q?rVaroFPkWeSkvCC4ElDbvKAKAYlgMXfWsmyH07NQIR0NCujPXQNdsgtmt+r9?=
 =?us-ascii?Q?a0ii/CwfkgWzrEFCnmzciHFqJ4ySvgvTOlv4zqgS?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a9d281-2123-436f-7145-08de121a5cd8
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:55:56.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8CFvDdaihZHfAdVI8Vq1LIlHdnr5eINRpns+qnCHvLDl3qidVggf2Y51SEHmPG5ulse9CN3uLx6W2Auc7+o/phni3ZgK7J3rM1HgFm1I3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1800
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120929

Cryptsetup code uses Apache-2.0 license also. And the below
reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.

Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a4=
4380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-o=
e/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 4f8bbf0358..8b14ab90ae 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -6,8 +6,9 @@ and can hence offer more features than plain dm-crypt. On t=
he other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION =3D "console"
-LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6"
+LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-e=
xception & Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6i \
+    file://COPYING.LGPL;md5=3D1960515788100ce5f9c98ea78a65dc52"
=20
 DEPENDS =3D " \
     json-c \
--=20
2.34.1


