Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id C543F606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 14:50:12 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BCA2DF811E3; Wed, 17 Jun 2015 08:50:13 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 35639F811D8;
	Wed, 17 Jun 2015 08:50:12 -0600 (MDT)
Message-ID: <55818938.3090405@mlbassoc.com>
Date: Wed, 17 Jun 2015 08:50:32 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CALbNGRSo5g0ndeQTmrKYppX6g6-KTB2CrnDjJCs=d84PxnpQPQ@mail.gmail.com>
In-Reply-To: <CALbNGRSo5g0ndeQTmrKYppX6g6-KTB2CrnDjJCs=d84PxnpQPQ@mail.gmail.com>
Subject: Re: [meta-browser] firefox not working for me (only)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 14:50:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-06-17 08:36, Andreas Müller wrote:
> Hi Gary,
>
> Turned off-topic so I opened a new thread. For those who missed the
> old thread [1] in short:
>
> for me
>
> * firefox fails with illeagal ARM instruction
> * chromium fails during start - details I can't reproduce currently
>
>
> On Wed, Jun 17, 2015 at 3:32 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>> Hmm - I was wondering why nobody took care.
>>>
>>> All my plattforms fail:
>>> * i.MX6 base
>>> * gumstix
>>> * raspberry Pi2
>>>
>>> I'll put this browser issue on my TODO currently I have no further
>>> time to take care.
>>
>>
>> BTW, I just tested both chromium and firefox on the i.MX6Q and RPi2
>> and they worked just fine.  Built from meta-browser:0cc0419a
>>
> Thanks for information. Let's focus on firefox's illegal ARM
> instruction crasher:
>
> * Last time I felt the only one facing a specific error it was caused
> by angstrom enabling thumb(2) for ARM (long story @meta-fsl-arm).
> Gary: I assume, you don't have thumb enabled - right?
> * firefox doesn't crash with "--safe-mode"

I am not using thumb - off the shelf configurations for RaspberryPi2 and
BoundaryDevices nitrogen6x built with $DISTRO=poky are the ones I've tested.

>
> Looking into meta-browser I saw that firefox pins ARM_INSTRUCTION_SET
> = "arm" but firefox-l10n does not. When having some time left over
> (=never) I will test with thumb disabled for firefox-l10n and
> chromium.
>
> Andreas
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106229.html
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

