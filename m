Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 196957FAA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:30:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9PHUsFe011132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 10:30:54 -0700 (PDT)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 25 Oct 2019 10:30:54 -0700
To: Marek <marek.bykowski@gmail.com>, =?UTF-8?Q?Micha=c5=82_Lower?=
	<michal@pcb.red>
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
	<CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
	<CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
	<CAMKF1soZwpo0YewBPFJRqg6BQRkftPfcMLn91Vj=J538wox-2w@mail.gmail.com>
	<CAJNJ+3eixSQNxEd1WQKfucQ0ySh4N1qR9oGK=wLh=TrNN66M9g@mail.gmail.com>
	<CAHw2UgD3Vbt6t=+oYvJec7k2g0xWEyqFr6DvC-9TtnJVvgvHUg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c5392435-2c09-873a-235d-206fa0d9d026@windriver.com>
Date: Fri, 25 Oct 2019 13:30:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAHw2UgD3Vbt6t=+oYvJec7k2g0xWEyqFr6DvC-9TtnJVvgvHUg@mail.gmail.com>
X-Originating-IP: [172.25.44.8]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] update python setuptools-scm from 2.1.0 to 3.3.3
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
X-List-Received-Date: Fri, 25 Oct 2019 17:30:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 10/24/19 5:45 AM, Marek wrote:
> Or use any other email client like Claws, works perfectly for upstream patches

Marek,
   Is the client going to behave better than git send-email?

Michał,

Did you look at:
   https://git-scm.com/docs/git-send-email/
for:
   "Use gmail as the smtp server" ?

Our docs:
 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

do cover the basic setup but don't cover a multifactor authentication
setup that the man page mentions. If that works for Michał, we can
add a sentence and a link in the OE Howto doc.
Send patches to yourself or to me if you want to try it out.

Thanks,

../Randy

> 
> On Thu, 24 Oct 2019 at 11:07, Michał Lower <michal@pcb.red> wrote:
>>
>> thanks for the hint, will do.
>>
>> czw., 24 paź 2019 o 11:03 Khem Raj <no-reply@forwardemail.net> napisał(a):
>>>
>>> On Thu, Oct 24, 2019 at 9:48 AM Michał Lower <michal@pcb.red> wrote:
>>>>
>>>>> please use git format-patch to generate it
>>>> This is exactly what I've did. Sadly it appears that Gmail inserts
>>>> line breaks on its own. Can I send the patch as an attachment so it
>>>> will be kept intact? I cannot use git send-email since it doesn't
>>>> support gmail two actor authentication and my account doesn't allow
>>>> for application passwords.
>>>
>>> yeah I see. if you use github then send a pull request against
>>> https://github.com/openembedded/meta-openembedded
>>> I do process that as well.
>>>
>>>>
>>>> czw., 24 paź 2019 o 10:18 Khem Raj <no-reply@forwardemail.net> napisał(a):
>>>>>
>>>>> Hi Michał
>>>>>
>>>>> This patch appears malformed. So please use git format-patch to
>>>>> generate it and git send-email to send it also rebase it on top of
>>>>> latest master
>>>>>
>>>>> On Tue, Oct 22, 2019 at 9:03 AM Michał Lower <michal@pcb.red> wrote:
>>>>>>
>>>>>> Previous version fails to compile for zeus branch. Upgrading fixes that.
>>>>>>
>>>>>> Signed-off-by: Michal Lower <michal at pcb.red>
>>>>>> ---
>>>>>>   meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 ++--
>>>>>>   ...setuptools-scm_2.1.0.bb => python-setuptools-scm_3.3.3.bb} | 0
>>>>>>   ...etuptools-scm_2.1.0.bb => python3-setuptools-scm_3.3.3.bb} | 0
>>>>>>   3 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>   rename meta-python/recipes-devtools/python/{python-setuptools-scm_2.1.0.bb
>>>>>> => python-setuptools-scm_3.3.3.bb} (100%)
>>>>>>   rename meta-python/recipes-devtools/python/{python3-setuptools-scm_2.1.0.bb
>>>>>> => python3-setuptools-scm_3.3.3.bb} (100%)
>>>>>>
>>>>>> diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
>>>>>> b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
>>>>>> index 98883ec39..a7e1bf6ad 100644
>>>>>> --- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
>>>>>> +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
>>>>>> @@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions
>>>>>> by scm tags"
>>>>>>   LICENSE = "MIT"
>>>>>>   LIC_FILES_CHKSUM =
>>>>>> "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>>>>>>
>>>>>> -SRC_URI[md5sum] = "cfec5d2dbbd0a85c40066f79035b5878"
>>>>>> -SRC_URI[sha256sum] =
>>>>>> "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
>>>>>> +SRC_URI[md5sum] = "50b2199082fe808d032ec1710c9d7415"
>>>>>> +SRC_URI[sha256sum] =
>>>>>> "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
>>>>>>
>>>>>>   PYPI_PACKAGE = "setuptools_scm"
>>>>>>   inherit pypi
>>>>>> diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
>>>>>> b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
>>>>>> similarity index 100%
>>>>>> rename from meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
>>>>>> rename to meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
>>>>>> diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
>>>>>> b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
>>>>>> similarity index 100%
>>>>>> rename from meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
>>>>>> rename to meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
>>>>>> --
>>>>>> 2.17.1
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

