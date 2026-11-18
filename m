Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13148.1795010528331810288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HPNI2QzW;
 spf=pass (domain: est.tech, ip: 40.107.162.7, mailfrom: yunseong.kim@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojy1ZQKZu2gzcdMYYSxk7Vaw5xq+GHEV6UuO1dPiqIR75XS20vM7GumaESKcdhqMfg2IngMWJCIhtgyaTpN7YevGilJj1Ge+VZwIr0KygUHU6v/WoaLoKK53gRoEbGhegdzX+d1a5AW+wx0qlDas1mGvWgTsaTSLEGxnXKMbA3frWCMQ8gXCoV4n6Ug/gfJa4eXCKDbQGuWCbCbN4UFWU0I6P3nCB7+hat8r/jiVMHx5QQBuP8rZU2p6ndy6ifoWRqXDXSM19mnBQqGKFID+Q07sx4sd0MWBNF3OlXvrnxChuVE/7whWp5ezphKJsb8Sk5mCX0x4f5t1ka4fBMkKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+Fe/fQx9S/Lci4OoO+hyn2gubZ8F+Ilj3erIgFafw0=;
 b=RGfV9yUPE28e0VCyrJp3FbBgsTN6ZwKR95h0sD66cufKVBI4CfKZciBK6AAAIoqqXj2mkynKA4Yw2L4C7YTWsO8ZGZX2C3y2JQABXEXqmW1ULuijBB+bdCdCbt1y1cufsnQZAK1XUnx52mDJacbV+j52ZglSXURdHNP1OGAdwlAfrDpivYY8yCi9e0uNcbPYhzj9qN/Fj0nEVUMCNokaMrYburp5seYpgZstzGimYGMbxzFRo4yoyX6oaqOB5SLGxT8DTFkBS2pcUfaqWgequNcHLBhc7WtVEM57wV3Ewq5NSxQtYreFvrr9WWEqjDtrZw8+5+X0V6VIdrxoPnKnYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+Fe/fQx9S/Lci4OoO+hyn2gubZ8F+Ilj3erIgFafw0=;
 b=HPNI2QzWkhfv71grNdWo2h5S6Y4VApBTDUhFg2Y4+XUp2pGcLcINhKZ/uLOxQHcZjrDcOP73uSJtFiRGLsk0qs2fRZC3RiHDfYCzVR7dsnVa8eh5l2/TSezVTZjK1mytCfEX4tp4jgEvy+Vl/gJTdbUz4P5ypuJ2GppzY3R/Q/3NMCtyu954z+ESiEE5E+chTB8qFZySecJHTTqvrp0p1ioJOJ5p/+Qny0ojCTdGPl9nRPof5IJIX2uE5B8w8+3LlNiiE6DZTe+et3eccdmr0GWGkGvX08mBomkIixE5OgAjb9OXkUGSIGis/+lOWu9r3OnbNvGxGwOSPrR6H2CAWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::22)
 by VI0P189MB3371.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:02:03 +0000
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a]) by FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:02:02 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Yunseong Kim <ysk@kzalloc.com>,
	Yunseong Kim <yunseong.kim@est.tech>
