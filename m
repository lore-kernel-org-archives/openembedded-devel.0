Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D69C61DD3
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:42 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1789.1787856817244885216
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NpG2CKv5;
 spf=pass (domain: est.tech, ip: 52.101.70.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf8L0Z0D9wKb4lsPmPdnxfFUzojxUACJ8bqlKE6q5YMl6GS9aKosrYjpUmV8QMW8PwTs5hOV7S1D7uwxHTNfzJdPYg4pLX6NB6DL59J9Rzil04lCdBBRnRLGDPhDzJm0qvK/9l+G4GrnhDV7D2wtiKo50op3Y5s9Lt+otaGvc2DJZ/ejOaKCbnGBnt17FbDJ/cxPStRHthZZlvkHYIXZOh0MHLzXglyRJ7otx/8WS5W4nWSIjtbcXN5t8v6hYCZgVbop+PU1oa1zb2khj6ugZRnlsPLo+IkKr4JYNDIkpN3ZNvaY8yJWYLMKjctsGGzFHcFb1vp7/qSMydWgeNdQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hm2B81oJH/YqXqxfV4Gd4R/8RIA7TfY5zhIHwDpmocM=;
 b=cLxc6H1x2X6M1X9yLY9wN3BL49enfBF3++2j8iMDfE0CHI1zdmzl/6dt+7WlU9hKPnH5wwdJvQ4PMQkX+Rc/QtAOq9Qsw5trV9dW/QaRragOMMIHoMDGJ5F4b6dGQ05eLwu7MZ0ZpgqwoDZoFVgHmjI0C1xb2zfYw3fZl9tmpj3K5MpX5apyf7ENH/ij1sgDjLmiqbaSXGGqygtfsmqm2Gd5ThEMDPBF3nu//ogWgYa7+6HbXEzy479okJ+8w/Hmc3wfSIfJ8GlzghfeOS7gHcFwR4MuJ/64EMFdIm9z6BE1wNOJr8MLRo/qhFbGUHeXPYSg4Ucw/geYdH34GLkAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hm2B81oJH/YqXqxfV4Gd4R/8RIA7TfY5zhIHwDpmocM=;
 b=NpG2CKv5p22UJ0RAd5wyuglbEy/3yId3EcuufMFO+StWfXxRhhNqErZyaYrDrrdfCgyei0INeRq/q0rLpD+bFl3V5rieCPbqn5D+4GNVkhUh/vKFskOeF4FMqpyQ1+xsLtZ340ytQ0q6tTX0e4Zfxpz+2I9lNU0Ul1GawMNtABn6X2Ci2lM8QKDagcQtqnSBaTKJkH9NZF/Ly78BvdavjFsHeBhWlFs2ooYnbvG03xau/oAIZm47yfRuFKhP+d9JTXXu6LtGSKvISBxm9svhlECSj1wegYKkK6HH51PFuk7HCpImPj+O1bUpa9Brw2RR4rFgQjSG7srKKXm3aj/KkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA2P189MB2706.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:424::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 04/20] libtorrent-rasterbar: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:08 +0200
