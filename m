Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.69])
 by mx.groups.io with SMTP id smtpd.web10.629.1592505182546102693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Y2yb6/zP;
 spf=pass (domain: outlook.com, ip: 40.92.16.69, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVTyFMYKOi5Far6E1dUuTn3UYyPRB/IINx0JWjKHRDNkTzPZSArFs1+a4MqUyeCh0re+77icf7gG9jr5xOIwCS4VoYNwESsQi3U5HZ8+5tiR4xZPcXFRg9X/QZa2yOoq7Wl1XHiXWh9qYpbViO3YtsmLmw+J0w86GnuFNhzvKs1mM/YOEPHfuHTFSkdMxcr13+mz4JXobguPJ02p4o+9lBmN31atGSFyD4fzvieudtKnsgt22t2M34lFJRwTR42M09EWh1/w3hEoxuUj2lE+sNT1q3sTxQRySlk67HKREtPTHITOiZWxCwOsCFrQt3jRO2pEXFE1ld43wmAFlZh1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmOwZ1ejawwyKmX3oOkUFQOd/om1UK+IVtNMXAs0zCA=;
 b=VMSQHTYmf/yt1XV9VJkcF1QLBLSWhqSzQH/RYSfzF/e/XWiZob5j2VHhSWH0GMBFdJYOwzd6hG21akstmYEz4aEgsudg89uGshOFgs1DAd80X0lZ/MG7ZJ4RCFOJvLRwL5CSIvASjs3J1GzpRC2A5exxPXd7Fyus17VF0cIztusz+aADdMd11qxAFLVlZH44vLfGH7/Oe2p597ddWEbK/HDDQr+IK2gWpuhJ+Yn3V79UBwaxEO1udxY4dnpuMdmdD0dyfpCqc25orLXrzBYlq4wdsGnniBCkIuJWKmcT6pVk3h/Atrt33ki23IoyFuuUdQWT/YeBro+Vq9xXHmKzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmOwZ1ejawwyKmX3oOkUFQOd/om1UK+IVtNMXAs0zCA=;
 b=Y2yb6/zP6xR1bhLM1eKr9VItf+rZB1S5N9ZcTZ22K7KZ+HjPxqTHLB7RnO+/kLS3lUc49jJk2UBlm/mIq3/crH6op8RY6qrIC/dHWrYM8FSRt25uKvQ6KxBtJd3fNRuddImkhM4tCb+JtFTpnfNcOnXm2aW7j92gyED/joaWg7jvHoB+3qmKgyBbWAyw3eytDnonguMtn1xq0eXsvIt5ZyJaJESJ6X6pG/op/DzY5QwuHKaPHzs5UCJqUV9Y/VOTsNB4ApR/8PyBeMVVZLcPtsVcJSZuVml9iLNJisWZ5o/iq9YH7ehB5ywMoT93wIPeLzSYztlgEAu5qCHPTpL/PA==
Received: from AM7EUR06FT059.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::51) by
 AM7EUR06HT041.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::141)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 18:33:00 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4b) by AM7EUR06FT059.mail.protection.outlook.com
 (2a01:111:e400:fc36::124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Thu, 18 Jun 2020 18:33:00 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:057A55BA1EBC6E0CDBF6DA12A4FE2A4BD1A04DAC62F88D5BA9324A84EADD3BDC;UpperCasedChecksum:C13E0E2BD22B20009A7767A7EC9BCBDA32BF366026D551EC6365769EE8B04F9B;SizeAsReceived:7393;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 18:33:00 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-networking][PATCH] libtalloc: fix upstream url
