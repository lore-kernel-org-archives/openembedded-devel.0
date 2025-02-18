Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD24C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 14:10:51 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.72])
 by mx.groups.io with SMTP id smtpd.web11.20221.1739887845721861830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Feb 2025 06:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=tTXioHwr;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.72, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMW4quo/sObUrALEzbNPa7sO7lsT3AO69SPAMTE3eMQvl/mjxO17QM0N2vLFzCXn/xVkSjk4H9tnjwp6Fvp5+a2iUF6ajK9D2DJfX45SPZvIVRjrWwaTWSXCcNyu3tV7kLkU8H6VZzJCnSoANAjfxarL7clr+jPuBz92EnUTS5ycHam3AH3QhApiJN11w+nBjrrAQvimlMDwgeS69Qez7hbBp7JcIs/uwDGJmDIpa9KnCpRTy47fR7rYGXVS7tnUVkxr6Mk03DrE0X4CGkjmcIxfzHl164EnhMcdkeFcP/14z+6wC1x4s3jZtn/5xQzJu2XzTnNXLcaXo7uT/3uQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKt6yufalkzvi0uWk5nTGGsZ/JglyuNPX/yxwjzTY6Y=;
 b=LQNIGaHVjB9C81dLVSK3oYGKZMiv/Xer5y4KtmK39JXquaWcsAXI8YoAueYL9hqX+CHl+7DsdogSmLS1Gycrpsz64HzdON+9amPrsqN/bMkp57Xu/e2+yksTH8BhE39JCLSJIVY8a9dz2VKQ/9z5SI7vNOtvxE0afNqG/DJnjjSCbDZ9tCzSt7xY4lhTm+H2NAX0MwQIJWvoPu8/k4mGc1Eh2aUht6PhUWhMCuCvZf8hYjmQuGzHzsZqzK9XFopUamnnJ2TDKG67Dme4kUiFu7G0M8r8CAgrXVwecbrnNmLNL9mUK68AWkImpcZAXKG5CD4XC6iXr7nOW5aWN62oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKt6yufalkzvi0uWk5nTGGsZ/JglyuNPX/yxwjzTY6Y=;
 b=tTXioHwrsZ0I3Aj5ZAb+35DF5Rp93nkoBOVoIn3QqwU8ia6nyOVwo0y5dugARpyTb3669qv5pef5E5CAoo8qfTxjhF7ABRKhIUU9sb8uAMr6RgbFI67uJ3XRtsd4+jL6uJTFXpkQnu2SeXhajlnpvzO+1OW4BXiBzotte37zSrLJoEo6Fvgun8QjAyQVxnBvt04ZwdsXGOqf0ngOxFKxKfm5QTIOQM1c2p1gzJYuEvmi/9T35lKaZ+lnmcPwIN5pQt4FcSOtwHYH9J6r6kD8w79kaUev1BMV2KG1YkTQwIfKfkFkXMwJPHCWwv0w1qDoXPo1YtNwObsKleRkPf9MbA==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.14; Tue, 18 Feb 2025 14:10:43 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%5]) with mapi id 15.20.8445.016; Tue, 18 Feb 2025
 14:10:43 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH] poco: fix branch: master =>
 poco-1.12.5
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] poco: fix branch: master =>
 poco-1.12.5
Thread-Index: AQHbeL+jEqjvJvULzUyY6ZbVnMQ9P7NNK6MA
Date: Tue, 18 Feb 2025 14:10:42 +0000
Message-ID: 
 <DM8PR12MB5430438CB26D5B31AC4A2AD28BFA2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <1821AFCF101F7D03.752@lists.openembedded.org>