Message-ID: <20260827185324.78997-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA2P189MB2706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3140282d-f152-4558-ca02-08df046c7f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|13003099007|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	AqtQ480lU53MSNoEKO5Ryd8zioT/15lAZ4sV/NzzeeaNnZnrh/Qljaee5cjnkMiJyC1XhPNMbefEfvPQ5+kmZTKIVZP/UXyE60hszjF8TsttWkMPRnVhV5t6VOUp3oXi0RI4iTZ8S7CySWCZ5RAZAjLZX9Wi9glPTT8nv8pVGw9o/c6MKJ/2wWCOYbmPk+o8MfNguZshIGoVjXvKwJPiA3OqpuucYdqHldbuhq1NaV3+sqL1/hIOY516dlBpCzS1W8kCyFeGtaTljPLk3GLGpU6MvLuL9xmKAt9u6+kERqa79tlUpV7LPC1XZhCANuMtvQPPIF6djm/dgTYim+eEnwwOsTtR8A0z9nJKtSMTJvEuARa0oOIRkGHwGBnccA8ZILoN8J6t3RWb9Beyvxf5PgpiTgPgUsnSdtRPG74gn04J8fw63Ki7RfK4hmB1xRdwmmunKItZ9KuUL7y/iWR6VV1YYotCEvjtS63fbWgBIZIt8p9bnLcpMZ3p+8MTjyi4jSHT19krMrReAaqUSiidA7xVxEjBD2N9TzsXbBAWih3GPEHKE9yS2X0kNCCER8KgkJ8DAu6fPjbxDTDNMW2Vc+jEn89kjh3QPpu+Dlpr/rTk0py2B+3pbNUB5FwJdWgk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IOzm6vCeeqcy/HXKwD0bYX5WRxn4kqzuvYsPZpWqDrDYX5BhuJdzwOB03c0r?=
 =?us-ascii?Q?ow6VctfiIsqq0aLANWVDhBOx627B01iv0PPLlj2I9gUayGVMpJ+61RDG99T3?=
 =?us-ascii?Q?TV1JL7fXh64IuIovWxMhDg0vg39cypZM0nJGxWRxt1s47YnxAGF8v+V4Qyj9?=
 =?us-ascii?Q?Xx1ydyTqUjhKz4f0EAXCpzDAyvrIA+f6nMRyCP/JOOuKUK9wBtp7b5wvZZ1D?=
 =?us-ascii?Q?u4euHRaXY6fTk9pEJGLUbPLOLt8xJ0El3ifcuI36SzySxHIM71gIcHBKt/V/?=
 =?us-ascii?Q?tuf7Xyp5WdzO9xQUxSflxph2ttEqnYRMQY96OX9NVNpuvW56uUi5V2hEcEHr?=
 =?us-ascii?Q?AvPnpCTk63b1sHKAKPUFc46rl6tjEPFwCwNq+fL/SoMrnSn9NgOLw3eZVthx?=
 =?us-ascii?Q?YhpnJuilKFKoCJ3RtSUJQ2DvwaFtrvlA0f5RhQEnpEc/vYiO1iYUMH7tFuTJ?=
 =?us-ascii?Q?AqiERyzHbSZBdvHLHU9WqFU1OH0cSZiWz4qupqrZoxsKiG7WjjLZ/iDCgptK?=
 =?us-ascii?Q?GSXvDZxKQqgXfFrp3r/bZWJVU+DxeJ4TXMgcAL4/JpagZp8y/Mng/VD1BTJU?=
 =?us-ascii?Q?IEq2e7yoSgdGaj+MlpJ3azrEmsWL1SDnBmVX2Wpx5r2PzXh+1laLEhln+Bgm?=
 =?us-ascii?Q?KWTgwfSK339/jPBNROLiQRWme+llANzk3yqfxp6QcRWlRP+eG2y9GAl1wTCp?=
 =?us-ascii?Q?YG1GoHF0hzQ+DEskKQUikCqqImK2MWEIj4YlrkC1VEqQqNQt3q8Rb5LwyKbj?=
 =?us-ascii?Q?UcL1Qhgtc9LwqHDV7GADzgqVF7LmF1SLxu3QnGhQV+9L7sKBbIIFmJuCUY2u?=
 =?us-ascii?Q?gz7jSOmPfebB6Lu+i9De0fZmNBgCSmF7782zuOzLs+UAHkRUhrvf2FiQcCDc?=
 =?us-ascii?Q?DhQpsLNQjjoGlplbKFuiXiT/ecbE5bXaP6rIASlsVHFBEtqRzk4tbpeN59vt?=
 =?us-ascii?Q?FVg9J7EKwWP65DFKZoklVINm/jDQaBsIbO5Am3ZZ5YcVamU7PaqeS/uMTQo8?=
 =?us-ascii?Q?aS3yfOUnndlZRBlbNjWdON5kxCJTHCT6D6G40ajVi6byS39zcX/sEMQHklVe?=
 =?us-ascii?Q?mUcdiS87EGuFbXvMk4iVECvm30Inrm3fB0QEG1b8yJt/0LZoalz7d1jqcK7E?=
 =?us-ascii?Q?7oU18LBVI2sBWtNh2SeYHuSYDygHVPDb/rjncHQyqaA1efFluTUsjq3Cltsu?=
 =?us-ascii?Q?2MbOKfpFPXFEimp4sSiwoAQZO2MYQ6Am/4P41oifRJaWbnE/1EczfZuIGaXv?=
 =?us-ascii?Q?gIwaN1bap2d/9DpkcriQkSmadCsFUqmzfbnIN8uxG0UEdHpB1BMXmlugvCLH?=
 =?us-ascii?Q?c+cWLq3yaC5FwwyeNQEMmQrlNXqMJLhj95uQ0hqD/X2vlk1fk59ed5TZ7aTW?=
 =?us-ascii?Q?FUIdveKjirFZcfav9H6gPBzXWw12LlON2+c+PEOPw14KFEl79rVOZ6b46xSE?=
 =?us-ascii?Q?x38zVijhHY7CKpC5BNKVAs3P5wiIjM7Oe/G0cBzKgvSw8YTDDa22NVLp6t5V?=
 =?us-ascii?Q?t5zm/42aGZE69jegIoCrTTYBVfm1tCPFWvsLlp5PK0BNIgCBXpV0B2kTN/KR?=
 =?us-ascii?Q?V9MmcyDxXyuJNI+enDp886G6YHpwNgsreCy/TV8MfFWxCuvAtJcbqBZSDF73?=
 =?us-ascii?Q?gb9FOj5zGtQSIJZ1vpsFT2v4KIQeHArsUFCRifZ2Uj112bkEKxGVjsMcEcvg?=
 =?us-ascii?Q?Ak6zWoVHTJq4+lGY3aFP4Tvnn8txt5nxaF8dFBeVRSmRD0YPNeEo96IvgkYT?=
 =?us-ascii?Q?ZHUzvvYUY0DAHw5fVzswZzeNomKhWC3rXn3apbVuRVusXb1odfzyI1TWykPB?=
