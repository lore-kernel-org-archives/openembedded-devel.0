Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.82])
 by mx.groups.io with SMTP id smtpd.web10.6811.1617962002286600318
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fpOtYQ2M;
 spf=pass (domain: kpit.com, ip: 40.107.138.82, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXtnBfGCGgZy4ENRz/h9qfS23n5Y0fo0DOaYJSFykgdrMgpukg3+vNAQAeRYeQY46piHVRGbqdBDcRfbpjIjvlk+ynkCZjnO3mO5zR4TUwRsYttIORzEvJl3dkmwIxeVusDVGr7KCzPdrz4dhobeWW7Nhp1uD1wm/VodBLdAmh+LpqYtMOXcIetbC4F2oX3Za/cinOJ8gKVa8OHhDXls7+fd95gpr5LRtNcgL8p5OwpZqSqApXzZiVB7TZgBT/FmHiHM5PlnL3bKMYYMoSsAl0nIy/yvRQsaaA4quRe0Rge7bkhqyDUDuhq/RkiVFXQzUzMJwXtgEigORKC0uW2fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8GWHYRkeKt4TExnWcvEfzcC8kO97mgc7aR5l6+/S74=;
 b=SGya9m2vyB/5kUY4pok9r3+sue9Vmrt/IH6nuNC9+yWcWfwfGTcLg8gbD3Y4tIDoEJP/v0PoUHuxY0riTGmZDCf8AEVObFfvFXHGALIXCZNC98Sxtw+m7WJBVXhKESizwM5t5adzc2T93kIftgIl8/+NG6dkvJ4qMi8+st4BeOduTxbOqHgCeYwJKLtSWM/S7fJmqkih08lF4RwW9EASN0eFVJ1GCYJNhW2VweKajLtT87CMrdYY1veZ1Yxnjqf3Dq4OD23O7ocwr7R3uXX2qQdJcAwQMrekl7GJ8wDXVfOgcp4JWthudUOlF0Vihh5mY7h8DEA3d3QNUGkIJeldkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8GWHYRkeKt4TExnWcvEfzcC8kO97mgc7aR5l6+/S74=;
 b=fpOtYQ2MmhEvVVG80V4SJiLyPkWXCv05ukW8Icv+q47JasHDGBywdN1W5jpr9DoaUjC/knWUAfAHlolJHG1ieh5OqydobLnJSPv1f2D29wFPVnHCAlFxTHG8BoE78E+KofeNx8ptP0K6DpxKAFwBSluWLepO5pj0Al6nbXBB/4Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MAXPR0101MB1707.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 9 Apr
 2021 09:53:14 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765%3]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 09:53:14 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [meta-oe][dunfell][PATCH v2] fuse: Whitelisted CVE-2019-14860
