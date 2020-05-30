Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.3140.1590869553636260149
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=r5pbAFhZ;
 spf=softfail (domain: outlook.com, ip: <nil>, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5iHRc0cB/zFU9FvEhTq5CVC6zu6y5DlsCnobMn8blFQ5B52N8Mhr75LHOJZ0XLOVpLwVV6KZUAS2ujnXM+3DYYGrKASSydRxwmyvCOeY3ot8PKH/f9UeknDdyaWCD6l98gayMJsBfBE1PWUzyQ5j6DHP/ozPSVkOfmNboE/gfr5ODNdFdujpeo2DysQbVLESuUvanSjh1Px1AyUp+vJmsJrzQ0J+9QmwMzQ8cBr6vktd392pReppXUp0ViS1gao0Ods897AyhrGdUv6zXurpebhvDmlbpPV7rP7Qm7Fyf2t0jnTZdOZ1Lgioz75u3yZL8KJj3+4OdzsGGK/mbVYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX/JBPR5Sl18cMNeEP6C+SZvke8gMoJ3MnPpRAzSfRQ=;
 b=S0wgkTYPkFlS91CAc8CI7QkIaUIw/jdCik4EvGqBJ+g7KTSc6NchISRzn4a4fWk0aga1DhtmzeOUIKc/mBPAr5W2Xis0fhdIA3j5ou9WY/y38bzVgJ0AGYo0+7GtQL328dzbBtfCKA/iu60S6Uk58ktgtzgVcZ9RokDN0947UYUrCi+7Po0ctb9pVGK2LYOrlBPo5PS/JQW+wNOLuYBtIwniT5egaxXmSb2gW6H/f5/tdF7tyvG2pzw5vNCOWzIgqg15jslsWoWC1yjT+8Vvxf/JTINe/a9oM+tNNeVmhip4zAKhEy11/dF9YgQuAeNUS4njDSH+yQHYT9JWoVzV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX/JBPR5Sl18cMNeEP6C+SZvke8gMoJ3MnPpRAzSfRQ=;
 b=r5pbAFhZEJXpP9DemLv7t3rp9HSN9g98LUZQ5nHGu/1PN/9JGrFWoa4T4mmKq6lU+bic0wlTmNuGx+3i3EShZybqM1iqRAxgjSXqX1+NQ6xSV+wlAMkPFqO9dtaCen84F5JWvJ+jeg7RQ+yHguZ4UXSpS1YwT+Seg93cFzHRumqwVaLkX1Ew9aS2PwNvwoQ/APV0R614WJAbfwti0DwN+kAfDADTgKA29Hd60L0hYpIPjSJqRi5/Rpfst5pg1sqzORHgYjd+wfjghL/5KAgQQzOPPL3cUpT09L++szVEdx6j5rw/GlhBk6PTEwWAXhNkhqvGkM5IyjDHT+QV15+VfA==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::48) by
 VI1EUR04HT027.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::76)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:33 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:33 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8556800ABF34CC41378BECF7CC35A855D8180D728648C0F9CBF887269950BA95;UpperCasedChecksum:033B5A6148909FE4D690A2F694F880C684A79BDE24CDE7A2954B8B101FCDB14E;SizeAsReceived:7596;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:33 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 5/7] passwdqc: remove double modify operation
Date: Sat, 30 May 2020 22:11:23 +0200
Message-ID: <AM7PR05MB6881CA34E0E5606D19316AEDA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530201125.9938-1-kweihmann@outlook.com>
References: <20200530201125.9938-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-5-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:33 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-5-kweihmann@outlook.com>
X-TMN: [ulJhzmXF5lSIXeHZAhvmSTQFZfMe3399]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e4040518-26b4-48b1-ce3b-08d804d5c9ec
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiSJyDCj7LTlCoWqgN/ZK/tjsjYauty+sTwG9LC04n8k02xuFMfI/bb4U/o1YSRZKEo1k8mLV43OmkkEtaFt7CEJFkw7D15wv07pxH8MBfyogr8yC6ZR5e0YWXzn+SW3vFOQX3UScUCmF60hQue7DmrwLQfr83HkCfQmjwO1PkWyL0t4haqATddkzAwNKXIglIVp67XemrTmwre0/aGYPPMlRad6a8LHwAd1ZssDPaYCRROV43IOsZ5U0+PpdO1FGQ13aqjxgSLv2LCV6kvg1fFmYowfGwU5HiO/5ksSw1G9Or/5u1inBTLI6n0aO7v3ig0UHM46uamxB78bMz7MmqAmuwe/gyGv9xllEYJOPbh6WLddPaHdyo8mek+5G1G38DSIR6x/1kpXrkDiFDqCBM+HyEVUgTlujz/ZibtuaQRUomcqO3RoowYFPmvGCsGlxPYkfbdwVKNy8FJmt34OeAzFRAsKYpBNbeCeC+BN8LpeY7ds7Qt8rd+1du8leedw26QvdZMwreNff1wWyklBDE5d6OYW+I1NAN8HwMmh6ZIFhht1+dsesz42AeXkRslOnc5wCn7SU8IjAsDV3Kwfl1FA2n2fAp/ihoGqK9fhC/pIHAzg3EmjVx4K/S3pPrB4zl/IOyHnrHSZ9LwAu+gJI/DktLDohuQl7e8vo07RPZaZtfHLTVSXmGbzoLk+Tc47HUh031LfH0DyLyW9cARG7l8Crv6sUDKXUqVpQ18Q7DM/igeQtEogqJPPJrNbCCAZfRA=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT027:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7rPaGbdjZcrM7T73kTIvmzeXkTSl/EyCh1Z/ehNTQR0Vk1G54PE/ulM0OGLEMH14K2ilTsMJWm78EYHLM0QOFMP6HSFhYVyxqQJy05O9pS6op3WczrNF14S8jRIZJbuc+A6pADmMe8zs/Xm0Q1xPNxWjeBCbjgOGs3TlIPaQZnYpFUuRRYfhdp1LFitbEb/ZhQFQKJe0rk9Ml6oD1OmNlw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	mJO6auVA31zS68KWTb2VLDE+fs1iMF7e0aFLcHKol2zh6Ijbd1QrWMEcp8QbwLzuuqHeyEcDQAFFo/bCHN7XfJfAuH1E0An5OXxjzeHq2/mkWjjFJhgjIz+TjH+47gV8sD9eqLWTMDgJVkWbT5Pdkw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4040518-26b4-48b1-ce3b-08d804d5c9ec
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:33.7788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT027
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

It is either +=3D or append but not both - picking
append to be the safe bet

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb b/meta-oe/=
recipes-security/passwdqc/passwdqc_1.3.1.bb
index 504ac1537..dd302506d 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] =3D "d1fedeaf759e8a0f32d28b5811ef11b5a=
5365154849190f4b7fab670a7
=20
 # explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
 # this package's pam_passwdqc.so needs pam
-CFLAGS_append +=3D "-Wall -fPIC -DHAVE_SHADOW -DLINUX_PAM"
+CFLAGS_append =3D " -Wall -fPIC -DHAVE_SHADOW -DLINUX_PAM"
=20
 # -e is no longer default setting in bitbake.conf
 EXTRA_OEMAKE =3D "-e"
--=20
2.20.1

