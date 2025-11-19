Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5BBCF34BA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:42:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8548.1763563373282967578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 06:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=oFzbDnmI;
 spf=pass (domain: witekio.com, ip: 52.101.66.100, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnohbaLPgHdFagnwnN+xqW0h/8B4JaK90puezzp6Vu9zvQ2HMWQ9JWkiF5Xdg3HPIrd7DABacNOviMPKDWZxce8CYoJbSEUCXji6Nt0I8PUJfJYM3DKpw0G5ovDU+FxRrj15y1RQz1srUXiSWISjx5QmGsI5KZzQJPx9GE3hrDs+aWzGf33ZlmzlWXoXaxMZH1UpcsOcvmeXYWYXNjZbbIgfabSAM5z4rW7DXEqXrNc4uA4ZU6XMPGZFRlat7cHB1SPu5KmPcdDQLVK5DpjJkIEwjrbwVH8XiwLYJakBjAzVFK8OTAMCZuNpYnWw1ZJxnTpreEEbexqXYIJ8YH5hrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01LVaLTdhq0T1K+wiT6NQkhP8OaHxhuou+F49KUKLK8=;
 b=fCJnc5aUxzMxhDY1s6kQLMS3gA5Fx692wwxdT4bvvRlSowQh+kbIXYgnfQgSL4DLMwbV9IoznUukw4VNvSDnNOUWlCZk2yY9noXW7CJSRfUwEz8sGBaQfJkc10rkyk8gQaO+nbhT/M/1fqHZaOKdYziQWsLVuePfLU3vmVIQHNu1Bg7+6Q74xiXNLH/Ts4GqGH/2OXa+Gg7WF5N5QsbaxrCZ38SN9DDzITp4NzvvPqaUJdAWS49YAFHxeDbw0bRzYKh5kePwMyZVcdyxvjgrGj65W+nAfUemZ8AcMPYwcPuX8wE8z1wd7Vub+nIfJ8NLjUMwhauzwUWc3mOu0+JNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01LVaLTdhq0T1K+wiT6NQkhP8OaHxhuou+F49KUKLK8=;
 b=oFzbDnmIRh9m51xi56fmTSaAR/0t/QBP6PRqqCvs1eLWfwBznULGagWmHi6sgKx5P/hOgwneoFfPwOoXhhL0JdDrMCAWA5jRHpSJmbgvtnnjDh52+WEtOMdh8v+b/iRp0wpOCULSufpWHRW8uRK60i9heaop1bauRIGfFf7ZGjt1t1JV9WaLEj2Fx4/b4yuLf6nUS4Xach/MKceUW+4G48TyHPWlyWb82lmXgYPUjvXGWp+z1RVnFZTElJdQRN1o0B/FXK2e738y1F84VJDJFkHkxBdcEKBvYf82Q3BHm6HuTmyfLppnz8yORaRGOz0E3mNC7aYeRArkrZriMw5ydg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from DB7P192MB0330.EURP192.PROD.OUTLOOK.COM (2603:10a6:5:b::27) by
 AS2P192MB2245.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:644::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 14:42:49 +0000
Received: from DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 ([fe80::3489:ba4d:8522:3e40]) by DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 ([fe80::3489:ba4d:8522:3e40%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:42:49 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/2] libwebsockets: fix CVE-2025-11677
Date: Wed, 19 Nov 2025 15:42:25 +0100
Message-ID: <20251119144226.2084112-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::18) To DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:5:b::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7P192MB0330:EE_|AS2P192MB2245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aac4ab0-8068-4192-e0cc-08de2779e942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nB8BoKKdp/qRbPvP/1WRK7NMLHfcgNlNVzd335c8BpJ5O15+KyJeo2/iSSah?=
 =?us-ascii?Q?XBdfkuGUowhLWzlgaG46GFcoWELt+aJyhF3iHCTU0KW6iJBSbkDMSgwKGXwk?=
 =?us-ascii?Q?XkIBxg5lUOWhvNbkFhfWu7tWaq39MPOgOXuLaQaTzE/IJCPv9gxveHuASzOB?=
 =?us-ascii?Q?kdapcWQXJXxuXR8hNX3Ef6iUTjmECqh4x4VQMdzXDXKLKv/wsf8+kg1lTDZ0?=
 =?us-ascii?Q?Ys2CTRahJ7qVaU2fi8k6QwRngIGdEfxU0YWoJQX0YufYvJ5dqXibGSnA9MKp?=
 =?us-ascii?Q?9byCQVscAgUy9HsS7d13CNfu0IH6e7CpTXv5Ev7gizy+FP4KoOguTCjHeFaN?=
 =?us-ascii?Q?Fom5m3H2SA0+f3drGAIy7kEnjC7Yc/SvBTdsNPVlOfPdNr1H60Fc/e+Y0TxR?=
 =?us-ascii?Q?Tu73hcmAmqi5iEc8BtR9IWt3CHs7DdWJnOjAW0MRMu3I4+gwqZjmjODblJkf?=
 =?us-ascii?Q?qtm1/305FPnz6BSO4sV+/iGw1o82biKE8EkrKT0LHwOJG+YTW9I7gj17c5Zc?=
 =?us-ascii?Q?u5WJdtDcmpptcVLFHX6AJuOK1HyDoEb5Ux3sNWBNgVvcs4Uy5h7CbDPztb/J?=
 =?us-ascii?Q?4oHMBW2RqxKiRTFeapQhHXNIX3R2QEKMq5ASSLqRq0E2wOoIN8CT2u74I+mL?=
 =?us-ascii?Q?goiylT9uAdU6cCN3uwZ3XRT6vgcEt2L2dCFLHY/q/pA17Is2isk7DZScH5xd?=
 =?us-ascii?Q?7NSe68eyWFTeKdiuX4wkQMQPz+elbeg8EUu/vpXknFKluO0OG+cAnXrMalcA?=
 =?us-ascii?Q?CzCkN4b9uM2dlC4zKpM+Lm0+nF/AweLJPw59GlcQVq/Ykaveb2k1VoN5VXZR?=
 =?us-ascii?Q?5ixp0cVgnDi206hGsBeVMti5X9oE2jaYPC8w49MFo/yfG+vCfeYooyAH2ck7?=
 =?us-ascii?Q?0ChqamC5Rxj5hjrPbz5A7/bGSeS5R74HNOOxf+51+tJcHrB+bCQu+lPGfNDZ?=
 =?us-ascii?Q?PAIUWTXUauWAF2InkNyEa6gYhH7jeuk3lwC2O+RivxAWSFAvhJ4c5XmXxyPd?=
 =?us-ascii?Q?KQKuwQuoDn8dWTqDZNNBfO/qgY81IZ8EvNRlvNzwSVZlMoqdq+0LUUhZZQGb?=
 =?us-ascii?Q?p7+uuI59oozODd8tL9m0TsLOzwP6u5MM0xgOY8Z9x7yJfg0Lc75bsBB3PR+e?=
 =?us-ascii?Q?oHjaVOpM8z1JyZpjX3FSAAAVbhbRbcJP2NGT0WG36aCkGGBchGYL4SOEtMx+?=
 =?us-ascii?Q?WkfJQsgUlVMbEXms81xy4QRs+LIsppgmgUnUL3KOwRs3xJad3l9z42wnRvSd?=
 =?us-ascii?Q?ODp/GKcXjFO06myj8V1wKFXvbRccwF3tV22yO/z/NDOdno8IJGyenldmnpd9?=
 =?us-ascii?Q?6SSCkq6EbGXq8ZTavIgsCL0f1+Y2QsBx+qi13dN3LklUOtfzAH8mJ5rRZHxl?=
 =?us-ascii?Q?IcDjBA0BjQWQBw7pvHQpSJFzI9/ncmFXO0njW5pIyc7yGO1uXA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7P192MB0330.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(10070799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HEmpS1RphFEMBfubOwuLCcyNhpWQQQk6VVD9pepZrHElBfeRHiW/xDf138cm?=
 =?us-ascii?Q?jG/2k1aiYQ1/NO3kiZuu8yuzgeiMroYzEQldYebcc+3U5vMISKTyOJJXGvZk?=
 =?us-ascii?Q?s48ulqImN00vS6gK+GED6FB+q689pNm9Zoj0+S10aqlf0l7kcUkY1mx5Ng8L?=
 =?us-ascii?Q?7bFQ1x1MOqv6K/ylACRoTOQSz2iFTCnOF5q0XklKInz377srtzimwvUiHcMe?=
 =?us-ascii?Q?uDXtZg+MRXcN1WjOBBsnhgiO+YRVH63W/pYiYD2AX5gn/AcxmVx7lLloiPLw?=
 =?us-ascii?Q?op51qJjf6NRzp3pD6xyYmNy99J6jdDd0uAvjByxCKvLifiqZKIlvw+rynmG+?=
 =?us-ascii?Q?pDk/Bazk2v0YL9x4t04d/PTzruAp1Tl0EPZOSy4Uka3SUf/DBRD9WQH2UVPu?=
 =?us-ascii?Q?4GH6C0BcY6J3uN+RKR2sv3J+hCBohDBESLQrPFHN6ouyimL53R8zK92oMUce?=
 =?us-ascii?Q?ZNuUvyP4DV8SiR0tJ6TvjKjZ+rDaPrZozHcD6sfrQwgxTwlX5rlTHD14fZsR?=
 =?us-ascii?Q?6QOrFW6+go+fZm2YYZNZNtXP9bR45IMbebxfsdtHI+VydWlPqFHj7y+aGtge?=
 =?us-ascii?Q?2lz7L1fu7l96xzQChSVyeOk3xap4WbVbf2+mQWSoPhKnn2RjqYh72otirARk?=
 =?us-ascii?Q?S4nev5vfE4PwuIftUXgy9cs4p8SHaXT5b2xknleQh6pwU5FKcaJAHDnOUNdF?=
 =?us-ascii?Q?5FcYTV9cpyQFPPMiW0ayd0EiJDtqkeQ3Ep2TD+Ksw55EX7G0PVkdllphDkcE?=
 =?us-ascii?Q?NtRyBtkqrdVCzU8joer0FVfptrrJbHsijgPw9XsbKxYJdrMrSB3B5lYLx/9T?=
 =?us-ascii?Q?ug01ogLEH6E+ROg8iGmAsRKfe6gIgAhkSWF/tSCjOnUVm+yzp5aB+2zlEkQ4?=
 =?us-ascii?Q?HdYEPGqneykjOXXBvKsWSSbsXLLhAqZLkADEvtHwTr7GU7hUrAowuZB1ae9q?=
 =?us-ascii?Q?3lM5sfKcw+70n+Lq4WDegN0/+ItqccXWRJ7iFJNKR9V+xIQjvO5pcEtnP1uO?=
 =?us-ascii?Q?v3wNlrgu5L4ftL22zgClRbI+aG/A1fGV7Uf8ignWniq4wAs1uVBPyZrrAb0k?=
 =?us-ascii?Q?SKepbEDdaUfG9RGMW3yBQfTtTmHI+sBJo+BtmSeBUkJ7N5DEsXXe6HZp0rDY?=
 =?us-ascii?Q?syel6Mt9LAfM/BfeU3SKfNSH3FcN+yB8KrM9XkUjaEY+EuFEAPtqECY095px?=
 =?us-ascii?Q?RU6+ln3/Jh407dDyy/MLuxEPyl6UN+oY4BwYNCFMSDoBSBfjTK/uWC6ID79E?=
 =?us-ascii?Q?XXR1Mes5gvQBtw3sMrEesaB8HJ6ogMHerx4oUoDyA8/sYiXQyGdhz8qbc99v?=
 =?us-ascii?Q?6E15EYdEwlkielYmxZHWiNjM9ZSC2X/1aT6/2lo+YqzpV4oZcYdBcizdxI0F?=
 =?us-ascii?Q?FWchYAEycLUnwKVKg+l4c9uJNo64d4j7kVeKoE19aKwCvfC9L6jca61bf9Jb?=
 =?us-ascii?Q?C+oa95zORVIwZmZTKnxxxlvuCN3yFAgUwES/HXWkq3aoMerarWDPlNn5Nlzz?=
 =?us-ascii?Q?9kO6+s0U/61/VAe6jmfFnhTtJ3/ZrXhgTukiooLMlzzrHUHMEjUMgcFg8RnV?=
 =?us-ascii?Q?VXBne2mQHRvMKtfZuUkM/z8vBro9K6QP8uGT6papefQwlDBpNEp0IqDLLF61?=
 =?us-ascii?Q?la1TJOXeLsGxVQwVUG2e9y3lfgnV3KUk8YgG6mMv81fGLqRvddRMMv60SdgO?=
 =?us-ascii?Q?SbjKFA=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aac4ab0-8068-4192-e0cc-08de2779e942
X-MS-Exchange-CrossTenant-AuthSource: DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:42:49.2805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuKuQnPU/LCL2HuE5fQ7oMkq+KYusKlzFuG18gdBDr3SMRQEhKFMxpGc6PIMEBpvCu/glcRK1+t2Dvjw3wiaog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB2245
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 14:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121905

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Backport a fix from Debian:
https://sources.debian.org/patches/libwebsockets/4.3.5-1+deb13u1/CVE-2025-1=
1677.patch
Upstream commit:
https://github.com/warmcat/libwebsockets/commit/2f082ec31261f556969160143ba=
94875d783971a

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../libwebsockets/CVE-2025-11677.patch        | 161 ++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.3.bb      |   4 +-
 2 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsocket=
s/CVE-2025-11677.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2=
025-11677.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/=
CVE-2025-11677.patch
new file mode 100644
index 0000000000..bf11a893f8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-116=
77.patch
@@ -0,0 +1,161 @@
+From c01cb06d99c08579ab33bef066fca8a5338b7c7b Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Date: Tue, 18 Nov 2025 16:59:22 +0100
+Subject: [PATCH] NN-2025-0102: UAF depending on upgrade allowed
+
+This document contains sensitive information collected during our
+security research activities related with the Libwebsockets library
+maintained by Andy Green (warmcat).
+
++-------------------------------------------------------------------------=
------------------------------+
+| Report information                                                      =
                              |
++:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D:+:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
:+
+| Vendor                              | warmcat                           =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Vendor URL                          | https://libwebsockets.org/git/libw=
ebsockets                     |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Affected component                  | libwebsockets                     =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Affected version                    | 4.4                               =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Vulnerability                       | CWE-416: Use After Free           =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Proposed CVSS v3.1 Base Score       | 6.0                               =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Proposed CVSS v3.1 Vector           | CVSS:4.0/AV:N/AC:L/AT:P/PR:N/UI:P/=
VC:N/VI:N/VA:H/SC:N/SI:N/SA:N |
++-------------------------------------+-----------------------------------=
------------------------------+
+
++-------------------------------------------------------------------------=
----+
+| Security Researcher(s)                                                  =
    |
++:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D:+:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D:+
+| Name                                | **Email address**                 =
    |
++-------------------------------------+-----------------------------------=
----+
+| Raffaele Bova                       | labs-advisory@nozominetworks.com  =
    |
++-------------------------------------+-----------------------------------=
----+
+
+Libwebsockes is a C library that provides client and server
+implementation for various protocols (e.g., HTTP, websockets, MQTT) and
+more.
+
+Nozomi Networks Lab discovered a "CWE-416: Use After Free" in the latest
+software version of libwebsockets, specifically in the WebSocket server
+implementation.
+
+Depending on the use of the API, the vulnerability may allow an attacker
+to read or write data, that could cause a loss of integrity or
+availability.
+
+The issue is caused by the `lws_handshake_protocol` function, specifically
+when the upgrade header is not valid, the function calls
+`lws_http_transaction_completed`, which frees some of the data in the wsi
+structure, then it calls `user_callback_handle_rxflow` passing the up
+pointer and uses it on following strcasecmp calls.
+
+From our understanding, for this vulnerability to have a meaningful
+impact, a user that implements the Websocket server, must provide a user
+callback function which is going to handle
+`LWS_CALLBACK_HTTP_CONFIRM_UPGRADE`, while ignoring the length and doing
+operations on the up pointer.
+
+It is possible to compile the minimal websocket server using address
+sanitizer, to quickly verify the use after free.
+
+From our understanding of the code, if the upgrade header does not match
+the intended contents, then the code after the if statement when
+`lws_http_transaction_completed` is called, should not be executed, thus
+simply enclosing all that code in the else branch solves the issue.
+
+CVE: CVE-2025-11677
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit=
/2f082ec31261f556969160143ba94875d783971a]
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/roles/http/server/server.c | 58 +++++++++++++++++-----------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/lib/roles/http/server/server.c b/lib/roles/http/server/server=
.c
+index 6b132a42..e6d714e3 100644
+--- a/lib/roles/http/server/server.c
++++ b/lib/roles/http/server/server.c
+@@ -2375,49 +2375,49 @@ raw_transition:
+ 						HTTP_STATUS_FORBIDDEN, NULL) ||
+ 				    lws_http_transaction_completed(wsi))
+ 					goto bail_nuke_ah;
+-			}
+-
+-			n =3D user_callback_handle_rxflow(wsi->a.protocol->callback,
+-					wsi, LWS_CALLBACK_HTTP_CONFIRM_UPGRADE,
+-					wsi->user_space, (char *)up, 0);
++			} else {
++				n =3D user_callback_handle_rxflow(wsi->a.protocol->callback,
++						wsi, LWS_CALLBACK_HTTP_CONFIRM_UPGRADE,
++						wsi->user_space, (char *)up, 0);
+=20
+-			/* just hang up? */
++				/* just hang up? */
+=20
+-			if (n < 0)
+-				goto bail_nuke_ah;
++				if (n < 0)
++					goto bail_nuke_ah;
+=20
+-			/* callback returned headers already, do t_c? */
++				/* callback returned headers already, do t_c? */
+=20
+-			if (n > 0) {
+-				if (lws_http_transaction_completed(wsi))
++				if (n > 0) {
++				    if (lws_http_transaction_completed(wsi))
+ 					goto bail_nuke_ah;
+=20
+-				/* continue on */
++				    /* continue on */
+=20
+-				return 0;
+-			}
++				    return 0;
++				}
+=20
+-			/* callback said 0, it was allowed */
++				/* callback said 0, it was allowed */
+=20
+-			if (wsi->a.vhost->options &
+-			    LWS_SERVER_OPTION_VHOST_UPG_STRICT_HOST_CHECK &&
+-			    lws_confirm_host_header(wsi))
+-				goto bail_nuke_ah;
++				if (wsi->a.vhost->options &
++					LWS_SERVER_OPTION_VHOST_UPG_STRICT_HOST_CHECK &&
++					lws_confirm_host_header(wsi))
++				    goto bail_nuke_ah;
+=20
+-			if (!strcasecmp(up, "websocket")) {
++				if (!strcasecmp(up, "websocket")) {
+ #if defined(LWS_ROLE_WS)
+-				lws_metrics_tag_wsi_add(wsi, "upg", "ws");
+-				lwsl_info("Upgrade to ws\n");
+-				goto upgrade_ws;
++					lws_metrics_tag_wsi_add(wsi, "upg", "ws");
++					lwsl_info("Upgrade to ws\n");
++					goto upgrade_ws;
+ #endif
+-			}
++				}
+ #if defined(LWS_WITH_HTTP2)
+-			if (!strcasecmp(up, "h2c")) {
+-				lws_metrics_tag_wsi_add(wsi, "upg", "h2c");
+-				lwsl_info("Upgrade to h2c\n");
+-				goto upgrade_h2c;
+-			}
++				if (!strcasecmp(up, "h2c")) {
++				    lws_metrics_tag_wsi_add(wsi, "upg", "h2c");
++				    lwsl_info("Upgrade to h2c\n");
++				    goto upgrade_h2c;
++				}
+ #endif
++			}
+ 		}
+=20
+ 		/* no upgrade ack... he remained as HTTP */
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3=
.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 3170d37f5b..d0a2aa0923 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -8,7 +8,9 @@ DEPENDS:append:class-native =3D " libcap-native"
=20
 S =3D "${WORKDIR}/git"
 SRCREV =3D "4415e84c095857629863804e941b9e1c2e9347ef"
-SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.3-stable"
+SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.3-stable \
+          file://CVE-2025-11677.patch \
+          "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.43.0