Date: Fri,  9 Apr 2021 15:22:58 +0530
Message-Id: <20210409095258.22644-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:2c13:338c:1d97:ed82:39d:e405]
X-ClientProxiedBy: PN2PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::12) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2c13:338c:1d97:ed82:39d:e405) by PN2PR01CA0007.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Fri, 9 Apr 2021 09:53:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b08eb284-7ecf-4716-013b-08d8fb3d4a3c
X-MS-TrafficTypeDiagnostic: MAXPR0101MB1707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR0101MB1707E7313F6E07400968B26A87739@MAXPR0101MB1707.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oZG5Qt3TgKXlHMzvTNK8/oQpXyAG9gE2YQLlp7uzH+KTliaIkJ7wLruIL827+o/XGkXyoD7efLAs1hkpgpUJpu+urZUkLRXFCd3UZj0/Wr6KcAmWFCxJFreoU9iuYL5f93E3DJ8NWsJtcDZLE8aby8lUoU2wYBqrXdgRqmXIU3cvVMVWKt2ehvm5Z6D8KMQQVtH2rhZ+55mrc5XQ+UK4HnJUzhqzKJTgmUe82kDO900mjtpZnYImJVdE7L/re32gmVVeUK7/Xuj9Oi84v1A4fIPn9hBtzqtJbfzhEQz2YPwqerDy2URKFMc+IHkBBMUroBBtzAlUGjFF0XNpqjgxRHwi+83XK1EfxR6gSDIMYcUCpU9nnxQeIQFiTLIXPLfTSEqoK/xFoMyGdlanYkDqGY+QXlvbnGb4aVhQJGUzxvuM4VuuKJiOHjIjrK/zeD/AWf9dW90aNiQIT3VjEC5AzLygx8R5WMAC0qmgOUPFQLmz/SWJuUu4U6aQh0SiENDqX0Nc4HO19DD+3OmtdhtmllMVRYTy72WN+yLxERMLnEK9Mt/vpXlOqQegbCNJi4gqeT87PsbsQmQzGX42o2vImbdVtZgokecT9NLeVJiFDP2tuRYlbTxTz6AJ2NPY3OC7Hwd+3qtb/zv/WirG+kDK+6kk3xmySpl1JmtlGjTVB+WXHKdIt5zSQRMEK4tuuyYzCtQx65k9Fqru9n1jf1xmw03DMTKg5SPQs5e4QfIGh6V8mEPwTJEylKHDOzY3Sw7F9SU67yiV7KXSdw0JOXuOVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(36756003)(66476007)(1076003)(38100700001)(52116002)(66574015)(2906002)(6506007)(6512007)(66556008)(966005)(8936002)(186003)(2616005)(83380400001)(4326008)(69590400012)(6666004)(6486002)(5660300002)(8676002)(107886003)(16526019)(478600001)(66946007)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GtSTit5p9jZkhullH3giY9hr2wzlzKfsYF5vPUCgvuusaDhhteaZTtvbrgx4?=
 =?us-ascii?Q?naLgfEbOFGBLaYQlMHJ/+9AZN8zRStQFfiBYzkJttbl+hIPsJqF+5y+0aKOE?=
 =?us-ascii?Q?Enu68SXGp3HZW3SYHFJuCBx3MvJ7WFC7qbz2Kh/PaILhFQbM+9XNS5Sa9zfv?=
 =?us-ascii?Q?r16yxqHMlNCKq0Ot0TgTAgVZdRQSt+W/9ZeULZ+s/T9kiUhnLSoQHlFQCGib?=
 =?us-ascii?Q?JvjvHZI/QDsC4F5KAh/DvgMoq53LQFNYcuqpIMM+44gK/9+3RafbmVEsXcCt?=
 =?us-ascii?Q?jlURUBxFUmodAmeZToiSzZKG2NwBjIQ7PQk7FyilGhV+XyUOvEsEmLL1nEAa?=
 =?us-ascii?Q?/2GPIMfpE9kBvoNsOuJxx2CEswAl1EgGf7ul62jLgWUGs8yeDF2bMFXwL5d5?=
 =?us-ascii?Q?tQCN8xwaunQAhSlrTAVFH4Br9ArvGaepQK6SYX8rSRP62OYG6lbE0+iNkMXM?=
 =?us-ascii?Q?HvXn6QIKp/OHaQpobnU0rC0W9yxLClviQ2o3nioVCuS2l7G985DXJQ92NhV6?=
 =?us-ascii?Q?wa54Et6nAl+/k4sGMFcU5uM/vLKck9bW24T0CAprDakH+Ma6Jj5pbCaZ0nyK?=
 =?us-ascii?Q?pUIAcUNfE/BPaS4YBqFR6qN6+H2U6YH8M3z2v9erFUFpEYpuNeZu+nBKumZ0?=
 =?us-ascii?Q?7D5kXYxCFVBnJmRu3jTIYka+VbUQYJQhRXPSRoMS5Wuqy00B2YqRD/3Zw/U5?=
 =?us-ascii?Q?MpczlFQ0eVK3ikgAsD6rU2NZHSYPgoQ1hLQ+kE4gfPkBxVolFcx7i8ptQNlh?=
 =?us-ascii?Q?8bU7J0ga7vGMGM/SXFkdiu8p2nxZIhznk2RsTd353OAHCMkTeDrlKIG7qWIP?=
 =?us-ascii?Q?ywOvW9FFP1yfd10/9edhpWlk+uHYxKSIH1dDu2EyqylCAnDsvCe1eEKkzq1i?=
 =?us-ascii?Q?ZH/O1Yu5eu3l60QGEZueL5NyjHqxVQtEw7gAZPXhF6j0SHVKRFs47WFy7pXj?=
 =?us-ascii?Q?vX+QrRzmSgZqTHd3wCVuAnzxHpV64ABUte04L33xFWLYRbntQYLcjQ3spMaE?=
 =?us-ascii?Q?/Qm43EnOvJ/xzi9WqS07cqTE09TWF9CBTYqAxjS2pId9dqcYOj4esVbEw97a?=
 =?us-ascii?Q?RMi50nK0DAuC/+9n8gpECZcSWE6pKizHnicVA7rVBRNgc0s//qxo0LXI6NIr?=
 =?us-ascii?Q?wHnpFKPPV3Sguic14Pna03kMRvIpDHUtIRe7PIO/KawF/bV6QbYM8Dh5Dr+q?=
 =?us-ascii?Q?sOCECRjz/MG7aHlCFDi3zzD9/UxyDpUgZDLP5CEp5fBdbndrAfRuLWPBSbgH?=
 =?us-ascii?Q?DwXU8PYyF8eG7vf+YCawbrWf3rF/wSV6eqGDB2JRFhY3AVwrVY4bL/5tHkkf?=
 =?us-ascii?Q?xwRMsicRXoCsA37qH8Mx/rljJofBMlsk+I2sBHOAk3IKkkiYfKPN7OI7UIxI?=
 =?us-ascii?Q?jtKYZTXZwaqKP1sy5LwzdsKTvbod?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08eb284-7ecf-4716-013b-08d8fb3d4a3c
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 09:53:13.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nl4iX9F61y7L+p8cqyrb6OanjWOTDXznFXSzo0TLkty/hsMSNSohhlXC00WQJYtC4eSNK0EWZCvi3FMN2DpLCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1707
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

CVE-2019-14860 is a REDHAT specific issue and
was addressed for REDHAT Fuse products on
Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
REDHAT has also released the fix and updated their
security advisories after significant releases.
Hence, whitelisted the CVE-2019-14860.

Link: https://access.redhat.com/security/cve/cve-2019-14860
Link: https://access.redhat.com/errata/RHSA-2019:3244
Link: https://access.redhat.com/errata/RHSA-2019:3892

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-fil=
esystems/recipes-support/fuse/fuse_2.9.9.bb
index 95e870691..97e399e42 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -19,6 +19,11 @@ SRC_URI =3D "https://github.com/libfuse/libfuse/releases=
/download/${BP}/${BP}.tar.
 SRC_URI[md5sum] =3D "8000410aadc9231fd48495f7642f3312"
 SRC_URI[sha256sum] =3D "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed763=
8cc6fea7c1b4b5"

+# CVE-2019-14860 is a REDHAT specific issue and was addressed for REDHAT F=
use products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
+# REDHAT has also released the fix and updated their security advisories a=
fter significant releases.
+CVE_PRODUCT =3D "fuse_project:fuse"
+CVE_CHECK_WHITELIST +=3D "CVE-2019-14860"
+
 UPSTREAM_CHECK_URI =3D "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX =3D "fuse\-(?P<pver>2(\.\d+)+).tar.gz"

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
