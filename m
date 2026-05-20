Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396F8CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 14:25:11 +0000 (UTC)
Received: from mx-relay26-hz12-if1.hornetsecurity.com (mx-relay26-hz12-if1.hornetsecurity.com [94.100.139.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13459.1779287105200242470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=dTye0XNZ;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.226, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate26-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.127, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KVhfc2fntCc2LVq1LVpxC9d1UPWVsasygTHjgkPzNGQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779287103;
 b=oSamZkG4QHSvf2e7YUUdbwSfIDOBRoHYIn3Ltzq43o9fvkxbX37mqWri4dsEeRJlWwnAT4gX
 PVjAkQF4Z7mQK/khMU8Iajs00UqbTpi1oHHX7sWfAnWHhp1cLQEP2lmb48dCNP2SfvYfOv6Qrec
 W4g3Tn+8LZNBje+db+Qsx+WQYB9LNCmBlyOQlC8J5CU+dEDRA+OWuLXOCaBIXFrigeJrSJ12DpC
 6yesHYm9FGbi/TQZrIaXVgqLv9UD9tMiWCSDJbZg6WmA0azbrQl6selTkMLYK2/8OY4FbMVhk4J
 Wv3jpsTJJwTtut/V3qzG5aQvh85cS3th9W2FoxANIdBRQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779287103;
 b=o4S/xNBdfuXGiFEoN2RI4Kig+2fifxgUfwiwU3SqmiSgkOvbxXYgk5H7fgeJqSwDwfOCcUgR
 OV9rFoEO7qU3UKE27Wnbyf1TxV76zzmfkgiOHTb6cLMzzSYfH4JD7ScQzdgZ4ctPe7uxANhbTVb
 SL2dkAIkkPY7GUvVUvhG52e/Y/dCkdAP7j5Fzz8paMdWz+JRVgLLEx7RkXCoCwTSm6Bwl26Ic/g
 sezcgK/ABcI1Tkd9iX3c8/5sMRv97R2aVYNuYRjihehYFeTA74MxadSygDrkK9qRjPrQVEefnPG
 s69MqnXz7SE2jwLh+/uGPOX3vHXtl6wGXV22BPtPPHfiw==
Received: from mail-northeuropeazon11021127.outbound.protection.outlook.com ([52.101.65.127]) by mx-gate26-hz12;
 Wed, 20 May 2026 16:25:03 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUl1X0/OJpmZkpucmdZCDhM9pufWIvXtcwkTCjJDVCheyGkJek2YbxpeAdvmKm9EusheH47+gY/eY83icTv8ygI1bB6oOn87zImayOfRXP001jWnOwPcDvDvAuZ0nPC633yLRIQjmfYQWi2EjuIk6Zn9vS80FNjtKNYXY8n6S3DtqWDajNKm2IbkIB5jkrWUzceuHYu2QlFQpcIYviYVygTtRVay+ToXtuTSn+BVNfdfDxszlQvlEm5WrbE+JXcRPuwSTtkMe6BV3nbQgUywj6FWTCobsjWpO++lsZOkMeBkw2qDsZT2N5jER+Cuwioiug4+oO6Rh8hRXr2C+JUqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVhfc2fntCc2LVq1LVpxC9d1UPWVsasygTHjgkPzNGQ=;
 b=wjCp+s6Y28FgmCSisP63SKHdTq+9Kc129cssE7C+p0/GDfn/2r2+HTapcepIEm3rhgHT59w+OWFZCgDVaqOh8ik1rn07AJNzGtnqtarkTTzhiVMzn34ml7KURs8gSVoJElcI0Fi9NCiWyJN526Tkta/bzgyYYEtCAS/N4Ag4qkAfUatd4YOalQdWHWF+VLXt9qqvL4vTTksEqkY+xmUsNrGsGynjc9Z5YiVksC8AmzEAMV8bRUqGUJDWCqHaVicWv5cWGqGKNhmpVuvUM3uO1cs8q2ol1sQjRtNZR0ej5Nuavc/Hc+YiyF4TODBKg5z6hM91xXF+Jt9DRg9N+xu9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVhfc2fntCc2LVq1LVpxC9d1UPWVsasygTHjgkPzNGQ=;
 b=dTye0XNZXOIgkbR4aIgTCJ2bEAlqZZL/WO1aeLTdyuGE/lo6AD9cb27jLu/WXRIBf1q6pFkHOJdqlayIG0Zcu4R5uarC2sx2cPA+GheTPqvbQRtb0vpvZqv24ZQew0SDqQHgXDyF9yLVMl+jSGLruo0lPQl9OYhjpFxZQhaZUstnCK/k7bdcWWYrAsQPebPO7GPFkqgE5HXIBWbRn13uT/LiAhi/6k5HLf2JS340xaJYl/4E/Kocep3LtikRnbjnSBSDdKAztiolbPFwX1J6KgBO1YWlYybI7jQzLrchNrcfrkXFoFit3x1cBRj5u/tThU0jdQluGcftJN5pOyCTlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PAWP192MB2388.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:24:50 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 14:24:50 +0000
From: tgaige.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [meta-webserver][scarthgap][PATCH 3/4] nginx: patch CVE-2026-42945
Date: Wed, 20 May 2026 16:24:37 +0200
Message-ID: <20260520142438.2126939-3-tgaige.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7ab55540-883b-45a6-2692-08deb67b8db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/R1Bq9j29XMIWJLLdqh+IkxtlgVOESMSvyfOeSa2ZFpPkcalHCpgm1vzDBVY1ERqlnRemqV+jQd3HxRnKL2LlAO0p7tomi9ODQCBbcJ8swp8oDPwtvYOx1hzIH0DzR4Gb4I7X67VN3lI+M+g9yhLJX/RRHixbQKfTAgLVs4rtOJuHNT4/hn2Ab2ERdVJJeQFaXjg7erQYNdPU3pXH+YwMcSjXxCN38eLjpokoFpIm8QtCkuEhTzeXoiTlueN1b+GkGW6nGN9QwGDrJx9ZKilk9LQWewb8oTXK+Wt0/kTG10sPjIy1MjSXwDC0s8lysaw658atuzoci8ctsM1zSUCUuFIB6KoFCqW8HQEmrI2ueRB3/TLQyc4oQ4SZfLyNbPHq7RsZLrfs7kKpw1ldQfmHcsZbYrNMuBEun65Sqj3AIF92XT35Td3Twyj8+pACjITw9uwzlo5ZzwE2G/aUfpdpQxb1hYSa792/IAJRJgXIiL5JlRA4Y8DqtSZpXgQ6/GXsV4Q7KKHgaC9lVPH3FKxes72/Xtk5JoWbU0h8oXKPOnSjThfDr6QYJowIYqZChjo6DHLk6DZmOphUYK1f5lt2GPOBULAvYguQqHn51Cys9h1r7qWOiTZpEPkQ79Q6Uwn/oxtn3ITzPnxbgzggwiK/qsTvaT8p2rvxuDV455eTp/LzBGcuOg+sK0fYaN+gW3yoE5G1Cr1+8ChlmCIHJs/pJ12RISNvHBdEUhiM6aeO4YUfe2QbFSbk58Qhfgz43Yf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jw6OTuQNhMUsXprV0CqJ31t7TM4LmgHhddFDme6j3/o9qXQWgLGI4nczqMHy?=
 =?us-ascii?Q?nwnWtktq5r5YARpgjNwhBJttB7aN6jXwn02qNFLJAoxhIKndTyh+Z1QwpeHp?=
 =?us-ascii?Q?5IHutz/T36TOt4rDIOBL0c771G7bxg3PuBbClRX8RJ1+a3rloVoT9qWoT0ga?=
 =?us-ascii?Q?kS8hmJAN89lpRMLwCAkhdvAxUROeIC6FkODESMkw18g/fXAReNZD2hrol/EW?=
 =?us-ascii?Q?sew/rSzDFiHSSlUpcRa6Z5iwFMRQgaC/ntLY6X+yERbdNJ+I5PgxZ0fsmiJ/?=
 =?us-ascii?Q?geSn96cxewIHLWM35yBx8iVkI3KCJXyoi292NDynCU/xcx1KO6zg0cSFlbkr?=
 =?us-ascii?Q?8GyVK/sEW88fBMqFPbWwpwFj5oE6h8MlTmtiADLMpq0CIhwpRk1D/rcu/hii?=
 =?us-ascii?Q?lwgYsDw064wjYesH0Cs39jnK01HitC9dxVMK/8Kfra0O9mV53h5yq+kDeylQ?=
 =?us-ascii?Q?YAL8utCmEPSM9Cn1l3mVFpF2az/33C4BmHwUq9af2ePiJTHJPc4oJOTDbBvX?=
 =?us-ascii?Q?ZuRKGMJ36R4AR8MwuNyd+d0ynXPlTERHMANoVHHVkcOlIge+YsZqqkNVN2ZV?=
 =?us-ascii?Q?G9HuDaZIvTwZpiPCLxxTDI47KsgYN4HCsQlN05+Kjqs/Z3L5Dq2l/fHc1hDv?=
 =?us-ascii?Q?2ned28IQga361dIHKDtUelv2gRhYcsIeznvP3r3MftkMQWPTLY7lwUc2qxHg?=
 =?us-ascii?Q?Fl9F5nO2rqo5xaLdf+o5fkHJjfDCUKuq+5x7Kv5pUUT7x8c9JDaA0oY+W5wx?=
 =?us-ascii?Q?rk+Ni1NPz86rrI7G+OHGvCepQ0HnM78h0uoabqqbg90DhKZc0hOTRthDz75R?=
 =?us-ascii?Q?L1lXQNjI2zg4RrNfKiS9zhPrSIFrktzzmpXhuvTyrqRB6g68yA3+94i425yb?=
 =?us-ascii?Q?T1J83IDY9hv/Z3jfLGYG0AHTwmnhaAEGaR+mYWaLCVJgue3qyrsgaqrDkC9Y?=
 =?us-ascii?Q?WI+dmBS6JJvOgYOdVbjKesgAyWj4NuC4lEJHdeQCOxcI9T22u/F1pQOvCp3q?=
 =?us-ascii?Q?c4ja0dFgQUGKK0MhnSd2ECr/DZ5uujNn6/c49IKZyrNfbT4bkhNXVjtoKgQq?=
 =?us-ascii?Q?tby7Bd2ZYqu5/ziP8VrppK5eGy3T1zGMm2s3Cjs3bfkh5heRBTZyfOpUDGJS?=
 =?us-ascii?Q?GZ3M3KR75EOvAs2CZFYISoUeAH+8aSvK0h1AS33WNAzsMVYt8aXWoKaAnAo4?=
 =?us-ascii?Q?dsAbbO1tYdIaVj4lA2OCZ0HOmbgV7AhEomk4cd9xB4u9VlHPiKZqC0RCFqCZ?=
 =?us-ascii?Q?EiCohAcVffqmrmnPjNVdZL6iv+9UsGJAVSPJdgw1izXxjJ6fgypv99ioEF+e?=
 =?us-ascii?Q?xJI0IY6qHV4XL3ptfEXJRFNwfRJ9iaAwSGTZlZMqRUAeTCxn4+ch6cnxohm+?=
 =?us-ascii?Q?2qCto3E3iGzvH+s8RvTgKfhcqsJr6da+tDdUNeSLU/uSbJTWlNiZm18ZfQIh?=
 =?us-ascii?Q?MEbcBvXF2PwbKM63rHII4YiSiCt3BDOC5LHeeRDqeX2mJQZ8NgOepmyg9Ely?=
 =?us-ascii?Q?L6zq5bmosdp3xhuAlIgPWfA27gq/oDpVjRw3HplTWo2mOOnwzXQyKncvHfxb?=
 =?us-ascii?Q?AUII3eQqaMJFOc1ahyQy/3Z4M76wn9xL5lH6Jn/nL5rQvsO60dxq89Y1IqSS?=
 =?us-ascii?Q?QCIgehdJoGA3Gi8Z9WHMav+YkafHcG97RKrtaPim+95Vi83o4acQvVoXr/hT?=
 =?us-ascii?Q?u+na63dgifMH5jyn38HZCJXF4UoirQc6dfeVg2JxblLY3VaiYZAPPNuoOvlw?=
 =?us-ascii?Q?NzU+ZNxJJg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	a106zVML3aUP3zXEeYQ71wagr+3riLepI74NmGKohoIZ8R03QJHBrg0+NekIQbFQKwSYUzEiJR3MbFNN4AR/UrrZcCCIsFLZd9i9eg0OuOSIrtP0lZBU/MfNc1atdsZKrQprcqv6Rr63YIVz2RZxmrI5QGbfZ8prFzyDNq453YvGP7C/gdiigUrSRG/8Rpsiw9akEfOx4vc+2JTjddRnetdcPnpm91STeTnoJGZMDsRzDeO2shsUg5AplinUgSGY2/c27fTpIoM8W+5EDmIBCzcPdIVU7wDQON6gIHnl0BE7y9xhSg3zhIqUwnhaPdEEyLtPbztAwM5iil6ydQBlBg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BpeDAy5+zGrRHW/BeRfRq7Dyc+tFAA3v0ieArdpUAwXV65hjovemEb7iuZ+jUgLx0QUfwAOddXzGf1ZPKcN41QzKWIuGjcHV2Jqcg0VmBMsy2kRnMCOwG8kX+YNVNU4RmoGxe0Z8gH62KIXaQkwmX2MBY2gzeWPzAbqhZvqgnOTydTiDnQ7SBW4zeGvtyYCvP1bmqSrE8vlUOEZy1mxdnAYKonTEBSmo6wwvLcTOJdI/gQMCEOymEyuslaUdh4tQ6RXEZXLKowgJOn+9ZFz1swng62aivGjEZz0OKR/h+rQHNVI/W2irLxTcLlBdFLx0Y12jqj3SxDKzYHuGKHB57CgLstho5SbFE7cFmudvDRpoygRbjIf6HqXqWylJV8GnSh+jXdtJ31nC7eqVt00B93DJGOiXffjPxBN58U32+3Uu0tUqMHFBihkkqg3kj4BMFtYJhvkfsWuJswZ0Fkrg0kl3cnqdaw/M7e3DEgWUm9pdNSgW8HTTk/krEyTc/hI2pINEwY7EEet/2WewHdx0jF/hKGsYHnwpOi8dR+OV3m/bpdx0ergKfpuQT83p3KMSFbiflPZSTPWG6M30z+Wl48YGy5VrAYKSxNvgvkK3i234zDLTaO2WrpP9dzIhPqri
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab55540-883b-45a6-2692-08deb67b8db1
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:24:50.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7UGv+MtZueV7se9WxaJTJ9bFPPuEf6V9iWqBTZRJJOcq1Y4VS6jQYjjYI/7tGl4qqJslGx04RDG0dE3jzyAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2388
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate26-hz12 with 4gLDMZ2CG7z1g42p
X-cloud-security-connect: mail-northeuropeazon11021127.outbound.protection.outlook.com[52.101.65.127], TLS=1, IP=52.101.65.127
X-cloud-security-Digest: 356b3dbf2eae3145f61dd2e4f94a3877
X-cloud-security: scantime:1.338
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127119

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentioned in [2].

[1] https://github.com/nginx/nginx/commit/524977e7c534e87e5b55739fa74601c9f1102686

[2] https://security-tracker.debian.org/tracker/CVE-2026-42945

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-42945.patch   | 46 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch
new file mode 100644
index 0000000000..15abc875fb
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch
@@ -0,0 +1,46 @@
+From 3d990abc5cb4adc2368da603a419c9944aaa5f65 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Wed, 22 Apr 2026 09:39:31 +0400
+Subject: [PATCH] Rewrite: fixed escaping and possible buffer overrun
+
+The following code resulted in incorrect escaping of $1 and possible
+segfault:
+
+    location / {
+        rewrite ^(.*) /new?c=1;
+        set $myvar $1;
+        return 200 $myvar;
+    }
+
+If there were arguments in a rewrite's replacement string, the is_args flag
+was set and incorrectly never cleared.  This resulted in escaping applied
+to any captures evaluated afterwards in set or if.  Additionally buffer was
+allocated by ngx_http_script_complex_value_code() without escaping expected,
+thus this also resulted in buffer overrun and possible segfault.
+
+A similar issue was fixed in 74d939974d43.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-42945
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/524977e7c534e87e5b55739fa74601c9f1102686]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/http/ngx_http_script.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index a2b9f1b..2ea6113 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1202,6 +1202,7 @@ ngx_http_script_regex_end_code(ngx_http_script_engine_t *e)
+ 
+     r = e->request;
+ 
++    e->is_args = 0;
+     e->quote = 0;
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index 7a94cb6172..f9e40fa27f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -11,6 +11,7 @@ SRC_URI:append = " \
                   file://CVE-2026-32647.patch \
                   file://CVE-2026-40701.patch \
                   file://CVE-2026-42934.patch \
+                  file://CVE-2026-42945.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


