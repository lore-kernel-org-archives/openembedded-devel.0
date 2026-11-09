Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1911.1794212298837873206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 00:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=OUVs8CAd;
 spf=pass (domain: topic.nl, ip: 40.107.159.85, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seApgAAGP886C9SHlMls55U4Hy/dYt8WE5e0vfmTLNOi1vLqDrMQy8cASJoFgR+41NTL43QrK8UDgm6JvWvhwu5aP8y6ftClS/hxay/yv/Vgrh7eSJByP72u48f/nYu3o9IhAHRNJu1oyUR/Ttx//nZcvHCQIrbKEmpW7/B/xrpcfhoL/3dLQ+lZOd602ZRI6TtwhjDctUtH8n9mzk9DqdL68Pkjkjq3v+vmpFgf/NZ2tg18C130yMsY1sfonxoGycZDCSqCGDvUB0HS+XIiGw2cET5Vvu0igM5tnXzE8EfLNAWlyzGQPrvjyZPQT9fzBUXh71kF2DGRivFouxZuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiK3QNfUiyBRK3JJdUII5RyXjO0pr07dzMXvvEujPPc=;
 b=Ygk7kh9nox36VgY1rpxwT1Qw0ONXusp3/7mSwZT8CiMPD0J2pAv5WTM2Ab6ATAxskBFglIaTCgAB/pLHTmHbzfqJTdMPmWoaFVJS3cF7y/9hXofAmxwOIQGi5FobcH2NtHTI0m6BKGv6tdhOtvyGKMg1p2qSHuHKpyynjaNb0aY5tlYtsVuZCBt0FckLUP1I7PYer6v2UfrkacaOsv0/WRgDlytcEo11ACHUbCgtY1rNHIa9WBzXkvdu0rAmojNsEujtA9MMcnO3pMGBb6SuuIRyVrsxnnAasNphr9WG/GSFaRoTu7m3IxzhMnDScK6+4yPrD3eXD3hZ3OQJoVVA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiK3QNfUiyBRK3JJdUII5RyXjO0pr07dzMXvvEujPPc=;
 b=OUVs8CAdxcUWPStSNBEzdZJ8B5RpB7BwzolnIebVFJKW+8vy43TAVXTYXM0k5g15lGSXXb3LWGPbW3JSd2bIhYnfCVuZrPDivAxCSbCKMclwVl8vchu+CoGDqJZkEDNAdH549iu5b2knbs29LeJqGIv8/ttJLJdm1fhF6+qAes60zNHsqQq2Y+RzxuVvWI6diLoDtjW0xuUP5tmhrJxp3hdNGaWbgmpMEa4ckpx2kKAnN3FKXjSLo22jOtkNIL6HciH0MIDe/7R3LPlpGi+xN0WjRI20+MOq5OJeqsNjK5BpodEYIs+oc3ahuo2va4kAp5g9dspoMDg6/ka1DK+m7Q==
Received: from AS4PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::7)
 by DB9PR04MB9451.eurprd04.prod.outlook.com (2603:10a6:10:368::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:18:12 +0000
Received: from AM1PEPF000C1ADC.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::9c) by AS4PR09CA0020.outlook.office365.com
 (2603:10a6:20b:5d4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 08:18:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM1PEPF000C1ADC.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 08:18:11 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.94) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 08:18:11 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DB9PR04MB11658.eurprd04.prod.outlook.com
 (2603:10a6:10:608::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 08:18:07 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 08:18:07 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
CC: Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 1/4] mongodb: fix build with python 3.12
Date: Mon, 9 Nov 2026 09:17:50 +0100
Message-ID: <20261109081800.69803-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109081800.69803-1-mike.looijmans@topic.nl>
References: <20261109081800.69803-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.432fda13-23e3-4ad9-8968-f63f2a27b225@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DB9PR04MB11658:EE_|AM1PEPF000C1ADC:EE_|DB9PR04MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: ebed1154-a770-4ecd-fba9-08df3e39fed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: bYjteBfzYpgivouriJMoowUt6oqUdL7eqjCJ8sBx/6y2xQfCuK8chvJ9/LSvaK5QdV1TDg/1xGuENt1kDBT72OZzeS7iEOm8o8s9I7uyfKsiXPgNnHwhCA8XE2KQw/tq9LMX5gyAN3WLXGo6fvRDpJzSxeUGKbCjEdpgwS+koz/zihBShJQPdoWEhurCCNi6GDPykYEm4MDRdkf2WH9GKXWxbN0/PoDreYbjdcNED/imX6J786JBCXUrlXIv//DtlYouTQRLrm3HR6+jCbSPji8OlJsSILvrtNO1AN48/MtJijb3leHKUdaaiU1lLZCvwcp34eJPbCbgybfbBrOHGoaUe6LNvG9K0YqSAS0yJBi0XfDr+UuuCuiUHABaa40LWFNq2EKXQL0w6elfGVBI1991t/SMsUB9NjdyfVPYgLHCJVawijTKCOzva77YgFvGOASCJUTB97Unzqa1K1XPMUxBcCDnAXD5uLHmx5aF0jZjLEwPvGSQkuDn5H6chAdgEtDWPPAdw5M8m1GzPBe7GZrvdsAevN4G9BUDo1WUzl/gfAL2VZ6V66+ca8JodORcO7a5w3H8I84VMMICoad4ZFsTjabNi01bSLw80yOhSdBaKijnU8bfNh8zAueONAOGxR87tMzvRJITm9FqJTp3ysyC+AJ1P5EmyFYHdFUNT5iK98lHPn9Jj8ry4C3Hl5VzZQrgHIEMluUKMu1nsH4wAcJFmiAf/nLwJaRjxZyjjbc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: 3xKbOGFj/IdJ4px1EUMWpmsSRwT3KQqwEZo/dpB/AyzBDBeuvZxwZQ1qmwqs6Qsmtx5wmF05z8suiOFBaN06gSxa6DkLYkPYdQJpyBVL9jbSejPSn0j04WXPqX4EDPSnpgN4jx5ylGZ2jILKPC9YiZIfcSgKQBMw72g/wJiQJRgv52NviSwyOmApFkBVb4z3aPScv5ZvDfVBK+FvG/yXya6QPDECpeXTgm2vyQ4GspHL9vaPv/voOipvWuuQtiSrQeen4l6irh6jBfmdnfNjl1pGGSdbgsp7nyuJUUwqxcKIB4M0WZoWYEmayquzvqQ8cnTAlneY6gqMAQup5wYVEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11658
X-CodeTwo-MessageID: 172b047e-2049-46bc-9655-f9850fad5b73.20261109081811@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000C1ADC.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 65c263e4-de88-43c6-1789-08df3e39fbeb
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|35042699022|14060799003|1800799024|82310400026|36860700016|260925022911599003|260925021911599003|260925021311599003|4143699003|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 6Hik+K1HSIN0j72B7zQDa53CPFO6MyAcUi5M/H0CQW0rwPyPCZ1StsZfqVKId2nPKWtschpgWTcBND0aisQX6dlH6bcViydgsV1mWKaeEvCitRnh+AUc+OPlN7j/Z8IZb674g23bu21SJT/HJA0pjNXS1FbwcBxGOCaLfe3F+PUuKgLLewq7jlHJ1RfyJeQJf/bTRkWXO2gJZNoqEp8Lq5JYyIdr306KgwMXh6Chvk/L+5PmVsv45FZQ/hk9Ix7wddz824YgjrWEPTvlhNZSIcPrZRPPcRUpl6hHBQJWQkdxRirzIXDVQsDa6rruxFlrqfmZuX6/76BQcUoYw1HXOg9xwQRjQgkL7mtMbywVXFVQjyGxPxWIVhV8CQa7LIrCGhkaalILS2fX5DbQlxP85bSz2SUTyvFqDCZrcib0hbCphDDxdz0C0+sGgWHRFqBH9B8IDRlfjsDBXNv219WkxMKh7ICbtKQlDCRk5lY3EPQ7wbBsn29GcLjgoha03MnZNwfuQVqhix9ChMk3LJj+2oezmUaAnzPoRPm0tw0SSLCXVDUh/vaonrLgu54bK/jYMLiIN3YCSmW7zRzkiYOT1qU9qQHzuNEUYj/0BaIQc24yhfTzB1UcFWwPp+uhQ5Iid3iawCVF0hvq0IpFcF3PhA==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(35042699022)(14060799003)(1800799024)(82310400026)(36860700016)(260925022911599003)(260925021911599003)(260925021311599003)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gL8JpctHYDp1TvcdoHQ89jYEf8voQKLRYxGgP5a9L62O8MwAXp5mBe0Ezz3npJPuQbbsRtimysvHyqCfu3gs+L7VUmXOBENPR6eo7CmojGJWIkcNMQYcgf9X98v89dhrDlnxx2miuH5g2riVNwJ97+lyu2WQ3RBfpP0JKXDEqfgX4MGLAqNGMZtgi5qYu4cnXu9+3P+6yI7c+WyhYffu3ekS+Sg2p4kmJORnCV7jg/w0h8RPF/b3QhDT8mmQbKL8c/OuprIWWvAqJd4a2FXUL0LGyjN/81ogJIRXW9mODJkazqUf/NmeB7gtLzGsvC/NtVlKWmcqjYDaAVnGXAHmUnKqOBTjveet86mMBikhJ80acSrxn7dU9n536Jeu3v5i4ZrwBDojhcXKogAozr4iYo/FbDU3v0eFQAPSh5kXKXw/D7PSltRN8RN04egpM390
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:18:11.9169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebed1154-a770-4ecd-fba9-08df3e39fed8
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1ADC.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9451
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 08:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132052
Content-Type: text/plain; charset="utf-8"

