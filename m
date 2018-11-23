Return-Path: <pbasista@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD2526C59E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 01:47:34 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u18so8772621oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0+7F8ZfB8ClLHq34HO48wO7bn62OQAZfMPbqaOHyEIw=;
	b=WmgHSB9WbB3iY7TGLzBCrMnSE/V8HDe31CpRIlxNdgzKA+yVJm1Zel8zJRCrYHmGCV
	D7/ZcwwfH/s8tiF/mV1GPxAP5mOVKgQCEJQ1j6eHA352Oo58efRWXaO8cGGHUZ5p56iM
	M9UonrdeDiknXcl16KIIavfvyxYznvlS+Nn8yUQZ8Kb2jdlcka04RoI6EDHmMxkcK6gO
	HOoLe7x+IoXbGuvwB1wwhD8jy0kTF8Tci4hockoXPUQoEY0bjlHkA49f+T58F92WLv/P
	eAMu4vOpcX4Inl+oaHdF8Yy3XPFL2tcjk5QHpY27FgVejtHPg8TF8lSLGOFB0grefwV5
	gCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0+7F8ZfB8ClLHq34HO48wO7bn62OQAZfMPbqaOHyEIw=;
	b=QBJFavS1zHD41fjF49L2Dqq/M5OX0z5/uOIqHN5qH4Ylf5GG6pGjMVzBNeaMPdPn9Q
	O/9A2KzfKj5ZRdtGLlPlRqadPwhSQzmPYF4J84HTSnVkv6eWr9ILMDsSUSYQ73LQO3Pk
	H3I6bWyejUJdEVHfi70ztRFFIE3kIXbFEkQBXHOClvxtBgjOXluBpDzlXd0cyVjqGM+d
	hBxnCjzT/SEY2qtpWsnIT38del27JntXKbmufHSm7GEzSOrqhg/pm/ZaWrTLH356Tzf6
	265zpybphtRCmmxgz30+LA0SMK0xJnZ9GrAlLU/aQcB50E+9gz1HMuX31LIIPaJmErjX
	O8KA==
X-Gm-Message-State: AGRZ1gIVL6rBA+oiKeJ90H3dcqjenrJtYZbkCNIrMonywnc4ysMRiYo9
	PDZKOKH/kBbaxNsGyoC7b7WpMcYl4HkGsNkZDpk=
X-Google-Smtp-Source: AJdET5dZhaAxJncr8hakWd+ISBbSEvTLf0d9yulMdJJyFi9Y4v7Vx637IZGLMLAAALD+m5aKjKn6dgJjvYX1mib5ODY=
X-Received: by 2002:aca:3c1:: with SMTP id
	184-v6mr7654633oid.341.1542937655664; 
	Thu, 22 Nov 2018 17:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20181118170442.14670-1-pbasista@gmail.com>
	<CAMKF1sqGt2w+abevmJp==apK=91LLYLijHLD9GPye6d8BUkozQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqGt2w+abevmJp==apK=91LLYLijHLD9GPye6d8BUkozQ@mail.gmail.com>
From: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Date: Fri, 23 Nov 2018 02:47:24 +0100
Message-ID: <CA+2FH0JpBO=9fqVjcBWqN4Fi=hXnwDA8233uy9uoTZSLsSG+vw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] Add a working tvheadend recipe
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
X-List-Received-Date: Fri, 23 Nov 2018 01:47:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 10:35:08AM -0800, Khem Raj wrote:
> perhaps inheriting cmake, gettext and pythonnative classes is
> appropriate here instead of adding
> them to depends
Thank you. I have tried doing that but I was not fully successful.
For instance, inheriting cmake is probably not going to work well,
because the compilation uses standard make, which then calls cmake.
I am not sure whether there is a scenario for such a case within the
cmake bbclass.

So, I have only added inheritance from gettext and pkgconfig.

I have also removed pythonnative, because apparently it is not needed
and the recipe seems to be working well without it.

Finally, I have cleaned-up other parts which seemed unused or
unnecessary.

> missing SRCREV, we need a locked down SHA
Oh, I was not aware of that. Added.

I will send the v2 of the patch shortly.

Regards
Peter Ba=C5=A1ista

