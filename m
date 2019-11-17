Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E07F6B50B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 18:16:47 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 71so12508748qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 10:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oSKyWdL7s4HuywJ67i4GBZfORdrlJKxnFJLt/1KleN0=;
	b=K3uMvQwtd0DMogEtNFAxxWh3ZrZdcTHTpZUDsYt6tKu9VqWz4dGWh4nowzGrDZLRSp
	Ruw84Dj27FIvRuZc8SEMWlG6rrOyGSmUp4Y9wX68oX3011Mlzo5RYGEgondpeh53X5yA
	xVIOjO5rds1QAcHeZYDaoezjGBB4rRjZsJ2D3bA8tkNIECKRadmxPlJ1C6wG1cbR34Zf
	3S+op8aZLi8T3CbWoRsqTCI3kXP7Cn1Hu0vafBFNJVBkR0eEJLs1Hk8bkvnvHCd7/ype
	WxDPSpMwLnM0dvFEDh+Wv05/+wt5gZ3GgFNsFXyMNYnq12p8v2AjPkmMr2z+zwZR749l
	8D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oSKyWdL7s4HuywJ67i4GBZfORdrlJKxnFJLt/1KleN0=;
	b=cqx399AOYulL7OwUUxKdf0Ce6K8BK8gaqDX7izIpkLMempPUZrsLnoATN/qHJU6z3V
	3E294+oKKDtCFqTCUZLWvfXB02LkS8g/9Noz/CJPgRBbQwXT/bpVUR8camPIAW/c3Ljc
	Xc+mAmT7tjYpR1ackaF4PauXJHfs59LpCQkUf57bEND8riSkCbSR9OKMVRX88BrZLSt9
	l1WF2YlEpWLvVT/uHfsU+UNsYG8ahqvGwtGVZcXj8qRhOMdVGRdWoKdRsWH93Q6Jtpfq
	GYQjGHE+VzZ0oqrY/xUmXcAivtKLYQw7irsAvfomAVYFCgo2v76Pif+sdwXwdnP8f9KB
	W2jg==
X-Gm-Message-State: APjAAAWtvuiXDMAyDaff3g4oQbriTrVXb8gc6xxKMzHDfZxXKQv5B0Nu
	zMucOL7PwdcpGnnqP8UcDPf6J/Ycg+HqmtxplJs=
X-Google-Smtp-Source: APXvYqwZ7ZRnM/ECXdKnIXpVGs3HqdKXATa+J7W1n5hHn/4aUE2XXWvhUsMs1CB10bKrIsS8NY3GokeAAJD5/CwsqWE=
X-Received: by 2002:a37:4bc2:: with SMTP id y185mr9105426qka.474.1574014607737;
	Sun, 17 Nov 2019 10:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-14-schnitzeltony@gmail.com>
	<CAMKF1sru3JvSpMvHHzrL1+D1Qkm4Orec8r0FcwrrKn=38gm5sg@mail.gmail.com>
	<CALbNGRQZE0ScPCq973vQsWttB4-rPxU7_ZKCvtvSpnAYUffnPg@mail.gmail.com>
	<CALbNGRThTpUgqGfNR5EqLnPVjhB8raVpQ8Gz-H2VUtdjYpbwtg@mail.gmail.com>
In-Reply-To: <CALbNGRThTpUgqGfNR5EqLnPVjhB8raVpQ8Gz-H2VUtdjYpbwtg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Nov 2019 10:16:36 -0800
Message-ID: <CAMKF1soQkfQJRUNkvA8SZRZwWSNFHR=h-kiw9CMapgLjdiV_3w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/16] geocode-glib: initial add 3.26.1
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
X-List-Received-Date: Sun, 17 Nov 2019 18:16:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2019 at 7:18 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Thu, Nov 14, 2019 at 11:51 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
> >
> > On Thu, Nov 14, 2019 at 11:13 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Nov 14, 2019 at 11:51 AM Andreas M=C3=BCller <
> schnitzeltony@gmail.com> wrote:
> > > >
> > > > It is a dependency for upcoming gnome-settings-daemon
> > > >
> > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > ---
> > > >  .../geocode-glib/geocode-glib_3.26.1.bb       | 20
> +++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >  create mode 100644 meta-gnome/recipes-gnome/geocode-glib/
> geocode-glib_3.26.1.bb
> > > >
> > > > diff --git a/meta-gnome/recipes-gnome/geocode-glib/
> geocode-glib_3.26.1.bb b/meta-gnome/recipes-gnome/geocode-glib/
> geocode-glib_3.26.1.bb
> > > > new file mode 100644
> > > > index 000000000..dc218f3a3
> > > > --- /dev/null
> > > > +++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> > > > @@ -0,0 +1,20 @@
> > > > +SUMMARY =3D "A convenience library for the geocoding"
> > > > +
> > > > +LICENSE =3D "LGPLv2"
> > >
> > > still at 2.0 and not 2.1 interesting.
> >
> > will check
>           GNU LIBRARY GENERAL PUBLIC LICENSE
>                Version 2, June 1991
>
> That is LGPLv2 - right?


Yes


>
> Andreas
>

