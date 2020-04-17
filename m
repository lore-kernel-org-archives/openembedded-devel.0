Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.63])
 by mx.groups.io with SMTP id smtpd.web12.1238.1587131191783412750
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 06:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MW/Luqr8;
 spf=pass (domain: windriver.com, ip: 40.107.69.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpKp3MorlVkIlm4tFBk3ba7fnH11z5/hA0yk4byVpF7PNutkS8AUrlacNIqkGZc5B7O2CArfP18yL1RQOQ7NyxAuXgdTD9/KWaQIstuFInyW7RVahEWTZ8iKJchaCVf1y1/1z87R3/18qKzpu8zcxbKadAwbVcJiFl58RL5E/cf4JU5y6i/ejv8jVy8TaS74/zNwUQLF2ar8V5WA0pF2bhZYfVzKwHnx3smAGucoHHC6No/H29yqtJ58TDYKkvhAfhRMlwrzogBrSK+qC0oybtwgyJh7/WynHh5mregdZpeKPy05zWHyzLpZpl8GuoZrtTBEYSdW4Eh0PfDEAcx25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNTdMxYf5m/pZGHilFUCcq7i4poMZV4Gzad8JBFy/9Y=;
 b=FHP53GuZ62wlgIjPJJyKqHm0/Eq9Dhpjis1haDnOSGezk5dpe2FncfJOsaVnOa7jtcEarxdsE1Y+F5l38p8uvRE/nnkOlxXUeb3VEUUb/ZA1gXUyeAWER88UhAA/obN+XN70IhtFXjbSZvoVw9ga74Etxhy+9pv3cUmQdM7AH2TreisjYksxN7Y2EIxRvLAzUTCqexLhYPDG/R3GLo5HpxWRl0E8jT/51AImlkMA7C+NC1BRm7AOvXBQyPGWzq9JG2wjM79JccvbKeD7HfxXjxz+rJFKWUEYf1U76vXa94Py9wnPHomPSlZSZAl3jafUd9g4w834PqBYrk2fHkRt8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNTdMxYf5m/pZGHilFUCcq7i4poMZV4Gzad8JBFy/9Y=;
 b=MW/Luqr8Kl0BYw4bXHBUApgcahdwunrSKZpKAuOA2r7vpU5ndak2glXDqVYvPXhFawBN2u0WJd/NLfYJIQTMLAZgmq5KHM2RRmhOD8SqzpF2M6JsNK1H8NQpfjHufuw5OBwnfIEsAOXP6uMaDIj85qPwLgluoKTUUDQWLZ8vdik=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trevor.Gamblin@windriver.com; 
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1537.namprd11.prod.outlook.com (2603:10b6:405:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 17 Apr
 2020 13:46:28 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd%7]) with mapi id 15.20.2878.027; Fri, 17 Apr 2020
 13:46:28 +0000
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
 <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
 <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com>
 <07865a3bea714ee88fb74d336ab10831@XBOX03.axis.com>
 <3a8a31f8-893a-0fc9-505c-f3bc389d0b31@windriver.com>
 <CAMKF1spSh1aZGfaEkfeqFS5ERPwbTgksJ83ZQ0wtf9D=HbNDug@mail.gmail.com>
 <54a3fe458efc404d99acae09c7492aa0@XBOX03.axis.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8e27494d-7650-df7a-c886-f4e187825db7@windriver.com>
