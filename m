Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.33])
 by mx.groups.io with SMTP id smtpd.web10.42506.1593975383986776115
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=teI8NS1c;
 spf=pass (domain: outlook.com, ip: 40.92.74.33, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYBlGpMx3VbQ2bPeFDgASwTtYVSwVPhz1bkMM0MkEiQ6Nv/dgfxrvMRGrv4nVehWTkuDIoJvPUZbuKSSfs56McQDMwJ8O+wpHUHANwSA8ogYm3YAsu6oHzi1E4bUgG+q1g7S/Jn+xHvDKT0Q7xJwcoIADkHo1miGXProcQ+yhaz5bSfxr6b6HdmasbqvZFa3iUwGJ8l5tdLCSL0tew9JcpZvY8yD83zcxaizyCs87nfTy51ssWQds5vREHdlp3AKWHUm3DKyUMQwdTXYkuqtFi4ruwkMAV1oITPJaOfR//9GcfbROtRENB3hyaA4S490GSfFQRlkDSrqplhqP/CH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqeVjEpCQndRqhh3ewsGytxtR7qzR6Fyryd8lc41yHI=;
 b=CLJKToqMM9zvRq/mzoR9aOtdnoUCi2XRdU45sgED6kCIAkNtUY0qQouB2f1jjBdxCOzXZ0qoPMNo8TnMc12khYB/wpklUCgwsZbMoC6wCOwfIqqIFHFHIjkUZeQybvLAgBR9mPTR5IRjY3qE45D2ZMAD5M6yfy1jEcitXKxlbWZFYr3kDQWYdsmQHvpg7eVVydCB/gzJyC40lfV06ylH8OiCDH99yiWKvR6mX18VVCJRn8mhtSazZDevjb325KSiKt/hWNZJ7MPDUTUty/gV5t27p6BgSWRWBK1+eqnMIAp2B+Z87v4AqcrAPzlsxv7H2AJ0uwxWIjOvgZhz9I755w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqeVjEpCQndRqhh3ewsGytxtR7qzR6Fyryd8lc41yHI=;
 b=teI8NS1c4rEFLDBLfYXXjh0Op0+7ow5G/swZkJxHXvdk+/o17L/0UBpuFFoemdfStCo2nQm6EwfzTIG7/uP3cr0uH8bo4LyOEZMEA++eebe78mjNQ7y5kX4jrGJ+uBZkM3KcoDS3z/jOx8Jfij6X3i6L2jCi0y/MIzJPxvYkIvXofXFWZtcwmaeOpl/ZfBiZ/ZorDzxt+D2Eu9vMQ/MO7sHi03oq/He5NXNT4Rx8NhLB3l/gXGO32E9BThM3Gx7o6d8qH60Tgg74AlWDlpU/X8PWU9I+GI6gR61dMN67YJ69p010+goPfBb/cXWNrMre1iaTpPjkJLt836lFxfYBoQ==
Received: from VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::42) by
 VI1EUR04HT037.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:56:22 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4d) by VI1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0e::127) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:56:22 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3C2CB9FF840E552824B41E189E3C794A89F95713F5E82C038A4B5030C6AA17EF;UpperCasedChecksum:595F822DFD8E874E239BB7F5B8E46BA5D81CC6D0FC38C4B176A99E91889638A6;SizeAsReceived:7525;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:56:22 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-networking][PATCH 2/2] ruli: recipe cleanup
