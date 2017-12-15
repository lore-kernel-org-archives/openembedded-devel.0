Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96DBF784DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 19:22:25 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id k2so6877944ybd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 11:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1I0VGfeCO28XJjO0ZSUgd21O7wgxep1Ax8cYk8J8/NQ=;
	b=mWTW8SIugjAjKVIZxJaeiQzbHeEk3aw/rlUDsnx2NsxlSZVv0r7rV9VTt29ZdY/XoP
	616+Mq6n1zntfiymRz1m/eJWtQQiWojyiNQJOxnkhZlJvbpAyYAP3i3XXr1Whuf4JmyC
	xUH3nkzaH90fby68UdBfy2GJ5v5lW+KR0Jf8OvpilLaArAd3VmIx/Knd0luk36onsCXT
	hsjtoKr1fUCnx5nbxEnHoQc5iteEG54X30wSVQXRnbrvLnu5QbZWVblfbh+za6kP1/B/
	nHZvK8BD5S5xlTtgO0cRjRiKRrt/mEq2s72gRKMbdxStSBZntWCVPhyf4fvgC2brfC+C
	+7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=1I0VGfeCO28XJjO0ZSUgd21O7wgxep1Ax8cYk8J8/NQ=;
	b=pi9X01ZyD/iSwFOlBIc0WRqEfW5s7ppxFBJv6YvqgUYoON3k7H9zYn1U0TzRi7dLTE
	+diNUuUVSiLgTLCbvqQyhATYhLggHtZw9q8UztDChSXR9XBP58sZ14qWHETE3q36dmkt
	M8NSZ+GR7GhYUKMUV1MxaYmaYon9YFST0EgXk+BN4S6B/a11iB9F/ul0SR1FUOFHV98e
	kzFKGe4p2AARE7xgrH/AxFqh/ZzwIdLL9dDYdY5Apeif6GFvLbYGetWtSxwWXm7nhL1C
	wo3LlxSOINCFChCDemTIxSEoeJyxBn3VlMgvcjMbvfp4t0zrAklzbCyNiOueHaj5tOTY
	aGzg==
X-Gm-Message-State: AKGB3mJW/rqU/WnYwkUSUqd5sI7/3h7b6ugT2YMo5Ygs/qxtwAJrb9Rm
	NQAWrsDDBry0l3RImUxSufKWmGnGW36rd4CyMPs=
X-Google-Smtp-Source: ACJfBotEiKBN/gFSlAZ5n3HGkRn4DIkGZOWqzGKrc9m0RVjyOw+7tyCt0/qbUekL4GlItIo62z7fVFHNAUktRq4e5IA=
X-Received: by 10.37.51.130 with SMTP id z124mr3455888ybz.6.1513365746296;
	Fri, 15 Dec 2017 11:22:26 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.56.83 with HTTP; Fri, 15 Dec 2017 11:22:25 -0800 (PST)
In-Reply-To: <CADNbA1oB3Mmq5B9SNX5OCG8uzmTdTx2kQ8EChZu1_JpntweSNQ@mail.gmail.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
	<CAPuovEJCQwFBiFsG5_7miubOgteakgkSzXL5H+3qLYcWqPeo+w@mail.gmail.com>
	<CADNbA1oB3Mmq5B9SNX5OCG8uzmTdTx2kQ8EChZu1_JpntweSNQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 15 Dec 2017 14:22:25 -0500
X-Google-Sender-Auth: 3H5fJlYMCCkAfAbfFqFPTigtAtA
Message-ID: <CAPuovEK9x73CjzFPPXYm1iP5Utf=q_4tESK7Krsug79CN+pz=Q@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 19:22:25 -0000
Content-Type: text/plain; charset="UTF-8"

No problem. Unfortunately your commit log was thin on information so I
had to make some assumptions as to what you were doing in the commit.
I could have easily misinterpreted.

On Fri, Dec 15, 2017 at 2:19 PM, Derek Straka <derek@asterius.io> wrote:
> Sure.  I wasn't clear and even then I misread the 1/2 patch and thought I
> removed news from core and not the base package RDEPENDS.
>
> On Dec 15, 2017 2:08 PM, "Mark Asselstine" <mark.asselstine@windriver.com>
> wrote:
>
> The RDEPENDS are not for core, these are RDEPENDS_${PN}, ie. if you
> don't know what parts you want you install ${PN} and get everything.
> We can straighten this up though if my thoughts are incorrect. I have
> to send a V2 anyway as I was hasty and missed the cherrypick of a
> bunch of dependencies you added for automat and others.
>
> Mark
>
> On Fri, Dec 15, 2017 at 1:32 PM, Derek Straka <derek@asterius.io> wrote:
>> Is it actually required for core?  I thought I went through and verified
>> that news was a stand alone module.
>>
>> On Dec 15, 2017 12:46 PM, "Mark Asselstine" <mark.asselstine@windriver.com
>>
>> wrote:
>>
>>> Although this plugin has not yet been ported to py3 it is available in
>>> py2. The previous commit isn't clear about what is being addressed but
>>> I assume it is:
>>>
>>> nothing provides python3-twisted-news needed by
> python3-twisted-17.9.0-r0.
>>> corei7_64
>>>
>>> For py2 this package is valid and so we should maintain the RDEPENDS,
>>> restore this RDEPENDS for py2.
>>>
>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>> ---
>>>  meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>> index 2be1709..7fc8c65 100644
>>> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>> @@ -2,3 +2,9 @@ inherit pypi setuptools
>>>  require python-twisted.inc
>>>
>>>  RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
>>> +
>>> +# Not yet ported to py3 yet available in py2
>>> +# See src/twisted/python/_setup.py -- notPortedModules
>>> +RDEPENDS_${PN} += "\
>>> +    ${PN}-news \
>>> +    "
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

