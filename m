Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300A2CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 14:25:01 +0000 (UTC)
Received: from mx-relay26-hz12-if1.hornetsecurity.com (mx-relay26-hz12-if1.hornetsecurity.com [94.100.139.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13452.1779287095951806304
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 07:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Tjye7Tyk;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.226, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate26-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.127, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=dcxvMQX4+U1SebB1nNai7RD7hZ8hs33WoxeL8bkFt7g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779287093;
 b=JhDiL+FCs1VQ9NF7PmXTsSmLcjUVZyPgE8iPtAywTnU5RdQilDT/RPPApZKXVygdy/ZkAkVO
 VNgeNd+aqtdd7EcVwR3kCQNNQ2CytzW2D0C0UfkQC49N2wFkQsL4fTALI8hrvnoQ1Rad0MMNfYJ
 oHjo3JjnpdxCrMxrhpRITfyHLsZ+1u/KTRwNJ6VS1ZxZ3MJuaOz1QOiQxePstCTOz0+0Eunn95L
 sFqu2UHMecEVYPzZr1dVWjXdH8wk4euR9r/iUjrXn63V10MNeAiILi5e/+tQVK+gEAu8VIA9j7T
 Uwl7uvW1AjAszkTGK7PJkszJxImMU3Zos9MSic34gLvlQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779287093;
 b=gJwFcSlIIKXBLO1LWCOtBAEBZgG2X/1ARzOZRVnwpYj7gGTN8Eyweb71ckAmKZMwHvB5w9+T
 m/6prZYNdCxGYOvUQCmXjEcViCtnjTR12Pe2JSRQboIKni03kOQOvtfvCfGKtV4jwOxs4CXoHW4
 LPPvuZvb1xuvxCAR/iqTmGeAMLLoXTCVIF96GprD39a5n89xJ0cYpajFqguhOlLizgchA1a4k14
 5PqGrBdktpfG1w5dQiVcIv9PEMQfjBmGxTJbiM9i1ur3OcM2gbSerJ5pQS62U4w6PvqWrHeejnq
 v1J8PTUQsgu756rIa89Z1+JJOhYuXK6SubF7CjQvQLl0Q==
Received: from mail-northeuropeazon11021127.outbound.protection.outlook.com ([52.101.65.127]) by mx-gate26-hz12;
 Wed, 20 May 2026 16:24:53 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaBuLo+OnB8zY6L0YbeeZheFybTNjApqArtSpETXJzEDgrXXX+hkywUREpOGxcZnNRaw8Hl8tUGYDlA7480QR4J2CEoaJPiw6jMaDxBal6sDAR4Q6fJ0W/jjn5CbJv98qx8cgjqN03p7riKDk0JHLyW9rbi+U8M+7BVz0Wq9Rye0i8tOzj5N6QzjpmECwGREt8xvEcIoNMJs0+oBId6svMkxQeV77N43bHiAVt+BBeim/rlifCUeNptY48kaIpwIan26m0HwmvD5XxLW7o104VlYBlg6DuLQOGaMcOfAttnMF/ZmrJa0rAbBrua29GX7XVxVIW1IBg3j9u/DacyLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcxvMQX4+U1SebB1nNai7RD7hZ8hs33WoxeL8bkFt7g=;
 b=hGj+xS3Eo1/FRQJKqKpLyLu5Gv9ZFOC8w+7QeRarkKitPtUzuHXAW0KSH6KogqBNlfNB6o4H2yiVmAShnKROmc9pcX/h4Lw6cs1yfQ3nkVi6Gs0xJEH12KYhLVpsj0TstaFdEIrEga0UBWeIllaYMiE08BhYZYrQna/0QsExMPkltc31oeNPlvMiTMHCDY3iuzMhlYLwKbzxL5MqWVbF0Tu7Pgv9GtO3tiL6jfjD0unbAXbduXJU76OGGHozfVXFIYOITTlcp1muxBsyvMVSbyHBJdhJpj9E58lfox6zweRtoYPvO/xrS1U63fwCRv5lA5t/Dqs1Lkw7eyLrYmDzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcxvMQX4+U1SebB1nNai7RD7hZ8hs33WoxeL8bkFt7g=;
 b=Tjye7Tyk9fM4Y4Qcvrh4kdzcUEnompE/YU2RdRAJxaTKV0Se3JqYjPkPCXrhZQXnbhhYLic5VgUq9kdi2nH3PQvsV3Y3H1xJ+Zczf1DykqqnkHhGjgVr/8ONl5VdQGFJ7y9ADN56IYNoWRPyp71gzTdBZJ4qP00Q3BXXhK2eJNdv3da7Mv0jw7nz7H46kv2AEN8+L99VPsdiKCpyInrZ1eIn+67Dnx+PzH+ds0Y2iJx9sS5dwFnMfIQV4No/Wz74Mba0ly6pxGstorqAz/EefpmRk2/CoglyKVDAltcBYa77Stb8f0afSOekqisyK+kK3EoHjsJEqyXcIiITrBwYYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PAWP192MB2388.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:24:46 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 14:24:46 +0000
From: tgaige.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [meta-webserver][scarthgap][PATCH 1/4] nginx: patch CVE-2026-40701
Date: Wed, 20 May 2026 16:24:35 +0200
Message-ID: <20260520142438.2126939-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PAWP192MB2388:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7c92cf-544f-4acc-dcc4-08deb67b8b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QlSsyApuD1dDKvmDj9w09dqDZPijEE5gtKbLAa3GPBu1/MkCV5thepn7i+gKCT8hizFfid6C6+TKJD8kSWr9I8G4ZGgKzwmdS0HfP1f/gxF8jcT/L+rNMoXyX4LedKyPVDExYsCfCBhJH3WkR6QeXTn/uhDQ+cx9kHwE0TIHIhOKA4KVo4FjAUNyH6ZVJxZcywDXFH79zOKW2oaMT6hYgl5JO0Z8V3kppboP0/DqJqGO1Uy4Ns6TyGWT77QBbyDpTN0x+WiJxjWYkOeUfviR2KJH35vNFnufG+rY38zMLRPrbtkgloNE52hpUVmRNHouykXczroYUrkxPKOXjyYsNrDuR0GQuTdPwf5UvgCP3JvRvtPCPEKj5qFjFCCycX2tFaazdPqSliS0O/5EmP84E+l/i8NfNoNS0ofmWM7jDhmOgf2tL3Mk5N0GTTbRDyXSOnS7YT8cN50UFnIAcmEWrtGVGKKHb2XMxRhHQHzDnRY1zjkhWtwQIm6tJw9Y7aLGHMiNFZZvymIak0Xoy4xZA+KUzgDcKqGYaxSjbymcdHNn+0nyEHFR25BTRMb61hO/+uprqBZSY4OZl2U0WCujIhyEJ1e9L/COD+OcFuhbLwSVVlsOUfh08jJBxEMfLxEkIGAm2RSdoQgpghd9p7/bZqK0tGlaehjmJZveBFFPllffWoq55WE4UkP9HX/gg0xPAFc+bWm5nXGhbjaeFHw9VNOQd/AStnsd9IVdCcciRDuOiAgqpna+bamLIGBZ7bPO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L7j1IxB2+hi/82nznjOEUU6p7o80WWY4ahPwpKPSaZKCHJRQxVi69eNejVJ+?=
 =?us-ascii?Q?twsqXpj+0RVj+FSpztbtqbN0dXUh1uUNfFDrzDfR95fcomxqVpSU8Fp7wBJO?=
 =?us-ascii?Q?vJHP+qUU5skzjyRG15kCqg/R095DFkwoJwmiJP/eYkF8d7oYy1ncPnMOhfli?=
 =?us-ascii?Q?eSmUVMf/hselC5FtgHrBdgua03L82WiPTAdZpDM7/Iz3vcHFcIIpGmk8bXpa?=
 =?us-ascii?Q?6y33Y6wQm5k7PIoy74bNy7hfgEO5US0pzZC/E1n5BFJLiWuc3KPrgSUG8/hc?=
 =?us-ascii?Q?dNzUIEoYbZ0LLG5m7+X7qSlu/arRx9jtiJ+iqZZBm+ivdT59VaDRtUJDejnj?=
 =?us-ascii?Q?/o+BXJll4Kd9o1DWqWa6bv0XIukVzHi9bnKFIHPKn+nYzsVmMkBKdRpuYUIV?=
 =?us-ascii?Q?kb2HoENPa0WW0USjAMPl0jC9XgTsWp4fuSVvrnsF8Sae541i5sE05jRR1LUo?=
 =?us-ascii?Q?YhyljYY32O0/vS5vUHfVvOxv1hBpLC9R2w8huA/Hmo0wlpZqKxoVZ4Bt0DMV?=
 =?us-ascii?Q?Z/acU5CnoKk9HogXWwBOVrk+2CmHrNOlRe6iojS6VDoT4459SeUirJ6XxEY6?=
 =?us-ascii?Q?DY59qk9PrnDHL1zY+4w8txDxapo43bM01HnuEAcLGRx0/aaZonNxUvAgu+PS?=
 =?us-ascii?Q?9h4JjPLzFpXYk+LHHyWBigo8m1QipeCf8JCsN15ghhsH22LTJMBZ5WPpQ0wc?=
 =?us-ascii?Q?IJfs9RMt/iTKu1Hzl12RmNLDmq84rYdw8I0c5pLx3lRflY1vAdH9FY8WuoII?=
 =?us-ascii?Q?SOegLslVygfZjwyHn93oJ3A0nNgF7j/4SGA2Vr6fAF862NHmkRr1WEV6rS39?=
 =?us-ascii?Q?thR9+ulYlUWG5HBMEcVRIvKtEjbEgPtZIPz4EOSfET6CVVqwL78Kythj4002?=
 =?us-ascii?Q?EgKA0+oXxFe+ZPV2yD9m1yBbv84mgyc/cBH/q5ctLGc/NYj5wEs4SubjrT+r?=
 =?us-ascii?Q?k77txFo9QOoNSdP289IAIanG7TAVcSPRLEKls+tqiItTe+j++Z5fEDV0x+g3?=
 =?us-ascii?Q?zrdLooPW+NcsAJQ1lNEZP02ZK1M+6UwUKvZ4hvlznuQ7EjoZlWXq22TIonD4?=
 =?us-ascii?Q?jLOKlahpTDVV/9agdewMwnbYfS9fG2LCJ+Qsa67mqBT8b3X+VECkbch7T0Io?=
 =?us-ascii?Q?sxopSgZkBvnjUD3nKqkA+OshZsK7SMvhoTgb8kDEZPwxF73RrP5f46ZhPvWT?=
 =?us-ascii?Q?wzOojCmGfMKJFQzdi/NA0Q4dnoSrIatuR1t1a94vdrMkR12r9W+CuZk1QZrN?=
 =?us-ascii?Q?BVCb9/5vFG0xWxYhFNcyINcfAxQpn5OU/d5tC1QW1zimOrhdyFSr2K8ukF7T?=
 =?us-ascii?Q?IOwXWgUZcynUqLR7fzS7D8JzmSpANa10wUqCqdho/v6S4sxpdYbLszvxRaDY?=
 =?us-ascii?Q?yvAaMI716w27s5w9Ql0lVQuuEXuOr1ZT4UKp3zV/R2Xfzn7iJn91naSdIGSj?=
 =?us-ascii?Q?Pzty7FxfT3rQPaTOvzwHMDoAOpLWjCOLvno5n+HnF8dTVIFS1Ie2RJj/MeYI?=
 =?us-ascii?Q?WIkTxblBRNsUzfIRFvvlKW3n6a6TYD/z5Q2SsQTszbP+GCUUvmSvb8Ic0IDj?=
 =?us-ascii?Q?vtJ1QdX1uYat/YirLo+nyC3DcyrQLlcUSIIHzIwCd2WMYwImBFQgE7sfoCvB?=
 =?us-ascii?Q?L6KwmX8BiCCDSKOgze9Djzy1tlCgMeVuEoee7NkeNyQd3mfN066if85rQ6Ug?=
 =?us-ascii?Q?g576YD+83/5c+gdDMhHs4xPJpSLauKIjrKrwCNpkW18ZDr9vcvd1XYnNUg6C?=
 =?us-ascii?Q?HLta4r/olw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Si4cVU7L7jw9YTHQntEmXi0wY4UPJOBVWFM1bgNMlJULG1TWMEJm6is7Lv/K8+fc7Rg3/w6C1r3aPWN336tt/rX+Hc7oGtdaoN5zlsqkSWx6AfNIcBQWslIspHdPOWfCJypfGYVC8rKCiyQrhmWRYWq4DRMlkD5j8mXaW/LcbMxa3k8fpvpBrt0XEXobDrhX0UfI/gCJ58+SHSWHDvmsqK+YxJ9n4LFpij4+yd24X2pKSE2Kwk3kvvNTV6LcTkiy1JADoNiaKswS0vXfb+KUBemBdG0NY1oskRaXbB19s6r3ktZORXnHJtNreUnPiFic1ViVzMKi0F5NXN815hT9Hg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YMdaIo0OJhCN1dTCT3M7kC8BfbHS7Quj7QC7/DUqDy8o76Geks1F61qRvUQHI1YtRd4NaX6uaBPiPHMaOTfoD5w8QwFLNmeW1mlOKbS5/VNRWwqA1BGAAp4RmdC3Awy65Eqoxed1qeFB+jgBENxPDtxt/1569jUiM8i8EphW9y+vZ+0XWsbxQVkWzmYArrj+NxEM/ZWnH+RlQTX603IJnmJ9y3vJ7AndoZ2FMKLdsXcXfQ7b9U4S3OHgzl4DEQw0iIQGEP7WZz7nNZUEdpm9NICUlL5dnUXR2GiRMxpSwxVcxBwJeF+A5NzuD9N8G4bRl8T1d+M9dRv5EFnTSoclKmtJ+6sTAu2hipYgCZzpkjUbLPhZnGFrW84F1T2Bxh1oeZ8s3gCbMSn3aQX3uqVLpLS93b5UTJ2puxhP2TQ5eUsxnhelEj3IZ2WNMsZ+D4NrW0QI/0NzrS8/gfx2uKjA6FU+Se6vYUQRaIdTnPsglVARD35o7UfD+5LP+rIk9TB6VRTcDyzXrxvIVnGbrufOolAhYpYGrbpZStsFp3gZfCm9g72cqbPgnsNj43lelIkNemVZCtCHZv7xGCTHAi6WaKQshm12JYtnRQNXeO5tzTI3uhEI0UZ9bbCJeQuyIpgD
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7c92cf-544f-4acc-dcc4-08deb67b8b01
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:24:46.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPaMcxdrIshbe2voLYiy7K0ELpEzAmDuRz8FZ/UjMo+h4qQ6UvJoLE2mdFe1G0nWSQTMmwsGMYX5OWWNjL+b+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2388
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate26-hz12 with 4gLDMP2KS2z1g3dN
X-cloud-security-connect: mail-northeuropeazon11021127.outbound.protection.outlook.com[52.101.65.127], TLS=1, IP=52.101.65.127
X-cloud-security-Digest: 7c87cb9dc62c55d1403ab723568188b8
X-cloud-security: scantime:1.389
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 14:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127117

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentioned in [2].

[1] https://github.com/nginx/nginx/commit/d2b8d47741820c9fb134c6731ecb40b21f3085b1

[2] https://security-tracker.debian.org/tracker/CVE-2026-40701

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-40701.patch   | 73 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-40701.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-40701.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-40701.patch
new file mode 100644
index 0000000000..63bd7bd24e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-40701.patch
@@ -0,0 +1,73 @@
+From 7abc2a59d5d65bb981be7cababb029d60c995719 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Tue, 21 Apr 2026 14:51:41 +0400
+Subject: [PATCH] OCSP: resolve cleanup on connection close
+
+Previously, when a client SSL connection was terminated (typically due to a
+timeout) while resolving an OCSP responder, the OCSP context was freed, but
+the resolve context was not.  This resulted in use-after-free on resolve
+completion.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-40701
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/d2b8d47741820c9fb134c6731ecb40b21f3085b1]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/event/ngx_event_openssl_stapling.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/event/ngx_event_openssl_stapling.c b/src/event/ngx_event_openssl_stapling.c
+index e3fa8c4..2aaf99b 100644
+--- a/src/event/ngx_event_openssl_stapling.c
++++ b/src/event/ngx_event_openssl_stapling.c
+@@ -111,6 +111,7 @@ struct ngx_ssl_ocsp_ctx_s {
+ 
+     ngx_resolver_t              *resolver;
+     ngx_msec_t                   resolver_timeout;
++    ngx_resolver_ctx_t          *resolve;
+ 
+     ngx_msec_t                   timeout;
+ 
+@@ -1303,6 +1304,10 @@ ngx_ssl_ocsp_done(ngx_ssl_ocsp_ctx_t *ctx)
+     ngx_log_debug0(NGX_LOG_DEBUG_EVENT, ctx->log, 0,
+                    "ssl ocsp done");
+ 
++    if (ctx->resolve) {
++        ngx_resolve_name_done(ctx->resolve);
++    }
++
+     if (ctx->peer.connection) {
+         ngx_close_connection(ctx->peer.connection);
+     }
+@@ -1395,7 +1400,10 @@ ngx_ssl_ocsp_request(ngx_ssl_ocsp_ctx_t *ctx)
+         resolve->data = ctx;
+         resolve->timeout = ctx->resolver_timeout;
+ 
++        ctx->resolve = resolve;
++
+         if (ngx_resolve_name(resolve) != NGX_OK) {
++            ctx->resolve = NULL;
+             ngx_ssl_ocsp_error(ctx);
+             return;
+         }
+@@ -1484,6 +1492,7 @@ ngx_ssl_ocsp_resolve_handler(ngx_resolver_ctx_t *resolve)
+     }
+ 
+     ngx_resolve_name_done(resolve);
++    ctx->resolve = NULL;
+ 
+     ngx_ssl_ocsp_connect(ctx);
+     return;
+@@ -1491,6 +1500,8 @@ ngx_ssl_ocsp_resolve_handler(ngx_resolver_ctx_t *resolve)
+ failed:
+ 
+     ngx_resolve_name_done(resolve);
++    ctx->resolve = NULL;
++
+     ngx_ssl_ocsp_error(ctx);
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index b732e92b18..b4bb1ccc67 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -9,6 +9,7 @@ SRC_URI:append = " \
                   file://CVE-2026-27654.patch \
                   file://CVE-2026-28753.patch \
                   file://CVE-2026-32647.patch \
+                  file://CVE-2026-40701.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


