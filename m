Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128D3CE8E83
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:47:18 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.127])
 by mx.groups.io with SMTP id smtpd.web10.16378.1729781230557183653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=6aduG0Xc;
 spf=pass (domain: os.amperecomputing.com, ip: 40.107.243.127, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zB1QEVdOT/7M+Cbfv71AnZj67z02mOGh2OfvKC8EvAwWcRWEcZjjbQLqFjX/nxgT8O1nvoCsfNiCTt8C6+zl1cA9mUvhoahma/Hrdo0CjF4WSt/ft5fykUuL2m+4a6ygqqiqxabg+lrDrzp7YDy7HwS75YWUVODCWDIG+7E33EuqqWo3D/MRxs0KLxtellQuqw3M2dL5wWN313u8yq2NiuDOnFMnXV/yqoQ5hrpMNLYIyqZsCsUBQ5X7S3eE7QiD8/Ly+9GNbVZYXCM+tdOEN3+5gM9ymfopOFZWQSqYutbe01zefHrWRIqKaqYwqZ12lk4qKjpfNjEt3sxx3yCSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbnUt+oetNiuIkpEfA4sscNS4P5O+yme3r6b2Yi2nYk=;
 b=clmqbNIVLfDGfsc9YPMmU4dTVkavPsuf5HUyvzT+fhd5H2J0iT1a3arxPf4ZP7uNThnX3Q7E/6elDwMOSfrIcS+8KC8dIhUQ5U/9FR0MeGKz7UrAsc3iqB6Vgb1gfRG07+KOoFIURBVGIxqp+i7RPAU8XJ6SURMF2dguPiFzx8Z9L/GVMaPd/v5HmQDXXrYhHIuTL49nWa/ijbabK0TepCb7Opa/iScbN86+P11W5M+VLD5KfbBp5GcEO0zfaz5dFlX5B3xwAJ6rISLgB/Nt4s8gpnSm9VBbvp8HI5wiSbQLabwrW9PuzgvL+pI3YInHOlWyudUP7YZGFdOovXdfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbnUt+oetNiuIkpEfA4sscNS4P5O+yme3r6b2Yi2nYk=;
 b=6aduG0XcGoHWoRHMFQVkUZGBBqTvDVuYrFkSj+hr7cHJ+XzpDln+5iIHkTDMZt/XO1dLwMHBK7IK8R8yw91gjn1gCrZzp8uUkRBdinHUiSj+p9XobPjDKgGW7t1Vlf9k+PT2Y5PA5lDgLu09mqMHx4c9aqrXvtH8EIi46JzFNlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH0PR01MB6716.prod.exchangelabs.com (2603:10b6:510:a0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.8; Thu, 24 Oct 2024 14:47:05 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 14:47:04 +0000
Message-ID: <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
Date: Thu, 24 Oct 2024 21:46:58 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Khem Raj <raj.khem@gmail.com>
CC: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
 <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH0PR01MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0b2ef5-a3e0-4ee6-e991-08dcf43ab9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cF5Q03gXsXsu6WNOi6f/0TGYnFuQyGp6c7P0ru1KlhrqRJ1I19SqK1rRr81p?=
 =?us-ascii?Q?+ik58eXDX7bpAL5B0S0yr6fmeCvzwCEdbyb0DTLXz7CKh5u8iPpbIPluTylF?=
 =?us-ascii?Q?cpgJES1sW/3HakExGScbHdchtsyIVV2vfUlWRQOW6Ma0gGo9yUeJKvkHAqrI?=
 =?us-ascii?Q?CE5M2A9zg2HHB+UfHI4jZx9K2550goTk9D3543hK1SkIRBXeMByTyQI5Pr64?=
 =?us-ascii?Q?Y+0Yxfogub2vPL+hu8/P5eehbd/INTGBUpzxbW58wkzmZhP3TORGS3EdjySC?=
 =?us-ascii?Q?WsjvxgEe4DOlgUB2UXW6xw3/hu1kGe/HS5Y8bidnQi+SS91AQ+ksoQOKxMM1?=
 =?us-ascii?Q?hO4DF7007sL2VcTA8L+zrrwp4C0fPefcoxmKER5HhceHPAOmLrTqAf2IWgkm?=
 =?us-ascii?Q?YOF0bQnmVVCgXsHceN6OLzg7Pta98HD+OyL/lit6/lPeV41WolGyqbRj0eCb?=
 =?us-ascii?Q?LdRds93kjd0FZmADgdxbGOTjcYIqtvYU9FFITn0DcVNP1MhJ3vBTFxNzmwM8?=
 =?us-ascii?Q?dCUDD+EDhUyGwexMoj3L89XEHXvvRyUMV1vlUp2F0XYFgMaPZqlYH78VcwY+?=
 =?us-ascii?Q?/92KIKEkbd7goXTIfEykIKyyURMsSYguzFJ8HuT9iTBYnvMWr0pQO5pBiD9t?=
 =?us-ascii?Q?SDhmPNBZHqpXPLfN3uW3L7mmn3j4fCIb63DOM/u1AroEMlW4GshpN8feb9R3?=
 =?us-ascii?Q?HZRoK+qjcxEtmWCYAPcAQC5THo6x0KXunWj0qthWaewd/lOZ9XFsgA7Owazk?=
 =?us-ascii?Q?IfjbOsVlE42k4u0/KovkZDca9yVgXYM5utxnGcbGZtq9ho7DvyKkqiEZPzt3?=
 =?us-ascii?Q?UWYkU39ZfuPWNjPKrawyIXlo+XtAMXhFzaCb/Flmn7vcA4kWRmt6KAF0hQM7?=
 =?us-ascii?Q?gQq+GHg2rKtbZaHNyD4EDBcQlXRQ7cy7WHnzPtRIAChrKGmN3xXrWEjqldxU?=
 =?us-ascii?Q?VdyzCAHJNasCC0jQVBVK0ybEZqFYuV8Rvy086rC0BPpFgXTPTJKG4Sr2bekU?=
 =?us-ascii?Q?IqM+k5+GQFphy0EDow0EeLgTeOHl6qH+1yoJ3u+mkxR04DIuXpfoCaXC0JLN?=
 =?us-ascii?Q?ISR4P8kD0pUvNXLDj1hvhmY2lzGQP9Mf1cySwCmWRVLMArdb71PH4c+JkgE3?=
 =?us-ascii?Q?KG3d9o704Ufx02HlqJhl4Ny5XLM2xHz+unnyMJwXHyy1qR0DW5JqddLcNVf8?=
 =?us-ascii?Q?UEpC2AwuYYpOtwjesgGRDNOezYrCZwJPYK+zPrDxSJ4aMUy8yyf1SmB2LqZG?=
 =?us-ascii?Q?DAMwWj7KAIJxi3Yg08fvrUBq547oJt9VzCtn3KxMkZugCdJhE42WTKNscVBp?=
 =?us-ascii?Q?VUX9z1jK5WuYLqoVmkhT05HC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ohWOYQ6gf68zq0ZxxZ4gkWoIaAKkbkemnsqLzQPB6qG4fde7HVP7DCJshWUL?=
 =?us-ascii?Q?7CIV3A7g1pF7+3C7jmo1WciDKYg4LFPT7MqARpY2ftrh7vRnRgNJdkaL1ttl?=
 =?us-ascii?Q?fxOhxjCbIrjMuU2YFyXT6WCLHRp8K5QVC/WDj+Nr/VSSIKiEg7OuXLwTnE39?=
 =?us-ascii?Q?uXzSaJ/ckmYU9n+2TduI/Aac71pbBufl3Z0/ZOh3CfMnGOWuu/UHYkHk///0?=
 =?us-ascii?Q?2XcPPW/FLKrA9lRmlI3h0lte65ToxdI874IWw325irUwS9ulQTOVFT6e6QaQ?=
 =?us-ascii?Q?1bWZxZl7tucfPAjt4sMgNzvZrIMQl+9YhOZYDvZRyERlBzrykETNYpphnR0K?=
 =?us-ascii?Q?yyBAfxuccg82vkTgqIm+56o9ANDBt/a59faS6EUklqtSm42bFxmLhXEYeBWh?=
 =?us-ascii?Q?KdRME+/Oz7ynB38ns3PH3yRIPoUpJNMrizzQoT2PtmAK/GCXhf48pHUJ5qRX?=
 =?us-ascii?Q?ZkFzyWiI1xJNiLya0Ru8K9rzofE3G7dLPQ/hrDZu3duA3OIzw5jJC7brS+cr?=
 =?us-ascii?Q?WKYq0LD9+D/KUrTF0RoUe0eKvZbtRIwHAAltnsk+GR2K9lKPMtdn5aZU1yy3?=
 =?us-ascii?Q?cDSdnjRB5CJVcHUKnaVG7iOaLi0Cn7BO4oJcKuoL/LP0vbwFuhrt1sXEcQgQ?=
 =?us-ascii?Q?zBsgKQTCISIYSoOI9/l3N4T3dV1qYMUy/Ja1pI6VfaY4efgtWZm6hNZ21Aej?=
 =?us-ascii?Q?BZAElmioYN2IG5sSSEYu+NkSlM9t+UEcHel6SijeuUDvnEDhJeQkIPG9zk/2?=
 =?us-ascii?Q?qV1yWnop/0lgOq3m6UslJXVXgq7f3a+Hdpscw1fPUlj8aysRWen8tQ9WrOEi?=
 =?us-ascii?Q?GMURlxvSTLyBfWf9XUrTZasgjkLbrzwYEAUq94Yel+nO5D0PGoUcZ7ykUXTk?=
 =?us-ascii?Q?8vb33npnNMuCF6gD/a1E8or+PG3TOuBtotgsukhFYnUiEVR8/R+lnzmzxlUR?=
 =?us-ascii?Q?8A/ggjJfppd1wCy7Smq2Ql/+ejYhMCfk6LG8iIGMRAXHfBu7Og4Ob4VIRTDk?=
 =?us-ascii?Q?wrbnyFYPk8eUhja5MF3CNw4vVRlKN99zLINqa2R+qIqpi5bMcfKteEq2n08z?=
 =?us-ascii?Q?C5OXR58gyNAmpHW/hcuMQWpy9qSd96puBXKuLgxim8NEt/1Qv8W+bM9uWvnF?=
 =?us-ascii?Q?tikC9Wqq/szHHydAx2kAiv0LS/nJrQu8PbV6zqrjVBvnqcNQO8KuMmWbJLIZ?=
 =?us-ascii?Q?19H5BFHwKmTB1Tyftl3OvFgp2WKFsLMqhRx2ud4I8RddnoS27c6+L+XNTxC0?=
 =?us-ascii?Q?Poq8PVpdhRDyb79otoY1rCVy+mDUfTMLjzRv5Dm/fBQmNiPhkkvhRwZoUlSS?=
 =?us-ascii?Q?vwWTPT1VoPBO5dYXy05rWWm3hI4mQetvvY9qVhHES0CwSBhiuo9W7vOc0bFT?=
 =?us-ascii?Q?yPy/jjwsykwaFaoFFFt8k2/pxtvykduiTZcn6FXAD3p8nNjpONxjVXBkfjFd?=
 =?us-ascii?Q?AxRPSPiKsxyep8ohx8KUJuNT8f+3/qgFLMJUJB+vzZeMJXFK4sw6eZseWCUC?=
 =?us-ascii?Q?Oy64bI5I4tl2cqFLoGVOPJmjTR8rfFXDuBTrIIlVyxmIwAZHkHlVjccj1xpE?=
 =?us-ascii?Q?ixj6ckBjAm7BJulVf77CbJt1WfSiluS1hCZUIwux7xumVCYO5ntSs3FvddoP?=
 =?us-ascii?Q?CExKRU8tJXpPTUuqfBhmTI0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0b2ef5-a3e0-4ee6-e991-08dcf43ab9e1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:47:04.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN87JgMvGvJ/9yMTydHE4br0k6G38B3ulBTzjqy1BbfxsKJjxs7LOTDpwXh4vnIS37krCv12EJuUP7TqtBRRC5ywDcenySvVbiskPkIjqdMDIahbOOTWI/F4QX1c9Zrl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6716
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 14:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113172



On 24/10/2024 19:18, Khem Raj wrote:
> Please test it and wait it to merge before sending pull request here,
> feature branches are temporary and usually not something we use in OE
>=20

Yes Khem, it is only temporary for CI build checking.

Can you please help run CI build? If any other errors, we'll fix.

Thanks,
Chanh

> On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>> Hi Khem,
>>
>> This is only a temporary patch. It helps check CI build errors on the
>> MCTP repo. Please help run the CI build; if any error you can show here,
>> then Jeremy will update the mctp repo to fix errors.
>>
>> Please don't merge this patch. When the CI builds completely without any
>> errors, I will push a new patch with the latest version on the MCTP repo=
.
>>
>> Thanks,
>>
>> Chanh
>>
>> On 24/10/2024 13:51, Chanh Nguyen wrote:
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>>    meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-ne=
tworking/recipes-support/mctp/mctp_2.0.bb
>>> index c6aa7c104..793afe755 100644
>>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
>>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
>>>
>>>    LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29d=
c61db21"
>>>
>>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
>>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
>>>
>>> -SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protoco=
l=3Dhttps"
>>> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross-fi=
xes;protocol=3Dhttps"
>>>
>>>    S =3D "${WORKDIR}/git"
>>>
>>


