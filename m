Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E467F7D58A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 14:06:21 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s17so443636iol.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZO1ly2L3o8v2qMJZFlR3Xtpv76u8H4ulIb8BODn65XI=;
	b=G5c43iBd0Z9xwgaC8liHwcC1/pmmleSFGe2QCi/aR5xGExViJFmo/gRAhpzbxanct8
	0v82S+UwhBvSxbPXNY92Ou7YSwONJuPa4dMRWqn24J8+U3Qe8VReHQR4b6sQGAhP8WLC
	dN8u5wRrP1hQQhU5IK9Oa5Va4u/2gnJjQDbcNW4KOIO2Kw1n5jWHj//3ZCuudxHJao8y
	/0fb2DgNBnUvcWkXNWehM91/bjVEP8uEoDKFz3AhjmEXjZhi0PwntreQeyw0YTrcY0W8
	XuBRd9Bi1+UTjgk0Ia0HdAiKH/XMz1pu3fBZsKzxG96Z0inlmfTwq4hQDrv1qyzbyORl
	E6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZO1ly2L3o8v2qMJZFlR3Xtpv76u8H4ulIb8BODn65XI=;
	b=eo8s842qmN1uTdJtfuxgAR1KkU+fQGUCs98e38jqB482urEZktGqA721s5R+ogkGcz
	RdvC7qWz9QLtUyou3Mvoyg6sq2eZCLYU9/zeNrNH476I0333ElAZWHXE0Z/YEpjdlv+S
	VR/22i23cI3i1T7+G9rjmCqXyqurZZf3X2V/IXJ0qEHVsvjoPhCS3IDwpzcM7wIwcrnG
	hlYlPsWP6V7rlUjgbsWpNWLfH7idQAoLkC18eR0sErqj3lzUZsSUIliYOYIvcPl0rSBe
	KwfSLVI9nnWyIaJbGx+5G1vqySVB22w+En2C0fcXZdkx92nIZclA/cJbyFfQhFAZcFcW
	bmdA==
X-Gm-Message-State: APjAAAVXFD8YiPN9454bgAnB9RsOzsVt48ff6S+XCm9xbVAH34KGnVdd
	6hJvbkfyZaxgYIUFVeCBtNcgJnZSZQ1Atc3s/EM=
X-Google-Smtp-Source: APXvYqxyW6X2fxZVr27osNz6bYlENp9Y8op5TQRXs6sgcbAo8HdHbsb1KJScHH7OPX4meah31++qpLD30Ioe4yLElec=
X-Received: by 2002:a02:77d5:: with SMTP id g204mr2169112jac.125.1572185182767;
	Sun, 27 Oct 2019 07:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-4-schnitzeltony@gmail.com>
	<CAMKF1sqBUTk01=tQ=V6ECnXz5jj6r9ARi1kMyJFL5Xp2-41UjQ@mail.gmail.com>
	<CALbNGRTurd2uh2fvu=eWk2hjeiJpJsQeiYd6zhjaY9r6fgXOyg@mail.gmail.com>
	<CAMKF1so25cP0PuM8nchSyY2JTLQQ3X=5_9nRr73mMXW3Ly92iw@mail.gmail.com>
	<CALbNGRQN588w14jTisMKbkbqsHOo2ffp4tnjEWRgfkPNKtfWHg@mail.gmail.com>
In-Reply-To: <CALbNGRQN588w14jTisMKbkbqsHOo2ffp4tnjEWRgfkPNKtfWHg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 27 Oct 2019 15:06:11 +0100
Message-ID: <CALbNGRR-P-BKAxu7JPVy8Ps21iTLkJjfE9QxzCpcYEwVfp2cHw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] zenity: rework recipe
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
X-List-Received-Date: Sun, 27 Oct 2019 14:06:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2019 at 2:46 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sun, Oct 27, 2019 at 7:05 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Oct 26, 2019 at 1:10 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > On Sat, Oct 26, 2019 at 11:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > I dropped https://patchwork.openembedded.org/patch/166178/ and took
> > > > this one. It seems to include those changes as well.
> > > >
> > > Was not precise enough but that was my intention -thanks
> > >
> >
> > this fails to compile e.g.
> >
> > https://errors.yoctoproject.org/Errors/Details/274743/
> >
> Interesting that this pops up now: It is caused by itstool patch [1]
> and your build host's env not supporting -S. Will send a fix for in
> the V3 series.
>
> [1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-s=
upport/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-pa=
th.patch
>
That was too early.. whatever I'll send out once fixed

Andreas

