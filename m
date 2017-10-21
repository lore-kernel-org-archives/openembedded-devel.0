Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB8C78215
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 15:40:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a8so14137075pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GwUX6KhPd6A0YHGNyr9983Tz29Md3ErAKq7+W8huFCE=;
	b=hslfXtkpwvy+XkyRmrFmyJjl+isIqB7owWAjvH6MghlAbjiN4I3zZvRHYdoD/lPDLE
	TiWxoegtApmqzJGboL9kbO0jcxmDOW4Y/lPayK7fgSnimLpSQrJ/geehhTcvCutE7qy6
	PAgumJbfU2tsokF523CpycTVcH65BsVsKVBg9NYmz4iu1XQPlRWPGpjwzznD4fhe0C73
	2bzZ0i1VfuVouo1ecxZxjoBIDYSWrEduCfi9DFs5XBBlYxBKOm+L7ZC+pWkP3xY9NGx0
	IJg3xaXBjVCnskGrYt2y+6IzRMnLT4uDHJ3gvONKHByCZ/wCr/ZJNOLYCSd0cpAxOxbC
	awpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GwUX6KhPd6A0YHGNyr9983Tz29Md3ErAKq7+W8huFCE=;
	b=haA0hMpOW4Ex8s4ScTsryzPDtFr4Z2CAq4GmmHbp2cZeruBqTA1owiUnAgOUphYUxn
	O/8zmG0J1fBRoIzJS31V2fK/8Y4po5DU2U/Mk7oCL/OA4axubImlLpM1aLOFCxrKlhhZ
	/QnbthGpbT0qxVKmqzceGk4N7sl/kCmPdVJBLKoXwvDAZyQoMORk2+wT2wF8dTRv+W4Z
	DJjvXZDSOxEpsfWvPnM4eEU+jpG8MUVYx70P2QmZJlOizhIffJirq1yPNOr7gQBhir4J
	Ubo2yzlFYaiyOitebC1HA9x1+ISCqd3XbJDC+8bZfqpbfehVMwNH82GEmVTWJfGTg8Vw
	eprw==
X-Gm-Message-State: AMCzsaVuBU3RT2sB2sOhIaXowq/j62OKVqL//IgKTXyIDSkEBBuo/W4X
	F5Ps8upO+zAHfMwP/eu3uUnL5GhgNuUCjuRMCR2Oow==
X-Google-Smtp-Source: ABhQp+QRGh9EK/JSYqYTBmAdUiHPKPNI706r2upTux3WBrvot3TXNtH7XNw26VfLL4RCrNlSz2LCTWKQu+rvixSMXQk=
X-Received: by 10.99.124.75 with SMTP id l11mr7205895pgn.439.1508600428062;
	Sat, 21 Oct 2017 08:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Sat, 21 Oct 2017 08:39:57 -0700 (PDT)
In-Reply-To: <CA+chaQeZ+unLUOmtNLigrg1kMR7p3A_n5xG+Wx+eqM8T+q2v2g@mail.gmail.com>
References: <20171017105132.GB4387@jama>
	<20171017115539.13778-1-mikko.ylinen@linux.intel.com>
	<20171017120705.GC4387@jama>
	<25ca8a10-6ade-4852-c9e4-bb36b65e2fd6@linux.intel.com>
	<CA+chaQeZ+unLUOmtNLigrg1kMR7p3A_n5xG+Wx+eqM8T+q2v2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Oct 2017 08:39:57 -0700
Message-ID: <CAMKF1srpmrdiufg005CUOcq67cS2BhXkfGjfRGTkJG4ZXSbXnA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Sat, 21 Oct 2017 15:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 20, 2017 at 3:53 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Fails to build:
> http://errors.yoctoproject.org/Errors/Details/157425/
>

and fails on musl too

http://errors.yoctoproject.org/Errors/Build/47646/


> On Tue, Oct 17, 2017 at 2:12 PM, Mikko Ylinen <mikko.ylinen@linux.intel.com>
> wrote:
>
>> Hi,
>>
>>
>>
>> On 17/10/17 15:07, Martin Jansa wrote:
>>
>>> On Tue, Oct 17, 2017 at 02:55:39PM +0300, Mikko Ylinen wrote:
>>>
>>>> HAVE_NODEJS is a leftover from meta-refkit-core where the
>>>> layer had to adapt to different BBLAYER combinations (some
>>>> where nodejs wasn't available but mraa/upm were).
>>>>
>>>> Since that check is no longer needed and nodejs is in fact
>>>> part of meta-oe, nodejs bindings can be enabled by default
>>>> (with exceptions for armv4 and armv5 where nodejs isn't
>>>> available).
>>>>
>>>> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
>>>> ---
>>>>   meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++++-
>>>>   meta-oe/recipes-extended/upm/upm_git.bb   | 6 +++++-
>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb
>>>> b/meta-oe/recipes-extended/mraa/mraa_git.bb
>>>> index 616048fac..b93fd72c8 100644
>>>> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
>>>> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
>>>> @@ -31,7 +31,11 @@ FILES_${PN}-utils = "${bindir}/"
>>>>   # override this in local.conf to get needed bindings.
>>>>   # BINDINGS_pn-mraa="python"
>>>>   # will result in only the python bindings being built/packaged.
>>>> -BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS')
>>>> or '0') else '' }"
>>>> +BINDINGS ??= "python nodejs"
>>>> +
>>>> +# nodejs isn't available for armv4/armv5 architectures
>>>> +BINDINGS_armv4 ??= "python"
>>>> +BINDINGS_armv5 ??= "python"
>>>>
>>> Still missing one, aren't you?
>>>
>>>
>> With qemumips64 I got:
>>
>> ERROR: Nothing PROVIDES 'mraa'
>> mraa was skipped: incompatible with host mips64-refkit-linux (not in
>> COMPATIBLE_HOST)
>>
>> So I left it out.
>>
>> -- Mikko
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

