Return-Path: <omkar.patil@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700E9C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 06:47:44 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.50])
 by mx.groups.io with SMTP id smtpd.web11.5059.1658472458136486778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 23:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=UCNdyyx6;
 spf=pass (domain: kpit.com, ip: 40.107.239.50,
 mailfrom: omkar.patil@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjj8LtKqFWOq4DyU41HkpUhW6jPFLc9VqOneV/FUjxy73wHBDBiCmTFgvhMkxnV09B7cAfMzNUCtYZyEk77/n75Tt8HhcBlYT1jUH+PiuEqnA/rY6IP2kTJ/MzP7N6kEn0eketnuB1cMRpSHiChRhUO9CiClnQk8AmCyQv9ZNmj7GXlsclOUjZJ+Z1ivmX2JIkNrHn8jsuxzYsfQkNAzOFsxchCdBuFnbtk7tCjrtET6laSwmyGg4PkPXDN/DQO00YOkHDMbOBbb/HIK5Of0QGfmLam7E/teMjjAO6Q3B9r61d9kCbMzVE26sGAF/xidZU4VILVhJkBcqDIPQ7KMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r1jkOu1YxpwBE9gwOp0E5tsg7JfkfFQwGK4w0PZM+w=;
 b=n1+MCeClozUp/JjMJ6KAe5OYRC//bHN7Yk9NbLmukcnVjpX6pJ51kfbE3IxmGmsrAOKiHqEUrJZXLl+Jr5cnsuWT2+gTiBEBapfVGFfcCctHbTzdJX6a01+B8ld7RcV/LlqnqYDeMVrAPPLklOivF2Pb8M4+xSA7Z8IIf32XlJsQpyGoLZeWQpRWvoN7bd0a9i58zA+USF3zET1hQKyC/15RL7LMqa5q6sbtdlFq3O8w3tfbQla1BgZ8ObujqEAQF1ri4wpYZKUZ4UJ53o4BjmhT1sXru8OWaj6R2ZSAoG9ffXm/stoZcLdy7HBuW9AIHvuSRqscZmrRD68Q0T3h4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r1jkOu1YxpwBE9gwOp0E5tsg7JfkfFQwGK4w0PZM+w=;
 b=UCNdyyx6TlZCaUp35Bq7dYxcHp+z9kN1h73B34TDMnuvestbP2J7pPjLshhfUPaTgj9D7CfOvyO6Coyr0AavMYq8cdKuDr5yz0lREcEfNiJgLYKBKKiubPsZs/T1vUQg3HGesdCjjXMBrqzzKHLjj754rU8NQ+eha/k+e2ewpUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAZPR01MB8580.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:85::5)
 by PN3PR01MB6710.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 22 Jul
 2022 06:47:26 +0000
Received: from MAZPR01MB8580.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::891a:883e:9e3c:f6ad]) by MAZPR01MB8580.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::891a:883e:9e3c:f6ad%9]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 06:47:20 +0000
From: Omkar Patil <omkar.patil@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkarpatil10.93@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Chen Qi <Qi.Chen@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-filesystems][dunfell][PATCH] ntfs-3g-ntfsprogs: upgrade to
 2022.5.17
