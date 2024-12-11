Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE1AE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 08:56:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.134])
 by mx.groups.io with SMTP id smtpd.web10.6323.1733907369159932257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 00:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=soA5dU4h;
 spf=pass (domain: witekio.com, ip: 40.107.21.134, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUVjOlYO+9zn1bkcX+Lpc3mej4a0Oty5sgpyUK600RxSypq2yKAesXIYVV0OAKg9dvUh5FhEUhWJcWYbkNWE2oos6+RRQTCdY/UsAWLjJqKrrPBJBimlKHifliWaf9b5KXIekgVBbO3NAxFZM0UKoi5BrXscVlszMdcKohKHBvEEXBBPGCxvsSEqaCuGfFltamuCmH7NVyO5HHkx1LSDy/t4lstd2gMqoJfZST7H/hdCZnBHkaZFxbp4Hez7juCE4OZX72NwLqPCw7CRtCJaCdCgk6Rt5Z1/4XHuXFmXPVTeZ7VY0fXh10FzsLZuRyDWbTCjmcdrtfVQpd4XDKuI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKWFPyYJCyVeJGlbcvjCdjZr9ZVPvQblrm8mcaBVpHk=;
 b=RGo+Hh2WN3TfqCSmNR+BqH2DRrdO1f3WiITZC89fpWYqOo4fI8URZ9/xFE/I9UojyIXoUZPmkkDTjLR1CJTsZZR6fY1oZs54D6V0kNSEBUOgXycPIaTRmhWW9rUf0injwX89mogI68WUVZG1C5p7NOoGwide5aGY/aeWeeAKiNRy9Fzey+HQSS26d67NaqzORUsii+7GlZHt+wMxN/omhNsoCjVmGD9Og7IBPg/R1Y1TBwZhFRtgMgZ9DkVIrotaMYelFAoj9sKmgXP+t+RgMToAy6QDlpO5f5O03TM7RzrHE1j8l6b6+ryzCVABGVftdkuW51t//0MqhL21C13igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKWFPyYJCyVeJGlbcvjCdjZr9ZVPvQblrm8mcaBVpHk=;
 b=soA5dU4hOMRO6OcGDkVbDMqPx1Jk5iLsqkTsHwr7zHj+MqgTzgXDoN0CYIf464Zu7oU9c9GZwutCVntDxJ7/idSPLHE+A+psnypqqJW1twzgxQile7fGz0coymbPuvxdrRcHknIXO4BMKZSHyZ2tNyscoLZxTtMeEjVcR7YU2VDLnrWaya2aj6Y/fRbMYAy5+vmsAsfUKy7oGva72jCUSqYBWkO+9WTHydAE3iYmV3E/BuykCWN0N02/t8nbe4XxGe9cqlyKvdipX+R0p89tTCTo0P+gvajE1kNJFRbXcaCZFET1OYHDEpaU89/sH+p5JucQ+mvUlOGbFdFxMQPM/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DBAP192MB0988.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:1b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 08:56:05 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 08:56:05 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
CC: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>,
	Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Bruno VERNAY <bruno.vernay@se.com>,
	Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [meta-networking][scarthgap][PATCH 1/2] mosquitto: upgrade 2.0.18 -> 2.0.19
Date: Wed, 11 Dec 2024 09:55:39 +0100
Message-ID: <20241211085540.6811-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::17) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|DBAP192MB0988:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e7520e-b6fe-48b2-32ef-08dd19c1a4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xYVpdQzGhFze0PD2k0B5s6bX/pPPqf9t0KiTA5Q+d6je9hRZkBOozg4Y0ise?=
 =?us-ascii?Q?ASINbZqcEmK11b0Pr1ttc2hcsa7MtS0X6ro82xtsp0ui5raZ2ifxn+EZLeKs?=
 =?us-ascii?Q?bQAjx1v06vLRaLlm4ie9CrV95WXV0TrtyRenwpSxrherrExSTmOK5ygClHzY?=
 =?us-ascii?Q?O8lxB8mE2MUDIHOSdOvakuvlBKX4Xj3dcW1CMOf6j3l2KRklqphqqpTp0XnN?=
 =?us-ascii?Q?63BoG2GAGyR9GUQeUxNxyC634F8QF1jECSprcK3HHmjri2FLJmTvOJrDcf7B?=
 =?us-ascii?Q?TzSMKPPuojDl3Pu469paexZgJwtAYJDIV7BeFZamcgShA6CwyDYmOXInpg9y?=
 =?us-ascii?Q?61eLIibCQfbGDiUrxrknWHNPFTM6ATe8pIXq+PfI86ZpQMrr9+gkePzSHyes?=
 =?us-ascii?Q?TwPyDkOA6P0xWaX5P/jGGoBvWpcMQXwP86PO2WVeCCeoDRl2P2fQX7JmbzzX?=
 =?us-ascii?Q?7umOvRoVAK36b77/zKmy+Vq8LX+j7DfTiqZSM8XFCcKb1lfPo5YRZLN16hUc?=
 =?us-ascii?Q?NbIdQdRXHKLjXtXJ8TdKR3ll1FKZaCMbKS/clbhvv0tK6bI1MDxk7kT2kAYI?=
 =?us-ascii?Q?2TTuS0/Bl4tIP4HpDq/Nja7Yd45sOETsKnql/r8vH/9r+KxgUlyjET2MG7ag?=
 =?us-ascii?Q?+j4DFwKw9WqRDbLyaLyU1fBayC7zPCmWheGYk869pavz4ZEPBRuD0lBWCGBL?=
 =?us-ascii?Q?r3fTFICN3j+NLhlxEJFNs8IY84L3YXUMemssQTuBWMb9lp79jRYRTTdOCpz4?=
 =?us-ascii?Q?OLSQzF6z34jIW812XXYScOfYG0/1lpxYo3vd+QGxtyon/mafpLf0LkoO9iZx?=
 =?us-ascii?Q?EFzbnFq2Qtd0TMbYfaSkUnhIFIK0KQiMW8XjZXvyH7tLurIUI8qTkgPd3trO?=
 =?us-ascii?Q?MjqfSyuAUXVmszssx75kHG9gzF15cnxMGSTlIBw404sIyRKrjfy90C1SMk+I?=
 =?us-ascii?Q?h/xd2N7v3KhdV7DkjEdKY7DJ0vuJ0/CITpV1Pq22Xg9yj0cmT2f5P4cVkgL5?=
 =?us-ascii?Q?WzZ8vk/U94P7n2Owj/IP/daFJYwpfFyW/zMbzYR3i51N361BXolId0C5S09f?=
 =?us-ascii?Q?NXsWkZ0qlhjcviRMCIkUtxC8l+mTd9czithWWj8M3r0FbNZ31ynuK7qdmeTk?=
 =?us-ascii?Q?IM/CjzHS44bjN23mZtM8CcXZcyvjz2vO+Xv1kcdX1fAqCGvc3cdNU1hpjaqf?=
 =?us-ascii?Q?W5+jmknO5kquurpKPzjb+j+NbnyInLQRLbTC5OPXqER3aAYXr+jDV2GHWXxm?=
 =?us-ascii?Q?K4330OX3b3AATv4Pu9g/9ygvGs3W5sQuQQMwWMXQEVMmJVVfzG9gv7cOac7F?=
 =?us-ascii?Q?P9BlbspMA4lg6LIiSbwklCZu6EE7BIc/PjHkn6FRN0dCgsItaQzOT2KDYn+j?=
 =?us-ascii?Q?ncDVk2s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hc9ROk2deNtj2gUF15tdED2cgD+sDH382vLJygbe4C4cbTip0xTUiNdKqNlQ?=
 =?us-ascii?Q?Q9Mz2jBzC+PUCFE+3VW+r+sV0nRHMhoB7Aqs+OWgl9m680wGtMTowDUBu+2H?=
 =?us-ascii?Q?tfz1onOPuPR0gGX8m6Y3DpqG2lef3osAOD38jdRYsiPigx94Kz0A+lHM0MGU?=
 =?us-ascii?Q?DPA9H8/QEK/z8FteamNmOUrS+1t+VAq/plAgZqvpLS+zsQbESt03CYaFSqIe?=
 =?us-ascii?Q?xMuL8lqBWYiX5syrM1uhT/vWC+j6r7OdPbr6Jb6yXSE/9+V0yHKLEVSWlUOp?=
 =?us-ascii?Q?xkrtb9Nb11PoVa2fAnM8h21NXmuVBmKF8YVzbA5dn4wFqgkBacWWa1hpPzrW?=
 =?us-ascii?Q?OxKZrKw0qFqtk9KRJw7Xs3e0/LtFNaZUty/gReL+zJDt8uhE4ZiH5ktkgaaZ?=
 =?us-ascii?Q?8L9lqJs8ZC9ovHggiVD87pzelT3uKa3on9WV4sKhwJmMzDJeuuomwYY5CSsc?=
 =?us-ascii?Q?1p9JHx5FB5X9Nx6Ry4HbOPaTQGw67TbbL98Im+LWUmmcCnkpEaCFZh7m+9/j?=
 =?us-ascii?Q?5ffZGHhlfxq8Bsm4pyBlWmOJqBgsPXeifh6D64dq9sYtpHL4d+eMbHHFEtco?=
 =?us-ascii?Q?+Ruch8YboGNDG5FEGUvUkM6gldKviLduJxYR+t7gqwy1bh8Sh3NdMujE+Cnx?=
 =?us-ascii?Q?kivPLpMguTVO95oHhGPdPIcblmNOxCuP0/QAaaV+9wFqMGxsJdKxKU65R5kw?=
 =?us-ascii?Q?OJ1/DsWaaMRsoiP2b2rFtqBdrkHSzVReiFBUD9keaHYn5+w+KMaYPnf8LfUh?=
 =?us-ascii?Q?f4SkNvEDrkLEl1asdvel3gzNlrc8ypbljfU6Yh4k/GtAYmthmsGC7YsVMuHL?=
 =?us-ascii?Q?L0YIwgoMLfqjyyGnTXdPoyDcb7RGHqZ6AMTRm5ouReHQ270mT73ZKKJU7Wed?=
 =?us-ascii?Q?M/V3AlNaEavJDgAieGy1490zqWXfLwWeG2eV52RYsJKE9vfxAjIeJWKgIgVz?=
 =?us-ascii?Q?mdCfXiWzIOEmStem1fv09k/LliAXKI8PhXOVExdB6HHrAUWTHjrbX1zgqbBC?=
 =?us-ascii?Q?iMajKTO9Ru9WdKh50GSLnYVuU5CudCARQGTyU+3SmYp/EMwK8zsJfS8UGCJ0?=
 =?us-ascii?Q?BBqsXaLhLarvHU3FpJ2O3U/ZSevYoW1C0uhQ8uZUGVtVsOvIoHGag1sM5yXj?=
 =?us-ascii?Q?LqdmlpWqQtOSk65aXY+UUgPJUPAiIT09R2j56UZ9jQvM3OKoHQxMXWXvkT+e?=
 =?us-ascii?Q?SnTHVjgFdjEdFA1hALGPnix2Cw5wfU3OFlAd1tVC6KkIzcN+5ydpaLGCIe+4?=
 =?us-ascii?Q?oKOE2wp6hSv0UJpD2G9woVQXtokMAbfTMN1gfMiN2UQrquSIER/7lJhGscb0?=
 =?us-ascii?Q?EuSOrCFl+VD1ZpUwuqoDwrbNNe3GxWltnNsRBIYMVLogWlTgFcwR6e99s4FF?=
 =?us-ascii?Q?uT/bMFSbdpSD+/6GL3BQXkupNMyqZi80/uVMIkUIobFywhDOPNbKFxYKRc2M?=
 =?us-ascii?Q?rGpvdRwF2xre7oVHbyJ/STDKICG9oho2tojuuWgacE57ipmoprtPiTry4kV6?=
 =?us-ascii?Q?jHwoeQukEHm2eQ8VejPDrFO7WwwtDPqm+suxHHSzNGhDY/PeE307k+UxP/Mz?=
 =?us-ascii?Q?Bw1RbgQ454JMSwL7kUtYlIOavMxuGxNZz2pgEwlG?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e7520e-b6fe-48b2-32ef-08dd19c1a4f4
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 08:56:05.0416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+bKezHCbIMkCCGFOWiKnz7W0K4QbzTtsnlwVuh3eKEknBEOPIVKoMNqWq2w3AhzNeV5R8XEUR/41WI2+wNeQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP192MB0988
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 08:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114275

