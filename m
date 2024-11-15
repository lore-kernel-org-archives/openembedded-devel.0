Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23919D6DDE2
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 07:22:31 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.133])
 by mx.groups.io with SMTP id smtpd.web10.15164.1731655346448737526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 23:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=cEHy7yDF;
 spf=pass (domain: ekinops.com, ip: 40.107.160.133, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luC4zYnwzNSij9vTJm6ohb1fLgM/AwvvRi8vFptSj/T83OuC8UO3+rT1UAp/Kh1GddDmEqfS0Vs8ud1Mb1DFvp/LpqAXmj1ts1r6ECWS3OrMdhJuH1NfkkASvdVUApnmwOVVzdeG/is/XXrz/y/phSX4MAnajfvSd+IzZFVIjQ77RJRrtACeIYeS/GzOEtBH0HGPjG4awaDKD8FeDyTLwKpnExjUFZMZZwWYaiWfxfY9FOLFE5bP6taT/t008jgZFlDwFaf/Xrj62SfZfOjC5eRpM0hYT0kmyftZ/qLGfO0FMl0fmbzS/Jasv5hQvN19bJ4F/11Ux+/ZoJj1F2jFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53JmerSSheFdPg2BpXYoATIX46ZJZ1IJj3pKyOG2ucQ=;
 b=dxxuNNrptcRea5MZIEBEx5B+aTEYb8vNP6cKdK8ImnuntXQGeRfxf6cFU76fvt324a4Xu2LR9uDvsUqBLrxNNhPel5oqPrzYyWA/kD/p4FOebMtLj7fNMUqDxNxff+8eFzk9M1x4dXa/0HzgP80vBhqqGobeqt/x2IG24B1BpxUP5tFSj3vt+WPIz7OpEHJizrnbMaikSiduFDM/QGDItHVZNSt/vxZh1VvABTQrz0cDJQdyppQ0y3gj+/9ImyEurH2DeS8EgNM5V5+VkJkLpJO/r9vxX640Vk9Ku6acCQ96FLGCWEXEEEoFt9TxguM04vjpCn3pyztblVzs8h+3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53JmerSSheFdPg2BpXYoATIX46ZJZ1IJj3pKyOG2ucQ=;
 b=cEHy7yDFGd7hCiL4T5uG++RtqnYvq+n0aYfJWFVgQ2RJFwV269OArIBsG6t9GQ+9MvTpoXB4pjxCIMqKWt6L55vRNbEH7R1IqRlb8gHVtl7CXEnieG5ljlcbCnzRYJS6WlCDtVxsLuGAuhQYW/A2PyW2BHMtaE4vi2JEjKLfsWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PR0P264MB3340.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 07:22:24 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 07:22:24 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH 4/4] libestr: add CVE_PRODUCT
