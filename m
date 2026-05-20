Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B527CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:31:00 +0000 (UTC)
Received: from mx-relay16-hz12-if1.hornetsecurity.com (mx-relay16-hz12-if1.hornetsecurity.com [94.100.139.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11011.1779280251772712896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=LT4MAQ1R;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.216, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate16-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.66.78, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=MZd3GFtkF82wdJuh2cEIR2bEvvrpfG83RGHIFOY0sU4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779280249;
 b=DWmsFfBASix9+DeWqpknuX/r6f04+xBIQa9ak7tWcbniQuQS+MeGBqPWrKmLxTmlnibhdUEN
 pOXrG69Wdfs2ue158U3Pc2uUqJZVMfyvlj24pVkktqO3r9vv+nPX+R9/1pj1uxndvoswEVGZtR/
 tN8vOydOQkC8a0kZ9VtN3nRxk7lTj+L7ev8sSWOgCmZ7srhnI3kMekLwnvMtltmB8GM8Cl/hhN4
 Xfh6pet/HjI3/HlDlSzPPKVeLOtLJkBbGze1NVrBjFLJaHwPL7hoiYesTpNd7evZcQR1zPuZxds
 48MTONBh1Cw4ax6SGGIJNtBNefZZReheW2+2/Qk+HldKQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779280249;
 b=r2K/41HlySe+v1AeguCDjCHfeoeV5bb/2zkgnHw1a9FvsSRgNxoirceqy6ANrtdkjopfde8W
 WtA2YL5AWRlLVjnUi+hn7vYBdqkCRpaDLQlvIBsgehOF9nkRZKQWQHq5xDFSgt5O9Yrj9FYOM25
 dv1ooPtoeAsLliEibw+Ck1+xq0Sm/3UPtiPNNFBaCR3fHW95aQ15plxkSSkc9LM2O0b4ESb3xQ8
 fHV36/R/J6HBVzyS1RvnHNzj9NnBci8zJWhgZjtcVjQ0EUoDFczHCILgvWeEz+zvHX7gZKdnOpA
 NI9c8SHz9AoKhFnUta6bZrk94QOJbo4e7DaM4VZJ8cGFQ==
Received: from mail-northeuropeazon11022078.outbound.protection.outlook.com ([52.101.66.78]) by mx-gate16-hz12;
 Wed, 20 May 2026 14:30:49 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS0gDI9Avl/v6muCoTmooApbAp5R1ZdWJffDYyZ/yFKoFW1+aF1lrWXj2+cOAfv/j3cpxMIV6hEKIRK9bGdJS6GAzspjJXgK2y2lZUGcO+KJdV8aePRDE5v00fh1zq1WkDiF+zVD0Tp6xGlf849KswcBvIYBYYhgx35SQDtITBbnIotd3+iCuNuR5ZClThk/6lmi9ZnKB6dHJchIJ4j2gZ+b0tpMGgzz8N/Rst/bjJBGaQ4mVLRatD2Rj/xZ/c7DGEUVUqdTOcq965JUa7qxLhk08XiEJ5TAhC3XkPwMCVfU6ApEzLf5/XKCkbTTokM/n1ABURDKzWqII03xOJURFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZd3GFtkF82wdJuh2cEIR2bEvvrpfG83RGHIFOY0sU4=;
 b=am52rBHGt2kjoGsV8b745+6tkPRzmYjYTcc6atIryQakjC9i4CuZJVyg7Xb75Okua0g0P43UmkysI7vsCtNw6Y6SPApINh4Asd0DhBMVLVpHP4lOpYILo7uYT0678HulVlr7jP4eblwoJv+aT3c7ZdvTzV/PLpsBEdoHrJiyiuZszg7VWts0LKmvMTQX4dkUNXkmim4yb8tek04gTEY82r4DekibFMauErfAfjvF/J/NEVLebzOgQcBJqrITlE1u2W3Jkea9XuX6mNgvo6j8iNZqDpn1e4fTOUw4vC2CkMT/5fD6awG4ridx14s+B4xhYmyrPz6X9r5GUoFUkTHtIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZd3GFtkF82wdJuh2cEIR2bEvvrpfG83RGHIFOY0sU4=;
 b=LT4MAQ1RUks8gW6o6DtVLKrWjoVKbOoHnfikwrgT+YJ4Wo7R4kJGdxJP/HV7V+I3JSNmJDh7PzfWwdB/w1HMtUGnW6FhL1PKHSnybrDEJYlyBNWGUBo7rLeZ289bxOcxaNBsUf4CBrrodnJFPC9NBzsGzDxevGW3BxLT9IYJ69zoIoBAJwXiJolQSTdYdOkO9UrM98YWk0M4wdi7G8LQbyYnl6lydEyTHa2gQgAiq6EUNOElKGgFUbBChd+RzcQ5QGhKxPwH1eNaGz6PqNbWeb96litRxO/vwn4/rzVxPQrmN5xMmxnvLX+gQ22yjTybKZ0lrNXZxWhJ6bEtGMIhXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AMBP192MB3401.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:75b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 20 May 2026 12:30:38 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 12:30:38 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/6] dnsmasq: Fix CVE-2026-4892
Date: Wed, 20 May 2026 14:29:06 +0200
Message-ID: <20260520122908.3151647-4-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
References: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AMBP192MB3401:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f04b8e-257e-46f0-c7f3-08deb66b996f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nH3v0zFZ5SAAcgX79hxVpMmuknTfV3Uq06PHc5jgI3Ry1PogHLtXIvb3Kw5h8iYqPjumz03YXPJD2MCxTyqQ256RRiVjGKSKBSqpvOM9yhV4Y8/RI4nvbhYCFKgAIpuLmD1/vLE0WrgqWVxjbH9qDNH4aaMCV1p8QGjdyS7qdM3T08J8JiX3VfYIEG/suQubWXPHuX2sBJDCgM6Hb5LW1Nzxo7n7Vmw3133g13mFVW7KXJvI0OX/wB7J9CV6YUDoTJq3v02f1ingwjJc46Ni8n/2CE04fzxxuloOoYiULxM3JCdL65t+YtqiMrEvrq1ZfPo5UdZkGI4VIY1BhbpZ6AVMqe0jXD6vS0R+yBc/M2g69+xAycxDR5ixbYRJwEQFLrax7tOkAWr7CVv9PVVsxTMS0AU2sfHk1mMnZ/lQw8/pbltws1isYNIMSl2/LIQLcc+6xUsKWgzNSSqyEK1C3qYlQfJmPPaZ5RAPK67RCwlrY/v3k770JTK+TU3QxtVKNfzdPmHVd165KCxh/D3he+wTwxxrHJ38Y+1ymT+t+EBYELk0n7v60zV//OOAufghmPvTLe9r6aDdgP/fSnfiDW5E4SpogLAzG3QedY+MH0sge9LFMPZSmHTYRSrJq9kOIvo5Ln/FiQxpwgwlyTOboQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W5vWrDx+sd/wZg3c45sSUAcEyR7ZtYtMm8Rs9b3hdtIXA228TQ0GGMsaTtTU?=
 =?us-ascii?Q?DCFSquiRlS7nuL8fdLERObGUll1yGDXpX7QMQl9ZeoxAHKSomf99WvlnN5Lg?=
 =?us-ascii?Q?dXrprnGCNku5L+xMuWDpnKz5x5BBSntlM45X7Nx45oaKF9O9cMnGgedzrJfq?=
 =?us-ascii?Q?rZ3SioGgIBR83R0FOgSd/UBGgHYDmsdG5anc1yjisTuH89XHQkkNpqOH9SdV?=
 =?us-ascii?Q?ITILhs9G2vBwbds/NErYffpXaXefSpp2iCiJE/7+ILYXsRIg7wBEgzvNDpVk?=
 =?us-ascii?Q?FOgBT+dPJjAfr+V2vIgf5KkP7jVHeVrRLyYrpK75iov2ogCyZSkKcY9BnSf0?=
 =?us-ascii?Q?+knVpPCYz5odBThVMztsAEx5KsuasOdo7R83DCa2oVUgw8u+VoPjNPYbgAuy?=
 =?us-ascii?Q?Zln2IvmsM0iMJXmGnpNEcFoU0AcxUt98VkONhJhra1S8YUeHBSxoCp36ufWm?=
 =?us-ascii?Q?rn3iLKLUtuvJGWsi15NSR8qFOR7FwIkRxRhzEYccD/aNsENVGSJgimJG7KWZ?=
 =?us-ascii?Q?mzoSmCTw+ME6Y+B4jMRn97kP3E4b1Y2XPQe+8CYqm0ycNYOdVUi4fVXwDTpz?=
 =?us-ascii?Q?opsAeaPfrErCvlgBt3AH/2RGa+TzJc3ED2MCHlpetZSIKGlWGKZVtAQZIEJt?=
 =?us-ascii?Q?kyCNJkils9D+/m5mJRxIoLv6OIIgdeAOfrWw6he+h+CEI33VT/butFJMSO8T?=
 =?us-ascii?Q?/aGgCtvHLT+L++IvOmbyO51Ex6BsKPdRKTmZW7gawV1FT39BY/hzFiC7+MiN?=
 =?us-ascii?Q?KSAImVpqhXBNru8Wv+VBodgJVbx05aTJuLC6OdGDqcwe5Dr2azfndRNIDJ/F?=
 =?us-ascii?Q?BqjkESCeP29uHwMCj9kRHdFicf1jGHP7pyStK7sbUQSD1SIKu/04lLNLiIk5?=
 =?us-ascii?Q?NCMADMq3sf06VbuqyLAEzTD9i8Bn3Sg4nMr63OSwDKWGb/x5jdwBJT5+80iF?=
 =?us-ascii?Q?nMbDQWK5aLq9P+VpDfUJFbF5xdt8aU2l9+EZO3va3TrWtSrXdgPaayBB33/B?=
 =?us-ascii?Q?OfNrqlJigSlLZ227u7ZphJr6zWUj9DVp7o12VWq41UGY09qqXcv2Xh3sOh5z?=
 =?us-ascii?Q?wOtEAWdxqVkeQOrkfBIfiRbEFBKV3kY8P3Y1EWjb/Hb9WwOe7qjx6m17e9fm?=
 =?us-ascii?Q?pvnEVbqGNpJDaCglTi2m9SSXgj2/uAmI1VPMW+fhsGkyDjwHQmF8bmUfefrH?=
 =?us-ascii?Q?OZWMCiXyz45XyGo823weMuN4H6i2JgSrlDYkdngd0X9F7v7nxfho0vXHZ3Ym?=
 =?us-ascii?Q?2mWwuADE/7/e7SOpfea7O/T58sje0DnaJ8yEnVVu1d3vpoRNcE82ssLTMH+x?=
 =?us-ascii?Q?60UZdKpzxIf4OsSEPY3YxL/zbTDquAmmcGctS4UALcCrBKNIM1cqPnkKK16I?=
 =?us-ascii?Q?SKFs2FmOpsKhGwRNXRKqvlq2pwbI01odEDE8vJR1Hgt2J/KBt8/cy40T0fbk?=
 =?us-ascii?Q?GqYAOm2kwJPrrTMQ4Hct4dbDfh91y6IAQbsjB3EDmmE+9NXV+z3qS6S/OFPM?=
 =?us-ascii?Q?jc3pp3KG4XKhUtrqAt40fHc1p9kWY1CSDJBE6BXugbwTPxT8INOf1WhwAXDZ?=
 =?us-ascii?Q?bYBpgYkEMVDvchGv7zoQGiINwFyG2kXrgk2F+O418pv3OZr4D79BfiVRZtXh?=
 =?us-ascii?Q?nJtPfhqKpllMdMjVz/66vh102jfoDNstQwGRzWOcC31NLBv1GUxSG1+HLFtG?=
 =?us-ascii?Q?n9kwbrlTeLiOwgc9KDnhcaMYLl9GYD1PIWO77wYxUs/RiQIvSGYdQ7MIu8j6?=
 =?us-ascii?Q?YoFWuufcqCRvkOyvjfheAypH7Hmy3gwNc3p6Eg9yjukz77CVIEHsDU8BjDrE?=
X-MS-Exchange-AntiSpam-MessageData-1: Js1VvbWSrtVxcA==
X-Exchange-RoutingPolicyChecked: 
	GEglh6iiUOBWHW1cgf3abA6IAqM7d2jer/sNWJ2vTFJ819tJVJ562Hnd/0sZAwk51zPmlvJM7fYyrF24IAMFNgKvOWtik+e0lLskjd4HlzKCj4GBTkN9Iq0A8a0/Awabd5QEijYKbEOIWhFg7OtKQew7YCx6LXtm9EvcAmS3jvpmC6DCZjiEI9JzwI0GtvInbmq9cPcOP/tauGMQBPr/QfmtE5WKhIIMPzPujkafC6NmRoiWynsOlvSNtM8a+vqCR0JjgPxbmrLfNx7eeJJB6ZdI4fm3s4swHkx0kFsIZ5iGmTjXOmHWSiPlSDCJvCI6tAaT1y8VQXZaCUNALT4WyA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fjn/RHW2ZfYfEJHGlz1ujSRdKSLzwHp2co/bZt+6aDcy6VqIxYXygTItNy67emXPuF03FpB1DMlZc0gMCS55CJFEhfO2kmmI3iPiZE3vkC0p9BPkIaEHeTDkEDSms1OR160Yy4xewl10XTavVHMRFtoXuA3VmwLU3vO5ZY9ycvv7VJBkzvX6M82zLnrJsItcEjsGBA/4WHmEbNtHN6e90Vd6LbWcpE5+x9aGhU6fo0UWh8VCPjPyC5A8LlXz+aibs/Luv/3PmR40wst2zxVP40D5AiY6PA05nL2qhiHg3dSEVhsEZISStRaI+T8DryQdeRXsla3JMgiTOGlz3WsgPu361/SmW+dU7n4qAym5PxTvMnKT94Mq7ycdDLf4jId9l45v7z/hhujeyIICQO71nUWDFixRDVK4GwoCegf/wPd4dXFFVwgzOT1KkIXQtWe5YNth7xfIjJNk+X34qcxm4patAkM1752OiGHA932beQ3L35o48/qv+cmf/IXXhSYAgdB09h5gTacqM65BQ9oYMc0M4Ysm7ZM0bIf71HWb5Z1St21auYEuWMka25DNShzXx3H4hSypETfNZaSJ+cuLXxVxxNEDaT8h2XSIOotBmVDEyJERFTFfi1R/6iw3o7cu
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f04b8e-257e-46f0-c7f3-08deb66b996f
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:30:38.6143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/ZwyEcV+UvH/Rn8ZCm8/eNDVNQtzoLUX1R+5qna36z3IKEf+GeCTUsDXMDQoLHmUTp9dMaI492i1iZkgjb/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate16-hz12 with 4gL9qh2s6Bz8tdM
X-cloud-security-connect: mail-northeuropeazon11022078.outbound.protection.outlook.com[52.101.66.78], TLS=1, IP=52.101.66.78
X-cloud-security-Digest: cc7bac3134fb76cc19bf06713566cfad
X-cloud-security: scantime:2.298
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127113

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.

[1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-4892.patch

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4892.patch         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index ed8708c339..e08d9df18e 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-2291.patch \
            file://CVE-2026-4890.patch \
            file://CVE-2026-4891.patch \
+           file://CVE-2026-4892.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
new file mode 100644
index 0000000000..148694a13f
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
@@ -0,0 +1,41 @@
+From 2f029069825270a3b91eb5f50bb8477ed7f761d3 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 25 Mar 2026 23:16:35 +0000
+Subject: [PATCH] Fix buffer overflow in helper.c with large CLIDs.
+ CVE-2026-4892
+
+Bug reported bt Royce M <royce@xchglabs.com>
+
+Location: helper.c:265-270
+DHCPv6 CLIDs can be up to 65535 bytes. When --dhcp-script is configured,
+the helper hex-encodes raw CLID bytes via sprintf("%.2x") into daemon->packet (5131 bytes).
+A 1000-byte CLID writes ~3000 bytes. The helper process retains root privileges.
+
+Note: log6_packet() correctly caps CLID to 100 bytes for logging, but the helper code path was missed.
+
+CVE: CVE-2026-4892
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=10e6b5b83e80749cba7b090d7780b29f908f0571]
+
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/helper.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/helper.c b/src/helper.c
+index b9da2259..3a31e618 100644
+--- a/src/helper.c
++++ b/src/helper.c
+@@ -261,8 +261,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+ 		      data.hostname_len + data.ed_len + data.clid_len, 1))
+ 	continue;
+ 
+-      /* CLID into packet */
+-      for (p = daemon->packet, i = 0; i < data.clid_len; i++)
++      /* CLID into packet: limit to 100 bytes to avoid overflowing buffer. */
++      for (p = daemon->packet, i = 0; i < data.clid_len && i < 100; i++)
+ 	{
+ 	  p += sprintf(p, "%.2x", buf[i]);
+ 	  if (i != data.clid_len - 1) 
+-- 
+2.43.0
+
-- 
2.43.0


