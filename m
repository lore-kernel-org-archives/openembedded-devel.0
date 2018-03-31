Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id BCE2B72EDE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 15:46:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1522511201; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=a0fgUK9T0Fw74ojVX2VFh7Ujf2t8Qmy/FecRcL2QSuM=;
	b=BJ5E6qI2ga7zggSclDiXJ/VARCWTzw8/CENVV6TnMzvYlRlJkcGoCubc8EmKbAEDStIf2bKU
	UTvs8FoRo1LtZvhMduT3SvW+JCloZDO3c5WfmspNPjDDvjQ5ycj4wTnLTFKHwg7bbd+YpyJG
	QDq7QKGSl+g5X02S9XyrpWCecec=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mxa.mailgun.org with ESMTP id 5abfad61.7fc9b4341670-smtp-out-n02;
	Sat, 31 Mar 2018 15:46:41 -0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 142-v6so14595649itl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 08:46:40 -0700 (PDT)
X-Gm-Message-State: ALQs6tD+5UCjgIGqd23a5leIqFXK8ElTUbrDI2ApDLPF6eINR127DHvw
	fdzIiwNKb+JaGd2BjciaLpn5YFo3JhlcM9fiNPM=
X-Google-Smtp-Source: AIpwx49385o/2TwqrajmP6qv53mMK490cXL616I0Xt17kSZtEo7O7XZZ6YjovNi97ECi4kM4XFnYRPi+/6rA5med5Co=
X-Received: by 2002:a24:ec8:: with SMTP id 191-v6mr6133567ite.42.1522511200396;
	Sat, 31 Mar 2018 08:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Sat, 31 Mar 2018 08:46:39 -0700 (PDT)
In-Reply-To: <CAPGMVzGKpj8XvpOY8Nrz1gRUw7h5SvoSfymL-Njt66YnRJT3mQ@mail.gmail.com>
References: <CAPGMVzHX1O+POjqc03E+C7Vu60qXv2e_d0KJkLvqOH2innWBUQ@mail.gmail.com>
	<CADNbA1qxa_FQz5HbGssBLF_n7FHR+cfhNAj6FMT39+RnbqhVww@mail.gmail.com>
	<CAPGMVzGKpj8XvpOY8Nrz1gRUw7h5SvoSfymL-Njt66YnRJT3mQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sat, 31 Mar 2018 11:46:39 -0400
X-Gmail-Original-Message-ID: <CADNbA1otyx72T0CrwX=SgPT1zsgnbAnvqviE_oqE6XFQDA3dfw@mail.gmail.com>
Message-ID: <CADNbA1otyx72T0CrwX=SgPT1zsgnbAnvqviE_oqE6XFQDA3dfw@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: koen@dominion.thruhere.net,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: DEVELOPER QUERY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2018 15:46:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 11:03 PM, Rajath C S <rajathcs.1996@gmail.com>
wrote:

> Hi,
>
> Thank you for the response.
> 1. Yes, I totally understand the vitality of including the maillist id,
> but the reason i dint include was that i had previously included it couple
> of times for the same query and did not get the response back.Anyway, from
> now n i shall include for all.
> 2. Sorry about not providing the complete information like, so the layers
> included are - meta-oe, openembedded, meta-python, meta-networking and
> yocto-bsp, machine is set to qemux86 and image is sato. Thanks for the
> input,from next time i shall provide detailed info.
> 3. I have tried including connman recipe and ssl but nothing seems to be
> working,
> 4. The reason i couldn't make it a text based log is that i could'nt copy
> the contents from core-image-sato screen.
>
>
> 1. I am able to ping and apt-update is also working fine; which all
> suggests that the internet is working fine but when i do pip install i get
> the above error
>

You are running apt from inside the qemu instance?  Again, I ask you to
provide specific information about the image and your configuration.  The
out of the box sato core image does not provide apt.  I just tried
`core-image-sato` with pip added, and it worked just fine to install the
`wheel` package once I configured the DNS server.


> 2. Though i will try out with minimal once, did you follow any additional
> steps to configure network in minimal (did you have to add any additional
> layer , recipe)?
> 3. Yes, i have not configured DHCP
>

I asked specifically about your DNS configuration.  Is name resolution
working correctly from the qemu instance?


>
> Regards & Thanks,
> Rajath
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Sat, Mar 31, 2018 at 1:16 AM, Derek Straka <derek@asterius.io> wrote:
>
>> A bit of feedback regarding requests like these:
>>
>>     1) Please do not email general requests for help directly to
>> maintainers without including the mailing list.  When you email people
>> directly, the community cannot provide input or benefit from the
>> resolution.  Also, it usually ends up in the trash at least for me.
>>     2) The request did not provide any meaningful context on your setup
>> (meta layers, MACHINE, etc).  Without any context, the probability of
>> getting a meaningful response quickly is low
>>     3) The request didn't provide any of the debugging you've already
>> tried to fix the issue.
>>     4) Pictures don't really provide much if any value especially when
>> they are blurry.  A text based log is preferred
>>
>> Using core-image-minimal with pip added to the image (openembedded-core
>> and meta-openembedded on master - MACHINE=qemux86-64), I am able to pip
>> install wheel just fine:
>>
>> root@qemux86-64:~# pip install wheel
>> Collecting wheel
>>   Downloading wheel-0.30.0-py2.py3-none-any.whl (49kB)
>>     100% |################################| 51kB 256kB/s
>> Installing collected packages: wheel
>> Successfully installed wheel-0.30.0
>>
>> That said, how is your network configured?  My best guess based on the
>> sparse information provided is that you don't have a valid DNS server setup.
>>
>> -Derek
>>
>> On Fri, Mar 30, 2018 at 3:00 AM, Rajath C S <rajathcs.1996@gmail.com>
>> wrote:
>>
>>> Hi,
>>>
>>> Can you please help me with what the error in the attachment is about.
>>> If I can solve this error and fetch packages using pip then lot of my work
>>> can see great progress.
>>>
>>> Thank You,
>>> Rajath C S
>>>
>>>
>>
>

