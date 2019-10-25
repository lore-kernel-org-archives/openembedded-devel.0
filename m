Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 753D77FB4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:46:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9PHkEpK024646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 10:46:14 -0700 (PDT)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 25 Oct 2019 10:46:13 -0700
To: Khem Raj <raj.khem@gmail.com>, Martin Schwan <m.schwan@phytec.de>
References: <20191009123218.19821-1-m.schwan@phytec.de>
	<84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
	<CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
	<CAMKF1sotEEJe9NwkD5+pht-MZW+WKAY+CKjyJ7h5miovyVZs1w@mail.gmail.com>
	<9254d78a3ffd70fbda4f7fe4e5a10e8058a413cf.camel@phytec.de>
	<CAMKF1srmNZGx=1G5B=rAaaNHJ=pWqwq=pT3art=Sv8XtFDS7=w@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a567aa12-2dc6-b553-ee01-79b2cd8833e5@windriver.com>
Date: Fri, 25 Oct 2019 13:46:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1srmNZGx=1G5B=rAaaNHJ=pWqwq=pT3art=Sv8XtFDS7=w@mail.gmail.com>
X-Originating-IP: [172.25.44.8]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python-waitress: Add recipes
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
X-List-Received-Date: Fri, 25 Oct 2019 17:46:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 10/25/19 5:08 AM, Khem Raj wrote:
> On Fri, Oct 25, 2019 at 8:39 AM Martin Schwan <m.schwan@phytec.de> wrote:
> 
>> Ah, thank you! I should have checked that before. I expected to get a
>> notification email for merged or otherwise updated patches.
> 
> 
> Usually patchwork should do that not sure if that’s working or not

Do you mean the email with the subject:
   [oe-commits] [meta-openembedded] 03/12: python-waitress: Add recipes
send to:
   openembedded-commits@lists.openembedded.org

?


I don't recall ever getting a notification sent to my personal
email address.

Martin,
If you want to subscribe to that list:
   https://www.openembedded.org/wiki/Mailing_lists

../Randy

> 
>>
>>
>> On Fri, 2019-10-25 at 00:00 +0100, Khem Raj wrote:
>>> Now I see that its already in master see
>>>
>>>
>> https://git.openembedded.org/meta-openembedded/commit/?id=aaeb37656349db7f8562bf0ac1c11685f20a5212
>>>
>>> On Thu, Oct 24, 2019 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>> Hi Martin
>>>>
>>>> Thanks for following up on this usually patches appear on
>> patchwork.openembedded.org and I pick it up from there it seems either I
>> missed it or it did not appear on patchwork
>>>>
>>>> If it’s not staged in master-next and there is no response to it then
>> it went missing I am traveling these days so a bit sporadic on responses I
>> will check it next time I am near computer and stage it if all is ok
>>>>
>>>> Thanks for your contribution
>>>>
>>>> On Thu, Oct 24, 2019 at 12:38 PM Martin Schwan <m.schwan@phytec.de>
>> wrote:
>>>>> Hi,
>>>>>
>>>>> just wanted to kindly ask if anyone had time reviewing this patch?
>> This
>>>>> is my first patch for this project, maybe I am missing something. Is
>>>>> there anything that stops this from being merged?
>>>>>
>>>>> On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
>>>>>> Waitress is a pure-Python WSGI server.
>>>>>>
>>>>>> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>>   - Fixed missing "K" in "LIC_FILES_CHKSUM"
>>>>>> ---
>>>>>>   .../recipes-devtools/python/python-waitress.inc        | 10
>> ++++++++++
>>>>>>   .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
>>>>>>   .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
>>>>>>   3 files changed, 14 insertions(+)
>>>>>>   create mode 100644
>> meta-python/recipes-devtools/python/python-waitress.inc
>>>>>>   create mode 100644 meta-python/recipes-devtools/python/
>> python-waitress_1.3.1.bb
>>>>>>   create mode 100644 meta-python/recipes-devtools/python/
>> python3-waitress_1.3.1.bb
>>>>>>
>>>>>> diff --git
>> a/meta-python/recipes-devtools/python/python-waitress.inc
>> b/meta-python/recipes-devtools/python/python-waitress.inc
>>>>>> new file mode 100644
>>>>>> index 000000000..732c31dbd
>>>>>> --- /dev/null
>>>>>> +++ b/meta-python/recipes-devtools/python/python-waitress.inc
>>>>>> @@ -0,0 +1,10 @@
>>>>>> +SUMMARY = "A WSGI server for Python"
>>>>>> +DESCRIPTION = "Waitress is meant to be a production-quality
>> pure-Python WSGI \
>>>>>> +    server with very acceptable performance."
>>>>>> +HOMEPAGE = "https://github.com/Pylons/waitress"
>>>>>> +SECTION = "devel/python"
>>>>>> +LICENSE = "ZPL-2.1"
>>>>>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>>>>>> +
>>>>>> +SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
>>>>>> +SRC_URI[sha256sum] =
>> "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
>>>>>> diff --git a/meta-python/recipes-devtools/python/
>> python-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
>> python-waitress_1.3.1.bb
>>>>>> new file mode 100644
>>>>>> index 000000000..26a628ea0
>>>>>> --- /dev/null
>>>>>> +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
>>>>>> @@ -0,0 +1,2 @@
>>>>>> +inherit setuptools pypi
>>>>>> +require python-waitress.inc
>>>>>> diff --git a/meta-python/recipes-devtools/python/
>> python3-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
>> python3-waitress_1.3.1.bb
>>>>>> new file mode 100644
>>>>>> index 000000000..83c8b66d8
>>>>>> --- /dev/null
>>>>>> +++ b/meta-python/recipes-devtools/python/
>> python3-waitress_1.3.1.bb
>>>>>> @@ -0,0 +1,2 @@
>>>>>> +inherit setuptools3 pypi
>>>>>> +require python-waitress.inc
>>>>>> --
>>>>>> 2.23.0
>>>>>>
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>


-- 
# Randy MacLeod
# Wind River Linux

