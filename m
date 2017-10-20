Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C6B4762134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 22:53:44 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k62so12519407wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OeQx0rhUTSOY8us21d6Yg87NX1l+aNlL9rhRUZ1y57c=;
	b=VQUHeGSRmMp4P9FJKg0zdHL4cAkYCZ9qwHzTthl4dLu292e82HGfMJUF1nb4jFez8H
	Xzh28pAy3/KN45Z09qThamP4/+vKmkfo2fhT91xT4kw14L1HWNhE1zEXNcQ5fuTMgO11
	Dp8mJw6FELSY3GAgUfukJprF/wmq9wAssmhFstm6n4vE+r0zWWn58QYYA9ok9NDPsyAo
	qElmhPwWpsFsZLpQKyeyS7K4kiomK2OPcP7qBTwR896uaTX+1sc1oWe/aGpIEpoCeeH1
	BlBY8ue7yNT7jvNKBw0n51f1MOzrsPZhVU6HjtExDnXiHXbSa0GSzubQqmhoF4ybeGDK
	t/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OeQx0rhUTSOY8us21d6Yg87NX1l+aNlL9rhRUZ1y57c=;
	b=RIALeJthjjzPUl/YqHWzw3360aBa8BLVl+fwdsjZigum2B9y18eOmMuWAHBENyOHaH
	9klir/ePdlyxAHHhUATA3KCeO62nwdhVBZuwEQgPJN5qm+A8XVj9hTuUv7YVjTnxDumZ
	BnL2n3810UWqfW2p0YC/zKRc6VY/bFEe0O6cGattgHQEk3dcWTys5y2fD9jchzqS796d
	Vw9ZAlOoE7EI53pHqHOe2zIAQyTBziTOKQEcQjx00hdrDbWGnmH1wK6zaqPfjSdvQEOG
	45meDuhkFOvvw68v/oLQK1xiWbP7QF/9lu2gA7V23xd6yRR78GuRL0ovtS08WLVMJQE9
	8WFA==
X-Gm-Message-State: AMCzsaX1y9LL4RQNvmwZV9IvB5aekzBOuxC9zgbBYsYKq6Lul1U8+G9M
	GpIHetMH34s/5N29dbyJqPJK/e7usxq2kCNCvBg=
X-Google-Smtp-Source: ABhQp+RSwtr8HRPSdoRkpfNfDBmLn+ekBAN4PNbXTrw3WwMC9RoYl8dNUemHvl+FVySa/JxQfX+qqN6aOPImGc+m1T8=
X-Received: by 10.223.134.68 with SMTP id 4mr6114775wrw.67.1508540025673; Fri,
	20 Oct 2017 15:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Fri, 20 Oct 2017 15:53:45 -0700 (PDT)
In-Reply-To: <25ca8a10-6ade-4852-c9e4-bb36b65e2fd6@linux.intel.com>
References: <20171017105132.GB4387@jama>
	<20171017115539.13778-1-mikko.ylinen@linux.intel.com>
	<20171017120705.GC4387@jama>
	<25ca8a10-6ade-4852-c9e4-bb36b65e2fd6@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 21 Oct 2017 00:53:45 +0200
Message-ID: <CA+chaQeZ+unLUOmtNLigrg1kMR7p3A_n5xG+Wx+eqM8T+q2v2g@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 20 Oct 2017 22:53:45 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build:
http://errors.yoctoproject.org/Errors/Details/157425/

On Tue, Oct 17, 2017 at 2:12 PM, Mikko Ylinen <mikko.ylinen@linux.intel.com>
wrote:

> Hi,
>
>
>
> On 17/10/17 15:07, Martin Jansa wrote:
>
>> On Tue, Oct 17, 2017 at 02:55:39PM +0300, Mikko Ylinen wrote:
>>
>>> HAVE_NODEJS is a leftover from meta-refkit-core where the
>>> layer had to adapt to different BBLAYER combinations (some
>>> where nodejs wasn't available but mraa/upm were).
>>>
>>> Since that check is no longer needed and nodejs is in fact
>>> part of meta-oe, nodejs bindings can be enabled by default
>>> (with exceptions for armv4 and armv5 where nodejs isn't
>>> available).
>>>
>>> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
>>> ---
>>>   meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++++-
>>>   meta-oe/recipes-extended/upm/upm_git.bb   | 6 +++++-
>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb
>>> b/meta-oe/recipes-extended/mraa/mraa_git.bb
>>> index 616048fac..b93fd72c8 100644
>>> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
>>> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
>>> @@ -31,7 +31,11 @@ FILES_${PN}-utils = "${bindir}/"
>>>   # override this in local.conf to get needed bindings.
>>>   # BINDINGS_pn-mraa="python"
>>>   # will result in only the python bindings being built/packaged.
>>> -BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS')
>>> or '0') else '' }"
>>> +BINDINGS ??= "python nodejs"
>>> +
>>> +# nodejs isn't available for armv4/armv5 architectures
>>> +BINDINGS_armv4 ??= "python"
>>> +BINDINGS_armv5 ??= "python"
>>>
>> Still missing one, aren't you?
>>
>>
> With qemumips64 I got:
>
> ERROR: Nothing PROVIDES 'mraa'
> mraa was skipped: incompatible with host mips64-refkit-linux (not in
> COMPATIBLE_HOST)
>
> So I left it out.
>
> -- Mikko
>

