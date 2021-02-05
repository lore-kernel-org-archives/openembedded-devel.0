Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.59])
 by mx.groups.io with SMTP id smtpd.web12.8950.1612536370952477573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ASDTJ3lH;
 spf=pass (domain: windriver.com, ip: 40.107.68.59, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZqB3S3E0rgRmTBcFqxCnMLhHJM7RE/VIZ1ivgTfjeqBKRut+bF3sd1kM+LHBdSg+ysRPjghckb1vTemjR2w2hd4F55yUpBa2fFq34CLgK067p9PnGamSAtPjSN8iqZDiaEOgRaF1kI99Si/j1iuVTZW+tjBtEeNK9IgMtGsRF/aiNgW+USg+Z5CiVOw5JR2ywT0FEBIeGc6lvFucF9OflB7Y6qcdlbzCCEbMMI4DOkbaCjc6Tqof8DWHknw6LhRZ+YKhwQrKtdzvvG/kB/E+O6Pi6KbyIgqs19evVFdUaLdZBIziQhe734AuWFrZAKw0Lvo2yc06ArxvQ5aMt4cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hhITwVNSbkxNFdPc/iQ7fZlvCEw2oGwXT5lumufP6Q=;
 b=ZxtYL7NpRxTKNHhNdiRaB+2geEpjELzI0xIZE9nn78tdrrCAPkMCS9hkSER/rJ/6A4ZOih4WekIedcl2pM4HF9WEY+ExJhVrswM5FV8T2tC6e3HbHKttyOz0fuWBhWfoeZSN8pvaIJJGw3tcepeFqO1mW32lX7CoMBjZsGjEuXjH/2abbw1l8qjNvf5jEP4HX+wXAvXQfX/5CQrOWJv4WI7TuDw0wh+PydSpMehWzS3hoY8X/XVQfPdexC0BNKc+dh+6n082nB9CW4CPw3n5lU6UyBiUPrEOwEJZVnRy9OEa3mGvHGqm0JbcyhnDIYLqAaDYz7AagqZd+GnaNXfx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hhITwVNSbkxNFdPc/iQ7fZlvCEw2oGwXT5lumufP6Q=;
 b=ASDTJ3lHIjqDkE4Zg5oFqpIuJFn/UYLo34uHV0oEutT5y1ZzV2Lxyr79dbDnW9LbgcN0t5qTB8alslAHcLmB6c7OLtFpEcoIPp/3rtcVQE3Au5vOspx6CtTqgjuNyZnUf80oIUmKeqnJ0/DFNBBBYiVEUFjScpSVeFW+1s2E/Hs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Fri, 5 Feb
 2021 14:46:07 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.027; Fri, 5 Feb 2021
 14:46:07 +0000
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, hongxu <hongxu.jia@windriver.com>,
 Randy MacLeod <randy.macleod@windriver.com>, "Chen, Qi"
 <qi.chen@windriver.com>, Ross Burton <ross@burtonini.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com>
 <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
 <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
 <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com>
 <CAMKF1soXQNO8Jx_iHN+3rGam6qNJ1SsUyPXZgHv=F7NyGgwpOQ@mail.gmail.com>
 <CAMKF1sr-fsVGdCegDri4Vy7cJK8AZ18M6X8E76XThfi7C34KLQ@mail.gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <86f09202-225b-ceee-ebfd-1f4ad3be20c1@windriver.com>
Date: Fri, 5 Feb 2021 09:46:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sr-fsVGdCegDri4Vy7cJK8AZ18M6X8E76XThfi7C34KLQ@mail.gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: MN2PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:208:15e::37) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by MN2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:208:15e::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 14:46:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 063198a2-a9a3-4769-54b6-08d8c9e4c588
X-MS-TrafficTypeDiagnostic: SA2PR11MB5004:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB50045397C665C60A3725FFA980B29@SA2PR11MB5004.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dJmN3FcV5v/EMG/l1CHr/hIX8XHQkjjVjG8sMu8Tdlj7pMBXwB1uxhbvup2g/FgSj9+0zFdf3muznYaegSPpP2oPM+X7ZS+Af16CUS4Yr0DRpcGCaocN7kXwo4HEJRe4aINEw9KDIhtNmM3PkPqLi77kT6J91XQmM6qXJ5dREIII++irmlEvdcSScKDEKSdartqDdRqu/lW5wX8uc+trFtCqQgtZQbAHiVTttY4+NiIoditzr5WZd2qqhKI//a+oewZV9YlagW8gpKFd1TlWqVURfVFMQHzYBrptMq5f7S6xfre4uROeAnAGXj1+/d2iAA8Qud69ucmb55m79G+N6fz0DfS/r9fdbkKygkxcVBEWIdekxVnO1Lx2ad7yO7FSOvW82q6yxw5HNAWcIih6XUcDUe3NtoTE+ZrLOx9hTjRJ12DW1/scLW7X9TQHd8zuqhOVtZ6gUczsqEU4XnLydtmu5D2Ltk0Co30QLIgI0UN01oPVhVftQhXJy4WV3mSPjTXtZ/Sy+NuZekO7EoxCZKdUi3ES6FUfmKKOmh2mFGcvNIyP7Y0rPH97czcSqUugYdvwhbpATitB14y1oKNbOOILc1bDUvaSUOa0/4cOSjpSOj17kw4vtWNPP++4prOlnOqzYYAjoRext4rUqcJ2/cn+MfyzcEkIms7j0pjQzDj9PkI2GgNtFr+X9wGrWIus
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39830400003)(396003)(136003)(376002)(956004)(54906003)(2616005)(53546011)(31686004)(2906002)(66946007)(66556008)(66476007)(16526019)(5660300002)(166002)(26005)(8676002)(16576012)(8936002)(966005)(6916009)(4326008)(478600001)(316002)(186003)(52116002)(33964004)(31696002)(6486002)(83380400001)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RHMreFlvdHZRSERHUThtRWhJdTJ0Z083K3ZRM1hIZm9sZjBTbVg0THo0M3RN?=
 =?utf-8?B?OWo3ZTJWZUVFMk51OERGSW1JelJMOW8rLzF4cGlqTy8yRHl0WVc5WTBRMEtr?=
 =?utf-8?B?LzZpcUhNODlQSEpGSW4xeHM1RThTWHh0RnRMbTdNNVlZYlk5bWxZWmxIV2dX?=
 =?utf-8?B?UEw4QU1XNEZRbTFmVFFEYVdNUEFEalFseWxGanB0eCtmWEJIMHhzcWRScDRX?=
 =?utf-8?B?dmI2N0x0SkJqZ1VUR09VKzVUalZRUXhZTzgrdkpsSzRBQXRJbWhaNHpIMkVp?=
 =?utf-8?B?YkhOSi9lQjJ5eXRYd1ErbjVuMUFIV0laeVUySGVrRlRrRXFNaElBNjlHTVFt?=
 =?utf-8?B?YWlYeHJya1ZmYTY5YWtsa2dxUmd2aCtTOGhYY0Z6Ymo0b2plV2N5UExjZnpq?=
 =?utf-8?B?S2JJUHFZVGxNbXJsTkg1emJqcTNicjQ3T09wTWU1U09lYVl0RFpRYkZVRUho?=
 =?utf-8?B?NW15TnNicVNBa1l5VEtPakVKbnBEWVBuZ2FtSjZvSTFEMi9jWlhsNmU4UUZ1?=
 =?utf-8?B?WGR4YUE5RVNFa20xUXlSSFNCNTZ0T1Q2TjRNSUFxL0JJcUVHTHNhN0J2Qldj?=
 =?utf-8?B?dG9MSWVkbmZocE9peTdac2p6Z3ZONGlmQ0VGR3dHTjZDVHBYT041V2Qrbk1h?=
 =?utf-8?B?VVZrN2VzdU5NdVIxT0RnN0dTR0hRa3hZL21MY3FSU3VxdGJxZlA4cGxUT3Jq?=
 =?utf-8?B?RFZxTzVheW1ZZ01ISVJZSkVLSFBaS08zeGswK09DbUdxaHdzSUpDaHNPdDZy?=
 =?utf-8?B?bHc4N0xUYlQxeVkvZjEzeHp2YVBQbGg4T1dWZkxlTmxNU1dYQUZVR2o2V0p4?=
 =?utf-8?B?L0VqZ09naE9HMGwxTUdsdGRpazJURlBjTGZoWDY5ellOWUtjYmRqRHZQdE9u?=
 =?utf-8?B?aHlZZFpoeTJka2VwN2E0cmk5RVhHQjVFL0JZSmo0eDM2TkpuVE1sYzZGYkVE?=
 =?utf-8?B?WFRDVzBlZHR2djRkbHp3a2pWYlUwSFV3WTRLTXhtMEd6UnVsZEkweXUvdis0?=
 =?utf-8?B?bnRPemMyNVdwSHJvdklDZXRRM1U3Ym5oTitmS2ZONUtldTdkbGs0eERZMmQ4?=
 =?utf-8?B?akpRVjF2UTZQd0QrNDR3Qk1hYjlpbnVhQTJxV01IQi9FUlRQWE83d2o0MTR5?=
 =?utf-8?B?eitIck1hWEtCZldzTTk3VmJGY3VpZmV0L3o5Qm9kVm12VmNzMDB5UklaZ0kr?=
 =?utf-8?B?dDlwelVPZXU4TXZHQVMrOEN1MTB4dFZlRjQwZnIzQjU1U3VhcHlMclprVXdG?=
 =?utf-8?B?UDJwWXp2UGV1QXI3blAwOTNSZkQxc0xjd3FsMGZyb0xlUVZLS3Q4VGV5Ym1R?=
 =?utf-8?B?dlo4RUJEWVhoOUFjRk5pUTR0T01kUlg3RHpNQVJPQ0lMK3psb05sQWk3WVB6?=
 =?utf-8?B?ckFmbmFEVlhMTTBiQ1I4ZlFBcXpLNjd4aWVrcXJKYVhZOHcyV3Y0WWpvVWVm?=
 =?utf-8?B?ZFNFNXlMUTc0V0NuMzJoSzlSVUZNY3k3cWhXOWdSWHZnMU1tS0dhZndvVWhz?=
 =?utf-8?B?Q1NnRWFVRFFXTVhwTUw3RHhnYnN6b3FCRWFDSGhoeWFjWVJOTmR5c2tWa1Rs?=
 =?utf-8?B?VUlldXlIR2MzdDdoSXVBc0ZzY0FRa2tQTHhrc3NRWFJhbW5oYW1TdmcwUGRB?=
 =?utf-8?B?ejlMK1RQeXV4MnRZYm1OREtFbUY3Rk1qUVk0L1Q0Z3ViS09IcTVmQXpqRjFJ?=
 =?utf-8?B?T1ZoVmVBalJscUgyYnAwMlg3NDJ4VmFBUlBhalRyeEgzNzhod1JVQnoreVRl?=
 =?utf-8?Q?L8mCCkqHZgK0R6IB7McZqLLwQ/lkXi5wbNRDBTO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063198a2-a9a3-4769-54b6-08d8c9e4c588
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:46:07.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uw8eJDQNHX5sZQElJNpJQ4lp7aaeL52W7zo4uq459fIdTG/hDBQr7TGulqa/MzN/pR4TnEA1R0Lj5AHasSinw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
Content-Type: multipart/alternative;
 boundary="------------20DB4D328E0C104AE6DC1BA7"
