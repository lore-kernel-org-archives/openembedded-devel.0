Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EB6CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 14:25:11 +0000 (UTC)
Received: from mx-relay26-hz12-if1.hornetsecurity.com (mx-relay26-hz12-if1.hornetsecurity.com [94.100.139.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13462.1779287109648633708
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 07:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=cZ5Giits;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.226, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate26-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.127, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=0Z21MkXhEqGodET+Oxu9u3s3LnymHcBvKYICjJku9as=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779287107;
 b=K6yvEXJd09RRlK/gF3Xn2ti7aCdMbZeoS1jG1Jh30YN2iqv/sIAcecBfQLJB2WEPUuFgNI/y
 u98RA932jMKJWV6J7pNDrW6Q1P7Fxpbcpnsz3t/u4qI1VHCeSUdnkFaQzdEh9rOwSBxNe9LZE1w
 U7oWHmNMp+sU1sRPx1e6TmC46BPiPf3ACeiwcPp2zpVpYZT6vWQ3fbOPcdkZuYHElDgU6wsfxb4
 lTeV1YCEoT8V5LqKUlbCrUgENX8QF4R3iirADQfHGT72/lEYGaiNxeBOlXv9Dvap9SBkw115azu
 +N5pOWbH8bFgJlIMvSGw+WLOxftTvVIdp+1LDqV14yjqA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779287107;
 b=E6wOJbIaKWu/+h+/VkAFfh7xDgYMhWtqGfJaXmAi/kqdQQWnFF4PiorJNB1WZ1Tpb3bx/dts
 ig36zfF7VxP4W5GM6AcC6z4PGVCObng0K2U7CmszXgdLUI9+aOrO0MtzUtP2tuFaEcvYbScUHH8
 s1MzXRtLWxb0acQB1XfPm0+6T2AjlisM27ivk28FnVAIEYIT0wqb0SFaJFnFAfGwWou0VwF3Gap
 BXfn8VgIQaGJCLuQkpfgel9RbnfHaS52E+UmQvjWKZOVCKLIZwtKy++OIx+eeSZDClNdWjyllTJ
 i7Ar2pQbnjVFqAq40dALtIUeppL6rdkdLSjk49T8JIjRA==
Received: from mail-northeuropeazon11021127.outbound.protection.outlook.com ([52.101.65.127]) by mx-gate26-hz12;
 Wed, 20 May 2026 16:25:07 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mzyex63qa/Q/5H3wIEoJyE+eM5oVLGw3PokviHTofbVX6T4zaacvbyojl4iblNZ/E1pDVeF+at5IsaIKv0cdUI3T7f++cLVZzEe7x2VZwC/wAmr8afGFNEjPXh7LualXDml8O1W24gyfXjYTfI9fW3StHDbc8AFryTbW6b0rs4Ifrjj1KU50EaeODizuRFiCL0j1RJ9WLBB787PNVZQlCobwY06STm7upZ7H6cnR4VXCS8iXcEFLgBYQfUu0FQrD3EY7pFlleKmOI9PaDZpgYUy8jMx1KP2auGFRxUqmgCfbmKoLCJbMci9nQb0+KvgxmAAbwrS8SO+DQLFEQJUNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z21MkXhEqGodET+Oxu9u3s3LnymHcBvKYICjJku9as=;
 b=Fe8Z/vccpzR95fULNFSmeEpAwi7MOkuWX3sUYBneWEAf+O/2uPhYGsEYh9/HfwUjv7ISbQkU3D+GoolPyv7L4hKgfKzgIA6K0FwHoWmDGeGR4uUqaJdDhIbrAJ35IiYsrzMNAdVvbnUAhgndLLD7rDA/QJQJs0b42oNU4P0SRo1xXmNGqSsej9JzO7V1pUhN/xtPCswgzNYrvhMz0AeLvls/XoIXPLW8iEU8ijd1epEmjXnxmwPE2DnVvJc9eqnqjTDnMB4w3ocN9UNWGkWJLw1fotX54xxxA6BNJRBXyQxZbERKMRlirmYnu1mK4mRYuri7x8Z0ZGSkdBbJ6Whcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z21MkXhEqGodET+Oxu9u3s3LnymHcBvKYICjJku9as=;
 b=cZ5GiitsRNOkXCoS5u5zSGLUIgTxJJidB7AAj+AJ4NTzME3qWTUyhLYE6sflqq95p6RK9Bj8DYUkcAoY8xVAze6s8jTWq92Fm9Wdc+F03J+z36AJuljV0h/FOi6bDa42BqTGJRAA3WeDF7nvTW3Gy26HFhJ2GpOA2OY1pjuP5Z7RpqkR9xB/vDK/OyTmIIM405004Y17+K4wFmTj9XYvOz3PhyMvgjEwKZTsrv2i50k+vq9ZjWjGkMbnw0t/PlLN7S8jt5UejgvOJmXNBitaHSQvm/ANMER7GCa8rtpwdm6bqlo3+nWIVj/cbTM5AguILWa+rjQc0v9Jox9sa++crQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PAWP192MB2388.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:24:53 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 14:24:53 +0000
From: tgaige.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [meta-webserver][scarthgap][PATCH 4/4] nginx: patch CVE-2026-42946
Date: Wed, 20 May 2026 16:24:38 +0200
Message-ID: <20260520142438.2126939-4-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520142438.2126939-1-tgaige.opensource@witekio.com>
References: <20260520142438.2126939-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PAWP192MB2388:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b87eec1-9a7c-4dc9-0feb-08deb67b8f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2yRVRvWPsw/c/jA57y8YPML50wlgJUJLhvV5Mo608CBiOjPXANNVbmWuDz/BdqbWOIuTB6VBHgM4YHWiCqKyOJ8zGjMKOIOI/xJDQgM9pbbopECbERIoY19udHV4TXW3cLW3f0+XskfvPHPMKwXyku8J6YQBd6n6q30zP8L0+XX5aUIW3Do5qLe7QYsKRSeZO88QUtWH5m+bbZB288/3L+IC0ZlE5nX6axi2Kw9+X6W/HceUVpaUr+YwlI4lCkTu8FBisWIIxUAoRMBvxP/4nE+ACSsjDYdd486hAVwScz9vyS+kUTR9UjY7HXCpVu2aSFOPyZ95rRpBfeoHw/eVHbu+RyRauki/TtLNbR8Rp85yeXpkddfLv1Dn18aY0cF9BuYkDw5pDc1hXjq+ODY34baWn1csjGw4EG7sV5VSmymx18K1zWhQZU0/594PUbKoxYxQAzCkGPUf7m9y4Ymz0C2UYmv7BDXHSrsGT8KzG7oEnPGUnlgU3jGenyv1u3Jl/MaUXLhvJ0U6ckgt/XWHpBNUjsOKUMiidLpc7rAqWXckm4nc8Uq8baBAlBp40pxA8D6mSszpIm94UZ0hZsajCNBJAaIP7L3q2DVH+Q0QGi2MCcpL90n5GkwhPWjWdNdOV5t4+hz4FkjFXNiq/ozNqx8t2RTPXker2Yl/KAMZGBbxt13maxHdWM6CQWRs/2yskBdNbLeB2De6XPpzbNgDQylqCrQs4Xy261zPuZe2MQvlMNq4bZGJD9E1XwHix4Nl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GWX/bBMV71I4YZAmcO6nSlGHX3GAJOt2uE63Si3fOQIgMeExrM/xUcwYXmkc?=
 =?us-ascii?Q?ZFSCFDvTKKc24T9WuR9PKQMQzHfjnGkiv93fvkK9GygJIy1zVdbWf0JeIjMT?=
 =?us-ascii?Q?IYFpaiHdpPiEE/uHUk4oY7hMuGCUcpBIyM7j0UZuWlK7KiYAgV8mGlSwGhDd?=
 =?us-ascii?Q?OdsI6TDgNGG5EXTsp9v0dY3wTierQG0W0t3jUJuTIlqp2jrZZNHxJS3yi/F0?=
 =?us-ascii?Q?3e8OBF0Qf9YZxZBWcEIRxTpmPqd/fb+z3hlSPsQnV2lGzgvH2FcmOc+4PyaP?=
 =?us-ascii?Q?H/1eJhmEz+uBDr9ifrSgV9X3tNcevqnv/1THF7oEsryMR1lNnxr0yMrqEDRD?=
 =?us-ascii?Q?EuTv9QGOAtjbxLtz8LwJ+5nw/v7HvhvCrq65x9Tt60MzgHCTC7TdjTzCvFll?=
 =?us-ascii?Q?4WHBo3kJgKgC0elPAMw5uE2JsuvywQwJKsQN322C0DRyIXv5evzBRkl1ssSz?=
 =?us-ascii?Q?GJKW5HT9BcjLL+rniXxaJ8mHNQ3Hy0p/33nL33Qh0ZEfnyUpYQPLwo/Oox43?=
 =?us-ascii?Q?GgD2e3OtpbI40zWQbR3xQCsNB1N50wx2GJXkzjXbutW8HJJyhiRq6D1fUEGf?=
 =?us-ascii?Q?ORk2Vz7Fp2iKhNxGKMhkhBuypS4VcrLw05u3O8661TdoE7BcPck7p67Axg7C?=
 =?us-ascii?Q?uQAxbOw3xNqSMVORCz+FcZ6gvm5CtgfwcbsRC8+9kvne+ybHEWCF2qt56piB?=
 =?us-ascii?Q?qzNibSM9BG7TkwZZmqK9V7hoGaHx63yK8VtgnHimmhEHwUkSEjAiZSOfYIU2?=
 =?us-ascii?Q?b54U9So7JMHxWLlGy19fsT2J4sqv5u9fFlzP3UGzq/mIbjH3wpebZqRVEpQq?=
 =?us-ascii?Q?mw8Vor4Yn6kzlIv+3fGQq242gx7N3ZXBaNK+ggfyq99+5YsRisBpQcVOaZ5M?=
 =?us-ascii?Q?loF0M9CpjlNakJUGeimR8kJvhv5/jvxliE7gBHkkxmafMu2IPOj2Rr+9lA6w?=
 =?us-ascii?Q?/h9pON15W3G8pPWpFqmd4m/azSTmNL6bQDmVRr728r93QwwQ5O3rUrMHpyRt?=
 =?us-ascii?Q?ZBaBlNm19O3zgZn+2Eq88VBU/hlBfbHyAm2rgjZ75ZEMOp3JJhFnsA2vKN8j?=
 =?us-ascii?Q?7cX3YnQ3VfnvmJBWPVE4/RteDM/uyffI+VPve50iRfkZJeuUEGv2kdlKW8Z1?=
 =?us-ascii?Q?eY5P8BjniX9wPGB8ed3nJjtjdGhwKfUBmdGjdGLyFBEJ+G8h2PWhmoORxpUV?=
 =?us-ascii?Q?M0Im4+3gN0nuH1NNC/s9TMj9Sft4zzYK4QcYtKScckczDlXwO2cgDpoiFlD/?=
 =?us-ascii?Q?PBTNnqwTipL2ir1VFZ/+AVIAPHc407qTc/tFgbiPd2DqAhDUD9+TDErDTIpu?=
 =?us-ascii?Q?OfvWNhFVwazZDX9Mxd3uCFjkR1Jvq8Ctc+IX7fAETOrrUtLkb3gCCevABgHL?=
 =?us-ascii?Q?mfTXV9RFRkLTxq7E8i0SRqXcpOTexmuDKr6P9fHoGLsWRnojKNB0EmhSOI5L?=
 =?us-ascii?Q?RIviMAyyDWGXIj9NhOcB1qEhlqppKPaQMC0RKnWmxJbCeOpYuMPUAdXk2Qkf?=
 =?us-ascii?Q?6Y6YyzBXHJKj8p711SH9qMfLWFDgCO2Uh/2Pde2ZOAXFJN54xE0TWdF/Yj7i?=
 =?us-ascii?Q?iKsxQjquPOr+RaFaUljyqImoTDLk4gbiVex0CbG+Wqk3FduPUAQcYjfTMJdN?=
 =?us-ascii?Q?HqvqeC7mNxELiVi7vQh026zmIk2dHqzlpTnZoyrscuNsh0pW7t/2mneZFAhJ?=
 =?us-ascii?Q?2gPCbIxgFw9QWHwbvgyov+5WbFi5Wn3fEp9BZETnC9iWOFkb9a4mO1+jWjTp?=
 =?us-ascii?Q?NSNmyCvo8g=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	aGNGXr8OXwjtm/NRbfr3XIHiH2danYA980dnnn3lIne4AsrmewUcVkDtNQNuLLIbcaX5O6g8ECh5nYOi95DiBxyzL0nTcLb+ZeUozB+DXHw3mqTOb33z1cE7z07rkNuXuexxpfYOlQoc8EeqUMt3JaL0ffQk/lUoyDdCSUYzmfSSRvgk3vgWwJ10fVerCDfLQb2qBmxfdtf6IC9/RhUIle76hgLbCdQNi4RwcY558516y8F5l1Kd0OvJlSsQ6thLlurjpz8mprgfYiNpve5tQ2O2c1Ela1zc/GTcWzGMqTkWP6xGJ08aUIZ8pP70cdxlbxvZ4VYGAcmNcbZPrT3z5Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PyzYULSM6Zy+oQ7phepsWnsJd6XELhYnSfET2zLUcXOyGdu+4EfNJl4DtK61ot4X59ZqypbR9As4FJRM6i2BRSvD3RCA8D20Dy/vnKxUz1MR6K3qs1wnxOqWaJkycrxVFvpNLy0kdijfGhxv59Ks5gkdtNQWRMKhacrXZS0PSYd3kI8gbBxrBqAczmF+RVEzjvuYp4DGEhoEclU4IWbMBzUp+N9FVHGDG+zeVkDFQDfheeiPuhrShfJjm3xbJq7bmENOPwRlAKIsfXVB0kfFYM0YVt9gmidVbPFEtbp/kNbwZYYa2F8feEw79CEuzNa8bG0PhdcQu1ymzHsO1+oXk9pwpYQhSir914f8MxXgVuufCxgpflwcJImwsMQjcOWoE7TOaY4tcxbTzxwVUuVoibfXl7MmIVo3+QjQWNG+VBSQyIrUmydnTb10Z29JvRtK2MWChcZfwxSBLDfP6r5eJL+W0Z8e/XKhcpHRzUruEK1ZP0FJBG6KA7ui+MdW/mbU6LXg8wz8GIXnDlU52cYTDAmcR/u6zN8UfjlhN2qDOlLGa+PRG32S/l4QcJiP9RbfqmRWayhllBphXaQynjuNt50Z0wut8/QDarEO+Gg8IAtJNI341gx5hkSJmrIhXn7R
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b87eec1-9a7c-4dc9-0feb-08deb67b8f18
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:24:53.2323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6HHnMXCXx8Vh1laz2Fr8oqCGt0op19NnqjGL67xf3klsxi+iM8lg2k/MIfepfjszlHzDw+oyrskcjn6Mb0LBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2388
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate26-hz12 with 4gLDMg3Swmz1fxXg
X-cloud-security-connect: mail-northeuropeazon11021127.outbound.protection.outlook.com[52.101.65.127], TLS=1, IP=52.101.65.127
X-cloud-security-Digest: 9af9ce4998a463d39e1ebdc8a190d1cf
X-cloud-security: scantime:1.349
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127120

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches [1] and [2] mentioned in [3].

[1] https://github.com/nginx/nginx/commit/baef7fdac28e4e1fe26509b50b8d15603393e28e

[2] https://github.com/nginx/nginx/commit/39d7d0ba0799fcff6baee52b6525f45739593cfd

[3] https://security-tracker.debian.org/tracker/CVE-2026-42946

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../nginx-1.24.0/CVE-2026-42946-01.patch      | 46 ++++++++++
 .../nginx-1.24.0/CVE-2026-42946-02.patch      | 91 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  2 +
 3 files changed, 139 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-01.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-02.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-01.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-01.patch
new file mode 100644
index 0000000000..2418f69afc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-01.patch
@@ -0,0 +1,46 @@
+From 7b45e652cc7e91fbc60cbb5f41eb4608e706bc03 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 29 Apr 2026 21:56:51 +0400
+Subject: [PATCH 1/2] Upstream: reset parsing state after invalid status line
+
+Previously, it was possible to start parsing headers with a wrong
+parsing state after status line was not recognized, as a fallback
+used in the scgi and uwsgi modules.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-42946
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/baef7fdac28e4e1fe26509b50b8d15603393e28e]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/http/modules/ngx_http_scgi_module.c  | 1 +
+ src/http/modules/ngx_http_uwsgi_module.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/ngx_http_scgi_module.c
+index 9fc18dc..3259820 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -1029,6 +1029,7 @@ ngx_http_scgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_scgi_process_header;
++        r->state = 0;
+         return ngx_http_scgi_process_header(r);
+     }
+ 
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules/ngx_http_uwsgi_module.c
+index e4f721b..93bcad7 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -1257,6 +1257,7 @@ ngx_http_uwsgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_uwsgi_process_header;
++        r->state = 0;
+         return ngx_http_uwsgi_process_header(r);
+     }
+ 
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-02.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-02.patch
new file mode 100644
index 0000000000..089bd46a26
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-02.patch
@@ -0,0 +1,91 @@
+From 7b5bea14a2a7a784751a8f86559bd3c3f109ed5b Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 29 Apr 2026 23:02:20 +0400
+Subject: [PATCH 2/2] Upstream: fixed parsing of split status lines
+
+If the first response line was split across reads and it didn't appear
+a status line, the portion already processed was lost.  To preserve ABI,
+the change reuses r->header_name_start for proper backtracking on status
+line fallback.
+
+CVE: CVE-2026-42946
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/39d7d0ba0799fcff6baee52b6525f45739593cfd]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/http/modules/ngx_http_proxy_module.c | 5 +++++
+ src/http/modules/ngx_http_scgi_module.c  | 5 +++++
+ src/http/modules/ngx_http_uwsgi_module.c | 5 +++++
+ 3 files changed, 15 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_proxy_module.c b/src/http/modules/ngx_http_proxy_module.c
+index 9cc202c..19cbfa3 100644
+--- a/src/http/modules/ngx_http_proxy_module.c
++++ b/src/http/modules/ngx_http_proxy_module.c
+@@ -1814,6 +1814,10 @@ ngx_http_proxy_process_status_line(ngx_http_request_t *r)
+ 
+     u = r->upstream;
+ 
++    if (r->state == 0) {
++        r->header_name_start = u->buffer.pos;
++    }
++
+     rc = ngx_http_parse_status_line(r, &u->buffer, &ctx->status);
+ 
+     if (rc == NGX_AGAIN) {
+@@ -1821,6 +1825,7 @@ ngx_http_proxy_process_status_line(ngx_http_request_t *r)
+     }
+ 
+     if (rc == NGX_ERROR) {
++        u->buffer.pos = r->header_name_start;
+ 
+ #if (NGX_HTTP_CACHE)
+ 
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/ngx_http_scgi_module.c
+index 3259820..a04fd47 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -1021,6 +1021,10 @@ ngx_http_scgi_process_status_line(ngx_http_request_t *r)
+ 
+     u = r->upstream;
+ 
++    if (r->state == 0) {
++        r->header_name_start = u->buffer.pos;
++    }
++
+     rc = ngx_http_parse_status_line(r, &u->buffer, status);
+ 
+     if (rc == NGX_AGAIN) {
+@@ -1029,6 +1033,7 @@ ngx_http_scgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_scgi_process_header;
++        u->buffer.pos = r->header_name_start;
+         r->state = 0;
+         return ngx_http_scgi_process_header(r);
+     }
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules/ngx_http_uwsgi_module.c
+index 93bcad7..749254f 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -1249,6 +1249,10 @@ ngx_http_uwsgi_process_status_line(ngx_http_request_t *r)
+ 
+     u = r->upstream;
+ 
++    if (r->state == 0) {
++        r->header_name_start = u->buffer.pos;
++    }
++
+     rc = ngx_http_parse_status_line(r, &u->buffer, status);
+ 
+     if (rc == NGX_AGAIN) {
+@@ -1257,6 +1261,7 @@ ngx_http_uwsgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_uwsgi_process_header;
++        u->buffer.pos = r->header_name_start;
+         r->state = 0;
+         return ngx_http_uwsgi_process_header(r);
+     }
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index f9e40fa27f..26352a8814 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -12,6 +12,8 @@ SRC_URI:append = " \
                   file://CVE-2026-40701.patch \
                   file://CVE-2026-42934.patch \
                   file://CVE-2026-42945.patch \
+                  file://CVE-2026-42946-01.patch \
+                  file://CVE-2026-42946-02.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


