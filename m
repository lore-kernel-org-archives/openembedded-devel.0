Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web09.2324.1607392330706198920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 17:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QhmEFtlA;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8dFhTpqjxAactAwTNbyHG1CzF+mFfIfFEdcvhuntksP/QhkC8I4AQsR9e6+eCzC1Nsw4eq1MsGw/TRnXlKVBMP/xGaaQKwNT4Scu41RplPQ+bqx6CtOBj5HiWOUYTDOvg65UXRydUkIAl4k1vZS9zeJvAQgNx1qhOWViz52Bh2dxeXN9RRI7R+u+E7gQ/F7ik4gc/AawXSi0cMMv7IauI+04qVsxS7SQx2j7ADXLQQGqLEl7CNC9DINcfOR+TC39fha9J/ck6e9a7dt6d1Gp4L1eUGWOOWICgl1Elfq+pAo/dtTSaolYoi8y5R4izAb70eFFmWSUQz51tw6ECJ0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F+H4BTBgOXVM7qpKb9AEjrzKYNdGYxTzN2zZhynbpY=;
 b=LPHqxQ+Z7tiOdqArDRdmckwv63ZDJzaA+nGSaKzCThdj04fXtVeK2atoWY+AcEv94JXcKi1WwJn9VZoBbCjDKJc3oag0wTyyFEtw9n5ES1z85bG+4rlcvcti/XTcMlyYjFN/clkM2tcMOUddIlrKmYtblC4nDDM0AeweZ1yRe6NYt4BQO9+gLQAu7m/8/La257+Z/wGCObQuNEPG74xmqCUQ15w8BIWi4Ea0EUDh1iNZqY971XhDqY3wm/PuA4agQdNoC9FHsaA0qArPtBj7mq1fDi6Qzrwj333phCgKxDiRpxAze1R3MeDXYJrxd6adgY1qlUg0JVbc4srQC9hNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F+H4BTBgOXVM7qpKb9AEjrzKYNdGYxTzN2zZhynbpY=;
 b=QhmEFtlAuuXqusYEety1yCLC5/W4b8ZbID76OzADMHNBLlLGu0S7oq0wPurxTu376wHkkc71ILAzl5s27s0n8a+y8ZXNJD8CW0jqySTc/41das/7lUbr3xWKpcA0y6JRvw48JnWjWBTblQWlUe58jAcgSequfRzA2pb2b9bvXNY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3485.namprd11.prod.outlook.com (2603:10b6:805:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 01:52:08 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 01:52:08 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] colord: fix installed-vs-shipped error
