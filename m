Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.42])
 by mx.groups.io with SMTP id smtpd.web12.28716.1604308422376174557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gtVLzZn3;
 spf=pass (domain: windriver.com, ip: 40.107.68.42, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGW4szZMxYvNWQiYCCq6OdARd0dseJ6ZWWJXncfXcJYu/6MBBWMyqK8/8hx8oJx/wlfBG+PLxowROc6O+XsHdsxj4PEVDXLzZYUDvcg85GLnXgr/HbywKrlUw8tcohGAUAIl4y+2miT55I/pKimqcvDrJzkElAVK7fb4gM+3J8Qk2i33//BgcaP053RMqHXfXgddX+CMWSmiMPB5mB9SYhoq3gMhZIrYRYBMeguEtFExKw0nt9ZR5GhrowUMfjglzNVDxpsvme18OPxIzPQ8ywFg2dHsGNO67myuGKeHv+i5oKuwg1l9HHT2vT/ZnKRp4vpO9yLeLeOPLoB/9OISQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spsweRghpf0jwn6dqwilwnLvX4Bvy5uc8+bhidh/yBA=;
 b=Pl+KvL2IwyCeKKOGHybQy/gSwSz7XWibxs7kY9PBoyxN5HrVJMpHaht/FqlnSOq6aiMtu+ZEk8W8g7sT6L9SEdQ6IDZhvnUmdgLnupbuL/Gv8Agf9iv0jXcXZiihyELI3jlK2VOS7/EgI6VMHEJRSJ6PsXEf1yTcfDur9PZniKAA9+gjg2z5OR/Pz7I6ZRN9KCHqUhlNgM8AKCmsvDb8IyOmMdCp3pTRzyLyCvE9G13Dgk20YeJdx6yxMpt9BAqDRe4cREWSMHovEjTuGumTK8eIpkXy9Tgd27z60UExNyUslZSbRYU6P2mHcFAF6GBlC1a8nTwoh5ft+/1YZAvo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spsweRghpf0jwn6dqwilwnLvX4Bvy5uc8+bhidh/yBA=;
 b=gtVLzZn3y8qm+QkDKGTj7+T58nMYg0n4W15nTzJOgT63ZXj6lJoluDbBTW3v44fiRR5P2+jQN7XroAFCWncvULBk3EgWqDlBPoiBiz+Kgx43pwg2+iBqgcfuBnu9plCpz9kN1TVukTNF0OE+KaUvueU6+TIUIQz2gr5eUvLO6jg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1856.namprd11.prod.outlook.com (2603:10b6:300:10f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 09:13:40 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 09:13:40 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] quagga: unify volatiles file name
Date: Mon,  2 Nov 2020 17:13:20 +0800
Message-Id: <20201102091320.15732-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:203:d0::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HKAPR04CA0007.apcprd04.prod.outlook.com (2603:1096:203:d0::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 09:13:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b860639-416a-40d5-cc46-08d87f0f96ec
X-MS-TrafficTypeDiagnostic: MWHPR11MB1856:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB185648356CD9B50B5E6EDAC8F9100@MWHPR11MB1856.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rof7pmlYFo4zrZ4DoaNLU8J+2KOkFNrYrV7BQTaEYeUeG7mwQKpo+S3MGFplf5a1tz8rYyRiAIY+ukMc0rFkf+hImBc3fer8L1KT8NCtIIXn7UmwGWJu5Ziip9LY+9sZToFxTeYDH/8Lf+9PKfZPg6D6QUK2bmCZKDplJguGYfFoRisi4thz4mthA0FxSE/p8FVTQ3sFJZ69ModekjSOkkkyHSMepG9bsJe/JvHW4S0fbZGPODbaQ3ny35+qj0QOCKTL3tj7vQOVBtq7VMKhUahmjoF39A5JO5rpW3dMflRGq5B9arHD2OUN2/Nic5EZZHxKdX7Dhe7hyxw0qhtV+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(346002)(376002)(136003)(396003)(6486002)(5660300002)(26005)(6666004)(8936002)(36756003)(316002)(44832011)(1076003)(2906002)(86362001)(16526019)(186003)(6512007)(8676002)(66946007)(66476007)(66556008)(478600001)(83380400001)(2616005)(52116002)(6916009)(956004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+ERNqAV1/kyRx7/ta8aPSxbgojhxK+dUvqIzjDJQt7ui5e4O0r1zl4+duup8VdCtaBHFC6OeNVKZIuXeLd7tjmAvf614z/gnsdJHIyMGroC1yNvQ5fdxjyLEBY9ogXypOabnZLWkW2aXkfTrMLNzEjx3jI7hkKuyM/7bMBfpffX5buN4dEcLKpQxkTuPNfaLQ4jT6JgTSfYyTeXnuflhc5OFttH3hD87mVnHMh6Gd5LvPtG6vQuRghuQkGbStQr6/S4LdFi5rqDrGBco63l9ETiKrSqCsVQ2yPJ5HMgR6nQeUK0M00uroOOAIELLG29M3PC8BXbtnj0AStfDkMf+HdzFZToW0YPqx/Q9QmzgVM0JCDX4r/JIlbN8pb1L0RrwtQ6N55EiP8S/QOq6wpdQhRv/E/3SvO//qChIybn13EWSgZFYA2eMPkJnz/yBshDd/ElwL069HaO9C61zYO5KCbpT3mD8k9MjIiJFHz4BkALQbOajgfil2mjpJ5EbGpu4m+/v3pPxTFFxPyoZFGbMf+OAQdsvl9mx3zmYcjr4kIi4W43lcfmbCz4KMOBmvnc7Q7PR6IINOmIw3D0Go0pa1DLO6NPPTjRODVBHU8panV3HLwKngovK7dr2vzIMJa3VIAOVZ2jJTkxTBji/adFzKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b860639-416a-40d5-cc46-08d87f0f96ec
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 09:13:40.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYUJNR3yXJDjQc6tkJwoqaWl3sEBbr/bHfMulkx1fF2xNaqtxN7B4r84rKKaKjIqI+MU08mYM69S179nWnznsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1856
Content-Type: text/plain

Make the volatiles file name starts with digital.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 11b7d576a..6df72427b 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -81,7 +81,7 @@ do_install () {
     install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
     install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
     install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
-    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
+    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/03_quagga
 
     # Install sample configurations for the daemons
     for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
@@ -106,7 +106,7 @@ do_install () {
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
     sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/03_quagga
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
     sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
 
-- 
2.17.1

