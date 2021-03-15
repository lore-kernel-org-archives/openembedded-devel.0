Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.47])
 by mx.groups.io with SMTP id smtpd.web10.6352.1615801752462722031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 02:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=tPK6qzlC;
 spf=pass (domain: kpit.com, ip: 40.107.138.47, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVnBmaziLkhiaBEX3+2gQxgN/M+IZz7CoAYt3k+UvM11MVZyB1bhAGmmoNgL6r50iD8qCYUMZilgUp6JLXvm5DaEHjTi6cogebwYykRU9JpQivLoRgdY0MMyG5XwLmNDg682xmnS2fAsiH3UMpzy1mRKB68KFI3gblD3shho0zow1luHRZRkzQP7J7XlMpq85l1Ow3AlL/SYnilyiX6P0FPZvK2hxSPJGCuICaxUkIKHD8Vpbc9DCCCjwInXMNuH20lYE4qD6A3tzHUX0HEvQ5wmxTs8jDA47w6Y0MTxSjRuP2lDwXeOHKFPPLxQmHu5fypbkaJLj9W0dUoxg0M07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOxi/CfhagG3gDNX4e+D53xjRfNoGZutNJd8ZybE1Oc=;
 b=WruK/E1dzrzNCeJHwN02QlHSC8mxQlzRtob8oAZ72iflabdNkw5y3MXzhk276EtCmMPjx2Zb65U6XLbLJmX18dWsnWLPBnWsRNTr+Q8n445/JKOpj+1w+mKoi7etFbvap1Dx/4ipU/tLdPajkKkRpTEEryPK1EMTfwCpLngnvA6hbmwQC/UNBX7ceWwRG8mdI7sxWHungjp/psumrOC027ph0XqF9KM+UMGQxr8Bbql9mOTBaad0zBbQHjVgO1/7js3UsBQx+gt/bk1fKXKMsnFahYlfZuMZ5bmDevTzU3iB4cY9i4FcSCQ4DfKkHHEARJXzoqZm0Ck57HRG8ohxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOxi/CfhagG3gDNX4e+D53xjRfNoGZutNJd8ZybE1Oc=;
 b=tPK6qzlCM/mPnOIoXAq/Hmk1e/so4q8lyGAhiGpqJ8s89UYntZPJPxNLXRmK8Z8aE6XtEIsWBwYK6Prc+P9cJVElswT6Nz+h63j9fSviJIV1p99toDRUR9ZChdi3tbW8GewXjOSi4ZrVKKZ0/ra1o6NEUJpVSgfapoWAzPu5U6Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB0792.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 09:49:00 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 09:49:00 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Aditya.Tayade" <Aditya.Tayade@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH] neon: Add ptest
Date: Mon, 15 Mar 2021 15:18:49 +0530
Message-Id: <1615801729-8060-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e08:e196:1de6:446:aaba:25ee]
X-ClientProxiedBy: PN1PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::20) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e08:e196:1de6:446:aaba:25ee) by PN1PR01CA0080.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 09:48:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 349041f2-b6da-41b4-9de8-08d8e7978ef2
X-MS-TrafficTypeDiagnostic: BMXPR01MB0792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB0792B8EBE2B9B48D4E4AD06E9F6C9@BMXPR01MB0792.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iwRRL7o6pWVkohGOglXJZ6N16NXpSSfpuxXG4iIRHniQxcApKCuFgtTZVAFb5184cMTjcnjgYNKxUbhH1TGncJW7yGhDnmXGDRZT/e2Id2bJgetVLWyaGG/GoaeDJs42tCc6eHz/oZw5toJvSdtqamn6Q3lyf08NFnWnThDGRUNli3ld5rv38WS/OE0MuM+2vgGsg2v/KwD1J2SOkd4XXPpnl3OwsMM59UHPQ2W8dCkAoafxis6btDFCx5x+Qum7veg8fs+tYJVFaTOAdGtMm6Z0z6Z8ldfy1FEqQn+VVPQVsM6toXKJo3e3lL9PdLtmXsFUh3q+Pt35kK5wvB295oXC8qbdzbumbttOuc22xEeA3fiKxGVUuClX3iIkIhXBKo0JMQCWkpUoqHisUln28yieu8eP6TTZBYdXyNQTFq1mmSHT5LfC9LpWDmfr6hL3Wa70CsFCULM7QSDvu2f0QzwOpQzwCv9PleaZ2z0uYAMQD8uKlRNgKXtGQse4uykFUa2IwVVNYxyVZI/d6qw+j7R4BVYX6cUClLXfdAMzSPrFn4+y0dSmKA3aD66kfVkoYC7ujdzR6j3o2pyySYoi2zIKXJP9ZIroeJqpGqLV43VRmMZ7A3ojwLmXmZ4XbZ3S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(396003)(136003)(478600001)(36756003)(6506007)(69590400012)(316002)(66574015)(66946007)(83380400001)(4326008)(66476007)(107886003)(6486002)(66556008)(16526019)(8936002)(5660300002)(6666004)(86362001)(2616005)(52116002)(8676002)(2906002)(6512007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gVLUvsCJdxaVfBgmcJDGiw80upb/DPvLPvAohfWku3sZ6sB+3cI5TtFd/l6b?=
 =?us-ascii?Q?LwjIGGSxJHYXCnJtPYylwSaDDCSSIb+Hb8PEtiSqmZdeHPwFaxCoDi4imjg8?=
 =?us-ascii?Q?XPiwZ0cOO4vRkYUzV86zkiaGgDITtsJQQcF/WjLB5S34X2VSUHJGAGb7j4uc?=
 =?us-ascii?Q?Sg12n6oud9NfgBUN4u+7bE832V5isqL4ZeXHMhS1E1GLooHJwmixG52Lm8xR?=
 =?us-ascii?Q?0pUKYqEwnnm5c+pkuLbCcaClaheEBKbOmPWiVW0MhFvfpwCN059Hqkh+8ktC?=
 =?us-ascii?Q?sCXEtJ/8ajbm+A2/jPjYHqIy5Zm89HInqaDEeausqj0uw6aPYGd8DXjiphkG?=
 =?us-ascii?Q?KYiODQ+pBIlVB5zmtJ0CIpKh3NmW1gbKuRr9dtJoWqQBpzZLk5XAFxqFA6P7?=
 =?us-ascii?Q?rZ24LGZkeu4jmok0fTh2D+AJn3toL9cTqgmCMHwz4h0WKVysJiu9RWSYMQou?=
 =?us-ascii?Q?36GRT9Oc3R8xoxWttuKJP81oeDDKzUSA6Q3tgif1VI+zL55kimIezbVribDX?=
 =?us-ascii?Q?ZqNiSxC8mJudZ9iJh5WVLumIzBv1BgWoEe2O2+3jf6R6y9M6HfMafdyQfGfw?=
 =?us-ascii?Q?iowy1KTKLZ1magxnpytu0KlzahEKdR93pkKQNbvtLJJo0E5/E7Crf6ZZCJbH?=
 =?us-ascii?Q?zWV8Cvb8oZZhDkjkVsUc8Oru6Tu/lzOS3TaKqZAiJ0qBmFZB2kR3xpa1u06Y?=
 =?us-ascii?Q?5e/uJyFAjRMxQ8ca5ZiqSpCdxgGdOxc2fkGTjyalo3asEn62S5kluZV4WXDD?=
 =?us-ascii?Q?E9WjxRT0cBULBLhaUJQy20UZ7wILvKU9iOpj51TFlroqxHHnpujaYSVNL5a1?=
 =?us-ascii?Q?MnqvdTq5FUGMaCYT/z4M4fqaPRAvFg5MPigJ9gO8GORjNfo/6QhejPFPU5Qs?=
 =?us-ascii?Q?52UwRBl2FNLCQ27N7WIqsn6Tg1sp+uDEbXEzouhs/C/nQ4DUNmE388DLhFZG?=
 =?us-ascii?Q?wd6ZPfM3PgeyRDGYCwK2Z/JCxVG4ZZYMVwENqMBhOISQWex4Cc47eXOzF4Pm?=
 =?us-ascii?Q?szuHesCrWlpomLRy9JWvqf/l1jfNbsYaoYMwHMwsVlq1thk19N9wPg5bOgMy?=
 =?us-ascii?Q?TgpSBFyBVlhmZFoBpq2Pq/Ilc7iZHKP7l9ooh96An/AkdmwgoCeiCoWTjPQ5?=
 =?us-ascii?Q?o8jziOurWC7d8jlhH+rbs6A3zLYi6a3v6hV6GnUrgpvkWmty3+WKBnAttYeL?=
 =?us-ascii?Q?sGTbynzhIVQEVoq0OsFdxJhUQORcaI3h/lEaO64tGb+J2lNsaz0h3574otq5?=
 =?us-ascii?Q?tTcnJcTSsLruuDpEqTHDrF+gqE8otEOWDgz32/hPSE1CoKGGoUTdztOAwGrY?=
 =?us-ascii?Q?1jEa0XnyYralh7V0Gkw8qbqOuzSWw2CAF2I7d5Tv4T06LTfkEZPnTQw08pDo?=
 =?us-ascii?Q?7whkIEEh3WXKjy4B/alHq/jvTxOg?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349041f2-b6da-41b4-9de8-08d8e7978ef2
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 09:49:00.3844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVAu3LrTJklEXQEBLowBtrp9taeVBniQ83bg7JTcjkZ+9E44mndgxPWyQjzlmy20iFQH/7ng6pvOzkpRX+seAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0792
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: "Aditya.Tayade" <Aditya.Tayade@kpit.com>

Reused below test suites from neon source package:
BASIC_TESTS:
auth
basic
request
session
socket
string-tests
stubs
uri-tests
util-tests

DAV_TESTS:
acl3744
lock
oldacl
props
xml
xmlreq

Overall execution time of above test suite is approximately 15sec.

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 meta-oe/recipes-support/neon/neon/run-ptest | 25 +++++++++++++++++++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb | 15 ++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest

diff --git a/meta-oe/recipes-support/neon/neon/run-ptest b/meta-oe/recipes-=
support/neon/neon/run-ptest
new file mode 100644
index 0000000..602084a
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+set -eux
+
+rm -f debug.log child.log
+
+ulimit -c unlimited
+ulimit -t 120
+
+cd test
+echo foobar > foobar.txt
+
+BASIC_TESTS=3D"auth basic redirect request session socket string-tests \
+             stubs uri-tests util-tests"
+DAV_TESTS=3D"acl3744 lock oldacl props xml xmlreq"
+for t in $BASIC_TESTS $DAV_TESTS
+do
+    echo "Running $t..."
+    if "./$t"
+    then
+        echo "PASS:$t"
+    else
+        echo "FAIL:$t"
+    fi
+done
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-=
support/neon/neon_0.30.2.bb
index 00b79f6..7feec41 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM =3D "file://src/COPYING.LIB;md5=3Df30a97=
16ef3762e3467a2f62bf790f0a

 SRC_URI =3D "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
+           file://run-ptest \
           "

 SRC_URI[md5sum] =3D "e28d77bf14032d7f5046b3930704ef41"
 SRC_URI[sha256sum] =3D "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d=
1b15d3d967fbca"

-inherit autotools binconfig-disabled lib_package pkgconfig
+inherit autotools binconfig-disabled lib_package pkgconfig ptest

 # Enable gnutls or openssl, not both
 PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib"
@@ -33,6 +34,18 @@ do_compile_append() {
     oe_runmake -C test
 }

+do_install_ptest(){
+    BASIC_TESTS=3D"auth basic redirect request session socket string-tests=
 \
+                 stubs uri-tests util-tests"
+    DAV_TESTS=3D"acl3744 lock oldacl props xml xmlreq"
+    mkdir "${D}${PTEST_PATH}/test"
+    for i in ${BASIC_TESTS} ${DAV_TESTS}
+    do
+        install -m 0755 "${B}/test/${i}" \
+        "${D}${PTEST_PATH}/test"
+    done
+}
+
 BINCONFIG =3D "${bindir}/neon-config"

 BBCLASSEXTEND =3D "native"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
