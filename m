Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF2FD2F7EA
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 04:15:22 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.85])
 by mx.groups.io with SMTP id smtpd.web11.41921.1729138513310211225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 21:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=ULMJ5K3g;
 spf=pass (domain: os.amperecomputing.com, ip: 40.93.201.85, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvuN4NwI3W7308dZCCcIQbbHXOSdhK8FZtJJSuJDt5yuVUsBrTtGDLEy2keVSmFfkKoK+7Vp3nkXPTzkkxpOOBcBlDTYO7KBzaNHKaPHyc1fg+FNUsj9ab7frd+TjRsjigJOqztTyUqkFrINg1+wMj/2cEamVOs5cGSG0+yTzlpy6+1AuJXgQII5MtKLDPiG2OzJSzYKpYG99YNyM9G9LqVvICx+Y6Z2fDUk1KuJGov/b6NquFk9BT+VZ+sMdA77DvRwimRc/F5t/0PRxiy1BfX/lR8qJkTI8aQL8Wy8Nfocgg00afu+N2uzGRWvI1bzEYzMcIGW9JOQ9MiqiutR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5mpQeNYO87IWoEbIIuTP/V1cbu4Y2YQ2UfjolLqVVQ=;
 b=uZkvCHt9svml+oaBLm8Pbv+C+9MMIOYrNDEMXlswhgjvYVkZvRI2cR2n+h4Tpr3dv+s3urBuHzwyuck1qK+TTULvra8eifWZ0bNapvER6Ex1o7YnxBuf4Zr+0jO+nHULWPWFrub6qdnqb7znjAgQ91osiVaF+hc+SehXQU0hnY8b2/kBK9bG3ih7vRB8Pjc/aZ9kZE1RXjEh8hDYtpzU80VTry/AYs/akD0b1h3fexwCySgV+lK6BmVVQ7Y9MWdiZ//qWBihIL3BzJdwYJrmxo4FYmv3as0mZeotoq4gtb55eZvFUiOXRryaeGi1IvZX+awdV5eVI/45CetdxJZjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5mpQeNYO87IWoEbIIuTP/V1cbu4Y2YQ2UfjolLqVVQ=;
 b=ULMJ5K3gzv0yHm/+M8HtLjraX9GY30FQPtO4iGRWpg62wPOQsOCK877xEpkTElStUd0C11iCdaGiAJq3/SL5TSlwqO3f6BV18Ot2wSZMIchzcqToT0wGWTc7Nlz+FE2MD2kadkP8po/p63O2/C8+u0IVHq1RDs9ozqF2AvU38c0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 DM4PR01MB7666.prod.exchangelabs.com (2603:10b6:8:65::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.31; Thu, 17 Oct 2024 04:15:09 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Thu, 17 Oct 2024
 04:15:08 +0000
Message-ID: <dccb5f18-e15d-451d-93d8-88667098459e@amperemail.onmicrosoft.com>
Date: Thu, 17 Oct 2024 11:15:00 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: upgrade 1.1 -> 2.0
To: Khem Raj <raj.khem@gmail.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>, tbnguyen@amperecomputing.com
References: <20241016071044.2039824-1-chanh@os.amperecomputing.com>
 <CAMKF1spkwKHYmFFF115_C+N8H+_orVT6xwxOUtXt692yZj7DOQ@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1spkwKHYmFFF115_C+N8H+_orVT6xwxOUtXt692yZj7DOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|DM4PR01MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b038e26-4219-4ac4-8513-08dcee624948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q7Dk5fbTrTq6Z9cXpq7U/1kPgezRaIfesMiugRxi2nzsDwNicoCgG0DzkLc1?=
 =?us-ascii?Q?wIsJd15MdEthQnEi/0/ZvOkYikDiJrGgFF14NxTR2GNKGQBBNb1DK4ZTgFlC?=
 =?us-ascii?Q?TLy4I2JQQFQeoU79eDIxIJOlcpjT/6NdkXu+TCBCChC2tdaBnS535Esfd8FW?=
 =?us-ascii?Q?MJayFOo2O/uVX39QVp6XdAme1T1Zdj8mVTwedwAj87JMSoReDV29VoHSRb6Z?=
 =?us-ascii?Q?GJsdDJo98JlCJXBnvs0y5ZbCSUs/RvPe3Etpa1hYsWZZaLbRlA/9KabFw1F4?=
 =?us-ascii?Q?XoQ/Z8IRzgxk8xGI4xjMBa9HFl2xbXjj2M1tCrBZ+JK030UaeoBqjspRU8WK?=
 =?us-ascii?Q?hjFyT272ne4Vlxn6ReaBYqJ8RU202APgUNng0W1sQe3dMNK8DSb8Z3Xk6MAS?=
 =?us-ascii?Q?Nx4StCkB3DexmNa8Psk59UYKxCZKuOT37jcaAQDP6WULmbN/BjfW7oJppkBW?=
 =?us-ascii?Q?wF5pjcN8Y7Yr9EvxrRLrlFnb/Y8qqzNbB5CNDCHQsaScMrolCSMk4DpqWASw?=
 =?us-ascii?Q?bnG7LhgnaNOeMJBxkkTnGTSKAHetsYEEnp0+PBjquSXjS6S11cmHBz818CXw?=
 =?us-ascii?Q?ycl24oaD8pQqBmQX5Q7t+hKhE1L9FXLtgFoeGnRwFHhYgOkVOkJGC0+I9ing?=
 =?us-ascii?Q?anhZOryf0GtmotvApOwQNxjpgYT10mKzkgXmUTr65R7R5weh1ZwetWZk669z?=
 =?us-ascii?Q?UBnxTUgl1xpfmlj0QGqdjA2cD0zOidr/ESAPvvNzSgdALJeJsLfs3sr9yrbS?=
 =?us-ascii?Q?H442tlv8558VsWaqr9cfL6ku9h9TgHWWQ6+xAsVluudLd0pALDP/gLEYT5CI?=
 =?us-ascii?Q?KV88JnnktK9zjZX3LBq6G8tQnH8sbCQVTTWbiCrNz4Fk1mLU+BNPsNhcZXkt?=
 =?us-ascii?Q?iM3WvU6hqDp4ObSVeGDsuE7G2qJxOqw0ZelhaSYhoQMvXbLfTadXryLGt/YS?=
 =?us-ascii?Q?6JIOlK6ryM3UqK6lt2wBJQPcbberBbKXTvih0AciJcZjssQAFdzq8H8fZEzV?=
 =?us-ascii?Q?UrtrGYRshYdK6+54UF63XCpoi4oDf6vOEqjoMl1rcSGxNnUg0hFz8VeWUbxC?=
 =?us-ascii?Q?dIacCuG/PwTyTXqePfgYmNzIbJpM++CIvM5kNk9bHo3TTiqXUq3UiBhGsBF6?=
 =?us-ascii?Q?UFAkQzDJ925QPMxNcOWf3AZal8zUiWaCkpk0Yq7SjO7+W6X2tJCRdO6UU7p2?=
 =?us-ascii?Q?BBpZIKwIzirE5Bb7IHhjlCmCwltstEZSvivEOlqDXw/c3lAVTtGI50jnkgXb?=
 =?us-ascii?Q?ntsObc+XnN0LS6f1FpU3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w6cJmDum1sfoyO3itBj0kL6ntUuH4SRMKYlFyq/uaWEcTdX6Cfj0nDEAywF5?=
 =?us-ascii?Q?DQ5Rf8UZRrOhc30fkkuePXarVc3839jcZHX2MnWeuc+3h3lMokpn8wNkwchs?=
 =?us-ascii?Q?ZW2AAlQvrELN0dhd+fJ4MjHgmKlR5sgvwTy5HT64YSNRDEAWNn4YaGnrEbMd?=
 =?us-ascii?Q?itmB1hYMqdlVOnDvtB6jVx02Hm6WhZ8t+5S2AueKEVes2y19HuzS5F4pudUA?=
 =?us-ascii?Q?DQ6rtmYxYVW5AZM6gVUzk8oEdZU2oLcfxCu14jI6sx7gROsW+420jurvInKB?=
 =?us-ascii?Q?wIB95HpWTvICLr+lWoS5EyiwHkYKc5cvzOaoD50fGl0Pt1dDVTM6pUucth0v?=
 =?us-ascii?Q?qom42VCKcC6jAfdIDrQ+i7DBt99AL+4x7Mzn2mxsI7P6Nxjtuov9qOKroY2f?=
 =?us-ascii?Q?yWpC1RLpy2x00468tiBWxyz58kj8/XCg2zIR5lUOV2slbmt+jwkGYGnqHQe3?=
 =?us-ascii?Q?2qBzv0BLmBpbhuQkdHlB/hL/KiyRK9L36a2fLzBK6FD6IHmvsXvc2imxwAZV?=
 =?us-ascii?Q?sUL+MOKdl1fex6gB6EBonT8+rzQVufEdLLoBWZ8jOZuU8h3QckiRDlAvBCAD?=
 =?us-ascii?Q?MsIFgE8TETHKKgAskSomsXrp8t7GjRlCeJbPfRZI2Klp7/AHbZByRg44Gtvt?=
 =?us-ascii?Q?95lkgLYbkTc6oqZB2qt6jZIzWn6NlOb0m3CCGBUlgOnOpGUDtwswnLWlu9vA?=
 =?us-ascii?Q?096kzqjemCRzCkznhhwvwgHeUN33bICWkkwEK2MgXO0mlfrDKJTKOVBi7a/5?=
 =?us-ascii?Q?dhMX8gtA1fnh4EgGgz4BiwqupCX1whArPvNq9tgdgyjvNrb2J2N6dGbsSkwH?=
 =?us-ascii?Q?gQx0EWZdJdQBGJvoDgLLWnyt387YgxqQYWkFCwkCtseKUwJw3Apica6JXXfE?=
 =?us-ascii?Q?4Fhc144zaRPeidNGRZ929hgtFMh62ovVlc/viQ/XojFP8SUuLrHUOp4kPSB1?=
 =?us-ascii?Q?j4OJqCGjgUGWNo8p38AkeNfC0qvlqJHL/0b4xbXhy2fIsLtOnmylhfrOaiLO?=
 =?us-ascii?Q?tLroF1jkLVdTpmUWEucesvNyECX0u2eLVCMEMtsH3s8z/TkwftCISGqEz7xC?=
 =?us-ascii?Q?oG0QoNk2W8Vtu2uDOBaxj4fBIqVOC71TYZSxgtyZCNvOLkgH73GvtCY0UMTu?=
 =?us-ascii?Q?/qCY+Z0zBg83r8kMzzKriK9KufcmdSaG4Ody0B103/zy4gUCPuywjTWqMHdP?=
 =?us-ascii?Q?/E+E1Pkyy4yv2MsqLx1Gedf2Q2BjLsrFzwso8kTlysNQ+W8ojnVTM17GaVZl?=
 =?us-ascii?Q?AjCcoJzGvZZX6kioIi1YVEb0qPz0V9I6kEzpIH5eKjoVsvMgcygVowLbHbZs?=
 =?us-ascii?Q?gxYnj2Y6TsbwBZS+KrhUAH9NBoEaOOvBuFxSTfPawUkQubAn8ZmTS7Ul8bUb?=
 =?us-ascii?Q?uk5bx9TccWY7fH4/CJEVEYg3Umigh7zu77em62vEXJ6rwI4tYRo9kuO1MqnB?=
 =?us-ascii?Q?BMw+bELuQJmFLNfj5hUJugY/3Vkj0TXwKtAhUX3zrwhxNVNJFuxFbby5Ifvc?=
 =?us-ascii?Q?Q662l4hzzSOb83BUZx8pfWw+8FIZ8qJbwirdQKfrCpA+e1ESxFjfZz9jL30Y?=
 =?us-ascii?Q?XX87qA7hN9nbRFGKgl2hQwBvsAzi72U458tBRZvUwJAJZbxlzhLSMPLe4dfa?=
 =?us-ascii?Q?TiRw6VvEk5KxucFQbPzE6Mw=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b038e26-4219-4ac4-8513-08dcee624948
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 04:15:08.6841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0CSABf+6o+bMdjoZasChDiUr9KV+9Li2C4h9VfQc7qMg03bkxDmN48RYzxJbLdWMVfQt6r3bNASqy35jYrKbcAbrs8KjB5toFxIZIfTUY2TfXF0eFLLuBr+JYMNT+Ln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7666
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 04:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112957

Hi Khem Raj,

It seems I missed a configuration as below in the mctp_2.0.bb

+ EXTRA_OEMESON =3D " \
+    -Dtests=3Ddisabled \
+"

I'll update that in patch v2.

Thanks,
Chanh

On 17/10/2024 04:06, Khem Raj wrote:
> Fails to configure for qemux86
>=20
> https://errors.yoctoproject.org/Errors/Details/809756/
>=20
> On Wed, Oct 16, 2024 at 12:11=E2=80=AFAM Chanh Nguyen
> <chanh@os.amperecomputing.com> wrote:
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}           | 2 =
+-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0=
.bb} (96%)
>>
>> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-net=
working/recipes-support/mctp/mctp_2.0.bb
>> similarity index 96%
>> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
>> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
>> index bf3961be4..a0e757a6e 100644
>> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>>
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc6=
1db21"
>>
>> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
>> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
>>
>>   SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protoco=
l=3Dhttps"
>>
>> --
>> 2.43.0
>>


