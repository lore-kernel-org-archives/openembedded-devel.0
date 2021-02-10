Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.86])
 by mx.groups.io with SMTP id smtpd.web09.1659.1612921466545682718
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 17:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E+Gw5ny9;
 spf=pass (domain: windriver.com, ip: 40.107.236.86, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LriYV+23Uxumx2PUQJjHaoYfGQzzrYXoysnr6JRTMFr4Q0LtMBg2Rp3gA0MJNQab4hD5uyBkPyC3aJFQNpB0mV3tebI+VIjjy6lQq690cnmNLuevdnWFrueXtHJQT92zxjJA0XHRRHyl/LCHAZ553SK0+cVjUqL5PZIlDjNX+UBi7o6svzbIHmQZZL3x6UZ5qyjCUssnpXQYwH/AIRJlOm7Lfz0BYCANFnNKOvdKAPr+yAd9285t9VDXGenyZbWR3ZhAD+H4W8vL8FtO4YPxTDATeSawnFsr2JzA0qP9G+gUcWaKBen4k1I4INya5Xtbn1LiGl81mI21O7DUjt9qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6iVh58ubCB6IQVjct2P9eRld2dlkSeaCJR+ogk12Z8=;
 b=CI7gia4yIlDfSzHXVdX7bjjLQkt1nrF3cZBmEH8e45PDitXC4HFbAXUMLTDrOxkBJTo76pA6h3pBSXFpNotJBb+BPw/xrwJ951ZGdQAly11Te1B917cPxabYHQkh0jHi/jcECTXiHdaKV8lng8pVODL+PwHIasCQXOXTD4Q1cFERTST3MaNa+jmPJA3uB28RQxWegnRO49sOan6thAxYIwjp3XBC9oEpy1kSWcMKSR50U6MVEv+euBLvI5t1IT/u3qVyfHHVrK+zSFXfQSj7bQ+9M090Sv3IF1zdn5KZbyUSfyNrkp7hybYj4S+0RbrZCVnbUhb064jIizsDvUGNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6iVh58ubCB6IQVjct2P9eRld2dlkSeaCJR+ogk12Z8=;
 b=E+Gw5ny9BMQah2gf+UWhBu/Wit64n+OZ3d+Q64X4EZ6tEYM/rytRbwPYTWxnpngQB8JbVWbX8THwJ9936r9qJEpQBGbYliFi8ZXo3N4BcusTVUS8y/axc8zP+xiHNC7TOvyEFBdJsF9doPJOyVSYA2HhjId8g4zIYoz3YmXI6js=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Wed, 10 Feb
 2021 01:44:25 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::4c15:ab0f:27cd:605]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::4c15:ab0f:27cd:605%7]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 01:44:25 +0000
Subject: Re: [oe] [meta-oe][PATCH 1/2] lxdm: support to change user password
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210209082652.89531-1-kai.kang@windriver.com>
 <CALbNGRRM3ZiFbXFEmo5w1XHtTMaqfYCFN35vMWsu126kGuheog@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <c398e782-68d9-68ac-fb79-eacf21f93bb6@windriver.com>
