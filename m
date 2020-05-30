Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.100])
 by mx.groups.io with SMTP id smtpd.web11.3502.1590870810422078962
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=BCssjCAS;
 spf=pass (domain: outlook.com, ip: 40.92.17.100, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL+BkR3HcqdZ6K7HY6qoGpq1gSFgQG8t/SRndsMcUlLdfYG9xm9VF+6CLJMHstNMKomlDfT9BgdloGZSmlfKTq7xCVOmfbnQSBboj1zMDe/iQMYPdTGDuRCiXqWK5deelIj72jeLyL+fFvG0rf/O23JxLqFdI8NOCEhg99uFIOlxFFjXCGErpKzJjbSRb1tgMcuc0k4LgtYyJM3tAoRMzga84Zano44k1YeNoXcTTRB1SrjuSxPQAIn+a5uRE1FTOOuDVAjGMEucZrtxgp5QumKDyEvnby5302r4g7dCHBjgyINhYzL3eic/Qnma935kfo2YD0ymmvVDfTAtXjwDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj07lMsuVD344iBz1OoUVHB9eTy3vN/0kBF+3qwbJ7g=;
 b=gWMyaCWwCMDZrv/8Po/MwOJrrf5EqpTgPfwouR6Kopimf6vVg7q+FXTTt/CwAWu1zqi8Xe7WwFj2XaQJCSvDYVlZwCgjNbFM6X4Xy9YpbMI/Jg4FxGeH1eo7spU2KLKpPFUH/sOXOAnB406XmUG/TJPwvrYj/zD2l6YI400LI1H4A58dl2N/f7EUvn5fTvcs7ocqW1Vz03gGx7JMX+Dn0VNkKA2ZrUEUUxJ2a/0xzpoakpdNTJGOK55FcCioAER0XcR7/Ss/flj1WBB0pNfu5JGEanU+gtWeccOIvwu2hwaxG5M+CqIzCs8aMK6ioRdVso5gHzv72N+P7ZsJrXO9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj07lMsuVD344iBz1OoUVHB9eTy3vN/0kBF+3qwbJ7g=;
 b=BCssjCASSs9EW4gTjhR677npXso5oBW5iNq3hXs0URFCr92shHq4R/jUtJjU/AjJ1of2nXm96UqkE+CvouILRLt7BATGRMBTLlosCihnHPcd+gL8t+XsxonjH7TgmFu3UsNf/S+KZgyV7gwdZS6PNMMzyYP3Rq43CODjamwtqsW0dkVxM7T/VJ1XSOfTfchkcLfrmI40e59MBihWAC6GUA2Ufs9hE+bKaSXw/S1h4qPlL5Ikp7WmjSZAh7FQOiuNOeMSu0zO9zUvA0QyVdOtISEoJIcwYzvdDAugL8832byTkr6WAjYWDx7VSNPOAhp36cBNDgupdQasuZEXUwnwXw==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::50) by
 AM7EUR06HT019.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::454)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:33:28 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:33:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3293572CBD06404C7A82D44DD27375961A97FF7DEDC8EBAAFAD72ECF2136E3D2;UpperCasedChecksum:A11338D718394ABF8F1BC78D6443BB8ABD8046DA2D6CC0A5DBA17DB50308F3C0;SizeAsReceived:7465;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:33:28 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-networking][PATCH] proftpd: Fix typo for SRC_URI[md5sum]
