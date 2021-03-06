Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.63])
 by mx.groups.io with SMTP id smtpd.web12.3709.1615004422577694124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 20:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nmsOkLd5;
 spf=pass (domain: windriver.com, ip: 40.107.93.63, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxDycPYJ/tiytmKYLN/8BWFLBT4S7HRlIlDiNb0jXGajANT/s6PN8PbdAenqY/dH0dLdwxYivKxK+FFXFBNW8QFGoH9clUsd/u1bgbMHF3q/ukBYSumtXEjFkX4MVNFNOSf+3p8UlJrl13FVOR16ecI8loO9utXRoszmyfHIDu0KI82vuZ2lkPe4Dvh1AGK0RZMMp5c7H+kXOHqDGEO3yI2eJzUF4Qm6GPpO3//uRPte7NnbzCPYRJcLrXjk+e+Pr9RmwMjQLXX5NP2L9aLWN65BNhfer6uJQZTazOgwxmH5dv2KVVaZ2N6l3ZOvB9abUUXS+vFn1H8Zic/EcDLFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POQamevuHQ6hOfcOQ7pKZKdqJmuJEF9YchsMSrYoGLI=;
 b=krYmJ9PiF25QBxyTB0Hndbd5V5SwvQvfxJUXVT4/oi4wWK+ltTEVpvK2Qk14jeoIPZF0eJ0jq8MlyZIEJ08hTIHTK1DI79HUDnj1yh1c1NfZhdXCFyELUb1qMTwDQQOCD8NeZWpsmW7UbPTEStQfcMo8RfIuKaraPp78as6dZTD2k/7GlXHl3Fh9WYfy09xyGKB5VVWj6p/FZ9VO0/4HVVovvuSswZYXMhQ3pZnIkRBADwYEAWMetd/VEVxah0pR/xRdaQPqkwclrod0QJ4FKfEesZhYoH5ckU6LOzmdwpI+oyPQZJxCq2QK4EhoePy2bnzI5WLU8sio29j3Nzmj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POQamevuHQ6hOfcOQ7pKZKdqJmuJEF9YchsMSrYoGLI=;
 b=nmsOkLd57KWQzODhV8x2v5h4DQ8m2CrMv+AE2jM5S0yrrBeWuG6D2q9rDEbaW1mYbCnUE4MIA/3mbT1mSwXaZQHCMCKwSqJXdZkedXgU5RD/bNbH0hq0iIPk/EuUnDsYJSKbrkkKgt0/+amvNJGi3CbrHJRoMiyA6OJk3K9MQic=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3165.namprd11.prod.outlook.com (2603:10b6:805:c0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 04:20:20 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.3912.026; Sat, 6 Mar 2021
 04:20:20 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] librelp: update 1.6.0 -> 1.10.0
Date: Fri,  5 Mar 2021 23:20:04 -0500
Message-ID: <20210306042004.29620-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:208:23c::7) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:208:23c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 04:20:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db0953b9-c8bf-41f3-555e-08d8e0572708
X-MS-TrafficTypeDiagnostic: SN6PR11MB3165:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3165E01F70266A3F443B84B980959@SN6PR11MB3165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BJYKaZo1bQmhRRDov1GziWe7A+oYf2KQI4fYDRRN/uBKU72jqixTBO5YJK5uq4x3wtCQd2+HSQ3crV/LaGoYEO4l0ajK5Kc6DC0WnxEx6TOC6V2qKUTjQYbd0eSs0XKc5d1Bmg3n4CTWQp6AMEiNFBIwZCaCwh3XI0TzrJXoPVTSUe1/GB9K3Xh+l82WBQBuT51f1z0xztslLXzpSY1hgRS38cnxiKhxgmkuv7N9lMnAeZu8N35uPipxrWB0ZcT0Qjp4HrMdp6wRhtpRoB8AveyX7wuZrAccy649qsJYxvXHh/yRtPYWiZA6BZ74K4Wo4bfB8ASm4n0CKhzQnTaPiHEqjsIMFFv7rQXEKFlrz3GfMlFE5duVldpMMCXHEK9nGgadAOTnr4yqv211xDj1eGNAet01bUU3k5Yov9m6ERMskEDH+IsirOtYP0S50SHvs169mTc9kTt4XnflIh7QR7gSgLzs3w/G82YMOaK6HjkUCwsHCk1DGvzVbdeUyXgGOVH9PWvhaG71NtHHpkhoGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(26005)(1076003)(2616005)(8936002)(316002)(2906002)(5660300002)(6512007)(16526019)(86362001)(52116002)(186003)(66946007)(36756003)(6506007)(83380400001)(66556008)(66476007)(6916009)(6666004)(8676002)(478600001)(956004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?tK4Xiv1p7Tn5KGqifRh9/P705fPBnkEQVlr5JM3JA7VhewJO9HRtTYKKn22A?=
 =?us-ascii?Q?z9VoesmR5NQ8ZjSwj8kw1lwvKkQTz9fT8uo4L8D/uT/gCX8/m5cvn0sapXFc?=
 =?us-ascii?Q?W7P5iMIdbHQV8WUuFjF8/li0vnpoMNjHDtda64nzkeCDJSnjzSaUWMKko0VL?=
 =?us-ascii?Q?L9XNftN7YIbT4zhk5R1A/1ldvg27slWqzX1SOzLreMckqoIn0ij9HPAysy5f?=
 =?us-ascii?Q?XQimd/wvuryi2LPwVVlUk5221xy+ewco+zb6JNiVE5mMKA7eVVEQB777sJRx?=
 =?us-ascii?Q?YvWQuqUlAhf2tfdhWvaRAUutcy/SbMp5Sgc1K6DWvbrkMYWAB/hwNHwGijQK?=
 =?us-ascii?Q?JyOHMBH4F9OrFkhVOzCfJkQcttuJKHXM0JKBXtp1Jja5MjpzQymEZCaXtEcl?=
 =?us-ascii?Q?GwCWa9on/dIZWqiNXF/M3APrdWRM4YT7UN7aO3YlevpaTCaLGpkD7iB8NCoK?=
 =?us-ascii?Q?Ykpj0pv9XBzzKowxJquZjVgOuyMZPQ1Jyhadpe4Fe36PeNAK+DhStaGMx8A+?=
 =?us-ascii?Q?ZDmfO7FD2p1JBJkfaWtORF6OJ+98ezeZgpvzsIVS4FjNLbxmmqlRNI3IepsU?=
 =?us-ascii?Q?l1XuWrWiFqd8t0CHFD4hnlYY27iQzUFR7Ju4m1+wbgUqd5D/4KPklr7KXMNS?=
 =?us-ascii?Q?zOoQ+EpaPyFE9KFRD5ApEy9iL9mUZpGLHi6icwO3x2YrsmWsBcMXcc1llM8H?=
 =?us-ascii?Q?PGsWH6RJNLPpYoV2EdjVMrIvLx+0zkkLLuu1yn26R2VNrLy179vvyLfQJRb5?=
 =?us-ascii?Q?kiLHl0gaKoX8Syrw5kDtpKRaXRkzR7CeFTss3HZOODghMXx4jxn5JJl9k0qi?=
 =?us-ascii?Q?l1P2TlhvMiDCsarZjff6VDD5tVi6Bs4IsdlMeqWSMZNHEyhRHNDwoJrtJY8G?=
 =?us-ascii?Q?vdh9XpGyUOY+eXmPDQv3zE/yQOF1kOReI/KEPqRZw6BrFf37HifpezQ/eq0L?=
 =?us-ascii?Q?V9BcRd/r+/DFKQYy+j8r+wU7Na0OiDS2cmRgv+B7nChscVYw0iAQYt1KftyS?=
 =?us-ascii?Q?d2AY8WymyjLhd0D0i0Ju+CdOSfFZRJuGlCm+B0GsbyaLFml/M8Qz3ylIeRBh?=
 =?us-ascii?Q?ZuQpF/Yr6jEDZkO1rSma+FCX2727Lu1NQIsxlmvW188vtYlibr7aFSweUAlS?=
 =?us-ascii?Q?YkAxSxVVn/qgv2lUKcwmqM8Hd8hFAft3qDIOM0wkDwNov+iBUL64yao3aySW?=
 =?us-ascii?Q?+51bi1bkvGp1uGhcV86zJUdIRugKmPhlzB0wEgk5aNn05c8OoyAzpzP5wi0D?=
 =?us-ascii?Q?EmDaJdtHiWh3/A6mVEUwMqR3eES/KfPTuQsqzvUh9k7iXsD9SrgL8xdSHOYx?=
 =?us-ascii?Q?9BGydsLS+DOC+b56WCLcBP2K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0953b9-c8bf-41f3-555e-08d8e0572708
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 04:20:20.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgGK8AqHCq9bnmVGYUq6Q1dcjXdkt0afozdNvPkVfwtaNz+oIIAEVNY97BRvnDoMP/AozLH+Hh86Av5aUM+pGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3165
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Now pulling from the stable branch

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../rsyslog/{librelp_1.6.0.bb =3D> librelp_1.10.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.6.0.bb =3D> librelp_1.1=
0.0.bb} (70%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.6.0.bb b/meta-oe/re=
cipes-extended/rsyslog/librelp_1.10.0.bb
similarity index 70%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.6.0.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.10.0.bb
index f3933f930..6a1f88093 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.6.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.10.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1fb9c10ed9fd68=
26757615455ca893a9"
=20
 DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
=20
-SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=
=3Dstable \
 "
=20
-SRCREV =3D "fe366f3770320cbe76bac7e84b26a48491d14531"
+SRCREV =3D "9e749453d51d602d8159717f8a7c27971dcb4c6c"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.29.2