Date: Fri, 17 Apr 2020 09:46:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <54a3fe458efc404d99acae09c7492aa0@XBOX03.axis.com>
X-ClientProxiedBy: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 13:46:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 738ca655-9e28-4857-4379-08d7e2d5ba7d
X-MS-TrafficTypeDiagnostic: BN6PR11MB1537:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1537855A94AC0ADF37BB4AA29FD90@BN6PR11MB1537.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39850400004)(366004)(376002)(396003)(346002)(136003)(2906002)(81156014)(2616005)(4326008)(478600001)(966005)(44832011)(36756003)(5660300002)(8676002)(956004)(33964004)(31686004)(53546011)(86362001)(6486002)(26005)(66946007)(66476007)(66556008)(316002)(31696002)(52116002)(8936002)(110136005)(186003)(16526019)(16576012);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LBgyQz1Nm4e3myf+lZRhW9UEUmBhIQEkiYfkjsMx54UGkxnEQsFWAskiJKtxQHAU7oHJbBWsIVIsXleVkxRPvtsuPcyMjXxyqudnAJDuvw0BuGe+xEPCTNd52jknDWfeYmkEMhRHMR/WlcLLgNTZ2gjPwgeTt+S5hkoyeuMo8kUrCWBFvQvzhlB3H69NdTKT1NYQhsYQ3te9Y7BB2LZ28D8t0EcFtEeTsv6bLAuZeTbCT7YpLvPgeiBgnq1ZEelBrkWx0m1gHAUOH1EugLiRBJTCapq8ch8PEp5yW9P+dRduOuPw1eShFcM/0MDM+AxQ5HnqWaXIpViSUSw2APbbf8JSC77s4ZfrEOUeB2u7t+rq0IycV4aYf+IWINO0P2KlVS9MPMTq2GHYuBbitNjK/yAF0JLPEXeJLaZ0znfyDdEy3Uv+UOApbxdhe+vrrGTxwB2Qe78MPxN//mYlc7oP1AnQPMv9u5QJ3mooAaZyMTgcET/I1EoqVyGuON7quSIo4qwm0USOh31y/se9sDjzqw==
X-MS-Exchange-AntiSpam-MessageData: 
	Ai5tauQoNWIfaX3926gH3oSxhJC/ottIK3owIatVHzA7zrIcwzoAKfOJK3fkc4KoMfT8n3WA4hnYsm/sc05XxsPhzU9z5/Z8EkQN0AEXpyjIklbov2oKerMI/LFA9xO7kOGg9ZsArosIRslU30NYmw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738ca655-9e28-4857-4379-08d7e2d5ba7d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 13:46:28.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvPuLCYQQ8XwIo4LsfJYCgAaaRq0X2P6zYT0+Mm0P235+TEV5q9+nitgMziYZbC3BKQx4Nrl/9ytCLuqQk3iaLSxA1MConHD4mBbAPaUwg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1537
Content-Type: multipart/alternative;
 boundary="------------14F49CA3EA617546A29C98E0"
Content-Language: en-US