Date: Sun,  5 Jul 2020 20:56:10 +0200
Message-ID: <AM7PR05MB6881C77B1C3BB6BD1BD4EF85A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200705185610.364-1-kweihmann@outlook.com>
References: <20200705185610.364-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM7PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::34) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705185610.364-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM7PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:20b:100::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Sun, 5 Jul 2020 18:56:21 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705185610.364-2-kweihmann@outlook.com>
X-TMN: [NFmtL8KLyGOz5NhKSkTcW41xbl8y7TCT]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 438dea08-9090-4b82-8d91-08d821151bd9
X-MS-Exchange-SLBlob-MailProps: 
	ISIDp/2nRg0X/oJEHZyQ+cZv1sUWUMSacSsvmm5kY/s0BWNWDMOw6Esr8NOy2tjDW50GrBosfOf3Mrh92NCftADkXcdb6y22WA0VMulx4lki2RmNRCZf6SOLoIMj8I+QBN8YQP73y4tfF/HOQt25ZMWzUQmTE3LcD1c1H8LzleaS+5n9DyhGH+Af9yPdOIQK5gfQj4FOrHFti+P32sqEsISLw8u6gEqOA7dLZ9hJDWrWvNeeE5BvatffPTA8EwCnRUgYfu7Eom/UAUloI19FPfl83cR2wRFTdXbGlZkM9XJXp1h/q8O81yt3b5qvI7OaogguS1ERjhvlms632b0+Gzc19imX5QSA/WSVv2hPeDp2ROr8QBHYy69SOjjdUqD2VUf82W4coMbTKUS+5EfEb4srnyXvOLDOFn2nyGd+dBc1TRKBSw3VQxzX1CHEUIPDC3mwyxV9oC4STCkn5UUQf96fxOVTG8RNKOUvzW9lneqHsPoZ4Zsgn16aZ/fM5E3r4pca1QJeVHg5USLiGJCVysBEp6Z01RKkeZHCGuLLsvK8D8uUmMs9wdE8t48rLFTRh4GtjN6krrMBxXhoOuIDjH4DPc2TPxo7dtV1+nA/5o8pXR8qL/Ni5gCASbj00x/wgNAS3Bo1GbhrHyWUTS6StCLFWZyr0jjqGjFkoQTYn4J24ICrB+L20xK8MlWQiUNlDmDZJQWce4csvn8+ZdWlb9XDDkV9jky2KUowGLRurCavTTliWInI3Uly4XyatElwyPr29/DZQB4mxdOtd2+1Rggx854H6wo38rjsbDRdxpgwGjSbJksZq8JXfDEcnrrxobB5DRva8fgUxp+dIztAWOOvvwdKVKXhNFaQ4AeqzUWZxDr6eiKjd3uYZnxFXbDVkXwg5BZQHiU=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT037:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vxkaqVEmc9hqAWpXtaG33+n8iCoS1u07nWNgcsAIQYrYOvSMjVMiCrSNpozr1PIN2dTG4aKrAAouwYP6/q1mNrVdYYfWU+xwmMbwBwJCav2m8+fuG+om1IPfe3tUErLgqLxNhRhKkn7Stx/GGO6G2iqF99njTt1d47l5g02wNUqBhGtZmHBhadabVxeaeB/iePlP3iLQctgzLME4K7R9UkK7XBt3cN3LYfR7Sj4fV+stKkXvwR+iV7UKzt/lDXKN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	/GHcZ77WFXiIY0nVfDUDT5bbheB95KixkbDRWApOTYeT6C4+Hmseyx3uOXB4jhKwU/RdtJq+pIoCDDoQd6plUPBHanJH1GSmBfFCsSZn/XgKvMUNqXTGcq/0LCKDS67s0e75Xu9JhlGNsVCcTWNZsg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438dea08-9090-4b82-8d91-08d821151bd9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:56:22.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT037
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

- removed B =3D "${S}",  which is the default anyway
- removed FILES_${PN} =3D+ "${bindir}",
  as it's already covered by ${PN}-bin package

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-networking/recipes-support/ruli/ruli_0.36.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-netwo=
rking/recipes-support/ruli/ruli_0.36.bb
index f920b592a..90e7fec52 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -18,8 +18,6 @@ SRC_URI =3D "http://download.savannah.gnu.org/releases/ru=
li/ruli_${PV}.orig.tar.gz
 SRC_URI[md5sum] =3D "e73fbfdeadddb68a703a70cea5271468"
 SRC_URI[sha256sum] =3D "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a=
4d268a3999dbfa"
=20
-B =3D "${S}"
-
 EXTRA_OEMAKE =3D 'CC=3D"${CC}" OOP_BASE_DIR=3D"${STAGING_EXECPREFIXDIR}" \
                 INSTALL_BASE_DIR=3D"${D}${exec_prefix}" \
                 OOP_LIB_DIR=3D${STAGING_EXECPREFIXDIR}/${baselib} \
@@ -34,5 +32,3 @@ do_install() {
 }
=20
 PACKAGES =3D+ "${PN}-bin"
-
-FILES_${PN} =3D+ "${bindir}"
--=20
2.20.1