Date: Fri, 22 Jul 2022 12:16:58 +0530
Message-Id: <20220722064658.19286-1-omkar.patil@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::13) To MAZPR01MB8580.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:85::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48b846a9-0a1c-44e9-2926-08da6bae0649
X-MS-TrafficTypeDiagnostic: PN3PR01MB6710:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oIMf/7NYh1Ou1tJYF63S/1fGPnVeXiqdx/ux1oFLoacOsSvJWvUB5M5O7A4Q0vnY4AwWUShZKHoofXyN34u0vT1cq6mxKUJgqjZcIBnSoPKwXWFUbVgj5TbydmlWvM1R65TQpo98hMTCbo2hdq8vwWMIZq6ACWE4T+gZu22a9RS4XAaiZ1nWh3EMOAEazUlZSYM6Bw6xVthlQInEvPMFBcKscl8yEmwXL/fPavJBPgtOwgn6OHI+c58AhwVlPF5GrGmOjfoKkk5O9/o5SI5lk6S5oaRSLb/qdLlRx5oXQG9+7X5/hx0MEQ2wFOrWpLXLToEZQ/bYhKiAmZrx/iPra1iAVSQBMK4tA6h5qfzIfnysKHOV6pvqqZff1ng+T/yfDGUHr69aTgaVAa3AB8le+m8o0koDkPZQDaHHPguxR6R9HhfAbTz22UX3anniEl3EQB/TAJCyrrv3MO22Ar+mrRVDeEn3MR9LUfkPYGesbFlugqzZtTzk/mH+tnPk1SBrhlSAapRpMxk6Zmhy9xMJa23kpwlNugWxbWmf9GhRqv9hda1g+cs0Zv07l4jZP3K89NJM2pYStO10VNYW8x1Giov011TIIJUOm7s0UeypfP1xBsCH1eePDCxnER+8We6kXNEvWelJBz6gA6iQp1BGXH+Z/dlgf3cmU90R39se1XI0EcSo3Ob1mF2o9OYh3CVRmEfTNYAox2aQSQKVBXpA1hBwhhq/GvqxnBfBfXOppHtbaLAB1uCOc8WquuYIKElkO6XGEgWXocmAasLrxKKnbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZPR01MB8580.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(66946007)(41300700001)(66476007)(8676002)(38100700002)(316002)(4326008)(8936002)(478600001)(6486002)(2906002)(966005)(36756003)(5660300002)(66556008)(6666004)(1076003)(44832011)(66574015)(2616005)(186003)(6506007)(6512007)(54906003)(86362001)(83380400001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5c8WIfOQeaZMxpXJcq9YUZ6DTHP2sCNJpIKyDqEiujsLPwW3X+ddARUGs722?=
 =?us-ascii?Q?qJcHmG9jirS5bnyO4BuYOQhA8PBVd01UfHDVXBTNtIjVra5I81wd4wPch5lm?=
 =?us-ascii?Q?ugYTHJuBnPdJfU+RpvaAyTsG1v3h8RkeB82fCPl8LdIEHKTz3QPRc/LXH95E?=
 =?us-ascii?Q?/gJ5paKYCsI6ov4cgEAoE0LORg4h4PrZT75nnXWou89JCzwmOIskT0jAzHfz?=
 =?us-ascii?Q?4ilsdz+09ymmWPSMJ1qeTd/fR0cok8uGNhBXyBUc2Z+tqor8RaOQul3ESeh/?=
 =?us-ascii?Q?B4TiEjWgpeLMq6zZ3M3YXvZKWoW9lmy+in2rOi7gqArfu4I1HGwVoAktz9qo?=
 =?us-ascii?Q?57mGEM3YVP3Gce51VKSl+IeLtK7vh12exLqN3ho0SG8L77IqlUQib/TA8a7J?=
 =?us-ascii?Q?nRlcsy7dntKhA9osNCIuA2IytxLVjdJASk7ZCkPAuvtCUExTUbPAczssXFw3?=
 =?us-ascii?Q?THsnvTJ+tvKnju8QiTE90z0nhTu0JTtU9n7eDRKewm0zymOfh4cfVb4Auc+g?=
 =?us-ascii?Q?mCsNl3UKqJlLQnidwnyzKcU2Ll5/KflMueq4UPlg4Q3M87hvmUAsZ9rOtcGU?=
 =?us-ascii?Q?Dodhw3urWuyGgPO1Dg1yJ3NM6xztHplnFKhUwgCPT2GRZgK99m+YdIrAip+p?=
 =?us-ascii?Q?oBKklu52prXL+EWE1qzU2aYfRsFYccwN333MfL0ZqKMe5ZvVSCUlxlV/+tIe?=
 =?us-ascii?Q?1uMpu3omWUQMEDbKWKMpeEHcc1g5y7sWoGG9BORLOv1y6wCjGtZrjKZIbTSK?=
 =?us-ascii?Q?srHPDOiQQX5eKesn/WsWXx517z+ecZC/88uso+8waSYw/pGw0wqpJ1iIEfdp?=
 =?us-ascii?Q?ISBfIzPvXTNxppiIUP371GyBymBNpVhcEJDxEgp0WZOM7xmU2qhrKGpOGFDe?=
 =?us-ascii?Q?36icZt5E8HvSQDCSuX3cVwygS2K0nNwwk+hAXcsR3BVGqWxBWVqS9v4dItM8?=
 =?us-ascii?Q?9AYX+fddFslozQSK8n/D5W56y7xSflNN2Ecew5eMqgY81Z7p+8M91csZcAmT?=
 =?us-ascii?Q?KzDppOOsOpXRpQkB29ObJq7bPIAouc57aA4e/54HZoJK6kepv3ptqUZ3tQq5?=
 =?us-ascii?Q?1Wsdpv8UoSkeo9P9E8LDyNOHncCWp5WRWCVq/OboBhkls/sd5OTbMxVP4/hQ?=
 =?us-ascii?Q?FaeENQO5WmLa/0UjsNp5Pz61ZGTbbd8wr0UQSVyl8Ad8/ZzVEThkPEQW25BU?=
 =?us-ascii?Q?2FNAMulzEwFqII+lEaJfE98g1rlPrwFUxpB6nj1jib0BGadGBVq5vKHcBsWt?=
 =?us-ascii?Q?OyZBR+yP+6EQO0fX0Z7Yw7hpGL1RBz0NV0RmfM6bIwcrSzm1B/6PaF4RN2pj?=
 =?us-ascii?Q?htbTQSk5XTFAD/O3V+Lu0ZM7EsujxzEMVAZOG7QTbHraEra3pJn0rCRxU9tS?=
 =?us-ascii?Q?AZV+KMuFoPRoQCq/QbTRYLWLPvUUfAhqfxHLvmQ5W4R7LGDHr6n/vI/e/7Qb?=
 =?us-ascii?Q?QS/lOS49+mJrSVuDJvmsiVoKWEbwiQK63nrX4c7GjzJPa4WyIIp1WUiGn3an?=
 =?us-ascii?Q?dHXLCEmLSJ2a7KpVq55JqNUYhiZrUM65CgA8ABXkVl2V6Mm57AoDL3LFmMzi?=
 =?us-ascii?Q?4J5AI6oIO1RLUUQu3DAkohrfK5P1vKoDk+rx0MUv8fNZWAixlmKietw40mnv?=
 =?us-ascii?Q?8kYcQSkBD9nvWGEtiEKMk93rjIHdyJN0DMTJ6J55D1o+?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48b846a9-0a1c-44e9-2926-08da6bae0649
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8580.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 06:47:20.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MWEDUqJrDFuc2pK0iMJUZAVzxU0wuVLKjPhC/Mw4pF74ZyVz/OBtVxoz1BZwYKmaRbaeQLdgAX1YTVthVyl8Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6710
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 06:47:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97944

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade from 2021.8.22 to 2022.5.17.
This upgrade mainly include CVE fixes.

According to https://github.com/tuxera/ntfs-3g/releases:
"""
Changelog:
* Improved defence against maliciously tampered NTFS partitions
* Improved defence against improper use of options
* Updated the documentation
"""

Fixed CVE's:
CVE-2021-46790
CVE-2022-30783
CVE-2022-30784
CVE-2022-30785
CVE-2022-30786
CVE-2022-30787
CVE-2022-30788
CVE-2022-30789

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 35a51898e7a89fe65fef877a1016e751eea748db)
Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
---
 ...g-ntfsprogs_2021.8.22.bb =3D> ntfs-3g-ntfsprogs_2022.5.17.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntf=
sprogs_2021.8.22.bb =3D> ntfs-3g-ntfsprogs_2022.5.17.bb} (93%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2022.5.17.bb
similarity index 93%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-=
ntfsprogs_2021.8.22.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2022.5.17.bb
index 14694cd301..cb52c55676 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2022.5.17.bb
@@ -10,8 +10,7 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-hos=
t.patch \
 "
 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[md5sum] =3D "90da343e78877d388eb34cefae6799ae"
-SRC_URI[sha256sum] =3D "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d=
1b8b94bb202efb"
+SRC_URI[sha256sum] =3D "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49=
c789510fd5eb93"

 UPSTREAM_CHECK_URI =3D "https://www.tuxera.com/community/open-source-ntfs-=
3g/"
 UPSTREAM_CHECK_REGEX =3D "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
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

