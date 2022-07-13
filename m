Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66458C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 12:30:56 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.79])
 by mx.groups.io with SMTP id smtpd.web10.21316.1657715447742024877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jul 2022 05:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=Ao03CzFt;
 spf=pass (domain: siemens.com, ip: 40.107.13.79,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiJbMU3j/EAftSzxsYPvRiqsigATBkkvh3j9pO4fmbKYQ081HT3UaWKZtj0xEBfhNQA7WctxDoZIxghrArPPKWcYzdMqp0zk1IFwnMOUhMLentGuhNRFNiAkK4Z1MEmmg4bBVXbO1bJLwAtIgRiI8ApnBzWpRBB3B4s1X6H+7Xvr4we6hUv4UfTjgUc56wL+7prYAYUgisU+LfBQySny9zaxmBx4h+sBU1XCcjUWkLcjYAKc57Lp9Ovc+CLXRoWankBdUTpBgTWQAeLP7cqq3rThncSZC2Ye+1wMUqcV9/kIkHMwYs/bz3Vp1bnxt0dQAa7etf52ZaPPNLHGIiw0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yABTRvIeteO5wUle2hnHvZXqWPJymAJ7oOfqYL1TsQo=;
 b=C4T32rfUWTTKnuabBhMWf2i+LljluiDOkhPpD29OfW+PcpQHEkp1MNnnafw3XpfO1ECtw4A+3HIeH16VCaxoGE00X+qFh3zcTOLGKW8O8wKOLk8YoL3V7eui0flWsjkNQVgGBlap3yW1v1kg97YR9kDxfgMdzbpVEgs6Mcgfis+NSfro9m/WvORIbcd8ZVuK5sJZ8YPKQB7iznQBEVsE6A/JLcO/BZIOryuBh3GvPQE0xI5/4Q8r2z5au87e3kNdtrmpuE/0jD8VvOVd7NSPZFhy8tjMijEdQ4cjWIAXdczYfSMGtA1kbt1swSMCLmWpQqEDyP1pfuJN4ehMU7HP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yABTRvIeteO5wUle2hnHvZXqWPJymAJ7oOfqYL1TsQo=;
 b=Ao03CzFtQ7oMGf/yhrpnMADWIiBUqhit3UYd5kMLXxcVipv7fSYW0fWUzYEOnveIJhkfZ6TknZAWlblwO9XVQ52dv37yOLcEeLqn0Sz/Hqt7rN+KuZdvtyUXTvHottbonVSfjRdHLUwGWK9M99usU2Tlnqq/t8byuXsSbPMy1RRhRPfEqKYAot1hkwaXrcWcIO5uLMN+epp3HOg806q9oHselRCZGLbd3K7cvaSePJYFTx/+1DBhqlAm53xe+TgdiDeCwFRTzKLzA/Q4V2qk0tJ0jbaGkyrgWDCcoVdV2FwhoUbOd2Q8gWBmnfAWLt0NkpOvu1zFgs3EpyLG7MbIPw==
Received: from AM6P194CA0064.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::41)
 by DU2PR10MB5125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 12:30:44 +0000
Received: from VE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::15) by AM6P194CA0064.outlook.office365.com
 (2603:10a6:209:84::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Wed, 13 Jul 2022 12:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT031.mail.protection.outlook.com (10.152.2.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Wed, 13 Jul 2022 12:30:43 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Wed, 13 Jul 2022 14:30:43 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.153) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Wed, 13 Jul 2022 14:30:42 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH] poco: upgrade 1.11.3 -> 1.12.0
