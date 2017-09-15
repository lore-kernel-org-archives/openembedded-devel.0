Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF3B719C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 00:31:51 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id u18so584074pgo.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/e4nmDl7xWyrV1x0dgU/tJw+trNDWIcBW8MceRFqsrI=;
	b=bIFXhu7mqsWWqqXhZbUCt29Arjf3Kcv9CnPDRo1AWVWH9jYjkHSqFwoTUERyiWnaic
	Wd761X0lZonEOTa2ZLmwQ/RBWbKRx/PDblvkOW06Bh8FQkjHvyg+o0nGkiDHz6Yxn497
	wpyDA2jS0ISWmuiLAQrV8cC/W/0iuEHCulaL8K3RIxk2kUu21jPCffnJXhzrmLxIdrCG
	5b7iWb2LdGuv/naJdbJ2QEzKpfaRSDBkGwkIkrnn6vjHPes8YIdnSa4sJNnwWVH847bF
	1wI5T/PD5FJc2VybDlKRoNr1tykBcEph29yrJdlriy6+8gJ15APyqOi9g2v5e7zn9h9n
	8kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/e4nmDl7xWyrV1x0dgU/tJw+trNDWIcBW8MceRFqsrI=;
	b=YJ0IYHsD/pPGbrSt7TnRQkGvR2Mg8HRxhhScrx/gPx/5tKj5dk4T6Xu18TqTRGvY6i
	N3A2p9DfzP3eqhEqrYczp7kgehJZB3ryPnXwztFoNob2z6VIe4WZlSEECrWWj4N7OWxn
	BhNrdJd+a+9sKiPj3uUyhIGNtg1jzaBGB7sky5vxt+zi2bBzm9CtUxzjfD7IotW27oDn
	AXIW0qcjaui+8ggyq4guNgosT/Sm+7BdjztGs9pXO30Vjnf7bYhjf4pyFSIPSkGNA8Xc
	BvUbjdUq0R5LDSVQDJOEaE76CJHUs9bAtPz/dRIAfhTIUTAKQIwqWEQFkMEuF7gUPlaE
	kcGg==
X-Gm-Message-State: AHPjjUhEjJBlLOq+pFqT0hb0GfoW9R27Hl5f+mFsXlMj6WLOHVUOnS34
	ne7p8Ppj+mu7rgJKoDEhMgd1DZYrLZh/n3eeF1g=
X-Google-Smtp-Source: ADKCNb6WDIYv/rXFOtFusfpaeTNeWFdsIvdi819e5BymG8M3B2KQUwEKV/ysyZ0K4pQQUcJA7eHAEjedCfzhZHEoZBE=
X-Received: by 10.84.218.199 with SMTP id g7mr26440216plm.215.1505435513489;
	Thu, 14 Sep 2017 17:31:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 14 Sep 2017 17:31:22 -0700 (PDT)
In-Reply-To: <CA+chaQdS4NPaF=cqUGR12+Bxt1L2wzThxYZCQFEvK-DxrZ6Dww@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
	<CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
	<a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
	<CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
	<CA+chaQdS4NPaF=cqUGR12+Bxt1L2wzThxYZCQFEvK-DxrZ6Dww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2017 17:31:22 -0700
Message-ID: <CAMKF1srUN0TGPCdYRKuxKhBGDnPNVr3r35=Xb5UoJYuksQSfHA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 15 Sep 2017 00:31:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 14, 2017 at 8:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> If LSB isn't goal of oe-core, then why not move all this:
>
> OE qemux86-64@ ~/build/oe-core/openembedded-core $ find meta -name \*lsb\*
> meta/recipes-extended/images/core-image-lsb.bb
> meta/recipes-extended/images/core-image-lsb-dev.bb
> meta/recipes-extended/images/core-image-lsb-sdk.bb
> meta/recipes-extended/lsb
> meta/recipes-extended/lsb/lsb
> meta/recipes-extended/lsb/lsb/lsb_pidofproc
> meta/recipes-extended/lsb/lsb/lsb_start_daemon
> meta/recipes-extended/lsb/lsb/lsb_log_message
> meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
> meta/recipes-extended/lsb/lsb/lsb_killproc
> meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
> meta/recipes-extended/lsb/lsbinitscripts
> meta/recipes-extended/lsb/lsbtest_1.0.bb
> meta/recipes-extended/lsb/lsb_4.1.bb
> meta/recipes-extended/lsb/lsbtest
> meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> meta/lib/oe/__pycache__/lsb.cpython-35.pyc
> meta/lib/oe/__pycache__/lsb.cpython-36.pyc
> meta/lib/oe/lsb.pyc
> meta/lib/oe/lsb.py
>
> together with libpng12, to some new meta-lsb layer, preferably outside
> meta-oe repository as I already have enough of this stuff.
>

A patch to remove them is good since you already found this out. If
they get into a layer of its own
can happen later when lsb interested devs chime in.

> On Thu, Sep 14, 2017 at 5:03 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
>> On 14 September 2017 at 14:49, Alexander Kanavin <alexander.kanavin@linux.
>> intel.com> wrote:
>>
>>> On 09/14/2017 04:42 PM, Burton, Ross wrote:
>>>
>>>> On 14 September 2017 at 11:33, Martin Jansa <martin.jansa@gmail.com>
>>>> wrote:
>>>>
>>>> LSB compliance isn't a goal of meta-oe as well, otherwise we'd need to
>>>>> add Qt4 to meta-oe too.
>>>>>
>>>>>
>>>> Touche.
>>>>
>>>> It still needs to go somewhere though...
>>>>
>>>
>>> How about modifying the LSB tests to make the absence of libpng12 a
>>> warning rather than an error?
>>>
>>
>> Then it won't be doing a LSB test...   The LSB is the LSB, we don't claim
>> to support it, but there's a need for a libpng12 recipe for people who want
>> to be close.  Currently it's just this one recipe that I'm aware of that
>> isn't already in a layer somewhere.
>>
>> Ross
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

