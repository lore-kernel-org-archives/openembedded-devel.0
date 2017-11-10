Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 466 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Nov 2017 07:19:26 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0117.outbound.protection.outlook.com [104.47.2.117])
	by mail.openembedded.org (Postfix) with ESMTP id 5865E6022E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Y6J3idaRTtBVKEIpS7fB+ReJmfjs5LiNprv0nvgUJMA=;
	b=kWoTeHuhCv09ueTKLhNgs1QHP4Hgxq6d3MR6aymsf/RrA081eAqCEsAduYV97K3EJSQwRZek9pldsvT+OcNDCPutsBhjkLYM4fHISoJYQhXriet4YVWcLNP1qZCtmISQzsFAoR6iDOVFUH+i47vU3dlLfUVbnO5dWCsr5i0k5yw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	VI1PR0202MB2592.eurprd02.prod.outlook.com (2603:10a6:801:7::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.197.13;
	Fri, 10 Nov 2017 06:45:03 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Nov 2017 08:44:36 +0200
Message-Id: <1510296276-21147-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR0501CA0010.eurprd05.prod.outlook.com
	(2603:10a6:800:92::20) To VI1PR0202MB2592.eurprd02.prod.outlook.com
	(2603:10a6:801:7::8)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ecef0ab-67c9-40fb-1b4b-08d528069250
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:VI1PR0202MB2592; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2592;
	3:xPsTuw3Gk7K/eEKWRvSRXUvbh+igNGumaR+rEUjqWseT/jsecSVWofHLsf2OMn6QS7Sg19s5Gr7Y06JYzCJ0YyvNxWWF0/UPHIzcEBYhCX7udz3Kl+a15/HIsEuxTu0Tpwv/b2w/sjG2PCgO/XjNHBPnn7qkBE5Z/DYdgwJGZB/IwWbdCFvozCrVuE/nK45WgEwMPR4oGObt4d1nAtMYnm503BZ+IG/MwLFiSWwdAQhvvXEScCUhv83KfwPR2q6y;
	25:oAw9+qKlnwADinbIZJ746R/9om/qtsfVbdxRDKgorqk8v3t8ZVxHuoMFxPYNYpBInGLrbrtFpreZQol1wM2EfSVa+f81ln2MzezvpmoS4te0eeMZjyHmuX/9ggLW03q5kc/ON7x7LYjt4Ieftbw24JUi1bRT10fLImwv4GJNSNFzyoLPHGpv69XA61SJrcQEtoj2ga6LDXzmVstlnMIfYae4h5s0VR+X5gW7Hnoh5kG4P4OfP0v9AQdMRfgtvr3Gn+jaX6HqrHM9ELLIU2rHv4XHrIf/kcKIDk4y1hfWveHRWLlpP64Rqy1hruTQFSpXJsDQeVg8LninRikeuDySRA==;
	31:YTvwDMSBVWyb5rdGKIJg0ZZe2LBRcL0fTvsH9sSHRU4pP0jMl5O1hoL6eJMFPapg6x7FQJmyza7JW5H01sgWo0J3FflA2eQOlIYLWivP8UVCuW2AsycJElKAx6Nzlkgx8W0sde3KbFU0KBGSkvBMndgChNncXsH5MjcjQVBj9rOqTz0jzJ/fgqZlCZwbHKzjFTLmC6Cp4nGMshc3Iq9k76/GuFx8BzUqO3+TL0Aokio=
X-MS-TrafficTypeDiagnostic: VI1PR0202MB2592:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2592;
	20:eDFCn04Fv5zuqMuPJta/3cdCG5zYpquP9aGinK/iubLPPmWOpfDuUrLcRbviP0qwcw4d4Y7WGWCULb2fNUZxreq3aAy0kxZN7cF9P8njaP+/fKaQ+sH7bowT/uD1gIv+F17VWUnMxfg6j/2BAVj8BeyodLzFWk2j+u6ki1cO3lzj7SCeyvKX5WZnp01aGi70Tw6etZBZxgfwkCbTIdz9R97thUNRi1utnT0kgzuaaTLEE7FZMzhpQb5lhZuYsx7osSF+vOQCAxeUYsZQ6G+gONQWSrG3phEk7kzyfRVYXKaEcpPHM5iIGrsH4bvH1D4v+SUk2d0gh5hh1fgsisjpCO5oc5hsCYHqNS/zSZGnD4lLwsAlO6vxm19su9gbR96Tscu9ni6wRn09KBDP6vAqXT3YVWqG3aeCgyB8gQg9qltPTAwW6mzEMRs753rFMRucqpJKCN+0fV08hcvHYe2xK5Q9QNxhu0YeUkJ+W4L6NkkaQ5CGcDbxSRn56L252Saa;
	4:8ASGeSbJe8HfUiL6bzs6fCMJkUGlCApW6HBx/yr6XUizlLrm3zH/sPMkN2+XBGyonWTE+o09B9O8oZ+qZwt8VSdBBahPBPgkDRVp4kswiROAL9rojAOovVGkMOCqfdqJ9Sfc7SYfR3O7ef1mUJ4b2HX9dbT0kSfBVuieLX+zBMy7F/fGZBZTL7J9pc3HhJdm5TscvN0/ST5/9W/QJIameajnz36gKcLS8pg2V5hZX07wgqn+OoFzbV88wC63FJ3tufxvWHR49WjcixNgtGEQz/YZYHfI3vHAiUvMhdo5QbedkmOYffH1q1ZH28XjvD7I
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Microsoft-Antispam-PRVS: <VI1PR0202MB259277E424522223D733F85AE9540@VI1PR0202MB2592.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3231021)(10201501046)(3002001)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR0202MB2592; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR0202MB2592; 
X-Forefront-PRVS: 0487C0DB7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(39830400002)(376002)(346002)(189002)(199003)(316002)(97736004)(66066001)(47776003)(69596002)(105586002)(86362001)(33646002)(6506006)(106356001)(2351001)(6486002)(6666003)(53416004)(2906002)(2361001)(16526018)(53936002)(101416001)(68736007)(3846002)(6916009)(25786009)(50986999)(189998001)(305945005)(48376002)(6512007)(16586007)(6116002)(7736002)(478600001)(8676002)(74482002)(8936002)(5003940100001)(5660300001)(50226002)(50466002)(81156014)(81166006)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2592;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0202MB2592;
	23:Jx+4wpy22dOZfTj+mdEgyC3HCeG0zoKJpApvDyu?=
	=?us-ascii?Q?1PQ/5Ya024fn3RBFPljX7lyu3ReO5DCCsflARkSO4raLreeEYUrYGFo3wwhy?=
	=?us-ascii?Q?shekiDoJqlrjTNNvPAqM39u0HkB7IeaNlDbbJcUM6/yDQlNX+PngIRn7Jt7X?=
	=?us-ascii?Q?5MG3Qc8OMdx2B6+4947pheVAvwG9TGIeT3rSxLHyxsu4kD/ZdTRvx3LsZsIG?=
	=?us-ascii?Q?tDuUsdMMkyDlJ+2mVLdz1jYAK5JyXHoEa5vfy9S2qFxh9fsHBcG7+uCA5Sw0?=
	=?us-ascii?Q?xz4JPzhFcRCXvQJo3Cj7RTrLh4YFEZVseXqhOAAxd3q02ETyF8UzJkL6GkxL?=
	=?us-ascii?Q?ExpLft1XGCIR+94tofCXUjE0W2e6MX6MnT2IvfEWGRvs7/8HtUbgSaDigpe8?=
	=?us-ascii?Q?jMvqO4BMif1Fq5LuMZzj49mPtvDKmMQjpVjM69l7KeuYXGvB56zjRs1meu9q?=
	=?us-ascii?Q?dAfEhU51gJ3FZnV/hiWxKvPdvawJnNgLgDGhP5W9QF5CIxcjcOeaPyA4dkIv?=
	=?us-ascii?Q?GJgdWeS5JGiyFA++KaDZSDPd4IrOWO4J2W6csC3QnE3PaLQaObmqZMTBXmTf?=
	=?us-ascii?Q?Tkf6NywVcA54Xuq2dPfM1dGuW2eEVTRANc9tX300oYaNt27SX/wCADfs3AV+?=
	=?us-ascii?Q?UvpaK2nTU/1/8Hcy2KYcT/3FIrWc97rwXBJ/bOsxXX96NF78b8UaqycQ3d3w?=
	=?us-ascii?Q?yZvv4kv/pLLHUiUdRyhFyASHlz5vLu2X0Tt0UL4Si/MK6nAl0fnQW91kJq77?=
	=?us-ascii?Q?yLmr42foYGt899aRt6ez8firDF/zwX7lqJDbc99lDT344dtcsFhuJCUqZgXM?=
	=?us-ascii?Q?lw0oJwyq7TXO7trlfpMIRkoX/uW2pGW51FE6Q5ZK5aZWVhi5Qrt2+YU+CxFr?=
	=?us-ascii?Q?KVZxK34RQHLuLnNZfPfHsNJBbV6tAxx+pmDscofw3H2qPB5baL8qmNYZEk9C?=
	=?us-ascii?Q?2Aso6gm1hxO64yAzLIyOzgMKrj3rAlh4XcFg3wDegIqe2NM+k9FY97Qrt0Y+?=
	=?us-ascii?Q?qrmitld59JxGeaP5aSy8KGNcK916cIsqWqnj5swm57SAF0CxhHJ6/1QrHGD4?=
	=?us-ascii?Q?pPyDhwuRW/VWgBajqmbWOMV/HGzcUnCj6JeAa+GR7NjNDIcSLQu2WBPfqYm/?=
	=?us-ascii?Q?gtJdQH8PFwfU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2592;
	6:qZf3rBmBfwQBbuVjVTet5IgvqFyc98qgJFKh/qM8Q1yebYRpKY/gb1thICGgIU0aQlGQRm2LmQQPqIgKvikqyV+Ex2qWN2YTBidFPCfp1pUEfJso0QEPd6vOf4VwZIk7dfiia4DrgpgMF+F2QMIQK7rRWDZsDZQvFT2+w+UmfQEcs6Rz/D/xkG3yJiGBZoX/PvXF6cFkfBueipyBqgr32+t64w2M6ZUsPvu5vpHR/T2RJkzED/FeTV5n6wEgg+GVePI02NkkQOpK0v9MhFCGlyoNex80SovvsAV2L3GEgoBZAv6H9EzYPzeDw027RHFbAc5K1iEKRf/WyuH/Or/w4fL+rtUuqFx0pCW6SUXzFJg=;
	5:CM9bp6b3qXlpammPx8PpQbuDKOo6m/20rOSsO/PhO++yclhCL6r5nNTDxgI0hdIxZnfeXN2K5UrxGD5/4G0ubO/8Iz5ctNrDoSOebXikJmzqwXOHHxgDJR6bk3Gs4EGjIulOQa4n+cBCOckAwKL7TKInfmuDC1FyOQNT1JlwTLI=;
	24:2zrfCdeXjvLSPRB6AFiW+X8vCDMXPM5R+wDulgZN11orknmq8UKIKN6Ro6NQwQX15UW7Yqd4Yt63tWdqhNJogCJQkp51mNZLYr0bWZQFKFk=;
	7:eeek4u93H9fH+MFEOQekiko2y+Eb3NfL+T9U3z7DlqSLBV4UfTfZ12wtBTSjppQDuU+aQ0oeLvsKiMfuIJueWbNgonL6fduXHXd3nC3nCAtyfjWKVmu5UinReH969M2RPp4cH0v9fHx7ghNho77To8LlyTcOZh/IWULaWX6Jr2cgi7pTKtc3Tq9pvln1bow+B5obx7chxKCtt8wXY5XwhAQYG91f+a1PpvxxjuWM9QxO9IWLefr96QADhszp86Tn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2017 06:45:03.0712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecef0ab-67c9-40fb-1b4b-08d528069250
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2592
Subject: [meta-qt5][PATCH] qt5: use correct HostPrefix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Nov 2017 07:19:28 -0000
Content-Type: text/plain

Different HostPrefix was used when building Qt and in external
SDK's qt.conf. This caused e.g., wrong path in qmodule.pri for
PKG_CONFIG_EXECUTABLE.

Task-number: QTBUG-63097
Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 classes/qmake5_base.bbclass  | 2 +-
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 29e8cff..3bc1279 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -86,7 +86,7 @@ generate_qt_config_file_effective_paths() {
 [EffectivePaths]
 HostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
 HostData = ${OE_QMAKE_PATH_HOST_DATA}
-HostPrefix = ${STAGING_DIR_NATIVE}${prefix_native}
+HostPrefix = ${STAGING_DIR_NATIVE}
 EOF
 }
 #
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 3ac6b21..802da3b 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -214,7 +214,7 @@ do_install_append() {
     touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
 
     # Replace host paths with qmake built-in properties
-    sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX/get]|g' \
+    sed -i -e 's|${STAGING_DIR_NATIVE}|$$[QT_HOST_PREFIX/get]|g' \
         -e 's|${STAGING_DIR_HOST}|$$[QT_SYSROOT]|g' \
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
 
-- 
2.7.4


