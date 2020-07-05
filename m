Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.44])
 by mx.groups.io with SMTP id smtpd.web11.42787.1593975468094078685
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=jiNK9q1w;
 spf=pass (domain: outlook.com, ip: 40.92.73.44, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWNoZmrRvI0liIKZu8we1PuOY8YVxLpeYmNqBoZ94NnehtCsikaiSUGcqrxVcjq4GXnUfUbkFHRhYz0m7S+Gdhn3kXwoP+eozvTekwKVTgcgyKc9rXAHG4p1FNDILmqpCd/b3kH5JuFDaRdBRC3x0W741DbeJcFeKEz1F/rf+dcg0BUc6wu08IozCv469QMvdWrZa7+VCv02CQKZO2fnp3EwUuXM9ZljzRIPRWWBLKFjBsCatRFr0DKN/QOg0AXoiV+6xjdTcxwDJxFV6WbR2xOZqQw/eWwS7jzMPleNSUxEraJ6DFBcV0l4vLizT3QjE6Fy3a0MsJZbmU5rWxhbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04s3VICuX/aIf1SxjkCaXzSItBZDJzpkl1jFvdSD+JU=;
 b=DBsg+UV+PHR1zEgOuVklTBuldrT7K63EeIy+YYDFd4vIfNJ4EoegP+N0qszFNkzDye4szML6J1jyXhLfVCVqujF1VJg0ieOCmV/InB3c3fHyGyB039xQWbX5IrhQX1bzPiK2+0tpCpQ3wwbeyUva7phX1T65Oy62OfMn/t/y81ihXBnWZHQ/4mr5YcNH4CRxwuVKmf6fSxkbzvLpApTHjAGZa0aXr1e9ZkJuDz7eHRhuxV2Ej4SwZqID8OEowbx3Vt2tBUV7TCvJoZbqdnXNYEv7KdKivOEZ8KhPBoYG5PyzWprboip3WfwW7Hjce/+tBnv5DG1zr15YYtGhrDxGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04s3VICuX/aIf1SxjkCaXzSItBZDJzpkl1jFvdSD+JU=;
 b=jiNK9q1whyeipPCBZLsHOM8wFYBGIw2ndi1Z0LTDdze61OwqSQttLhvUHELbWIU1GsPF+hbhw9zIO+PR4wze0A7VulEXYJT7uBt9j+o6A6DES6hbwifSDEDHJAuvOoUAEvSLTJJzMh+O14oWwoTTNDZOV9CKiOXhpSdgc9l1foDnKovPSi/BTjO10ZI1WR0085iIKQbpNwvkTHkee72VS1+JPkUwMtYD3upl31sn5jbXd1lihbUj81xjNtS+r9dAG4FYISElQpm3bWtgfILa0mJZsMx52Q50TpzVjteVXUOKVh9lKpf+0lrlxNbmRjMTXSawdUub9lsIGl6ozMYUOw==
Received: from VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::48) by
 VI1EUR04HT012.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::405)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:57:45 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4d) by VI1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0e::127) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:57:45 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A218657250FB110300930934D0CEC12A2109B27E7D953A7F10EC8F21359F352B;UpperCasedChecksum:108DCAF615B8C849133F2D4E74C770CDB9DBD3EF3F0DC58E5FCED0FD9ED6891E;SizeAsReceived:7516;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:57:45 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 4/4] openldap: packaging fixes
