Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 404F67F989
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:00:41 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t8so11509222qtc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gf6bZIw4jOz2d7jZ7w2rWbotff8mEuUxO8VVw0pNuyU=;
	b=bWh5FVNaUJ2D/GTWc3w0Cq+grj574m82ao9Rl3rXPBwoGK+IVP08CAjS+Vx4/bzqz7
	65X8VwdFyVqLDL9Mjq6IcGxMIazyCNQESxbf7ygDTY0ec/IUJZL7Gw3gglVAG5e9b7/E
	2MOM4bXtwsx4IAlklEMHDEjQJ/8kLS+jocqwRfn0aSenmPMwMsizxXgrpVDxt4oTunQs
	ORxP2tmzRr9dx6r59OZyQMF+4hOHI/CFrQEDiVYg4g4uTIxPi4JAZtIFHELGtqAcKuWX
	UA6NN1enqnZOLS+f4FxCJFcKeu1bzW5jypmV0OIwCk8sivuT0sLam7wAl9Zb24ePzUvx
	CW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gf6bZIw4jOz2d7jZ7w2rWbotff8mEuUxO8VVw0pNuyU=;
	b=DEflZNYz2Af642qZ/PysYj/nB/HOH/oc4GuXJ/TLOm8MEt8yFxWVbCoEizepUoyH91
	VuxtIO55ttmAJrDbCrKOQepqLhWxvAqBRoRW/BM+zvnWg50Dbjzg3EcFSJ3EztBHk90X
	mGAeoyA7hGjyhltsxKRnvP2w45g7BGlhwg1ijueQFv51zSAdDuJztWGopCvbHJI/LqTV
	gm5eArWq2KJ9krhDYerAGH4M/qwHr5VXYGn4BohDH3b2dgZg7WNuYKslKDmHwyOBfEJO
	3gg1g7+kCApSBEajfqtmoEhKiuXAuONyn1a4YrephUh7vQ47NmzOC6tK+NBzY6IHLvIb
	ucrg==
X-Gm-Message-State: APjAAAVitVFD/4pk4ICOFfWgSZiTKNVOauw3a68tHEmZnbaIAcv6EJuz
	K4vroNavXPi8UeVxL1jGfamo3i4g1pp2LYacxdw=
X-Google-Smtp-Source: APXvYqwTPvjvryNBu6Me1KRNAANiNMLA1L3x2wIbiL1hvBc+IWnNNva1eKK5kbmN0t7Clv+KHJ0E7er9E3EAU2xVCqY=
X-Received: by 2002:ac8:66d7:: with SMTP id m23mr14926617qtp.53.1573837241748; 
	Fri, 15 Nov 2019 09:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20191114142641.17385-1-nick83ola@gmail.com>
	<CAMKF1spCmkONVx3TRKEU9hKXjbkN7w51K0T69h67OWuHRPLhSQ@mail.gmail.com>
	<CABPh3UMAtC_cP8AMtjyO=BH7w=5b_tLM4HrbT47ZshrGPXxZMg@mail.gmail.com>
In-Reply-To: <CABPh3UMAtC_cP8AMtjyO=BH7w=5b_tLM4HrbT47ZshrGPXxZMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Nov 2019 09:00:10 -0800
Message-ID: <CAMKF1spj7RYMRqdmZztWsUB=93nC5DY=qD1PmdeAcM3M=umSWg@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-dbus-next: fix recipe position
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
X-List-Received-Date: Fri, 15 Nov 2019 17:00:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 15, 2019 at 8:29 AM nick83ola <nick83ola@gmail.com> wrote:
>
> Thanks
> (sorry about this)
>

I have squashed a fix and merged it already

> On Thu, 14 Nov 2019 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Now that its building, its failing see
>> http://errors.yoctoproject.org/Errors/Details/275777/
>>
>> perhaps its needing
>>
>> PYPI_PACKAGE = "dbus_next"
>>
>> On Thu, Nov 14, 2019 at 6:27 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>> >
>> > the previous patch:
>> >  903bfb78a0 python3-dbus-next: first commit of dbus-next 0.1.2
>> >
>> > was put in the wrong folder. This fixed that.
>> > ---
>> >  .../python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb     | 0
>> >  1 file changed, 0 insertions(+), 0 deletions(-)
>> >  rename meta-python/recipes-devtools/python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb (100%)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
>> > similarity index 100%
>> > rename from meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb
>> > rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
>> > --
>> > 2.20.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