Content-Language: en-US

--------------20DB4D328E0C104AE6DC1BA7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

libmcrypt still uses autoconf 2.59. last release seems to date from 2007

https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/

its not going to be a piece of cake...

On 2/4/21 10:26 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> We are now left with 15 odd packages
>
> https://errors.yoctoproject.org/Errors/Build/116395/
>
> On Thu, Feb 4, 2021 at 1:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>> here is latest list
>>
>> https://errors.yoctoproject.org/Errors/Build/116365/
>>
>> Just look at the do_configure failures for filtering to autotools issues only.
>>
>> On Thu, Feb 4, 2021 at 1:09 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>>> Andrey,
>>>
>>> i am working on this now.
>>>
>>> since you already submitted iperf3, i'll focus on
>>>
>>> libmcrypt.
>>>
>>> i'll test and build both of them once i figure out libmcrypt.
>>>
>>>
>>> On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
>>>>>> - iperf3 - YiFan
>>>> I just sent a patch for this one:
>>>> https://lists.openembedded.org/g/openembedded-devel/message/89274
>>>>
>>>> YiFan, can you please have a look at it to see if it fits?
>>>>
>>>>
>>>> 
>>>>

--------------20DB4D328E0C104AE6DC1BA7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>libmcrypt still uses autoconf 2.59. last release seems to date
      from 2007</p>
    <p><a class="moz-txt-link-freetext" href="https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/">https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/</a></p>
    <p>its not going to be a piece of cake...<br>
    </p>
    <div class="moz-cite-prefix">On 2/4/21 10:26 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1sr-fsVGdCegDri4Vy7cJK8AZ18M6X8E76XThfi7C34KLQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

We are now left with 15 odd packages

<a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Build/116395/">https://errors.yoctoproject.org/Errors/Build/116395/</a>

On Thu, Feb 4, 2021 at 1:47 PM Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
here is latest list

<a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Build/116365/">https://errors.yoctoproject.org/Errors/Build/116365/</a>

Just look at the do_configure failures for filtering to autotools issues only.

On Thu, Feb 4, 2021 at 1:09 PM Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Andrey,

i am working on this now.

since you already submitted iperf3, i'll focus on

libmcrypt.

i'll test and build both of them once i figure out libmcrypt.


On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">- iperf3 - YiFan
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I just sent a patch for this one:
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/89274">https://lists.openembedded.org/g/openembedded-devel/message/89274</a>

YiFan, can you please have a look at it to see if it fits?

</pre>
            <br>
            <fieldset class="mimeAttachmentHeader"></fieldset>
            <pre class="moz-quote-pre" wrap="">


</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------20DB4D328E0C104AE6DC1BA7--
