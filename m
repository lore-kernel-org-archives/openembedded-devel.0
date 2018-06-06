Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id A6988755C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 18:15:20 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l22-v6so6139152oib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6ByQddfoXSdsP4NiypZfSMVkGzr80T3MWQKmnNJVDyQ=;
	b=QnWGTJc2oHQYG7JwkUoRbG5wwgX1BnPO6uphYI95fqhFcaEUif7ctYWReZz/XUsnOB
	y6suQc4iLrLUHeqVA/ovtML2M1Vk+0yNiOttdwmasnJmr9TwY/AFyKMbywuD/gPHYCnH
	Pm+Ww39NwrSGJd961tTO2EKaH3993HOZKNhl1O7GGnfuNKNJoQ/G1BLVxAEd9LhvuLpO
	ZLSCS2jo6jBeXwb10nwt6jUJr6OJhZpvDVll/EIcNxNxWujmQ216v8JZs5VXw97cugsy
	f8lX8IkX4thxG3m5BjHe8I7qCUo4SUwsrj61LZE1MEuGtM4B1QViWlk3aC8UoY1a6akf
	0Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6ByQddfoXSdsP4NiypZfSMVkGzr80T3MWQKmnNJVDyQ=;
	b=rDECT/niS/1nR+yHTmWHzxeCwH11ADABi8U9e6lFA9y/akwren/8QBteeUQo0H3iXm
	EzQuEuTzAsmTY99nQ3W4gZsvGMOcdJPauC2n8Ics1j3EWnlAw+YidQhk7SYuBvX1Xkfc
	OD4JuOe0ysKcYfYrd/YzxTdX11Ts71jRqt4piEl2XEpL4sxPFu2PGrFKMc4aSqOf8Nyy
	GCvSwgMjqmLw1256jzmm5Pmb9cl/bTTblrxY0kxhg7sUw/P3ZrXJhtLgOixogIwuRW2l
	9k0t38/4CMRBqioWijEINQgSOIPiX/afSI++k5FumRNfUcwAKnxSEoMdvge3YfyegFUG
	oosw==
X-Gm-Message-State: APt69E1f/GTfKTnKqjF8aG2jsOYG7hIjqqPAzgJcTMu8lYa67UqZgfkn
	VvtRnYj8lH01W1fL3c7WdT+5bsH5uIzwvZviLDA=
X-Google-Smtp-Source: ADUXVKL9Yi07x78by72ijYva6mQExUOCqSYeqFgljYkgJV2fA6oO7evFa01DTynMS6qH7xgv9fHlhQkPdvJ2niQBKi0=
X-Received: by 2002:aca:df54:: with SMTP id
	w81-v6mr2421207oig.104.1528308921647; 
	Wed, 06 Jun 2018 11:15:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 11:15:20 -0700 (PDT)
In-Reply-To: <CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
	<CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 6 Jun 2018 20:15:20 +0200
Message-ID: <CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Wed, 06 Jun 2018 18:15:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 7:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jun 6, 2018 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Thanks Andreas for taking care of this, I was planing to look at it later
>> and then I forgot about it when I wanted to push first 5.11 recipes.
>>
>> With gcc8 I see small issue:
>> http://errors.yoctoproject.org/Errors/Details/179245/
>>
>> In fedora they just added -fpermissive in:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1582954
>>
>> Are you interested in fixing it properly? I don't use qtwebkit
>> anywhere (switched
>> to qtwebengine long time ago), so I don't mind adding -fpermissive as well.
Yes - I will check - have still recipes in meta-qt5-extra depending
on. Maybe I should check which dependency is still necessary or just
left over. One question: is gcc8 already upstream in oe-core because I
ran tests with quite recent masters allover.
>>
>
> IMO adding -fpermissive is acceptable for this package, its on a lifeline anyway
Dead ones live longer :)

Andreas

