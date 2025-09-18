Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668CDCAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:22:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.web11.12584.1758198116688097955
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EyLFBp/V;
 spf=pass (domain: axis.com, ip: 52.101.65.39, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avSVL5H1g84pmvO00//s1lLakdDP001rCs99k+OrnhiE68nJ0M+p71pgoHvkHkwDzrVNhHmegd14GEK7u3JW273iagYmTJvOycrMFDDp6BNUaso4Itn//uYr0d+IFPXKNAuXWgqM7CQl5Ie9NUtz/QE06DZn+lp3pShC7NbW7/Uvv/EE6VBIq6NT5EhRO3fH70w297TDsUBsk04fuKCC/Wd5DDDUrrLFXvDKqSURXF0m6gwEwXplNQcJKa/eFulVfiRD2p+N1PquagPB/LMXA43YbhN+rEh1Bi5MMAJSko+ENsBzWyhQzD9BaWxD937NBeHZTlvTrmOqf9mkiY5/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhTUd/0B+FTNVWXKtKf4NwnPj9AB13NbZKX/7xbSE+c=;
 b=ZJG27Wk2Uk57VE2uKgMsjUawMjmIugaucHfmteUjL/FXlNvJHwg/q5fTo+5tU4W+dv8499iwTmNeTo0R5BKATj6EfyutS5N2l8SfnKD21V8t6rr86wm2YT30PHVsrClt/j4kUlJGgLldDJ8ZQ2AjE3l+XMjCZZ2erm8luqBnB8JhKQ+s6ElSOhUS3AsiL2CELp/E7oZUD3dbpgNRAluZefwE7DTwtWvS/bmqHy58BX2+G5BoIky/oK4Z88yVZnazajkyDvoCIZMe5uxz5+fZ9RlV730qPk+WPwkTEysYbMB0emvCGopMaRIWZz3Y+Pqt16Y84V+/4b9/SlgTAg0kKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhTUd/0B+FTNVWXKtKf4NwnPj9AB13NbZKX/7xbSE+c=;
 b=EyLFBp/VH/8PUN34VqbMoj+jv9rbyqyKBJjBquI74XC9jQpKIoWhhoz7AGkcen7qLtsFQYawPkRJ6gm1NYPjEpsU3OLkaRv2QsT5VN0odV5ZxND26WEA/rf23KVXX0G1FyHUSoKpNjuHWLfRdEPC4A4Zve1cXAti31WZGtY5Sms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by DU0PR02MB7897.eurprd02.prod.outlook.com (2603:10a6:10:345::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:21:53 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:21:53 +0000
Message-ID: <7077a0c6-1ba3-4a68-886c-a5d26c7a4ae2@axis.com>
Date: Thu, 18 Sep 2025 14:21:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] crucible: Update to 2025.05.28
To: Fabio Estevam <festevam@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20250917233832.183682-1-festevam@gmail.com>
 <525f8ed3-ef79-47ba-a88f-49bfcf4f0dc4@axis.com>
 <CAOMZO5Avc3oCLECeb-X_6=jVGDd=VkBTuSFqjgb29CEkw6bEUQ@mail.gmail.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <CAOMZO5Avc3oCLECeb-X_6=jVGDd=VkBTuSFqjgb29CEkw6bEUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0037.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::27) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|DU0PR02MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e44d876-99c5-4d11-b208-08ddf6adf35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mF3VZ6xK+75tc0Qcbh9J5TUd145f7bhQs+2AkQy1mgF1/vNSeNWu69UUjGyD?=
 =?us-ascii?Q?6FygWybiVXgmRJpKzBvs66SeOMNlXPjcmbJBFQAC0APDiJynMivPcSGQiGTZ?=
 =?us-ascii?Q?jwDUvMua6Qg/wUQGSn0ighOPllaxskyf/kTLasJF720NXdsOIHVVsUvJZeiu?=
 =?us-ascii?Q?0xlmMRoB97XXsFrm7m09gfHtCL+EfscBScBdUDAvZq0VM4reFQbW1yS2AuPc?=
 =?us-ascii?Q?Vmp1oM7dCeG46tkeLpbCVSJGRfWrSa+cCpAViDEv/zy7UJnLw82UJNqPSHXT?=
 =?us-ascii?Q?Wlou2lfo6uQr4QpKqm2/WqfXjzMUna3Y0mUaxdCrkHrleDUrqT3PycsX9zDI?=
 =?us-ascii?Q?rM1X7gNpGzDcSG7jif3bNYeEC6xv5nYelzbxsNOj20piVBEQ3qXJn42QuoT4?=
 =?us-ascii?Q?sFTOLKI18Wns4KXzLv0QbitRRt/H+YWhk+enmpmn5YYw/cRxBLtzYxV/xNPw?=
 =?us-ascii?Q?XAWoKYwGfBP2GBP7tSmxtebIE1MpTyqXZ+EMCx8IvGr7zVJ2z+CbnvTz8aWx?=
 =?us-ascii?Q?XWThyrt3FJNTekMKq/SUaAz8CxIwz7SF4k4Gmg85eQcNN8S8SoGEquaHclO2?=
 =?us-ascii?Q?RmfFAnWW9Ydq64+vCYPdEWh7sgOjCH/g2zTPWx920SXS7C8WMfRC/l2cM/5N?=
 =?us-ascii?Q?FRT7cjUbvr5140RlCuF5XTECpP5o7CwpdfMrgdbo0vaHVraQG6VHpevIsvJt?=
 =?us-ascii?Q?OVuYn4rSTSersvcHD2hHak/wtFBSZIyDuNlqqUKmGscVcyOQFNPUt90m+ocv?=
 =?us-ascii?Q?QpEkV/+p0OJpGOWgy17N7P7g3+yETFnU9Xtugv+KHCXnG5rDQlqtZGuxQEf2?=
 =?us-ascii?Q?mBX+do6v0MWyeFXmQT8kZxSJ2iw7GDEcJY9JVv0XIwLg/RrAeRc8cglufSWL?=
 =?us-ascii?Q?WZLis2CIFbz63sLcKlY0Jk1D6KNcITcByMliu94g0tPQgYmgHfdTgPDt6tKy?=
 =?us-ascii?Q?icHauYGbQCgWmHEl7EUcK8VfgLIqjQcs7DetCXd36serr1AQmO/pYYwK7etl?=
 =?us-ascii?Q?CVkW7Umd+UuYL04EoyM47GtgSY7s+tzZ2lx/bVkcA5cndHSjg8TlZ7tcngJZ?=
 =?us-ascii?Q?qjuo2ALKfe1KH9SkoeLbzkMeWNmoUTpWm+Gsa5dB+BX2BtxpRldiAR6fVOZX?=
 =?us-ascii?Q?qCnft9wJKBFClyrkD9pDdP9bSTA09/IQmeiqS9kvpAfoEda3WvMJEoOC6KRN?=
 =?us-ascii?Q?W6jnn344zqHcuRd634o2uBLNbeWYGzh7cfXnh4su6+cXIz9cs7/Bko6uBsm5?=
 =?us-ascii?Q?DegCmWHXdqnPMkRmMBarPuMN75e38dYKeREU2JTUItNkW5tTY8Nc/9C8NmKH?=
 =?us-ascii?Q?0xm5fW2QNzFIcx9unApn4tuORNcNVUYsDdlTHEDZMQgiXAlH0qJ19chZ7Um2?=
 =?us-ascii?Q?hQuUbOU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s3YH3G4uC42sqTDay2ZN4FJTu9lYB7Hgz409dsydkSrmO1s30xbMChSv7EV0?=
 =?us-ascii?Q?LqPaXQoQPGeuKU4bQXCgwYeKz5GQxbJ9zax95sbVQPXNh4UdhFnFocMAnFr9?=
 =?us-ascii?Q?KoZ0cd4u+z4wu75F5+7YD2TvlputkvZETVaUA79pLmEX2h3p60x6BQsLhf/N?=
 =?us-ascii?Q?2k5HkAJxbeYV5mBdDDfOtTEec67Uin5cev2u08q//vk2SOH8X211lm+4f3Km?=
 =?us-ascii?Q?czFgsBgnocyYgxTnkhTnUHyvhT89iGtQY8o5aqZM8hws6AXYREEjDguyrqqc?=
 =?us-ascii?Q?5UZcNoLoVskQXlL0RQMdZlAlWm96mT3pmLnDl4zTVpztDCO+OVo7TwMBw17t?=
 =?us-ascii?Q?xmUwITPAzcJGTeq4M4T6ppEar25oVqnUfRDqtfTzvJp2P3AGfDGiw0N4R6bR?=
 =?us-ascii?Q?01kVALP05612Q1iGRmNq4MkZVd70pCiDJt3mxhDdD71EKtmp2n/MhpKK47He?=
 =?us-ascii?Q?Y5jUhwm32QCiKZxJzUSi6566W/gessVQ1UgSG1eit7UMwY6i3SbmmVVLHffw?=
 =?us-ascii?Q?0EcOxjNzQKvhsdMyT3hiMmj3QuLtThFIaXw/yCdulZxDCTCPU4YhixVVB3BV?=
 =?us-ascii?Q?+UPGPtGL134O7IRDSK0wpBMpH2HhLHrZs3wvCxfcfCqpsOv61dR2o9bk1IH6?=
 =?us-ascii?Q?Y7ARGlVKs8DLAbSFBY32Ri6sVjkAkotJLTlnbQmDwlCMviCS+oyBZouoM4MA?=
 =?us-ascii?Q?F9APRQTNWACu/j+SU04lmarO/b4DmgsjPBChLtm8jegPWkcq+16tSFLPHZ9M?=
 =?us-ascii?Q?+F1Pr5vcKZEOLNTJq5yxGZn3fR2TrN8tvYib6uZeeHykogQgHKar2871jer0?=
 =?us-ascii?Q?1j0qlZhhaiu77i0mVPeRWZThmsecPlbGnErc5TkI5rEweT92TCFyyvW/sB4m?=
 =?us-ascii?Q?wXUUBM7msJCuL5zMiZh2sLZ9aIRekZosGOceX/4/Mw/VPhS59MSFqBpRQsEh?=
 =?us-ascii?Q?0vj7JFkEDkdvEYeYNDThXjxvbgMwyEpeMeszRx8WEoUidnqSXN477ehyuFlk?=
 =?us-ascii?Q?FP5L+ZB7SrrpIkm2r4ySkkFLZwdYcLLWnr/iWuFfqFbbUl6c8n4N0Jb+EFqQ?=
 =?us-ascii?Q?pIq/pugIBhbrMFPRfKfnCND6P9/JKeK+HVx2pK9/KKubaxMq+VcxXvzYaRhW?=
 =?us-ascii?Q?ZMsOZ33EqbXRFWLR6F0dsrRhttR3mMeM6FKO9jvAUqOvC0qccybAn/24kSB7?=
 =?us-ascii?Q?5ZhOqviv7ttVE6OGi7i4rYAJz96O/fDzECCyXLnHvGgfc1NkzPTxuGHkDXSi?=
 =?us-ascii?Q?O6aJpieVgi6hagm1E2Wyy8Zti1O4Ne78JtOGTOmKgXNzRIUKQ7Bb9K33dgt2?=
 =?us-ascii?Q?0QZ2XJvlHnGi+QYjaofIzuV65tkebzlnTEd6yB8z9PEm06J12sSH5Mri4jKk?=
 =?us-ascii?Q?uAqN01U7obOAJ+ak56M3UbQ7/wuoLW6qNkXUcM/TS7OEUHjv9yP2J5dopFI+?=
 =?us-ascii?Q?pFj81a0la2x/GhcBc9lsuzKPtUPcilQI5CI0dUPO35tI+z0PEdc3nszH7YCE?=
 =?us-ascii?Q?pSU+XCXP66GkLuaKeMMKuhnd77ywUSNXlu+VdF4E0ZVC29kZizcSKvCbF5lg?=
 =?us-ascii?Q?dotHLDe9WnU8bvNYlWiTS/OzxiEApa+AvPvY3lJH?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e44d876-99c5-4d11-b208-08ddf6adf35a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:21:53.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDG2IYd10q7mfZ1HO7MoRgMWuSaKHFg5aGYVfDyT72pK8fGUkcCV0BtfcbfvQmGULv9NMfsIjAGfPy+d91AgFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7897
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 12:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119574


On 18/09/2025 14:02, Fabio Estevam wrote:
> Hi Christian,
>
> On Thu, Sep 18, 2025 at 7:54=E2=80=AFAM Christian Lindeberg
> <christian.lindeberg@axis.com> wrote:
>
>> It looks like the update didn't use the latest version of
>> go-mod-update-modules.bbclass that takes GO_INSTALL into account to
>> reduce the
>> module cache content to what is actually needed,
>> https://git.openembedded.org/openembedded-core/commit/?id=3D26368cfb9180=
664b66bed5caf900931d08e44d38.
> This commit is present in the tree I used to generate
> crucible-go-mods.inc and crucible-licenses.inc.

Ok, jumped to the wrong conclusion about the version. The explanation=20
then is
that recipetool, which doesn't support specifying GO_INSTALL in the created
recipe, and bitbake -c update_modules with GO_INSTALL set in the recipe=20
gives
slightly different results.

>
>> Maybe go-mod-update-modules should be added to inherit now.
> Yes, I can send an incremental patch doing that.
>
> The recipe generated by recipetool does add "inherit go-mod-update-module=
s".
>
> Thanks

Thanks

