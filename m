Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.67])
 by mx.groups.io with SMTP id smtpd.web08.27224.1604298650227816114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2020 22:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NvhFdsgp;
 spf=pass (domain: windriver.com, ip: 40.107.236.67, mailfrom: jiping.ma2@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njvxjaQ00k4Q5C6WWxbwc8aQcAcN6CoUy5hxGThgfAnqMpu7PezDU/s7t2d0s64SYYuNV4Fis4odV27zNDwMgqYyKSio8vwB9H3mOfIfCdWbtHkpOGp9olwZqBDO1luHhLFy6duDyTHK13nreNnum0kC1INIdaTZd2XLXvtbgQZgw8NlOlQ4NSwlogEWntsuZ8yg3eO036NgGMDbwNsyLr++vXtcrqw2hehmBkbW0roRENLJKciQxqrFwaXA1k20yMr9tw4rxI2TpBhQuPXCTsYUDQkLqT4UmUaukEtkGNlTxEts7+dYxx6JcpTtiLXiS6Hcyt4c+w7ukUyjFBhWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afsRRblJ84bDvTGnAu6eKalxY0G5cExpXESyCNVUo/0=;
 b=YiOxRiLy8B9njByCND81dTOO9g+ieZXTQUBCqTHdx4lyCLVa3sZIltZ7gJ6AjszJ/WwhNkx99LDZGgxc//JgbwtNGvdJE4DRnzNSyqfU53WEC+LVEVY4cfvT3dsv1zpM4iwG9HMa5rFu3AU+X5xbj2W8IdLFXDcmNUuGGpSz8fmPCGiPL31GPKUfn7ITdI9OUqFv5G3WvxiqAuvzj+gXxBlu5pSWxvt2ZWQr0c3zV1wgaw2ETeLmnqRO550ZtD76CpzWUlTcOGC0loPfkx7KHQYxHaD4gIzG4kauNZgumRPkuQ2JjJwb8bNUBoU1x/zT7Xlow5EM9GgR9FmTbS5aSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afsRRblJ84bDvTGnAu6eKalxY0G5cExpXESyCNVUo/0=;
 b=NvhFdsgpQFLKXl4X4Y21/pJfxpYz1AGiQV4NTx/HkbyGiHhbuJpamU52tq6vux8y57qBbIHX52Qd4sYYFF6LAn/FXJJpzpSNJwttubYzJr//mdThTZl8C3W1CTi4yZ+5W7VjhTrHCMgeT6GjsVj8HEn1NseDDhAZLHeVn0D70f0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2747.namprd11.prod.outlook.com (2603:10b6:5:c6::22) by
 DM5PR11MB1564.namprd11.prod.outlook.com (2603:10b6:4:d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.29; Mon, 2 Nov 2020 06:30:48 +0000
Received: from DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::1854:fb35:d5c:a229]) by DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::1854:fb35:d5c:a229%7]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 06:30:48 +0000
From: "Jiping Ma" <jiping.ma2@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: jiping.ma2@windriver.com
Subject: [oe][master][zeus][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
Date: Mon,  2 Nov 2020 14:29:55 +0800
Message-ID: <20201102062955.73203-1-jiping.ma2@windriver.com>
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To DM6PR11MB2747.namprd11.prod.outlook.com
 (2603:10b6:5:c6::22)
Return-Path: jiping.ma2@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp2.wrs.com (60.247.85.82) by HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 06:30:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a39ffba-c3d5-4d9b-a288-08d87ef8d674
X-MS-TrafficTypeDiagnostic: DM5PR11MB1564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB156415B3CD22D44DAAE837F2D8100@DM5PR11MB1564.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zd+7qAnnG9xunLX40LsU5GJP+/XXfPbg8fhx7GDxs7u0iSyM6A8IwLG8e8k5nDpWbJK6uFupwdSaYzCs6rCOvN2lKwReYu6Yz7dLBBBfroC2xKcGErmL2SEgw6kpUaVw5DY5fDH+MCQBNJ8Fu7Jjn5ZA+D1VuZhHZypwDjuL7X3OAfjByHzf7UiCoOmWPkpfQ0LLJyHCp63rksqsxRfskXRxHOlzUgDLYHIDqtVeJlfeMPfbglTlXH1kNNwV/AhS5wsBRJ32hm2/IA/huuz6yr9VcSXNoyehvDCebjnUGLV1mx0Qlz/37WKNOf5e+wmz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2747.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(39840400004)(376002)(16526019)(2616005)(6916009)(186003)(4326008)(956004)(6506007)(8676002)(52116002)(6486002)(86362001)(107886003)(36756003)(26005)(8936002)(83380400001)(6666004)(66946007)(5660300002)(6512007)(316002)(478600001)(1076003)(2906002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4XcX8YgRRtyVGmdjwG4qgpVcG8wXeSDgOydN5skw88nRoPIEVi65uf35dVzGvoB5GiJrp3Vri8bBs0FfQjowKnezy6+VhocGX90V3MB3J6vAaiAsA0Pskx66Q2VcQ6M6aZGDdCaplr3dGa6epX8pAqWJjbmAuH5W/soHiUp/DdFpJUSfoD6n2x/uyPnYEg3WaYDXxGPEuaZMXTpgAyK59We2+GhzIBG/d6ug01UwcsqrciOXqlVhN9OTcugxkhgKB5rTFXhCDZBb7R0HWIjuV9syThLDgZubCsNYpgmZO19mPRXwsvnCIq5++T59OA79c1m2heApCzVtcm6iZPY4tY8kSW+jORxr1hHN97BtEzU4w0w1EZAe3zFlOW8PqWynQptMdptKFmAKZOYqAXV+GlckbPHuBYrEnMlDNC1LzXo+03cJSLiIXF2PIceQocCAPW0Yeu8odajBm5fVDKymBJCp27p+IwOvKelHFcpm6qb6Z+IevuyiFJtj7jV8Zo/qaveTTaBfvGSAbx8vpibRF1kiyrJs1PkonubiS8F1xsZUZB5eDR8PRBH4fMEQGpN9zThEnO0nuCxKCaJdVMiB+o8dZMzGdOGdNO93qsiDKB9FZcbX+KEKEC5U9dkY2SKikXULPg1PsCBB6mHVkFyuQg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a39ffba-c3d5-4d9b-a288-08d87ef8d674
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 06:30:48.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoavHjvBHxlqMaUIVwz6wkaTMw6r5Zg70yzpEdPWzoexg7X1LV734TBeQqz2gR1dliK5GWBMYRKEM7SuLY+EHjDghtLGPrrcqAb9r9yEKog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1564
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb=
 b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 3b430c0814..b6b3e5235f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -17,8 +17,13 @@ RDEPENDS_${PN} =3D "\
     meta-environment-${MACHINE} \
     "
=20
-# When TUNE_ARCH changes but MACHINE does not (for example when a machine =
definition is updated),=20
-# cross-canadian.bbclass prevents variable dependency propagation to TRANS=
LATED_TARGET_ARCH
-# This will result in erroneous reuse of previous sstate packages. The fol=
lowing line
-# establishes a direct dependency instead.
-do_package[vardeps] +=3D "TUNE_ARCH"
+# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for exa=
mple when a machine=20
+# definition is updated), cross-canadian.bbclass prevents variable depende=
ncy propagation to=20
+# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous s=
state packages. The
+# following line establishes a direct dependency instead.
+do_package[vardeps] +=3D "\
+    ${@all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GCC')} \
+    TUNE_ARCH \
+    "
--=20
2.23.0

