Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7C960797
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 08:25:35 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id t10so749308vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5GP2MuAa2UUTb11UhqVaLoCZNksiJGMKOn2/FixAng8=;
	b=UQ9fOLEZzkbxozAnwWfdV3BIolWOciho3C8YxiYU1IP73Jdfd97rflrqu0y5uiQQrq
	4UBO6GS8t0Snu7LnOn7SkOJXvTcZA/hIWq9y0Jtty7AryV/0HhJrVQcv1GmnpT2QI67w
	sXuvfdaoD1vDKOQqNi/bqZk4zIPST+qR6iwgsAeqdiEAV/C7X2Y86x1g1uBAnGaSjSEm
	J4NXDEIlZqNd7VP2Q5T+zxLEk9QCmI+zwovGBKwAJq6fmD64vP588g4PNih5q2pee81f
	rKiecpmn0HCL+th9kKgjbiwgzWW6y74CgJfwroacLXybacE++Y4+uLbFWLkw3J7ZlKzU
	Ct+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5GP2MuAa2UUTb11UhqVaLoCZNksiJGMKOn2/FixAng8=;
	b=lTIdzdZsbtF94QTLC6TxD7TlKCaup+LK5NdM3TzPpgtqZDWazLG9rMOVNcjj1U16pC
	ViqbGEdoEzae+3rta/aHosljLxQqhsWeJ8eBpl3z3zD3R5Ea+jqfxxpd5YWRGfsdwCPZ
	rYUu8NU84irRzFaLPD0yDX6qB9tA4IW0SVbOHThVKqKwc+4DymquAmmlA8kqxf6nkdjZ
	ewOoNFX379CQHZIiITs2Tio1MT8fZaqWzWR1Rd6PuvqA+NWlteChXDrfKl9LiA99VwHB
	JO16RjyjZI6Qm4XJy5rtdcPyrU92B/b9lg5q1IifZMZJRXRXr0XmDQpIDjreT4RQbkM7
	6Sdg==
X-Gm-Message-State: AHPjjUjHOa8b1wC8QySlJG8lD5nKIhRK0hR0eTlgTrAr7uwQz1hz+FYx
	n9BPEpu2I+BlyezC4G8/Vh+kia2BR9ZOuODLQ3U=
X-Google-Smtp-Source: AOwi7QBVF4QMB5/+0S6lQncNc4EgIYcZVfhhccWdXgso3lOa6rZJVmrJvYAXNpQf5UQVOP7wO9UX4YI8DnO3wFyVx+I=
X-Received: by 10.31.4.131 with SMTP id 125mr17823091vke.88.1505463936493;
	Fri, 15 Sep 2017 01:25:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Fri, 15 Sep 2017 01:25:36 -0700 (PDT)
In-Reply-To: <CAMKF1srUN0TGPCdYRKuxKhBGDnPNVr3r35=Xb5UoJYuksQSfHA@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
	<CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
	<a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
	<CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
	<CA+chaQdS4NPaF=cqUGR12+Bxt1L2wzThxYZCQFEvK-DxrZ6Dww@mail.gmail.com>
	<CAMKF1srUN0TGPCdYRKuxKhBGDnPNVr3r35=Xb5UoJYuksQSfHA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 15 Sep 2017 10:25:36 +0200
Message-ID: <CALbNGRQdYe0RVE3wT2i6btqCMtHaWzcyyGz+PLYG614-zCb6sw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Fri, 15 Sep 2017 08:25:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 15, 2017 at 2:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 14, 2017 at 8:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> If LSB isn't goal of oe-core, then why not move all this:
>>
>> OE qemux86-64@ ~/build/oe-core/openembedded-core $ find meta -name \*lsb\*
>> meta/recipes-extended/images/core-image-lsb.bb
>> meta/recipes-extended/images/core-image-lsb-dev.bb
>> meta/recipes-extended/images/core-image-lsb-sdk.bb
>> meta/recipes-extended/lsb
>> meta/recipes-extended/lsb/lsb
>> meta/recipes-extended/lsb/lsb/lsb_pidofproc
>> meta/recipes-extended/lsb/lsb/lsb_start_daemon
>> meta/recipes-extended/lsb/lsb/lsb_log_message
>> meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
>> meta/recipes-extended/lsb/lsb/lsb_killproc
>> meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
>> meta/recipes-extended/lsb/lsbinitscripts
>> meta/recipes-extended/lsb/lsbtest_1.0.bb
>> meta/recipes-extended/lsb/lsb_4.1.bb
>> meta/recipes-extended/lsb/lsbtest
>> meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> meta/lib/oe/__pycache__/lsb.cpython-35.pyc
>> meta/lib/oe/__pycache__/lsb.cpython-36.pyc
>> meta/lib/oe/lsb.pyc
>> meta/lib/oe/lsb.py
>>
>> together with libpng12, to some new meta-lsb layer, preferably outside
>> meta-oe repository as I already have enough of this stuff.
>>
>
> A patch to remove them is good since you already found this out. If
> they get into a layer of its own
> can happen later when lsb interested devs chime in.
>
>> On Thu, Sep 14, 2017 at 5:03 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>>> On 14 September 2017 at 14:49, Alexander Kanavin <alexander.kanavin@linux.
>>> intel.com> wrote:
>>>
>>>> On 09/14/2017 04:42 PM, Burton, Ross wrote:
>>>>
>>>>> On 14 September 2017 at 11:33, Martin Jansa <martin.jansa@gmail.com>
>>>>> wrote:
>>>>>
>>>>> LSB compliance isn't a goal of meta-oe as well, otherwise we'd need to
>>>>>> add Qt4 to meta-oe too.
>>>>>>
>>>>>>
>>>>> Touche.
>>>>>
>>>>> It still needs to go somewhere though...
>>>>>
>>>>
>>>> How about modifying the LSB tests to make the absence of libpng12 a
>>>> warning rather than an error?
>>>>
>>>
>>> Then it won't be doing a LSB test...   The LSB is the LSB, we don't claim
>>> to support it, but there's a need for a libpng12 recipe for people who want
>>> to be close.  Currently it's just this one recipe that I'm aware of that
>>> isn't already in a layer somewhere.
>>>
>>> Ross
>>>
One aspect I missed in this discussion: I there a recipe around
depending on libpng12 which cannot use libpng 1.6?
This is yet another case I get the the feeling that the priorities
others have do not match mine: My topmost priority is to build working
images and maintain them to keep them in working condition. Adding and
maintaining recipes for sake of outdated standards is waste of time -
at least for me.

Andreas

