Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.58])
 by mx.groups.io with SMTP id smtpd.web09.15236.1619918637922615147
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 18:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Ne69bpBO;
 spf=pass (domain: kpit.com, ip: 40.107.138.58, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it/mJBIR2BdII6Hbp7d8H9oHxn/zYHxMzWKFigoKYHbYsF174MLmCCTr7TGBAczcAmJdlFxNNaLm34IZC3BoZRFdkPWZijmng1/tJGUzeTt7FR4FyyI3LnqG5ZAkSuhrWqNJ8XpnwbzA3qUWCDXmq0y7ZmkruByeVYY1T5i5YnqpUhYhGXaPGZYAjawhYiKU36y+IeOfx6bRoNd75n+qtPtne/1zIGJb1Y1yikDTHGXRvXrhppGMdGOsX6HTAimvqf0MqirqTO313HbDeAE4h30uXG55VJ4xj40wPRbMMwJr229MINShzz1IVAHqywWDGlFfz8IdD9UN2k4Jg+7IVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFXTFTESnrhhJwepw4jhMkHj8oZv3nkMwUFL3SAqBLA=;
 b=eH5wENqY68OT9+ZGrB29f1Bp3+S32pqVahnX4Y/H83wwt89VnBBiD0Q9XSwsHWjoKOxpPq2EMYFPfsn1WSgmG0ZqgUjT1ZgrOlkt3km/81tzbnvWHD6nrJRQRfzOW7VMZCvfEmZejswJo9wvbbjv6XKpSh0HUedPrKsM49ZBDaX0pYdmoQrhzcL0ZZQLoqXUkcmvhzWHWnujtYIhY7AgrMrai4cZDAeYjU5LYGFJQL1kudYXfAOyw2ciZW9djIAHwQmFTYYbZnwgJrAIZ6hsy3dbyflLeCdeh3CqMpBS9MYPwQEZjH6vidTFfEN592tSWEq2agD3Yd0HH1Ga8S+ong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFXTFTESnrhhJwepw4jhMkHj8oZv3nkMwUFL3SAqBLA=;
 b=Ne69bpBOwKXekIpn+0Zf2kTyau87eaUC/e1fC1kud3x+daHv2kU+vgPgUq6RK0Jie8k3z4gIR6ab8ttzU3A+7B7rOGFbRxrpK49MLjiIiQJdcZttUmy507mjm4u5Y6lMdpJTTFQLT+WYCEmH3ejuaT6iEY8QJAU4OR/WdBEYoVs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MA1PR01MB0748.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Sun, 2 May
 2021 01:23:52 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::259f:e6b9:4e20:3471]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::259f:e6b9:4e20:3471%7]) with mapi id 15.20.4065.035; Sun, 2 May 2021
 01:23:52 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [meta-oe][dunfell][PATCH v3] fuse: Whitelisted CVE-2019-14860
