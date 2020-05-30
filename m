Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.61])
 by mx.groups.io with SMTP id smtpd.web11.3142.1590869557969683929
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=j+iqc+ct;
 spf=pass (domain: outlook.com, ip: 40.92.75.61, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwXPv/bUgPUks3saEOH4jei3ew85oVIWZR4Mu4VWhHoeKyQdJBtruNc1mYsFNB5yMaXLFs1RNU8sj88gBqjm8BgwD3QIGwBuHA3Rb5EiP6Ve3IjTf67uUhsccCKL3y1fY9QpwYB5MOyxplogjcPt+XJ4LOQKTzLpDX3pUEvtHEqXO8FiDvMAs5yd1asPv0/1TjWAR+wUciGW5R2SF4bzR0rwArOGr4R/j/vH6tIvpsWqfJfx0qx9juK7+PqVABH5+jinG9k7Q32SHKceJ+n2h0nAqaVYuEnqY5C7aCBVMw0LpKimwzVx2xllXoJXgZ86mdX0IlP+APU9vmYDRc+TqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NUvvEXRJTD+SwDHg2ikjCvoxjU4jOOTigJo+Jte0ws=;
 b=R+Q0SEITv7lhENCZpocGTA9Xi0Hefolivx2JrhsCEKKGH5KP0zxAdq++hLl9eIMIQjKT72rOzTjG0XhAtv0cqUTwXGM3Lh4xsNptYFj/fFk+JFz/bNZSRd0kKVreKFd43XWUrNpl5mmPOb8R+4MIqGp919NEV+HFemG7hzS2XpIMy/uB2u8BS8phtFSdsb06z0JdrDZd1871Tt6Aevrkd1nXd1OVh2zhyVCHk8dC+pjPE7hb6ZMcaURb1U+icerNkErkuMJQiAgXEDKZ5onupy+l/E16fXPeYlkHTmuNnZt5Yh2adGC+h8PakUpwJVI8TDH5Tce4wz+9/99xN26XNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NUvvEXRJTD+SwDHg2ikjCvoxjU4jOOTigJo+Jte0ws=;
 b=j+iqc+ctRSAZBZA3YPbdl/wuvFGW1W6YsSvJkkDC3qrIGsRswX+q31aTKRE/K0RTliCdsZ5tFAD37VN01afpRiAFNKU/1S3jpNGoajKFI9uM8XQi/PVRbnsMeGwwhBHdJfZsGg6hGTaOUxeyTB07cal0FUtkCkke048DzViq9xljkoKIMPIhz1geF/ElCyuJlOBJxVu6T9Rv8vDo0c7rJjYPUAVmT3eQ762RSYn+2mko2OCa48nJVf+0JxxUyi0wKTQJQT0T4AYXYjt1BJWdHEWQ/O5IjsBa6CGrWCzmgsZHw2kZcan35HhSqeqak5yiJCsE6KH7hxxFrd7a1Gyxkg==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4b) by
 VI1EUR04HT132.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::399)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:36 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:36 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:CD1D25E6C1DA34ADB518238AEFD2BA2C8BEC019EF0ED577D710355864CB714E0;UpperCasedChecksum:B5CEA4BB3E746964150603C6A0FE35A2E5C5798CA46C5EE10C14E07A22391E6D;SizeAsReceived:7583;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:36 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 7/7] sound-theme-freedesktop: remove double depends
