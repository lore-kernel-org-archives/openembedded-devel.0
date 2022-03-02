Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00306C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:50:59 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.85])
 by mx.groups.io with SMTP id smtpd.web08.5351.1646211058653282303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GkfaeBRp;
 spf=pass (domain: kpit.com, ip: 40.107.138.85,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmy0r161ZqKv1gAX7JcHP10Dq+XwX7aqs/r+BRX7TDDvP7wFh6Qxr8pwdS9JsFbO7fMKV0soVixdK66caK5HecJTRohqkX9FGOyrbMgOaoAyhmnZlf11SrcF7tb0icbErZTQW2ESf5QoWXWOn2FZ6KG04u/yI3W5rhG8bONQpKFfeqxqKWqZg9bOPDLE+4zgoJTqhSei0F0jQhPWjjzX9m0Df6D3ZiTBw0fkAik5z1oVCaL+lcnq4fArJSWdnJptur5YYZadv0vMO1NtdDSkSzOzo51kKyangXIu+LLApwcV8BDLSLVPk7JLALXfsi58CwQMLS8Pbx+LnPploa59GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=535DaMTSWUCQ43i12hd480cVLWp1iBWQ0pUxztHJu4g=;
 b=oc/Z18K3GHWRCEyjLRwC2BzXzactGpVCAQrnidMR6PkWpYMcAAc5EGKGP8XD3xIkWvEUiXW9vydtS8aEfhxvjwFKTHwPu6xgAGU9AnQM3u3PZjIaoFar0nAEGYEAb7OgbFzbtzkhH7efTg9SZxClv4ZZHzv1eLM9K3UsMz+nNT0wgt8O0clGlfl6myvsxp7/RBGrtLbUMguNMGsYDgqlb3oYRXQybmk9EzcNjPzLofChzmAjUEqhlWMAF81olIv1Tykf7pH3O9CbZk4RClZlpyxi42kshHfnG1q7kipl2M0qvFIDIZoMX/48xJqt/7x5ug7vzdhYFgACTbCKASuaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=535DaMTSWUCQ43i12hd480cVLWp1iBWQ0pUxztHJu4g=;
 b=GkfaeBRpxzfwTlG0jhnEAHHTD1YS5fEMHM9AQuqkMNP3Y+u+f3WAv6xs7tYN2ah0L0A66TswYOH64//H12MN2gYBttbISYmJ5+VyRLpaCy6J7me/m45JaITK3pj4UR48nFPyEfVn3w1MId8DTksaS3CPKdYinFSsmjLgyVPNILM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAZPR01MB6813.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:42::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 08:50:52 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f4eb:f19e:e688:229a]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f4eb:f19e:e688:229a%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 08:50:52 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nisha Parrakat <nishaparrakat@gmail.com>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>,
	Akash Hadke <Akash.Hadke@kpit.com>,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [oe][meta-oe][dunfell][PATCH] p7zip: build and package lib7z.so
 needed for fastboot
Date: Wed,  2 Mar 2022 14:19:55 +0530
Message-Id: <1646210995-8717-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0101CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::36) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5311272-b58a-4ac2-123c-08d9fc29c1a2
X-MS-TrafficTypeDiagnostic: MAZPR01MB6813:EE_
X-Microsoft-Antispam-PRVS: 
	<MAZPR01MB68135AB6241F5B8CCBB62B518E039@MAZPR01MB6813.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bPsKJ6FMaRVZM+W5zJP/R6ZWlgTrhrTnje4SQxhhY09UewAgOprTfsDmPS2Xg1AhpaHDsXP09+95z7f6v4C+B+RrYv4Imgrj7X+vhB1kzaqgV0R+lSJ7J6fYxSBT00tJeXm2iuOmV19+trl3TZkJum0fGKnSmcUxdBpE1gVm11JXnAz75JzXtLHQuQa49/Apo0BK72uWq+LbeXIov7OyrsNuYW3pb6Lv+v8i+V+F5futLmjhqwrMP4YGfr/Oy3hNf5KjHu1tXs8nur0r1vxvgk9YZ17jNByLDjEmwJteMhRzUW6bvNv2BlyWXaiwcnzHhUxcp7yeV/YQPTeNAZZ7JyppwTA3OBNeFNSlPWjv53AhrqfT6fAY8i98JNw5o4e3xyoQAS1n/JJQ17jDkNTfi5z0xxWl+2gQPuV2xOBLPBz41/crjSGlzOpXOt7lFmVQPFKYFaa4VOo3BSdNq8dvGj05Du0St9NV2ipFO8Ctkusx+OazTu5Kk5M/OKGbYEBN9dFrBPXM4wgaSvIi/cNqi2M5XSTbRPbF3HkvV6Ln+aRkuRDuqZxUJEUssImCSMw08/FqXzh23ac0Doxj7RaracmpW3Eiai1UNaOTpqq1IExSWrFVqrZn++I18VMvM8T/4jU3y/SzpyAIEV/sXsagyDqGGDuTzIwA3KoXFhTjpMqoBCGeiW9XgTZXiSydZtK8iZ7wmes20iMwfaXaGy9NQu+lGdUsjr4hJ+0Oli8Crik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(2906002)(186003)(36756003)(19627235002)(54906003)(316002)(83380400001)(38100700002)(6486002)(8936002)(508600001)(44832011)(5660300002)(86362001)(52116002)(66476007)(66946007)(66556008)(4326008)(8676002)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lyV/LE/axRCXxy0nhw+dvICCfCJ70aIXhis8tK2RjhWGjYtEB8Zwvm1Eirh9?=
 =?us-ascii?Q?TPb0P9kfhCQRtMuFEPyiapo4MvS1KsJERBrqP+KpX4ULyoETvM72zo4Hw1ed?=
 =?us-ascii?Q?bdmRTdsca8fya6vZC1ooG/tzFTZyMdEiDApS/mBINXRZtlL3FX6zNaDOkNox?=
 =?us-ascii?Q?PWL6kUZieP52+RX54urIa52zpdQ9xxs6d67gVjUva5NHvPY1tX/OrWpRRsoZ?=
 =?us-ascii?Q?7TBpCRwxKe1MDPGAodZgUh+qSGUbU4Ku2PY1kjcY4sVXrJ73ZkgO43OoyQnV?=
 =?us-ascii?Q?PTxpFO1JARasBizTSzLhUyLXBabSTo4qU738fxZLen7URXJmGc9w0iUv5xEe?=
 =?us-ascii?Q?axdNdUuA1lw7KHBw0FvrIbw252GslKQ4qVxM5x5RIN2cZPAMQbf5+d3ZWCv7?=
 =?us-ascii?Q?2hFzy/ZY176GbYXZuZeON0eUB9d+/tWjS445xxHrr+Ovv5X8ABJ0bW/FIA0Z?=
 =?us-ascii?Q?6yFXuc//xk6ipOyaFAKJCEKZIoMygGwYEwRXqO1d65+vlNZgVV6HFcolVRkc?=
 =?us-ascii?Q?Wo9zdVFw3rE+FJ2cnZqVIldOwjWCOnu/3qj55aX5BRaiObbDfOa48ICC0Jim?=
 =?us-ascii?Q?o7LtqIqjAEUz6gQXIxOm3K0twpTBNryHsZ0MaWRG/hQQESBxq887kyC/ikg7?=
 =?us-ascii?Q?0PrOi9jGWUxQX9DOYVVRAr+FxGxZFwO/mKBne6uuHA+pRRkvEL2FiV7UBxN7?=
 =?us-ascii?Q?mUjvcBElsD1+jcpBt1cEeiMnJ+73P3aCQJW9jC8nkP+YcTtbTbICvLO13zMH?=
 =?us-ascii?Q?9fKLa1UoFatnbeYFuqr/TW7yhfJGkckJP5p2PRKNqDb7v8yV4PZ4ZaHV10Xm?=
 =?us-ascii?Q?oS2Y2Mn3iN1NfBWwu8+q3ZkpMEWw+z++xsnC9hBVvf1iOk8hUf/zABx3I4uA?=
 =?us-ascii?Q?VtL7q4ysYh4npB+0mSyu/g+Qhdg1cZlyxeRDZXoLukfKu19koMAPrtOdug/z?=
 =?us-ascii?Q?1NCla2F6LeUOCBVac7OMm/A5D3kwkkO6vSPXcT+g2nzhqwN1dnJo/CrI+foi?=
 =?us-ascii?Q?ql9JzNy0CT44/Zge+2p/1k8+aRBmE0SYd3NsFy2NFD2YRG/HlISnb1/vbCmy?=
 =?us-ascii?Q?Z13546Hozl9X6IgMPAQ+RxogcC6l9C1oeh21NUPjfXtHX+pzIqnsW4FFfoko?=
 =?us-ascii?Q?dpgb4TdLRmzfSh57n2yeF4Qn8HLAdR3+uXaHWxy1Rkpw5k+Fqvf3GaBDatLL?=
 =?us-ascii?Q?O6ByM8fCxPFFC+awwaQpDuZazc/gPdfPCNbKnjYEDcnfx6gcf4GRCByR5UAv?=
 =?us-ascii?Q?ZnEHO0P5Er030O9DYi6qano0QwvtxNORo3sG2sTvkZov2J/tv2ZysyjNE//0?=
 =?us-ascii?Q?/eT82bmHph5pMgaPygbAmGbkJYoc/e7wXm6z593iAIWEZW3QwhefzcAk3fOL?=
 =?us-ascii?Q?/52OopMFK3xs71fhMoliNnlzGFQIrrMH/UkJs5S9m7CGswu7mDiCGoAfDCDI?=
 =?us-ascii?Q?OInjntR7Gdda4WFqLdAA2I0mtOZx2ZALEtHayZYana1F6fMBY6jp+AmiHrLt?=
 =?us-ascii?Q?H1f/lj/zZUWaq45yyQuZWKISFeRnHSh96IjmtgGrUmMF2IhvC50svC/Ns1NI?=
 =?us-ascii?Q?2vMAnHn+0m3mjNpgiBelfGKjRUBXkef11BL8DXU/X9CZt7qak9s0GBr8BwL8?=
 =?us-ascii?Q?s6Gexj8TH6Dnv9wv58tE2iif+0fxhptXV39Vv00P9l3Fqk3v1TqL1GDTt+aV?=
 =?us-ascii?Q?aEv2f1DUbQvCPnfywyGOkDvwdJU=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5311272-b58a-4ac2-123c-08d9fc29c1a2
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:50:52.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e0vZ+ZBPMCXAAh+o39kFRQZmiy8qt7obuCDAHSypEq+CELWy6Dikrq9PKZUBm+PxNl2pGBIX28girLyAre/UEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6813
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 08:50:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95681