Date: Wed, 13 Jul 2022 14:30:14 +0200
Message-ID: <20220713123014.1080802-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.107.153]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--12.154600-8.000000
X-TMASE-MatchedRID: YhWA+FRSwJ77QMAOnss9k53gSv+Cp0LUWcYSOWxqzbJV1zhVw8duYldE
	Emf6TRVBx6C6dcifNxhQebI43waiIJAY8SiT82yo2wh79NdRsvWVzspOxMC4JX4neC0h7SADaKn
	8gcxtGeZZtDvk5TYPR0wSeVQnSS/FKtCISd3FwWPf0Wp8F/3nrxTfVlVWxWRBPwKTD1v8YV6i8D
	/o42y/Sj+FxPbxImzy/J5lotLmVbx/f9A+WZ7w/AuinfgZ2xrH0VtwrmuY87VNo8Hgr5FnYZY4M
	P/LOm93Slk/UKKlbmOFPEnrwCXZWtkzVQ+l94phdFgaeQUMTlEqXuKH5Jbj7AA+Y0oNaxbQ45oD
	ENe4eeu0TybP6vL8lEfl+H4+MqTJdXBdJiSZGonXmhOmx9V2wgBGtwWKXLWi/OM51yupOiJlRzZ
	AkKRGDRvXMhflDraG+/KqneiC8jY81RxOPcqfBuS1MmVMX9wCGA7i8sktz/XdCok3ibXlQX0tCK
	dnhB589yM15V5aWpj6C0ePs7A07RjOlt1Pi553OMjykkGULobrfJTBK8zgIBuFv8/VBUy8G/NyL
	K/ho48=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.154600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 38D6610489626EF4084D847B60B5880F758EAAAB4D8FBFAE0566F40CA216FFD32000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 508bc767-44d7-4703-08b5-08da64cb8154