Date: Sat, 30 May 2020 22:11:25 +0200
Message-ID: <AM7PR05MB6881495AE03AB26712309BC2A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530201125.9938-1-kweihmann@outlook.com>
References: <20200530201125.9938-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-7-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:35 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-7-kweihmann@outlook.com>
X-TMN: [ZtaVDYRVmrjFM3fHA5RuSTbFygFhQRXP]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 77dbffe2-0783-46a5-8afb-08d804d5cb56
X-MS-Exchange-SLBlob-MailProps: 
	/mB5ds43bCFS5kEMxJd8dMng9bnwQF0+V4wT7EkLCa/OZ2ZwqeuSbIYQHgrabf/yvznRlRnmEkLzewWk7x4Nr3skqmb7F34AltHl2I0zn85AFNyRECh7qnIZL9wvPbGjDWnRsMMSyvwXa5ARDeM/fiKDJRyxU+uyuXWF2A1sf5MJdPzU7myQ2KujOhrKAcHlD1arqzBVIUjHcaogfMwnR0uSRRGbRxc7DT8TStCKSCLFExR+827QF2Vi7GY2cdO6ngh9Gq3J+kgCKKeCIOmB1qiP12icEoiyctABqTuMwEmA290aXAbJKlC6ipgiQcM9qLQwfvIVILiFJAlSt3RGRI5HhsY5uGDbc/G8/bfv7XiQ/Wsy60gkwMe4btN8WRh9HqK0ipfmKNt9qnP/XgySGp3i78CnY3ELD76dUqLl04TbDL6AYuB7bBXOKhc0diYQomikIha3BeOQdQQHRe2cEj/esNox16U+vu04lHOKV6AqkwYCrSemrLrFbHLZAuz1XqoHn0aYV8uhCafp0/+YFDHP0bivucFg7JG3Gy9RoVGmAama3/2DunoGXjwS8/knzFr/iVYqd2oO1DmbdWsiLaxjjYJDdP8Eu+R+hDfLdqU1bfyAK2vFhgllgVK47ujOr9fjYOgAoPuPUye1TlO5bZs+Q5kUhL8KsY4dFB5HzslNQ1pLXyVCOO13Gymt3GF/wjn8cRyqbmdnWlfdkbmU81dYhUynM4Zu7RbWiZHJy78B1ARK5q9lRFiUWBMM1HKTRUsd5BoRhqNvUFEodzOiXeHvZmSsW5S1sSie/wIg6cMdhI9OKn29xNo0MxM2eMTL0ThPo8P1TOxgWjulYHy4VuXjefFT9iwROMyBW3yoL5KTgHmLD6Ux1fUy/oTUNbWEkn7peuC3jCNrqetbnrARkAeZmY+zzdbJrTZJ7pR3z1Q=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT132:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PRRWR4Ws5WUySYI+hwG8EgPatYYIDJmRS5vgYCZx6OEhuffcd69cEKb2javVnvDIj72X/yeXu+NI350XZrcXKlFpXxcmf1oCgcoXrOPNhu6DhvEBrllg5DtHIets6QNs/UwE3xKzX82F0MgSaDwH+9fNjzdPEi6pxVyOXYa/82kQfW+LV/gKTHyqahe+HN9+ba7z3eRYkdThVW1grbN1llaKvPjzVgnPDCY0cv+F3KisLdILXkKDmAJBgH+jp3WH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	961BgsWctheRyxnGbcrXNn+4Z9BGCT6wwzHWejwKIjrbYtCK9U2MgPE/0OFHG9P3MZDmuWvQ3y0U4skV2oeJgA+smmG6qGPw3V/avcorB2Li1AzpGyD1mc7hZoj0Ng1iL4bqWr6Tz+TdFZy9/0cNUg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dbffe2-0783-46a5-8afb-08d804d5cb56
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:36.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT132
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

intltool-native was included more than once in DEPENDS.
Removing all but the first entry

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedeskto=
p_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_=
0.8.bb
index 098b08d47..e4fb4ff02 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.b=
b
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.b=
b
@@ -9,7 +9,7 @@ DEPENDS =3D "glib-2.0 intltool-native"
=20
 inherit autotools gettext
=20
-DEPENDS +=3D "glib-2.0-native intltool-native"
+DEPENDS +=3D "glib-2.0-native"
=20
 SRC_URI =3D "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.b=
z2"
 SRC_URI[md5sum] =3D "d7387912cfd275282d1ec94483cb2f62"
--=20
2.20.1

