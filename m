Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.95])
 by mx.groups.io with SMTP id smtpd.web12.42621.1593975383828877357
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=b4UsKTPC;
 spf=pass (domain: outlook.com, ip: 40.92.73.95, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3pV6VIHYZPYzi1jv1GePJOH9xxrW0rsDN+zK1EX9mDMAm3rlgmb46xKTQFQn4pw1ZhUXEU+UVYfbnDK19WuKL5YH9i1y/gh5GTO+AdGZcB3ZRuELNOa+93d1QLtszKJC2LY0K93X0qnb5C0BUJ2FSNnPMzZhYQ/VhXjh5YMr88A+ZGCIvogJHYlHdw+vD1KiAPmSBC5JbTVxfdmM/OcRyD/Uyn3eTo6SG0AhnF71gT1cJk/Tg9dPBH7lipMNlUFh9PKUo/tIcD0/79pt8dcOOozzwIW+CdZYH9LhT2VDFQyIAmYMa5OUqItQsO5XBP148qvpfFQJSVRhZ483IaL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwxopYsFbfip6J02GyYX2IRA5vfHHQ0wg6TdE3jqZ7E=;
 b=aT2kB/ovONXa9j7IMzhkwMPvaQ4Dgs/4ibCglAcqFn4hVSyGa4PoMVNGRRR6Mxm861MeXWsuve4A3hqI4PwAxWJyqkzBM1Z275NDYdRNc0XGSKfqvFCmSybMngg5At8vwM0yfy8te7mGQPjjazCFY0z48LgA67BHF0I9kKUkvYlPZpkc7DfPIOtPDZKQIogc3mCzf7ryIXdCCMR66tDwS8demdQkHocyYGtQv+pysYh+4tXf20pcg/GMZk6cOZBJPy6AVWrD5473bcGxi12SEDCxUo2vJL36uZq/h9IK5VPcNUHar/iuk+ZzU1QpAiYHMZCGHToI4DRU7NHggprwzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwxopYsFbfip6J02GyYX2IRA5vfHHQ0wg6TdE3jqZ7E=;
 b=b4UsKTPCawiCQpxPTWG344EuuuUSMbAalazCwOzRbiq5lgXddkI+aAhEIFqqeTAFHjgX+MXbU3gENOMHhNZGep76ERHs9f9Cbib4GXZRvhgNbnB3SyjPsuuP1AiQrYCaSvy5z0CSuu1kM0ySuteUSyK7H5mnjYvjbS3XXp5Dnkqdhif+HNo/NJOymb1MqFKgpLigNecBd5VX8aQCvlvostaEaTtBgcL8T03VSA6I3E2GOS3XEJzNwFrsOCQhbAflX0Ni23DcizaKd4XvrRDEcyh4lT62KbfZr8ZxMIc2678KkF6W4LXCCtKhjkoXs97M2jFYbgMbfNin4ZkoxHRfXg==
Received: from VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::41) by
 VI1EUR04HT220.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::141)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:56:21 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4d) by VI1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0e::127) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:56:21 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D340D85DB71C15931A95E9B119944DE15A8403BB36650260D43B1296C35DFA62;UpperCasedChecksum:38A15FC7D93000C91F18D8711E136A6B07967CDA65F0C6CCA0722B04C7833879;SizeAsReceived:7429;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:56:21 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-networking][PATCH 1/2] ntop: remove static libs from dev package
Date: Sun,  5 Jul 2020 20:56:09 +0200
Message-ID: <AM7PR05MB68810540CC8A1AF2B8ABDB26A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM7PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::34) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705185610.364-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM7PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:20b:100::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Sun, 5 Jul 2020 18:56:21 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705185610.364-1-kweihmann@outlook.com>
X-TMN: [ISI0pmmNn5EdVkRi4IoVA4qk9j81lgsZ]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 199a0d72-82c8-4f0a-8e4d-08d821151b96
X-MS-Exchange-SLBlob-MailProps: 
	q+fD6XS3/UKxvlDBBZTiuEqn0eK9xQuRnyAoE2G5IsNjJwdqZYl16NJJGC9JAl5yEzDw2dqOeIWCE2uP/aOd/hc2XIoHw/h/vsj/hQUCTAd7hTaTqAOvcOid8cUB1MGyuJogkDsa+EDKjrvsFjEAMlAPywwWjWjuSYsyHsg0cQDeSfvqphSNxNtgk4nSVBeGejXK4iImndlc3dc1zhQngIiVp4SNCDkiNdB8Hpxix/+J+PY9u6pcG8RrP8CuwQl9tdycDglIxRiaqVFN/GcuMSYVuIZehNnWDf0devX4khFCEgMWybEl03o1WjZ26nULKgEGAYJFwPthDlmeGhyI9NGDlrDeGwlBsw6onjXXr6tA/tQVmhsVDMHNLcX8KJtz8dytJ+kJsmIws8eOqoodkK5YNcp23Pxc2//ywRBPuMAsUJ4r2Ro3wLtVCzWb5pBPWhp4L43H5/vj9M8hGmdAqlbgSexxLuGUTva6vssE4h1EA6GaU1KJgYK4on6zbRxYWs1RuGzxiksn0m+D/UE7QFRuPFIX1ka/PNF0HtwwREahNkd9m5z1je1FyelJ1KBEmWTKzCNAkBYIPOJaFFYqpHhfvv/8BKv+flYruFTHrITy68YoZ1Fg0asSObJ/Qy+7gAUtBiQlvE1dx5oaqa+KoVYnt2mNPuNk0IN4LP9pIzoIhpDWheSLLildTxkRuzwdlwhZpL5uK7jYdoyKpTwqeQ==
X-MS-TrafficTypeDiagnostic: VI1EUR04HT220:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j/TGaSzoW3gCS/ys8QPhIpAGs1CcNCapoLMdOFPilkl6CNYz4U3ydTvk2u8A8/BvNUpbGKs4svM9gkInhngi+ZNopgNdMwnRD+GlA5pxBeUDPqEtV7flfdKIMMJcLEwtjNBVh+CY7V9MTPAoe/hF+dnMhqEc6SjNo+Th0agAOpAaBG8WSv0tdDBtq5QS+DOfbwRasdaP1T/YGm5bVtngEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	iYpESMDZaoUYaytxnJvjNXP62KlYpZcQkEDylooWtQmz47CGw2l7uEbCytoihsXrIajMHr5GYeby4HdQ97r6U25m8q9YjAxqASsd78mtg98Vw3VGyxstBLv9nzXLyDCqR1HXFYkUXkEYS8OE8OLLPQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199a0d72-82c8-4f0a-8e4d-08d821151b96
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:56:21.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT220
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as they are covered by -staticdev package

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-netw=
orking/recipes-support/ntop/ntop_5.0.1.bb
index d835e399b..13a878412 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -138,5 +138,5 @@ FILES_${PN}-dev =3D "${includedir} ${libdir}/libntop.so=
 \
                    ${libdir}/libntopreport.so \
                    ${libdir}/libnetflowPlugin.so ${libdir}/libsflowPlugin.=
so \
                    ${libdir}/librrdPlugin.so \
-                   ${libdir}/*.a ${libdir}/libntopreport.a ${libdir}/*.la"
+                   ${libdir}/*.la"
=20
--=20
2.20.1

