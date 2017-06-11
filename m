Return-Path: <maryan.pricak@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 21F3171B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 16:22:00 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id u19so105008121qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3VIkecmc7QkafukBMGF9k26nNJQqUTnwaE9yRig8TMk=;
	b=bft4/YyogWAkI4yImFYfk837+ZuC9yHfv/arnfjtH69crvh/8o/6CdbX1LFOPkIjiR
	whfWB60rXDSOIoJCrZt+FADrZsK2ULTzgErf6pa/yBTV0urq+AQa0H7raGcWur6FOsB7
	U+6etKoQyX9tSvw3JgtB9R52Oco3p7wUVzt/gQZKkTZ68TMtGhFjavaZ/1AFuKP1VIq4
	I4jW984geKIinoUvQvnLs2buNKIhLW+7+LCA7v1KUSzX4xru1yxZyc+h4WJ/hJ8x9iO7
	PgMI9oOzThJjzwvNmjrHDEi86GN1jJ0tuzJVxnaCDnkM7U/HB/RbRSRE/p+Y/qQNDcPz
	oP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3VIkecmc7QkafukBMGF9k26nNJQqUTnwaE9yRig8TMk=;
	b=TNpe9Q1ovpwCgXhGxbAj6PjaTDjiK47JjjobiBWzzKFBRFOyidrRbamNl2hGMGBnvM
	4G/oYLj4xofGC07e4ytTYWeQYKH3QqBDc7IH8aee1FmGLIJGs3Un7pLnSawxYTOopNZS
	2cip0//VXO1l8EZG6pujyxT9Jr0NKKivDVAGGF2lXZ+l08H4DlbyqEnqn8kiCaKh5eRe
	g6WbufA6ZbiweWyuWnSnWh3L1BrnW7RHhHHvvJVbPAvE+C3LA/AA1btF6gOpNcv/nRsS
	ET6nvg/KznKNJiH4ECmii3G2o8YD3ORfaCXrud75/KdjAJVbviU7ocS/G2hPY6vwT5Du
	x4oQ==
X-Gm-Message-State: AKS2vOyZknrlT90d1qbNA4aQhJQx+Zv33NCrF+Xday5Ar0/CwEVb35hC
	rd2JL8+lyjjkJk4lzmNbyoAheRUfBQ==
X-Received: by 10.200.14.66 with SMTP id j2mr41479468qti.229.1497198121534;
	Sun, 11 Jun 2017 09:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <1497194825-16654-1-git-send-email-maryan.pricak@gmail.com>
	<CAMKF1soPKfwffcWP2F72xt1JCtZ+iuUwSwEZ_ka+g0Un54xh-g@mail.gmail.com>
In-Reply-To: <CAMKF1soPKfwffcWP2F72xt1JCtZ+iuUwSwEZ_ka+g0Un54xh-g@mail.gmail.com>
From: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>
Date: Sun, 11 Jun 2017 16:21:51 +0000
Message-ID: <CAGyDALkuRNgu-+JmUuSSKJ-H3pDXs1XiE43q5FJF-bAVhRDZ+Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 16:22:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 7:01 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jun 11, 2017 at 8:27 AM, Marian Pritsak <maryan.pricak@gmail.com>
> wrote:
> > +do_install_prepend() {
> > +  export PREFIX=/usr
> > +  export INSTALL='cp -r'
> > +}
>
> can you explain why these changes are needed ?
>

By default INSTALL variable in Makefile is equal to 'cp -a', which
preserves ownership and causes host-user-contamination QA issue.
And PREFIX defaults to /usr/local.

