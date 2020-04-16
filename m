Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.65])
 by mx.groups.io with SMTP id smtpd.web10.6133.1587043265354407848
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 06:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jGmhprUU;
 spf=pass (domain: windriver.com, ip: 40.107.244.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPu6IR1THuo4Det2qZf9hNZnTHbA2djAcu4X0xIRR2ae//AOlFALr5EOjVW6PHqQ2/OeO7CGtyPzinurMGVvBiNfoxiLHnw0gTj83j3cLipshUEhNUlyGSK2CkhazfBqWlmKmwUM5Z976emf9rt61NHqeqxUvZ8V9GOXPRPC5CnIYo4N3OuuMQ3u1a/cMfnJExw6/CmgJk7dT9zo/LHz7AQJLd22Rt/nLm4TUoErT5PXLpXd245L7phmy0T0LBFVg2Qq5ng2q0YBx+keedmdMyHTGh0Timpd0wriN7X/iC3/ufZV1jaUaZF+AytUMuxngPU2dmh3NLRlKdjAgjYcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uif62sm0GpnxCLXYrXg274CdZymlD+9zsZkj5Xty9xk=;
 b=npScDJoKCLGlFaanlTb6ETiqpe9Aa9tFT6qAWJ8MtBKoLcudyjf1x62mtmabjtnw6omC+bgul34/io359I/WhaWjyKkaB6vFmpyEWPooXTw0q1OgozcKh11oV0j+Pns+d8T3w9dBwNPY5F/ShJDht/ySNpJ/da0qAmGIRxYQ+GUOj4PZ0CygJNUKJkhbuM0OKMiFtjBmda6dwH3IIhzt4ax/kYz+fh9jGq6SVNaB6/J3tcG/fheOJFntuSwVWanALOMOVpxKRNswKaqlg0H/TwZdMhoZYQPux2Q96j7Htbka8fz4MVBa1KYaTGnpz6ZZvYRdD8pn3NsvdK81t8EgqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uif62sm0GpnxCLXYrXg274CdZymlD+9zsZkj5Xty9xk=;
 b=jGmhprUUqUIp4kcvnF0bPNUGJKvjlOz3EFroaRLaUc+wcRlH+r+/cPpzb2XyYWuW49/i9PJ8lv5wOITyrhxSijENV6tKZnqxaTrCvwl8XVBOB6TyxPa076Z5XLwYuPlkrdmZjfNFmx/QdRjhpGojvoUDgMwr7SUuOWDJft2sLVs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trevor.Gamblin@windriver.com; 
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB0017.namprd11.prod.outlook.com (2603:10b6:405:6c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Thu, 16 Apr
 2020 13:21:02 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd%7]) with mapi id 15.20.2878.027; Thu, 16 Apr 2020
 13:21:02 +0000
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
 <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
 <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com>
 <07865a3bea714ee88fb74d336ab10831@XBOX03.axis.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3a8a31f8-893a-0fc9-505c-f3bc389d0b31@windriver.com>
