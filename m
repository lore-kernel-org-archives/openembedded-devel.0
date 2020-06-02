Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.41])
 by mx.groups.io with SMTP id smtpd.web11.808.1591131179000419196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=feGNMQr/;
 spf=pass (domain: outlook.com, ip: 40.92.91.41, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWUUO3sqOcBJJJTw61JJK9SSOtVSK+S05IshITNXd3jP0C54OYONDXnlc3oNgV06RK7xlChJPDDCzxPiircOSYb77px1ah7nrvdpSlxBY0wem1grg5HXoNxYtkHfNPwD2VfcHrNO0uYy41FbR90BdpyQRiVo6bBqBAFQ/iLZPgKPzoQ+LkwzuB8ydbBFRNbfE8dceFu2asr+Ts80UwfEy4wbr1dK3M4lCIp0QReMWxyy2BYGhUjkgLbLhHGUFRf5VIxNoGzu/tws6A1YHSCkK1M7KOQxXxN1TLGNTzj7KqxHRwQwqyuiocPsSknKtuUwtb6ZyqvdHrOhYR1E+g/J+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwhNns3lXF4qyXiAFF4/n/oC8HPi8D04l88dAfE3sPk=;
 b=MWdgVgvr+zTDfneaxrMflsxgJZXH3NMdOV8duLDdgHQrR8Rdqi212rV6CivII9rn35fGQg8y2Zaz8Dx8jPF1EfaXosFhSD5nWQ6vnpWmBppWxaA2tukjqEcDYaxtqIj/YWX693KV7o5AomAxZK+Gvwd2/wfocNaR32co0rJrJMyRCyh/a7bGfPSqz5rueLNXJJgkjWxdXYUv/iolvzsxMgLXUNDq4odqRwKQ8wboL6qP5z7tFYbi+a7zXLUVBR90ehxf3w8QrObKWYC7OWOytokqiK2E9wL9jfTRvZjEGl+enwmFmyxmas6FOwg/tdb1VxlXseFhxclH+H88ygLtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwhNns3lXF4qyXiAFF4/n/oC8HPi8D04l88dAfE3sPk=;
 b=feGNMQr/RPw0t5Yiu4848rX9vS4lHyev4tkwGZ6mb8Nt8M4N4lHghN0tvJvCZy9Pq465d9PU+i55TK5rJEc4ECgt2jJnEOd9VgJRElnTPyYrRBicu7ahJ4bACULoh9zKMOLwUuxme41OlBj1UCYODO5hdFcWFBYGTcM4a1oSve2RAwxTgwbL9MWTQA/43XSCmqXIilomBFQsEU5Oz6vLOb2mM0epBQbiJWvCl6Xq0s4tBbopKTl9oeBBzltOd3SeBhrtMH8DhT1ZUliNkvRFyYiqEIXd29z2I9jlbI6dM9YVr5PWlKU0kSDFLt95troOISsxp+/xs1OU1Fq3bAiWBg==
Received: from AM6EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::42) by
 AM6EUR05HT121.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:52:57 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc11::45) by AM6EUR05FT060.mail.protection.outlook.com
 (2a01:111:e400:fc11::236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:52:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:94D3FD3A5F4EE4101EF7DE106B8AE5AEE794CE6A4F7F3B5A70A80E2CC450CBB7;UpperCasedChecksum:54E9D10C5620B593F7B11239003B73660F5EB782D0A4F898EEFFA7D76264C1A5;SizeAsReceived:7488;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:52:57 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-multimedia][PATCH] mpd: fix PACKAGECONFIG assignment
Date: Tue,  2 Jun 2020 22:52:41 +0200
Message-ID: <AM7PR05MB688175B28367F066CCF7CEF0A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::37) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602205241.27666-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM5PR0101CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 20:52:56 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602205241.27666-1-kweihmann@outlook.com>
X-TMN: [ZT3zB/AdX21dRA3haTObBdtR1QYkPvk6]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dc9b32fa-259c-4d49-2278-08d80736edb0
X-MS-Exchange-SLBlob-MailProps: 
	gjx25WM8ZNWDLNYE12708/BbGTepinvyHYPYiKoUIbUJTNGDgVjBrk8r6n/clIv+MxiLbNX8XWvTRjoLuR8nFn0Fy9w7EONIhEcGXYGqgpreJ4Nkq3+drN98avVDSEmQmvGvXtP8G4rkjP38J82FyL4B7w7dbljSf2H15p/ogZcEwsHmPL44119koP1mNRpyrslaipuHLwOUlrFF/Y5hvJtpWQ4E1Wb5RQmeUXGcqdykSHQXgzatnPRclnNP89QsoG5Xx6LM6fOCY+l0U5EX7hSuB3D3wVBkXJPH0+6G3AHHVjvbiuX7bMceZ/6H5XmKjsDR8JulBEpkK4IbY6+U5FqLGwy5E1c/wq8e8BEtTnAdlbCRKmlQ0e8QCT98q3BzRb2gEIF/uK6Xy0Xg+v2376NNZhjxXRIHkgSm393aAy2d16Dw7FcLYRTe6YE6/6ARs4kLpupAyJE4t9KRmmMQcs2bjkXWtzj/TywSjCsOwC2424uR5uAeI2csDpm7s8l+3meJP0TqOUN988TgxU6HiTFTppqaYx2oSuINPhtU4wXenCRw1YrOYQSkjFXmihs8ElTDjOft6BztBO7VQAZ9SNYFYsvPajSNZR5IN1yiBohrhyAMjoMYHAN92TAi3Pya8WWdnu0Di3eCRyopQI5q/VSc2dQN7/qI1STbkdabo8VKlONnJDIivHUGSFKVXgXFRomhbGLHPKJ3sByuQy/hNG6/JYTdEZqO85utLWAi1Qw=
X-MS-TrafficTypeDiagnostic: AM6EUR05HT121:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dPJIfsm6SwYZo6tiVmgZ3yfa6FesS3b4eIlxp+bpaylReozEnmnlYQLL0xVG/tk6OJu96One9LMQfmX19q65yLv6i+boFR3zLp30ZiADAiIVr86WV04G6vhPkHq27/0pFU+lKjh8GeMpGI81TtiHbuG2ZvBLvrBYuyP2cXgucCgChgHp2A7VhRBpPfPSXMUMSYKUK28jqg60RzrtuRRJ/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	vSB7Wj7Kq6DMIWdHEA0O7qHr3vpu/Foxsjo7704vesqOQv4YvD7o9Sm3lTXJOUf6vZVATBsOljbYgNNts3Zqqac8wA9WjMXbIRCvBPC9DPb46O8YBegPLhuqT8CODYRw1jhLJQb/nYFQniCRUq52wQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9b32fa-259c-4d49-2278-08d80736edb0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:52:57.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT121
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

As ??=3D assignment will be overwritten by +=3D in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Previously the default setting was just overwritten by the +=3D operation.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/me=
ta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
index 133ee6e79..818b9271f 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
@@ -28,7 +28,7 @@ S =3D "${WORKDIR}/git"
 EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--w=
ith-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-systemds=
ystemunitdir', d)}"
=20
 PACKAGECONFIG ??=3D "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9=
660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal=
 opus oss recorder vorbis wavpack zlib"
-PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'a=
ac', '', d)}"
+PACKAGECONFIG_append =3D " ${@bb.utils.contains('LICENSE_FLAGS', 'commerci=
al', 'aac', '', d)}"
=20
 PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
 PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
--=20
2.20.1

