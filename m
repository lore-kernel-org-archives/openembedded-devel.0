Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDD8D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:55:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18449.1764582908425127340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/Lg+KUA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/Lg+KUA;
 spf=pass (domain: arm.com, ip: 52.101.69.25, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NW5pn08BdiLL4auPad/h9vpy5Rg7y62MF0J8DgLA77eBZ/DEzpr+kx8FpHVwyKPpqq3aDcrRcupaadhHG1jwk7wMYQiSPIpRtpLaORBP3wbr9f3js11YPQL3Bp80IJYdXbzRgs253VavOcWpyxrse9halbLsFb4Fh9NYplQlBZSWyYcTz+clziGLtWN7Iwe8a2yQxPbruMPQbiUgIYvvsgH8opqznOW9BPGEf5DjNdfqGCgA9QpxeGTgyR6KPQkNprrUCzXS1Q67dIJRu8zwxgsVuauy+CoftkMlZmgfl7kkwlFU9Lk4GVLl7Lk450FV33JUYUJP7Em0On+ckQrKdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN7aGKr/Ug/syMtxqV3I9VskDFTG/HXg5xhoHTPkNdI=;
 b=tKNDMmRKr8PdhsNkwNkTifeecJK/MykRvupyIeU6XxHrMaCgLET7ODaWrG1fdGve6nc4g6owffkiWinigpEMCeYeYSEC8dzO+/ckM6Y5rphfA94+BSHzyWIMwz2+cNjCrHsl/AyAZh95J5Y76gxfCQG4mhB9T+0IcqNluX27ZzkpPWEQs4g/PngqM945zIvshiLZjxNyS0e+6Rj2EXbcst+/fGH3DzLDX1wCDGnAysTq//KMxFnDfCz89y+5y8HGDeeGLUbVpZ95LFYBsWs/OAzQnPKsgzyXYzlyt3U6ygMhwzurnv+HWiKvsv3B+lD0dSU6DBURuyAudniFkVlGOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN7aGKr/Ug/syMtxqV3I9VskDFTG/HXg5xhoHTPkNdI=;
 b=B/Lg+KUAS3zwwoQdsZ546zNdBpkubCm51wMZRSBYUVao6Xsm3yOdMTs+MDFnZ2A1ZYRPAbY2uSGKb51uy3LzJb6AN6XfoZ6MS6E1B90ubBLahHXvZymBXb5H+O0GOQI2GyHaUA0amn5vm9jIMmgSA5oGIm2BwoRV7BQ9r9L05eM=
Received: from DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) by AS2PR08MB9152.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:54:59 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::11) by DUZPR01CA0047.outlook.office365.com
 (2603:10a6:10:469::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 09:54:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jI0+EjnLGS9xTntf6IsMBZkkKfG2QqgacrXxeJmGL2UIPQabcGvyeLfUad8Nyd9Tgq4mzadSouV8Vas29uJ5m3v0zZ7Xw+sUCbTRAfj8fZsyukWibDu7ao9hrt4AHLIksbNMC6Vyg3yJ3WgO090ZAxOmEhX6Ig8uHpoivtWA6KJkuCBNRugLq1DJnsFevsYG8HD8Z+yAeHX9WYmQRkG6RjNEyNq+/JHVCboigDobdtj0YAZn7XLnRTnqmeFL0BgbIb8IxOxKrGVW6IOsSgkPhhGJEoUzuD6iBQmME/BEBOy2bd/boe+dA6dNiMyA18r/KrHEEQJGpy+VpBsQIVgW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN7aGKr/Ug/syMtxqV3I9VskDFTG/HXg5xhoHTPkNdI=;
 b=ZSm9Q1Afo4LTbV44fp+YbA+ctXXMZJiiXRrXZJEexJ9RLQZR/M/VpbEWBCFOy2J8fJ8b63xdO23EFgl8S9MdlnKhqyRFZMQTSC50zf4hB4LmA6ivmLjmx0UmNz3etNkufIeBsuA6nDZs7cTSI/a55ycApF8F6MQ4x25DlZSM193SVme9+oYzlitKonsxOMDNrFcdQ+8LQkb5qSUE4N4tNppDyalbSe+72Ht/h/aHSstfFk3VbLfKBt92z/1IH3sjhxfQA1QMwjHXlGX/NSIJeNsrvThEJbFs1RisXB+bcTWvR+HbjeQkga1t+DNoiqhITFlDMdQ7LNhGsx0++E1syw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN7aGKr/Ug/syMtxqV3I9VskDFTG/HXg5xhoHTPkNdI=;
 b=B/Lg+KUAS3zwwoQdsZ546zNdBpkubCm51wMZRSBYUVao6Xsm3yOdMTs+MDFnZ2A1ZYRPAbY2uSGKb51uy3LzJb6AN6XfoZ6MS6E1B90ubBLahHXvZymBXb5H+O0GOQI2GyHaUA0amn5vm9jIMmgSA5oGIm2BwoRV7BQ9r9L05eM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8098.eurprd08.prod.outlook.com (2603:10a6:150:76::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:53:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:53:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] hdf5: add pkgconfig-native as DEPENDS
 explicitly
Thread-Topic: [oe] [meta-oe][PATCH] hdf5: add pkgconfig-native as DEPENDS
 explicitly
Thread-Index: AQHcYotviT7S1guI1U2EyjUEPfdx8rUMi6qA
Date: Mon, 1 Dec 2025 09:53:53 +0000
Message-ID: <76EB605C-6B49-48E9-84F0-77AD6B8E95E7@arm.com>
References: <20251201062620.2517114-1-changqing.li@windriver.com>
In-Reply-To: <20251201062620.2517114-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8098:EE_|DB3PEPF0000885A:EE_|AS2PR08MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ec0ab5-ba4c-4198-f8b7-08de30bfb03d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?CzaJPhU5/Y2QBB/9+TeMy/MeOag4e3QnU07vEAItV3aKZlJ9zAvfDGcQNq2u?=
 =?us-ascii?Q?N0GrKp/hsvXermKMTxpm/BEXjpP2Q7Nf059VBPRifl0d6g0PSiGpOihfKt7e?=
 =?us-ascii?Q?Ekyc6a3ZDJ62cTJ+Cz7pa8MAsFJ6Zc+LXdPsGX+9tnm5LE3r+7dqjIgvwRyb?=
 =?us-ascii?Q?DnG0FtfKojb+1rgPJ4DLsgDHOWaDzNb/q/y9t3+KWW2hc4gcklDUIGUMJ2Y/?=
 =?us-ascii?Q?j3+/WaZApyBkB/wxeZuCGFBRb7zQKFo/vl5Wb8Lrnf4Qc7+Xi3P8TUqK4pGn?=
 =?us-ascii?Q?ZO35LYfqj+lbZS/BKmHi68ELU6Jd0gUTCihU+CwAy4d6jSdA+LaKh4HcaPqr?=
 =?us-ascii?Q?DRWE0Wsk5ZF6NmyGsTXYswl2pglMCMS3KFYj3lRPSdQnO5HwWFZdXi0iRjzM?=
 =?us-ascii?Q?zYILUKVOxeVnv99daBqImA49JDCDMYLg5GIzFpqiiv1t/v59yOopD6ZwNxqu?=
 =?us-ascii?Q?veEJStJ2jr2fq7h9omIwLm+E5/eoBEh6+C6KOKlt6Fnt1m86nJA0yIS30p6X?=
 =?us-ascii?Q?dM7GXmq+eAkdoGHftft9OdorqujD5BefU9XtU4XdOqgikFfqoNb8Fqh8HXja?=
 =?us-ascii?Q?+guerZbtj0XIegBR7kHi81wO6+wIqNqiOd4TZP45fdJTmA6kpWEdZrdOomCB?=
 =?us-ascii?Q?r25uN8wUinZL6e7qEiP9r3rKmbxUfsEbt8GLNFxvU8KGA+RzY9fX3Qaj0In+?=
 =?us-ascii?Q?b9YZAL41VcsXAH7/VXqClxhTEC9GVZpbRAZWJCgBxV0pIWX+D2rHDo4i5ini?=
 =?us-ascii?Q?pqKGZAfBEt75MnncOzZ7v+jzmASyEhvbZO8p4+xVGJvOR1mbm0gDetiPSin9?=
 =?us-ascii?Q?Qxnw2H+p/JSEATsXaFh/Q4Gh7m+Zkp2WgGrr4rGFmHcKmN84BAt/ZL8S6hHD?=
 =?us-ascii?Q?6hxQD/t05YZg+R12UYovA9Gh+DsRpKiuSizG3YUd0q0eXqAW7RQCKbNysoO+?=
 =?us-ascii?Q?ylxqMqEcB7axU4I9wE0TtQjOc4SVxWBwjfKfEj3cHkPqPZwwBxy/gCjQS6Y/?=
 =?us-ascii?Q?9PAeaVT7HKf/vuwoNJjlnd/6cwWb99TpRzb9EWSzhmXc9znFmeSDdGP0Ya3V?=
 =?us-ascii?Q?HB1u8mz1K5qnWs8DLIf9V6e+bZ9aBqCHw1KSakHChlyrK5qT6ijg9bGkCEAO?=
 =?us-ascii?Q?2F+HfTuuedqrCkWpYIkrxroeQ/+KPn2tQfVEOPwtvyQIZEA9LFdWZu9giTEl?=
 =?us-ascii?Q?1yMV37K5AmHEgwE212GLZ9Czkn5H9UP46wZzThhOzJZVmRa91sta0eiu8jP9?=
 =?us-ascii?Q?CG2+DKEBi7LKBAf6wSDP38HamRpdImaaLKKtnPWvyiW+eNFH+BF1Mjp3E+Z8?=
 =?us-ascii?Q?EhbSx6QG9fSCZw8NUeF1P8xn6nwCMV4kPqC6RMYYbiciUaNDwOv1mE8Wicp7?=
 =?us-ascii?Q?KADCsrNr2hgji8iCxGSasNbwhI56ZhiukqTBFvL1RQtNdZjV+tN80zPVL77I?=
 =?us-ascii?Q?2zoJMu8JFVL6wcFMMJFAkyI47PjF0aOnqfsGmzNv1CXhVP4DMM/8YrhxU158?=
 =?us-ascii?Q?veoWp1lpuAJEl9NLgMUH4gINNTMzeX24kaYN?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AAA54663B8078341A7921451E1E4F60A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8098
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4fab8055-b415-4c72-132a-08de30bf8988
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w7Nboex4I3z7Iut7Z72jlUT+nCu/N6MaHR/6DDNldzrxAx0LK4vHYu/WjEwp?=
 =?us-ascii?Q?BScN6EKmzPGhG83fnUp63utoud742P9vgKUCSPSSC4ONA4d7hnvTAhUs/s/D?=
 =?us-ascii?Q?FE2MUd1/Mfq/t3cIGMwPl05J16ywe5p4M9qXsssMrVvHAzm5zmZHx88OKQIO?=
 =?us-ascii?Q?ehTGi5cy2fDbKwxfb8axedkkOhV/STdm7UDXZpN6psMnixrYO3ObHOwy+tNN?=
 =?us-ascii?Q?qgakS9FqgTTWYApeEHvKAv/zz9gNJdKJ0QgI2WJJzWoMAU+fxjPEL6B+tfU0?=
 =?us-ascii?Q?X3Idabuhk3EUnBVXp0dFrASE9KNoeuZOi32jTl6PHHyAXZI+DbO8JiRFoxRz?=
 =?us-ascii?Q?u0LMfAugKvIZVDhxgmImcSvMJ3m6JGYQprue5olr/6Bbt6d3NfdhpZLAiohu?=
 =?us-ascii?Q?e7TusYPnrqg1ASNJIk7jPoQyM4eRzvPSUjdLiAotz8Y5vfo+s2/I27a/ZVkC?=
 =?us-ascii?Q?t6Zn/d+YL1qZQgGoj/Yx5Ggy9ak/jjlj+QfwMyqVVVd8a4DjEXCavM4vLReU?=
 =?us-ascii?Q?n08eUerMB0BiCsAubHEhLxAmwF5I1JnDcleQjO53Hd/hjFLhF0aHWjOpU7kE?=
 =?us-ascii?Q?8IjjjiUUNE9RhwadvVVnbO1fNXmNwb2ulQS6o7aS09aaXwiVBFTwSEuMrpqX?=
 =?us-ascii?Q?ftzHynDsOen7+Zflab1x/1Ax29g3+rfPD4MskfyBZEvW7FwWZtvRMxIQz0N+?=
 =?us-ascii?Q?gCUW4cFn69DI+qkTGNAseRxX2pBz5gzZXd8UuYGaiRrL8tjwh/aeDuaJGtuI?=
 =?us-ascii?Q?bUswFb0HNu+4qRSmHbykkHx2BTryISh6ynUb3+ZZwyUY9s6H2/tQxDV6F0Hr?=
 =?us-ascii?Q?ruZAjvRRxM63EgjnuQ6YnkVeqQBnnvoKtbarZAX1ZI3YDgBtoyheboXsgF0n?=
 =?us-ascii?Q?F0P+3h+YAVYgckPV9jCIY22+CQJ1xofFKKeTO0jdz9bA6ARYj+zrQKNFLI/r?=
 =?us-ascii?Q?+myIJg4BrrOQAGm7ldy/RSeXBQgC9dHg26awuXfLiI+TKDQ2q3+z/gPkf2RE?=
 =?us-ascii?Q?iKPJxsNjlaEFU6XvWs/6DZYjHda4xXgtY8jysFEJ53fH2Ix3OBMKyFJotZZr?=
 =?us-ascii?Q?cgO6DM7rUGidfMgRcEZ3bSXc27zjCjtL28ojUhV+zHqfzQaK6/JDr28Fa735?=
 =?us-ascii?Q?WYCSJcazqSRZdE9ypYCduEExRmZOGe4tz71PyrXmtP4lSLf30kxlnp+2I2l6?=
 =?us-ascii?Q?UH0RN5yPXAMxp0TCt4sr281owzs/vq85AzYpVgJ2yD1FKfNaJRb7bwWZoabi?=
 =?us-ascii?Q?hpthJ1FPXFSXuYIqI7RJMxUQJSMvtvq9fym8Joag7O2iFdK/j/TAH0ygbuPk?=
 =?us-ascii?Q?SbMH9P279eDk0Iu1WeM/O3A9HpexQ9cz4jLrM7Z2DEroaxnMXLpnVFJUUSY2?=
 =?us-ascii?Q?o6Ej1lkyJPFf0lyM7sUd4pCnMCC781abMrAQlMKmki3VbZdlm449DrIsMcWk?=
 =?us-ascii?Q?4BhOJLhL/UEzAeGal2s3WwJhx+CKfxX1MhOucS4cmnmCMta3rV35zR2qYslH?=
 =?us-ascii?Q?7vrCDuJNilZE7AU1fI4Eug6Y96RHi9AAF0aMnIlYG0M2aGUT+vqjrEdr4299?=
 =?us-ascii?Q?94xQbu4GYJNTWcG4Jmk=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:54:58.6474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ec0ab5-ba4c-4198-f8b7-08de30bfb03d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9152
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122200

On 1 Dec 2025, at 06:26, Changqing Li via lists.openembedded.org <changqing=
.li=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Add pkgconfig-native as DEPENDS explicitly, this can avoid install
> conflict when enable multilib when pkgconfig is installed on host,
> and also improve build reproducibility

Convention is to inherit pkgconfig.

Ross=

