Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.24])
 by mx.groups.io with SMTP id smtpd.web11.3397.1590870433651423119
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=uN+xlIbs;
 spf=pass (domain: outlook.com, ip: 40.92.16.24, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D338tXWcgGD2Wa3fgAmc4cT/u815Uo/c4aPwRIO2QaD4zAWkqh1NvaHG0yOs+5E3to+9qhJLE1ip+imN6JA+s/kqGdn0+J5hzRTvPuf6ExohU+STPPTTECvokJz4uNbWs4shiDXdkaJjL9KwUqVWM/mF24s8QRurFowRpK6+Bri6TwNhIpDv6YXb59LpnnaCoC0ea5gqaBV+42ItGDrNQ8JBAJPiwB0KypSOV2hPwpB4De/sdiODEgnSTo8Qr251VFJd/J3z5IVsyEpNkDwRvzSjyy31PMy0GwNlxhbJJ9UN+rMMj16egy/GnBZRuwPjEfLN/C1vujrrduG0+DPnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rw5jIttG1HrBa15PZ6tTB2HO/j9XR1E6Fk3SqIV/q1A=;
 b=KzefqFotKe+tVTp9Qg5mN1PuW6CikibGZ2sqXTSmFon3pzqp57imX1Tvvje3iX1zn5ygUNUyKiXwHasUFsfZXPHq1SInprWHcOtI90jNpIY7kJhFCXn79tUvTQmLQb6H0yuk5U/T7Ms9V3e3WcR6DE6pk3Q6o5ecjueW++qOKJimHW5GRgenbujmrRwAmzIL39T+LBoWYojF4xGw/PZ1er7B4CQF0RIvtAfz4XC3gUxQcDyPUlF3ux1uMaJS36vyaffGJp0kHYvove+k/7qAUSCMNm1r6BVkHbHglzGOhBG7A2QYzHrUm/8dZUcs1ldBP2Ji4RO5Cw80ijdfR+VPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rw5jIttG1HrBa15PZ6tTB2HO/j9XR1E6Fk3SqIV/q1A=;
 b=uN+xlIbsM92jheU2dfo6UdrXkji1sLwsMUmhDG4ctKhDcWR3SnvqIZRstb1zn44yPYusY92LlQpXMsiiF/A97WtLLEfvgmJhikOLzVvbm1EWznuaNC/mZTANUhcMfc+xgoTBwS1JE/uxyDEuoSsEoe9CMWCoW2lmMtJ7FKuna8KMAsMDcSCBG4jcSSvO/UDk4YLAO9rpl2ekZsSw59Jp7lcVjIdqR1j5Rvtw+TB1i9widmTIVQvpB1qdQJZcbHkGpIqcEWv0Hm09IV/EHFsarIQghgVyM7cQx0e9f/ffZwODPkaq0WeROlTVfDiJVZUgt6MT34+jrdVu0NvfOBstIg==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::49) by
 AM7EUR06HT170.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::104)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:27:11 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:27:11 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A83C62250ADE77026C89CA969EE84AA30A321E3B756310D7DBA80DDF3A6769C9;UpperCasedChecksum:6C0C652A1266744C9EA1413DD43E9C0847DDE48145C378B0563FFE8AA1F67500;SizeAsReceived:7477;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:27:11 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-webserver][PATCH] spawn-fcgi: fix typo in SUMMARY
