Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08555CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 10:17:10 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.88])
 by mx.groups.io with SMTP id smtpd.web10.6745.1761301027272753947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 03:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=J6KfwRGI;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.88, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG7KUrybYoBVHqWSYFI0mP9l4G0hbI+IJGg0b+nmbo1ogAlj9+QBi0gEal3WUyhh77RgzZbnworStG5xxAR6fuHDnrelUTaE7mrTzbL2DqUPW3XiSQ8wc801IgABCkC70OPCLA2rg6k51Fx9DDD+FUR/6MmRZ1GCaqgbdHU0MixPnPUErKHG09u1F+/FdNIjFuFZh8bmbzmzlhgv/tNBhWqvE5sEwVcMVZXejzoW6D58rqlIkksc6znqicbCHm+78cyElW5JGhFUS7mfEo0gKuLWYXHJvzUF75St9ZmZDIEtbd9KD+7memOSDiYnjTynPnm5yDzVV9NeQPcEHWnRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5oAmIwpgMQRALVJQnhpSdtwMiI2YN6bbO4Grwfm/bY=;
 b=a46FLh2ZSxYHYgR3DfDfoHqKI24Uvk12Lzcbe/6pjj4HeibJXyHlwLp8FRelMcylwtODx0ZL+tE8u4eGbRpRl15qzkEj0+LONW6hNsMTBUxVasZhOw7+hOaEk2xhdeudwmcoRbhRk3+GkZ5fkfdFKHj1HLtOL1NLtduy7zluXrWJSxKHUJpqTJVLCFbgtGFqqHuBXVHETdlap83R4PviB9l9wbht+W7lLEZuqcW/5+kAtmXeXPcBq+nB/BsRaPV52Dz8G7O22DrtaaKOZRkFjidz1yvggfWmU6YiUhg0oNw4cm8DVAXe7xosPD06/MLKIIafPDJL0D8NYwkohcz6kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5oAmIwpgMQRALVJQnhpSdtwMiI2YN6bbO4Grwfm/bY=;
 b=J6KfwRGI7kK9KeEIhHJo/M5poR7oGL36EvJCG3rvHBCt15jMoTty6KJkDHfrDXYF6shkQX7kv7z2mIeBO6ol9Iv3C570evS4jFuKiec1z+xJtuFtEyY8FyaYyY4cn2Z2lYmri4toCga6/5nVf6T9wx6YeC4tq0VnbjofpRYRMxSxLvNrvAVptTsfrlYM+T8pNq0aobxv/DhY0biv092QvGP6Iz/gVKE3X7oKoWTXApG54hKWnMGTC6xaAicMahmj8ckQWHa0rWY+fobe8vRI+04M/zuLgbEUsK9+OFdcwHTL05TUQhyqxYUMdGzv/oYLMP3bKlpObCDiZmGZWhv1Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by MA5P287MB4016.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:17b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:16:58 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:16:58 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