X-MS-TrafficTypeDiagnostic: DU2PR10MB5125:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cSCuwsdeGiP3yy1lJbUB9FfmYEEcEmeiBlQ2RP1CmdsvFsR9Ufr+bCPytq7/yI1yUGg09QEov+GOsOqdvi6jJODVTrnwp8G0Lfa+K5mcGb1OowoIgXnw6UyAkEm1/BEMi9h/X5BbxjYZpMJJTjimQZUG3nvfOr+fSqt1tncwslm9XjW1S8oHLvS22OQ81tHOVm5DJ+BvmDUx/suId71tpFhC2EWGuYyl/ryuCDVw3YWbLYxQSK5dZjxEiIyZPGV841InrOGDFpVBBAJJt6WJa2T8EVfB/X1A+cTjdjDD7DDM4odcSuXX42PEGS49/P/BXCobjyrHDekC9wB4ONksgIqOamcE9CrvfNfa9N+KmuQ/fPbeeyleNMCaN4HxQl8WH1It1YlO/fbJ6Ha0pwZJFkA8qdVomwvd2xBXDtrm5rq78RWcLOV+YbOV/T26eLdiu0Na+d/qyogTcvUx+k/F8QwB2HfsEMiTLFzT2xdNGkBJ9szmwGiiGK/rkEgpCpKZ/0/6q+gbrSRcbAhoInjhncL4h5OIeGR+PNVqG+xUtLZupWUaL7ywzxz0SnaJ3WLDdylwa5Zb6kZcc10Pr4dYnHTd0K46KOESrDsERdc1dKLX5UTIHtw/eGLqKuDUUiGqmK20JQWKqCmNQpSbt+L2+jwlMuxkTzJinWUcqQ4mDsGqJ9eYLXIPTWJC96xlJL5El2Jh4xC2+cPL0SssdxVGjLRCOTrJm4CmXjlEblMlkq9diBgvDHuAmZJZoYl5cNFxZOVWY6iAypEVekXTEuWWwoVTteCL+TjPvtRVgJMLIqb0PqlmpAhUR+YUpYc0xQ68CxqRDBwFBbpzZPFVL4/gcmPBGM91boxN2ormwDFYWizosgDfs/N4BSRsx1j1jay5xSd9F07tYRMlXK8zVAZS4A==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(2906002)(41300700001)(40460700003)(36756003)(316002)(83380400001)(7636003)(7596003)(36860700001)(5660300002)(44832011)(8676002)(6916009)(4326008)(356005)(956004)(82740400003)(16526019)(336012)(6666004)(86362001)(70586007)(47076005)(70206006)(8936002)(2616005)(1076003)(186003)(40480700001)(107886003)(82960400001)(82310400005)(478600001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 12:30:43.6784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 508bc767-44d7-4703-08b5-08da64cb8154
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB5125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Jul 2022 12:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97820

 - switch from PCRE -> PCRE2
 - add Prometheus library
 - add option to enable/disable ActiveRecord (disabled by default)

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../0001-fix-unbundled-PCRE2-dependency.patch | 25 +++++++++++++
 ...0002-remove-providers-unitialization.patch | 35 +++++++++++++++++++
 .../poco/{poco_1.11.3.bb =3D> poco_1.12.0.bb}   | 11 ++++--
 3 files changed, 68 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PC=
RE2-dependency.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/0002-remove-providers=
-unitialization.patch
 rename meta-oe/recipes-support/poco/{poco_1.11.3.bb =3D> poco_1.12.0.bb} (=
89%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dep=
endency.patch b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-=
dependency.patch
new file mode 100644
index 000000000..1a9d23cee
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency=
.patch
@@ -0,0 +1,25 @@
+From f049898c8bf058ed187de8e5fab20abeaab1f3b6 Mon Sep 17 00:00:00 2001
+From: Alex Fabijanic <alex@pocoproject.org>
+Date: Sat, 9 Jul 2022 19:13:04 +0200
+Subject: [PATCH] fix(cmake): PocoFoundationConfig.cmake should now check f=
or
+ PCRE2 #3677
+
+Upstream-Status: Backport [https://github.com/pocoproject/poco/issues/3677=
]
+
+---
+ Foundation/cmake/PocoFoundationConfig.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Foundation/cmake/PocoFoundationConfig.cmake b/Foundation/cmak=
e/PocoFoundationConfig.cmake
+index 46c2d3fc00..82c5788940 100644
+--- a/Foundation/cmake/PocoFoundationConfig.cmake
++++ b/Foundation/cmake/PocoFoundationConfig.cmake
+@@ -2,7 +2,7 @@ if(@POCO_UNBUNDLED@)
+ 	include(CMakeFindDependencyMacro)
+ 	list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
+ 	find_dependency(ZLIB REQUIRED)
+-	find_dependency(PCRE REQUIRED)
++	find_dependency(PCRE2 REQUIRED)
+ endif()
+=20
+ include("${CMAKE_CURRENT_LIST_DIR}/PocoFoundationTargets.cmake")
diff --git a/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitia=
lization.patch b/meta-oe/recipes-support/poco/poco/0002-remove-providers-un=
itialization.patch
new file mode 100644
index 000000000..7d24b79f1
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitializatio=
n.patch
@@ -0,0 +1,35 @@
+From c976c32e5249cb8a2433e7abfa095c1fe8dc4f8e Mon Sep 17 00:00:00 2001
+From: Alex Fabijanic <alex@pocoproject.org>
+Date: Wed, 13 Jul 2022 12:53:52 +0200
+Subject: [PATCH] fix(OpenSSLInitializer): remove providers unitialization
+ #3562 #3567
+
+Upstream-Status: Backport [https://github.com/pocoproject/poco/issues/3562=
]
+
+---
+ Crypto/src/OpenSSLInitializer.cpp | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/Crypto/src/OpenSSLInitializer.cpp b/Crypto/src/OpenSSLInitial=
izer.cpp
+index 4678d22299..c537c3f9c2 100644
+--- a/Crypto/src/OpenSSLInitializer.cpp
++++ b/Crypto/src/OpenSSLInitializer.cpp
+@@ -157,18 +157,6 @@ void OpenSSLInitializer::uninitialize()
+ #endif
+ 		delete [] _mutexes;
+ #endif
+-
+-#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
+-		OSSL_PROVIDER* provider =3D nullptr;
+-		if ((provider =3D _defaultProvider.exchange(nullptr)))
+-		{
+-			OSSL_PROVIDER_unload(provider);
+-		}
+-		if ((provider =3D _legacyProvider.exchange(nullptr)))
+-		{
+-			OSSL_PROVIDER_unload(provider);
+-		}
+-#endif
+ 	}
+ }
+=20
diff --git a/meta-oe/recipes-support/poco/poco_1.11.3.bb b/meta-oe/recipes-=
support/poco/poco_1.12.0.bb
similarity index 89%
rename from meta-oe/recipes-support/poco/poco_1.11.3.bb
rename to meta-oe/recipes-support/poco/poco_1.12.0.bb
index 757fa8983..6fff0707d 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.0.bb
@@ -6,13 +6,15 @@ LICENSE =3D "BSL-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4267f48fc738f50380cbeeb76f95ceb=
c"
=20
 # These dependencies are required by Foundation