From: Awais Belal <awais.belal@gmail.com>

The moduleconfig.py build script uses the 'imp' module which
is deprecated in favor of 'importlib' in python 3.12. This fixes
the build issue by replacing the affected portion of the code
and the package now builds fine on hosts with python 3.12.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 ...econfig.py-python-3.12-compatibility.patch | 57 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  3 +-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/=
mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
/0001-moduleconfig.py-python-3.12-compatibility.patch b/meta-oe/dynamic-lay=
ers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.1=
2-compatibility.patch
new file mode 100644
index 0000000000..51926b9d2e
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-m=
oduleconfig.py-python-3.12-compatibility.patch
@@ -0,0 +1,57 @@
+From 37580777bc5294d606584f3731d9f5f5425bb587 Mon Sep 17 00:00:00 2001
+From: Awais B <awais.b@rufilla.com>
+Date: Tue, 4 Mar 2025 11:27:10 +0000
+Subject: [PATCH] moduleconfig.py: python 3.12 compatibility
+
+The imp module was deprecated in python 3.4 and is dropped
+with python 3.12. We now need to use importlib for the
+purpose of manipulating/loading modules.
+
+Upstream-Status: Pending
+Signed-off-by: Awais B <awais.b@rufilla.com>
+---
+ buildscripts/moduleconfig.py | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/buildscripts/moduleconfig.py b/buildscripts/moduleconfig.py
+index b4d0bba0490..69dd91ab30d 100644
+--- a/buildscripts/moduleconfig.py
++++ b/buildscripts/moduleconfig.py
+@@ -27,7 +27,8 @@ MongoDB SConscript files do.
+ __all__ =3D ('discover_modules', 'discover_module_directories', 'configur=
e_modules',
+            'register_module_test')  # pylint: disable=3Dundefined-all-var=
iable
+=20
+-import imp
++import importlib
++import sys
+ import inspect
+ import os
+=20
+@@ -71,12 +72,18 @@ def discover_modules(module_root, allowed_modules):
+             print("adding module: %s" % (name))
+             fp =3D open(build_py, "r")
+             try:
+-                module =3D imp.load_module("module_" + name, fp, build_py=
,
+-                                         (".py", "r", imp.PY_SOURCE))
+-                if getattr(module, "name", None) is None:
+-                    module.name =3D name
+-                found_modules.append(module)
+-                found_module_names.append(name)
++                module_name =3D "module_" + name
++                module_spec =3D importlib.util.spec_from_file_location(mo=
dule_name, build_py)
++
++                if module_spec is not None:
++                    module =3D importlib.util.module_from_spec(module_spe=
c)
++                    sys.modules[module_name] =3D module
++                    module_spec.loader.exec_module(module)
++
++                    if not hasattr(module, "name"):
++                        module.name =3D name
++                    found_modules.append(module)
++                    found_module_names.append(name)
+             finally:
+                 fp.close()
+         except (FileNotFoundError, IOError):
+--=20
+2.34.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 23515d9fa8..0f4a5c4423 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3D=
v4.4;protocol=3Dhttps \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
+           file://0001-moduleconfig.py-python-3.12-compatibility.patch \
            "
 SRC_URI:append:libc-musl =3D "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specifi=
c.patch \
@@ -140,5 +141,3 @@ SYSTEMD_SERVICE:${PN} =3D "mongod.service"
 FILES:${PN} +=3D "${nonarch_libdir}/tmpfiles.d"
=20
 RDEPENDS:${PN} +=3D "tzdata-core"
-
-SKIP_RECIPE[mongodb] ?=3D "Needs porting to python 3.12"
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