Subject: [meta-oe][PATCH v2] vock: add recipe
Date: Wed, 18 Nov 2026 14:50:20 +0100
Message-ID: <20261118135019.321960-2-yunseong.kim@est.tech>
X-Mailer: git-send-email 2.47.3
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:d10:1a3::22)
Return-Path: yunseong.kim@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP189MB3398:EE_|VI0P189MB3371:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c85527a-efca-47b0-442e-08df457c851d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261026140227099003|260925022911599003|260925021311599003|260925021911599003|56012099006|11063799006|261022075727099003|261026121527099003|261021121427099003|261022115727099003|261022113327099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: T3mb8KOQfYPpls80Vvv0CoeD2ifDqvXiVnyBAW8QHmvx/hWxBcUhIlP8DrDs60ZLYJB7nCmuyMTEgm/bzVU8jYmxu0Oxx0ski59EDnO0S6MDqf1ncf7iyDS2++/0IGJGepvm5lvUTHz1OuUnGDx7UHlUzezAg+WepybLSe+OnoapW5Hw7gmnb4jk2K667gSFNbdU9Zf+K/mL1Mz5Ro5lNkT34dOwcXH09+VbuElDOZvi0jmGiTuAiImhcd0Su9EOgVAQfp8I4bw9KWklyydNVDZpCevDHipCCtkDxnF7OMnX1d9pYPnj7NP/9mQlCTIumQdkLkOUpoOSlIqut+9WRO953mQNo/qDkpspCWQb0JtTz19Evq0vdCROQyE44lkJgT3puvKcatSt/tsHTsk8keGExWeGndY5p2SlZiMG6FOF+sNfFGyei4hAdaMmK8lI5I6LV/peEivM+tfkPWI1NEUfz3C24KWGsLyiJclPzFYolrmt3y2NuizgAMgoVikQlxI9+cNK9sqaf4i0mgPD+Q8HgP+mJiNB4B41qSFST/14kXVSMOdMDU0goWFtSNaVfXRr+J7uz9Kr5wr4myxy64fR2/tJwv2c6PVlGefYKwmvWIBW0hRKvZplO+sUQVFA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP189MB3398.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261026140227099003)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(261021121427099003)(261022115727099003)(261022113327099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zPyGXcHuVjK05gPxM0OkGs5cy2eT1TQlNl+r54xHDqTKKgmoNU8x0eG2CYgQ?=
 =?us-ascii?Q?fGGDOdHQmY4Wskp//iMFeZ78RKqz0jSFDrhBE2/JxqJwXBiQ0jgzclDqEU+/?=
 =?us-ascii?Q?n72I1KsI2WkONQm9LalZ1cgoKVooK6WvPVbpCe0Ujt3pl1JBVNHGa2tA64M0?=
 =?us-ascii?Q?k3tEG0aPtaRnl60wR7gZCpU8R1+W4ikJFEd5tPfZv2E/3JryF/lQCPJMdDTd?=
 =?us-ascii?Q?tIMaiI5AKKSs8cNAID+ZhTJXBAqQ1+UhZn1cxH2jJORARq1Rd2jKSl7c4swi?=
 =?us-ascii?Q?NApgoS/LWGAeLz1WUDn+qEaAZtPs9qmNxpemeTBBC5s3dnAsfKQgQCp3S4eG?=
 =?us-ascii?Q?qS4gwS13xjWBsqisFoQdvIE46DSEUVqAYL5NatjOXjM1chYkfB6PuALGnmgM?=
 =?us-ascii?Q?2gnfDZOvsQ3InjzInEy75fhjaFQkWLhl/n6d4AQG9f+kVhCIoLasrDwybtya?=
 =?us-ascii?Q?3bAOfPf3+smQ8YD5VBKzI3mK/qqissJMwsz9mpvfww3z9XQI0tEPhuJx3NPh?=
 =?us-ascii?Q?hpiw7Nqb0A48XVIVa5uIaphGeGUp942jD+Hhyaqykr+BtJlBZWGijlALfnuV?=
 =?us-ascii?Q?Aom5NU/ezTIh3LaVgEyhdD69KsLxLGKT1B+mb6mXKVWDJ3rmCO830SErZF5U?=
 =?us-ascii?Q?gVHTXCjAq6MIl/AeYqmi2ZJNm77gZAQJMiE+H0mx/IHBI98HKUlBHjaB9zYO?=
 =?us-ascii?Q?ubmpEltAyNqRJPsgxA2WTXP1k1jSZBP8+YiLUAIyTXYGRQvG2fWl8QvsNqu4?=
 =?us-ascii?Q?wLifkJPM3OPCciWRL145Fi662tWNM3FKNXFj9XMOglZUn9sBzbunFms9eG6l?=
 =?us-ascii?Q?RGb/9eoc0as2i6P+tA/nNWbyWl/tONGnYiS6jn4gIiuavgmx6NGZdkaAoYtL?=
 =?us-ascii?Q?QGPwTYwkm9CQphSY+NF+RtHwOgdOnZPSTnLueyXN3KmJqdPVr8+smCicYKhT?=
 =?us-ascii?Q?EWX0WCBQNsFnMB8StrkU1hqqlIfbzSAYKZXX2DcDgC0tIx3M5I8hsThjCxCt?=
 =?us-ascii?Q?pjcFeSCJ2y4D8GzBvDAd95dqF1kWAd4+pJQUtAM1b2EiNaeb0tdv1HpWg6Zj?=
 =?us-ascii?Q?sL1M20iIDCwgeilhU7t4uCeEv0L0AFUuw5It9Ni2sUDPWB6Q/+CVupMJZpNU?=
 =?us-ascii?Q?mgv3Ge+lM2dSY//rZApQ0Qt2Rq080TGwxfYZnPBveC+WwJRsgB29XmkaveIM?=
 =?us-ascii?Q?BJE9HS6DLRYmg5RfG2XCgb0lQqq6A/Y90FbjBWOSGQgw+pdQfBMw4e1hh2dv?=
 =?us-ascii?Q?8jhJpHyYDOGsf2D8QyPqvskvc89+vb6E4TTKKylXWj1Nqt7O1ElSpK0iT67q?=
 =?us-ascii?Q?h73TmbhxMWx+emCQySIlUiTx8s2bHDNrfuT3gJNrfJKGzYanjEc1kZul83f+?=
 =?us-ascii?Q?dHc2/A3iPUOpn0PB8fYqV2tD8+NPVvRCLf11B1/Zwaz9zjCdMUgibSs8D/k8?=
 =?us-ascii?Q?fJPB7TP4FgzuJeon5kcRCkS+uE/pUEmpkYtCOe6HjYpgoNjnHUHAIjZv8Gry?=
 =?us-ascii?Q?yDBqtaw3b1A9xXeaD/cKiYzN0uD5p8/ETeadfO/OGsAsI0NoELRwwatz+MA1?=
 =?us-ascii?Q?wTc3dAeyfu21mOA9M2YwV/U4iHJ3Cq/5MGoBd1AjtODUQ+JQSYFwZeAPTApw?=
 =?us-ascii?Q?dJK35pm9ZU0LiCm0OPTHVwirwcLQ8o2JsylY9i1vsKlY50K8Kib+D3G34hNO?=
 =?us-ascii?Q?aCmKe/iCQKOKvzyFe6qEkDBJypF+d+1xYgaScgqeygi/DccRyqlZjVhZbxku?=
 =?us-ascii?Q?MmFB5GsQ3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c85527a-efca-47b0-442e-08df457c851d
X-MS-Exchange-CrossTenant-AuthSource: FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:02:02.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iD1GkRQ/hOU4jmJ+yBCA92gR9l0qLr9Ktc8/ZKLb14fBTs8z4fORGHYHWvuUCEfkK6WPsSg2FoyuRFQgg7QJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3371
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 14:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132654
Content-Type: text/plain; charset="utf-8"

vock reports the kernel code a userspace command executes, using KCOV
or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ETMv4),
symbolized against a vmlinux and annotated with kernel source.
Forked children and threads are followed through an LD_PRELOAD library
in KCOV mode and through inherited per-CPU perf events in hardware mode.
It is useful to see which kernel paths a workload reaches when testing or
debugging an embedded system.

