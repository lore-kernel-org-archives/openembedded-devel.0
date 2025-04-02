Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3116DC36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:29:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.123])
 by mx.groups.io with SMTP id smtpd.web10.5698.1743593362796255984
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Ios5NVlL;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZ+V9HFXljjCIBEGHxfYkYyWHmRGTMaTYVk41rmaMNIgU8vXTJzSuSuWr8lYmMNNVj9Xco633jpTyYyq3Xq6SgceFuEe0fd5Ragz9kLPnnfZQgpasX3A0mF+0P6tVcyiv7pAL3PWrR1FAZI224HFrt5V1lnJFd1Ltpck/NExgOTF2Ja1HFAayj/5CuYFW7WflQExRzYVroQIRbVAXTeDQEZvob7T8J+JR9XuxIl8TBjm+o7ZM9BuLbDqpvmeNsgzC7e1w+FCbEpfYHWitgzA304SDqfxM2pZgk9GasTZTXtrn8aE5HpZzHhIN1q57i/ElRpSJ6j328pWfRs3eKV8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAAsSKHiz8Gmj9dgHokZVz+9fpGzYjjCvc5Qrlu5sZE=;
 b=qTm2M8OjvUoJtP1XcXvUzKNahwKbk40jNBR/sBDTGk3YkxQRm2vMZ9+nbYSEjeKdIvtOSWJkBuwvtZSseMicpbt7LiHTbo+t/0yP0WzHXeUNCGcFLw8w6N7RnAFHivv1SnHXd1Nxvch2yLyjAef/bW7Hhj8OI1sBzbIJyotrYl9a+UcLFuHKi7U3glIhhplTMX3kvH5aXxQNu+DNtWtiU2Q0Rr7Xn8rw7/6jlSsV3xGx9RxU1w3nQPcMGl0snQ8BhKRu5e+e/zmUbLy2+i7pi8suN2sBrWbQu9TTnNynCerXu8c59kZuuHx46gsskrEnGcD0Atb55YI+FxDy0bRJzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAAsSKHiz8Gmj9dgHokZVz+9fpGzYjjCvc5Qrlu5sZE=;
 b=Ios5NVlL5UaA4/Hqba2YB+xM9CrPiRx/Hq+nSah53oQTrNbojrFYtK3zxTPRHx1u7wUosxp+wSriRFWDuD3ZrQuWkHB3SuYQTXpSUaiKVuaLflP5sidhKOmqWuAPgjuq/qMMJMhOnLqv82dQGBNkGenVC2DvgnegG48M+W0zh6X7j5BHRU6rESaKd79azLP2Tx5pDgMyu1EYx9IzOo1jTe0LdsyvFuCfc5Q0mK1SjzLkFKqAvvEHJvdYMMpuHVjgC0RLIWzZlaU6kfah3+JsUs/7tzkyUSm/QXJ2hvvvxuy4wR/KYUcsdoSptYCSlGR7u/AEIJMKCpujr+RolbXKtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by AS8PR06MB8332.eurprd06.prod.outlook.com (2603:10a6:20b:443::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Wed, 2 Apr
 2025 11:29:19 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:29:19 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/2] sdbus-c++: Support using alternative runtime D-Bus
