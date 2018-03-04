Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id D9B5C789B6
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 16:27:04 +0000 (UTC)
Received: (qmail 10722 invoked by uid 1003); 4 Mar 2018 16:27:05 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	4 Mar 2018 16:27:05 -0000
To: Tim Orling <ticotimo@gmail.com>
References: <1520089170-25302-1-git-send-email-derek@asterius.io>
	<4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
	<CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
	<CAMKF1srdL6JxV-ve1qA3OeGFV-yzagzkqxhU4OUrXbAmvvCUQg@mail.gmail.com>
	<CANx9H-AEN6rCFenD7F9TBPfn9c4jPwswmb7fH0Hq=DDQvsB+VQ@mail.gmail.com>
	<18b0c3c3-c634-4bd6-1fb5-62d32b783e8a@balister.org>
	<CANx9H-B7pgCOswJZdQ=AzVT+QBNxh+vgpDFDe2SXpDs=cP=r4Q@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <b330f598-17e1-75f7-05d4-e1d617b6a5e5@balister.org>
Date: Sun, 4 Mar 2018 11:27:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CANx9H-B7pgCOswJZdQ=AzVT+QBNxh+vgpDFDe2SXpDs=cP=r4Q@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sun, 04 Mar 2018 16:27:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 03/03/2018 07:04 PM, Tim Orling wrote:
> the input to patchtest is a feed from a mailing list. The
> openembedded-devel list is multiple layers and patchtest was not written
> for that design.

Given we already have more mailing lists than people can track, we
really do need the ability to test patches for more than one layer sent
to one list.

The sheer number of lists and knowing some people only subscribe to a
handful mean people need to do massive cross posting when they send
emails targeted at the entire OpenEmbedded world. But this is a
tangential conversation.

Philip



> On Sat, Mar 3, 2018 at 3:42 PM Philip Balister <philip@balister.org> wrote:
> 
>> On 03/03/2018 06:09 PM, Tim Orling wrote:
>>> It is about which resources are running the actual patchtest job (Linux
>>> Foundation vs. Open Embedded) and the complication of multiple layers all
>>> going to one mailing list (openembedded-devel). This was part of the
>>> motivation for splitting up meta-openembedded, which turns into nothing
>> but
>>> a flame war (well, no obvious outcome or conclusion anyway). The solution
>>> is probably to improve patchtest. But we still need to decide who and
>> where
>>> will run the actual job. We can discuss, yet again, at OEDAM.
>>
>> I'm confused why you can't use patchtest with the individual layers in
>> meta-oe. Keeping several layers within one git repo is a useful
>> construct. We should be able to sort out how to manage this.
>>
>> Declaring the construct to be the problem is not a useful starting point.
>>
>> Philip
>>
>>>
>>> On Sat, Mar 3, 2018 at 11:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Sat, Mar 3, 2018 at 11:24 AM, Derek Straka <derek@asterius.io>
>> wrote:
>>>>> Is there a reason the patchtest scripts are not run on the openembedded
>>>>> layers?  Is it just a matter of doing the work?
>>>>>
>>>>
>>>> I believe so.
>>>>
>>>>> On Sat, Mar 3, 2018 at 11:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 3/3/18 6:59 AM, Derek Straka wrote:
>>>>>>>
>>>>>>> Update the license checksum for copyright year and verify the terms
>>>>>>> remain the same
>>>>>>>
>>>>>>> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
>>>>>>> --- SQLAlchemy-1.1.15/LICENSE   2017-11-03 16:47:01.000000000 -0400
>>>>>>> +++ SQLAlchemy-1.1.17/LICENSE   2018-02-22 16:08:41.000000000 -0500
>>>>>>> @@ -1,6 +1,6 @@
>>>>>>>   This is the MIT license:
>>>>>>> http://www.opensource.org/licenses/mit-license.php
>>>>>>>
>>>>>>> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see
>>>>>>> AUTHORS file>.
>>>>>>> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see
>>>>>>> AUTHORS file>.
>>>>>>
>>>>>>
>>>>>> Thanks for follow up. This looks good.
>>>>>>
>>>>>>
>>>>>>>   SQLAlchemy is a trademark of Michael Bayer.
>>>>>>>
>>>>>>>   Permission is hereby granted, free of charge, to any person
>>>> obtaining a
>>>>>>> copy of this
>>>>>>>
>>>>>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>>>>>> ---
>>>>>>>   meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>>  | 6
>>>>>>> +++---
>>>>>>>   .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}
>>>> | 0
>>>>>>>   .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}
>>>> | 0
>>>>>>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>>   rename meta-python/recipes-devtools/python/{
>>>> python-sqlalchemy_1.1.15.bb
>>>>>>> => python-sqlalchemy_1.1.17.bb} (100%)
>>>>>>>   rename
>>>>>>> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb =>
>>>>>>> python3-sqlalchemy_1.1.17.bb} (100%)
>>>>>>>
>>>>>>> diff --git
>> a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>>>>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>>>>> index 2683a6a..0c191ae 100644
>>>>>>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>>>>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>>>>>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object
>>>> Relational
>>>>>>> Mapper that gives \
>>>>>>>   application developers the full power and flexibility of SQL"
>>>>>>>   HOMEPAGE = "http://www.sqlalchemy.org/"
>>>>>>>   LICENSE = "MIT"
>>>>>>> -LIC_FILES_CHKSUM =
>>>> "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
>>>>>>> +LIC_FILES_CHKSUM =
>>>> "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>>>>>>>     PYPI_PACKAGE = "SQLAlchemy"
>>>>>>>   inherit pypi
>>>>>>>   -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
>>>>>>> -SRC_URI[sha256sum] =
>>>>>>> "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
>>>>>>> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
>>>>>>> +SRC_URI[sha256sum] =
>>>>>>> "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
>>>>>>>     RDEPENDS_${PN} += " \
>>>>>>>       ${PYTHON_PN}-json \
>>>>>>> diff --git
>>>>>>> a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
>>>>>>> b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>>>>>>> similarity index 100%
>>>>>>> rename from
>>>>>>> meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
>>>>>>> rename to meta-python/recipes-devtools/python/
>>>> python-sqlalchemy_1.1.17.bb
>>>>>>> diff --git
>>>>>>> a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
>>>>>>> b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
>>>>>>> similarity index 100%
>>>>>>> rename from
>>>>>>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
>>>>>>> rename to
>>>>>>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
>>>>>>>
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>
> 