CC: Nikhil R <nikhil.r@bmwtechworks.in>
Subject: [meta-oe][master][PATCH] inotify-tools: add ptest support for inotify-tools
Date: Fri, 24 Oct 2025 15:46:46 +0530
Message-ID: <20251024101646.924946-1-Sana.Kazi@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::16) To MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:19a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB4602:EE_|MA5P287MB4016:EE_
X-MS-Office365-Filtering-Correlation-Id: de3f484c-2b3a-41ca-1007-08de12e67703
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4qs7gNM+EC3S4L1pM10Ap0msSmSHts9TQmuVc4/QFuqkzFvDM/9N0YvdFNOh?=
 =?us-ascii?Q?EHQyIsSdDzwYTMFwddeq2b/f6+D1uXwoRvnlgiekcS0PFm18QQfDGzVb1kSX?=
 =?us-ascii?Q?57OxZ3GehqTh4cfjVeICCeUkuo0++D8TrTh9B63BshIPohlu3Xx/LyWOyAsl?=
 =?us-ascii?Q?3YYuAJK9BploAUWFouP6+QcRaqb/fgyDO0gWdYNUT3Bzd4rbLOUmNMmAXCBk?=
 =?us-ascii?Q?ScITdzYX5mGkr2wNJZAKGu6FWuplT9EYANZBUFuRmAQEswJ6UXXC+QHC+/iS?=
 =?us-ascii?Q?BKBaSeW5GE9bdXrSSQeQduhECK21vBzOM2nBX7Nme2AM30AblFzeFcnkiKE2?=
 =?us-ascii?Q?rA3kWAASac+o8jInyP/sZn1xz6kxWf4TVW3adGxctNW0I5gKE372kE/XPlif?=
 =?us-ascii?Q?aCoVOlhWYXTnI5um70EA5WOBj8kFi9vmdxsrH702dHofFr4mfgT5IAXfaV1w?=
 =?us-ascii?Q?hA9kuolA9Uc2j6QkV0kMtzVJD2eZInh5Hzq9ebXRIN0wrW6v9IeHEK5J9XEh?=
 =?us-ascii?Q?o55vMUsD4SdrycvIgQHIkimrawRxX7geGEz84jSOXuudiPgN004gTQm6Mq2w?=
 =?us-ascii?Q?OKR2uwqMGXp1urvpnN6yoEFvrOpeYzzWcjIkcvcVsNv856khVqB8pdzQuERY?=
 =?us-ascii?Q?0vEdW+KmktHOGCygaq49b7IVHuUCe5R13+OlQ/mMzptjEs5kx/iuSXhopMwD?=
 =?us-ascii?Q?91G/XBZpDM2VCfISh7btM3qVtxHdSoWMSwz8Hexxdnr7RyRwIjqjUhj64DFL?=
 =?us-ascii?Q?4bFv7EjFnE0gN1YzI9ayNcKJeMbh/ebOpIpMfKB9DzAJ9kRqHXd16HVjkr5K?=
 =?us-ascii?Q?LjUontvjPPdBTCX8ZBGb2eql54NtqLBduqW5aiaQMaEdAVc3fr24YjTQkhlM?=
 =?us-ascii?Q?0rFYMK3n68Q1l4zD9Vnf1XXo2vBIrNgenituYjtoKNWsKIjTJxmIkjyTZg+6?=
 =?us-ascii?Q?XwWtG4l2dvcs4RH2elrwHpEi42c6k37BtHH49+EAcn6nSlUttYvX67YMjhiG?=
 =?us-ascii?Q?189q/7kmMuaAirNTg6MOnoXWeJnViV8R255U48tO78FNwH7DQ6xGiM/vXbCr?=
 =?us-ascii?Q?hFy6r45gsO1aa/W1nDGHp37htPH5X0lNlBJimcAUxuYOA1qOPmO6Lny7/V28?=
 =?us-ascii?Q?dtOlMM+llYs3hSTFwbvFCHf+J95UUG7CCmSHgYR62ITdzbbhraxVAj9mBU+w?=
 =?us-ascii?Q?fubuChkvPTllCeu28szH4gMIwL0nH417aB/sBRz1wQoq0ueEM9ASNm64nN3m?=
 =?us-ascii?Q?nSpMb4iL6IRbgfi7G9nGib0XEvdyqzUa2y3XoadVUfOX1LwEy6iROHi5O9sJ?=
 =?us-ascii?Q?g6GZ/UFfcKNDWKt4le5BpFpIBwt6Zni08u5JlSxlxy/zugCntb2tZDUNxDpH?=
 =?us-ascii?Q?bOYe8mTDYFr6doSKS9jN24huRe0C+/OU1zcxK/gaRMheg7egT9zmwDmb8Oa9?=
 =?us-ascii?Q?7t6mzupOJ8rx6JAtQ+e2xZnifHV6V5fEt/b3n4nXfbQ2dcZSaNL4IfpCtmjf?=
 =?us-ascii?Q?5VZ54Ix1ysxH6/2oSPlrDN+N6nBCKkyNE+4T?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jCaTU7PFlKNAWg8/O8rdqZJzkra6C2E7fFniVlkK2B9use0f+2Bk9EbFkxVU?=
 =?us-ascii?Q?sWBd6NXnxTmRjGAEwX1FUMAfG2Sw3ocUWfxlx+33f4FUYhcbXnCmGF8wJOnU?=
 =?us-ascii?Q?9mtgXJgGtx+VlQeOlRBBdxima2RxvShA4+kNqf9d7VPufQLKbEHYuX+tbaZV?=
 =?us-ascii?Q?0h8zBbK824y8weo9jQ6GFbQftn31jqxyWvMHbxqgHdkqsl78s69KPV3TwGX2?=
 =?us-ascii?Q?pfBDefRTa2zQ0MaUc9fWub6FRZoyM1mnExXSihqje/6zVWrdYuKQSMNGEaq5?=
 =?us-ascii?Q?teMMJ6v33JSZAeH97HQvP+80V/Obq+S7xex+pJ2qrmjriO4wDuE99R/OfUBZ?=
 =?us-ascii?Q?166F9Qv2XXI2oi7TLcsOj0iRJzGpa8+nU5j14X3w6XG0v+7g1qS+wcktEOjt?=
 =?us-ascii?Q?iv/bflVV/kroGzQRew11x7NGPFpKn88/PzEAwgFKyxrQOKUtu7dytf4PIblH?=
 =?us-ascii?Q?8cBF0yZkzQpBmMMjqcw+kNZOaXY0zTF5LWqnZFoHNP4ReSjZs6oRYM1W7LAO?=
 =?us-ascii?Q?inBjHpaoir4ejS27KWg+8nbOImA3W3en8od/ynJ7g8MVG4B/8DQ5iGD0Xmtq?=
 =?us-ascii?Q?LhoH87oANihE6nTV47aqLglVatRjMWnY9bJeV9i6z2ulcv4SS25UY+ulqZtx?=
 =?us-ascii?Q?d17cEV4jUDPlFEoo/QG+DClepcKZgyol0JSrq+KQnyd8N+ULZ9Vw0s8gLNZA?=
 =?us-ascii?Q?VJBQh751otFRpdC70J33usnEMSukWhRAJIWYhnK8Q5yBUYdiQFrN76YWKaop?=
 =?us-ascii?Q?WgHg4JKgAnAp9qrgZg/n+IvD613vXJhB4Mnf7n79us5Lg4RSdYb/jxoXXufS?=
 =?us-ascii?Q?tjLctN7uDbfFGILSDUQL+cJH9IANYM4AVuE625+1iJ0rM/Ad5ul8s6jMfxZ2?=
 =?us-ascii?Q?nwqHdvNdpQbbi0u8dfzRM5ovhTdHaB0Y8362vCKL0CGAawZoYJIxLGXKu/CQ?=
 =?us-ascii?Q?e+zCx1QvJpzDzXA/MjQ8/wCwL9NV90BShUCqOm5YeQuooxBfo34/PfrVlUn9?=
 =?us-ascii?Q?d+WY3dDg2YHClASKHTjOw3eA63cTNP9AdiLAZ9QiUsSvXO/U2oiP2fP4B95f?=
 =?us-ascii?Q?qpUpNwrMQ0lHceUlPEpTf7Hvm2ZYLz3djeG3XJrm46MnOy01Y+ChaBA5Ysbj?=
 =?us-ascii?Q?+J7ZplSQBtPtOaK44imyAUEfYtmfNHJHPpw7LkPPuAY9O3iHqhKFstTF4dtI?=
 =?us-ascii?Q?S+3Zgu/XOgW1eNcYoDzZPjWxeLU6Z+umaLAq2eO+hv2pL5e8Zelt6DtsK/VF?=
 =?us-ascii?Q?e+0mqBOacbZ2KyjJ4pglRkEylaR9wGtTced58M88Vet3r3S8SJDXZWlfTmQO?=
 =?us-ascii?Q?As1tsDpCVRCdnwEMB3ra7RQf/Sq9EdqCVKofAOkj1LS5ty/4Ko/TBlGCx6KC?=
 =?us-ascii?Q?zvMRFefq97ppsq7e3r5XcRtD+vlRWv61wxCkB+hZxdPksfvaUS8Fy68EOsgw?=
 =?us-ascii?Q?UMkKKs5pq4EmSq/AWydzOW7ioVndnUX3R78+2VWsNzXGjGUR9MRve+Lc9GIi?=
 =?us-ascii?Q?eiFYltuZGl8vwZS0swo2y3hfsHoWjerKiDGFAh/8U8bnhNgU/ECMYoBc39Iv?=
 =?us-ascii?Q?W78GENsPbYc1vbGvN3YBo0U+Ml4Qwe5evap9Ch9/?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: de3f484c-2b3a-41ca-1007-08de12e67703
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:16:58.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbXoMjwoy+Vix3NhZT9gUqy/7fMP2KhXizJfDxlUR/Q7/iBtYG6e24Kwh/HUIiJUZGthboqNhMjsjdj+OA2lZF5tbf71C7cQfjMW0NavdXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120948