Date: Wed,  2 Apr 2025 11:29:01 +0000
Message-ID: <20250402112901.3804235-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402112901.3804235-1-niko.mauno@vaisala.com>
References: <20250402112901.3804235-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::10) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|AS8PR06MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: e5961c5e-e213-4708-db20-08dd71d99be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Oj/PyhhyuyJAo2gs87jIj5rE4eMwqXklhZYJ5BjwSmoAMKrz9A/Sp/QOja/2?=
 =?us-ascii?Q?n9W4TVrFBI+TIaX5txhTcA4dSiYCRz8s5qPIkM5t+KSaE1f4vYRGATMVh/ML?=
 =?us-ascii?Q?3sVHhF71bjb2Dzwiw4Atajb3vTmiMWS8Yr/eae7Z0aDl/o5wNLWD168WKm2b?=
 =?us-ascii?Q?6gAWUo4zlMML+b57TlCnCvGxUCm2Pj2d30XM6ju4zN9XYzVv0WckVUjSPX+q?=
 =?us-ascii?Q?3lPt04CPKXgeETNfVoPG+2jyrF0z8ga+KeaCS7SF8OA4B1dEjiH0oAWtl3MW?=
 =?us-ascii?Q?sEi6An3vzLFp3Jz88GRtFP3cMPkSgl60cE+yykwA08FCTeSjNxTEfMsyQtHV?=
 =?us-ascii?Q?6QRX5k65hSEGI7sRcBsod6p4CVdaDQzA1mQ5XjlhR+aX/wlrYeJlrCeu2vaj?=
 =?us-ascii?Q?7Xvpr6Imq/+gqKfLiLvdU9Twi7Yt2XCyGoPpYawoN/p6GrGiQrTzLO5WdJTZ?=
 =?us-ascii?Q?HJ0dZeKcM8VPRM2PhFf5aZGLGGkhlS1Y8SnFsGPbdxPK0RO9LLLVeEbV09ax?=
 =?us-ascii?Q?06oBBevsbz9QwNMOP5lXjhtpzUouCRjt/+/RrBDG9lRk6704yIgBlxifd8sN?=
 =?us-ascii?Q?GM1JWNrI/Sd2R3m3CEyosdWHWEHJ6e/5qhH0DRyt+apf17QIz1bYVpaD9YVf?=
 =?us-ascii?Q?b5jO1bI5uEFOPUENkYsNpLB4hJQmxWLPTaNhyWDokVZnaQWl21S3QJh0nWB7?=
 =?us-ascii?Q?8pV2hPIZR79VWkFURTv9HdoxIBe8RYURs5MouN2pIeOY5xVbrAG/9xHeb8lE?=
 =?us-ascii?Q?c1D3DZDzu7h5I+n6zxn6vEmtkrl8Zc+8unGTXLohQjUMEW04n88MIEATrmem?=
 =?us-ascii?Q?VqDfioDwyGuO9ZH9irCaSzU+qfc4vdHgQ0qhCcqv7BiEUvaopDWaLUHEKOC5?=
 =?us-ascii?Q?63zqbPEjvq7dJv3fgue8xWxkfDcZ3txysKGiHfk1dIZhQkgr5ojEtKqtCOJI?=
 =?us-ascii?Q?n1cyRaGdzI3CYlPz08ReetVXL9bQ6M2b4gObnmNkHL0qMLMXe/vN5dOAnCCS?=
 =?us-ascii?Q?PD026gvvlXcTmpZwE0HMAc4L2KD/jNjTzpUHUSsrML10RWacZBKZTM5YbmwH?=
 =?us-ascii?Q?t1HQu4nM6m/lrPYJpoD2G9eRda/0ooeur6bGugFtolv7ltfTf5WLUH2uDqEN?=
 =?us-ascii?Q?+otfGiKzERRDpUNaGnLjlpqvnSkn80c7cZLdVJ/89+5cCmks2TY9AYloeeNZ?=
 =?us-ascii?Q?NFwQSSPGJoYRT5u/8GSy4ZDteSux6glO6fkjTbfufY7sVBTXNDGk+LDQtnUM?=
 =?us-ascii?Q?ibQvz4iL9tWTC8IsMVwPoS6/viByisHUz+24kuzgAlQXOXiPDQq5Bt/VMMms?=
 =?us-ascii?Q?SYueVPsrWhvNx7XQpMZja2qS02bNsK0l6lNH6fDEOKy/Jd+Eo+ec3wc3bjY9?=
 =?us-ascii?Q?1AtoTcBrUDgjy6fRF7+TA7umNqXabKdIO4uERqrSRDggsps6lWx5eyxXjyr7?=
 =?us-ascii?Q?g8/ufYpIonaqSroxP7FecQdHL9ix33Z2EeG3snbf9TuBGfQgdQtwvw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AcIwv3BzdRABpvTTj+dAB//blB9XzgRcNpdlwU3YomVeojCEJuPpQOBz1bkZ?=
 =?us-ascii?Q?7TbBnnEth6t/1gZys573YZ7ihuXmFgOwabhx/i7ygASxghXItprD500rtsk4?=
 =?us-ascii?Q?nmlWcgkeMkUvEX3RX0kXKj0A3Dq7jUAD64OVGT9hofrp9yywYbq9eoQIpEW/?=
 =?us-ascii?Q?hteB7msl5aN2E6EHZZc8ct5miGfwrE+Bmpr/wfIJkSODMI65fOiQeBNkzZNM?=
 =?us-ascii?Q?sNb0Pu71tic8WPPOX+ez4K5sLtzDX3NtUSXUNN/VmhtkWahbtb4XYCSD4UQA?=
 =?us-ascii?Q?TF5l+DDD/nlVl/UK3uzRkoopjOvqRL4Jvp0K2IKhpOtP/MBvCtxO1tqXNC0B?=
 =?us-ascii?Q?60NjQCK/d+04DWHHCr/4SgLSCHRK19Kq/W7J3/4mnR3TWqaeSjq0iZaWT/T5?=
 =?us-ascii?Q?jYWinW54daX8Gxfl96aAiMKNZ2KzXjWGHHKnvFEjZDlsVG4h+nM4axL6RfBm?=
 =?us-ascii?Q?TBaYqtYEO44Jixh9huxMNDZ+JQviPVtAkeuknqvSQixdeQsTjujzbpR74mO5?=
 =?us-ascii?Q?/ksJPIjka9XOSWGswqUHhMw0j4zpYv+jSQTY9bEUg6oPfxWu7hSpJKs0lZTe?=
 =?us-ascii?Q?aODTMXqM5J8wz5w6mwQKaMn7OUTtXMDlp5beaV9CWPJzhwlXgEPj6RHYZa5I?=
 =?us-ascii?Q?3FM6QYENGpZKlsFvj3NTFkLROB2+bb0F+ZqxrjpAar8aGFCK1OTOSLDhKbBT?=
 =?us-ascii?Q?mUXeJJhNrY0t3YYn461xU8y1XgnofchN3fyFnNYa+RQe9h5eWYrJW9BUKcbt?=
 =?us-ascii?Q?+CEGQEntMOIvjy/+14+MOofKFTIX4IhKit7T3EHEFnwtAovdC45Y1OpVZdau?=
 =?us-ascii?Q?bGaIC0UJ4YMKioMacrb3l1fWq8C0OlUZf63v7z42Uy9aVRjc7QRgMsfgdt40?=
 =?us-ascii?Q?cimRJqH8Ra6Vhg7sVySgap59iB/8lnjHQEy+SZHQCc1Dh7cdKAV+i71v0rQs?=
 =?us-ascii?Q?OZAxFdLkQ8pXnT4DZ0fMkqo8UK/WlYCef1pyKMOj3yhV9D+N1r5F0Qb7uDRU?=
 =?us-ascii?Q?RPpDaL6GxmMN2mxdvTG/6d41WXYYhfqH/W1C7sJ25MCYYWwe5qejeIQGARME?=
 =?us-ascii?Q?Tt9xk7oUtmxlZfsuajGvREjr1tFOAWBhpadC0YLR93aahA/aB9UYsMh8Ykkc?=
 =?us-ascii?Q?WZfo2hv8FxMIQBlvNexQObemGtsNpyqHd5ylUzHUiwu7oSz+wE89ASEDABxu?=
 =?us-ascii?Q?aucESp0JYn1Z3uL+cERuDqT7CghNVQOQu73TFqzInCqEmTrmiGmi+HRVIJ1T?=
 =?us-ascii?Q?W7tBe3J4AGjOnscCkI44TIYpp9ig47T7fALcww6onSPd9KhDoW6HvBxqI3j+?=
 =?us-ascii?Q?eI+dw5RpKGojn9mnq8Vpwt/xYF3S0CRz9AfgFK1d3S8DLrSTWlYSKYKLDwe+?=
 =?us-ascii?Q?5L2mmJfg6heIs1iGwbxA3MWkCqP2rxc8ZytpN2uBmhYnnWVTye5dzmJziBIN?=
 =?us-ascii?Q?9dDkFi8Ka3G4N6cueRJWVZ8uW1UJ5x9aOd+gLIcl9qUL9uWXztkS5733q4vP?=
 =?us-ascii?Q?EvNCZNo/pdW6fxKFA32PlXYmxoOV8aXmoiQ/PgGrIVslcMAD7coKPdtts/M6?=
 =?us-ascii?Q?Wn5JLNfgdnrruTGMnNoC648FBYknOff/wtqQ5rLu85xRBjcvIvx54aTa26xs?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5961c5e-e213-4708-db20-08dd71d99be5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:29:19.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQvQJNnbAY123mhvmLAACMjo0ahiz5Xu56wYjS84bY9rC8jKkk8DQ6VqRF4ZQQhA4oDlPTaW81uoZTw6WfgolQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8332
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 11:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116523

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-oe/re=
cipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
index 2b6bb1011a..a3e7c9ab54 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
@@ -46,6 +46,6 @@ do_install_ptest() {
 FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
 FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
=20
-RDEPENDS:${PN}-ptest +=3D "dbus"
+RDEPENDS:${PN}-ptest +=3D "${VIRTUAL-RUNTIME_dbus}"
 # It adds -isystem which is spurious, no idea where it gets it from
 CCACHE_DISABLE =3D "1"
--=20
2.39.5


