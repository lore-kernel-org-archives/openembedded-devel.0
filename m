Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F5DC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 09:38:48 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.66])
 by mx.groups.io with SMTP id smtpd.web11.4624.1660210718735265349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 02:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=qUAjqlX5;
 spf=pass (domain: kpit.com, ip: 40.107.222.66,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJa8SC9Bl5spgL+ECJl9+BnSBYxaAcmPybdxrAXrbpTv8bB/qYFCsqthYEJVN4K139OQMC/V3t1d7GrqHrkrxgwdh44xSsIerJYzVcB1rQQTP4Hg/mm1xZmSHsHI/jSatn7eSTNBTT0RYwH2kF1gYKrhivRxAmUZLtZzpYT4DbKE2epAAHt+koou92FNbMRrJEJfSpGigKpNjCTWWJaacJZB//dxDPr12nGUtNK6CHkOYFpozfZslXUr+6L+SsdF/aXwtYJ8AhN28C63dC3aJRFp3KhMetARgXLiWYvJpx2OS9cSEEhR8/I4bLnnhGDp/moZmuVCbFZjm7Qrd+N8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABKClt1TVu2FG7ITHyQJRD485snZARkk9iAUo4va6TM=;
 b=OOcQYRG7BPbUi3kVC+d3vFj65WjwT4BqzNzWa9c4PdV0vc7XG3ETdR08qwZoVdbQ8ptulsFn9BaxfHyeoIm57mAOwpV+nBdVWM2jfiVw6Fk8hJfS3n1x3azuj/Ye+qFpG6sV32AAXrFxLOTWddhpPfxnbrKAh/5QfA7RSK7k6hPS+egcW7S1t7ZTlKvjIYiE+TLbHkNxilgP1jRPsd/eCFGvzA+GkYJGv6DfPlDECBcD0B8cDfoqTXnJzwy5IkD1YeGNQc/YoLbqqYRIB92gFanKVwvAUE9ZhifOyv3X2j2Dhb/XNO3cxnqM2V//errpxv/ux8JFYjDOKc9Rx7DLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABKClt1TVu2FG7ITHyQJRD485snZARkk9iAUo4va6TM=;
 b=qUAjqlX54epIyEZ2K/zxsj56Wc42moffuBQmSzHRsGacvklpuIhRW/W6n6+P8KRl0F4ZGkX2DjKCqbLCiCN41m64cw17vzYov67P1M18c2uQSiLhrCzkEN8Ffrh3izC/bUPx8pGFP86bQ+Ofjn17ssrV18UMgOxZCQWXXs3BJTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PNZPR01MB4269.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 09:38:27 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674%6]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 09:38:27 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [oe][meta-oe][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
Date: Thu, 11 Aug 2022 15:08:08 +0530
Message-Id: <20220811093809.797-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN3PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::23) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f72a254-596d-45ae-f110-08da7b7d3dd4
X-MS-TrafficTypeDiagnostic: PNZPR01MB4269:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XtwAOHIPBo+AKdtJUVUPXkxcjhOAq7Q2ZP26gHrO/UdMCNdUBg5LQazHJFothjYsKY+WLYE6rRBV0D+VuG6kjodIzfchgSjagiwWTQ832RsMaIbs3JfPvoz5qdttvDSHdSLf5Ec8R5yZey0v52AWN+KtMQGLwvo0vNDyUdbYFuLKWsZGWLDnbLK4E1Gwoxkxw2nfDRBwquKWcZzAjgQP9Za0VCG66gtp2bqWspgLoOuFDaluahHxfQl5+5cQ+pRV+N5BNqlfvmxXvUANswKP43VFZwiU+6k2xRXBKO7kr3Ute/WRpoEAXUKYt1jIZO/RcLqxTKZ43K4VN+C0B4plIj8JeIuxnjONtoqnKTxtUQHnvL7tfJunbsH5gJ2ZIDh4+hTK+SFL0a3bfSLS5LPSWNkiG4bIK/gCAeznVqq8CqPnraLqltl0RUnmFzcCM2pr8KRcoV2w0qDULFICu+ZC2RXkkZk2g0ope7k8SFIytA9f8Hy0tdg6o3jMppFHJ7gAzZHxDonQ1d8TJ+RqZv8dju1sgY26DsM1Zd6d2pAnqHkIwfhaVbe/PYxqIMoAc0OekLbJh0j0x1A4GrwJZRmqAdGA3HgasAEdb9jb4oIE7hTgvOGJUyWlIgMrwPBTJ9Nf27tlln5DWkdYw0ea1BzZvQo1RgGEfjUBudgTmKaQy6G9uQmYLFcPUn2nkMoycixrMQmN/Efp3rRslhVU6DYhREuxGns/Bf/8MvyhsOgm49llxQq1qeyqe6xI+A0uc8bcFHHZ5EYy5P3XHGBWDHAVsK3TWpjuPHijOxumnkrr5rEYLfMIuqT3d/qrKN4jxS+B+hg2vUXeHnXJweliHMWegSKXnM8MUNuFmZub5UfraHI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(26005)(6512007)(38350700002)(38100700002)(478600001)(30864003)(44832011)(6486002)(5660300002)(8936002)(86362001)(52116002)(6506007)(6666004)(41300700001)(2906002)(4326008)(8676002)(66476007)(66556008)(66946007)(6916009)(36756003)(83380400001)(2616005)(1076003)(186003)(66574015)(316002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SG9Md1NLOGxCeEh5VFd0R3NSVVJ6RnhnTE9iWWh2L1VIL2dRdWRBMHRScm9C?=
 =?utf-8?B?OURhRHFEaVhOSHBuQVFLYzNIRGY0R0NYTUV0VWlvRjN6Q0dzM0w4UHRGdXpq?=
 =?utf-8?B?YW5KNkhpczZoNG5JeWNTcDFrVFhSMVFJOEh1c3VHWFNLMEpRdzhSRzlyV2tU?=
 =?utf-8?B?dE8yOW1kNitZMDRZUEdEZENIcHpvc3Zkanlyd0ZLeURpbGh5eU5Pc1dKYkZ3?=
 =?utf-8?B?NVlydW9QMVp1c2pyeXA0aFFZeGp2NUxtRktLYkwrMzIyRVkvTUtIVEJFcmYw?=
 =?utf-8?B?SFBTNGk1N1k3VXNJTGo3bmVkSXp4VzlSQnBuZUtBMjkxeVBNbTAycEFBSWRa?=
 =?utf-8?B?WWR1aVZrSzFvRmQwanR3L2JWRUY4UzNzSGJqUUFZT0dSOXRDOGJINjdEbXY0?=
 =?utf-8?B?blNVbWd1dVdFMHFsbUtULzRkR3lFTTN5NWN2em1SMnNBSkJZRDN2Q25CcG1L?=
 =?utf-8?B?U2hWOU9RMUdHTlVsQlNaaE8zdDJOb1YwVkk2ODNFbmVaTVF6cUU5WlZyRE5M?=
 =?utf-8?B?SzBPNW5MVk9pVEw5K2N0cG9TQlgveXhYQzUxd21kY0FxZndNejZUMUs1Tlox?=
 =?utf-8?B?dmR2SDdyUkpCUy9DTlBJcUxyT0xWeHBrU1ZQZjFjcnlsVC80aThDNFFML21H?=
 =?utf-8?B?elFzTWlHb1EwSGdXclJUYzdRZDNRSmxXV2lFVlJuYzdlYzN6REU3VjZWS1U4?=
 =?utf-8?B?T2MwWlUyeEZHUFFRZUpyZnArdTIzeGVjVDFRT2RPNVliWTNBUVlDbmtXMVd6?=
 =?utf-8?B?UVpLS2YrT3BySGpQT1ptbjBjTm8yNUxhamk1L2Vxb0V5czZwVGtzWkZjcHhF?=
 =?utf-8?B?cHc5ZXZJWk5aWUpyT1FNc1cxQXVmdU9FYWo4TC9wKzJaR2lwNktYa0dwK3V4?=
 =?utf-8?B?WlpqdUg2NHBoUm8weXpEMGZnMExIa25WYldlV0p0SHdVdjg4ZU0wV3RvV0Ry?=
 =?utf-8?B?R1Evb1lMTUZ2djVZVkFUbDJIQmEzbEdLRG1laFZUUXRZRm51L2d4aUxSTFU3?=
 =?utf-8?B?cjR3N0RKUk05M1RhajZQSTdLM21GR2tOdm90bnRGczhiK1l6V2NkVEpDUDZ1?=
 =?utf-8?B?UTFvNCt6clJVTjlUb0o0UHdhaWhKNEFyWjBHM1VOSjkrQjhRdUZtY2QxT0Fo?=
 =?utf-8?B?QkxQSzc0bTFyR25YQkxBa2hsYlZqMWljdUNCbk1mTHEyWkROK01SelQyT2pR?=
 =?utf-8?B?Y08wMHVDeHdYRnllT3Vnd3htUEJja0pwTWhKSnNOTW9qY29FM0hlcU5vT01B?=
 =?utf-8?B?cUhxV1hpU2tGMkNOUlc2VExIN0xEaDVHYjk1emVKUlc0bnlWMTd0ZDRXb0p6?=
 =?utf-8?B?dXJDK0wxZ1pTTEJVeW9zWFZvSDBnSUh6L3RFRFdFZ0ZoaTlCaDRBMjd0YUNw?=
 =?utf-8?B?Z3ZIRTErZDFRREhhclc1WlRGeXo3cHQwV0tJajRqN2o2Vm4zaTRtN3YrNEQr?=
 =?utf-8?B?MEhlOXVIa2NPb3B1R0oyRmxOakV6d05HNk1nUXZYTXk4QVFZdVZTZDVIN29u?=
 =?utf-8?B?MEdlaEw3Q2F6TGJTcCtKbCsxdkZDaXhRSmJNaXVzOENPTjE4UzI4NXBJbVFu?=
 =?utf-8?B?Nm9qOVdBdGsvcnJOWUtrZml0Rmp1WFRlT1g4SzJ2RVdQMXJuSkdEeGcyV0c5?=
 =?utf-8?B?S2hDc0p0cGJhaSt2MHUzUGFzdGt5QWxNMkxZeEtwMHgwTEdxZW1lRHozeGZy?=
 =?utf-8?B?RWhvMTJIazB4bnAvaWFWeU8zL0F5ZFdBNXlyYmhqRjNJc1poVS83Sjl5Qzll?=
 =?utf-8?B?SVl3NkZMbDkyU2dzcUtnL1hPYk5FZksveXNkdWxod2E3dkozTEwrME9Qd0sv?=
 =?utf-8?B?bUo2NnE5NEtSbzliNHZSSVZjaWJNcHBGVzRUSm1EYUk3ZUl3S1ZtajVIUlpF?=
 =?utf-8?B?OVdtZkNxcHVJWjVNRTBPUmN6dFBqc3hyVDhZeGdCZGMzd1FIdEZlajlkaEJM?=
 =?utf-8?B?dTE0R3FEL1VYaGlMeThuRlhmRU5ZNUJpRXE1cVMyRjgyVnkyb3QrVTZSWll5?=
 =?utf-8?B?NWl0NGNzWnMxNHBqK1l1NjFVMkhaVGdRbUh0dlhEOTdLMlFPZ08zYS84aEZa?=
 =?utf-8?B?VGZrdnlRTnZEQW50eFNFVFB3Z3J0NzB6aXIwbloyNHU3angyN2xKNkZ2L0ti?=
 =?utf-8?Q?1EhpzzDo3LsxZXTdcU4u7aXPO?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f72a254-596d-45ae-f110-08da7b7d3dd4
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 09:38:26.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 asXLHaDWg2I8JsHMpKVdRVLM7SHDwyVKzqkdVWvIKwnZsPxJtEI4eBvOWnNaKcsowmYvL5ZQvg6k75NeiskZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4269
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 09:38:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98192

Add patch to fix CVE-2021-3750

Patch are refresh based on our code base.

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3750-1.patch           |  59 +++++++
 .../qemu/qemu/CVE-2021-3750-2.patch           |  65 ++++++++
 .../qemu/qemu/CVE-2021-3750-3.patch           | 156 ++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index e3534f13fe..46f1b79604 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,9 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://CVE-2021-4206.patch \
            file://CVE-2021-4207.patch \
            file://CVE-2022-35414.patch \
+           file://CVE-2021-3750-1.patch \
+           file://CVE-2021-3750-2.patch \
+           file://CVE-2021-3750-3.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
new file mode 100644
index 0000000000..db908874b6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
@@ -0,0 +1,59 @@
+From b9d383ab797f54ae5fa8746117770709921dc529 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:19 +0100
+Subject: [PATCH] hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_E=
RROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Quoting Peter Maydell:
+
+ "These MEMTX_* aren't from the memory transaction
+  API functions; they're just being used by gicd_readl() and
+  friends as a way to indicate a success/failure so that the
+  actual MemoryRegionOps read/write fns like gicv3_dist_read()
+  can log a guest error."
+
+We are going to introduce more MemTxResult bits, so it is
+safer to check for !MEMTX_OK rather than MEMTX_ERROR.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Db9d383ab797f54ae5fa8746117770709921dc529]
+---
+ hw/intc/arm_gicv3_redist.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
+index c8ff3ec..99b11ca 100644
+--- a/hw/intc/arm_gicv3_redist.c
++++ b/hw/intc/arm_gicv3_redist.c
+@@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr off=
set, uint64_t *data,
+         break;
+     }
+
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest read at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+@@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr of=
fset, uint64_t data,
+         break;
+     }
+
+-    if (r =3D=3D MEMTX_ERROR) {
++    if (r !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: invalid guest write at offset " TARGET_FMT_plx
+                       " size %u\n", __func__, offset, size);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
new file mode 100644
index 0000000000..1ce32089a8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
@@ -0,0 +1,65 @@
+From 58e74682baf4e1ad26b064d8c02e5bc99c75c5d9 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:20 +0100
+Subject: [PATCH] softmmu/physmem: Simplify flatview_write and
+ address_space_access_valid
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Remove unuseful local 'result' variables.
+
+Reviewed-by: Peter Xu <peterx@redhat.com>
+Reviewed-by: David Hildenbrand <david@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-3-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D58e74682baf4e1ad26b064d8c02e5bc99c75c5d9]
+---
+ softmmu/physmem.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 43ae70f..3d968ca 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -2826,14 +2826,11 @@ static MemTxResult flatview_write(FlatVi
+     hwaddr l;
+     hwaddr addr1;
+     MemoryRegion *mr;
+-    MemTxResult result =3D MEMTX_OK;
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
+-    result =3D flatview_write_continue(fv, addr, attrs, buf, len,
+-                                     addr1, l, mr);
+-
+-    return result;
++    return flatview_write_continue(fv, addr, attrs, buf, len,
++                                   addr1, l, mr);
+ }
+
+ /* Called within RCU critical section.  */
+@@ -3130,12 +3127,10 @@ bool address_space_access_valid(AddressS
+                                 MemTxAttrs attrs)
+ {
+     FlatView *fv;
+-    bool result;
+
+     RCU_READ_LOCK_GUARD();
+     fv =3D address_space_to_flatview(as);
+-    result =3D flatview_access_valid(fv, addr, len, is_write, attrs);
+-    return result;
++    return flatview_access_valid(fv, addr, len, is_write, attrs);
+ }
+
+ static hwaddr
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
new file mode 100644
index 0000000000..703646365f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
@@ -0,0 +1,156 @@
+From 3ab6fdc91b72e156da22848f0003ff4225690ced Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 19:24:21 +0100
+Subject: [PATCH] softmmu/physmem: Introduce MemTxAttrs::memory field and
+ MEMTX_ACCESS_ERROR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Add the 'memory' bit to the memory attributes to restrict bus
+controller accesses to memories.
+
+Introduce flatview_access_allowed() to check bus permission
+before running any bus transaction.
+
+Have read/write accessors return MEMTX_ACCESS_ERROR if an access is
+restricted.
+
+There is no change for the default case where 'memory' is not set.
+
+Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
+Message-Id: <20211215182421.418374-4-philmd@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inline"]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2021-3750
+
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D3ab6fdc91b72e156da22848f0003ff4225690ced]
+---
+ include/exec/memattrs.h |  9 +++++++++
+ softmmu/physmem.c       | 44 ++++++++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 51 insertions(+), 2 deletions(-)
+
+diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
+index 95f2d20..9fb98bc 100644
+--- a/include/exec/memattrs.h
++++ b/include/exec/memattrs.h
+@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
+     unsigned int secure:1;
+     /* Memory access is usermode (unprivileged) */
+     unsigned int user:1;
++    /*
++     * Bus interconnect and peripherals can access anything (memories,
++     * devices) by default. By setting the 'memory' bit, bus transaction
++     * are restricted to "normal" memories (per the AMBA documentation)
++     * versus devices. Access to devices will be logged and rejected
++     * (see MEMTX_ACCESS_ERROR).
++     */
++    unsigned int memory:1;
+     /* Requester ID (for MSI for example) */
+     unsigned int requester_id:16;
+     /* Invert endianness for this page */
+@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
+ #define MEMTX_OK 0
+ #define MEMTX_ERROR             (1U << 0) /* device returned an error */
+ #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
++#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
+ typedef uint32_t MemTxResult;
+
+ #endif
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 3d968ca..4e1b27a 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -41,6 +41,7 @@
+ #include "qemu/config-file.h"
+ #include "qemu/error-report.h"
+ #include "qemu/qemu-print.h"
++#include "qemu/log.h"
+ #include "exec/memory.h"
+ #include "exec/ioport.h"
+ #include "sysemu/dma.h"
+@@ -2759,6 +2760,33 @@ static bool prepare_mmio_access(MemoryRe
+     return release_lock;
+ }
+
++/**
++ * flatview_access_allowed
++ * @mr: #MemoryRegion to be accessed
++ * @attrs: memory transaction attributes
++ * @addr: address within that memory region
++ * @len: the number of bytes to access
++ *
++ * Check if a memory transaction is allowed.
++ *
++ * Returns: true if transaction is allowed, false if denied.
++ */
++static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
++                                    hwaddr addr, hwaddr len)
++{
++    if (likely(!attrs.memory)) {
++        return true;
++    }
++    if (memory_region_is_ram(mr)) {
++        return true;
++    }
++    qemu_log_mask(LOG_GUEST_ERROR,
++                  "Invalid access to non-RAM device at "
++                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
++                  "region '%s'\n", addr, len, memory_region_name(mr));
++    return false;
++}
++
+ /* Called within RCU critical section.  */
+ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
+                                            MemTxAttrs attrs,
+@@ -2773,7 +2801,10 @@ static MemTxResult flatview_write_contin
+     const uint8_t *buf =3D ptr;
+
+     for (;;) {
+-        if (!memory_access_is_direct(mr, true)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, true)) {
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+             /* XXX: could force current_cpu to NULL to avoid
+@@ -2818,6 +2849,9 @@ static MemTxResult flatview_write(FlatVi
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_write_continue(fv, addr, attrs, buf, len,
+                                    addr1, l, mr);
+ }
+@@ -2836,7 +2870,10 @@ MemTxResult flatview_read_continue(FlatV
+
+     fuzz_dma_read_cb(addr, len, mr);
+     for (;;) {
+-        if (!memory_access_is_direct(mr, false)) {
++        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
++            result |=3D MEMTX_ACCESS_ERROR;
++            /* Keep going. */
++        } else if (!memory_access_is_direct(mr, false)) {
+             /* I/O case */
+             release_lock |=3D prepare_mmio_access(mr);
+             l =3D memory_access_size(mr, l, addr1);
+@@ -2879,6 +2916,9 @@ static MemTxResult flatview_read(FlatVie
+
+     l =3D len;
+     mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
++    if (!flatview_access_allowed(mr, attrs, addr, len)) {
++        return MEMTX_ACCESS_ERROR;
++    }
+     return flatview_read_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
+ }
+--
+1.8.3.1
+
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