Date: Sat,  1 May 2021 21:23:36 -0400
Message-Id: <20210502012336.9888-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2402:8100:22a2:ee48:886e:de50:9739:db5f]
X-ClientProxiedBy: PN2PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::6) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:8100:22a2:ee48:886e:de50:9739:db5f) by PN2PR01CA0061.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35 via Frontend Transport; Sun, 2 May 2021 01:23:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3968a324-824b-4d81-e95c-08d90d08f1ff
X-MS-TrafficTypeDiagnostic: MA1PR01MB0748:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MA1PR01MB0748B64FA190711A8970DAE7875C9@MA1PR01MB0748.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iRJgslsXhxH5k5BD2Ll5RiyZ3PMC7f90F5poQcV49Gac2wgaXcN/qVsuY5DpFK5GwElk1tCqEqL1w2FrmLAAUeYGYjSf7JqrDhzyDbwCkA3MvyDs+nAkWGs234IpGvdh3rLAUwK4mathfXhnOlBEfkMoUgGE01EQcapJVQaBhlEvABy+q516PZ+Oj8Nj4z21MLPYzviRgiAFBjYjsf+RqGnNjUjRw/Qv2zALalwaBJabn4RfOOsIc6RIw681gxYi9MU+gpUUJXXImIQDX/udLK45YItsIhklcOru4CI7QcXimWgvHaTtoG3mtrGi7M41nAh9AerhzUDSx3snLyM5pTgqr+L3gierMbH/UedywKFBXFiNPQ2j5AWlQllWbDdm1g2OJh0892t1uWigUBrktb1lLM4BKd1DnZivC4+f3LbL5GqHNRgrNyhCEronUOCGEhzfDxplgYvZQedpwu3expdSA6pkCPJQWZ3su/Tt8Y4Qd8PkoD2sGfyhFPCkVKyFYIJ18ZvZFfd1C6LvL1u3QSPGvBj+qHiwuZSpbCQnVtcstfGrGb2zi72Yhjlcn/pW91nA0gh+qhc5iMdAwvSlt3ukY3B2UUbNsT232Bo4P6F7EoOipmKwEGxw5nk2AzfhlWiIsCYG2sXBNSBSsGk58oJ/sijbMlcMlgMF0ckmoe2Sd17rglT1fmPtTA9DFodJPWgJ/fLRIfEAmtvqBtMX5lxRXZopVHptTY+yKcDaedw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(376002)(136003)(396003)(6512007)(186003)(2906002)(8936002)(2616005)(478600001)(66476007)(1076003)(16526019)(6506007)(107886003)(36756003)(52116002)(66556008)(66946007)(966005)(5660300002)(4326008)(6666004)(6486002)(66574015)(83380400001)(38100700002)(8676002)(316002)(86362001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?goofse3uY9xDZDpy0Ztv57DDCXybFPCagkBJHnN5Cvosjq69gDqaReER4X6k?=
 =?us-ascii?Q?fju3oTcig36wgHtkwjsbWW2oe9WYzOAinwr3fekwUUl9yvLobpx5OQRzfPFP?=
 =?us-ascii?Q?BSqt8CCshs61CmZuC0sB8xWojzX59DcUMuT0maX75VXVUo21r85gqSRH9Hcm?=
 =?us-ascii?Q?QY7w9/D20Y0s8NDCTFw4UrRxHVyOZ0Yj4i2bZB4dIVRWd6+0nGmSGl0KT0Os?=
 =?us-ascii?Q?b3Quyj9pvFbk+N6v7DtWupg+5l8puG8h8BkSoBHEcKNs5OYrJhN3JoTjA48d?=
 =?us-ascii?Q?6splcmpULjSz5PrPFRpDUwJrxNtAkn4HOmll3Wt3jjkwHicHFO0TWaVcf+2D?=
 =?us-ascii?Q?8KqPO/AjNVA6oFTVq2mCNc4kpj1pVX/edasComdypx7s4We3ARbl4+ZWqphi?=
 =?us-ascii?Q?R8tbDZxl/JHvUzaDv81/6TzS3Hw+Vu/KpbwS230vRiWuaLe1sPjf0cXbnD6Z?=
 =?us-ascii?Q?MdIbaDCYA+vnNDlVAdfeAaj9bh2LuNlW1Zn1ER75Pv5aXy+3uWGjC0am+2P8?=
 =?us-ascii?Q?SB5uPu2FMhSw6OeU6OQCZ2u/8J+4cBOhqvOhvCvtIdSKTfJvMSNGABkHstcD?=
 =?us-ascii?Q?6CbYgu+g8vGiKt5ZWyxBLgrLRQbouEQ25jDLMgOjJ8VGa/KmuIZY0hCVDQMP?=
 =?us-ascii?Q?VOd9ZossdoN7j9Uz+lOfGhhWOiFvBm6M6yCmuqAs9fhK2eULcuke1v/9snc+?=
 =?us-ascii?Q?+t79tUsZoSKzDgWeACbfP0uWzilSaleOHiYng6lc6QJ94wdwKDLPTZ4gBtpD?=
 =?us-ascii?Q?KX055VyI7urtoAJz9QSX4kSJgyf+fy9nFy9Zb71oWpqaeDc1hucaTMr9pOOD?=
 =?us-ascii?Q?2JdWV55KPIDRvyVFLRep5/XtYq0m3szj0aFkAaNI1vYBO3Y0J4SKXvCU9WW6?=
 =?us-ascii?Q?HDLBjZKZEinBTYR54w1esUUmMVyL95+J8XXV7X2P9L+bBUB6CLDP5DoDYm/6?=
 =?us-ascii?Q?WYDIQLkS2FbmuEViUz20E8zqaVpSlUEhCXNiDtCIpYVIDgPN1umeFAoS1Rxn?=
 =?us-ascii?Q?YuJSvpYqK7OVZqRrVeir+8hJ0wA2eEhlsyri2YoF6VhYemDm4tnM14TcfyE3?=
 =?us-ascii?Q?bdnSEX6gi+/OOUu3IBON/8PgmbrWJPOmseA19S3f0qWWxH5p3z92ajFLjc1h?=
 =?us-ascii?Q?Bi+lzKWw7MRU6Mwrfludr+y2wgg44XuqzHA9dYul5Dt4wjllep+W+gak1fGp?=
 =?us-ascii?Q?AaTNHE4bnYBWmiG6oyo0vkTH9Uzi/HVzgBhgLAA90fkwKYajD4vDh6wsGfv2?=
 =?us-ascii?Q?nAiFS8SaX/FJ0ZIQlqAEuNjpQqqPr7FRVkKbIZgPG19m0AMWzHcrn/CYK03u?=
 =?us-ascii?Q?+21cmwlXBy1/6xyy4qLFNAU4+jkIxM2M+f3rFNJgZiWCqLN/m4xWXvqL0F7F?=
 =?us-ascii?Q?p8y6G+jb1apkOLfqQBr9Bz/5GDZR?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3968a324-824b-4d81-e95c-08d90d08f1ff
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2021 01:23:52.2764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svgNbVqh3LSLHIhaUmHvC9GXNXFcsnadKE/O5ODXbGnVk0A+JcBm6xQsieB7/jERGOaJmqFRSRqS2Xc8hcJJ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB0748
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

CVE-2019-14860 is a REDHAT specific issue and
was addressed for REDHAT Fuse products on
Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
REDHAT has also released the fix and updated their
security advisories after significant releases.
Hence, whitelisted the CVE-2019-14860.

Link: https://access.redhat.com/security/cve/cve-2019-14860
Link: https://access.redhat.com/errata/RHSA-2019:3244
Link: https://access.redhat.com/errata/RHSA-2019:3892
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-fil=
esystems/recipes-support/fuse/fuse_2.9.9.bb
index 95e870691..49682b3cd 100644
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
+CVE_PRODUCT =3D "fuse"
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
