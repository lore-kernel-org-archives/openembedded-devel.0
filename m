Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.32])
 by mx.groups.io with SMTP id smtpd.web11.835.1591131246113822584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=bnL5dLcB;
 spf=pass (domain: outlook.com, ip: 40.92.89.32, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRt0KyZI8hgb1t/9/jRnFJyULc+OCOw5hWCGarZdo6u48LI6unMOpZ05oxSj0Nqz7wUD3Oi3W9zLnoyc5dB2o2uyRNeJsnXZ1OKE+z/b1lc9WPsgrz1wH7gPRQOu5v3494+MhQajgfSXb8tK/MEGYSdyVZjAv9W8lZmk2XkBHY876O1yj1ebIdPJ3bPfWFZER8z7wAjSNzlxqPSEs/KF/7isYSWr9N9zZGcXzJcdH2BLY64N38ueA1FHDWsVR37dK9N/Hqc9rGoVMlm6ciNyX9C5WmPHVI0Suc5IGXXowgYOqzQrW+QMZwP8yaTBlznm0slywEhKFNadYRjAummkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXGgmPUMb4KH2wFsRXYHIW7uJbS+c4uWsm4Y47gXkFQ=;
 b=WU6eip2u/cTnnepBSorinsGq0pg4J4l/3isuHSF7mxvZi68RQmwPO/NxxBklrqvB8avGrF/JEZJQ8ZFEHawMRlR4+5q1ygo4OTGhkrVHikVlRUQogyDAhqIBjre5+VKosr7BdCCQJ6wMY0LQD095Pds44yNX2Tqe3TzfcEXnc5+0yWLFfSkHMwJFHf0bi0e/ThLE+23eoT07HUu1OVjiESO3ing0EstJ3v3PW1ZCUnCHa7Pd/VW1sJ2276Fuu4qx9pe9Xhm65iXgR03boVJQhdTAnHlX+f5RF73IHIOZ4u8ATCNsG1/0OoWQS1bCpXWDLAyTq65ab4KZsdVFLyW2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXGgmPUMb4KH2wFsRXYHIW7uJbS+c4uWsm4Y47gXkFQ=;
 b=bnL5dLcB9Gku6B3vRp+6AVykmzVShIJphEOYUFItaKJ1API8dt9gn4aFCPtvMyfBCzJOOy6eu/9jIPXqu4DxT92cLMhk3BPfFTB591VWkF4ZVRen/HAEfnNOp9o7fm7wm9sHefi8R/uv31IJ7zxyH/t9HTEcK3WbeST+rKuKKsP5uMO73CATU/CTsloXeu/iDyz+meJ49Yk8GSISw52VVRvIiiW1rKHRYtDg8za1ECDMy8Wgi7w7Qu6DZRbu0934/qxcfoJtQiLvsgIpeH47hMxL8eFALoeV5el2ZPuxc/CLlkpPoqneVJgVbcLDYZbiFIwKtnHaY5wGC9+q8Zetnw==
Received: from AM6EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::41) by
 AM6EUR05HT159.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::385)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:54:04 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc11::45) by AM6EUR05FT060.mail.protection.outlook.com
 (2a01:111:e400:fc11::236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:54:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FD29A2DB03A90BE69C9277F864A3F3987C16D5AF41877C36CEA7551B0098AB10;UpperCasedChecksum:5BBDC21FCFBA60F0F273986AD4BBC3D14CF098A0E1365B8C1B2D87F337793E67;SizeAsReceived:7448;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:54:04 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-networking][PATCH] netkit-rsh: properly append PACKAGECONFIG
Date: Tue,  2 Jun 2020 22:53:46 +0200
Message-ID: <AM7PR05MB6881C30D1B629A4CBDC39E88A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21)
 To AM7PR05MB6881.eurprd05.prod.outlook.com (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602205346.27764-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:54:04 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602205346.27764-1-kweihmann@outlook.com>
X-TMN: [A4k/S575Ze7nZGde/hmKH1fpWulkPEgk]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d667b4d0-eaf8-44ae-6c19-08d8073715bd
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiSJyDCj7LTlCoWqgN/ZK/tjeJNmbuPJc13E6jf3TEFcXm+O7qmN9niqPCJWfpfix1JV2cZ5Xm8epzbRC0VJId5hashm/yX417GNfsOS3Gsittif7Xhg+CQsAw1mpAzqSJWV0+/eiNWumtR9zElcN/AG6Rx+g/GGWUg+giKfAAmw4G14hnmBNfSPOmnZnizwi2JfEo3AuxFxQgf7K7x24vrKPnaja3xnhrRpmNZfKnSuQGERpzHAnZ2dKCfZNHrM3nvWt5XyeCHjtOIN32lIMAfZe6/fTXTACGzhBt0JxLjYoIH7BjEkEwxy2bMixT3AA/+imiYBH28vtk4lWP/l+35WBN20pynlDMP9rlbMKg3soCUiGxznbAkq8GuefsfLYFFhqgxUSAlrHTCR6nF+ECv/52GkyRQX2BAxF3VvOEVQRRc8TgsvUvk8NdXX8wjdLb6hy0Qm7JqEmShBefI+hiOiiGMXshJYAxGz6QH7Uyj4vC23zwtgLVBAtEPwupV87204J/ASeVZGz4dSuxtwbArvAMj9yaMwsXkMj2aly8P18eb1HcPPuColaDi7yy9bAd5uk9YntyytkceQ3nkFLow0ESSTEs4Xqc0n2OSsqiV6HkrTvTQzUuirYtNLE4bLTa6Nzhfx7zJXuYI14mHkxDqAf7J5iwUlCaFOeNf0oZekSPvyYtOBNvMcT4sJBvEeeKMy5yAul0kEYAp+kE+9h6R0//elZq3nrPP5Fadl+SNAXx0ZvZ43aAssySAjRGujd20=
X-MS-TrafficTypeDiagnostic: AM6EUR05HT159:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+BjvRx5327JuGPlniJGZR8yN3zXG/MtJ3+ULToBMAYEKlIjTTHpIH23RU96bCyTTir85g1XwK7s4rwT5RENHpPWGnHqHsFFBGI+cBkL5Qy/hT63B9xbHI1LPkOzgqpnEoT7EwZ7SO4cAaAUIeuRJh+CeiCbTfpdoy5BcGaVVYcQXfTvE2HTrmsyQdujxlsAxiN602Rv+DW45mnmGkCMTng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	bTEjKpNhbmzqWL5aZBDPq05mpYwxepWSGDADeyBh1/haodFRbmy0o03N4Brp3aqvAwmrY+PkSJ5tHaNga9kWAerxDpFqhN/F+4tFrhbcw6rP5fAr0FAbRucYdiU39+kkELTCXYRA+8Rh1sWUPpCozQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d667b4d0-eaf8-44ae-6c19-08d8073715bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:54:04.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT159
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

As ??=3D assignment will be overwritten by +=3D in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Using _append instead mitigates chances of accidental overwriting
the default

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b=
/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index a6716d06c..f6c05daa1 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -37,7 +37,7 @@ CFLAGS +=3D " -D_GNU_SOURCE -Wno-deprecated-declarations"
 LDFLAGS +=3D " -L${STAGING_LIBDIR} -lutil -lcrypt"
=20
 PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)=
}"
 PACKAGECONFIG[pam] =3D " , --without-pam, libpam, libpam"
=20
 COMPATIBLE_HOST_libc-musl =3D 'null'
--=20
2.20.1