Date: Thu, 16 Apr 2020 09:20:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <07865a3bea714ee88fb74d336ab10831@XBOX03.axis.com>
X-ClientProxiedBy: YTBPR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Thu, 16 Apr 2020 13:21:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87eac7a6-4a98-43f3-823d-08d7e20902ab
X-MS-TrafficTypeDiagnostic: BN6PR11MB0017:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB0017648AA819A94FAE21DF489FD80@BN6PR11MB0017.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0375972289
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39850400004)(346002)(136003)(376002)(366004)(396003)(110136005)(6666004)(5660300002)(81156014)(966005)(2906002)(8936002)(36756003)(8676002)(956004)(6486002)(316002)(53546011)(4326008)(44832011)(478600001)(66556008)(16576012)(52116002)(31686004)(66476007)(83080400001)(31696002)(66946007)(86362001)(186003)(16526019)(26005)(2616005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	amtye6LHxnjkj/E9cqB0mQMpjF86VHMnVVTrovTc+C6bbb3BwOCXZ6aYaKqOFRNttd/tteUe08MTfT8ssSAgwl10vPD1gp0hba3BC9B5m/edRTYTdIXdGCnOg+QY8rv0ECk6QM9tZNn/0eZAurlaJZ/YaeybDY4Nqb+zgA7L/Ogkx7Wm/JWnbNBhvQNi3+xLwpjCsvWUN3e04oKsqjKZgrYxZEiJ2+YSctuF7tUJNOAe+DQacJuvZNjpcDK/ma1F992Y/RHze+7R3dDoyo1rVm89Zv1J9/uFayXJFPMPenwrCufSWIgPky4hYxcPAWaediadT/5RudKznie55A6qL7/I79jpT7F9cB2qVHurZtuHA3A10fSXVdX4s+Qh5GkCFE5/T022GIgjPXjkbKX3qnDARysovcuUab+kbI6QtTO+4iToY0i/rPJ9R3V/iYYfQ35mFnflrFKtwj/kC1bak0zVL2TKJgzjsWPNnzNBLsCVW8hSgbbHwPq3BvPdbZVdHtMnqXjedflJwG12Nz5bBw==
X-MS-Exchange-AntiSpam-MessageData: 
	h7vEgHBCVC46ak6/k/sKpVWdwK1iEHJoIMYPTnpnLxewqIRVfOkJA2Z9uJNcxOlSgeDDoObrnfeKwCqS9N1ZEnS/MpFQSzAn+qd7dS7z1eSZWIoLpbrRy4qD3wkjxdCegU0u17ePqD2Qev1zrplv1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eac7a6-4a98-43f3-823d-08d7e20902ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2020 13:21:02.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBSy3ksmqXmmZ+UJMCGLjicrApcMlr6gzYJlzGIEfHUFRAH1rT3b3N7Sw3QOo3XGeOkjoBbFemysuey4HKnGPibf0Ba1WP24wBgFktHnkZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0017
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/15/20 7:02 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Trevor Gamblin
>> Sent: den 15 april 2020 02:10
>> To: Khem Raj <raj.khem@gmail.com>
>> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 ->
>> 2.4.43
>>
>> On 4/14/20 6:38 PM, Khem Raj wrote:
>>> apache-websockets does not like it
>>>
>>> https://errors.yoctoproject.org/Errors/Details/403771/
>> Thanks, will take a look at it and re-send.
> It appears they have added cross compilation support to apxs, but
> it clashes with the changes done in OE to make it support cross
> compilation. I tried to solve it by basically removing the OE
> changes, but it was not as simple as that. In the end we worked
> around it with this quick fix:
>
> apache_sysroot_preprocess_append() {
>          # Disable apxs' built in cross compilation support and rely on what the
>          # recipe sets up.
>          sed -i 's!$destdir = .*!$destdir = "";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
> }
>
> However, I hope you can come up with a better solution that
> actually makes use of what they did upstream and thus lessen
> the changes that have to be applied by OE.

Hi Peter,

Ironically I'm seeing your email just as I submit a v2 reverting their 
cross-compilation changes. I wasn't able to find a better workaround 
than just reverting the destdir stuff that they added, but I did it via 
a patch file instead of within the recipe itself. I do like your 
approach better though, as it avoids adding a patch file that'll have to 
be maintained. Do you want to submit your fix in lieu of mine?

Cheers,

Trevor

>
> //Peter
>
>>> On Tue, Apr 14, 2020 at 12:49 PM Trevor Gamblin
>>> <trevor.gamblin@windriver.com> wrote:
>>>> LICENSE file was updated due to a typo fix.
>>>>
>>>> Note that this upgrade fixes two CVES affecting versions
>>>> 2.4.41 and earlier:
>>>>
>>>> CVE: CVE-2020-1927
>>>> CVE: CVE-2020-1934
>>>>
>>>> See:
>>>> https://nvd.nist.gov/vuln/detail/CVE-2020-1927
>>>> https://nvd.nist.gov/vuln/detail/CVE-2020-1934
>>>>
>>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>> ---
>>>>    .../apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb}        | 6 +++-
>> --
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>    rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.41.bb =>
>> apache2_2.4.43.bb} (97%)
>>>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
>> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
>>>> similarity index 97%
>>>> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
>>>> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
>>>> index a34734c20..2fff153fc 100644
>>>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
>>>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
>>>> @@ -24,9 +24,9 @@ SRC_URI_append_class-target = " \
>>>>               file://volatiles.04_apache2 \
>>>>               "
>>>>
>>>> -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
>>>> -SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
>>>> -SRC_URI[sha256sum] =
>> "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
>>>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
>>>> +SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
>>>> +SRC_URI[sha256sum] =
>> "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
>>>>    S = "${WORKDIR}/httpd-${PV}"
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>>>
