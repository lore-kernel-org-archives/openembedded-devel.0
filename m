Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.53])
 by mx.groups.io with SMTP id smtpd.web12.3426.1590870236226091518
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=oqGH/rCr;
 spf=pass (domain: outlook.com, ip: 40.92.16.53, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0z9qJh4BTd3U1Lj5GUu6A3C8UdCAAolrXcHWuH+BkUE/g01OrcL3INJwD+gZMj/S9g1HELDWYAKOfThp0IhSjULM8BdHT5zWfQI2e1Kfr0W4XB9lsYMeSayROEjXeAWciyh2RVxsXu/AI7XFmnYC8/qPrbg0CQQ35HXaRQpFIIgtOZjPuriJ5GOQGb49JBTo/OAF3UUzk3lzVVlyRAZPntLFwiEgoDx8BFnoNbbyvPQ55sjPwGMLo55Ii4G5jBSCJG5013SnANBu7po9bzON02M7xt/0FjBdB2oFDHhlQlUAkpDjfyDZp9m3+EW8sLvaCQ1Lr26XndNNrFfMsv1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv3OFmwZ0muxZuoFhknP7VXvEc1FuNLWLCmnKTopBxA=;
 b=QJkaN7nhBiTfgtDYefayLFcvLm3GMzDjdTLLi8Xx29bFIv5ddiZMUeQdBZldUBoYO12iUDE6i1LcAgxH6abWZGmc8cw0Msud9VgS+zPRAif828keCKof6Azu7ALcpiADAPI55nUPDx1Y0IK+bGgpueqe0Lm/Qlvj0MBrAj/+yFW03uVnA4kgQylbZXvtguAupJyV52qZeXBAjgAky8/e+ejvph7/RK/zksm/nS9K43JZvRXSQFMa7CSPJB0OVJDEWpPc+e1957wOCac8gIwZj5YfoRd08OjDlGSdf6DesXSoMoA1qi94DM+aY1Ga4amtqNeFX+YgLaP7iWlK8Lv15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv3OFmwZ0muxZuoFhknP7VXvEc1FuNLWLCmnKTopBxA=;
 b=oqGH/rCrlPOSKTgTmZsqKdcOMzeJo5Jdm2WqR+UyOKS/2T8vi1DPK+k5VOGSGKqBNgRcPzNdbCaX97jU7woKs9x5kSZeYzrq20unz/aalaOUzn42meCDfUn/C8bLOU107KnhbTZbSXvilrv6J8yRaokabeEUu/f4jxN6H+g9SW76GsbC9tOFRs7YMDHaNuiPERi3lvhP5cJ2YJnwxEJ7BXOExQV3TluAHDeXXp4gYt7wmiqaT/12wRqixgfWo0MrA3iugU+ccaVCMuEC8DYF6cYtG1Ud/ygPnVSWKNgJvIg1Fst5uqMeY0BcFSX7+e6iaMULaVa911iyGVijLhOWzw==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::51) by
 AM7EUR06HT021.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::489)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:23:54 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:23:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E2EB2CC67B5519800DFA1E322BA0AFA4CD412FAEEEF268ABEE65586CDBBEB092;UpperCasedChecksum:86637309A98078C29E0BA1370CF3B772F6B2348242143606BE560EF465EB02F3;SizeAsReceived:7491;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:23:54 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-python][PATCH 1/3] python3-cmd2: remove double colorama in RDEPENDS
Date: Sat, 30 May 2020 22:23:39 +0200
Message-ID: <AM7PR05MB68815298EA274BF417CBCAF8A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::14) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530202341.11440-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:23:53 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530202341.11440-1-kweihmann@outlook.com>
X-TMN: [C8+eu+4egUMegHaYHjd+T1Cy426B1tEy]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 79fae0cc-e7bd-4650-2f50-08d804d75f65
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiSJyDCj7LTlCoWqgN/ZK/tjLzw9fvjI8B7ZDPG7aIy4QE8SagvkarV+uwycB+jEoA/Q/ARu0X8ySfa9nNIdT5VlM33NycRYcqDQ3k1jerYfpNRXOsh8DxjSLOKSBnvIf0m2455Fe3ylxjPZDWmVwWqKlc34pvmyTLprCF2J0m026+tpmaS8UeAjPR86l20FNoLvTXWfg3lxE+uHj1wWDsepUQc3LeKh2wAKw2u1UpFWQEEfjy2oXehjJLSfAth0C2zIeW9otXZaA9ZjgW88ZcK6lDEbUgrA1oyqu52lQtWQqK+wPpgCBnRPJy3g25f77uzlmsxcTKOL2fbbLvT/cgTpRx6hapTQNwQC+FYGqOUGCxmrzrwys3g516QGjSSzcFa15AIOsj1IWMbUIr+6hzWgz8mddzNnrQoIRFzRmSaHj4FWp5Ep3/hK6ftFmzR9hZJdbNA+qQ1fp23XviktGBiQL3if1J8uNwXTN2xgRmNJhAhTrDrj/opuUEG4iTx/il6uHlmdjcpW6fHDdf3SBwMA8LekJasZY4o0eL6wAUhDv6ZVucCZvPtJCepbEwpLMFh0vOLOYj5zWkSN0AdpOy57SFwATq4zqqzHXrdLsrY1l0XCJZa3oxU1tMRHNAjTi4Y/h2A2sD8eB+QhNCmXScDbByAe3RhugVJMlXENyaIs016DzGPo+Uh0K7oyDeaGpzum3SY4iquIU4CmCwqEyq8w0uhNnY96yoHE5QJF/mMK+SCvg8ijdvjFKnsiGb8V3so=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT021:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/E872NC+5awy9jI6MMDYSkFCQYExzBRoptdkRxnLh9KVV0k1W3SAeTh/Befu+Gz6mL9yBbWcHddn2CRenV+ZXSIdEnXtM6O06CImazB/RfwuyYv6eqMv2FZr5sqNRtMked0UGkmq/TDZ7Jl3+CCY97tZOfbSFV0ZPwFsXCZUXa4XCopFJUSNxlaYNqUqT1jyzsFDF0PNuIxxn1gX/+Eb7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	y1y3ZTMR0my6a74euW7l9Ptntacc65x5QyGB2dgzi2PDOST6fsy0+egj5hKZur1kDmHGKF+yqQNi1UgJG/tpf46t1j30imc29fRJVKZEJW0i2VGTjJKy9cgXMMtkytb1c2Hv6yv01cXhEVgdRJMQSA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fae0cc-e7bd-4650-2f50-08d804d75f65
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:23:54.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT021
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/m=
eta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
index a2bf0c45e..803ca4a40 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
@@ -14,7 +14,6 @@ RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-colorama \
     ${PYTHON_PN}-pyperclip \
-    ${PYTHON_PN}-colorama \
     ${PYTHON_PN}-wcwidth \
 "
=20
--=20
2.20.1

