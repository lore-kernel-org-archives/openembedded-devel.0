Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.54])
 by mx.groups.io with SMTP id smtpd.web11.42784.1593975466937680674
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=MnEHPD/z;
 spf=pass (domain: outlook.com, ip: 40.92.73.54, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkDV/RbQ8Hi2LYfdThI24wH9FXGUjtA90NbNFeAS8w6vhASAj35uhwjw86Bx/uqbfq6a11mDhPxD+EXB7oWhxGHDmrwTvU+1rR3KFRMQGWgth64B2RLosMIg0OLe0LvpYXt1EOUEKBkLEEOJ/xq+KYi2LuA+6hsC8woTI+YMmsrPqyIi3keH812+NTNTRXdCFiny1HQ8+MQYVNnKljapSaEdopgsYWy6wHcyXdN8ui0fVHAJYn4lrFdLeHLS0EUXLA2nWazouFiBW/Q/KYdX0d3Oz66FQK+cmpJ0iqg59Yb98813obNvu02aVD47kz/+uOf8TkCTRr5/8f1BjuvS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWtYUqveYLoGMnPDttKw9mpcnz0ncb7ijCXbs3nWAHc=;
 b=Hmsqhn06AKfHmXUjYBVV+UsOQiQeuyE4vzfYvxWsyyFaua15b/Kig/ckM3bregQzhDbicIPBF5j+P0gqP0iOGTNO5cEYuMhfT/gYiv/KX7R0T7r7Cf5RHaNRYw3gHHF8ixG/+iHwzrBCWbQGspWngIbQeC6DpsUJCrOzrj6WZPUTJESXnx9LY+pZCslp1RznjGXo5Nr39E6+WDvEj5sN1026HvQ0bXGF5VjnAJ++H3BmDxBaKEEoBCuMxNUJWXIuSdKqItJjbwklyPbiSh9ebnRJ3OcUGuvu+83FwjlMUTHX/WqGS/4JvXErcRQpQ3fif2DbhTYw/dir5VrSae5kBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWtYUqveYLoGMnPDttKw9mpcnz0ncb7ijCXbs3nWAHc=;
 b=MnEHPD/zXXIGgAKV3gkSd9KMYICNEeLnWubI4BjldL6Fc+LWZNyrTvzZZu9hk7fVywSulC3qPjbsKpDUPE2bcfnaQrvKdB/sD+K8j+EcVCTTvfCzUDaHHnTF2760uEKhW4W/KMEFUwjaEem7GHBsOaplRdkUgbae32K2WZmMhEp/KfCjmwqhtFjbIUiD9gKfuf0h5CQZtWMDzrvPPhRFRPw1ID0g7g/7JbL8hppUMYR3OC7cD99qnlQc6R6sEfuNB7aF2N8OkdMhIvaVQ5Y8ZrIaAXnoIPv118gz4h4CqVKbKcAZtyIVgbA7x1vrTlU3k7fTpbL8RpPcUZhRVwHvAg==
Received: from VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::41) by
 VI1EUR04HT220.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::141)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:57:44 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4d) by VI1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0e::127) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:57:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:688279461EB032A6423FA110F4C8557A3921D10DFC18A2245DFD52CD85139EBF;UpperCasedChecksum:2A9F94796613BFEC87F7A8CF00F81D9F228C0EF5CE512BFE705555972377ECFF;SizeAsReceived:7386;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:57:44 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 1/4] postgresql: remove vacuumlo from contrib
Date: Sun,  5 Jul 2020 20:57:31 +0200
Message-ID: <AM7PR05MB68816C6866844E3CC6467AEDA8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P192CA0036.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705185734.839-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM6P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Sun, 5 Jul 2020 18:57:44 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705185734.839-1-kweihmann@outlook.com>
X-TMN: [bVfxfp2hI5WrCPaq1PAViGM2+UyiyTUw]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6900a223-32cf-4dd9-457e-08d821154d05
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiRpLJNj1ZiGHh21Av32QMOvyYAI+aoJrYs51G8NC8OSPZ0qBUcEVQE4Z1jKRX+uMwSMnRPaTkvIosjgmyf4D+0KzXZ8K+uE6B8kg9ddshWigRRR0S4f9stX4MZ4MUOC2ACRjNaO8W3stXnI9e7o16YZQPgth0QMIE0IQSpEl8eQ3jX1bNzVqrWa5H+RTGON0/UsPlfHdyY0ZvzlpdM6Pxk5rznlFnmu57Ak4fInqye7MzlFTBM8+3XkgqRyK64dw6ZKx1S3MwgTAUoZGrKqhTV+hI4Eo0RAsSoMTFdBQ+K023Hk3kG7A4HsM7/bVuqzsiviNg1XI/NzHm5mwZMxD3D1U2kue6qi7W+ZbgoUwuUXue/oxOpeTYe/V82xrZotnj6yvE84D1G0wqDtGbzDrk1EKoU7b7n79Rz89jy4lEg6/yy3R/+n57jd+AzBPfYZ6AmPbvN1OwWwCFCrZLaV6VtwlC4DRSLzbZ66wqqIKSTTFMxxMKP6st3hsCC3ZngU3Ugxh4yjZfO0GFZq6iDJBGkCPY3ccjd9llwm2KdW1Y0zID9SKwp/v8xhOodrz+d5h9jdGpmh1mtIn9IBtcllzibygPM8e+QcXY6LNWDW82Z9gnfapi/yqs9H+Sf9/01cXepAOItSo+3d/gnpQ0M/ZVwAI7zQqarQ2w6A5iejjH9eSi8MmhMndq1hpmTAL5ttCAcHqkWUd59O3rwIGjhd/rSi38NeL/aEPjVYkHLWK9bcGhYOLfLO3vh43HwzcA8znwE=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT220:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2u83L6RCmiG14z/jEnANFEDLG6JHenxoKwmTpQlSWAfoGj9aM+EIE39qy0cXWVah6CJ5p1LO/SNa6WurXCy4JH0U3kQjKIK35aCjd5O1S00RO7gKahQamXgL+KQuPVgFAo6S88WxyF/tCRPM7hCAdovJ4gaOlAzT67pE3xmEkYvJ5lFWPtUvqEd2VYcG4bgTVk5xaZ6B/qw9DQA8ylxDjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	VlZ6Q96YN1ALarfJ4AokfGPvdJuGLL4VNzAt7873/mH/6DgAp8Jn0ctjHRaMS9xoE/PJPGuoJHXgigKDBaTuDIM9vglwb5bjWSzSfKgQignIczheWtviV7GtmLoXr0C2j/R+kGsJ389/nbsVWux7AQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6900a223-32cf-4dd9-457e-08d821154d05
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:57:44.5007
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

as it is already packaged in client package

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipe=
s-dbs/postgresql/postgresql.inc
index 5b20098a7..54ccf1fe7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -310,7 +310,7 @@ FILES_libpgtypes-staticdev =3D "${libdir}/libpgtypes*.a=
"
 FILES_libpgtypes-dev =3D "${libdir}/libpgtypes*${SOLIBS} ${includedir}/pgt=
ypes*.h"
=20
 FILES_${PN}-contrib =3D " ${bindir}/oid2name ${bindir}/pg_standby \
-    ${bindir}/pgbench ${bindir}/vacuumlo \
+    ${bindir}/pgbench \
     ${S}/contrib/spi/*.example \
     ${libdir}/${BPN}/_int.so ${libdir}/${BPN}/adminpack.so \
     ${libdir}/${BPN}/autoinc.so ${libdir}/${BPN}/auto_explain.so \
--=20
2.20.1