--------------14F49CA3EA617546A29C98E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/20 6:46 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Khem Raj <raj.khem@gmail.com>
>> Sent: den 16 april 2020 17:49
>> To: Trevor Gamblin <trevor.gamblin@windriver.com>
>> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembeded-devel
>> <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 ->
>> 2.4.43
>>
>> On Thu, Apr 16, 2020 at 6:21 AM Trevor Gamblin
>> <trevor.gamblin@windriver.com> wrote:
>>> On 4/15/20 7:02 PM, Peter Kjellerstedt wrote:
>>>>> -----Original Message-----
>>>>> From: openembedded-devel@lists.openembedded.org <openembedded-
>>>>> devel@lists.openembedded.org> On Behalf Of Trevor Gamblin
>>>>> Sent: den 15 april 2020 02:10
>>>>> To: Khem Raj <raj.khem@gmail.com>
>>>>> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
>>>>> Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 ->
>>>>> 2.4.43
>>>>>
>>>>> On 4/14/20 6:38 PM, Khem Raj wrote:
>>>>>> apache-websockets does not like it
>>>>>>
>>>>>> https://errors.yoctoproject.org/Errors/Details/403771/
>>>>> Thanks, will take a look at it and re-send.
>>>> It appears they have added cross compilation support to apxs, but
>>>> it clashes with the changes done in OE to make it support cross
>>>> compilation. I tried to solve it by basically removing the OE
>>>> changes, but it was not as simple as that. In the end we worked
>>>> around it with this quick fix:
>>>>
>>>> apache_sysroot_preprocess_append() {
>>>>           # Disable apxs' built in cross compilation support and rely on what the
>>>>           # recipe sets up.
>>>>           sed -i 's!$destdir = .*!$destdir = "";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>>>> }
>>>>
>>>> However, I hope you can come up with a better solution that
>>>> actually makes use of what they did upstream and thus lessen
>>>> the changes that have to be applied by OE.
>>> Hi Peter,
>>>
>>> Ironically I'm seeing your email just as I submit a v2 reverting their
>>> cross-compilation changes. I wasn't able to find a better workaround
>>> than just reverting the destdir stuff that they added, but I did it via
>>> a patch file instead of within the recipe itself. I do like your
>>> approach better though, as it avoids adding a patch file that'll have
>>> to be maintained. Do you want to submit your fix in lieu of mine?
>> yeah I think revert is last resort. So lets see if we can fix it
> Well, my solution just disables the upstream change, so it doesn't
> really make use of it. I think a patch is better than the quick sed
> fix I did since it means there is context to the change. However,
> you don't need to revert all of the upstream change. Just commenting
> out these lines would do:
>
> my $ddi = rindex($0, "@exp_bindir@");
> if ($ddi >= 0) {
>    $destdir = substr($0, 0, $ddi);
> }
>
> That should improve the chance of the patch continuing to apply for
> future versions of apache.

That does work too, and it's a little less nuclear :)

I'll submit the v3 shortly.

>
> //Peter
>
>
> 

--------------14F49CA3EA617546A29C98E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/17/20 6:46 AM, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:54a3fe458efc404d99acae09c7492aa0@XBOX03.axis.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Sent: den 16 april 2020 17:49
To: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
Cc: Peter Kjellerstedt <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com">&lt;peter.kjellerstedt@axis.com&gt;</a>; openembeded-devel
<a class="moz-txt-link-rfc2396E" href="mailto:openembedded-devel@lists.openembedded.org">&lt;openembedded-devel@lists.openembedded.org&gt;</a>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -&gt;
2.4.43

On Thu, Apr 16, 2020 at 6:21 AM Trevor Gamblin
<a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On 4/15/20 7:02 PM, Peter Kjellerstedt wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> &lt;openembedded-
<a class="moz-txt-link-abbreviated" href="mailto:devel@lists.openembedded.org">devel@lists.openembedded.org</a>&gt; On Behalf Of Trevor Gamblin
Sent: den 15 april 2020 02:10
To: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Cc: openembeded-devel <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-devel@lists.openembedded.org">&lt;openembedded-devel@lists.openembedded.org&gt;</a>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -&gt;
2.4.43

On 4/14/20 6:38 PM, Khem Raj wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">apache-websockets does not like it

<a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Details/403771/">https://errors.yoctoproject.org/Errors/Details/403771/</a>
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
Thanks, will take a look at it and re-send.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
It appears they have added cross compilation support to apxs, but
it clashes with the changes done in OE to make it support cross
compilation. I tried to solve it by basically removing the OE
changes, but it was not as simple as that. In the end we worked
around it with this quick fix:

apache_sysroot_preprocess_append() {
         # Disable apxs' built in cross compilation support and rely on what the
         # recipe sets up.
         sed -i 's!$destdir = .*!$destdir = &quot;&quot;;!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
}

However, I hope you can come up with a better solution that
actually makes use of what they did upstream and thus lessen
the changes that have to be applied by OE.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Hi Peter,

Ironically I'm seeing your email just as I submit a v2 reverting their
cross-compilation changes. I wasn't able to find a better workaround
than just reverting the destdir stuff that they added, but I did it via
a patch file instead of within the recipe itself. I do like your
approach better though, as it avoids adding a patch file that'll have
to be maintained. Do you want to submit your fix in lieu of mine?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
yeah I think revert is last resort. So lets see if we can fix it
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, my solution just disables the upstream change, so it doesn't 
really make use of it. I think a patch is better than the quick sed 
fix I did since it means there is context to the change. However, 
you don't need to revert all of the upstream change. Just commenting 
out these lines would do:

my $ddi = rindex($0, &quot;@exp_bindir@&quot;);
if ($ddi &gt;= 0) {
  $destdir = substr($0, 0, $ddi);
}

That should improve the chance of the patch continuing to apply for 
future versions of apache.</pre>
    </blockquote>
    <p>That does work too, and it's a little less nuclear :)</p>
    <p>I'll submit the v3 shortly.<br>
    </p>
    <blockquote type="cite" cite="mid:54a3fe458efc404d99acae09c7492aa0@XBOX03.axis.com">
      <pre class="moz-quote-pre" wrap="">

//Peter

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------14F49CA3EA617546A29C98E0--