Date: Thu, 18 Jun 2020 20:32:40 +0200
Message-ID: <AM7PR05MB6881492B08D44059442C71E9A89B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P193CA0132.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::37) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200618183240.28466-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.3.204) by AM6P193CA0132.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 18:32:59 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200618183240.28466-1-kweihmann@outlook.com>
X-TMN: [9MrEDUj/rfXN290vd8LSO3SG96iL/BEp]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5b08ae5f-3d95-4758-df0d-08d813b6073c
X-MS-Exchange-SLBlob-MailProps: 
	KE5ywuOaN5jxSVDMReybhIu4ap7avUnEU8ZBDO2BG4V38MZSePx5Pw4dLvvf2DX04Gxucbc/ZV+pZ5mw04uGaRjRZoSOkdKDcRulzhybwndT9ZKwAiWCaWHZ4vPqzkncs26oRXFX+Klh1gAn8rQE9jPXnQUJvq634lY6GEkz9v3FJ+EQleU7IWV45QcX0KqUdV0WqMkyPNDSKIWM3XIPnWRN1X/m9OM1Kn0q+KInsCqXYuYciw/LxiGgWCyxiS7lKtourGChJr/Dw9d+dgeUazlrbsz8bPDCsMjUlZ7bzuTZw08epN6vHLkQAt7/qHvE7Xh3MFPPZ8erw3bhliBLHWFMj6QTwEgNTLLC0ysU9u7CSp2jo0B1RI9ufwGR7dO7Fy9OQHsxB06ev1l0U5S2T5Apbos0TGv4Y1D+3Yp2pU5PFS1RRapPQFNHH7QRPi730gvLKWg4TIn9JChhYbZ46/mgIjDbFTXCv/PHt0XPZdkoavqQFOIU2hwdFjdGsYS4EyS3H+X4nGSvCVSvH3FZMLF0kMZmHvIr29pwASCPJmKZBmeV4Hmo2IEo/xz0f1xI7K4yyg6Jdylrm5pDMgMC+jb3UAhmBBDMVMAFcm7nyR2d2CbiqwQNdDVKZ9aYR0bCvdvzL0wfY3xcVl2Bfn12elZIGW4nNkf4GkwNaG0OE7LKsuR3nWY8Zf0ZI7SaEAD3NS9gNQ8lz/72q7HVvQO1VSGkmerOjJ8+DSHNbALAd2rdvojygJ5oABiTvPVrspH9L+hPqta0s1m9aSXvlyigE+whF80E1z1oQeHCYC96U24kwUfSsveiIMmZMHTVbhSSMCdddefWrW82lVFjRAA0481r4DUU7G34hHnfGWuSidYGjVY5pgAuy6+RzGJqNFvVfu/kQ20bPSTSscU96KGCyhHe9dls+WNAvjC2nhtcwdHDnAl4ul0OciAD6+/XBq8duQ3TyQZCAjMaENGwbTI/FO2PGwQ//+MD
X-MS-TrafficTypeDiagnostic: AM7EUR06HT041:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Da+kf5QmGXtAqEVuw005a92iZiN4zq2SQCHMSsatIwCcMByqK/bcUWiGGeZmEJY+WRpJaETRL4Fl23SLD3q1RlGkXJ81rXId+StjtPrhTAKb8dRm3pofk5aHw2/B7+oyJwLgcjNDjNjVgiwhOesv5F+4ZqeIZrIAYEb1RnAmPk0idlI1XVxUNndCkMFb8SuUCHwlBit9nEbYSwdaRWyKPFI0NcSMJF+DCKboFnHb6Jb5ZW1cN6cBT1/GyxXV+ZsS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	15WnbXN/PluDY371B5FRb4MLEcoUXNOMGH4ggJ8PTCcgqnrGAk99zbDDgK3RxpzSdHg9wg36WbA4k0MrsebGhPTIVwLJN+xCBPG/yhg40Mjzz3jVhcqx0UV4XR3HSOzG9ZeKUYIleEV3FPwd8dc06Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b08ae5f-3d95-4758-df0d-08d813b6073c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 18:33:00.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT041
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

https://samba.org seems to be gone, switch to https://www.samba.org
Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb b=
/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
index 9f8ebcc41..59deb15b6 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://talloc.h;beginline=3D3;endline=
=3D27;md5=3Da301712782cad6dd6
                     file://pytalloc.h;beginline=3D1;endline=3D18;md5=3D2c4=
98cc6f2263672483237b20f46b43d"
=20
=20
-SRC_URI =3D "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
+SRC_URI =3D "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
            file://0001-waf-add-support-of-cross_compile.patch \
 "
--=20
2.20.1