Date: Wed, 10 Feb 2021 09:44:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALbNGRRM3ZiFbXFEmo5w1XHtTMaqfYCFN35vMWsu126kGuheog@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR03CA0049.apcprd03.prod.outlook.com (2603:1096:202:17::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Wed, 10 Feb 2021 01:44:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49a89da2-e238-44a1-5603-08d8cd656559
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5007:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5007B6D62ECBC6B915FD01B6958D9@SJ0PR11MB5007.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zc5l4TL+War8J6dt5s1Ew2QwtvhTTcVK1vjZrUcQUvOHdk0voWaNKONaiuspEXVN3vYGPDYixVpX5QcYVx0fe7pJ7P7WMSgtLyGeOVq3F4M8d4iY3Y294i4CmTINpBgEbWmWSWLCxdk5RaitzExTqfI+3jfYFzED21L1CdagYpmhZz4ancPo+haAkOpiSuT+dkqW88bnkzsSBF9ezhuvtJ+X72vUU/WJaa84ivMpQ13b/ElketlzDrvMT7vuhMA5R7o5SPQ/BiMsYF0X1O5iES334HLWGWtTAJGgQVKloLaYu48O+hbhneomlUFKFYoOF/wXfksnwV7Yj3M9vcpmkRMGftmeh7hEZwwCQEABH841IIL+Yepp31aOAviOKtXk53zRkyklHrjFgdjeQGbzOhC6uHmu8z/vHdu43oKz0HVzeTIC/dBFOPADcyCnS5U8Z9bIYKRsd/aCzKUoMcCr64PwVA84Kp77ynerA9Iul0CHJNrZhpKyMQt+AljHdCD54YezrG/v9gFDoYbJ6iGoZZoQm8rr6Gom30n30oDgpV2f2XuPtJ1X0GSlwUXDiZaEgh31OJhADWhR7cbuODnjzj8kNZ/uTuXdnUtfayQQ00GVuQ1ZSokcAf30D74rwUVU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39850400004)(396003)(86362001)(2616005)(316002)(6666004)(478600001)(956004)(8936002)(16576012)(31686004)(4744005)(31696002)(52116002)(6486002)(2906002)(66556008)(66476007)(83380400001)(186003)(8676002)(16526019)(5660300002)(36756003)(66574015)(4326008)(66946007)(6916009)(6706004)(53546011)(26005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Vef6mID8W6JKme/wXWldbFczf/P/qtyE0xfPDLdNdjeLNDlq7REp3IhlXced?=
 =?us-ascii?Q?xaygIFIpR4NqORVrJYVqEd5l0rbAwJYq48GgEsYh7F6aRGzJr0A2yRUXcIgT?=
 =?us-ascii?Q?7VguFUrL1/nHZrmSvp+Y0mn1/ZyoGBBDrBug3GHabXuhAlAsg5FfZrLKzJsF?=
 =?us-ascii?Q?RnHs480ZdA7dTkqHG/BTBv2+dBRVnpDy8PsNVwHoOdwUcanUSCdVrCOiGLns?=
 =?us-ascii?Q?4lCbAmWDulN5ic4kLZ8+vfwUgyL+OAXbhm0W6de5uz+uVjqocfAM84Tn1+oF?=
 =?us-ascii?Q?w4zOy5STm2omhqB75S8hCqC0kvetEKih/te1B/szrZVK1xC2smS1ePFvWc16?=
 =?us-ascii?Q?JiDi5DYJ1RCfOiNMpe0WClyG+w/AA/w/OnUKFkFzjgtZ4/WZqdM6vuVUdFGJ?=
 =?us-ascii?Q?WBYfvja8hL/BlsG+vPMjCKCxBnhxBTkwH/knoE3//0JE8IDvLI90d6gpVVSA?=
 =?us-ascii?Q?gK2ej6DsJhuofrzWw5MYwsPxr1/YAjhUmfGnEz7XhZ5MEdiYWdazufSr1q8Y?=
 =?us-ascii?Q?hqcApGm2/T/oCwjC6g9u33izDjeCPtlf/O/q5oZFXEpSGLq2y632yUWyBRrz?=
 =?us-ascii?Q?sCqwa44ylWM7dSHEdrsciHwVPHptKPRFv4L1LIQKq/86Dd3jWTuoSczL9YcK?=
 =?us-ascii?Q?GD1IcdJvtMoo+PJ1SiHEKopMLyJFz0n7uFE14w5WqHmVwE2uekrQ85it8eOI?=
 =?us-ascii?Q?hMiqFfQysGvse+7Me/xd0XjyM5xchtvxEuTw85nzJR+jiyn9ghml4MQ0Ycas?=
 =?us-ascii?Q?424RuxVp1kbXHpXnELmpIJ1wFelVXnVh/bOiqcWIFpDeXKZOHsQI7HHMNWaV?=
 =?us-ascii?Q?RUB6R7NT6flQRdeWLyVhWly1iJpbymLMSuIRmtrAlZH7VDb4dSsWDWLDSNpF?=
 =?us-ascii?Q?jNR+25UTcYSGC6GUKY20ZkfuSU2FCDyyMC1q636D0wQqUytGI7KRBg7KzU1n?=
 =?us-ascii?Q?4s2EeVrcRdqToDeDs7/SgQn7RJmrNa93y9z2lkul9gwxyWtCUYXOcDspTO/E?=
 =?us-ascii?Q?3AUKdqgpKtZPXygYoXak1S1ZWGiB69b5NBZ5H/HPsYBnlDoR6GV4o+Dvv/rD?=
 =?us-ascii?Q?C8JoWCr0b6OqwoT3clEi3YRmTif/QiGdxW6JO4fniMNXRaxvLXdqSpJ1IGlN?=
 =?us-ascii?Q?qh2XINwj6pN5YcKe6HOMKet5/y2S6oLLkzxamP7GsliSrQV2Mdk5SVr7bPhA?=
 =?us-ascii?Q?MbCJ3GfwV13eF4vP52SCzz6BpWq+3xrmjRKcDlf3aGCuGHHuCqMF2ObonPtt?=
 =?us-ascii?Q?RHA4PqM5n2PsGDaaQeeIemvnVIx53XlCotveeFYYeN3azYjjyk6dxU3+oKzh?=
 =?us-ascii?Q?s399Kr00wotwrcSVob+iLzC1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a89da2-e238-44a1-5603-08d8cd656559
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 01:44:25.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pg/+mGKZxaE33xAnrd8V4fvqU0hzPPgiwiwXEI5fO/qX985ShBlTX3UfBESX40woCflXhaVgdAQrUQhtu0wX3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/9/21 7:52 PM, Andreas M=C3=BCller wrote:
> On Tue, Feb 9, 2021 at 9:27 AM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update lxdm to support change user password when the password expired.
>> It also add a label to show useful information to tell user that 'Authen=
tication
>> failed' or 'password expired' etc.
>>
>> It only work with distro feature 'pam'.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Hi Kai,
>
> * I'm impressed
> * Seems you are still looking for a dm and yes the gdm issue you
> reported is still on my list but first I'd like to have more rust to
> de-rotten gnome...

Hi Andreas,

Thanks. I'll put some time on the gdm issue too. :)

Regards,
Kai

>
> Cheers,
>
> Andreas


--=20
Kai Kang
Wind River Linux