Date: Tue,  8 Dec 2020 09:50:53 +0800
Message-Id: <20201208015053.33560-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR04CA0059.apcprd04.prod.outlook.com (2603:1096:202:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 01:52:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf2fda5-efd4-4129-ed31-08d89b1bdf13
X-MS-TrafficTypeDiagnostic: SN6PR11MB3485:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB34850BCB6FCA2FEEFB3D104E95CD0@SN6PR11MB3485.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AzGmBR+z9mmh2uNjRoOvB3+tymgeCKPFdTdpFuW5QpAWoIizhqAJ2Ko+GYkGXCONXKhq0pk2mO1+iOfDmgX+6sggEGuCbDGasVX90bU/nWzdj9e4qlCABGlJpNscYAXe4ClC56TreNKOB46mD/TFDmmWk8hJKwxT6Hu/4L9AB6hrzYZ0Iar9EyqFdxkVj7RfigHoQPzKh8DwcuNepd342/uaxfMgO7YUiEYayiaHhZNAJfaEGemUrgkatCp0C4B+FDFXKZcyqT84U4R/wb+Waov8DGXACsRyKiLscqi4LLH5T7cxC9+soHXYEYgwrCi2Lrv36Tezt3FbTaruoe4rkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(376002)(366004)(36756003)(52116002)(66946007)(9686003)(8676002)(1076003)(2906002)(16526019)(66556008)(66476007)(8936002)(83380400001)(6506007)(26005)(6666004)(186003)(956004)(6512007)(6916009)(478600001)(4744005)(86362001)(5660300002)(316002)(2616005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?nj6AwW4xBHE/VYNAuwkfZLAECjLXfSKpVqzmJvJYX1ESy6xCM3se22tzECBx?=
 =?us-ascii?Q?w3ABHo7+HlQv+jMq4IQesJBEMCcjOQVL7YhtIp1Op737DSoJNA+JXFKNQhsc?=
 =?us-ascii?Q?GfFOkBT7ilH4k7x/7vSlaOxWAFtNXOIm5EwwKCBznZr8zvTyXxdhDFG/cKCM?=
 =?us-ascii?Q?X2dCB1VIyk/WBiFp0vXuk6aAQkxqg+Um7SQMx7zKUcf3LUy3XUXYmFIR9tBa?=
 =?us-ascii?Q?baAahkZRBbjft5ChT2Lv52kHaeC85yCA6XvTfohh/YNe0vzFJMMJKcT5Ln3f?=
 =?us-ascii?Q?qTthqhwxzjurQ9+R037KyAjpnt3h0c+G6UQRtD3f1LDvy1gkit4OmFaGkvGp?=
 =?us-ascii?Q?Mumlxh59LyoY0g+amNzTjjXtd4FS7QTAEP6nXTmMM7KdzPN0S8V75vGuXbCW?=
 =?us-ascii?Q?QpQBK2l1lOX36M9m7lQEfzIf9ogmgac32XMtivG0XApYeuNwMH5mu+0OUdBP?=
 =?us-ascii?Q?X0sjXH4WpUK1icJM9afZgqFimY5oZ7d1TIYzLm/KegutMXqINLLCuyiYVEVZ?=
 =?us-ascii?Q?04WzbVq+/1s1EZBOTPIctGmbTbTgIN9tKb/H7WQ5q6BrcFV6wfm1YCAVGeE8?=
 =?us-ascii?Q?7H1iygECaf9+ZSwVDaOag9Hn47csVhJf3iwluYCiXbOw2gAXYBkYeSvKD7PO?=
 =?us-ascii?Q?8OqBxOCTJbYsHcmqN+HM57LPLd4XZk+4TR9MeSBWDnvE131KhbFN4EsO6JKd?=
 =?us-ascii?Q?2TV6iUnUGUHg1vCSM9ax+hDYECGHVAHmBToL/Hwl0ujwuZ6HfARtnGvbhMAl?=
 =?us-ascii?Q?3jtXAb9hG65QRdydn9rmHzrJrykV3LNFePr75vKZa1/JYDgC4vvZaMBPKjW3?=
 =?us-ascii?Q?EMMpR11OMUiuc2xat0ZNOqLfJ1CrSvpQFRZ2wcFbWbt/jKV1f6FhLPe2eRcL?=
 =?us-ascii?Q?7FrSctzENoshaKaZ/qsa9nkutafIg8/jQaKfJHQ+pbvnWVbWb9L0JEW9rrsK?=
 =?us-ascii?Q?7tdAn7wd0WovgyE7u/yCsDCj9rWCdsSTaesYAtEzs60=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 01:52:08.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: acf2fda5-efd4-4129-ed31-08d89b1bdf13
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtC3toU+HrFKlBsinQ46se9YzRwtYsQLFwhRs5rYOtt5Azd6/ytcSf1+1S1+8645xzFadK14vC6U/PSUKrQMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3485
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When multilib is enabled, tmpfiles.d is created in /usr/lib rather than
${libdir} which is /usr/lib64. It causes installed-vs-shipped error:

| ERROR: colord-1.4.4-r0 do_package: QA Issue: colord:
         Files/directories were installed but not shipped in any package:
|   /usr/lib/tmpfiles.d
|   /usr/lib/tmpfiles.d/colord.conf

Fix the path in FILES to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/colord/colord.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index df86708e2..f514c0b78 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -36,7 +36,7 @@ FILES_${PN} += " \
     ${datadir}/glib-2.0 \
     ${datadir}/color \
     ${systemd_user_unitdir} \
-    ${libdir}/tmpfiles.d \
+    ${nonarch_libdir}/tmpfiles.d \
     ${libdir}/colord-plugins \
     ${libdir}/colord-sensors \
 "
-- 
2.17.1