Date: Sun,  5 Jul 2020 20:57:34 +0200
Message-ID: <AM7PR05MB6881D50DBD948E1A4F8CE35EA8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200705185734.839-1-kweihmann@outlook.com>
References: <20200705185734.839-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P192CA0036.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705185734.839-4-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM6P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Sun, 5 Jul 2020 18:57:45 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705185734.839-4-kweihmann@outlook.com>
X-TMN: [W3azAaFldSf7X2fns4bhtHAsNRWh1Y4H]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 33f21ef0-ae23-47aa-e842-08d821154dc5
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiRpLJNj1ZiGHh21Av32QMOvMdZ490lBAUNrCJp5IsQrXgP0PKr30ZD3g/QsLE2XJyN1dUTPDffhMNbLzuCrKM92FusqtoW6v3j7t51raue4Kge7NbD85gTU5dEmM6uM7wwZaJMyzwbXsit7MTXMr2x5MegakStllUIbq3Jwy6p1AmtBfYj9c8DgGuTI7QQyJK70hvHOhQY3RZts8hAJ3vC2rviMNikqPzPqzP/fmv2aEqRA5ZbZsk1k4qWX6hIk7IvFHGg+ThwW8E8ZIbx7zikfbOAFBto2c6oIfJ44qzwrASXOfZNAH0wW0EVqr0fdBjWu02xo5QRRIOBaZJXVbB7pey6VDOSIf2IFk7cLLBrUvPls715lE3yC6TCeyY1yMq50NP3MdeAJ3k/P5zXT385ggVoGDp76I1DWVhPviPhvVTygfnDQI/RdVC9dfD5TGODrl0YIdwtGB5C5snVMRVD6Ff9BVvV9yBvOVwbbqiza7OCK1OdRT4VvO7qysSsLuf/DObXNlWl86vCl6Bq0q1ZMfPn8d2z3Nth4MzOzMdsAv4b7F5rid00G3TYhuEfO8tjRCAew3pdguUov6XgZBlavAiWea6ZkXbPzMUlvBmQuhRFp4dH42hcXCP83wni1o+2HApPQK4kJPCCcgRFwy4mOl+26nXcdCwGuDJPG0RL84YnS1J3maEaO81rPaea0USsrMoUYW1JxST9dESKBxyiJ7rPwf1ftKqWWWoF23bgULWIgliVopZbziGnChXWxITE=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT012:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DdB9I8PWCVAAUqFQS3wh2zF4hKOWe4COWPXpVtwm/kPG5wTlQ5LE6+b9a6uIXZ6n9KJePXEOITk4lPU9yV1SO1ogNxWC8o360SzTbQmPesx/iXrdizdk2ggXensrza2gO33biYiHSApHumDnbeLUlDIrL/Qi0CKXO+tgiEHdg1HXKRQz5S0S+3CX4O2FTBSPayOS31VLLOtmeKWigjFNAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	b3tTQcYTtFFAS/j3lSINb9OK/wZs2RKUYLSBNF2pSd8H2zwjzgefgrbzeY4iCsGJHQbRifUctq1vlqK+XyFqNszGgVUa5riWW4MGdpwLdFw9KKHTI0KaPSr/s9y5+P3vTqZYCR5dXc+MKHnVy7jR3A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f21ef0-ae23-47aa-e842-08d821154dc5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:57:45.7742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT012
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

in FILES_${PN}-slurpd:
- ${localstatedir}/volatile/run is already covered by FILES_${PN}-slapd
- ${localstatedir}/run is already covered by FILES_${PN}-slapd
in FILES_${PN}-dev:
- ${libdir}/*.a is already covered by FILES_${PN}-staticdev

remove the settings as they were without effect anyway

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.50.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb b/meta-oe/=
recipes-support/openldap/openldap_2.4.50.bb
index b62b13a44..3a130f970 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
@@ -172,9 +172,9 @@ FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/open=
ldap/ldap.* ${localstatedir
 FILES_${PN}-slapd =3D "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir}=
 ${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
     ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
-FILES_${PN}-slurpd =3D "${libexecdir}/slurpd ${localstatedir}/openldap-slu=
rp ${localstatedir}/run ${localstatedir}/volatile/run"
+FILES_${PN}-slurpd =3D "${libexecdir}/slurpd ${localstatedir}/openldap-slu=
rp"
 FILES_${PN}-bin =3D "${bindir}"
-FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libd=
ir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir=
}/openldap/*.so"
+FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libe=
xecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.s=
o"
 FILES_${PN}-dbg +=3D "${libexecdir}/openldap/.debug"
=20
 do_install_append() {
--=20
2.20.1