X-MS-Exchange-AntiSpam-MessageData-1: X8gmQUPwDISKeiaTlG1RrHPhM8/OhaMO04c=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3140282d-f152-4558-ca02-08df046c7f59
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:35.0401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AAN6TGLovFpaqYhsh6HJvzlxzLaXP25qlAYARupDPAyNsJ+m2Q3auUTIJ2UbQE5X1mgDe2lY0FSreovCDlf4uqv1DlFKH2O85IG8TVUMr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2706
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129538

OpenSSL 4.0 makes ASN1_IA5STRING opaque. Backport upstream fix.

Upstream-Status: Backport [https://github.com/arvidn/libtorrent/commit/50bd=
3a46c2c5]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Add-support-for-OpenSSL-4.0.patch    | 61 +++++++++++++++++++
 .../libtorrent-rasterbar_2.0.12.bb            |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/libto=
rrent-rasterbar/0001-Add-support-for-OpenSSL-4.0.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-r=
asterbar/0001-Add-support-for-OpenSSL-4.0.patch b/meta-oe/recipes-connectiv=
ity/libtorrent-rasterbar/libtorrent-rasterbar/0001-Add-support-for-OpenSSL-=
4.0.patch
new file mode 100644
index 0000000000..5b3407fc52
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterba=
r/0001-Add-support-for-OpenSSL-4.0.patch
@@ -0,0 +1,61 @@
+From 50bd3a46c2c5ccd7298415d1a66ef27c96d0fa2b Mon Sep 17 00:00:00 2001
+From: Chocobo1 <Chocobo1@users.noreply.github.com>
+Date: Sun, 19 Apr 2026 01:01:53 +0800
+Subject: [PATCH] Add support for OpenSSL 4.0
+
+The accessor functions for `ASN1_STRING` are available since OpenSSL 1.0.1=
 so we are free to use
