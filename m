Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD675C25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:10:08 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.54])
 by mx.groups.io with SMTP id smtpd.web11.26080.1659967803706592473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Ajm9PEVi;
 spf=pass (domain: kpit.com, ip: 40.107.239.54,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBYulUUz3GDU+WmOTxchRWEBBsZXXYrgpA5vYj5TGy64JqpFWcwKthYoh4VSLR4/8em3pprYdiDYUpNXwqsPbB16n5LbkLCAQDD2ZUEybPAbrYrqFBGBJy3pMtMrrZEYEuuusKWa/E3+MLA+ImfyA3NjUwP/a16v+BPnOTNTLVimDFUI77ldPXvrV8E9rwJwb8T4FOr+OA2E5Yx0jBfkluS7eMb0gWx/rmY2I5lLFqICsCGD5YOkZ9QNBZPyT0QaNFmUAI9yEbDqGzj46+aMYjSUp6kQIrNQGVOZG6C1nM0CHVg29v1ENeRtXjfE4Z3pFpqlaN6Y7iFEptwgvg5tSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKBOFQCLojbbqas/6Hew7j1/FPY4UMbQ9Uyw5q+6Tow=;
 b=eTEHLljmx5nr/WI1UIcSoY3EDYLGJ8VgpuB8eu4eMW5BFuupMeVLokXbJvCf1CcWRP/1Xrjx/PB6TjBgipVpoKbiAX8WIGzO1MVuJgA9b1UOUy3ObG2R9h+s8TE9DXru32ZrMFCJCLeS5g9schNNp1qMSpbYdHDA3zG+tnurcO+TTtg/hgFzJ3DsgJprw20TtIN0Pc89crL5sTM7eduJmhrWM4BmAc7fM/6bm5MDN/Vfw0yIL9aXTBMsJhvEqi44rA34nShpPyIafV7BlP24PDPgEBNVuPHPKeE3XZFFA/eVPOl2Ech/HNk2cLkEUNSEFmg1A1Bm2iwpZmSPDwiF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKBOFQCLojbbqas/6Hew7j1/FPY4UMbQ9Uyw5q+6Tow=;
 b=Ajm9PEViPNiWt80/gB/kwtaTJiju72oIyAiapZpvcdjgR0kJJ4GXKyUOAYT0FS1iR1cjnBOnzw66U2ZjvgcJ/Ba+HO+ZstMxVNs6VEfey90Hm4VuVL+vIgtoZU0ZncPjaYjffsnnHaqYYfMYOA0q/qe+Ajj1jAV4Pn5KMa9zxjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA1PR01MB0618.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 14:09:53 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:09:53 +0000
From: Ranjitsinh Rathod <ranjitsinhr@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [PATCH 1/5] nodejs: Upgrade to 12.22.12
Date: Mon,  8 Aug 2022 19:39:28 +0530
Message-Id: <20220808140933.25968-2-ranjitsinhr@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220808140933.25968-1-ranjitsinhr@kpit.com>
References: <20220808140933.25968-1-ranjitsinhr@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f80ed11-ccef-42ae-f62c-08da7947a9db
X-MS-TrafficTypeDiagnostic: MA1PR01MB0618:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tiGlDVgwPry5Ov6pHvpBIURnhrLjW9trSVQqIS+elfkEVDMRgJiaZT3hxx22UD/lsfwdrH/dtehP667hG0mgXNjDFbXb+T7URVxcV1dU/wj8JxWDzia4pHoz5zekMTnXfmbqh8GIJfnn4V1vht2awMJg47Czqe6Na7G/0ieVOSHTnpklzTSUaF+B6ESSRaQg7XCbf6E/vt/kKeTSie7dVOoYCsviaMGg9MnZNCfr+fKAZIVqs0cauKyTqcO137L4u/YCTwaClJUMwBCwad+Uhu8y6cq/QYSvde9MkX14VcGzy3cjp2alWlr/oh1M4RgXKzAqNyT925ADRwFpMJHnj0baRaRhH9/HLwRWZhk9TsIMrS40iB5QB2VfUC+oh4zwxM8VWjr0NxX/UMTTcdS68C7fNLhUSA2XtMqXSivL2nd3UNdPURw1RAwWoOkOK6Qp3rHKol0mxuorwgXUXksPlW+3uix14XcdoQiov8L2vbQZGxCtqEPlk/qnBJIaATodCobHrPuXFL61rRZRKNMiCIPQcKYceoQoNRywUJR0+7hhjJJ5jpuWzAUB2th0kWIGDvIFnvyge0DcTTuOIYh85fOAr3OWl1XTMAj6ChUU31SmNU7YRcExSwFNeJH29IZZlbKNqjEykQE7QMIr3yQgrNofXHzzJ4XFYsDquKAZFElFD9PVLHja/ubDqjus5zomNvuJFoT1exAZeTxul/NehdtDOi298KfY2ftOyZ3BDVRGSsI8pmn/ktbOZK7JnfJ0vMHlKi+cDPbdnd7IClhGNGsRQ0DD7nionKzhOvYx+1KajTfThIXq0XTR6ZamQIUz3Ls8lW+2HOn3HwJaJg75R3gpJGgxodwrDhAE62gqZYFtzXcrM58CljSg6pbMngub5eSP1HW4ERrsgJj8ORLUuO/9pMLRBbz6fvc21qTfyqQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(41300700001)(84970400001)(26005)(6666004)(6512007)(38350700002)(52116002)(38100700002)(6506007)(186003)(66574015)(1076003)(2616005)(83380400001)(8676002)(66946007)(66556008)(4326008)(66476007)(30864003)(8936002)(966005)(6916009)(5660300002)(54906003)(478600001)(2906002)(6486002)(316002)(19627235002)(36756003)(21314003)(579004)(559001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sk9sT1BoUjNUdTFqVGhwSVJwaTVUNjN6N0VwVE5UUDVHSmJyT0hSQ24waDBi?=
 =?utf-8?B?dENocHJkdERjR1JVTmFJa0F3Z1o2RElPdlIvalRmeE8yUUdCZlhwdDZoN1VC?=
 =?utf-8?B?b1d2Rko3bm5pRGF5VG0yUnNFSlZtVXNnNXpCVkZMN3VDczFEendkUkZ2dzg3?=
 =?utf-8?B?cUgrM1RsejZiK21ydkx3OGFNUzNLUkRCaVRpY0ViYyt1Z1IyN1NOdk1UUUJy?=
 =?utf-8?B?c3REMys4cUVoWk5MNTRRc09pRXl6aHBYcm1LSXExT2xNVG9aSSt6MkpwY2lo?=
 =?utf-8?B?NGc4SHBrQmxjdFFRV05tbkFMZDJoUzdWV296c2laSDh0U3lybDBUVy9HRDJQ?=
 =?utf-8?B?VmExU0pEaHJLV1lhRzBSNjYxaE1nY0h4MGRsMlM2djc1WlE5NjZUTVlKRDJC?=
 =?utf-8?B?S21pOWwxeHA3UUdYUXBrQ0k0QmhlR3IwWWxKNlVUeHk1cXk0eHhiUVloMWZR?=
 =?utf-8?B?RkJJdFpGUkZkMVdtNUd1S1VHbHlKdzNLOTVwZDQ1R3ZLTjBPc01LSm55WmhU?=
 =?utf-8?B?WGRSVm9lMTBhbDRBanl6N0tHNWdibHFSUzVTZXNMLytic2haZnBGOC9CMDJO?=
 =?utf-8?B?M2dLUkFkUFFYaTRpZkZCMTlvRnhpNU1UOXZ1S3pmaVh3WXdzVEMrc3BzYkRz?=
 =?utf-8?B?RU9weHdQVHhBTmRONlVLVE9rQ2FCTDBNT0VaRGtUUFlSTEo5VHFEY1NKbUJJ?=
 =?utf-8?B?NFczU0JtU0pTUnVRTDRiSWpPZjh2RjArYUlEWkxGOE1HSHVTdTJwMHdZdFR3?=
 =?utf-8?B?WHcrL1Y4ekdDR3JScmVuZXNzaEVuS241SW1ZRk8zQlpKelE0V3d6U25FQ2RF?=
 =?utf-8?B?YUxuRURwajFGOW01b2ZVUUU2Nzlwa2trMW9XVU5jS0Q3ejg3Y1VhdHN2RXpr?=
 =?utf-8?B?dll4bkhkNWZUTklMc2x6T3gvakFXS0Q4NGJMbG1SenZSTEQ2V3BGSUZudGVj?=
 =?utf-8?B?d3I5WENLLzZVZEoyZi8zb2kvNXNPU1hIR2ZFNEN6Ky80TGtJN1REbzRQQlpx?=
 =?utf-8?B?K2hLRHJhakREbTEwcEZmcTlvYVZwdklFampmaUF0YVZCeUpiTkxXaXBKSyty?=
 =?utf-8?B?WmwxWGtFOVBGU0FnWm1icHZsL1ZCMEVCZXAxRmhtamxpZWNmRDFDck1BT1hi?=
 =?utf-8?B?dXg4NU5FYUI4bGJnUU4zenZpYU96Ukc0QlFrZm1QaktWblFJNllCOGNKcUR3?=
 =?utf-8?B?SzUxTUhualFocDlDN1RxMXl3dFd5TmNicXpXTjdQZ1BpVHJNM0VoSmVDVVZO?=
 =?utf-8?B?TDdZQXVQUXVMTFhnTTFMUmVPYnBsSENOZXV2V0p5QWFRekJmcGtFWXhwRjEy?=
 =?utf-8?B?VmxHTG90M1RjTjlieWY2YXZzcHdlRzg5Qit3WmJheXViZGNMWkhOZmtTQlhW?=
 =?utf-8?B?Q1lhdGg4bVdSdldSV0JmTjQvMXp0N09OY0RtYVV6KzJoY2hEd1VIRGI4djh4?=
 =?utf-8?B?b2JoQzNUWVhiVmZNMmVDV0c3a1didWEzZ29ZS0h3U2o4Y3YzdUVQTjE2cFF2?=
 =?utf-8?B?TUtYRUtSSjFsdGxvZXJjYkMrd0piR3FrcHgreUtIaysvQVdSN0RIOHpHWTk1?=
 =?utf-8?B?UG9tdzVEbHpGekpzT2ZSb0JXU2Q2S2ozNWNPWFVLU3hVYW5EWk5EMlpvUmRM?=
 =?utf-8?B?NEs5TDFDUGc4UHJ1TW54M01yN2o0VXpMOFFrYjFzbDZvOTN4TzFHTW4zRm1O?=
 =?utf-8?B?Z0Uyc2c5NWQ2aWYwQnFtTzBPVSthRXlQbXdMc0Z4SXZVSEZBZG53cXdicnRa?=
 =?utf-8?B?a09OVlJwczhtYWtCc3ZqZmh3bXNBbGkvNW9OSVg3czFjWWdPV2tlbEFYdEE0?=
 =?utf-8?B?QVRhMVROa0VGWlN3ZW5FZWVhd0tUdi84T0RIb3dVWmpBWFRxSjYvN0RDUm94?=
 =?utf-8?B?WkU5bTRrd3B4a1ZFQk1NOHpVY0tiQkU3NDM3em1KVktqdGtWTExLNHJsR3pL?=
 =?utf-8?B?b2tacWJjYUxGMEhtNlBnZ0w0bHZSSjJmL2JQbzV6NlNSSzhqR1ZlS1ZZYzRB?=
 =?utf-8?B?WFR4aUpNdnV2UTI5dW9ML2hYcmxlZFpoNWU5WnlLZFZQWm5Ba3I2T25VMWtE?=
 =?utf-8?B?b0Jud0JxaHpBVGhUVG9IYjJGWU1rNmVVWXV6ejhWelQ5ck5oZTJESS83dlpS?=
 =?utf-8?B?eVRjZ2tmVUErT0ozUDRWVmVDWnFWRVIrczVzM3hSejE5cG82cjAxRjVNQmNr?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f80ed11-ccef-42ae-f62c-08da7947a9db
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:09:52.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IYT9IisBDi5ipa/jTJhlbVaBN0nP0axSWvvhePxAnzRTf0jTY/LVxCFoPgSnqvOs2+en0QsS7TLdNE7of2dvsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB0618
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98158

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

As per the below release note, it should be a last release for 12.x
stable LTS series.
Link: https://github.com/nodejs/node/releases/tag/v12.22.12

Remove CVE-2021-44532 fix as it already available in this release
v12.22.12

License-Update: src/gtest additional file in the LICENSE

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../nodejs/nodejs/CVE-2021-44532.patch        | 3090 -----------------
 .../{nodejs_12.22.2.bb =3D> nodejs_12.22.12.bb} |    5 +-
 2 files changed, 2 insertions(+), 3093 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.p=
atch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.22.2.bb =3D> nodejs_12.2=
2.12.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch
deleted file mode 100644
index dff7fe23a2..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch
+++ /dev/null
@@ -1,3090 +0,0 @@
-From 19873abfb24dce75ffff042efe76dc5633052677 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Tobias=3D20Nie=3DC3=3D9Fen?=3D <tniessen@tnie.de>
-Date: Wed, 29 Dec 2021 19:30:57 -0500
-Subject: [PATCH] crypto,tls: implement safe x509 GeneralName format
-
-This change introduces JSON-compatible escaping rules for strings that
-include X.509 GeneralName components (see RFC 5280). This non-standard
-format avoids ambiguities and prevents injection attacks that could
-previously lead to X.509 certificates being accepted even though they
-were not valid for the target hostname.
-
-These changes affect the format of subject alternative names and the
-format of authority information access. The checkServerIdentity function
-has been modified to safely handle the new format, eliminating the
-possibility of injecting subject alternative names into the verification
-logic.
-
-Because each subject alternative name is only encoded as a JSON string
-literal if necessary for security purposes, this change will only be
-visible in rare cases.
-
-This addresses CVE-2021-44532.
-
-Co-authored-by: Akshay K <iit.akshay@gmail.com>
-CVE-ID: CVE-2021-44532
-Backport-PR-URL: https://github.com/nodejs-private/node-private/pull/306
-PR-URL: https://github.com/nodejs-private/node-private/pull/300
-Reviewed-By: Michael Dawson <midawson@redhat.com>
-Reviewed-By: Rich Trott <rtrott@gmail.com>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/19873abfb=
24dce75ffff042efe76dc5633052677]
-
-CVE: CVE-2021-44532
-
-Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
-
----
- doc/api/errors.md                             |   8 +
- lib/_tls_common.js                            |   9 +
- lib/internal/errors.js                        |   2 +
- lib/tls.js                                    |  52 +-
- src/node_crypto_common.cc                     | 340 ++++++++++--
- test/common/index.js                          |   7 +
- test/fixtures/keys/Makefile                   |  14 +
- .../incorrect_san_correct_subject-cert.pem    |  11 +
- .../incorrect_san_correct_subject-key.pem     |   5 +
- test/fixtures/x509-escaping/.gitignore        |   2 +
- test/fixtures/x509-escaping/alt-0-cert.pem    |  29 +
- test/fixtures/x509-escaping/alt-1-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-10-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-11-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-12-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-13-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-14-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-15-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-16-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-17-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-18-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-19-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-2-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-20-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-21-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-22-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-23-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-24-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-25-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-26-cert.pem   |  29 +
- test/fixtures/x509-escaping/alt-27-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-28-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-29-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-3-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-30-cert.pem   |  28 +
- test/fixtures/x509-escaping/alt-4-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-5-cert.pem    |  29 +
- test/fixtures/x509-escaping/alt-6-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-7-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-8-cert.pem    |  28 +
- test/fixtures/x509-escaping/alt-9-cert.pem    |  28 +
- test/fixtures/x509-escaping/create-certs.js   | 502 ++++++++++++++++++
- .../x509-escaping/google/intermediate.pem     |  11 +
- test/fixtures/x509-escaping/google/key.pem    |   5 +
- test/fixtures/x509-escaping/google/leaf0.pem  |  10 +
- test/fixtures/x509-escaping/google/leaf1.pem  |  10 +
- test/fixtures/x509-escaping/google/leaf2.pem  |  10 +
- test/fixtures/x509-escaping/google/leaf3.pem  |  10 +
- test/fixtures/x509-escaping/google/leaf4.pem  |  10 +
- test/fixtures/x509-escaping/google/root.pem   |   9 +
- test/fixtures/x509-escaping/info-0-cert.pem   |  30 ++
- test/fixtures/x509-escaping/info-1-cert.pem   |  31 ++
- test/fixtures/x509-escaping/info-2-cert.pem   |  29 +
- test/fixtures/x509-escaping/info-3-cert.pem   |  30 ++
- test/fixtures/x509-escaping/info-4-cert.pem   |  29 +
- test/fixtures/x509-escaping/package.json      |  12 +
- test/fixtures/x509-escaping/server-key.pem    |  52 ++
- test/parallel/test-tls-0-dns-altname.js       |   2 +-
- test/parallel/test-x509-escaping.js           | 349 ++++++++++++
- 59 files changed, 2429 insertions(+), 42 deletions(-)
- create mode 100644 test/fixtures/keys/incorrect_san_correct_subject-cert.=
pem
- create mode 100644 test/fixtures/keys/incorrect_san_correct_subject-key.p=
em
- create mode 100644 test/fixtures/x509-escaping/.gitignore
- create mode 100644 test/fixtures/x509-escaping/alt-0-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-1-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-10-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-11-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-12-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-13-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-14-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-15-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-16-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-17-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-18-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-19-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-2-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-20-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-21-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-22-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-23-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-24-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-25-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-26-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-27-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-28-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-29-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-3-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-30-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-4-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-5-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-6-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-7-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-8-cert.pem
- create mode 100644 test/fixtures/x509-escaping/alt-9-cert.pem
- create mode 100644 test/fixtures/x509-escaping/create-certs.js
- create mode 100644 test/fixtures/x509-escaping/google/intermediate.pem
- create mode 100644 test/fixtures/x509-escaping/google/key.pem
- create mode 100644 test/fixtures/x509-escaping/google/leaf0.pem
- create mode 100644 test/fixtures/x509-escaping/google/leaf1.pem
- create mode 100644 test/fixtures/x509-escaping/google/leaf2.pem
- create mode 100644 test/fixtures/x509-escaping/google/leaf3.pem
- create mode 100644 test/fixtures/x509-escaping/google/leaf4.pem
- create mode 100644 test/fixtures/x509-escaping/google/root.pem
- create mode 100644 test/fixtures/x509-escaping/info-0-cert.pem
- create mode 100644 test/fixtures/x509-escaping/info-1-cert.pem
- create mode 100644 test/fixtures/x509-escaping/info-2-cert.pem
- create mode 100644 test/fixtures/x509-escaping/info-3-cert.pem
- create mode 100644 test/fixtures/x509-escaping/info-4-cert.pem
- create mode 100644 test/fixtures/x509-escaping/package.json
- create mode 100644 test/fixtures/x509-escaping/server-key.pem
- create mode 100644 test/parallel/test-x509-escaping.js
-
-diff --git a/doc/api/errors.md b/doc/api/errors.md
-index d5d8e1efa7..9d176d9048 100644
---- a/doc/api/errors.md
-+++ b/doc/api/errors.md
-@@ -1869,6 +1869,14 @@ An unspecified or non-specific system error has occ=
urred within the Node.js
- process. The error object will have an `err.info` object property with
- additional details.
-
-+<a id=3D"ERR_TLS_CERT_ALTNAME_FORMAT"></a>
-+### `ERR_TLS_CERT_ALTNAME_FORMAT`
-+
-+This error is thrown by `checkServerIdentity` if a user-supplied
-+`subjectaltname` property violates encoding rules. Certificate objects pr=
oduced
-+by Node.js itself always comply with encoding rules and will never cause
-+this error.
-+
- <a id=3D"ERR_TLS_CERT_ALTNAME_INVALID"></a>
- ### `ERR_TLS_CERT_ALTNAME_INVALID`
-
-diff --git a/lib/_tls_common.js b/lib/_tls_common.js
-index b7a3b70a24..a2a74813f1 100644
---- a/lib/_tls_common.js
-+++ b/lib/_tls_common.js
-@@ -23,6 +23,7 @@
-
- const {
-   ArrayIsArray,
-+  JSONParse,
-   ObjectCreate,
- } =3D primordials;
-
-@@ -323,6 +324,14 @@ exports.translatePeerCertificate =3D function transla=
tePeerCertificate(c) {
-
-     // XXX: More key validation?
-     info.replace(/([^\n:]*):([^\n]*)(?:\n|$)/g, (all, key, val) =3D> {
-+      if (val.charCodeAt(0) =3D=3D=3D 0x22) {
-+        // The translatePeerCertificate function is only
-+        // used on internally created legacy certificate
-+        // objects, and any value that contains a quote
-+        // will always be a valid JSON string literal,
-+        // so this should never throw.
-+        val =3D JSONParse(val);
-+      }
-       if (key in c.infoAccess)
-         c.infoAccess[key].push(val);
-       else
-diff --git a/lib/internal/errors.js b/lib/internal/errors.js
-index 2cf7df436b..cd7153ad1a 100644
---- a/lib/internal/errors.js
-+++ b/lib/internal/errors.js
-@@ -1345,6 +1345,8 @@ E('ERR_STREAM_WRAP', 'Stream has StringDecoder set o=
r is in objectMode', Error);
- E('ERR_STREAM_WRITE_AFTER_END', 'write after end', Error);
- E('ERR_SYNTHETIC', 'JavaScript Callstack', Error);
- E('ERR_SYSTEM_ERROR', 'A system error occurred', SystemError);
-+E('ERR_TLS_CERT_ALTNAME_FORMAT', 'Invalid subject alternative name string=
',
-+  SyntaxError);
- E('ERR_TLS_CERT_ALTNAME_INVALID', function(reason, host, cert) {
-   this.reason =3D reason;
-   this.host =3D host;
-diff --git a/lib/tls.js b/lib/tls.js
-index 2ccbe409c9..cefb47d10f 100644
---- a/lib/tls.js
-+++ b/lib/tls.js
-@@ -24,11 +24,19 @@
- const {
-   Array,
-   ArrayIsArray,
-+  ArrayPrototypePush,
-+  JSONParse,
-   ObjectDefineProperty,
-   ObjectFreeze,
-+  RegExpPrototypeExec,
-+  StringPrototypeIncludes,
-+  StringPrototypeIndexOf,
-+  StringPrototypeSplit,
-+  StringPrototypeSubstring,
- } =3D primordials;
-
- const {
-+  ERR_TLS_CERT_ALTNAME_FORMAT,
-   ERR_TLS_CERT_ALTNAME_INVALID,
-   ERR_OUT_OF_RANGE
- } =3D require('internal/errors').codes;
-@@ -207,6 +215,45 @@ function check(hostParts, pattern, wildcards) {
-   return true;
- }
-
-+// This pattern is used to determine the length of escaped sequences with=
in
-+// the subject alt names string. It allows any valid JSON string literal.
-+// This MUST match the JSON specification (ECMA-404 / RFC8259) exactly.
-+const jsonStringPattern =3D
-+  // eslint-disable-next-line no-control-regex
-+  /^"(?:[^"\\\u0000-\u001f]|\\(?:["\\/bfnrt]|u[0-9a-fA-F]{4}))*"/;
-+
-+function splitEscapedAltNames(altNames) {
-+  const result =3D [];
-+  let currentToken =3D '';
-+  let offset =3D 0;
-+  while (offset !=3D=3D altNames.length) {
-+    const nextSep =3D StringPrototypeIndexOf(altNames, ', ', offset);
-+    const nextQuote =3D StringPrototypeIndexOf(altNames, '"', offset);
-+    if (nextQuote !=3D=3D -1 && (nextSep =3D=3D=3D -1 || nextQuote < next=
Sep)) {
-+      // There is a quote character and there is no separator before the =
quote.
-+      currentToken +=3D StringPrototypeSubstring(altNames, offset, nextQu=
ote);
-+      const match =3D RegExpPrototypeExec(
-+        jsonStringPattern, StringPrototypeSubstring(altNames, nextQuote))=
;
-+      if (!match) {
-+        throw new ERR_TLS_CERT_ALTNAME_FORMAT();
-+      }
-+      currentToken +=3D JSONParse(match[0]);
-+      offset =3D nextQuote + match[0].length;
-+    } else if (nextSep !=3D=3D -1) {
-+      // There is a separator and no quote before it.
-+      currentToken +=3D StringPrototypeSubstring(altNames, offset, nextSe=
p);
-+      ArrayPrototypePush(result, currentToken);
-+      currentToken =3D '';
-+      offset =3D nextSep + 2;
-+    } else {
-+      currentToken +=3D StringPrototypeSubstring(altNames, offset);
-+      offset =3D altNames.length;
-+    }
-+  }
-+  ArrayPrototypePush(result, currentToken);
-+  return result;
-+}
-+
- let urlWarningEmitted =3D false;
- exports.checkServerIdentity =3D function checkServerIdentity(hostname, ce=
rt) {
-   const subject =3D cert.subject;
-@@ -218,7 +265,10 @@ exports.checkServerIdentity =3D function checkServerI=
dentity(hostname, cert) {
-   hostname =3D '' + hostname;
-
-   if (altNames) {
--    for (const name of altNames.split(', ')) {
-+    const splitAltNames =3D StringPrototypeIncludes(altNames, '"') ?
-+      splitEscapedAltNames(altNames) :
-+      StringPrototypeSplit(altNames, ', ');
-+    for (const name of splitAltNames) {
-       if (name.startsWith('DNS:')) {
-         dnsNames.push(name.slice(4));
-       } else if (name.startsWith('URI:')) {
-diff --git a/src/node_crypto_common.cc b/src/node_crypto_common.cc
-index 74bc0a9756..53fbc576ef 100644
---- a/src/node_crypto_common.cc
-+++ b/src/node_crypto_common.cc
-@@ -480,39 +480,320 @@ void AddFingerprintDigest(
-   }
- }
-
--bool SafeX509ExtPrint(const BIOPointer& out, X509_EXTENSION* ext) {
--  const X509V3_EXT_METHOD* method =3D X509V3_EXT_get(ext);
-+static inline bool IsSafeAltName(const char* name, size_t length, bool ut=
f8) {
-+  for (size_t i =3D 0; i < length; i++) {
-+    char c =3D name[i];
-+    switch (c) {
-+    case '"':
-+    case '\\':
-+      // These mess with encoding rules.
-+      // Fall through.
-+    case ',':
-+      // Commas make it impossible to split the list of subject alternati=
ve
-+      // names unambiguously, which is why we have to escape.
-+      // Fall through.
-+    case '\'':
-+      // Single quotes are unlikely to appear in any legitimate values, b=
ut they
-+      // could be used to make a value look like it was escaped (i.e., en=
closed
-+      // in single/double quotes).
-+      return false;
-+    default:
-+      if (utf8) {
-+        // In UTF8 strings, we require escaping for any ASCII control cha=
racter,
-+        // but NOT for non-ASCII characters. Note that all bytes of any c=
ode
-+        // point that consists of more than a single byte have their MSB =
set.
-+        if (static_cast<unsigned char>(c) < ' ' || c =3D=3D '\x7f') {
-+          return false;
-+        }
-+      } else {
-+        // Check if the char is a control character or non-ASCII characte=
r. Note
-+        // that char may or may not be a signed type. Regardless, non-ASC=
II
-+        // values will always be outside of this range.
-+        if (c < ' ' || c > '~') {
-+          return false;
-+        }
-+      }
-+    }
-+  }
-+  return true;
-+}
-
--  if (method !=3D X509V3_EXT_get_nid(NID_subject_alt_name))
--    return false;
-+static inline void PrintAltName(const BIOPointer& out, const char* name,
-+                                size_t length, bool utf8,
-+                                const char* safe_prefix) {
-+  if (IsSafeAltName(name, length, utf8)) {
-+    // For backward-compatibility, append "safe" names without any
-+    // modifications.
-+    if (safe_prefix !=3D nullptr) {
-+      BIO_printf(out.get(), "%s:", safe_prefix);
-+    }
-+    BIO_write(out.get(), name, length);
-+  } else {
-+    // If a name is not "safe", we cannot embed it without special
-+    // encoding. This does not usually happen, but we don't want to hide
-+    // it from the user either. We use JSON compatible escaping here.
-+    BIO_write(out.get(), "\"", 1);
-+    if (safe_prefix !=3D nullptr) {
-+      BIO_printf(out.get(), "%s:", safe_prefix);
-+    }
-+    for (size_t j =3D 0; j < length; j++) {
-+      char c =3D static_cast<char>(name[j]);
-+      if (c =3D=3D '\\') {
-+        BIO_write(out.get(), "\\\\", 2);
-+      } else if (c =3D=3D '"') {
-+        BIO_write(out.get(), "\\\"", 2);
-+      } else if ((c >=3D ' ' && c !=3D ',' && c <=3D '~') || (utf8 && (c =
& 0x80))) {
-+        // Note that the above condition explicitly excludes commas, whic=
h means
-+        // that those are encoded as Unicode escape sequences in the "els=
e"
-+        // block. That is not strictly necessary, and Node.js itself woul=
d parse
-+        // it correctly either way. We only do this to account for third-=
party
-+        // code that might be splitting the string at commas (as Node.js =
itself
-+        // used to do).
-+        BIO_write(out.get(), &c, 1);
-+      } else {
-+        // Control character or non-ASCII character. We treat everything =
as
-+        // Latin-1, which corresponds to the first 255 Unicode code point=
s.
-+        const char hex[] =3D "0123456789abcdef";
-+        char u[] =3D { '\\', 'u', '0', '0', hex[(c & 0xf0) >> 4], hex[c &=
 0x0f] };
-+        BIO_write(out.get(), u, sizeof(u));
-+      }
-+    }
-+    BIO_write(out.get(), "\"", 1);
-+  }
-+}
-+
-+static inline void PrintLatin1AltName(const BIOPointer& out,
-+                                      const ASN1_IA5STRING* name,
-+                                      const char* safe_prefix =3D nullptr=
) {
-+  PrintAltName(out, reinterpret_cast<const char*>(name->data), name->leng=
th,
-+               false, safe_prefix);
-+}
-+
-+static inline void PrintUtf8AltName(const BIOPointer& out,
-+                                    const ASN1_UTF8STRING* name,
-+                                    const char* safe_prefix =3D nullptr) =
{
-+  PrintAltName(out, reinterpret_cast<const char*>(name->data), name->leng=
th,
-+               true, safe_prefix);
-+}
-+
-+// This function currently emulates the behavior of i2v_GENERAL_NAME in a=
 safer
-+// and less ambiguous way.
-+// TODO(tniessen): gradually improve the format in the next major version=
(s)
-+static bool PrintGeneralName(const BIOPointer& out, const GENERAL_NAME* g=
en) {
-+  if (gen->type =3D=3D GEN_DNS) {
-+    ASN1_IA5STRING* name =3D gen->d.dNSName;
-+    BIO_write(out.get(), "DNS:", 4);
-+    // Note that the preferred name syntax (see RFCs 5280 and 1034) with
-+    // wildcards is a subset of what we consider "safe", so spec-complian=
t DNS
-+    // names will never need to be escaped.
-+    PrintLatin1AltName(out, name);
-+  } else if (gen->type =3D=3D GEN_EMAIL) {
-+    ASN1_IA5STRING* name =3D gen->d.rfc822Name;
-+    BIO_write(out.get(), "email:", 6);
-+    PrintLatin1AltName(out, name);
-+  } else if (gen->type =3D=3D GEN_URI) {
-+    ASN1_IA5STRING* name =3D gen->d.uniformResourceIdentifier;
-+    BIO_write(out.get(), "URI:", 4);
-+    // The set of "safe" names was designed to include just about any URI=
,
-+    // with a few exceptions, most notably URIs that contains commas (see
-+    // RFC 2396). In other words, most legitimate URIs will not require
-+    // escaping.
-+    PrintLatin1AltName(out, name);
-+  } else if (gen->type =3D=3D GEN_DIRNAME) {
-+    // For backward compatibility, use X509_NAME_oneline to print the
-+    // X509_NAME object. The format is non standard and should be avoided
-+    // elsewhere, but conveniently, the function produces ASCII and the o=
utput
-+    // is unlikely to contains commas or other characters that would requ=
ire
-+    // escaping. With that in mind, note that it SHOULD NOT produce ASCII
-+    // output since an RFC5280 AttributeValue may be a UTF8String.
-+    // TODO(tniessen): switch to RFC2253 rules in a major release
-+    BIO_printf(out.get(), "DirName:");
-+    char oline[256];
-+    if (X509_NAME_oneline(gen->d.dirn, oline, sizeof(oline)) !=3D nullptr=
) {
-+      PrintAltName(out, oline, strlen(oline), false, nullptr);
-+    } else {
-+      return false;
-+    }
-+  } else if (gen->type =3D=3D GEN_IPADD) {
-+    BIO_printf(out.get(), "IP Address:");
-+    const ASN1_OCTET_STRING* ip =3D gen->d.ip;
-+    const unsigned char* b =3D ip->data;
-+    if (ip->length =3D=3D 4) {
-+      BIO_printf(out.get(), "%d.%d.%d.%d", b[0], b[1], b[2], b[3]);
-+    } else if (ip->length =3D=3D 16) {
-+      for (unsigned int j =3D 0; j < 8; j++) {
-+        uint16_t pair =3D (b[2 * j] << 8) | b[2 * j + 1];
-+        BIO_printf(out.get(), (j =3D=3D 0) ? "%X" : ":%X", pair);
-+      }
-+    } else {
-+#if OPENSSL_VERSION_MAJOR >=3D 3
-+      BIO_printf(out.get(), "<invalid length=3D%d>", ip->length);
-+#else
-+      BIO_printf(out.get(), "<invalid>");
-+#endif
-+    }
-+  } else if (gen->type =3D=3D GEN_RID) {
-+    // TODO(tniessen): unlike OpenSSL's default implementation, never pri=
nt the
-+    // OID as text and instead always print its numeric representation, w=
hich is
-+    // backward compatible in practice and more future proof (see OBJ_obj=
2txt).
-+    char oline[256];
-+    i2t_ASN1_OBJECT(oline, sizeof(oline), gen->d.rid);
-+    BIO_printf(out.get(), "Registered ID:%s", oline);
-+  } else if (gen->type =3D=3D GEN_OTHERNAME) {
-+    // TODO(tniessen): the format that is used here is based on OpenSSL's
-+    // implementation of i2v_GENERAL_NAME (as of OpenSSL 3.0.1), mostly f=
or
-+    // backward compatibility. It is somewhat awkward, especially when pa=
ssed to
-+    // translatePeerCertificate, and should be changed in the future, pro=
bably
-+    // to the format used by GENERAL_NAME_print (in a major release).
-+    bool unicode =3D true;
-+    const char* prefix =3D nullptr;
-+    // OpenSSL 1.1.1 does not support othername in i2v_GENERAL_NAME and m=
ay not
-+    // define these NIDs.
-+#if OPENSSL_VERSION_MAJOR >=3D 3
-+    int nid =3D OBJ_obj2nid(gen->d.otherName->type_id);
-+    switch (nid) {
-+      case NID_id_on_SmtpUTF8Mailbox:
-+        prefix =3D " SmtpUTF8Mailbox:";
-+        break;
-+      case NID_XmppAddr:
-+        prefix =3D " XmppAddr:";
-+        break;
-+      case NID_SRVName:
-+        prefix =3D " SRVName:";
-+        unicode =3D false;
-+        break;
-+      case NID_ms_upn:
-+        prefix =3D " UPN:";
-+        break;
-+      case NID_NAIRealm:
-+        prefix =3D " NAIRealm:";
-+        break;
-+    }
-+#endif  // OPENSSL_VERSION_MAJOR >=3D 3
-+    int val_type =3D gen->d.otherName->value->type;
-+    if (prefix =3D=3D nullptr ||
-+        (unicode && val_type !=3D V_ASN1_UTF8STRING) ||
-+        (!unicode && val_type !=3D V_ASN1_IA5STRING)) {
-+      BIO_printf(out.get(), "othername:<unsupported>");
-+    } else {
-+      BIO_printf(out.get(), "othername:");
-+      if (unicode) {
-+        PrintUtf8AltName(out, gen->d.otherName->value->value.utf8string,
-+                         prefix);
-+      } else {
-+        PrintLatin1AltName(out, gen->d.otherName->value->value.ia5string,
-+                           prefix);
-+      }
-+    }
-+  } else if (gen->type =3D=3D GEN_X400) {
-+    // TODO(tniessen): this is what OpenSSL does, implement properly inst=
ead
-+    BIO_printf(out.get(), "X400Name:<unsupported>");
-+  } else if (gen->type =3D=3D GEN_EDIPARTY) {
-+    // TODO(tniessen): this is what OpenSSL does, implement properly inst=
ead
-+    BIO_printf(out.get(), "EdiPartyName:<unsupported>");
-+  } else {
-+    // This is safe because X509V3_EXT_d2i would have returned nullptr in=
 this
-+    // case already.
-+    UNREACHABLE();
-+  }
-+
-+  return true;
-+}
-+
-+bool SafeX509SubjectAltNamePrint(const BIOPointer& out, X509_EXTENSION* e=
xt) {
-+  const X509V3_EXT_METHOD* method =3D X509V3_EXT_get(ext);
-+  CHECK(method =3D=3D X509V3_EXT_get_nid(NID_subject_alt_name));
-
-   GENERAL_NAMES* names =3D static_cast<GENERAL_NAMES*>(X509V3_EXT_d2i(ext=
));
-   if (names =3D=3D nullptr)
-     return false;
-
-+  bool ok =3D true;
-+
-   for (int i =3D 0; i < sk_GENERAL_NAME_num(names); i++) {
-     GENERAL_NAME* gen =3D sk_GENERAL_NAME_value(names, i);
-
-     if (i !=3D 0)
-       BIO_write(out.get(), ", ", 2);
-
--    if (gen->type =3D=3D GEN_DNS) {
--      ASN1_IA5STRING* name =3D gen->d.dNSName;
--
--      BIO_write(out.get(), "DNS:", 4);
--      BIO_write(out.get(), name->data, name->length);
--    } else {
--      STACK_OF(CONF_VALUE)* nval =3D i2v_GENERAL_NAME(
--          const_cast<X509V3_EXT_METHOD*>(method), gen, nullptr);
--      if (nval =3D=3D nullptr)
--        return false;
--      X509V3_EXT_val_prn(out.get(), nval, 0, 0);
--      sk_CONF_VALUE_pop_free(nval, X509V3_conf_free);
-+    if (!(ok =3D PrintGeneralName(out, gen))) {
-+      break;
-     }
-   }
-   sk_GENERAL_NAME_pop_free(names, GENERAL_NAME_free);
-
--  return true;
-+  return ok;
-+}
-+
-+bool SafeX509InfoAccessPrint(const BIOPointer& out, X509_EXTENSION* ext) =
{
-+  const X509V3_EXT_METHOD* method =3D X509V3_EXT_get(ext);
-+  CHECK(method =3D=3D X509V3_EXT_get_nid(NID_info_access));
-+
-+  AUTHORITY_INFO_ACCESS* descs =3D
-+      static_cast<AUTHORITY_INFO_ACCESS*>(X509V3_EXT_d2i(ext));
-+  if (descs =3D=3D nullptr)
-+    return false;
-+
-+  bool ok =3D true;
-+
-+  for (int i =3D 0; i < sk_ACCESS_DESCRIPTION_num(descs); i++) {
-+    ACCESS_DESCRIPTION* desc =3D sk_ACCESS_DESCRIPTION_value(descs, i);
-+
-+    if (i !=3D 0)
-+      BIO_write(out.get(), "\n", 1);
-+
-+    char objtmp[80];
-+    i2t_ASN1_OBJECT(objtmp, sizeof(objtmp), desc->method);
-+    BIO_printf(out.get(), "%s - ", objtmp);
-+    if (!(ok =3D PrintGeneralName(out, desc->location))) {
-+      break;
-+    }
-+  }
-+  sk_ACCESS_DESCRIPTION_pop_free(descs, ACCESS_DESCRIPTION_free);
-+
-+#if OPENSSL_VERSION_MAJOR < 3
-+  BIO_write(out.get(), "\n", 1);
-+#endif
-+
-+  return ok;
-+}
-+
-+v8::MaybeLocal<v8::Value> GetSubjectAltNameString(
-+    Environment* env,
-+    const BIOPointer& bio,
-+    X509* cert) {
-+  int index =3D X509_get_ext_by_NID(cert, NID_subject_alt_name, -1);
-+  if (index < 0)
-+    return Undefined(env->isolate());
-+
-+  X509_EXTENSION* ext =3D X509_get_ext(cert, index);
-+  CHECK_NOT_NULL(ext);
-+
-+  if (!SafeX509SubjectAltNamePrint(bio, ext)) {
-+    USE(BIO_reset(bio.get()));
-+    return v8::Null(env->isolate());
-+  }
-+
-+  return ToV8Value(env, bio);
-+}
-+
-+v8::MaybeLocal<v8::Value> GetInfoAccessString(
-+    Environment* env,
-+    const BIOPointer& bio,
-+    X509* cert) {
-+  int index =3D X509_get_ext_by_NID(cert, NID_info_access, -1);
-+  if (index < 0)
-+    return Undefined(env->isolate());
-+
-+  X509_EXTENSION* ext =3D X509_get_ext(cert, index);
-+  CHECK_NOT_NULL(ext);
-+
-+  if (!SafeX509InfoAccessPrint(bio, ext)) {
-+    USE(BIO_reset(bio.get()));
-+    return v8::Null(env->isolate());
-+  }
-+
-+  return ToV8Value(env, bio);
- }
-
- MaybeLocal<Value> GetFingerprintDigest(
-@@ -628,27 +909,6 @@ MaybeLocal<Value> GetModulusString(
-   return ToV8Value(env, bio);
- }
-
--template <int nid>
--MaybeLocal<Value> GetInfoString(
--    Environment* env,
--    const BIOPointer& bio,
--    X509* cert) {
--  int index =3D X509_get_ext_by_NID(cert, nid, -1);
--  if (index < 0)
--    return Undefined(env->isolate());
--
--  X509_EXTENSION* ext =3D X509_get_ext(cert, index);
--  CHECK_NOT_NULL(ext);
--
--  if (!SafeX509ExtPrint(bio, ext) &&
--      X509V3_EXT_print(bio.get(), ext, 0, 0) !=3D 1) {
--    USE(BIO_reset(bio.get()));
--    return Null(env->isolate());
--  }
--
--  return ToV8Value(env, bio);
--}
--
- MaybeLocal<Value> GetIssuerString(
-     Environment* env,
-     const BIOPointer& bio,
-@@ -917,11 +1177,11 @@ MaybeLocal<Object> X509ToObject(Environment* env, X=
509* cert) {
-       !Set<Value>(context,
-                   info,
-                   env->subjectaltname_string(),
--                  GetInfoString<NID_subject_alt_name>(env, bio, cert)) ||
-+                  GetSubjectAltNameString(env, bio, cert)) ||
-       !Set<Value>(context,
-                   info,
-                   env->infoaccess_string(),
--                  GetInfoString<NID_info_access>(env, bio, cert))) {
-+                  GetInfoAccessString(env, bio, cert))) {
-     return MaybeLocal<Object>();
-   }
-
-diff --git a/test/common/index.js b/test/common/index.js
-index 8cd9841527..98b586cafd 100644
---- a/test/common/index.js
-+++ b/test/common/index.js
-@@ -51,6 +51,11 @@ const noop =3D () =3D> {};
- const hasCrypto =3D Boolean(process.versions.openssl) &&
-                   !process.env.NODE_SKIP_CRYPTO;
-
-+const hasOpenSSL3 =3D hasCrypto &&
-+    require('crypto').constants.OPENSSL_VERSION_NUMBER >=3D 805306368;
-+
-+const hasQuic =3D hasCrypto && !!process.config.variables.openssl_quic;
-+
- // Check for flags. Skip this for workers (both, the `cluster` module and
- // `worker_threads`) and child processes.
- // If the binary was built without-ssl then the crypto flags are
-@@ -714,6 +719,8 @@ const common =3D {
-   getTTYfd,
-   hasIntl,
-   hasCrypto,
-+  hasOpenSSL3,
-+  hasQuic,
-   hasMultiLocalhost,
-   invalidArgTypeHelper,
-   isAIX,
-diff --git a/test/fixtures/keys/Makefile b/test/fixtures/keys/Makefile
-index 824704c724..49cc29ad1c 100644
---- a/test/fixtures/keys/Makefile
-+++ b/test/fixtures/keys/Makefile
-@@ -75,6 +75,8 @@ all: \
-   ed448_public.pem \
-   x448_private.pem \
-   x448_public.pem \
-+  incorrect_san_correct_subject-cert.pem \
-+  incorrect_san_correct_subject-key.pem \
-
- #
- # Create Certificate Authority: ca1
-@@ -733,6 +735,18 @@ x448_private.pem:
- x448_public.pem: x448_private.pem
-       openssl pkey -in x448_private.pem -pubout -out x448_public.pem
-
-+incorrect_san_correct_subject-cert.pem: incorrect_san_correct_subject-key=
.pem
-+      openssl req -x509 \
-+                  -key incorrect_san_correct_subject-key.pem \
-+                  -out incorrect_san_correct_subject-cert.pem \
-+                  -sha256 \
-+                  -days 3650 \
-+                  -subj "/CN=3Dgood.example.com" \
-+                  -addext "subjectAltName =3D DNS:evil.example.com"
-+
-+incorrect_san_correct_subject-key.pem:
-+      openssl ecparam -name prime256v1 -genkey -noout -out incorrect_san_=
correct_subject-key.pem
-+
- clean:
-       rm -f *.pfx *.pem *.srl ca2-database.txt ca2-serial fake-startcom-r=
oot-serial *.print *.old fake-startcom-root-issued-certs/*.pem
-       @> fake-startcom-root-database.txt
-diff --git a/test/fixtures/keys/incorrect_san_correct_subject-cert.pem b/t=
est/fixtures/keys/incorrect_san_correct_subject-cert.pem
-new file mode 100644
-index 0000000000..787d9f1135
---- /dev/null
-+++ b/test/fixtures/keys/incorrect_san_correct_subject-cert.pem
-@@ -0,0 +1,11 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBqDCCAU6gAwIBAgIUE3Kx4WUjkwuKy/fBOM+UJkb9aSAwCgYIKoZIzj0EAwIw
-+GzEZMBcGA1UEAwwQZ29vZC5leGFtcGxlLmNvbTAeFw0yMTEyMTExNjUxNDVaFw0z
-+MTEyMDkxNjUxNDVaMBsxGTAXBgNVBAMMEGdvb2QuZXhhbXBsZS5jb20wWTATBgcq
-+hkjOPQIBBggqhkjOPQMBBwNCAASQ/CKa5uMZuLYssnNOm7DPdw3I5Doa0Qpyf3cS
-+7aGatfK3tuY8qG7nJ5OGtl1WOL/gN0vRRN0/KA/iRJyjafzzo3AwbjAdBgNVHQ4E
-+FgQUFkpgPzE1ePjK5UsPcR0gk5uLsTUwHwYDVR0jBBgwFoAUFkpgPzE1ePjK5UsP
-+cR0gk5uLsTUwDwYDVR0TAQH/BAUwAwEB/zAbBgNVHREEFDASghBldmlsLmV4YW1w
-+bGUuY29tMAoGCCqGSM49BAMCA0gAMEUCIQCMZAinQXkOEhfp+moxVnLbcUPAAqsl
-+1KCq3NRG91TGCgIgC4grmOhCRqJMF1RPNWobGogX/yNrYNjiGzNVyJzMR0s=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/keys/incorrect_san_correct_subject-key.pem b/te=
st/fixtures/keys/incorrect_san_correct_subject-key.pem
-new file mode 100644
-index 0000000000..f7f51253a8
---- /dev/null
-+++ b/test/fixtures/keys/incorrect_san_correct_subject-key.pem
-@@ -0,0 +1,5 @@
-+-----BEGIN EC PRIVATE KEY-----
-+MHcCAQEEIOOVRgLS3H2T2fUhj4ASCFq60ySwO6yvSK6rvZHldAHuoAoGCCqGSM49
-+AwEHoUQDQgAEkPwimubjGbi2LLJzTpuwz3cNyOQ6GtEKcn93Eu2hmrXyt7bmPKhu
-+5yeThrZdVji/4DdL0UTdPygP4kSco2n88w=3D=3D
-+-----END EC PRIVATE KEY-----
-diff --git a/test/fixtures/x509-escaping/.gitignore b/test/fixtures/x509-e=
scaping/.gitignore
-new file mode 100644
-index 0000000000..504afef81f
---- /dev/null
-+++ b/test/fixtures/x509-escaping/.gitignore
-@@ -0,0 +1,2 @@
-+node_modules/
-+package-lock.json
-diff --git a/test/fixtures/x509-escaping/alt-0-cert.pem b/test/fixtures/x5=
09-escaping/alt-0-cert.pem
-new file mode 100644
-index 0000000000..30e6fa6c3f
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-0-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE5jCCAs6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+NTAzMDEGA1UdEQQqMCiCJmdvb2QuZXhhbXBsZS5jb20sIEROUzpldmlsLmV4YW1w
-+bGUuY29tMA0GCSqGSIb3DQEBCwUAA4ICAQAcsy+PIduM8NRrdqcTqufiajsAajQz
-+eB5+5+lZLi9MliXqoS4HsdrDMDevMa2cC+wB+XZW9SJXjtqrwXAxTAHtEyhsCi25
-+XV0sJPWmZM+OQkGTtp7Ain12htr/t/DJ13YJpT03W6kYogA1kKJ5OMYMTcGT+7UB
-+zM4G2LUSrrSisxhfz9bF8Q9s1piG2gb5ACEQUiMLRrZXl8WLlaY59lloKyMa/9g6
-+i3TgLxhp7XNS/bh/f2tDx+7ZgdtHUlkNhl1MycIVQRGK3BaZBEd+sDxS52kwym5I
-+CWLXGLutU3OeaNgqyvZuMvy//2oER3PysizyjwNoFlUbIz3zMnXvBeEjeGtEHsCJ
-+EBtX+xBWwMhUKE2QcMLxQaZNJCZFVFw8fDeEgFjTdEBcLsZ1PngT3jgXSHEWA+YL
-+C3rQhFMjyjy2h8u1sjySFrTlbZPm8gC3q/+LaXxhf5i5xiZOOcVfeYiWFUa5gQal
-+FaWj2SlQFaN2nidPaQO62vRIYn0Y/qbtUQAPkq4VVeycgxiuZaVVWCdct8UCYb9F
-+b9QSMpK4r99MKy+s41RiJodDJy0XraOxy7hUDjyObL2fuuPUK6mQAFGwWtajv3qq
-+vrRMvBEXdOPVmbETyzIosUHvOXT+v8WoCbC14mqMZTWVywRg7bD/NTHJDRIBrqvi
-+O6Zqbod3EImVnQ=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-1-cert.pem b/test/fixtures/x5=
09-escaping/alt-1-cert.pem
-new file mode 100644
-index 0000000000..63883c2bbf
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-1-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE0zCCArugAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+IjAgMB4GA1UdEQQXMBWGE2h0dHA6Ly9leGFtcGxlLmNvbS8wDQYJKoZIhvcNAQEL
-+BQADggIBACFwNHWQ5w3UBbyq17emn7Z0BT0Zm5iFr8Qeik75WzbyzXd5QIeFWewB
-+qmiuaoKGGZ674sGcuomnIwoZBCoqvzbBBqBHp+O3/6pq59THQxeE6vhjKAe8oaih
-+emdigRmkX+Qi8UwUh76B51wHtkp6zAZnLDn8M67qmP7bjNrrMQeE81wRWYz9ssfd
-+N63dzu2BdD3EGl4CepdszpfUYLkz6iiDwFkc1NaBcQbBDoGqn2ubNXTHAyGGeL5a
-+ulDCND0FQtg+jhHHE3zXBqh1nPg/cXXRUG2zjxzUnaU2eMs5b4yqoLN/2n7fb7mV
-+HRh0T6X1HZcYpf5BSsgmr3Ngd/9b3sYRvNXBkVmKAu8dH7zguksczsvbL9r/u2YX
-+hgGjNT3xSphJbZTzqsACcoDo67EFkJ5p25f0N1i/rxk7O6uLMtrUqnzOXs6NXgEQ
-+8lyfVEgLFrXzdKXuk2l/6bwym80Eqdpjv5yCckCl24cFVpc15MRP3MPwIHrtoOLw
-+bdNZA5NUAnppLmG6zTdPPgBWEmf5+4ei9WjmpG1hq72/nJ1qM2dLIgV5nLggr1UH
-+i+vih+ujceBLVumAu/naP440xO5HRvpPfDWI+eU/wuXjUyAqe6YlYS+Txu/5YnFh
-+aMHO+PIgudWwGPhkABtrc/1jC+Yfy+GCtih10zBagoN9/DSugh0H
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-10-cert.pem b/test/fixtures/x=
509-escaping/alt-10-cert.pem
-new file mode 100644
-index 0000000000..14bec45d28
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-10-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIExTCCAq2gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+FDASMBAGA1UdEQQJMAeHBQAICAQEMA0GCSqGSIb3DQEBCwUAA4ICAQA+jnyjJ/9X
-+ENWXApq2g+GlWBM07KpsrxzwDXc6wsOnZCIiMoDqpcH96X8Q2Lahc4mZuz4yOZtv
-+z8Q9YUDTnJY+RtKYNDbxlz7wI1ASxKdP0X1qdzkYtHH752tG/zwVU2FSvqJLw+nl
-+rPJvQQ82/30BspejbW0JIfO7JnfN5BHPzzJp/V5tI1KQe+Wh0gEq6UvXjFrkCoeU
-+gaedPaG2RYDi1LWawRque7pnYzrcJCtc+wb8wiL1dRv7fDDmI7fFm3Bj6Rnid4/6
-+/CxK3WqLBQrXoGnPGwI4iR17Rx08hPCL2V8NvDuJlagJe/Vc6LzOEixofoHGx4rG
-+Cm0AKubKbak/ML/rjyP2TiUmOhhm3Xdml3xexedErkgTLtlvmC0jesYuc4MeypNx
-+Q0eKRnChRGZYT9kaNgXZG1Scq63vpxKhayVvwU4ahGQS+nmuZdbRMEMIH6YkGxo/
-+i5qmNxQPLMLE6HclSdDtUxN4ywQAQ49CaTCxVYq7dLTzpII3ldQ+KuefenaXrYGE
-+7TyqJBVdsTq0Bg2Ftf7GaoidJ/ZjjkB3Sj5uVQFMfU8uSATOolBOzh6fSiQJ60Zn
-+CtAAkb9uOwTl67Qijo4qAe9JRNqR9H5d65D0Vx+gdhcZVEriqIVhXVcgsvYQ55Ju
-+VGhc/foVd+vBuM3jXEdGR+DN/dEu+HZrhQ=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-11-cert.pem b/test/fixtures/x=
509-escaping/alt-11-cert.pem
-new file mode 100644
-index 0000000000..694cb7e9d8
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-11-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIExjCCAq6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+FTATMBEGA1UdEQQKMAiHBgABAgMEBTANBgkqhkiG9w0BAQsFAAOCAgEAp2nxfYla
-+giNJ9S2owtp/5DxB3jIhQJzmdSxuUKVwWBffmzxrTkOoK/IcGkq3hu27GIy+ICFc
-+YkSsAE3DfboSTStxhkVZKMVv+e5tXPQ0i+Z+CSgHZbrnaA7nH0UPEgFFddhqogGw
-+LGE54iZ3D7ZYebTw/ELCIHNu9KeOStF7j04WXG7qRrqza5NmKqlxTC5tGoWAljzN
-+cdC2BdK7H2+6de3c4dBsYqcL2IgwNhA1uKIsDjJwwkOPmCEPl+7DjleI3IAKpROh
-+vX66DLaAsLEkoHsN7XTienHF8o/avIMGUfb0rtNLbwW8tzfjeAaJ7iTSm7ibhBLP
-+fK+n7Osh9QH+lG0K7M2zez7Kd3u+eNgTEG63gVR+zDZQwkA2Hy1o4zmZ+a3iCtdi
-+w6JGq3TT8nfPNO4kSoq7EYs6daPnGi3sqNRC20t4FZw0jOpvI4Uw7rPcTTqmAeAw
-+9H37WU3URD2EP8BpkoZiOShMHzNGqlC9qbqr5dd83Lkdz9gN4w3ipdbiiGFGPXhT
-+YubUecjwXoBUUI+be/edVbg7RtSSuplDv5l4bBSy+BG8JEUL6CKAUEtt2Tpt2SVD
-+AIaj0B19/DSYq1e4x8IBVBsI2RnEEpP70bdLiSYLhVhMdzp0PRqDVDE+zt4mm0lx
-+NRDSdNS1/rJEH1gLQEh4SGMs9iY5Vv+kx28=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-12-cert.pem b/test/fixtures/x=
509-escaping/alt-12-cert.pem
-new file mode 100644
-index 0000000000..7e48ebdf05
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-12-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE0DCCArigAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+HzAdMBsGA1UdEQQUMBKHEAoLDA0ODwAAAAAAAHp7fH0wDQYJKoZIhvcNAQELBQAD
-+ggIBAEMU6XcjSdQ+EG22BsyAYin2d3g9Fd0gljsuyEyw2qwFE1zeNqz2sFX7GdmP
-+hEmUVdzQ0EQsHtKiO2BIhU5fkLoGIkJQT0MY/Tkc3xCLjVBG9ryHNjhv4aYfcvZ2
-+K8LwWu5na5YtpmEHppFTmhQFHK9Yf2Jeh5Ms1VH2jwKR8iFM9dk0wcB74Y1WqyX0
-+bhNUzv0ISvz/DK6rN0CM0OiZ7D1toMFJIslEcZD/MCZ0icFwRgGLzooDbm1xtixo
-+NjgdswdiL0cS/wgSdzu9eIugUQZU2KvUWYXGqYMDpn7iukiZSKQuFhZGcuK17zyR
-+y6TkDFe9rTxVtw9SAxjlo94rEqWN9Cns0n7tqAI/Wg6ILHUjUFwqSdrZQTEgH4O3
-+tfhRkV4HCgP1Tzfz/20uMBqjCLbdt7xcSfLIiHgaxgwM0LGhH2Uk3oYinL2WIUDi
-+bZPI+1bzeyZ/tHw4sDxkGn3W3Nr44Td/5DAFz1lRMxAliVwHNzFTiY7IjCqmB0DL
-+z91agdgPMdh/huFvGJZHS/v7EXMSXyNLyIw+5JO12iwf4+pu8NLnOtMoHDB4yY0w
-+MEerc4e8SmygBQGF0MrcmirdT+7yiKRktZZFuyQoj4fBSKeBaBKUrnnk4UYw9H8f
-+j/EQwM87PmYjTwYPrJ0Kz5r4dmAUvq4z2ReLgM08Ve4SPa79
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-13-cert.pem b/test/fixtures/x=
509-escaping/alt-13-cert.pem
-new file mode 100644
-index 0000000000..574ad1ca8f
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-13-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIEzzCCAregAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+HjAcMBoGA1UdEQQTMBGBD2Zvb0BleGFtcGxlLmNvbTANBgkqhkiG9w0BAQsFAAOC
-+AgEAkx9jG86PMjL+/UxlhX0B/gIKHyTVrEt8j+/fn74uMnd7CV7toK6f5DANIxYp
-+3OJWAFYZ2lNS3MQMxpbjpd7D0BeNwhiJyBnRPhJ9KdsvdXnupF5ANNzr3oMioWwL
-+3WxvmQDEz35sorae5nzuZu8EpuwgodR0NCEmoPdW9JOUiB7k3Ku5goZHqlrdzM8f
-+YPbRDNOxSIpRqr5eqhEM9tEf+TF6qOM/NZJlXxtGDVdaDTbaULuCJGEW8TdVajnY
-+FfWWtIHwF64G5qJTgENqJjR1kkJy5vg2lFoDXE8MG+LvTHfyY0rMilncD2YOBLcj
-+gb3mBTxZGI2w2KZbchgEvA9+0heumAVJQPfdGs+pCUdvlhwWh8FCvu3aQb5X57OU
-+3D97vwvEs8Mxm0KHf0o0ZnTvaBWN5htX2bbpvYxGGB0SsWM8r1LIXj8bwGNdViV8
-+UWNrg37XyGCppL1jXJ1q+DDKOvi0JR384ocRmS8mWUf9qiAMOqveix38rHezWlEm
-+4TCscq4tv135nM194D6uilzv4mUxLAMTX8Lvag1R3aKuOHio9lCGep4v776kALE6
-+9/rekRGoMwNApoaC96x+V/dkbfnjWcxRXL5TvjDwVInl+RCcn6ijYZM0HYc+U1Dw
-+MwqBCbP2Y9Ee7xcnAgPbqH2svWG7XadQHAcOEDc/DFsPRG8=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-14-cert.pem b/test/fixtures/x=
509-escaping/alt-14-cert.pem
-new file mode 100644
-index 0000000000..0265b5992c
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-14-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE5TCCAs2gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+NDAyMDAGA1UdEQQpMCeBJWZvb0BleGFtcGxlLmNvbSwgRE5TOmdvb2QuZXhhbXBs
-+ZS5jb20wDQYJKoZIhvcNAQELBQADggIBABf7bojDeoFEFyk/Xzo50sAL+5irJYzV
-+n//5aEvUotYxQt5coi7UnkKUgdiUhIXD8WaxD9KP3nUH+C3cxAQ+I7iVjFhjqFQB
-+X4c/ZjJA2QIX7VMWA3kpOFvR5N0HHest097Fi/HUEEXNkcUtCkRNtI2Msse9uz09
-+DIv9P0IQ2TFgBRCTJwq2ZfVebHk/xoQ5fV9b0b39ts6ToiuMvGJVng2zz8fVNMah
-+hycCn0WSb6dPi9k0ItSvRTYL6vp9X842+Q0Xkq0FxQPUcvzN7D1tSmHXDM7nYXp3
-+FB6DKASp0+nn+J88RXVSpO0JedEyRDEluxHJcan+hqhWJ4DgamlVTEPN3q5yE4lt
-+Jr/R5tnx0Lv0CxDTAfZLaFiKb2jz9nVhzbCh7t21mxyb2mOM+GAxRaIgxodeNJoY
-+QA6Ezz4cbjjA72Rgi+tBxy2abXpbbJ/vX7FUhs0ICFKZJHvFoxazgtSGgHHYNxhc
-+/+9o6Y9jhunwGn/MaoxWJsdSjZ8VX7HY0iOSU3z4d4PWvIz05n4sGoJET6s1JuKe
-+dZAAeQy0V5/EzxIu4GPGrzVtk2SQhNHVJZKponZeCRruruGT5Z1T+gF5YSqVM6BA
-+XA0ZVXwOEbZ5XRIzBBbaiX3Eeful50ILOiP/uxLlcZtTtOyT4wNBgijfJehRHbED
-+ppJk42EFZKb2
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-15-cert.pem b/test/fixtures/x=
509-escaping/alt-15-cert.pem
-new file mode 100644
-index 0000000000..70a98fb90b
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-15-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE4jCCAsqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+MTAvMC0GA1UdEQQmMCSkIjAgMQswCQYDVQQGEwJERTERMA8GA1UEBwwISGFubm92
-+ZXIwDQYJKoZIhvcNAQELBQADggIBABIv7Wlg5F1gh0+0v/+LnushmLeypcXQGqkg
-+E2IxXC2VnZxq8xTFCHy/m1qTBLPJK5VIg5qmtstL9zIk9rOUshQvusvNLplC0j3o
-+GuQdQJNKV7rrzYYpUZO1en11q27AgDsO6lwSNg4U+mqzJxxIHc8IMeJpfaGTkUz/
-+ZXXNz04JJalUff+W2436vSvu8Y82fD72/qNu6EMiOl0EHJFQ/7eCAlz6hSNleLT/
-+N2GztApNzujbPgH7+PHOeVpwppDuXY1rkmPJMxCqkY8yOwyM5dMov0bjIN1f+QXv
-+7voxVGMTefUajKADaNGMShH5rhgjIWBgujvdCyLPr6W2R4S1QPzjx4X26eTX1G8V
-+/eTsJ6mMc+3cd6CEmEahUnc6LdEdwm+1SMRG2nejea4o8c+crwYX5KQVrqx92FqB
-+SdkdCtS6qlnxJVvSz+HW6lEM0EShvjKEz/udsnttALQjhxfB7AHNWA073o/OiH25
-+Y9QpUudmWJjOoqRokN0SV4rDQnfNcLKIoVFPu+rG2CpBDjUsoxG3/aC8Owcd8Ceh
-+w+O/DqQXudXFS3RsePbz4rPfID9YtBHrihCE10B70DUutWPsbe5lKie3wJpQbqvl
-+zp5kkI5RffVU7OFD6os3+wPomdIG21Cf/fru56nV3FmkINCabLQddes7OarQcZ5y
-+xsumEzq+
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-16-cert.pem b/test/fixtures/x=
509-escaping/alt-16-cert.pem
-new file mode 100644
-index 0000000000..64f852ceeb
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-16-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE4jCCAsqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+MTAvMC0GA1UdEQQmMCSkIjAgMQswCQYDVQQGEwJERTERMA8GA1UEBwwITcO8bmNo
-+ZW4wDQYJKoZIhvcNAQELBQADggIBAEID22h5WK1YJrKUmmO0owley+tL519YwJbs
-+FwbwPz7+SJKA+UQNqVXYOGLwDJ6A6OzsV1TnJuwGotTmvNwr7eOVyLf03qggIYEj
-+5Twgk57gJmqE+Q8UXUq2ocALUcgReZhluhNoL1XYQMbDaHYwh9HSOP7udEszVQoE
-+m1D74cSiW803XnqPJGj0i1s9mD6AEewPl2k0mQ0hTMM3rlE1jOCj4Jx81tWH5KNY
-+LXn/LhFomeo/LAU4PCFTt65tAomKTNXq0GwuunU62fy8pwh9QUpD3Vfrkm4+08uz
-+WXSk9PeaF8tOs5pRwVMRr0GIdnQHa9GKuBBSZEvkGTxLM+cxO7jp5qSs2IRVpI5s
-+ztlJQcJpeTRNCEF7gM98nMqDqve/IySGle9s1RjpnBuSD9UKzbMGeBuZK8d0JfBt
-+7XF3i6Tu74EbBL/mP/0xoHausW9Yo8HZhXjm5k9P7m9xxlq2JSSXeQCLbKFT/SN+
-+Q3bS6rh0HaqLP8Gd3OyU+aOOy13Tr167LEFNK6DlfSadITuHwRMNvCk8UIDRDzAZ
-+kXVXdT5UfUe4IJU6OPVsFfntTX6G8s2/K4WropnjD5NjBJ0ppvPgCBqEA03mCGVt
-+IunRhQypiA0+SilM7BX6jD97IcmnbSyQ6fUkIdDBTMlX3MoYXkT00gDT3y8D/aKw
-+KTd5SKbD
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-17-cert.pem b/test/fixtures/x=
509-escaping/alt-17-cert.pem
-new file mode 100644
-index 0000000000..f09f41b918
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-17-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE9jCCAt6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+RTBDMEEGA1UdEQQ6MDikNjA0MQswCQYDVQQGEwJERTElMCMGA1UEBwwcQmVybGlu
-+LCBETlM6Z29vZC5leGFtcGxlLmNvbTANBgkqhkiG9w0BAQsFAAOCAgEAchR9+hds
-+zMK0NKgiX32XxJJ79tlo2sRMCZqij8Lqfyz7JDlTMSvIVqcrmimlAMX5u8BxKRXG
-+99KzXhbJb6Hnj2i6fQobxpD6nKnPSUcoiiWccmp8jmcKQW7M6TuqOfEdEnKpf0BF
-+vNFBjXGxs0KqOArX/1d0DqYS1LTnxaC6NimgvjAqKVRm9mqj62pc9//ixCgHkqLJ
-+stuoSerbo/mO0ieY1wq9r9TZT1epacVrQpJFWeJWhow94WutMNesJSWLcxX63mH4
-+j0LHEEkHLa1UkMzM2RkHTVhKrthCiuyrtqrglLsdPInU7ZYVONyUrR2D1tMy52mB
-+b1HzzP43pomBJtp3OeEZtBDwmmGgD8RBdVK/T9hcK02cvB1w1yr4LHUeYLMqrZaP
-+SJHQ7kv9AV5Os64SYW9+7cqjt1q4VmaEqcuCqvB6mORHWHnsa6PQ19myA7OdqNpT
-+WAK3D94tpbGPTzfhUCHk0w0fPzJ4A1+S6g4eHX4iQQxxDg9sXV4ZRvAEKnJhs2S7
-+OhtXdfyu/1+lfaunN13SyxMwyyxHzylEU707Sisxse2usX1Zy2zxqD+LO/9iIu1S
-+76/rquhiOFRWxSpjb7ewpH97OGFmtzfH70vBBukn0alT4xjkje10NlBfzcFwHWQH
-+59nxPd5sUEqq+DxTjoAgwO91woU7UTs98lw=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-18-cert.pem b/test/fixtures/x=
509-escaping/alt-18-cert.pem
-new file mode 100644
-index 0000000000..341ac0b7ce
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-18-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIFBzCCAu+gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+VjBUMFIGA1UdEQRLMEmkRzBFMQswCQYDVQQGEwJERTE2MDQGA1UEBwwtQmVybGlu
-+LCBETlM6Z29vZC5leGFtcGxlLmNvbQBldmlsLmV4YW1wbGUuY29tMA0GCSqGSIb3
-+DQEBCwUAA4ICAQBFUk2Z1E5Q4mW7S8dLz5h78AmfNbwx9eNtECc8iLQq2Q0MuIzQ
-+noURyNSHhH2hkohU4afXjolCr54DkJNYogrBwHaNDt3Y3wqGQXc+BKRnqblfr1+A
-+1EoIaqRFjv/Mu2gB0H4U3vBRYriZu7BhQFXiQHAr6hWLG91B1eN1i+my9zOSoSZF
-+7BuemB/9F4wjvwmDJieSwOgGk3FhNV64Ce9M95RwDKNSJBTBqOTLoyvOw2jgs22m
-+MntqW9oRywGeHdJ5EucPBrZQKDNysNFj3We8H7PedGNlnG/QknE6pzpRgqbRCAax
-+hcvGQIaMcUJ3oWhJuPNscjsJ/nfaitz58nH5raj4O8JhlS1h49NpbJO/pAWMHh0d
-+ZruXspxdEwW17aMJJ365q0XyVysRHiwQuIQYCo8L7oVUsH5FUJ9xxPH22b+PG05r
-+EABdID+aDV7X/MNwBxgeBOFVOgE5bfrH8NBjkx/F7ID/hjcQDLVWWoFnpIjekebC
-+EeqTRl5TcnoN9Dc7zkfwmuYGoaYJrGhj7WRvfFgcw1Cr1xujiJtoKbEbMoeD45+H
-+SQ8MwBb37Gm3aBNakpVmJlp/QZSJY403hA8QrZdjnqoS4THrC0+gN2q71aZ9ZCZY
-+3+OPNg659ZcYvo1onBSA0p1WGKEAWdHKqZCVRdsl5LnRg4H5gEVW4gmhjA=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-19-cert.pem b/test/fixtures/x=
509-escaping/alt-19-cert.pem
-new file mode 100644
-index 0000000000..f163184204
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-19-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIFCDCCAvCgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+VzBVMFMGA1UdEQRMMEqkSDBGMQswCQYDVQQGEwJERTE3MDUGA1UEBwwuQmVybGlu
-+LCBETlM6Z29vZC5leGFtcGxlLmNvbVwAZXZpbC5leGFtcGxlLmNvbTANBgkqhkiG
-+9w0BAQsFAAOCAgEAWtSJOhwRpYdB/aq/AixRTIpwf5VR3MWaDNh7clpnpYhYoLDY
-+7dJ8cv3AR5dOScFXLrCZ2UYVD+tTPyt18opnYDT4h6If/U9TTHVu5tRSX0wGIdPc
-+j3zVVegty/HWMA5LfwygNTvZjgXhocckNND7hC42+BuXE2bqoqnkqMRer/R+9PmU
-+FXpyLk0aDl2QmspDAz86FYpEuxpMfmDNmM1nWDz+n+uBbeuriTttsFqFWkfOGoNN
-+/3tAmUjAt5IqkL+7rnDt6Lc9inY0z3uYGJEdqa0GJJFJ7U+8wcw8rUwvKETqAtW1
-+mBOswkoCImPeNDpiqiotwl4cfrsb1+j9gNpYTP2oSurh/bF0mxGLoJa1iDeibwqg
-++f6oWcCdYQ94ItvS3d+lNXT0MWM6HU6sHXf3+5SqvsvsKjUBRyy1Nvnug1bha6Qv
-+bdeErN0ZSGy12Vc90Y5fpl8kebmYiJc79OqvuTNDeRfgBm+U4ASAj/AEhtbN+wDd
-+HrUHbk/9U9h0UFRZ5s7Pqoy5PEoLRoFeA/jQQa/fLC8nl7YTSwidVgj8cyAy36sV
-+uaBNXrcgelqlR26SBynXM3APaFlv5IdSlF199swMCusQrGbiNajl21TUm+Iv+84g
-+x7rnUPnQ1grkLpMOBtGaraKc93e2VfH5bAZvyaIq99qdA10ERCtE2grvjik=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-2-cert.pem b/test/fixtures/x5=
09-escaping/alt-2-cert.pem
-new file mode 100644
-index 0000000000..6ae58f5636
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-2-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE2zCCAsOgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+KjAoMCYGA1UdEQQfMB2GG2h0dHA6Ly9leGFtcGxlLmNvbS8/YT1iJmM9ZDANBgkq
-+hkiG9w0BAQsFAAOCAgEANTZFCjNmspLkZaVYkcAXfT2poPPWAu7wS/wG4VEmKwPV
-+A4dnFV2McXNW/iyABeoofeIjsjiYLpxTvz3teD2JJh+hidNED77PV7f4hj7vs4Dn
-+DGB3HKJvTD63AVOiPJ4bbfUyiuvLO5TwdxAGm+q9lsf/fWFraTF2qlnFwyWf6Qul
-++NQo3bM8mErvntZMscq7wo0cOdAXA0bNqxKS+IDnc+HLxoEr2egbRJmEagMgV4/U
-++AGVQ1sY+HrEszOPUA6NZ/OzLuXUT3swm+4rqJZEQ3AVr2BdqSzoiGHqqzmfKO33
-+sODcYXuED0sUkIhRZE1vW+wXR94WQsT5C4MtHabNjpPLSH7cVjGvEfTX8DJH/F7p
-+OdMmXxvPey0wLGJwoZMMhG/XC8Nb1g+qCLLou9WuA7KHMibfiYdBnPcMDg3fwWwg
-+pYzrvK/S6f5h6TS8y9zKxCJwTdfC7f4KT6EjxQFhgHCm8oFupOLSEZKF0UmLMeOA
-+J504ZnGdhEG5p9AqQNBlyBsGGmSyQkSJg1BPB6U7wFBSwrXS+3b2ph4J5RivH68O
-+CKjR7yWl7M75LOa1dt133GmhPUUGHLsjHTnuCDVB0eHcgboonKTjCSAmckNKm/uw
-+tAUMkO3puty5JM38b8AwFRDXLnlWdSsNr9j243SHOfKyFWidjwglRpVGBhoECtA=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-20-cert.pem b/test/fixtures/x=
509-escaping/alt-20-cert.pem
-new file mode 100644
-index 0000000000..eca176f2df
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-20-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE4jCCAsqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+MTAvMC0GA1UdEQQmMCSkIjAgMQswCQYDVQQGEwJERTERMA8GA1UEBwwIQmVybGlu
-+DQowDQYJKoZIhvcNAQELBQADggIBAKvkEHjR6lk0AlKiC7oltE+gp7SpVHdKs7I4
-+zswnbZ1EcddA9D6hjemU+nIUriLkt8BxY+KxNtkwDm5mvXZn5E4XDXzRDsCdNZXE
-+qx9og9LhkhfGbPJ1LPutQ0VmqPwY17mRUeaLhNIwOmD7g++oVHYmZWqA8tHVB9f+
-+gP5Ni2x/PX772Vt/hIpI14VoYIsMFs4Ewjc0Gc02DvOdsDT9eUmAo6GNOAbxeRS/
-+D2D0w6CQhwJ+cemcAo0lGw8KemCYfqzL+MQd8wUGPsiZgm5wQACOp+ImL4guy2gX
-+h60W9Gtxu77jsjF7n0n4LlInylrZAgw09CkehUfF4+cP2kZDTcsuqOoCVYATAGxa
-+49ZvuRHoo5Ine5PcfuARS09LmxgI0fdsjaRvRELYIRWHTvE+zCLlNkxkpwXULgZZ
-+bpJ08L52P+jz+HJPeiHZnYKXgtXyGLpwG1danS600tqiMmDh0G9Ss+UzwhS+jhN5
-+viIvpmns0zvI1Z1IWPw3y27pw7rmLVcFMbEZFK5mwHiT10iRrT4sxihWIT+sn6n5
-+5baup/od4kSJABQy9LAuhhuZHyCfxC2yPYz70sP8qGVtY+rA3LNe0ns6pY1L77DR
-+QIRD/Mm2hql91+U222mxikdT4WQEheh2cLwdg/T1uo/SQDruliNZncdNbTGDmnhc
-+cg1mw5tk
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-21-cert.pem b/test/fixtures/x=
509-escaping/alt-21-cert.pem
-new file mode 100644
-index 0000000000..16d5e7265b
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-21-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE9DCCAtygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+QzBBMD8GA1UdEQQ4MDakNDAyMQswCQYDVQQGEwJERTEjMCEGA1UEBwwaQmVybGlu
-+L0NOPWdvb2QuZXhhbXBsZS5jb20wDQYJKoZIhvcNAQELBQADggIBAHdccJEkqezS
-+GSNNVIWv9XffNTrZnejms90h66UDC4O9shHMy0aNWgmGuu7uFi1BK4sTciXT+ZR5
-+3+1ni3WKMhJ5Iu1aNlNeXULOlmuHKVJKrAj8BR7lflSFqj/MHnw22HU+BTmddZPj
-+F/OCl2W+O+eUNBTTmYI2+pZgmyyU9v8qEwLZn57qlpAJa4gpnSRYQS1xfSaUgAcM
-+xtZM/AE4F9mDFOdO86/RxXsYRyT0+sOGmaoJrlTWoKduoI7fhzQAIGHnhn9yBT60
-+0K6LmCR2dXRyLxxVTy0Laiz487IXpQTJ8jo6c0wT6SeiQBlE0W3FTH3IM8Shzd7b
-+5tbix0bCR1pUT2Q46oaB4xkEweKNGKS46kIps6mpTav3TMhNDVyalUfF4fOu4FQu
-+RLB6B/I1TI1KHiTeD9xfNInBAdO9ewjWQ9spFei3EExZmvnnWKZIA82mjG/9Wcdh
-+HFK/uEylzo1Nsxujv2V6ueMYc0pF4XH2U1Azjxb0+pWUZhoy537Nlf8b+PO/GSG8
-+del0yPwf6JP5AZdXfiV8vNqwEGCC/BEIPrbZ6Zz1q6lT+7GZAGkzbMYlfkzA1lXh
-+JteRIracA38WfQOHf3FOPYvTBOPlVHWB+tJbwlalYQqCPupMaaxxizCLPIsNvqdy
-+TAtC5Jbx6N1DdeyHpRuKRUe1M926oKTp
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-22-cert.pem b/test/fixtures/x=
509-escaping/alt-22-cert.pem
-new file mode 100644
-index 0000000000..5f89b00dfd
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-22-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIEyTCCArGgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+GDAWMBQGA1UdEQQNMAuICSqGSIb3DQEBCzANBgkqhkiG9w0BAQsFAAOCAgEAE8vG
-+nLYo/G+3Cuzir4toX726vLOkCEqZrkRE18dc3px/CgmEI/6+4lWjp3u/9MxER+kT
-+t5o5Xin+vmg5F+hocR16mMeX6pjD6tXJ+uzDacTxDgRBFdbqX4x8Fjiig0FXsr3H
-+jFBY2c4UcKszFlCTqjH1/RfwLYJPU6Q1WZM+1iJotSKnhK7y4A/3jho7sL0PPuMG
-+WEoxbTBmpAf+jPT+LRe2MY++VnVJHjlPba+S4Y9PHOzizQuIJs7YnhNIqA9So7Iv
-+eA7Lp8GID+w/eY4DEq4z6CIuCplKZTrrWH0kQbG1sV4J5+W+JL0DOXDk91JwkOPH
-+rWf6aOb3akFRk5Z/PrrcTAlqtApPQF4uGycQBo8KgcatZyP/3HZZHyyxhEjF9sw/
-+STHm93GlCIwocJ+SkwjBmdupv6Yk8fRmA7LinjVvi7EnQQ7qcRE3oUCPPReDD96G
-+TuDsGkQbv5WQSh+0mBAiTFze3C6FSNcldQBrlWReqOj6pVWtUN49lpYOJ2XfLCQe
-+RjS7IUYNn7Ku3xXi2etgNzmJXcSnNXZkh+3henpFqkwEFJ5b5RgOHXULTwoqo9KS
-+YMs3eKHp62J6l0pQD+wTGUyVU8cJghJ0hR1WnNR7o32Bos2dfBmIQgET4ZH/P2+H
-+A2gtbJO5mRsTvuD+kZut1jxJvUzuO0yZoNpuUVQ=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-23-cert.pem b/test/fixtures/x=
509-escaping/alt-23-cert.pem
-new file mode 100644
-index 0000000000..5cd6795cde
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-23-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIExTCCAq2gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+FDASMBAGA1UdEQQJMAeIBSvODwwiMA0GCSqGSIb3DQEBCwUAA4ICAQBps3VQshvW
-+9HDR2oDXSldWNW2SWksa+9npI4IEMDusiDbLdR0VBphw2R3iUuJ4IAPDc1s/SMi0
-+1t1o92lC5zVeTq9LvOOC1KxwbZXDubFDmdsuJ/DYPDkaRoDqoH7eFsJuIyD/TKqm
-+HXPYmWmjUNv51SSLTTqPRz2TmLQVA1Iw7J7H3fz2LExsAtczx6gRZJPIZGdMx6do
-+E67SUp/2RPYtkEmmCELOxCAh/Pzm6pBPncI86AMTNwppl+FpqaH0LPrqMre40tTt
-+cQq/0XrMWRoWsS3VU8uor+aGTnNp5VT3ZLVmXZNyG7nISW7ERaGCeTZJRcqwjeH/
-+yPxhQc7IpYCm5x+HN2sDuvVC7l/q1A7+CbO3jNR5Gb7aEEyGiKb5ZkElbsulfwom
-+JOg1K8+SBDGrErEf0MDCenKY2g0lhpKGBwu6O+RVmKbhlHEjt2/31/NCSBMLopdU
-+AmCNoBo3+KaRljo1lVf7tWbffNRCqsbPZPHtq9uXs0DliJTUroaJ584h92VrSLJB
-+SdAUVLAwzmwu2Pa4bp0STv5tJy1hFNJdVFQ4rgAfaFudXy41K9zqrDCB7RbzX7Yi
-+97TCDu/phzkoFpOZabqTrvcP13N0wfDeOx4Y9nx77aeqTAaQ0ooTG9IWrHmjuUKF
-+wpEXQBfkuXug5+xq/hlCllkPj67cIaldDQ=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-24-cert.pem b/test/fixtures/x=
509-escaping/alt-24-cert.pem
-new file mode 100644
-index 0000000000..2a858dd39a
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-24-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE1DCCArygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+IzAhMB8GA1UdEQQYMBagFAYIKwYBBQUHCAWgCAwGYWJjMTIzMA0GCSqGSIb3DQEB
-+CwUAA4ICAQCKRaPaQO4+oztra70h3g1qwmJurQ1vGBdcXh27nf9epFAwhU1zL5v7
-+7wN7iclY15BX3w3WrZ+ag74AvQLG6WQkDY1JCmidEjjt2bmVTxIus0H9Bb2AlUEw
-+BtVYMJrr+fiWbfSwRxhMQa9BQ6ZcUA7EluYQFApo2m7GIcMc4x51L/bwzmsXYj4t
-+2tjnkU7clL+7GR/w/+ZB7nIe80j7wYvIbOfMS3Yxh+uu0aQCNdoh9Tsdtu1jtmJv
-+4lJ5aZIDABE/XIFVkWRyHv2ou14J/LXUKE3HPEhSKWu7GShrdTeS+gZpOixM+uPG
-+ieHah1GfJMS69P82Z72Cr7XWpQY0NKwMB+ePhTzz1LMBHQ5ySXQCViQRClRMc5K+
-+cXZm8cs6oe4IEhMcf3kc/9xblgRWqxX7vsb6Gcrn1eXsfxco17S1yNBzTt75ybt9
-+kvPmrWqpg+sQ0r4473DjEASoSCPwlzCpd7AHOw+XxSwsOUNXkEnXMa2v2VHBjx06
-+QnrLenB/n7EQ5Vo9JLDMLM6ie4gfehHxfdyoBg21jN9eUPpKGnjARVvyfDWV+7rI
-+ZHU7wc2iMnqroAqm9FZ0YBqZ/eI8M4ZAYSvDKnGZQlUWfhdNDhI4FsHBPymMFtjW
-+ln5eFUNLMoitMGs12Ib+omr9WSTxRj97GvRkRTNK5Gxmo9Mi/Pkxng=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-25-cert.pem b/test/fixtures/x=
509-escaping/alt-25-cert.pem
-new file mode 100644
-index 0000000000..695b8ebba8
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-25-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE6jCCAtKgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+OTA3MDUGA1UdEQQuMCygKgYIKwYBBQUHCAWgHgwcYWJjMTIzLCBETlM6Z29vZC5l
-+eGFtcGxlLmNvbTANBgkqhkiG9w0BAQsFAAOCAgEAIgp7IrYYdLCoUqg7E4igLD3u
-+C68B896uoeenMmTKDfCzvB5svYKZlfIi3njJUZ2G6kgBNcSd/mwQ2ggex9AEUiGp
-+uaT7Dpev3RpwtCz5zpOZxN+B0LJk4hPzzE4sjJFrmHRgJVzADL5RdcEF7+GV81nP
-+X/cXviffkxSihAFALArAaOA6/hBoT6unvlDsY3cxgZWFl3ao76vTQFLs7ZNHYbHe
-+WDkkNpheWmNlOrVTEz0vjNCQz5wYOM6HJ0O3cxzR/6+OnhPQagZRCWApPopYGuxc
-+kXHAPbEkXpVzJTrNgHIvZ3l3JdJSHsh+DdGVz1NY4bogQNKCVa3xt+zLpUrr34XM
-+61Z91MekMijfjOsy7LGLSBdCPCZ00enXPkflDEhv1kRlbo/ZdYGHynzl6Xzu1A5B
-+nuwDbpsCzR6ij8fZDXGUS7F8Iemdfag4XTtrXnVXLgPpD/FMzJUx4kCIAjgh2MaP
-+0nUvZDVYt+GKGohCNDrSt2ByFtbYGaX5GeMIp8zW+GT8KUW/K7pp9PjsmzG6vvQd
-+kqxB45ddf87E8NoDWh/ptdj3pjfbDc5A1SeXKGXrt1TwgWHtUNW0zF8qOuG+PZ1P
-+u10lUx4gayyF3unaSLZwYu8nYq5C7mC9DjjnbjLhsh0VOIEEh+Q8vJH8OvZFkyti
-+l2ADXC+6evQTvqLwXi8=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-26-cert.pem b/test/fixtures/x=
509-escaping/alt-26-cert.pem
-new file mode 100644
-index 0000000000..1204d95a8a
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-26-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE5TCCAs2gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+NDAyMDAGA1UdEQQpMCegJQYIKwYBBQUHCAWgGQwXZ29vZC5leGFtcGxlLmNvbQBh
-+YmMxMjMwDQYJKoZIhvcNAQELBQADggIBAKmgEHc9b/bscpyO5mTKrITyoYtbhz/P
-+0Uz2Uc4tKokUI9EBuuD/XX4EjtVzne9mssAAs9EhBSFmNhDjpAUYh9n2cFvAJQit
-+4d9EbaNbB3SuzG5onu8ZBtfLsABr5L5tQspO3tinamSM2ZuRo4dvcQ2a38C38LAQ
-+HBnvZ744Th3LckPMLTWNChe3E2jAt8Av0XA2yVJ/B+EeEaqSYDALKhI49CLeq96L
-+m/Vq/mqADborW51pMNFn7CAF1jxizQNHy6K0E95ziq8q/OL7j4+j8Erh4x7bcjrQ
-+X04Z+hrA9q5AjG++ieztKqGuGxHeSclqBhOdnU0UI528Vn0OXRxeMmbqMF+qhx17
-+nHuxxs4z5CIdTwHA6LgMUpDxcOhdUctIj32gwZM3UHI8lmdRTWn13y/Ht6CpIXCL
-+1ohSXne5y34z4AKeJQpdUfwQD552Ui8B+bhH1JBm5phjLn1fboXCYiCgnPQ+SJzx
-+3hsIv7Fji7lfk1UPkr0s7Ze8b/seYS8nVB5rg4qXEwFDMo9zsjCEIyg0tKwj5Ani
-+HlYzqjjsIK50TPjXYOA9J+NHcBDCDa3r8TBtRGtQqOXQGzvWTqAyT8Uwn7jimmh+
-+EGDr4PJSTJxv43EYL+of0sRHkOhnfFfJYF9vQLT+wD6l+6T1xNPE/gjX8DyQS9a3
-+zOgdOiTp0AKH
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-27-cert.pem b/test/fixtures/x=
509-escaping/alt-27-cert.pem
-new file mode 100644
-index 0000000000..268abdd300
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-27-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE0TCCArmgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+IDAeMBwGA1UdEQQVMBOgEQYFK84PDCKgCAwGYWJjMTIzMA0GCSqGSIb3DQEBCwUA
-+A4ICAQBtXT+t0fuBRClJdY6y01k1jqcsXEkmKOr4czznuiloGVEjpbjmxzxsgvzw
-+nz3od6Sx56SHG1xYbKDCapX9Ld2IDsPvpF2wdH2wpIS5DI7tQdBpLm7vr3vTYKwm
-+Wns+WKO5VBHDLCyuYvHNo37MJCAfBlr1ni7BCLOg3eycPiANJHPD2T9BnXlJm49K
-+166VMviuiLBEyO9tadhvQHGqCX3D4pW31zwsKHvS4wau15N4yt053Iac6eaysdTp
-+mspw5jX85tlQ9XxKNTftUVJU9Uzk2ll4A0Gvnq2FEjiqf6m3tye2nsqDI3C81Dwb
-+Y/+AeO7ZsVyLpIstfUBFmpLGPUoZ5MNmgrboGf8K8dPPgVbmbS0msrsI4LWSQb8P
-+R2hzj0F7bFvgbZad7rFXJW9FQOqTwvJrZBkkDpZpeNbhah14avV2Ftrc5+PtVfP0
-+jB1L3nhc5KGpGL4xqE19K+GVR/KBREgiFD7B7NYUOPt9NjFTrbbC3XA8L0MC7PNh
-+ySDN/NCiIF9K9MtpC8BYuNBlRt5C82L37qPY4Tw3z9sCyXK5oOQ4xdbdDEWdwzc5
-+F2S4zfQiB7y+C9RigOyGPChxBqDK/bCExrG1S2b95oP4QMuaL55iXnaG9ME8sCoa
-+cUd62cMPk7piQW29oFiQPYsStfo09u9JXbalKhol9oPrDtQfrQ=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-28-cert.pem b/test/fixtures/x=
509-escaping/alt-28-cert.pem
-new file mode 100644
-index 0000000000..147fba3aff
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-28-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE1DCCArygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+IzAhMB8GA1UdEQQYMBagFAYIKwYBBQUHCAegCBYGYWJjMTIzMA0GCSqGSIb3DQEB
-+CwUAA4ICAQA2KjgKCSLg/rDajrBTtVIu14rAP1pMwFZWrxcpTbN+fOs2dYQXZf7d
-+/GaozSMSchjPAJ8lTFfEB20Mur/E284LlQPuQKqHHn3gIh92VkHHBHjj0ohnfigg
-+eBHNMUisuGyNzKV7VI1+iwCoPBZC7ptbE4X08osVxxRESj+IT0TwtKDONTIIeogW
-+6VhsKTQ1HM6AMbhVe0Led/ENxFFMquB25GG/hVB4ZzPmsJZzNdZYNNMa34kNcMN3
-+5OFcxWV/4Hc77JYsqM9fE9gBaKC9pQE0XwIrOMQSaGYx+GO8Ty33YlM+oYBt6TMH
-+/9oU8HVvEYW9GAyptNbXPOwyv/wikNBsJyDGfvuDoiTZ9iMFb/bEoWHSK/rYmAgk
-+D272zxiPS3YgaZkvhlYZ+60w5CCgXoN5L0Zq9yAOTv92/VHFnMPrTP7zfD+4eUHY
-+lg+A7pOCIUK4cIDUXQefn1dU5/8DHJ8aM+KQDBfkKOH3me3GzIKjtKQjhwYFiJ8L
-+vD4V6+nq90GasShQDKUbMVbCxfyqlvrXOP0an+FxdknadnD5hRT3UsU9SRxAdkXi
-+3er2sXpuULYqOst55Ahnj7D5uDN4KBoatZwFd1iw0CVPoox7ixZ2zOAkwVqzaEAq
-+0yWyIlELm9/FdF78fu6LPrFKI1H4MH+0TQrF4MiyJWPvET7t8WKJsA=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-29-cert.pem b/test/fixtures/x=
509-escaping/alt-29-cert.pem
-new file mode 100644
-index 0000000000..434bda3e8e
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-29-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE1DCCArygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+IzAhMB8GA1UdEQQYMBagFAYIKwYBBQUHCAegCAwGYWJjMTIzMA0GCSqGSIb3DQEB
-+CwUAA4ICAQCIFfHE09aftJrS629ZBBRKjRiVcxN0/FjeEHWbnb+3Re/LoU/Y64BT
-+LmjMBB6wik3JxxUtLs2UYExQKfz3zmB+O99lR94of3V3RXPCe9Dz8C12iohYBvVO
-+q+WzXyg8g4zoIndn9+ByR+JJsuk+WVTZd50wRaRvssUB5yhpLaFdZpnLUBdV5J2d
-+shmefZxr0NgMb9p75wvWgZ2BiZQDeTR93+PWaZTMdSxZh6ynfG//5sxxw5fLm3pv
-+eVo3oQQ8px9j8G83ouiDZJn7XZgNfXYNq7wo3yaqXX0zlCE00K6tXGI6FkKJnVdQ
-+si+JYfGjzTM39JqFU9YYOOc3Gfw20iKIEQ0jnE0Z+z9Pv2GAel0UNdovluttxu9R
-+CJcPJOLS+TMd/sAwCAELvhPpeWsDLhfd+lG7ofE/nM6hzec6apWYyCqqlYIdE8WK
-+rtHXBIMGk/5Eo+2KDGQHgpMs/P8fNUL6FBx/i1pjm5nSHveDQryepEmOJq9NJCBW
-+1AJhE4jCXMv+43Fnr1OSATNiOd+1KfQ7KC5PFkpZLY4GDFZcbLBKYj1TWx4WzRnm
-+EW7cC/00Z3Cd76L5i+y1Xr44nbQcAMw6TlT6vvZjFCbCO+ZDUJSZBZMpWwBI/gAf
-+MNzYPltOGm+GZUuxib2MSF9Qy8c9NegENmsK+zyPT3N9mUHCl9nknA=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-3-cert.pem b/test/fixtures/x5=
09-escaping/alt-3-cert.pem
-new file mode 100644
-index 0000000000..59185b64a4
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-3-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE1jCCAr6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+JTAjMCEGA1UdEQQaMBiGFmh0dHA6Ly9leGFtcGxlLmNvbS9hLGIwDQYJKoZIhvcN
-+AQELBQADggIBAEKwv45Zp5xJEGENPrOIwrGmuBDMtBPmXtSKydKSNUgrv08u4dHL
-+n295L7jIwQ3SnRjS8PrZWD8RQ46hgFRY9pqk1uTys4jB7lki0eAUBC7oPn7q0GUv
-+ojdSwOEjp5bfXyuRv7Z+3y2gD8pcCZsqcCjF5Svim6Q3pXMLRKQFhzhzL9k/gsNF
-+lJ8KcLBECJSm5nUrZIRHPdIGYmWJG+t8CfS3E6OIyHILK1xCc1MasEpmYVoY9uzT
-+2W2z+3pvwQqfdXO+lEOsT9dnjM/WbnkQMTWAn+++YFtkvA4kON4b/cp9imnXok02
-+vq7MCbN+b5CJXIhKMC5eNA36ez5hou0MUmnsNo9ai1gVJXRoL67YgUh1yMfcAaSM
-+Sfy3UBF++Az/yQo4AWtqWk4KPePdcsrYo9Fke1inUl+M12gkdIz+efbElHMqehbt
-+lunbyFI/7CY6/Tno+T1cDkQlTouHK8Ddb1cPhkJbE4euRuLGdtn2AcFSemYGtib0
-+ffuhnEBF8M8enPVyLjYA/3sELkmmaHMtgDTm0+XYQJtjIbvGcY7+bftPZgbXPVGv
-+7+tiYjwarIexXN5yzMasgFI5+7qLSQJHcmwrzOm8K+Bzx34f20vwR4M2FJ6cqUeN
-+qzdN1HSNp8aYNilaFa3+hfGRG9CZnVP8up8BwYx736EMu0G3yAp6UqqJ
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-30-cert.pem b/test/fixtures/x=
509-escaping/alt-30-cert.pem
-new file mode 100644
-index 0000000000..1b67d1f782
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-30-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE1TCCAr2gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+JDAiMCAGA1UdEQQZMBegFQYIKwYBBQUHCAegCRYHYWJjAGRlZjANBgkqhkiG9w0B
-+AQsFAAOCAgEAgG06c7GRpPohHa1X/YQVQGWa/J/f3qok3cu1nrD2H5Dkw1eAVPcQ
-+lsng08lOxwSI0OgqJw0jl+ljLKuhHI3U68KbFmUO3Jw7uLDk1+UniRSNkfxVOrlc
-+7YTlmsxiDgQdX6/TAHu6bERx147NqVzB4/I6qpX7ouLv4E7xdQgjKuvhWlJ+Fg/0
-+pQ7EleQymRN6Y8qO6RwEWYao5pypg8/22cE3jgXleLM+5qWHqJs2ZewPQf7uo4Bf
-+IwSUV5H0weftiSN+kOLYiNfUago108VHuk5sCIKr92q4WAJgA5C6ylcUWaJCKbCv
-+HQYR/QG10Mrn4JCzzni90aBHrQoYQ8msEDH1QKyMJiNz6XXzwBP6bvgPlB2f7nPW
-+ERpH45M2I4Z3dZYFw8bF7CcOIUuR0/Zu2WN22IhqhjVQSZPzdRWJt5Rr1mFUz+Nv
-+Ymdi0w68KyRUiuOpKNLczDDnYpc9EqGBprnMOxALS4mQn1ySBXbZAXnTTdEzN5fM
-+L4CXWUzIBVKv56Mn5YskhbCd+N8GV9Nj/A6dBwa004CQxbgAj+ndNWc7+h4iSNlz
-+9VPHK2Kju6j4fVpe10jzSoEs0nnrsPy5Lxa6C4KhXBBJ3cPl6wWNe2mgbEqG9Pq2
-+KrCizuFkIfZTAeSrR+prZXLw6cjmKPPEtNbK2JbteL2SEDT/3AjmmZE=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-4-cert.pem b/test/fixtures/x5=
09-escaping/alt-4-cert.pem
-new file mode 100644
-index 0000000000..086af8e02e
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-4-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE2DCCAsCgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+JzAlMCMGA1UdEQQcMBqGGGh0dHA6Ly9leGFtcGxlLmNvbS9hJTJDYjANBgkqhkiG
-+9w0BAQsFAAOCAgEAPu7ubyZw1rOQJhFX6nBHyCYaBzaKxRZOHOFCjMrD/YQXPUNM
-+Hs+8ChOeQ4M82jTyiP7XgF8EumDcckDIlIYvGXGrCB/6VcCVL1vPPtzjSaiF3PlG
-+/dh0OlPvevr5Ajz7ZtFFwxeQ2EfsHiry8qnlDJSEjrh4Trcx9YzdkSZz8DaoODXz
-+ctR/p1JEnQ6h/Axa6hdqTzbzTsINN7gD5Wi3ObfQbK6Ug/CuH6Zr8bdTsmeGcnD0
-+fqHptuLVNcROykneYziXDzcqGwrZnYaOF54a4ibV/OfrBcgEKeDwsCrLs3nztSC4
-+whV7DXZwaLl2KWl4/suBNI1cIKbxII1xTFLTog+UYz0zSZGPrtbt7zrlM4yG033t
-+h9xIGUKebaNpQYkoxOc/+kKhbKCeL3klfxJoX+6Gf8DkTP7byX2HovfWV1rJbh57
-+YZ04Bh69VmyxE4iyb1tAh5xh1bArCR9m96eXS/0KIZbykxltQGyHf1jpWw/4Wi3n
-+oadkpMcyNX76M1xBJ5u03JL8+LWrXuzf/ScWdmPUWulAEhbo4fn4oRwP2C3l0vVQ
-+iL482cIq1zF91lssRwQ17k38phulRdm+7W65/VI7hLoG6lXiSiHLH8e39hHO8Jey
-+Z+BBvn8x+aFgIvpBK/MX35s0gSrl/UiIZPU9glnktSsX5D+aaQynbuvbOW8=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-5-cert.pem b/test/fixtures/x5=
09-escaping/alt-5-cert.pem
-new file mode 100644
-index 0000000000..04a918008c
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-5-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE6jCCAtKgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+OTA3MDUGA1UdEQQuMCyGKmh0dHA6Ly9leGFtcGxlLmNvbS9hLCBETlM6Z29vZC5l
-+eGFtcGxlLmNvbTANBgkqhkiG9w0BAQsFAAOCAgEANAyZnL8f81Aax/0Rhw3CCdcQ
-+SXF3dpAolObQB8rlirRZ7yOY1v3Poj411aV0x9zM6mjOJZwarUTL7kbO7odQxGhB
-+x7O0DvUoG15VTvs0XLNHTPgnXtNjKOZ7XXVMzb46APfYSqdzMqhRWfy+Iaikp494
-+urtqkVt05q2amzq7EXbXI8JQWhkJkhjBTowfZnpZUw4JeeqMNRZT9Ldv2XDZjaYS
-+lkHOLzTmSmm2mf1oxhKGcRCgUCr/pzVUfDA3RBz25a6PWAQt4b2r8k5jydWyOeCZ
-++sjacoK5/E1PcdaOFJAjuAfbRMeK/gz2+yJwaB39Yh77t/9vQC0G6aiAmO0HxjJE
-+L6Lb8BG/QNYBS7gGhzKFVXVVv5yXRioO9vMv0i8uxShqD2Lo/MbrNtRgi3eMFESd
-+3NxUPXS1jMq2/SaXrENdKqNNi06LbnLaYpI3BLZ/Katq0V9ESlhcC2nT5uNBPiLr
-+DNSekaIGobbTDkuV896L7jqsQpU+sgs4XqaISGgk2wAfnwbfpeiBCL8oH9yCYAO0
-+1YlevrMGjBNvhysoABv7qaorqeL97ffRhjOZ72/fm2axD5l9MvWEFIf7L5uOah0f
-+hF5vScQYgyWNuK8wjzT2tl0CuxvEyI7N4fkUEk+ZMkyI1Obx17p+d4SFyuq7wTXR
-+05oWMsCMDyzxvFDv92w=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-6-cert.pem b/test/fixtures/x5=
09-escaping/alt-6-cert.pem
-new file mode 100644
-index 0000000000..6643519957
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-6-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIEyzCCArOgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+GjAYMBYGA1UdEQQPMA2CC2V45G1wbGUuY29tMA0GCSqGSIb3DQEBCwUAA4ICAQBB
-+lBfIjUH7/PbpC00TWTOSR6sAzyBr681lSxYAgFLduDdfR/bTkI1p7txIAgennoUq
-++9slIIMaR799BUtQDfAQRYdbsWiG/+5Lj3JXs33LPPTdW1C97LOPlnnbRJh1sjbi
-+UfGdxvdPA6iuyWhfwPZd+4IrcN+kefkvEnRkvDMGwmfmKQDjbu2mSIAIe+ECyLLu
-+wdSI2sPBSUKQEKk+dABYq9TcdxlA+OSPjgs5ZF3NK3s/or7ay2r/i8be5TswY4Up
-+IwByEk+7AST6ijwi3P8EN0HAyyuOfpBelWZCQgdEGt40Mpa58AwBGqdrCZ5wDAz5
-+nBx6GscZUsqG9sVM71Tgq7Bc1b69FXUYAhmFucnXizHv1Ys0oGQVza1tkKbaLEFQ
-+WvXWc7zW/0hTzvmtogKn/oM6GoNcQiW8KCwaCJq1TTv7Tip9znfB496tDruOr+2w
-+HoqZTJ7ERklz0mlZ38ISTuaz+Qkn1KjBYh4tgP/wZIjIyppAaAr+JdqXzBejfb4M
-+6x0S1AG9QgvyR1xDv3Vljjkh3m55kktTWSOfjS6aSzomaAyVAgi/vhHkxhsoBhgQ
-+41+ffkhM9ps9wkmguwqOXsByQAZUQEJQigO39qYuGuJEDV8Bu8i/T5BuuJWP4BRF
-+X+now5ObP73ufyFwYGsSgblivHUX4z/zAt4kp4AMXw=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-7-cert.pem b/test/fixtures/x5=
09-escaping/alt-7-cert.pem
-new file mode 100644
-index 0000000000..6c0f287a1b
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-7-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE0jCCArqgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+ITAfMB0GA1UdEQQWMBSCEiJldmlsLmV4YW1wbGUuY29tIjANBgkqhkiG9w0BAQsF
-+AAOCAgEAKmYr4QEnNq1Sy9lYePNRR60jufFXk44bczNT/wA6kvXKgv472V9wltVb
-+yJVvYUWkTO8ahlELNLfqRcuih6myV64WJoewog8mwby0lBYr6bAz86DdeN/B9rFD
-+OYnev1Ux4um45l42XP8acgJCoqn8+EE+H4AeMrz2xxHt+IDy4vUOowZna82f1Pcp
-+O+vhod2uXlukfnhofVK4lMHl4++4kECkmUYl8U+L/zXwzOb4S3Yksffmadgo7ERk
-+rJYLMLztvCk6TtP+p4NcvrE90dmss7R8hfw3asfjXsRbAMigdfSMKzGB2IHoHeV6
-+fpmJy6kotfwulDrbr2QtrWOYdMrm1wT6ohT355KZQxcZr3VcK9gqEjcYafqIsXtA
-+wYAaorKXaz7UkmFCDbk/24UuHgNgCl4KkGsFNwW6whTMpb9WnvPR7F798tiIbOL+
-+FK6yA1q3Z2500lmloQWcUFBX48DViG3bsTJ9wmQ28aPqHVd5gTmTm/7W2iRGx36N
-+PmbAk17J/bUzUSORgrPi2FLNNFg64x40pfdAyrF9ZBNcsVCFCUgOQHgMh4OjX/n7
-+khmNbMYiOvJEoUbZ9flNr4AYY3ucpxQ2peTl4DNsVZZ8Xyh96h3URu63Ji9+xLrQ
-+jSUtNHUCJaC3E9yTaIDc8jMli9s5/ElDZRkPxRP8o4VOt9KcLvU=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-8-cert.pem b/test/fixtures/x5=
09-escaping/alt-8-cert.pem
-new file mode 100644
-index 0000000000..201b520f8b
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-8-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIExDCCAqygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+EzARMA8GA1UdEQQIMAaHBAgICAgwDQYJKoZIhvcNAQELBQADggIBAHfvavrzBLuS
-+MMJwNkJGVt1W856zeZ6NZJ5vx2ZXziYxAkzw9N0pLHwgfzS8pXEPSZ6vMoeYMaH0
-+zr/S5tHSMGEwOp/dIoxE4Hm1uMzugHFxNp34hvqsaDbwKMpQQzEPhN1QvAkD9IXL
-+H2wOLqm+ZaTkT3OvOyJoml56wyUJ0nU746RuXgJHTFiWsUTPqT9bvofedC80MUyH
-+MX2lA1oy8nzJa9h7JqsxOE4uccRhpCRf+PxeYvOdsUxyDWw8+rjwe4Ulr0yVjwnD
-+x9ha/fTl96mYXyJGLtQvZmkllrctxcs0o82+wMZWBw4iPH/VnI7dj36b2uIHdrrf
-+cVurEPcVE03zLwukjQPZh9otleTwmQI1wqg/Gm2OahXy/0f0fpBDQnPycczn8nFw
-+nj6avmHubWVvzmEoKmOtavGEAbUn7ntQfsvM5JpiM+ck3MDMP9i9cMZvWKH8Eial
-+ZnYcXkgAatWwp4Cbsv4H7LMNisKjrcY+r+MpaYYIpTRNp/s/P5bMCIVt07yosePg
-+m9VWy03+hQJmD4/THeJsjuczPSBtsoJiKoTJ5TndmpFaG6J6lBVvpXJhoiW/QIgX
-+u2QIb8Z6bRK/eQ8UVYm0/ZQLN+OOzYiQfm0AFbFpYhl46o6QNZ03P6GRLshv+N3E
-+CX66ucPLd4QJitUy39LZjMlC0YxTZUry
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/alt-9-cert.pem b/test/fixtures/x5=
09-escaping/alt-9-cert.pem
-new file mode 100644
-index 0000000000..660e65b8ed
---- /dev/null
-+++ b/test/fixtures/x509-escaping/alt-9-cert.pem
-@@ -0,0 +1,28 @@
-+-----BEGIN CERTIFICATE-----
-+MIIExDCCAqygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+EzARMA8GA1UdEQQIMAaHBAgIBAQwDQYJKoZIhvcNAQELBQADggIBAIefUJjnOtt8
-+viFkr3lupabUMwSgtBXVCp+M9xhKqcSnYReSgg/LcqVDaXmU4s23n0Bc0M51HQMG
-+puTpfr34ZUSQiLup9huELm5L+lcpYANJsKrBo+vz1w+fkPlcxXvXHpLzgb393XSJ
-+/Prn7lNBrrh9b74azUEhz1KPmFbbMs7IwlhE1+stQ107VeSGvKlAOmaYdnVG1PXl
-+AG7KJynpE5Ex8XF1ONQLneTdvo8gXZueb07SY+my5wrCQhSlh4/6Y2MnE9h+9ugx
-+BfdU72okDaYRH1MAfFeAsUE7Y52cQqm26b7nBz0+IeP+uk7oqDLF+PGHfjeUGXGW
-+aGFfaLk8Dl2gMg1DsRE8zcT215Dl4rqOtwbhW8kX7XzYE0sA7cnyZ0daLrrtxwe6
-+MhrAOjYklRZpwUvy6E2IyipKwWSuKHLUk3mVxPrxVqvye2enZWW1PJeHNdL//Ogx
-+5Mm++BOTNR+61pg/UrATlO3GMK6ggAfkP8H1r3jp24hc/TkXRkoUuWZqtjC5+qwB
-+KVIPlr+/0zIhzDjNbN0TMgqv/Yz4/wCUjsmCPJu21C3+BP2O5ZD2e4hYe/X9kuhC
-+YGWTf8dpq0LgYgVHqwXo0gCU/Ich9KtaJmCgZRUrzMl1aIYhqpuR2EW8H1bs3a0P
-+/7wXhGudHCwm6j2H5/tbsREeYInl3mv4
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/create-certs.js b/test/fixtures/x=
509-escaping/create-certs.js
-new file mode 100644
-index 0000000000..b84547e1d0
---- /dev/null
-+++ b/test/fixtures/x509-escaping/create-certs.js
-@@ -0,0 +1,502 @@
-+'use strict';
-+
-+const asn1 =3D require('asn1.js');
-+const crypto =3D require('crypto');
-+const { writeFileSync } =3D require('fs');
-+const rfc5280 =3D require('asn1.js-rfc5280');
-+const BN =3D asn1.bignum;
-+
-+const oid =3D {
-+  commonName: [2, 5, 4, 3],
-+  countryName: [2, 5, 4, 6],
-+  localityName: [2, 5, 4, 7],
-+  rsaEncryption: [1, 2, 840, 113549, 1, 1, 1],
-+  sha256WithRSAEncryption: [1, 2, 840, 113549, 1, 1, 11],
-+  xmppAddr: [1, 3, 6, 1, 5, 5, 7, 8, 5],
-+  srvName: [1, 3, 6, 1, 5, 5, 7, 8, 7],
-+  ocsp: [1, 3, 6, 1, 5, 5, 7, 48, 1],
-+  caIssuers: [1, 3, 6, 1, 5, 5, 7, 48, 2],
-+  privateUnrecognized: [1, 3, 9999, 12, 34]
-+};
-+
-+const digest =3D 'SHA256';
-+
-+const { privateKey, publicKey } =3D crypto.generateKeyPairSync('rsa', {
-+  modulusLength: 4096,
-+  publicKeyEncoding: {
-+    type: 'pkcs1',
-+    format: 'der'
-+  }
-+});
-+
-+writeFileSync('server-key.pem', privateKey.export({
-+  type: 'pkcs8',
-+  format: 'pem'
-+}));
-+
-+const now =3D Date.now();
-+const days =3D 3650;
-+
-+function utilType(name, fn) {
-+  return asn1.define(name, function() {
-+    this[fn]();
-+  });
-+}
-+
-+const Null_ =3D utilType('Null_', 'null_');
-+const null_ =3D Null_.encode('der');
-+
-+const IA5String =3D utilType('IA5String', 'ia5str');
-+const PrintableString =3D utilType('PrintableString', 'printstr');
-+const UTF8String =3D utilType('UTF8String', 'utf8str');
-+
-+const subjectCommonName =3D PrintableString.encode('evil.example.com', 'd=
er');
-+
-+const sans =3D [
-+  { type: 'dNSName', value: 'good.example.com, DNS:evil.example.com' },
-+  { type: 'uniformResourceIdentifier', value: 'http://example.com/' },
-+  { type: 'uniformResourceIdentifier', value: 'http://example.com/?a=3Db&=
c=3Dd' },
-+  { type: 'uniformResourceIdentifier', value: 'http://example.com/a,b' },
-+  { type: 'uniformResourceIdentifier', value: 'http://example.com/a%2Cb' =
},
-+  {
-+    type: 'uniformResourceIdentifier',
-+    value: 'http://example.com/a, DNS:good.example.com'
-+  },
-+  { type: 'dNSName', value: Buffer.from('ex=C3=A4mple.com', 'latin1') },
-+  { type: 'dNSName', value: '"evil.example.com"' },
-+  { type: 'iPAddress', value: Buffer.from('08080808', 'hex') },
-+  { type: 'iPAddress', value: Buffer.from('08080404', 'hex') },
-+  { type: 'iPAddress', value: Buffer.from('0008080404', 'hex') },
-+  { type: 'iPAddress', value: Buffer.from('000102030405', 'hex') },
-+  {
-+    type: 'iPAddress',
-+    value: Buffer.from('0a0b0c0d0e0f0000000000007a7b7c7d', 'hex')
-+  },
-+  { type: 'rfc822Name', value: 'foo@example.com' },
-+  { type: 'rfc822Name', value: 'foo@example.com, DNS:good.example.com' },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode('Hannover', 'der')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode('M=C3=BCnchen', 'der')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode('Berlin, DNS:good.example.com', 'der=
')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode('Berlin, DNS:good.example.com\0evil.=
example.com', 'der')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode(
-+              'Berlin, DNS:good.example.com\\\0evil.example.com', 'der')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode('Berlin\r\n', 'der')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'directoryName',
-+    value: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          {
-+            type: oid.countryName,
-+            value: PrintableString.encode('DE', 'der')
-+          }
-+        ],
-+        [
-+          {
-+            type: oid.localityName,
-+            value: UTF8String.encode('Berlin/CN=3Dgood.example.com', 'der=
')
-+          }
-+        ]
-+      ]
-+    }
-+  },
-+  {
-+    type: 'registeredID',
-+    value: oid.sha256WithRSAEncryption
-+  },
-+  {
-+    type: 'registeredID',
-+    value: oid.privateUnrecognized
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.xmppAddr,
-+      value: UTF8String.encode('abc123', 'der')
-+    }
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.xmppAddr,
-+      value: UTF8String.encode('abc123, DNS:good.example.com', 'der')
-+    }
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.xmppAddr,
-+      value: UTF8String.encode('good.example.com\0abc123', 'der')
-+    }
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.privateUnrecognized,
-+      value: UTF8String.encode('abc123', 'der')
-+    }
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.srvName,
-+      value: IA5String.encode('abc123', 'der')
-+    }
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.srvName,
-+      value: UTF8String.encode('abc123', 'der')
-+    }
-+  },
-+  {
-+    type: 'otherName',
-+    value: {
-+      'type-id': oid.srvName,
-+      value: IA5String.encode('abc\0def', 'der')
-+    }
-+  }
-+];
-+
-+for (let i =3D 0; i < sans.length; i++) {
-+  const san =3D sans[i];
-+
-+  const tbs =3D {
-+    version: 'v3',
-+    serialNumber: new BN('01', 16),
-+    signature: {
-+      algorithm: oid.sha256WithRSAEncryption,
-+      parameters: null_
-+    },
-+    issuer: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          { type: oid.commonName, value: subjectCommonName }
-+        ]
-+      ]
-+    },
-+    validity: {
-+      notBefore: { type: 'utcTime', value: now },
-+      notAfter: { type: 'utcTime', value: now + days * 86400000 }
-+    },
-+    subject: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          { type: oid.commonName, value: subjectCommonName }
-+        ]
-+      ]
-+    },
-+    subjectPublicKeyInfo: {
-+      algorithm: {
-+        algorithm: oid.rsaEncryption,
-+        parameters: null_
-+      },
-+      subjectPublicKey: {
-+        unused: 0,
-+        data: publicKey
-+      }
-+    },
-+    extensions: [
-+      {
-+        extnID: 'subjectAlternativeName',
-+        critical: false,
-+        extnValue: [san]
-+      }
-+    ]
-+  };
-+
-+  // Self-sign the certificate.
-+  const tbsDer =3D rfc5280.TBSCertificate.encode(tbs, 'der');
-+  const signature =3D crypto.createSign(digest).update(tbsDer).sign(priva=
teKey);
-+
-+  // Construct the signed certificate.
-+  const cert =3D {
-+    tbsCertificate: tbs,
-+    signatureAlgorithm: {
-+      algorithm: oid.sha256WithRSAEncryption,
-+      parameters: null_
-+    },
-+    signature: {
-+      unused: 0,
-+      data: signature
-+    }
-+  };
-+
-+  // Store the signed certificate.
-+  const pem =3D rfc5280.Certificate.encode(cert, 'pem', {
-+    label: 'CERTIFICATE'
-+  });
-+  writeFileSync(`./alt-${i}-cert.pem`, `${pem}\n`);
-+}
-+
-+const infoAccessExtensions =3D [
-+  [
-+    {
-+      accessMethod: oid.ocsp,
-+      accessLocation: {
-+        type: 'uniformResourceIdentifier',
-+        value: 'http://good.example.com/\nOCSP - URI:http://evil.example.=
com/',
-+      },
-+    },
-+  ],
-+  [
-+    {
-+      accessMethod: oid.caIssuers,
-+      accessLocation: {
-+        type: 'uniformResourceIdentifier',
-+        value: 'http://ca.example.com/\nOCSP - URI:http://evil.example.co=
m',
-+      },
-+    },
-+    {
-+      accessMethod: oid.ocsp,
-+      accessLocation: {
-+        type: 'dNSName',
-+        value: 'good.example.com\nOCSP - URI:http://ca.nodejs.org/ca.cert=
',
-+      },
-+    },
-+  ],
-+  [
-+    {
-+      accessMethod: oid.privateUnrecognized,
-+      accessLocation: {
-+        type: 'uniformResourceIdentifier',
-+        value: 'http://ca.example.com/',
-+      },
-+    },
-+  ],
-+  [
-+    {
-+      accessMethod: oid.ocsp,
-+      accessLocation: {
-+        type: 'otherName',
-+        value: {
-+          'type-id': oid.xmppAddr,
-+          value: UTF8String.encode('good.example.com', 'der'),
-+        },
-+      },
-+    },
-+    {
-+      accessMethod: oid.ocsp,
-+      accessLocation: {
-+        type: 'otherName',
-+        value: {
-+          'type-id': oid.privateUnrecognized,
-+          value: UTF8String.encode('abc123', 'der')
-+        },
-+      },
-+    },
-+    {
-+      accessMethod: oid.ocsp,
-+      accessLocation: {
-+        type: 'otherName',
-+        value: {
-+          'type-id': oid.srvName,
-+          value: IA5String.encode('abc123', 'der')
-+        }
-+      }
-+    },
-+  ],
-+  [
-+    {
-+      accessMethod: oid.ocsp,
-+      accessLocation: {
-+        type: 'otherName',
-+        value: {
-+          'type-id': oid.xmppAddr,
-+          value: UTF8String.encode('good.example.com\0abc123', 'der'),
-+        },
-+      },
-+    },
-+  ],
-+];
-+
-+for (let i =3D 0; i < infoAccessExtensions.length; i++) {
-+  const infoAccess =3D infoAccessExtensions[i];
-+
-+  const tbs =3D {
-+    version: 'v3',
-+    serialNumber: new BN('01', 16),
-+    signature: {
-+      algorithm: oid.sha256WithRSAEncryption,
-+      parameters: null_
-+    },
-+    issuer: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          { type: oid.commonName, value: subjectCommonName }
-+        ]
-+      ]
-+    },
-+    validity: {
-+      notBefore: { type: 'utcTime', value: now },
-+      notAfter: { type: 'utcTime', value: now + days * 86400000 }
-+    },
-+    subject: {
-+      type: 'rdnSequence',
-+      value: [
-+        [
-+          { type: oid.commonName, value: subjectCommonName }
-+        ]
-+      ]
-+    },
-+    subjectPublicKeyInfo: {
-+      algorithm: {
-+        algorithm: oid.rsaEncryption,
-+        parameters: null_
-+      },
-+      subjectPublicKey: {
-+        unused: 0,
-+        data: publicKey
-+      }
-+    },
-+    extensions: [
-+      {
-+        extnID: 'authorityInformationAccess',
-+        critical: false,
-+        extnValue: infoAccess
-+      }
-+    ]
-+  };
-+
-+  // Self-sign the certificate.
-+  const tbsDer =3D rfc5280.TBSCertificate.encode(tbs, 'der');
-+  const signature =3D crypto.createSign(digest).update(tbsDer).sign(priva=
teKey);
-+
-+  // Construct the signed certificate.
-+  const cert =3D {
-+    tbsCertificate: tbs,
-+    signatureAlgorithm: {
-+      algorithm: oid.sha256WithRSAEncryption,
-+      parameters: null_
-+    },
-+    signature: {
-+      unused: 0,
-+      data: signature
-+    }
-+  };
-+
-+  // Store the signed certificate.
-+  const pem =3D rfc5280.Certificate.encode(cert, 'pem', {
-+    label: 'CERTIFICATE'
-+  });
-+  writeFileSync(`./info-${i}-cert.pem`, `${pem}\n`);
-+}
-diff --git a/test/fixtures/x509-escaping/google/intermediate.pem b/test/fi=
xtures/x509-escaping/google/intermediate.pem
-new file mode 100644
-index 0000000000..9d2aeb32c4
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/intermediate.pem
-@@ -0,0 +1,11 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBjjCCATSgAwIBAgIBAjAKBggqhkjOPQQDAjAPMQ0wCwYDVQQDEwRSb290MCAX
-+DTAwMDEwMTAwMDAwMFoYDzIwOTkwMTAxMDAwMDAwWjAXMRUwEwYDVQQDEwxJbnRl
-+cm1lZGlhdGUwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjM
-+qxJVf/FvZm2ftiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkY
-+tM/Bo3cwdTAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQlGcYbYohaK3S+XGeq
-+CTi4LLHeLTAfBgNVHSMEGDAWgBQlGcYbYohaK3S+XGeqCTi4LLHeLTAiBgNVHR4B
-+Af8EGDAWoBQwEoIQYXR0YWNrZXIuZXhhbXBsZTAKBggqhkjOPQQDAgNIADBFAiEA
-+uZhmF3buUdhzHjXLZQSOyT41DqUUX/VKBEraDu+gj+wCIG/R1arbHFRFnEuoVgZI
-+bihwUpUZjIZ5YwJcBu6yuXlZ
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/google/key.pem b/test/fixtures/x5=
09-escaping/google/key.pem
-new file mode 100644
-index 0000000000..102a9d8816
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/key.pem
-@@ -0,0 +1,5 @@
-+-----BEGIN PRIVATE KEY-----
-+MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgaNbpDxJET5xVHxd/
-+ig5x2u2KUIe0jaCVWqarpIN/582hRANCAAR7DaOQvpvA47q2XxjMqxJVf/FvZm2f
-+tiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkYtM/B
-+-----END PRIVATE KEY-----
-diff --git a/test/fixtures/x509-escaping/google/leaf0.pem b/test/fixtures/=
x509-escaping/google/leaf0.pem
-new file mode 100644
-index 0000000000..ce19dc9699
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/leaf0.pem
-@@ -0,0 +1,10 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBajCCARCgAwIBAgIBAzAKBggqhkjOPQQDAjAXMRUwEwYDVQQDEwxJbnRlcm1l
-+ZGlhdGUwIBcNMDAwMTAxMDAwMDAwWhgPMjA5OTAxMDEwMDAwMDBaMA8xDTALBgNV
-+BAMTBExlYWYwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjM
-+qxJVf/FvZm2ftiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkY
-+tM/Bo1MwUTAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFCUZxhtiiFordL5cZ6oJ
-+OLgssd4tMCAGA1UdEQQZMBeCFWJsYWguYXR0YWNrZXIuZXhhbXBsZTAKBggqhkjO
-+PQQDAgNIADBFAiEA4NgHDxVrBjNW+So4MrRZMwDknvjRaBsB4j2IwVRKl4sCIDpg
-+Bhm4ZdHwlUYrALkXa3dFBy8kXBkVumY7UJpbB2mO
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/google/leaf1.pem b/test/fixtures/=
x509-escaping/google/leaf1.pem
-new file mode 100644
-index 0000000000..0b45056656
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/leaf1.pem
-@@ -0,0 +1,10 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBdTCCARygAwIBAgIBBDAKBggqhkjOPQQDAjAXMRUwEwYDVQQDEwxJbnRlcm1l
-+ZGlhdGUwIBcNMDAwMTAxMDAwMDAwWhgPMjA5OTAxMDEwMDAwMDBaMA8xDTALBgNV
-+BAMTBExlYWYwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjM
-+qxJVf/FvZm2ftiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkY
-+tM/Bo18wXTAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFCUZxhtiiFordL5cZ6oJ
-+OLgssd4tMCwGA1UdEQQlMCOCCm5vZGVqcy5vcmeCFWJsYWguYXR0YWNrZXIuZXhh
-+bXBsZTAKBggqhkjOPQQDAgNHADBEAiAOFFOCfA6c/iZWxbDn5QMjNdtZbtJPBcRv
-+uEgSqWrGTAIgK5RK0xGK8UZb2aM2VjGNTYozlcwKaLgQukA+UnKrrJg=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/google/leaf2.pem b/test/fixtures/=
x509-escaping/google/leaf2.pem
-new file mode 100644
-index 0000000000..9cf03fae7d
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/leaf2.pem
-@@ -0,0 +1,10 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBejCCASCgAwIBAgIBBTAKBggqhkjOPQQDAjAXMRUwEwYDVQQDEwxJbnRlcm1l
-+ZGlhdGUwIBcNMDAwMTAxMDAwMDAwWhgPMjA5OTAxMDEwMDAwMDBaMA8xDTALBgNV
-+BAMTBExlYWYwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjM
-+qxJVf/FvZm2ftiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkY
-+tM/Bo2MwYTAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFCUZxhtiiFordL5cZ6oJ
-+OLgssd4tMDAGA1UdEQQpMCeCJW5vZGVqcy5vcmcsIEROUzpibGFoLmF0dGFja2Vy
-+LmV4YW1wbGUwCgYIKoZIzj0EAwIDSAAwRQIgWfT1VXQA79PxgM0DsfeoiwZCc2Be
-+v3/RCRYoRky9DgICIQDUTjndnBQ0KeIWhuMjtSz1C5uPUYofKe7pV2qb/57kvA=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/google/leaf3.pem b/test/fixtures/=
x509-escaping/google/leaf3.pem
-new file mode 100644
-index 0000000000..55a64fdc89
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/leaf3.pem
-@@ -0,0 +1,10 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBZzCCAQ2gAwIBAgIBBjAKBggqhkjOPQQDAjAXMRUwEwYDVQQDEwxJbnRlcm1l
-+ZGlhdGUwIBcNMDAwMTAxMDAwMDAwWhgPMjA5OTAxMDEwMDAwMDBaMA8xDTALBgNV
-+BAMTBExlYWYwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjM
-+qxJVf/FvZm2ftiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkY
-+tM/Bo1AwTjAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFCUZxhtiiFordL5cZ6oJ
-+OLgssd4tMB0GA1UdEQQWMBSGEmh0dHBzOi8vbm9kZWpzLm9yZzAKBggqhkjOPQQD
-+AgNIADBFAiEArZgaxFBuPYFWCXeFTkXhV57MKxG/tIJ2Z3Wzts2Im7QCICoukuRf
-+EsQN7g6h30fRuLOIdbfCCduc7YVpkkSlwe99
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/google/leaf4.pem b/test/fixtures/=
x509-escaping/google/leaf4.pem
-new file mode 100644
-index 0000000000..668a659f45
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/leaf4.pem
-@@ -0,0 +1,10 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBdTCCARugAwIBAgIBBzAKBggqhkjOPQQDAjAXMRUwEwYDVQQDEwxJbnRlcm1l
-+ZGlhdGUwIBcNMDAwMTAxMDAwMDAwWhgPMjA5OTAxMDEwMDAwMDBaMDwxHzAdBgNV
-+BAsMFm9yZyB1bml0CkNOPW5vZGVqcy5vcmcxGTAXBgNVBAMTEGF0dGFja2VyLmV4
-+YW1wbGUwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjMqxJV
-+f/FvZm2ftiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkYtM/B
-+ozEwLzAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFCUZxhtiiFordL5cZ6oJOLgs
-+sd4tMAoGCCqGSM49BAMCA0gAMEUCIQCpchwik2NT0v8ifDT8aMqOLv5YwqB7oeOu
-+LincYQYMagIgZc2U7DBrdEAWNfuAJx4I+ZkluIcswcdnOhbriOrTSHg=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/google/root.pem b/test/fixtures/x=
509-escaping/google/root.pem
-new file mode 100644
-index 0000000000..68eb00ae86
---- /dev/null
-+++ b/test/fixtures/x509-escaping/google/root.pem
-@@ -0,0 +1,9 @@
-+-----BEGIN CERTIFICATE-----
-+MIIBQTCB56ADAgECAgEBMAoGCCqGSM49BAMCMA8xDTALBgNVBAMTBFJvb3QwIBcN
-+MDAwMTAxMDAwMDAwWhgPMjA5OTAxMDEwMDAwMDBaMA8xDTALBgNVBAMTBFJvb3Qw
-+WTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAR7DaOQvpvA47q2XxjMqxJVf/FvZm2f
-+tiFRXNJMe/fhSlDh2CybdkFIw2mE5g4ShW5UBJe+sohqy5V9WRkYtM/BozIwMDAP
-+BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQlGcYbYohaK3S+XGeqCTi4LLHeLTAK
-+BggqhkjOPQQDAgNJADBGAiEA+Y5oEpcG6aRK5qQFLYRi2FrOSSLF1/dI4HtBh0mk
-+GFoCIQD1DpNg6m5ZaogRW1mY1wmR5HFIr3gG8PYDRimQogXUxg=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/info-0-cert.pem b/test/fixtures/x=
509-escaping/info-0-cert.pem
-new file mode 100644
-index 0000000000..6872b9870a
---- /dev/null
-+++ b/test/fixtures/x509-escaping/info-0-cert.pem
-@@ -0,0 +1,30 @@
-+-----BEGIN CERTIFICATE-----
-+MIIFDTCCAvWgAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+XDBaMFgGCCsGAQUFBwEBBEwwSjBIBggrBgEFBQcwAYY8aHR0cDovL2dvb2QuZXhh
-+bXBsZS5jb20vCk9DU1AgLSBVUkk6aHR0cDovL2V2aWwuZXhhbXBsZS5jb20vMA0G
-+CSqGSIb3DQEBCwUAA4ICAQAAd/bIBmSIOJg+Rp96/BDpsZQYgYTyBNWrnBkuHQ0M
-+bovgqEEI/5xiYGEzXhrzmWrUoG40PDeVrpCSsW5m+bsO4zDQeWW5mXejbr0Iwflf
-+TYDxwGUUakAcZ1c5yJ/ABjKy0Tocb9bSzln+tc+HNStp86bbgrhb/wjddn6ca21V
-+cuNFZbN+0SM0LxcWO8oGKXF0HFo0durGhamcH5B/D38FYkaVR5QXoOsWVqtPFjW2
-+t67rmKS6XKaz2JhZDpWDZmDofCoFu/zlkPHXkq7yyrkJ/8qpJCznkZmLn+B1WA+y
-+SrSOYMpQ6RnzMx7wK5UafX5J+lMv16+LTb/n1KAd4zElcqt5eRPLcEuknIEgC2X/
-+AY1ooyN/Xb4QnqvtTmhzIDb7lzzMowi5QrG3rRYMldxG2Rdqwjc8qa5Tgh7EsiU8
-+A/n5X/6cxA1zoyakSHFXzGtazIkPc+zFfOaV1+gpJtd2vD2T+FrmkL1fgazuHXNZ
-+hAQq0RGZWPsCdxm7dG4w5bd3YgRKfD2ck+b9Imu0ta4pqMDHZYgncaeOuuHzHgXA
-+MIvxIG5JfwYUJLUqBUz8hwDVcNMpnscyn2msdpiwXK0AahucBQjbyZ6sovoxmgk5
-+xLdnq2GTtdghwdkF9DYK0ZekDlk1XWbP0tR5Cevo6WlMx+cbEBG+OSfNd8/dFrkd
-+aw=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/info-1-cert.pem b/test/fixtures/x=
509-escaping/info-1-cert.pem
-new file mode 100644
-index 0000000000..05247873d8
---- /dev/null
-+++ b/test/fixtures/x509-escaping/info-1-cert.pem
-@@ -0,0 +1,31 @@
-+-----BEGIN CERTIFICATE-----
-+MIIFVTCCAz2gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+gaMwgaAwgZ0GCCsGAQUFBwEBBIGQMIGNMEUGCCsGAQUFBzAChjlodHRwOi8vY2Eu
-+ZXhhbXBsZS5jb20vCk9DU1AgLSBVUkk6aHR0cDovL2V2aWwuZXhhbXBsZS5jb20w
-+RAYIKwYBBQUHMAGCOGdvb2QuZXhhbXBsZS5jb20KT0NTUCAtIFVSSTpodHRwOi8v
-+Y2Eubm9kZWpzLm9yZy9jYS5jZXJ0MA0GCSqGSIb3DQEBCwUAA4ICAQCbwqw8YKIt
-+Ht9qegR076xpnxuiH0THPGsgazvhCmEr5YHJ68sR1LexjneQDhpNXcnpYpfk6J4d
-+Tu0ApMSbVypFyHcd88g0qVYI9JF+CTNnzut/Zn6xgnUjVjrSz6SZPhkMcBX9ahtY
-+tzswzcyTzso5Do5pxvCWDI+bshgIhC3CYNyAjyOyyhnQrwcOcoatlhDmX1fCk+dC
-+fhmzurBFNIz2gwDC7aRjcaUdTIlYnd6qHk5xLs3neBm44gNk17GazPIPo04LTKXs
-+ZYzvDEUAdJ2FJMiYqSvvEv4k9ozx5HtwtncZpu46El2PQRANgj1UhemYVmHfbdU+
-+7Q+rCv+Loq2v76fddhc1cM3gCQ+6SW2QmRo2rShRGxpuSuZiTngwgdQEGrkQq7Sv
-+r695V7NlHWJgvv1r49wGmqWkviH5l6A0QdzL6TNYhwqCRsjxgsvCZUpOlZPASiME
-+jhwBIOMy1YUSdEMnBrbuemawvbfocSuUlHaodwLZvwMgqHvNz/8ebMyRyyZrnmCx
-+TYh8d0JIcA57VvfaZvvsPPV7TO7WLoJgbmuqM02JzzkJMh0fbt2oi1cqJL65V5Sn
-+z0sXh/A/BzB4QawI93f9m0hX7RtuT1SolTNVyhg7dm1MwfO8khpfz5LLgflVwgN8
-+6egKc6L755SlqZRMT03txH2UCBizLz1gjA=3D=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/info-2-cert.pem b/test/fixtures/x=
509-escaping/info-2-cert.pem
-new file mode 100644
-index 0000000000..06212d4e12
---- /dev/null
-+++ b/test/fixtures/x509-escaping/info-2-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE5DCCAsygAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+MzAxMC8GCCsGAQUFBwEBBCMwITAfBgUrzg8MIoYWaHR0cDovL2NhLmV4YW1wbGUu
-+Y29tLzANBgkqhkiG9w0BAQsFAAOCAgEABR5VyTZEQ0AQvdqlk+IDQT85qyf891eN
-+BREiSg5KCei9Kmubv3ZJGoNVwZgybr5sCi5GqWOtG7S0GXvzS6c2Qy+cW0R4DDYs
-+s6IIUn+ex1XygGrRHTDHu6tEUwSJMmOMKBh+iLjhtamD+YHjgOLG3MfadO5/9mvp
-+r412MPhU1VvQ3FC3dZmBUW2gIKNEU4mzwISgPkLJXmBsnxu8F9YqHPgppqsfJ9AF
-+KIc2nX7N3s8w9fCc03FrihdkE2C802jy71px5aPqa1xrIT/YBq/1fKTcYRAWF/pd
-+iy2G1v0pz0kYu2/yPIC/xlFcUgeFqR/biwxAD9T9rp7rq+dpIJA5BUCpXVULqhY1
-+SVZ22WKS0NR5rbu4BPDMShTOiwaDSwFQtI0OxM0g5zVFVjFOc6YbFu7ZyfLQ582S
-+vgVU5/vaHANnEsCSUegXyLofqxTMPbM1rqibFmv2A4pm1Mp18ZFmqwh8cm6C0f7F
-+qjdzBuSkcktTCq/dLX5yTm9aocyzye9cfNBjiGUregJEF7sD3nzsokEGj+S320w2
-+5yUl95xgrHr+5bdDUEox+trTeBnddC4VxrieeH+Wv45try0Go48yK7b1Aqfu9G4B
-+B/as+upQ+YjMG8mAe6JJ9JibpTvTmatYAsssEKT1vDZ5trqo4C5/utfbuyaf7qtx
-+O+jFfYToPtE=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/info-3-cert.pem b/test/fixtures/x=
509-escaping/info-3-cert.pem
-new file mode 100644
-index 0000000000..1825949bd3
---- /dev/null
-+++ b/test/fixtures/x509-escaping/info-3-cert.pem
-@@ -0,0 +1,30 @@
-+-----BEGIN CERTIFICATE-----
-+MIIFMDCCAxigAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+fzB9MHsGCCsGAQUFBwEBBG8wbTAqBggrBgEFBQcwAaAeBggrBgEFBQcIBaASDBBn
-+b29kLmV4YW1wbGUuY29tMB0GCCsGAQUFBzABoBEGBSvODwwioAgMBmFiYzEyMzAg
-+BggrBgEFBQcwAaAUBggrBgEFBQcIB6AIFgZhYmMxMjMwDQYJKoZIhvcNAQELBQAD
-+ggIBACR9nH4pRlcSIIF9DEExlJvLtkeFWHGIAYLBuauHmdzPdbq9Py9M5DOcc7yd
-+OQYVYwW26hASb+3CYzhRQaWKOR+T/OwP+QMUl5Y6nc3HzLdYTSen2LLAYHySXK3G
-+gTdOhmVQwdh+IzhpjLXC67/9gn/F1p73Ixv/0PBZzmC64DOp1ogso9RICu0xTAbo
-+h8mdN4/Tbh9Ikd89lb91x1Xf86NyC7ZvSA9dUO07/3B6B0kkqCdP9Ytlsrt2wbt3
-+2TVPp+ghjbPjdLrJUi3fbdC2CgjV2oLiYr1h7qn7SmYPNgOpDPKBI4Cei7UO+Wow
-+yLCxBO0HgLZKcZorJFofekPjqtQYYj1sw3OEIcifMAmoHT7H57onfoQbRDpt57k2
-+rHJKgzrRuT8Qbl3OHSkiWRE3u0S9kAg7QEq27e2fuvh23p+YHEiYIjAR9XLVh7/Q
-+EG5QDfDq3MvtgD/khAd36il61T5h8F4u3MhONFMuwJ/TYtGR6QINrv4DqLBM1pRr
-+LMApQYi0w/MCRj2wLeAro9NflE+PFDk+l44ojvnEUYAGUyIzWp80bjQrV7Up6sgQ
-+HehcmxxTrOmiqrfw08c1aHhmGeplmPpQEET1wIjnyj49sfdSPYxg5Lh+f/l79fLb
-+jFemE8otKfog84vNGbPFl/AHwxjKCeCA/MaNJz3y3RYVsZn6
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/info-4-cert.pem b/test/fixtures/x=
509-escaping/info-4-cert.pem
-new file mode 100644
-index 0000000000..8f1e69afec
---- /dev/null
-+++ b/test/fixtures/x509-escaping/info-4-cert.pem
-@@ -0,0 +1,29 @@
-+-----BEGIN CERTIFICATE-----
-+MIIE9jCCAt6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDExBldmls
-+LmV4YW1wbGUuY29tMB4XDTIxMTIyMDE0NTczNVoXDTMxMTIxODE0NTczNVowGzEZ
-+MBcGA1UEAxMQZXZpbC5leGFtcGxlLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
-+ADCCAgoCggIBALERZ3TS70T1P+SjpZwIqOFnu2Od9XKWcDszQQc7C92K+APjp4Bv
-+WiayictqCJWtmsbsSli4yG3P6Ddi/V3Se8W+/yB71Qh2c3wQNMPMukncps2odRGt
-+qJe4EOpret1jgkFqQJy5geXVuPU5N7DvGXUVZzWN7TisFNAZMUhF2YlljJz1sjD1
-+aRjqayh3TDU8NwuFlLd6aH95hovjMBBatWFB9bN/itnMVoj9rmfSjvlpSRO6/EMN
-+DnVXZ3paRJTcps6d/Ylb5Ald/Ow056JgD0Cd9jn16+vgYR4bxVl0a5Qbf24MIhaY
-+BRPx6WFdepWr410GpzpVQ0sMluoKYzH8RynjwQc7pfm5ebTFWJkhU80jOqKJGFW3
-+icV/A9BmtOBqrb60Pv/MPXIQPg7UWGUOXm3AfY3v6gbToewSW5B0s+uPsh52md4Z
-+UoyzTvwN2i/uPqJxi/9FkdV60OWvMMMeMslbDHIBbN0Z2SG0wY93oH2LhO0X89Tc
-+nedukufld8QEW7iMn7D7la+TlrrSAXURHL84sEz97yyujawQEimnW03XAlUFk61M
-+iLhVUOHANFBSLBvZ3VF7sZDv6ZzPkP/TWrFbpL7DQgqunAlSNHealrQ5T3wp8pUm
-+R7J4QEuQSEN2cZMOpn0T+JyQaiytbaAABgqDNeTvbl2nFN2ksSix8NunAgMBAAGj
-+RTBDMEEGCCsGAQUFBwEBBDUwMzAxBggrBgEFBQcwAaAlBggrBgEFBQcIBaAZDBdn
-+b29kLmV4YW1wbGUuY29tAGFiYzEyMzANBgkqhkiG9w0BAQsFAAOCAgEAQERLvjQB
-+E2fmTVgHbr4MVXPfse9Xxk9TK8/IhxDNnql4bor3xat5oP+tDHVRi2StajfIcJlX
-+C9blYOWg4w6QH3pmD6M7eQGOw7ntOUid4R2vhX3XiK3QB1h8lWSPFmSwBHA47mMJ
-+IkrKNIo9+M9b7M05YwbAENi3TPgT8h2Ej9V4DUjLIEhDcu8fSh3FkNpZ2HohZ2I3
-+QPe23FB052jX7uPfeZ9gcjL/iGxuTuPbKWxzZ/Gy2RmS8xfLkJESvvQ8a0H4f7Ij
-+yjn7qYUkY6FoHxyg5BU34YNaJCmfgzRIE53Kv2FMPwj2JaXmIguR+mSDAbc0xjw3
-+G3dRoCqhZugn8C6I5FhuXHdu6zSuuHtwOGEf07y5Im2sBsPVoq+Txh/mv3Zy9Ydy
-+0yCDuq87jKSZd7FKorHOEoQY94UMs33PYjS4h/hYWiysYUeR0mlbjr4gyv1KH6K8
-+JERGpI/OE+vzfOtgj/Z46/+wn7jF0LBCin7Jn5Zw1a1TNsiHKAjqW/P4vJxxUW++
-+FtYwJhI7XJehwNNFra9rSC5M4TkpaqAZnbPvWZWxWVJIEYFgNjnt+b/VOpRpv5bJ
-+7BOlVvP+56KF+vlmCnzVBmlHcr45sZUZ3mw3Sb6dcF0V0VaNQKw/F5EteQyafIIl
-+dvCwwV4OwLwPliPAvwYfVEI41Dv3mF4fN7k=3D
-+-----END CERTIFICATE-----
-diff --git a/test/fixtures/x509-escaping/package.json b/test/fixtures/x509=
-escaping/package.json
-new file mode 100644
-index 0000000000..37d9f2a938
---- /dev/null
-+++ b/test/fixtures/x509-escaping/package.json
-@@ -0,0 +1,12 @@
-+{
-+  "name": "x509-escaping",
-+  "version": "1.0.0",
-+  "description": "create certificates for x509-escaping test",
-+  "main": "createCert.js",
-+  "license": "SEE LICENSE IN ../../../LICENSE",
-+  "private": true,
-+  "dependencies": {
-+    "asn1.js": "^5.4.1",
-+    "asn1.js-rfc5280": "^3.0.0"
-+  }
-+}
-diff --git a/test/fixtures/x509-escaping/server-key.pem b/test/fixtures/x5=
09-escaping/server-key.pem
-new file mode 100644
-index 0000000000..db1d2652d0
---- /dev/null
-+++ b/test/fixtures/x509-escaping/server-key.pem
-@@ -0,0 +1,52 @@
-+-----BEGIN PRIVATE KEY-----
-+MIIJQwIBADANBgkqhkiG9w0BAQEFAASCCS0wggkpAgEAAoICAQCxEWd00u9E9T/k
-+o6WcCKjhZ7tjnfVylnA7M0EHOwvdivgD46eAb1omsonLagiVrZrG7EpYuMhtz+g3
-+Yv1d0nvFvv8ge9UIdnN8EDTDzLpJ3KbNqHURraiXuBDqa3rdY4JBakCcuYHl1bj1
-+OTew7xl1FWc1je04rBTQGTFIRdmJZYyc9bIw9WkY6msod0w1PDcLhZS3emh/eYaL
-+4zAQWrVhQfWzf4rZzFaI/a5n0o75aUkTuvxDDQ51V2d6WkSU3KbOnf2JW+QJXfzs
-+NOeiYA9AnfY59evr4GEeG8VZdGuUG39uDCIWmAUT8elhXXqVq+NdBqc6VUNLDJbq
-+CmMx/Ecp48EHO6X5uXm0xViZIVPNIzqiiRhVt4nFfwPQZrTgaq2+tD7/zD1yED4O
-+1FhlDl5twH2N7+oG06HsEluQdLPrj7IedpneGVKMs078Ddov7j6icYv/RZHVetDl
-+rzDDHjLJWwxyAWzdGdkhtMGPd6B9i4TtF/PU3J3nbpLn5XfEBFu4jJ+w+5Wvk5a6
-+0gF1ERy/OLBM/e8sro2sEBIpp1tN1wJVBZOtTIi4VVDhwDRQUiwb2d1Re7GQ7+mc
-+z5D/01qxW6S+w0IKrpwJUjR3mpa0OU98KfKVJkeyeEBLkEhDdnGTDqZ9E/ickGos
-+rW2gAAYKgzXk725dpxTdpLEosfDbpwIDAQABAoICAAwUElkTPHQZQKsBiL38jzyU
-+/WDduQ0AexZmuCRcoEIUBTgKsvXdYqpqGmEwUfaX2YuBOc8Uh8OJ357Ll1nrjjre
-+fPvDxrPllJodZuQGVpzMOuqjd5zlmi8DRNAg1cg9TfjVXSPzuYsqiYvcw9JDdRqa
-+A6jRDiIEBwVs+oIiFaU8MpvQXL/fNbSX5QhlHuMwwNZ93beoV3F+ojFvpWswLNg+
-+DhsY86lIuYxttZRqdgtIZc49PpD6VoalmC7t8mivJofImi9g/8ytxx97umNGpzOy
-+ssWgY1/7NdS+czdXbDE1sPsaQ8cDxrDmGxPjswV7rK4/Um/1ufnoGXFMlRinS1lQ
-+nns4VAFefVUCk81LRyFb+X97NXPGC1p4zNlC1ZoihMgWKJBzH0uk5K/hURS/wDNZ
-+epm9ssnEQrFGJhEI+635srfn9SVRZ8xNh+oCguo5NaZm/BezC6iBQeoaBmVL2lY8
-+KLztN/JQd6MMZi3CWhTn0ZAtVNMxGjU9/yrdWIkX9EV8Sw68fqLGoKQXI67AOynQ
-+5AnUyEjhVu7M39gYL71l7BVpuG7qaX8l4brzBcgzFldvuhuNCx0SW4gU2/Nx4OwY
-+BLOX1LOrpD+5M9YwcbtSxcxz97nP8efb3hUK3QD2iuZ9Fa6zKWsoreMb7Jku38i7
-+e41lupAIkxxuxGBe1YrZAoIBAQDVF7Kru6tsaWtvJw5cbZpKxcuUHHQ0X3XRgA+H
-+uWfT8EbxmDpgcG8polqiYuXPFWcrElmtWeBCYXazGZocHRV8y+ri/9c2rMTH6Bni
-+TcYfsc4E8WY6adxfUqajgQ2zShdZbxZtBvSP50HheZ0a+L2qn2MWDUN/mbwYEmom
-+SonVx3MSJWm/Vrh5i4b/L/+9u7uumIjWYFK6pKdLerTfbXO7ZsNR9KDIOBLDnUcf
-++6K2vcclZN7aga1S7wTsrX+k9C/OQuj8ONMWQHCxryp5RAmgtArTBrJZq8el1lcG
-+518Vo4QuOqsqTdAhqiImoPKe4NNCs1iTS9BdCqNYiF8sbmeJAoIBAQDUuL5ebQ68
-+6vqTKYD47ZtCzeqziN3Y/0a1BsyZh0/snNmK5WIr4T0vX0Y/XG0EpkZdpW3odMBv
-+CemKs6Zm+pfOUGu20PTJcdSOXRbFiVYSeQnfa0l3iXZvY9Ottz/IU/mWPuU3hc18
-+hOZD9tKiwYDzZREg6L4XRizfT70UkD2eTz4lGBjR092TTj8WqSaI9GF6d9B6Aw9Y
-+OCZdTqV7hPe0Rnvd1XiGsk68HN2Np47HHwwPsKMCYj8YNKmsUF8QSXmCkijlDeJW
-+bC6TjAHlvnN6n1LjaLwULUs9Rb2fkNUOqsgR+T8YlqbclJbzC7gW53M/68c9eOQ1
-+Y01JnzsB3S2vAoIBAQDT8DP2djtzIg6GiNPRvfj9cWifMQWqqV8nNTU9Cnxn4MzO
-+sVcuX+VQBXgblj13D5SC1Ed5ELDplMJYM5iBabPbYX2GtGq6qG83XHOSD0SEdXWw
-+mN/SLUPPUwcGC+8yaPh8LO6jFY3cKmft9+T31Hnf35LPdfWyTZc0YexNlUkt5Kdg
-+XvGkKn5j9RAZcwXrEXMDnhZLEZZ2qBj0C2El71hyBS0ysBnRyWNwR1dcSgx1sJ8H
-+ZCH6NYvLtoqxU4Zm6684eHf9lA7uTL1JHC0kWzUwLqGtbTWp1h5FpL790NVTUkS/
-+Lf7bnnTpZqt8vAtTVc0IxBPOvFLKlzALd+cg69XxAoIBAQCv6Sbkh2NMrzUQRZ42
-+PKfMkuSoG2L6dABQ65J+0/swPHVZ+1830kf6yNsawqAU3DwMbSV6ujH4oUXUQcQ2
-+HL01DCRHRn1nqQ6RvEF8kZnwJNAZRmu2wqKCcxc17Ph9/ZPEv7ZmN+w6MN0LDy4Z
-+EdRFcyq7AD1SmeG5ugMu4ilSpU1K96ZuvrnZezeI0dDgKNgDotlwTN9/oM95EfSf
-+NNJy7ma4iDPnj8S0o1pELnBQEkizIOtsqTpsFgDKUpyKp3golh3jbZvixAuwUHOx
-+PdHZca/mB1KhjONPhEDPl8HZIznYQzn+Z3cNqoM58lMF/di834ogN7zguYHMhDUT
-+0YhZAoIBAHlYhuni+gyrn4tyZgep68VXW7wQxSvgSj8cpZAuT/w0UKAU53J5QTWZ
-+aGHeICXvgvpalUL+2dGwASlOvPa52ekcOPd2+qKWyss0zA4ksI7mNE2vjFUcOr+S
-+n9QSNvu3E8dYAjzSIsizcQbPTlk6A/TmytNJ4x67ZVGCmKXw1ZzzSrxSbAIdY254
-+TxSGchrfcy0ofXIL2HXq16FRmesORTJFkkyQaldzn4y7S6HJ/vGppImTfeac1MwG
-+jLYljIkIbt+nB1c8HeNvARmBa6M2pxB9f72oRMVqFdUUc5AxXuWP9v6xk227EuCq
-+TBORAafu9WxKVwUsHa1rE1uGgNEfRJ8=3D
-+-----END PRIVATE KEY-----
-diff --git a/test/parallel/test-tls-0-dns-altname.js b/test/parallel/test-=
tls-0-dns-altname.js
-index 4bc87e44cb..e5cb8e3d48 100644
---- a/test/parallel/test-tls-0-dns-altname.js
-+++ b/test/parallel/test-tls-0-dns-altname.js
-@@ -44,7 +44,7 @@ const server =3D tls.createServer({
-   }, common.mustCall(() =3D> {
-     const cert =3D c.getPeerCertificate();
-     assert.strictEqual(cert.subjectaltname,
--                       'DNS:good.example.org\0.evil.example.com, ' +
-+                       'DNS:"good.example.org\\u0000.evil.example.com", '=
 +
-                            'DNS:just-another.example.com, ' +
-                            'IP Address:8.8.8.8, ' +
-                            'IP Address:8.8.4.4, ' +
-diff --git a/test/parallel/test-x509-escaping.js b/test/parallel/test-x509=
-escaping.js
-new file mode 100644
-index 0000000000..4e0f82767d
---- /dev/null
-+++ b/test/parallel/test-x509-escaping.js
-@@ -0,0 +1,349 @@
-+'use strict';
-+
-+const common =3D require('../common');
-+if (!common.hasCrypto)
-+  common.skip('missing crypto');
-+
-+const assert =3D require('assert');
-+const tls =3D require('tls');
-+const fixtures =3D require('../common/fixtures');
-+
-+const { hasOpenSSL3 } =3D common;
-+
-+// Test that all certificate chains provided by the reporter are rejected=
.
-+{
-+  const rootPEM =3D fixtures.readSync('x509-escaping/google/root.pem');
-+  const intermPEM =3D fixtures.readSync('x509-escaping/google/intermediat=
e.pem');
-+  const keyPEM =3D fixtures.readSync('x509-escaping/google/key.pem');
-+
-+  const numLeaves =3D 5;
-+
-+  for (let i =3D 0; i < numLeaves; i++) {
-+    // TODO(tniessen): this test case requires proper handling of URI SAN=
s,
-+    // which node currently does not implement.
-+    if (i =3D=3D=3D 3) continue;
-+
-+    const name =3D `x509-escaping/google/leaf${i}.pem`;
-+    const leafPEM =3D fixtures.readSync(name, 'utf8');
-+
-+    const server =3D tls.createServer({
-+      key: keyPEM,
-+      cert: leafPEM + intermPEM,
-+    }, common.mustNotCall()).listen(common.mustCall(() =3D> {
-+      const { port } =3D server.address();
-+      const socket =3D tls.connect(port, {
-+        ca: rootPEM,
-+        servername: 'nodejs.org',
-+      }, common.mustNotCall());
-+      socket.on('error', common.mustCall());
-+    })).unref();
-+  }
-+}
-+
-+// Test escaping rules for subject alternative names.
-+{
-+  const expectedSANs =3D [
-+    'DNS:"good.example.com\\u002c DNS:evil.example.com"',
-+    // URIs should not require escaping.
-+    'URI:http://example.com/',
-+    'URI:http://example.com/?a=3Db&c=3Dd',
-+    // Unless they contain commas.
-+    'URI:"http://example.com/a\\u002cb"',
-+    // Percent encoding should not require escaping.
-+    'URI:http://example.com/a%2Cb',
-+    // Malicious attempts should be escaped.
-+    'URI:"http://example.com/a\\u002c DNS:good.example.com"',
-+    // Non-ASCII characters in DNS names should be treated as Latin-1.
-+    'DNS:"ex\\u00e4mple.com"',
-+    // It should not be possible to cause unescaping without escaping.
-+    'DNS:"\\"evil.example.com\\""',
-+    // IPv4 addresses should be represented as usual.
-+    'IP Address:8.8.8.8',
-+    'IP Address:8.8.4.4',
-+    // For backward-compatibility, include invalid IP address lengths.
-+    hasOpenSSL3 ? 'IP Address:<invalid length=3D5>' : 'IP Address:<invali=
d>',
-+    hasOpenSSL3 ? 'IP Address:<invalid length=3D6>' : 'IP Address:<invali=
d>',
-+    // IPv6 addresses are represented as OpenSSL does.
-+    'IP Address:A0B:C0D:E0F:0:0:0:7A7B:7C7D',
-+    // Regular email addresses don't require escaping.
-+    'email:foo@example.com',
-+    // ... but should be escaped if they contain commas.
-+    'email:"foo@example.com\\u002c DNS:good.example.com"',
-+    'DirName:/C=3DDE/L=3DHannover',
-+    // TODO(tniessen): support UTF8 in DirName
-+    'DirName:"/C=3DDE/L=3DM\\\\xC3\\\\xBCnchen"',
-+    'DirName:"/C=3DDE/L=3DBerlin\\u002c DNS:good.example.com"',
-+    'DirName:"/C=3DDE/L=3DBerlin\\u002c DNS:good.example.com\\\\x00' +
-+      'evil.example.com"',
-+    'DirName:"/C=3DDE/L=3DBerlin\\u002c DNS:good.example.com\\\\\\\\x00' =
+
-+      'evil.example.com"',
-+    // These next two tests might be surprising. OpenSSL applies its own =
rules
-+    // first, which introduce backslashes, which activate node's escaping=
.
-+    // Unfortunately, there are also differences between OpenSSL 1.1.1 an=
d 3.0.
-+    'DirName:"/C=3DDE/L=3DBerlin\\\\x0D\\\\x0A"',
-+    hasOpenSSL3 ?
-+      'DirName:"/C=3DDE/L=3DBerlin\\\\/CN=3Dgood.example.com"' :
-+      'DirName:/C=3DDE/L=3DBerlin/CN=3Dgood.example.com',
-+    // TODO(tniessen): even OIDs that are well-known (such as the followi=
ng,
-+    // which is sha256WithRSAEncryption) should be represented numericall=
y only.
-+    'Registered ID:sha256WithRSAEncryption',
-+    // This is an OID that will likely never be assigned to anything, thu=
s
-+    // OpenSSL should not know it.
-+    'Registered ID:1.3.9999.12.34',
-+    hasOpenSSL3 ?
-+      'othername: XmppAddr::abc123' :
-+      'othername:<unsupported>',
-+    hasOpenSSL3 ?
-+      'othername:" XmppAddr::abc123\\u002c DNS:good.example.com"' :
-+      'othername:<unsupported>',
-+    hasOpenSSL3 ?
-+      'othername:" XmppAddr::good.example.com\\u0000abc123"' :
-+      'othername:<unsupported>',
-+    // This is unsupported because the OID is not recognized.
-+    'othername:<unsupported>',
-+    hasOpenSSL3 ? 'othername: SRVName::abc123' : 'othername:<unsupported>=
',
-+    // This is unsupported because it is an SRVName with a UTF8String val=
ue,
-+    // which is not allowed for SRVName.
-+    'othername:<unsupported>',
-+    hasOpenSSL3 ?
-+      'othername:" SRVName::abc\\u0000def"' :
-+      'othername:<unsupported>',
-+  ];
-+
-+  const serverKey =3D fixtures.readSync('x509-escaping/server-key.pem', '=
utf8');
-+
-+  for (let i =3D 0; i < expectedSANs.length; i++) {
-+    const pem =3D fixtures.readSync(`x509-escaping/alt-${i}-cert.pem`, 'u=
tf8');
-+
-+    // X509Certificate interface is not supported in v12.x & v14.x. Disab=
le
-+    // checks for subjectAltName with expectedSANs. The testcase is porte=
d
-+    // from v17.x
-+    //
-+    // Test the subjectAltName property of the X509Certificate API.
-+    // const cert =3D new X509Certificate(pem);
-+    // assert.strictEqual(cert.subjectAltName, expectedSANs[i]);
-+
-+    // Test that the certificate obtained by checkServerIdentity has the =
correct
-+    // subjectaltname property.
-+    const server =3D tls.createServer({
-+      key: serverKey,
-+      cert: pem,
-+    }, common.mustCall((conn) =3D> {
-+      conn.destroy();
-+      server.close();
-+    })).listen(common.mustCall(() =3D> {
-+      const { port } =3D server.address();
-+      tls.connect(port, {
-+        ca: pem,
-+        servername: 'example.com',
-+        checkServerIdentity: (hostname, peerCert) =3D> {
-+          assert.strictEqual(hostname, 'example.com');
-+          assert.strictEqual(peerCert.subjectaltname, expectedSANs[i]);
-+        },
-+      }, common.mustCall());
-+    }));
-+  }
-+}
-+
-+// Test escaping rules for authority info access.
-+{
-+  const expectedInfoAccess =3D [
-+    {
-+      text: 'OCSP - URI:"http://good.example.com/\\u000a' +
-+            'OCSP - URI:http://evil.example.com/"',
-+      legacy: {
-+        'OCSP - URI': [
-+          'http://good.example.com/\nOCSP - URI:http://evil.example.com/'=
,
-+        ],
-+      },
-+    },
-+    {
-+      text: 'CA Issuers - URI:"http://ca.example.com/\\u000a' +
-+            'OCSP - URI:http://evil.example.com"\n' +
-+            'OCSP - DNS:"good.example.com\\u000a' +
-+            'OCSP - URI:http://ca.nodejs.org/ca.cert"',
-+      legacy: {
-+        'CA Issuers - URI': [
-+          'http://ca.example.com/\nOCSP - URI:http://evil.example.com',
-+        ],
-+        'OCSP - DNS': [
-+          'good.example.com\nOCSP - URI:http://ca.nodejs.org/ca.cert',
-+        ],
-+      },
-+    },
-+    {
-+      text: '1.3.9999.12.34 - URI:http://ca.example.com/',
-+      legacy: {
-+        '1.3.9999.12.34 - URI': [
-+          'http://ca.example.com/',
-+        ],
-+      },
-+    },
-+    hasOpenSSL3 ? {
-+      text: 'OCSP - othername: XmppAddr::good.example.com\n' +
-+            'OCSP - othername:<unsupported>\n' +
-+            'OCSP - othername: SRVName::abc123',
-+      legacy: {
-+        'OCSP - othername': [
-+          ' XmppAddr::good.example.com',
-+          '<unsupported>',
-+          ' SRVName::abc123',
-+        ],
-+      },
-+    } : {
-+      text: 'OCSP - othername:<unsupported>\n' +
-+            'OCSP - othername:<unsupported>\n' +
-+            'OCSP - othername:<unsupported>',
-+      legacy: {
-+        'OCSP - othername': [
-+          '<unsupported>',
-+          '<unsupported>',
-+          '<unsupported>',
-+        ],
-+      },
-+    },
-+    hasOpenSSL3 ? {
-+      text: 'OCSP - othername:" XmppAddr::good.example.com\\u0000abc123"'=
,
-+      legacy: {
-+        'OCSP - othername': [
-+          ' XmppAddr::good.example.com\0abc123',
-+        ],
-+      },
-+    } : {
-+      text: 'OCSP - othername:<unsupported>',
-+      legacy: {
-+        'OCSP - othername': [
-+          '<unsupported>',
-+        ],
-+      },
-+    },
-+  ];
-+
-+  const serverKey =3D fixtures.readSync('x509-escaping/server-key.pem', '=
utf8');
-+
-+  for (let i =3D 0; i < expectedInfoAccess.length; i++) {
-+    const pem =3D fixtures.readSync(`x509-escaping/info-${i}-cert.pem`, '=
utf8');
-+    const expected =3D expectedInfoAccess[i];
-+
-+    // X509Certificate interface is not supported in v12.x & v14.x. Disab=
le
-+    // checks for cert.infoAccess with expected text. The testcase is por=
ted
-+    // from v17.x
-+    // Test the subjectAltName property of the X509Certificate API.
-+    // const cert =3D new X509Certificate(pem);
-+    // assert.strictEqual(cert.infoAccess,
-+    //                   `${expected.text}${hasOpenSSL3 ? '' : '\n'}`);
-+
-+    // Test that the certificate obtained by checkServerIdentity has the =
correct
-+    // subjectaltname property.
-+    const server =3D tls.createServer({
-+      key: serverKey,
-+      cert: pem,
-+    }, common.mustCall((conn) =3D> {
-+      conn.destroy();
-+      server.close();
-+    })).listen(common.mustCall(() =3D> {
-+      const { port } =3D server.address();
-+      tls.connect(port, {
-+        ca: pem,
-+        servername: 'example.com',
-+        checkServerIdentity: (hostname, peerCert) =3D> {
-+          assert.strictEqual(hostname, 'example.com');
-+          assert.deepStrictEqual(peerCert.infoAccess,
-+                                 Object.assign(Object.create(null),
-+                                               expected.legacy));
-+        },
-+      }, common.mustCall());
-+    }));
-+  }
-+}
-+
-+// The internal parsing logic must match the JSON specification exactly.
-+{
-+  // This list is partially based on V8's own JSON tests.
-+  const invalidJSON =3D [
-+    '"\\a invalid escape"',
-+    '"\\v invalid escape"',
-+    '"\\\' invalid escape"',
-+    '"\\x42 invalid escape"',
-+    '"\\u202 invalid escape"',
-+    '"\\012 invalid escape"',
-+    '"Unterminated string',
-+    '"Unterminated string\\"',
-+    '"Unterminated string\\\\\\"',
-+    '"\u0000 control character"',
-+    '"\u001e control character"',
-+    '"\u001f control character"',
-+  ];
-+
-+  for (const invalidStringLiteral of invalidJSON) {
-+    // Usually, checkServerIdentity returns an error upon verification fa=
ilure.
-+    // In this case, however, it should throw an error since this is not =
a
-+    // verification error. Node.js itself will never produce invalid JSON=
 string
-+    // literals, so this can only happen when users construct invalid sub=
ject
-+    // alternative name strings (that do not follow escaping rules).
-+    assert.throws(() =3D> {
-+      tls.checkServerIdentity('example.com', {
-+        subjectaltname: `DNS:${invalidStringLiteral}`,
-+      });
-+    }, {
-+      code: 'ERR_TLS_CERT_ALTNAME_FORMAT',
-+      message: 'Invalid subject alternative name string'
-+    });
-+  }
-+}
-+
-+// While node does not produce commas within SAN entries, it should parse=
 them
-+// correctly (i.e., not simply split at commas).
-+{
-+  // Regardless of the quotes, splitting this SAN string at commas would
-+  // cause checkServerIdentity to see 'DNS:b.example.com' and thus to acc=
ept
-+  // the certificate for b.example.com.
-+  const san =3D 'DNS:"a.example.com, DNS:b.example.com, DNS:c.example.com=
"';
-+
-+  // This is what node used to do, and which is not correct!
-+  const hostname =3D 'b.example.com';
-+  assert.strictEqual(san.split(', ')[1], `DNS:${hostname}`);
-+
-+  // The new implementation should parse the string correctly.
-+  const err =3D tls.checkServerIdentity(hostname, { subjectaltname: san }=
);
-+  assert(err);
-+  assert.strictEqual(err.code, 'ERR_TLS_CERT_ALTNAME_INVALID');
-+  assert.strictEqual(err.message, 'Hostname/IP does not match certificate=
\'s ' +
-+                                  'altnames: Host: b.example.com. is not =
in ' +
-+                                  'the cert\'s altnames: DNS:"a.example.c=
om, ' +
-+                                  'DNS:b.example.com, DNS:c.example.com"'=
);
-+}
-+
-+// The subject MUST be ignored if a dNSName subject alternative name exis=
ts.
-+{
-+  const key =3D fixtures.readKey('incorrect_san_correct_subject-key.pem')=
;
-+  const cert =3D fixtures.readKey('incorrect_san_correct_subject-cert.pem=
');
-+
-+  // The hostname is the CN, but not a SAN entry.
-+  const servername =3D 'good.example.com';
-+
-+  // X509Certificate interface is not supported in v12.x & v14.x. Disable
-+  // checks for certX509.subject and certX509.subjectAltName with expecte=
d
-+  // value. The testcase is ported from v17.x
-+  //
-+  // const certX509 =3D new X509Certificate(cert);
-+  // assert.strictEqual(certX509.subject, `CN=3D${servername}`);
-+  // assert.strictEqual(certX509.subjectAltName, 'DNS:evil.example.com');
-+
-+  // Try connecting to a server that uses the self-signed certificate.
-+  const server =3D tls.createServer({ key, cert }, common.mustNotCall());
-+  server.listen(common.mustCall(() =3D> {
-+    const { port } =3D server.address();
-+    const socket =3D tls.connect(port, {
-+      ca: cert,
-+      servername,
-+    }, common.mustNotCall());
-+    socket.on('error', common.mustCall((err) =3D> {
-+      assert.strictEqual(err.code, 'ERR_TLS_CERT_ALTNAME_INVALID');
-+      assert.strictEqual(err.message, 'Hostname/IP does not match ' +
-+                                      "certificate's altnames: Host: " +
-+                                      "good.example.com. is not in the ce=
rt's" +
-+                                      ' altnames: DNS:evil.example.com');
-+    }));
-+  })).unref();
-+}
---
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_12.22.12.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.22.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index 2c7d3b3edd..8dbdd088e9 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c66ff8861d9f96076a7cb61e3d75f5=
4"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D93997aa7a45ba0f25f9c61aaab153ab=
8"

 DEPENDS =3D "openssl"
 DEPENDS_append_class-target =3D " nodejs-native"
@@ -22,12 +22,11 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
            file://big-endian.patch \
            file://mips-warnings.patch \
            file://0001-Remove-use-of-register-r7-because-llvm-now-issues-a=
n.patch \
-           file://CVE-2021-44532.patch \
            "
 SRC_URI_append_class-target =3D " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] =3D "7fd805571df106f086f4c45e131efed98bfd62628d9dec96bd=
62f8c11b0c48dc"
+SRC_URI[sha256sum] =3D "bc42b7f8495b9bfc7f7850dd180bb02a5bdf139cc232b8c6f0=
2a6967e20714f2"

 S =3D "${WORKDIR}/node-v${PV}"

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