From: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>

- Solves CVE-2024-8376
- removed 1571.patch and 2894.patch, already applied in v2.0.19

https://github.com/eclipse/mosquitto/blob/v2.0.19/ChangeLog.txt

Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../mosquitto/files/1571.patch                | 22 ----------------
 .../mosquitto/files/2894.patch                | 25 -------------------
 ...osquitto_2.0.18.bb =3D> mosquitto_2.0.19.bb} |  4 +--
 3 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/15=
71.patch
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/28=
94.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.18.bb=
 =3D> mosquitto_2.0.19.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patc=
h b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
deleted file mode 100644
index 627638ec8..000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1571=
]
-From 3fe5468f1bdca1bff1d18cf43c9e338f41aa9e32 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Wed, 22 Jan 2020 12:39:49 +0100
-Subject: [PATCH] Add dynamic symbols linking with cmake too
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
----
- lib/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -94,6 +94,8 @@
- 	OUTPUT_NAME mosquitto
- 	VERSION ${VERSION}
- 	SOVERSION 1
-+	LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.version
-+	LINK_FLAGS "-Wl,--version-script=3D${CMAKE_CURRENT_SOURCE_DIR}/linker.ve=
rsion"
- )
-=20
- install(TARGETS libmosquitto
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.patc=
h b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
deleted file mode 100644
index 7374cbd26..000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Joachim Zobel <jz-2017@heute-morgen.de>
-Date: Wed, 13 Sep 2023 09:55:34 +0200
-Subject: [PATCH] Link correctly with shared websockets library if needed s=
ee:
- https://github.com/eclipse/mosquitto/pull/2751
-
-Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel E=
ngberg <daniel.engberg.lists@pyret.net>
----
-Upstream-Status: Pending
-
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 9380a04..dce8313 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)
- 			link_directories(${mosquitto_SOURCE_DIR})
- 		endif (WIN32)
- 	else (STATIC_WEBSOCKETS)
--		set (MOSQ_LIBS ${MOSQ_LIBS} websockets)
-+		set (MOSQ_LIBS ${MOSQ_LIBS} websockets_shared)
- 	endif (STATIC_WEBSOCKETS)
- endif (WITH_WEBSOCKETS)
-=20
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.1=
8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18=
.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.b=
b
index ea9eb4857..c6ce2e095 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
@@ -16,12 +16,10 @@ DEPENDS =3D "uthash cjson"
=20
 SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
-           file://1571.patch \
-           file://2894.patch \
            file://2895.patch \
 "
=20
-SRC_URI[sha256sum] =3D "d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4c0=
83822823f4448a"
+SRC_URI[sha256sum] =3D "33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f28=
60af142abf82a9"
=20
 inherit systemd update-rc.d useradd cmake pkgconfig
=20
--=20
2.43.0


