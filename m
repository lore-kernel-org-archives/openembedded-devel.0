Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8187ED87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:20:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6A1KLcm002113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2019 18:20:21 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 9 Jul 2019 18:20:08 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
	<20190628100721.GB18526@localhost>
	<0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
	<CAMKF1sqfgaDzxRuce8uACF7wascrtR6xj8rGT7GOpf7E=oV8tA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <85785fbc-ebec-f406-786b-6f69d5e719c3@windriver.com>
Date: Wed, 10 Jul 2019 09:20:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqfgaDzxRuce8uACF7wascrtR6xj8rGT7GOpf7E=oV8tA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
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
X-List-Received-Date: Wed, 10 Jul 2019 01:20:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 7/10/19 1:40 AM, Khem Raj wrote:
> Hi Hongxu
>
> Lets wait until 1.20 release of network manager. Can you propose this
> again after
> 1.20 is released and upgraded in OE?

No problem

//Hongxu


> On Fri, Jun 28, 2019 at 7:57 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 6/28/19 6:07 PM, Adrian Bunk wrote:
>>> On Thu, Jun 27, 2019 at 09:47:49AM -0400, Hongxu Jia wrote:
>>>> Since commit [061953143 networkmanager: Update to 1.18.0] applied,
>>>> upstream disable libnm-glib by default. And in further networkmanager,
>>>> upstream removes libnm-glib, libnm-glib-vpn, and libnm-util for good
>>>> ...
>>> Any strong reason for removing this already now?
>> Make sure to clean up empty package, in 1.18
>>
>> libnm-glib is already disabled, and left three empty
>>
>> packages(no package generated acturally). I found
>>
>> the issue, trace the reason and provide fix
>>
>>
>> You may note original PACKAGECONFIG[glib] does not have
>>
>> without option, so clean up it rather than add missing without option
>>
>> PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
>>
>>
>>> It's gone in 1.20 so removal then is clear, but if someone wants
>>> to use it for legacy code with 1.18 this should stay possible as
>>> long as <= 1.18 is shipped.
>> I think it will be upgraded 1.20 soon, and if someone wants
>>
>> to use legacy code, I think 1.16 in warrior is better choose
>>
>> which libnm-glib is always enabled
>>
>> //Hongxu
>>
>>
>>> cu
>>> Adrian
>>>