Date: Sat, 30 May 2020 22:26:54 +0200
Message-ID: <AM7PR05MB68810491690408A08B6EC835A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0602CA0001.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::11) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530202654.11851-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0602CA0001.eurprd06.prod.outlook.com (2603:10a6:203:a3::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:27:11 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530202654.11851-1-kweihmann@outlook.com>
X-TMN: [IHQoyosrXPh5A2sUcLA6WP6rZGlt+Vha]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4be2d719-5483-4a5c-dfb3-08d804d7d544
X-MS-Exchange-SLBlob-MailProps: 
	/mB5ds43bCFS5kEMxJd8dMng9bnwQF0+250RflLW6L811R1idrEARku+gQtjKZw0w6jNSl74M1YN4XO7GG6wZpwtkwtwsFTiKzxLQbCbwz7W6rdSNTAKHbPeJRakcgH8c+GvmKnKpgyty+EeZrhG5MUvU1ZPNQp+PWBiZ5Y/v5TLbLGj1w9aFn5O5+Iu5TJyDWa8EObrblme1RrDsxDQUX1H+5jtaZ4nMhIhxdu0YSSY0ktO6WwFGUoOOkLnDDokKDxbBgiyBQDNREyHgzxyyUfKUOu+YkpMOh2F3rOjlXunxgP/HJN1MeW0mIiWsg5d3mn5hLx2WPfzhF+P5GFbnw8MHrjDR3IcLXJiuonXRePR73xaxdyBiNKs2MSvPcHtSQKedKO/y1ubFKOcR4LiZDpNnilZfkJIZy0uZPjgwBK67SWO+JrrcZdrE0nTzqfNUhCX5i/aRiix/o1Lx3q9WsJJi6GSk2AthunQ0ivTQauZxlgg195jQLbZJ2tanq3+kiJ1aCmrKnuCy9rkARCzcYFVi4XL1/VPAJ2NI9T/ns9/tRHl2VgjpewFSVK0UFT0hL+jNx6DBVz4qYwZ0xX2ZgYsZ0rYGDhnw/TTO7eeIpFCbBYCF6WXEedjLKlMcbD01pDYHvElxPnW64dwVt15MP1xjueVyiv5kij0bWcNl3xBoaXEg/MGTVvedFE3bT2U2kp5yY/P+u4b2g8e2oqSbgQ5tIALYJsQ+B+c3/YfZ1zM44q958C4+SHzpDX1Fo69gubOMFrxEaPrb/fUEWBd5SuqyNkpoP1/UTT8AFGruDaKjcI/Sn7kVCosr2phGVJicZRYouE5m0ROUdf4hzABDuHy3bMISih0L8AUfAD3vxqoBXAiH5+yOBkMKKMtEjE3533mV+tQ5AGtYHAl4Ka+RXSQdozU3FrxKEPGD7vDrqk=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT170:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9EZ4qoO//buPeoFRcXIIZ9co6z/UEY8Yr1IDTSOU+al7ZlKOU/TZuPIRp4UY6qalNfBjQsHEbfWe9xtIxflYYklQJdkpOB0NzgYJzjbxWHTvT8phASsKRyMcH0xQxciJ32B1ovASrnVAi7DT3Iu5HrK42KZRIpgQ+LHVxyM5if+gfc7iSeqKOFATdw35dDUKZCdkxJzojUHXtQs0iqrrXp8vmIoRaoNMgKcDZ1KWkQYYY7/D2rvtAl7HIY6RIT/g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	8KOiPxL4spayvnUFuDNZn7TbIw3JcB/pyvzV0kX6Uzmk/zIC7D8B6Mn3nsi9nfgtXPQ5B/BbaGrOHsMpxSkN1TaQzAr9kT3QywfKjdJr6UTQIVL7mWSc46mZq0h4hUewfXXcrfLSseazhqSjAd7/wQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be2d719-5483-4a5c-dfb3-08d804d7d544
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:27:11.7805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT170
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb =
b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
index 1d66d1301..808d4528c 100644
--- a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
@@ -1,4 +1,4 @@
-SUMMARRY =3D "spawn-fcgi is used to spawn FastCGI applications"
+SUMMARY =3D "spawn-fcgi is used to spawn FastCGI applications"
 HOMEPAGE =3D "http://redmine.lighttpd.net/projects/spawn-fcgi"
=20
 LICENSE =3D "BSD-3-Clause"
--=20
2.20.1