Date: Fri, 15 Nov 2024 08:21:50 +0100
Message-ID: <20241115072150.102677-5-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
References: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0420.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::28) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PR0P264MB3340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2102d3-a514-4808-2bb1-08dd0546403f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5igTXuzTFCiDZeDFvY4Grf5TJBB6vhsvqidWdTTdK8x6MrKadGJIIaqY0tmf?=
 =?us-ascii?Q?1JXB1ePD9mx5UMxtPi5NQxsQYi6nh1tkP6cYEvTACpuBmif+F07h2vRL1Occ?=
 =?us-ascii?Q?A4SXNzZFTwv1W5oDfA/CkCMVwqGtUxFDEzCNdmmpRYFTG/6vOnrIzb3BCxxd?=
 =?us-ascii?Q?Po6QNzIGP2tOkgShCrv8pCpozNxMyKIVPB9x04p2cBlsz7J7fVYBvTfwgyRU?=
 =?us-ascii?Q?UMhMKGqOYC2A/rsR/fp2iZETtT/G/Dkt9Ktpj8C1Inwwdhl5WzP2P9ipVC0j?=
 =?us-ascii?Q?/W/Rvq93TPA9ONFnlIfEFjQl/c81JRioofor3Sgo0Ob5Y8lB+mGpN8NAbASJ?=
 =?us-ascii?Q?D+sW9zUW9Q7F2nurPwm6mlio8tG4EzGFthughkuO4lK1xA51nzynvBtIybqO?=
 =?us-ascii?Q?FVsGUlI6Taq4gKLr5jlOqNpQukmLGonaFqIT7Wwr8/C3kO0UWcDlnaz/xcV7?=
 =?us-ascii?Q?uMdB8jWxLilKxfJES+odrMAwyrpj0+fRM+9Dnn+aPlxxEkB8dPpF3X3tykxw?=
 =?us-ascii?Q?UCqSDF/wFw5KxCy0qhJ1A0oLXZN2fOTLgKnaMALTezJenixSdX29UUV/c1uE?=
 =?us-ascii?Q?T5zWz1kXu9JiZ8VFfIGgPfgSSQ2voU2IW828M6vZeUdKlLqx054MKzFZHnmR?=
 =?us-ascii?Q?P+YhCMKGXSdQzjM+eC0zPxOrt3zhxNai7WBAwGWAATbYJxcN9MPSrXJWACj7?=
 =?us-ascii?Q?2v0BBXPDSvGkfsj4TT0y9DU/6/vakuZUD//Xx2lezZOttrUqflX0mLNxrgp9?=
 =?us-ascii?Q?i2TghjEe+X12sGYYEgkXt3o+68ygIslod9PJWDgVDbOn9NF9/whuYwLbqqVv?=
 =?us-ascii?Q?V4jx8u1865pA7oZwyOWakIxu4XwbXUX73JC4K7Qru/NqOEVx52ZZqgMIU+TU?=
 =?us-ascii?Q?MNVNDzIbNCleMFiuTWjyTAcMR/h6Px4My1XM3XuOhb5/B6uIfJnz3Q8YkUbM?=
 =?us-ascii?Q?1VbHhAXe1JIvihwZZPzM7c3CNDuco9sygwdP10yu7dq2QYwT72tm8/Glvvzt?=
 =?us-ascii?Q?90xOlS4dw1Vosnj+lV1McYeJrHxoAWuqMbsWFS423Q2jlQEKd1ColsFX9VZY?=
 =?us-ascii?Q?geaHqIGytpokLqeQ6Ln5VpH1/2WtrgjoYbsgzN/+6WCInzOHzFPBx+jN19AV?=
 =?us-ascii?Q?a6hkwRWY6p2v5bjLLqO4zu9BK3xS4+ktarDMznp1z7VbFJy99ODyxgsbtwOp?=
 =?us-ascii?Q?pR1G68hU9SBgapW4kbOnu7KpBgFCO4QTY2UKoNbqon2X4dY8HbuOoFrwqT4O?=
 =?us-ascii?Q?yMAk9EmFHBvtWkrj4a5qYse0RWkRTCfa0r9/V4UWo7MHINuOwl5jHC4PvPgd?=
 =?us-ascii?Q?7ze5HPKhGs/I40VAiO5BVl/8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Bzvaj6WCyR4K2hHDQwwL6K1FGPxKMEIeg5t1MnbY5we5qKeyWsI+w94RIK6?=
 =?us-ascii?Q?gV0LOlSui3EjgpwcGJc+zQwvjvyCbVfsUTQT25n3wIq0QagpjaxeJJifq/Rv?=
 =?us-ascii?Q?mgZva9+VzhUCWsNM3+PXsQhBgPY65oQ4Jxd0TL+HHE1AUhqRrPjkRP6uHCRg?=
 =?us-ascii?Q?5m66iyT1N5EO/bkZS5koviv19/TuOeAH3MrfMKIWTgS4QeTLCBY0jJzuYXxU?=
 =?us-ascii?Q?NL09JapmlrseSjAxUaBEF6XM0Z/ZA0TwXjD1IWN/wAofri2hQUesR+iS9wID?=
 =?us-ascii?Q?2Cdm3XUJafV9lxoQ4uV8UwLLXpaSZBn42H9YsyqtayIokTPDujXczvYF+R1w?=
 =?us-ascii?Q?oRfbbqMBfoBghM8lYWSfR1T3dc+U+MN3+qfuNMeIoWMzWSKhhmguyUYbN4Wa?=
 =?us-ascii?Q?EpECUOpa5vGt9L70VjeEA7kOEPEaowovsHYYsI2Q1dPqWwL/tiGd+pLWrT+v?=
 =?us-ascii?Q?W4HW3V61Q8CqrlS+jrfy6UUOKNm2H4XvRfLyT959azk8P7X7q9EaD65Nd8UP?=
 =?us-ascii?Q?L6vftI6KAexNB+x9tJiwRC/rOru8PLwV7byzqzKa5/74WPvQrZFMduch33Ce?=
 =?us-ascii?Q?jaQegX+D5A/Vn4yKNIlHOZzpY9ysMZMxf1m//Oj1axo0gDhgdfim8HBCjIzw?=
 =?us-ascii?Q?/RmypsVt9n5mwERRTl2bCDDxGpZHyoDC1An4Gqx7VeIBw4bhgkzqdQb93JO8?=
 =?us-ascii?Q?QsFcxB4Gbne91svZaVJKGQWPKMnt0UCkfw+nuRsIJIK7uPp2xLqzD6prU9uV?=
 =?us-ascii?Q?RONyQL1ya9DZfJgmA7n0LI381ojgQvyj0DFSZWE+UKcHj2XUCfXY9WnlJc8j?=
 =?us-ascii?Q?avdiYYqasMbIZmxEF/y8qf9y5UsjWooUJaE+0FuvbTMD8h/2fCuC2lUcGSix?=
 =?us-ascii?Q?Z5Zmq/Ke3+4/erd8xxJG8WorQ2AX0/xXAV/ecHNjIaqQgOO6pQafBH00wdrA?=
 =?us-ascii?Q?QZvfY6fgcm5QjG1uI+ZjdbponDr8cTtW/w+YksW+TFnoYhaMY2lX/UHKnHeH?=
 =?us-ascii?Q?p63gRwJq84eu8rgNLGXwb1BzRLk26JkseH3crG4EqTMORsDFjR405o/oo7Va?=
 =?us-ascii?Q?nJzp/waFAOZuTcChhLXZ9Sc5rbv/izu3c/U7nB6FTF7jIrnXNBae5wLgV+wK?=
 =?us-ascii?Q?14dYntUAOOKvpeOuPIx9zpjBHKloGoNkIZjpJKLx7ONVDibLBv2EubdSG8ae?=
 =?us-ascii?Q?cQL89oJQBBXkhmmvjI88XKdDEz2Zh+s6SZWtLDsu/yfsgPkLn/NorY7VMwj3?=
 =?us-ascii?Q?wFjJA19JIlADSGFnoGw9KDx73V2JWDr8hHYBZBQbD+0ge2yfwJbiW0bjQR2A?=
 =?us-ascii?Q?LYo1JERr0ithmCQTMU6I3YUriB7/miJWuHMYIjv35l0CJXQeT0Xuz4uA6KDp?=
 =?us-ascii?Q?+4pX8i4Cp3pEjLgAkiXXL+grbzsyIoqsJPM16pPBd4HCT1HsD0n+UBWAKL75?=
 =?us-ascii?Q?VolJArlnv+Uw/uJprvl/z/kH0tq3EAqUSMUOlhkHr/uurvWmaBjxIzrDQ5sB?=
 =?us-ascii?Q?JizUH3xn9ZlCNQ5zNqb/zVcCbWA6DsZnKYoxoFHYeC59jqa80siR3ewSY6Dz?=
 =?us-ascii?Q?uemYTeauEtd8Z+F/+k4uc0k0eYiAKFutgViSknNu34rcGtykp2azsg+4fmuT?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2102d3-a514-4808-2bb1-08dd0546403f
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:22:24.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhXkjqFop28QoEnjkRDlwHZSyePalDgEngyrXUdzwDlOyfWQdiCyisvugqQztPk/aEFNHJLX3mvbicHO92L84WTzDN7dWw+WrBQfJHEgjhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3340
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 07:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113850

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-oe/recipes-support/libestr/libestr_0.1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.11.bb b/meta-oe/re=
cipes-support/libestr/libestr_0.1.11.bb
index 2ebf2757d..baeb30bd0 100644
--- a/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
+++ b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
@@ -10,4 +10,6 @@ SRC_URI[sha256sum] =3D "46632b2785ff4a231dcf241eeb0dcb5fc=
0c7d4da8ee49cf5687722cdbe
=20
 UPSTREAM_CHECK_URI =3D "http://libestr.adiscon.com/download/"
=20
+CVE_PRODUCT =3D "adiscon:libestr"
+
 inherit autotools
--=20
2.34.1