-DEPENDS =3D "libpcre zlib"
+DEPENDS =3D "libpcre2 zlib"
=20
 SRC_URI =3D " \
     git://github.com/pocoproject/poco.git;branch=3Dmaster;protocol=3Dhttps=
 \
+    file://0001-fix-unbundled-PCRE2-dependency.patch \
+    file://0002-remove-providers-unitialization.patch \
     file://run-ptest \
    "
-SRCREV =3D "191cbdc97e1d9de023b8a65e0dc844911c06f6a8"
+SRCREV =3D "4ba8595ed83841d1fa240716b5652adc3772c36b"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
=20
@@ -23,7 +25,7 @@ inherit cmake ptest
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??=3D "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT Data =
DataSQLite Zip Encodings Redis"
+PACKAGECONFIG ??=3D "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT Data =
DataSQLite Zip Encodings Redis Prometheus"
=20
 PACKAGECONFIG[XML] =3D "-DENABLE_XML=3DON,-DENABLE_XML=3DOFF,expat"
 PACKAGECONFIG[JSON] =3D "-DENABLE_JSON=3DON,-DENABLE_JSON=3DOFF"
@@ -39,6 +41,7 @@ PACKAGECONFIG[DataSQLite] =3D "-DENABLE_DATA_SQLITE=3DON =
-DSQLITE3_LIBRARY:STRING=3Dsq
 PACKAGECONFIG[Zip] =3D "-DENABLE_ZIP=3DON,-DENABLE_ZIP=3DOFF"
 PACKAGECONFIG[Encodings] =3D "-DENABLE_ENCODINGS=3DON,-DENABLE_ENCODINGS=
=3DOFF"
 PACKAGECONFIG[Redis] =3D "-DENABLE_REDIS=3DON,-DENABLE_REDIS=3DOFF"
+PACKAGECONFIG[Prometheus] =3D "-DENABLE_PROMETHEUS=3DON,-DENABLE_PROMETHEU=
S=3DOFF"
=20
 # Additional components not build by default,
 # they might have dependencies not included in oe-core
@@ -47,6 +50,8 @@ PACKAGECONFIG[mod_poco] =3D "-DENABLE_APACHECONNECTOR=3DO=
N,-DENABLE_APACHECONNECTOR=3D
 PACKAGECONFIG[CppParser] =3D "-DENABLE_CPPPARSER=3DON,-DENABLE_CPPPARSER=
=3DOFF"
 PACKAGECONFIG[DataMySQL] =3D "-DENABLE_DATA_MYSQL=3DON -DMYSQL_LIB:STRING=
=3Dmysqlclient_r,-DENABLE_DATA_MYSQL=3DOFF,mariadb"
 PACKAGECONFIG[DataODBC] =3D "-DENABLE_DATA_ODBC=3DON,-DENABLE_DATA_ODBC=3D=
OFF,libiodbc"
+PACKAGECONFIG[ActiveRecord] =3D "-DENABLE_ACTIVERECORD=3DON,-DENABLE_ACTIV=
ERECORD=3DOFF"
+PACKAGECONFIG[ActiveRecordCompiler] =3D "-DENABLE_ACTIVERECORD_COMPILER=3D=
ON,-DENABLE_ACTIVERECORD_COMPILER=3DOFF"
 PACKAGECONFIG[PageCompiler] =3D "-DENABLE_PAGECOMPILER=3DON,-DENABLE_PAGEC=
OMPILER=3DOFF"
 PACKAGECONFIG[PageCompilerFile2Page] =3D "-DENABLE_PAGECOMPILER_FILE2PAGE=
=3DON,-DENABLE_PAGECOMPILER_FILE2PAGE=3DOFF"
 PACKAGECONFIG[SevenZip] =3D "-DENABLE_SEVENZIP=3DON,-DENABLE_SEVENZIP=3DOF=
F"
--=20
2.34.3