In-Reply-To: <1821AFCF101F7D03.752@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=f1f08e03-d8f6-4b07-916c-f26dfa4640f7;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-02-18T14:08:21Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|PH8PR12MB7136:EE_
x-ms-office365-filtering-correlation-id: a86adf59-e923-4cfe-13a8-08dd50260803
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?t6rqxnnaHlHUcQlOpL6sSkCNBTmhAzyVfQEETrv3BiZrHrJPurToRSWQFyRn?=
 =?us-ascii?Q?RRgCb6+HLOwgwBHqBEmKpo9U9kG8yaeFFQxTCl7mkxfr7WwYwMbPehqrciOQ?=
 =?us-ascii?Q?3Ws+W1pjrjKrVHBj/2C+Ou3q50yNam+8BZjxn068xYOe3ZrvDCmPKRDifAp3?=
 =?us-ascii?Q?GvAmrsk+iKD661xGW3MF7lVLT3ifSSUScq6AzXgJB1bpoaW41UcVVEZsOCFS?=
 =?us-ascii?Q?QevycDU0jXVwiHg8/ZVj57FjqCDPkmRNoS3dqTmBUaGnSaH55qInSIXX3Bdz?=
 =?us-ascii?Q?IJ9aKoWtcH258JYMlc9g1yf59A+0bChvAXsLjhbEj3eenYiggkwp0JuiPILT?=
 =?us-ascii?Q?Cf5xiDiLIwSjyMnd6aX+viKUobgKQA6NBkS3sVU2esc2lvLriQaGLFGs3ZqZ?=
 =?us-ascii?Q?3C+cQqlwVivyuQMFj0oEVRwDWMTYBM9y1tiPmXdMiKMb6zTHrsYR8XiIqpG6?=
 =?us-ascii?Q?Fwe8+mSaKSPjo6XAUQk7qO7xcGYx0jiaRN8x39KQjeXaFoGU8lGyg81zz2Xe?=
 =?us-ascii?Q?Z1nO1oKalHJT2Sl9zsnfD0hL33WqHQhhDm6B7equPvYUFocPoGprSrFN1T5D?=
 =?us-ascii?Q?0KxPEJaqF7+Uc2VL0vKr/IE1KNjOiT5w1DWvHYjyTYq3zxfR1krz/W9k6HcS?=
 =?us-ascii?Q?Gm7ClGfu6Rg1Osyr86oJ1/g0agt115WUUZWgOgRPop6OtdZLrTbVc/wYN4fv?=
 =?us-ascii?Q?xpuHscftaEG+qEMN9hHItkuYaevt41Sz+HPV3cqfSIRzBVI3rptmj9dbPpw4?=
 =?us-ascii?Q?J2Ydxwcvg64QNaOGtPCCfrk+bu7+55geOYkWrnfIuVQfiO6V9894og7i5CrP?=
 =?us-ascii?Q?73t4Ik4zjU8mSjWZ4etPQ9Sg+//EcOaVNjSKq/lVlGDXOhjtHy8dbj1r6Umz?=
 =?us-ascii?Q?y2b7e1+HRJc+Mn0sSx/s3uZyo5vQaZXjIKqdfDusmEkJwaMmfVUn7v5U+Jyv?=
 =?us-ascii?Q?uszYPj9tsbzNEbZgLv55aa3RjvRG0DydhIitBsDtQW3bBR546BTmNTuqPXl+?=
 =?us-ascii?Q?H9h6j8ja/wEPy/mx1UAgLyTgYOxLdNHynfBk/xfQgh1vbtHe4HfiWz//5bTH?=
 =?us-ascii?Q?JUvkClLL5xB6Mdk9LmEsg1IQCHfGXkJuipHzZqc9lGdDrDU9G+jwgM821oKx?=
 =?us-ascii?Q?uks/mgZIUykPH0RKHAx8HB0W/Ic8lUbfRQ7yKhu/qzy4aAlQKnKeBC63QszS?=
 =?us-ascii?Q?8rD/4rigmTZVbbgSeS45SCw8M5Shfizw/Hcrm3pqO3NVvF7A4BUGVbLPyBp8?=
 =?us-ascii?Q?hNKp1c+rt++i4hRPqh6N7e4Eq+0GL4oFuqPOFX7Wy2ysl2fLl7AfOOtYDfPd?=
 =?us-ascii?Q?c6ulA5wRRJj/ALYVwmEQ9exsp29haMtGrXlXI8s3r3WBUJB/1ZA88hTLnIuc?=
 =?us-ascii?Q?i1Y6TWjLpH10Voq+mEZW6zGDV8ItcRojvPK+wO/Cmi8xnh1My4gMigfQhb3H?=
 =?us-ascii?Q?ezmVk7kIS5Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?E/eKTUE6tD4P/vAkR3ar74REKqpMeGH0xReHUy4oNGujOcIDPOzsx3qt7Vy/?=
 =?us-ascii?Q?H7balTOPczsZKqpQq2WYeHgxSOC0JUjIAAEP5/8bx6GwpFee5ZrI7XSBWWsl?=
 =?us-ascii?Q?BrZS8Ukx2bjYFPUFcRLJ+FtUivR6L/5cJ5LlqWMrM0Gjn6jYEKcK4HOmMak1?=
 =?us-ascii?Q?K8vTa14PiUHRmq1xRjR1oGnVXtYKgpy6FpnmlXXOapTAgonjicC8HIdJOggg?=
 =?us-ascii?Q?5Cp3j5gyluojqAPGAlw6Jiv1n6NArmG6lPEEKqhE0ySDCfhhwQjyn4LKVDuj?=
 =?us-ascii?Q?qa9oqKltyp5AxHDEvcaz9088HDvLh3DUsCYX+Wguu2h0jDjCQ5fM3j4jxWEX?=
 =?us-ascii?Q?1bqMa10bjH3LiUkx62Pe/OJ9iBZlr10FOfxV3OxbInF71p/hjmxoYxhwpU1b?=
 =?us-ascii?Q?WaDl2tiYreMJKvGEHI/mRO/cI56Q8JOMiPuoDK9t3v4AK2EdbFyGvo3rppuI?=
 =?us-ascii?Q?cukj5ISKRWvT/7cE6hzxugnuWQU99+Obg/ZFH7WLKFYu+xAT6XTIhoTDSrZv?=
 =?us-ascii?Q?shhc2Xhi7xwcpMq1UWwhI4bF24dEEi2ll5r0uf2pV2GWebxlyK/+EEPbsAyr?=
 =?us-ascii?Q?/7R7G2H9VVrilGy2BNdWIypF69estxk4C8KYST9gG06anZZzsQE49Q8LgrUc?=
 =?us-ascii?Q?LKv4G8svyyyxDQGAZzluEtocyas1HuZAOO3HeAsV6Gb29l66udqP62FRJiIf?=
 =?us-ascii?Q?33Wt9fhfgstkbtqXC9AGvrVDP527PIJ5XFh57wHNTiRjRrxob5NRnab4XOG4?=
 =?us-ascii?Q?Ya5MmM9+PoJ11YHqpmI+5ASVD1eWZhJiMtNMZj3YEd4chpm++TgDYI5u20YA?=
 =?us-ascii?Q?paNZ01zW5YunHilYMIyD93xb6HYzfLyW/2/f30MlO029ykIX7CFKdW9kdnsq?=
 =?us-ascii?Q?if25JX44fqvQw32/YoE7f3d2vs1C1Q5zlxa3OrzH1y67j/OPwuuBHmjCmlak?=
 =?us-ascii?Q?e94ToDpOCdMmh/C5g0SxpOiktRnZUaKBK24+Kbb0+yxXt9EpaBjrh5EiWzfc?=
 =?us-ascii?Q?AXVmzThwG6BQFKhJcLNYhiz7M/c91gwwZda7Mq6cq27T9HF+VytUyzMLDbJC?=
 =?us-ascii?Q?im8/aZNW0XZ/Oo+3bMXjIFgqLFJaBkOtXRfXm0KIzSsxyU++cvpgv2R50pO/?=
 =?us-ascii?Q?HWlxmGPv2eQ+VMnhw2MNdEEHFhb0ZXkkl+tsNxhrL7nIDsQ3ck+dhdEviykT?=
 =?us-ascii?Q?vCPUZphiR8Kd526Spe+j5oaGqvTIqIBQm5eChGN4PZlE3Qel7lndbSD9hL7u?=
 =?us-ascii?Q?Ar9GGfqlEjGZoxQNTJ3tYXByS5UHu862rajlIG3PNjCVbDhRAVbb5ahjyDlG?=
 =?us-ascii?Q?FW5HHjE7RCZ2VGFURW10Ab1m+tEmOM4Gk47tXD3Bv/KxO2TRJ0sd249y1I7E?=
 =?us-ascii?Q?q5KFY6TPLlrZPRiock/xAj5lVNexloFQMXe68NBcPTMFnEiEF76LeT7F14K9?=
 =?us-ascii?Q?O54qE2n9ob8rvDX8VPKy8/SAgJ4PpjiPjZqNrPSjkxegpibUChvEtjMI8lyF?=
 =?us-ascii?Q?rWxkvb48O9Iculg/ZAYKqc92i379zPGIeKZpqkcBa3k0dyR+YJdbrQOSro+g?=
 =?us-ascii?Q?mQPv/+9ZXqqFdwuYn0tLRoyznn2Q7GrpAbZ3JNjy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86adf59-e923-4cfe-13a8-08dd50260803
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 14:10:42.9333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sXzuCHIQJZaCUN7jxgCX71+L4EUiBw9NSTn5FyK8FNJvHQePKsU1uZEn8TaHqBIqCT4JLKpcKJhFPPvlL6SGsVB8IGsdl/ts1EB8dJrFUBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 14:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115520