Date: Sat, 30 May 2020 22:33:14 +0200
Message-ID: <AM7PR05MB68816701227864E520E1BC98A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0601CA0027.eurprd06.prod.outlook.com
 (2603:10a6:203:68::13) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530203314.12791-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0601CA0027.eurprd06.prod.outlook.com (2603:10a6:203:68::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Sat, 30 May 2020 20:33:28 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530203314.12791-1-kweihmann@outlook.com>
X-TMN: [breccY04oXN5J4w9d+3WQGQWgiNaOJd3]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 56af6aba-2473-43c8-0764-08d804d8b5e1
X-MS-Exchange-SLBlob-MailProps: 
	KE5ywuOaN5hmCfBDvSaek53LyH2iVPSX7DrfhF/G7S7ZRtismZyh08nST89D1XOh7MBrJi4g+9UstUcnEXCc/zlo5cACCkPLEHUPImI21UOiACmtrOrvLtMHCINy04F3lw+OyoH2gSO99PQyrDqFAqbRCghswU62Jchv930PcbSkNCVUyCtBAU5gBVB6BO5xRy14k+lP8kg4qvWzL3fxV8wGBmf7/7zI09HUOZGHpiDONxF3hFuVSOyhEgoIqgRHcqY7dB6mMjETVyMxOj0raxdwdt23y+8oRHrzU9wD6q4y0X34heQed/gVfrk0WX2YUbMwOzhkVjR+oqe6qHENV/6lUGghTsUtiM+dg3Ro5/kiNjcEdFlYEhhsIE63zs+wVzVmz7hcMfxe5MIBrxvyhHM0rX+Tw0Ba/Nyot7UOoKzPxNXaZzwwIgBkR+xVeHVs6bWH6E0x1CT40PbUIbCMbNvVl0YpUV6oh5GRD6LZXbbGkr9r7+6hefvQyx6apSNDF/C7rv79uZ3dfmtEvUeVXFf4mGtkZbhAhR5O1sdz2BiOT8Q7p/hlV+rPQ8/UuetNjasZYGTpwqejSXLG4vkLWavHifz3bn4Cc3nrNCZGigDYfbLInTCtcmKCsYMUHaKzaYVueChLEGba4hUIwwqqbIAbiihTFpviYSjyGkKp7hKa5tppiEADze3MZJqkKWwxyRHgRiRzQJz/Lm6//P639YVA3rAt6vMj3HvJvUBIAaP2jEl2V/6vQJlFn7rEfj7SBzJLTmIO564aGwRvdWHD/P+Sdx0BnE4JKcgIqqwkD4G2vUXg/YUxpto++gjxeWni5EWJuvd6aIUhSC+JhqDiWS/dsMZGUv2odAEfOtad5NjZsVCzcPo0wrGKrAb1sQy/hG+U+bgJ4ZyKs6ld5v3dVz4Fw8Qd+oj91+H2Cspf/mWP8pOLD84zxA4oi0Vi+5zlv8jdQNMC343Nq9jCeaP6SB2t4wUXl4lW
X-MS-TrafficTypeDiagnostic: AM7EUR06HT019:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xrMFSS1o7HXJxIKn4WrCYVVNuUR9SvZoknyvoOeFQrhaqtWQ4xUB/dWSLHZ2j78Rqu/gvQqiQHmnNDrCXOnmGT7iftglRHFkDR8Idp1Epd1DTyp+AvHA4Brv1n4sOU4qDqWb1Su0ybOZqRREsWceuVmxBQmrfL2KQLIN5NyMA8Gsg4A85GOQrZQVkSCD659tmOcw4e683kplKtNyr16EVP4yBnuvEX8TqimsaEqSj3dz2qZxbxFROgerdEZ4WCXn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	38lyKY3X34VbL/Y+RxIrNZIVg3TkjEVf+8U8d6rIWA0LvvbkCQJ3bR8oIgMAFU1m/IksRk8QI3ivgXXUWhIURklFogrpqdJoOLTAyvXAeeLz0XeDWlKGoJHeNTOcHR+JqkH5pBkVRkF+U5hvShEXxg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56af6aba-2473-43c8-0764-08d804d8b5e1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:33:28.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT019
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/met=
a-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index d5bbdd374..1e4697a63 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN}-=
${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            "
-iSRC_URI[md5sum] =3D "13270911c42aac842435f18205546a1b"
+SRC_URI[md5sum] =3D "13270911c42aac842435f18205546a1b"
 SRC_URI[sha256sum] =3D "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc=
541b40e152ecaf"
=20
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
--=20
2.20.1