From: Nisha Parrakat <nishaparrakat@gmail.com>

a) use option 7z to build the lib7z.so library
This is needed for android-tools for building fastboot
from android-tools

b) Packaged the lib7z.so and codec libraries as a part of this recipe
Fastboot RDepends on it lib7z.so

c) Fixed a C++17 forbidden error when lib7z.so is built

fixes the below error

| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
|   308 |           numMethods++;
|       |           ^~~~~~~~~~
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
|   318 |         numMethods++;

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Akash Hadke <Akash.Hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
(cherry picked from commit 3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd)
---
 .../change_numMethods_from_bool_to_unsigned.patch  | 25 ++++++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb      | 21 ++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
new file mode 100644
index 0000000..edde525
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
@@ -0,0 +1,25 @@
+fixes the below error
+
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
+|   308 |           numMethods++;
+|       |           ^~~~~~~~~~
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
+|   318 |         numMethods++;
+
+
+use unsigned instead of bool
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402701 +0000
++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604125 +0000
+@@ -298,7 +298,7 @@
+
+       AString res;
+
+-      bool numMethods = 0;
++      unsigned numMethods = 0;
+       for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
+       {
+         if (methodMask & ((UInt32)1 << i
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index ebe32f1..8984f96 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://do_not_override_compiler_and_do_not_strip.patch \
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           file://change_numMethods_from_bool_to_unsigned.patch \
            file://CVE-2018-5996.patch \
            "
 
@@ -17,10 +18,26 @@ SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
 
 S = "${WORKDIR}/${BPN}_${PV}"
 
+do_compile_append() {
+    oe_runmake 7z
+}
+FILES_${PN} += "${libdir}/* ${bindir}/7z"
+
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} += "dev-so"
+
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${S}/bin/* ${D}${bindir}
+	install -d ${D}${bindir}/Codecs
+	install -d ${D}${libdir}
+	install -d ${D}${libdir}/Codecs
+	install -m 0755 ${S}/bin/7za ${D}${bindir}
 	ln -s 7za ${D}${bindir}/7z
+	install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
+	install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
 }
 
-BBCLASSEXTEND = "native"
+RPROVIDES_${PN} += "lib7z.so()(64bit) 7z lib7z.so"
+RPROVIDES_${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