Hello,

> From: Chris Laplante <chris.laplante@agilent.com>
>=20
> Upstream renamed branch to 'main', however this commit isn't found on
> main. Thankfully the poco-1.12.5 branch exists.
>=20
> This patch is not suitable for 'master' on meta-oe because it uses a newe=
r
> version of poco, which *is* on 'main' branch.
>=20
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  meta-oe/recipes-support/poco/poco_1.12.5p2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb b/meta-
> oe/recipes-support/poco/poco_1.12.5p2.bb
> index a0bb0b5d96..dc6e65b994 100644
> --- a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D4267f48fc738f50380cbeeb76f95cebc"
>  # These dependencies are required by Foundation  DEPENDS =3D "libpcre2 z=
lib"
>=20
> -SRC_URI =3D
> "git://github.com/pocoproject/poco.git;branch=3Dmaster;protocol=3Dhttps \
> +SRC_URI =3D
> +"git://github.com/pocoproject/poco.git;branch=3Dpoco-1.12.5;protocol=3Dh=
ttp
> +s \
>             file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.pat=
ch \
>             file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.p=
atch \
>             file://run-ptest \
> --
> 2.43.0

Gentle reminder to ensure this patch wasn't lost. I also might have not sub=
mitted it correctly.

Thanks,
Chris