COMPATIBLE_HOST is limited to x86_64 and aarch64, the only architectures
with syscall decoding and trace backends.

Tested with poky on qemux86-64 and qemuarm64 (build, packaging,
update_crates) and by running KCOV coverage, fork following and
syscall tracing in core-image-minimal on qemux86-64 with a KCOV kernel.
Both glibc and musl based libc build was tested on the CI.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---

Since v1:
- https://lists.openembedded.org/g/openembedded-devel/topic/122295770

Changes in v2:
- Fix build failure on TCLIBC =3D "musl" (Khem): For libc::Ioctl, use u32,
  since it is c_ulong on glibc but c_int on musl.
- Update patch message to mention testing both glibc and musl.

 meta-oe/recipes-kernel/vock/vock-crates.inc |  8 +++++
 meta-oe/recipes-kernel/vock/vock.bb         | 33 +++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/vock/vock-crates.inc
 create mode 100644 meta-oe/recipes-kernel/vock/vock.bb

diff --git a/meta-oe/recipes-kernel/vock/vock-crates.inc b/meta-oe/recipes-=
kernel/vock/vock-crates.inc
new file mode 100644
index 0000000000..9ddbda00cd
--- /dev/null
+++ b/meta-oe/recipes-kernel/vock/vock-crates.inc
@@ -0,0 +1,8 @@
+# Autogenerated with 'bitbake -c update_crates vock'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/libc/0.2.189 \
+"
+
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
diff --git a/meta-oe/recipes-kernel/vock/vock.bb b/meta-oe/recipes-kernel/v=
ock/vock.bb
new file mode 100644
index 0000000000..89364e5fab
--- /dev/null
+++ b/meta-oe/recipes-kernel/vock/vock.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Kernel code coverage of a user-space command (KCOV, Intel PT,=
 AMD LBR and Arm Coresight ETMv4)"
+DESCRIPTION =3D "vock runs a command and reports which kernel code it exec=
uted, \
+using KCOV or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ET=
Mv4), \
+optionally with an strace-style syscall trace and syzkaller-compatible out=
put. \
+Coverage is symbolized against a vmlinux (DWARF or BTF) and annotated with=
 kernel source."
+HOMEPAGE =3D "https://github.com/yskzalloc/vock"
+BUGTRACKER =3D "https://github.com/yskzalloc/vock/issues"
+SECTION =3D "devel"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf2426a488a4a2b68a88bd7cf6410e=
4"
+
+SRC_URI =3D "git://github.com/yskzalloc/vock.git;protocol=3Dhttps;branch=
=3Dmain"
+SRCREV =3D "d36e86cb28ce7e4780f1e6e55797730235b60980"
+PV =3D "0.1.0+git"
+
+inherit cargo cargo-update-recipe-crates
+
+require ${BPN}-crates.inc
+
+# Syscall decoding, ptrace register access and the hardware-trace backends
+# are implemented for x86_64 and aarch64 only.
+COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
+
+do_install:append() {
+    # LD_PRELOAD shim used by --mode kcov to follow forks and threads. voc=
k
+    # looks it up next to its binary as ../lib/vock/kcov.so, i.e. under
+    # ${nonarch_libdir} regardless of multilib.
+    install -Dm 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/libkcov_preload.so=
 \
+        ${D}${nonarch_libdir}/vock/kcov.so
+}
+
+FILES:${PN} +=3D "${nonarch_libdir}/vock"
--=20
2.55.0