+them without conditional guards.
+See: https://openssl-library.org/post/2026-04-13-asn1_string/
+
+Closes #8268.
+Upstream-Status: Backport [https://github.com/arvidn/libtorrent/commit/50b=
d3a46c2c5]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/torrent.cpp | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/torrent.cpp b/src/torrent.cpp
+index c6564b67f82..7fcc75b3ed4 100644
+--- a/src/torrent.cpp
++++ b/src/torrent.cpp
+@@ -1630,9 +1630,9 @@ aux::vector<download_priority_t, piece_index_t> file=
_to_piece_prio(
+ 			GENERAL_NAME* gen =3D sk_GENERAL_NAME_value(gens, i);
+ 			if (gen->type !=3D GEN_DNS) continue;
+ 			ASN1_IA5STRING* domain =3D gen->d.dNSName;
+-			if (domain->type !=3D V_ASN1_IA5STRING || !domain->data || !domain->le=
ngth) continue;
+-			auto const* torrent_name =3D reinterpret_cast<char const*>(domain->dat=
a);
+-			auto const name_length =3D aux::numeric_cast<std::size_t>(domain->leng=
th);
++			if (ASN1_STRING_type(domain) !=3D V_ASN1_IA5STRING || !ASN1_STRING_get=
0_data(domain) || !ASN1_STRING_length(domain)) continue;
++			auto const* torrent_name =3D reinterpret_cast<char const*>(ASN1_STRING=
_get0_data(domain));
++			auto const name_length =3D aux::numeric_cast<std::size_t>(ASN1_STRING_=
length(domain));
+=20
+ #ifndef TORRENT_DISABLE_LOGGING
+ 			if (i > 1) names +=3D " | n: ";
+@@ -1654,18 +1654,22 @@ aux::vector<download_priority_t, piece_index_t> fi=
le_to_piece_prio(
+=20
+ 		// no match in the alternate names, so try the common names. We should =
only
+ 		// use the "most specific" common name, which is the last one in the li=
st.
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++		X509_NAME const* name =3D X509_get_subject_name(cert);
++#else
+ 		X509_NAME* name =3D X509_get_subject_name(cert);
++#endif
+ 		int i =3D -1;
+-		ASN1_STRING* common_name =3D nullptr;
++		ASN1_STRING const* common_name =3D nullptr;
+ 		while ((i =3D X509_NAME_get_index_by_NID(name, NID_commonName, i)) >=3D=
 0)
+ 		{
+-			X509_NAME_ENTRY* name_entry =3D X509_NAME_get_entry(name, i);
++			X509_NAME_ENTRY const* name_entry =3D X509_NAME_get_entry(name, i);
+ 			common_name =3D X509_NAME_ENTRY_get_data(name_entry);
+ 		}
+-		if (common_name && common_name->data && common_name->length)
++		if (common_name && ASN1_STRING_get0_data(common_name) && ASN1_STRING_le=
ngth(common_name))
+ 		{
+-			auto const* torrent_name =3D reinterpret_cast<char const*>(common_name=
->data);
+-			auto const name_length =3D aux::numeric_cast<std::size_t>(common_name-=
>length);
++			auto const* torrent_name =3D reinterpret_cast<char const*>(ASN1_STRING=
_get0_data(common_name));
++			auto const name_length =3D aux::numeric_cast<std::size_t>(ASN1_STRING_=
length(common_name));
+=20
+ #ifndef TORRENT_DISABLE_LOGGING
+ 			if (!names.empty()) names +=3D " | n: ";
diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-r=
asterbar_2.0.12.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libt=
orrent-rasterbar_2.0.12.bb
index 6a61286f7a..726bb059ef 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterba=
r_2.0.12.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterba=
r_2.0.12.bb
@@ -8,7 +8,9 @@ DEPENDS =3D "boost openssl"
=20
 SRC_URI =3D "git://github.com/arvidn/libtorrent.git;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3Dv${PV} \
 	git://github.com/arvidn/try_signal.git;branch=3Dmaster;protocol=3Dhttps;d=
estsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/deps/try_signal;name=3Dtry_signal =
\
-           file://0001-Fix-Python3-site-packages-path-to-fix-package-QA-Is=
s.patch"
+           file://0001-Fix-Python3-site-packages-path-to-fix-package-QA-Is=
s.patch \
+           file://0001-Add-support-for-OpenSSL-4.0.patch \
+           "
=20
 SRCREV =3D "740a0b9aeabe00e762cc0efe4a0f27593db2550b"
 SRCREV_try_signal =3D "105cce59972f925a33aa6b1c3109e4cd3caf583d"

