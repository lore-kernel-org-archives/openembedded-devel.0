Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEB787DA7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 20:34:11 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r18so4029551ioh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4sIP+JKvnbcDpt7Fii1i1rbBGVn2gxxHgQh6SG4igC0=;
	b=CMgfP/DVL7qJIWkB5uDC0IkbTrAmhbx0l9i42p3moPB60TwwxY8gkKB8vPxlk5hcLo
	QLkUXSp8eXKtJTNe2jYxXMGtyn8JtJ97cjzhIm+SuHMXqTDUk4W2ngnJxzAtSHlLXeH9
	+2Ymno6C4yTggH53rxSMAWHt+kSx5soHEtuXiSqQGCYcsqtWcRPwaqn/qv3FNi9uzhOJ
	z20HzopbEGECc3Yd5dnZMrvxMczJqWTcU2g+ydNDI+mJFBYGtFUtUZz5djg1yHQa0cGw
	vcPMJMCWlZ4RWhz8iKM6DFCk3waxgSoz7H5JH8n96AP9SG+nPaAGWaPfF9LOwzP3lZN4
	VlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4sIP+JKvnbcDpt7Fii1i1rbBGVn2gxxHgQh6SG4igC0=;
	b=gp6u9HSxcFe1GObvUu7OeVJFcJU7zqjPGMJfCaRD1srQTbXOCtDeNTYrQGX0ipNQxH
	2Iuby0L+VEJLjlDCT0akWb0abQ4h/nqEfwRnKuwZWkLapcUsf19zy6L5t6A18TvwCDFq
	IiP0BNxoL7y43xi/UfUJ5tcS1xtTEub1plpfmvVZaj6DrDpsvpXyNsg30Xff51DSNaXQ
	y90IKSP+PRqwNzx54GfPGM8eb9bcMmXkyItq3l2UtH5yzQUuq348VxwRnSVGB3OH3qAf
	hhf6zAiy1dgZq+kTCgY799kg+6FWITl7uUWK7L0VnLbQ8G7Tv4JxyXA3IMxdXftWQs4d
	49Zw==
X-Gm-Message-State: APjAAAUSSEEurtUU2PUvxOIhcPECTX/YdWVlZUIDHDOnHlttMrZ60V28
	WSFjemK7Bq7vlEqgWYz1uG2muySoObbmzj8w0E8=
X-Google-Smtp-Source: APXvYqxOE95sZm2ewm7hcdMBbN0qV+9jEx0aL9n5wahlI75NthizvD8Nb67iuE+OTAKGxdJXkON7vDY2LKb5K1JRSqE=
X-Received: by 2002:a5d:9a84:: with SMTP id c4mr9986827iom.284.1556310852705; 
	Fri, 26 Apr 2019 13:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190424190038.19593-1-Martin.Jansa@gmail.com>
	<20190426052056.GB26023@localhost>
	<CAMKF1sq3J1pjWp-sBijwi4VzGVAZWQCk8uznx0VbtODixTFY4A@mail.gmail.com>
	<CA+chaQfZE7kZHown5xfxZQf+yQoB_iqtuH=LFKJhhoqJ7tVF0w@mail.gmail.com>
In-Reply-To: <CA+chaQfZE7kZHown5xfxZQf+yQoB_iqtuH=LFKJhhoqJ7tVF0w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 26 Apr 2019 22:34:00 +0200
Message-ID: <CALbNGRS7ceuKHHZL-EZ6VcprbpXUFS8k7coeVL9RKQMT2G_7hw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Fri, 26 Apr 2019 20:34:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 26, 2019 at 9:27 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I'm not using ne10 or libopus anywhere, it was just breaking
> sstate-diff-machines.sh script by adding that unjustifiable dependency
> based on TUNE_FEATURES.
>
> I was going to send v2 with the armv7ve entries as requested by Andreas (I
> forgot that armv7ve tunes no longer include armv7a in overrides), but if
> someone wants to rework it to test for neon in TUNE_FEATURES feel free to
> do so.
>
> It didn't check for neon before, so at least this change didn't make it
> worse.
Yeah - you fix something you are not interested in and people (either
not using it) open up wishlists..

Thanks (and sorry :)

Andreas