From: Nikhil R <nikhil.r@bmwtechworks.in>

Add ptest support for inotify-tools by introducing a run-ptest script.
The ptest verifies the correct functioning of inotify event handling
and related utilities.

Test coverage includes:
 - File creation, modification, and deletion event monitoring
 - Event handling and command-line option parsing
 - Basic consistency and behavior of inotify event queues

The ptest completes in under 20 seconds

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 .../inotify-tools/files/run-ptest             | 21 +++++++++++++++++++
 .../inotify-tools/inotify-tools_4.25.9.0.bb   | 16 +++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/files/run-ptest

diff --git a/meta-oe/recipes-support/inotify-tools/files/run-ptest b/meta-o=
e/recipes-support/inotify-tools/files/run-ptest
new file mode 100644
index 0000000000..f3b23d86f0
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/files/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+# run-ptest for inotify-tools
+
+set -e
+
+# Run the test binary and capture output
+output=3D$(./test)
+
+# Print the output for logging
+echo "$output"
+
+# Extract the summary line
+summary=3D$(echo "$output" | tail -n 1)
+
+# Check if any tests failed
+if echo "$summary" | grep -q "0 failed"; then
+    exit 0
+else
+    echo "Some tests failed!"
+    exit 1
+fi
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.b=
b b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
index a107925ce1..a03b835641 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dac6c26e52aea42=
8ee7f56dc2c56424c6"
 SRCREV =3D "81c6c9881edf4844f2b8250e63f82da9cb7f5444"
=20
 SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3Dmaster;protocol=3Dhtt=
ps \
+           file://run-ptest \
            "
=20
=20
-inherit autotools
+inherit autotools ptest
=20
 EXTRA_OECONF =3D "--disable-doxygen"
=20
@@ -21,3 +22,16 @@ CFLAGS +=3D "-Wno-error"
 PACKAGES =3D+ "libinotifytools"
=20
 FILES:libinotifytools =3D "${libdir}/lib*.so.*"
+
+do_compile_ptest() {
+        cd libinotifytools/src
+        oe_runmake
+        oe_runmake test
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
+}
+
+FILES:${PN}-ptest +=3D "${PTEST_PATH}"
--=20
2.34.1


