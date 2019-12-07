Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B461C7F9A2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 22:34:16 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id u17so9475342ilq.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 14:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jYln7BO7KlCZ+zHwhPcEjyZDB9TIL9/obC9gRdIcDCg=;
	b=ICRPJ2S9fYivKBMVInuUerG9Dx1v/KbcG+KABqRSxSl8erHKgczK8k37hWj2csys+P
	7SqOy/HAkGsI/E8DPjaOiRdZmJzKF5cM4ZklVwFxzY8Rh+WiFlp2aclUPzHD6qGl+YZC
	AfZq1jBxmseUVQU9YKbFa7y7WsrQiCDaneR8fNmI4PHUNyj3PiTmDSjuwgSohNprM9ET
	aLBEwVgVddd27Ixi4txcUFxsZLjnh5+nvnKUJemAvdyC2lzpP9NFLMYnZyczvLmRdnki
	ptx6rpDxORY7EQ4o5k8SoCkBJ0EQJd1CRS9fbW3YDC8ngCJHrzpm9MXDkAHKx+x+DhxU
	youg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jYln7BO7KlCZ+zHwhPcEjyZDB9TIL9/obC9gRdIcDCg=;
	b=UgB35kN718Jzxm0QGfkOJSUplIr5A1oh06riPIOl5pyukZhrHIv3sB/Nl3yF/z9NvX
	2j45VcE+v3ympiQ/oVWDAtb0TV0Nk+XvCl+zhOFPtYYgPWzkUoaqjYsowkt5RqvywAQC
	owwM1+w2mUryMzUzMdPrBhCasbOVJkA5JyaMwtKYovgbD+lWK5+ikAKvwLsgjh1EXwrA
	eBA5QhX+giz6GBdQUtDYd2cmPW9az1jW2hsmo3U51ekF9Iyr1ppxWugNZ9txM6Lh7Gge
	O7M9qHlCLdJbD4fo/vkhksa5rDlzELGVX7DBuE9kVrbuOrMBOFLpkeoSU1CMSlEGbWMH
	Z46g==
X-Gm-Message-State: APjAAAX2dNCRv+HkRmE1lfuaqyFabQyLQvTkD7FhUy0d0aoJvFk8u/T6
	V/WGfzjn2TLKL+wA6TB2mnzSIlWVQ+eM9gMewEg=
X-Google-Smtp-Source: APXvYqxlrhRYWrd0J8CamJHrOgwksb8W29mRWOX8MY9Hgd/6IRNUEZzQWGeDKTNBZOGYa82BtLzYIJ0TAzC7aSoUPFs=
X-Received: by 2002:a92:4781:: with SMTP id e1mr20420979ilk.147.1575758057786; 
	Sat, 07 Dec 2019 14:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-11-schnitzeltony@gmail.com>
	<CAMKF1soqrjdjLMipGuumZAAouowsrK4RvNn+65Pv69yvYsmMUQ@mail.gmail.com>
	<20191206161427.GA7565@localhost>
In-Reply-To: <20191206161427.GA7565@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 7 Dec 2019 23:34:06 +0100
Message-ID: <CALbNGRSncHvm6==PMcjcMYkUG=eH=H0EP+x1Aq5FVyHMcz=ibQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 10/21] rest: initial add 0.8.1
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
X-List-Received-Date: Sat, 07 Dec 2019 22:34:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 6, 2019 at 5:14 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Dec 06, 2019 at 07:17:02AM -0800, Khem Raj wrote:
> > http://errors.yoctoproject.org/Errors/Details/290481/
>
> So either at/after upstream commit 8f904a8e or configure --without-gnome.
>
> cu
> Adrian
Thanks for helpful pointer - will try --without-gnome

Andreas

