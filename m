Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5D572F0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 12:40:58 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id x24so11541993uae.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 04:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f2FtdWWfd+llU3wdV5RNunMbGAEniVWq6MSNduAHeBU=;
	b=fsxXFN3VnayQqvDEmMwCpnMs7kmsVVwzPAdS9CrSTJWuk8plIWWtbndeewslU6EAkx
	+GGZItY4ovugQK1+I9HT2N/3kfQW5h2YhAgU0B3cpBAbf5XNyYkG3V0uilQG2HwxV00c
	9ArA6TcygdYzZnbN2AmZf8zn8fXk0dNeTFcgeRhGxUPHPAH6U5qvC5fKprHhKgXeEXWH
	LuxXLmVHrV7tHepEeYMPe26xF17NvDBol/C644PCLAfXCNSVH7vhIRrjuy0NHKSXYM7Z
	Rp96YzQ1ozY2zOYKmC2uqJ3bOZzTFjq2XYlmQoTcGkbiKA3AL+0gwmTodTJu8SEjXFRH
	E0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f2FtdWWfd+llU3wdV5RNunMbGAEniVWq6MSNduAHeBU=;
	b=dLV+05RXVKRQ2UZvyTnXB0CLakFYmB9FsQtZGGW7vdZbjclm8ajqJfncsv0fCjvzVi
	DU+E1hUG+8VZxMrAefIy7TXaoKr0U5L7nifxEjmUNiD4kCdJBqM0/nfw5c5sogn5CEch
	pLyPPhhbq4ojr4CoHk5+dpGUNT4eIDYwXJEWyrJBRCEynRAXL9IyuP0Lj2zoao0H7cCP
	gg1j2jD2d/ah1zCbZhG9QCr1+jl41TooW8tQzFExlOfQbuB3J3fJM5r/4+fSi+8TwyQl
	/1c1OogXLfmhaiUCWxzux5OGQM+oqLpxgyj0NVFPNn3v59TiPYAfY0EfM59EUHv5PrLU
	P6hQ==
X-Gm-Message-State: AMke39lrmjLQwhB35FJaHb1wSur+aFC4626t/BB/8/+3yv+M2BrqBl+qzqNY7tG4JrdEp+1sfEslUYeqfotU4Q==
X-Received: by 10.176.1.167 with SMTP id 36mr10258571ual.44.1487680859371;
	Tue, 21 Feb 2017 04:40:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.72 with HTTP; Tue, 21 Feb 2017 04:40:58 -0800 (PST)
In-Reply-To: <CA+chaQd4gHT+8BZ8ncPcZfApw-kVd5gPBd_SCrn_ohcBc3CqyA@mail.gmail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
	<20170220180700.29836-9-schnitzeltony@googlemail.com>
	<CALbNGRSktvJjZj42x1uX+YjYC=E9ZjmnBVeoSjKa1p1j1Q9h1Q@mail.gmail.com>
	<CALbNGRQN5vrCT8C-aRV3NQUBiZ6O80fA_SyznjfMUy5rmmx8Kw@mail.gmail.com>
	<CA+chaQd4gHT+8BZ8ncPcZfApw-kVd5gPBd_SCrn_ohcBc3CqyA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 21 Feb 2017 13:40:58 +0100
Message-ID: <CALbNGRR7kvv6odmskDxYEPkHP6iTu2RHSE3FppQfA3twK5zdng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 08/44] mpd: rework DEPENDS and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 12:40:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2017 at 10:44 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> The V1 for mpd fails in do_compile:
> http://errors.yoctoproject.org/Errors/Details/133835/
>
> will test it with V2.
>
> I'll update the libqmi and geany with extra dependencies before triggering
> new builds so you don't need to resend them.
>
Thanks and let's hope this is it for this series. FWIW: Hope I banned
all -dev packets from my build machine (pkg-config is still there..)
to get closer to your autobuilder.

Andreas

