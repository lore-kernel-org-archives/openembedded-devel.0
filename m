Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9E8784C2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 05:19:41 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id i15so7366018uak.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 21:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ib3823rivRtZ7ZElv+90UP/z5YWCo0gVj/6nUaXPOz8=;
	b=e/L6248L+istR4OHQ9uk8UbHyM/i24O3VSEXnhsYxRBfXpEiOX7inQkdHAEo/wFlYL
	86QtY0au1zSrsxh+VZNvGK0i7/O6Yimj6RWTZxAgExjZs5d/Lgk1u+cPJf+wUNRISbwo
	m6OVCP5s5HJlxqI90HXDgoooObmzM33Zgk/bclU1HhhcUlNag7RjmkGGpYr29Y/DXLwD
	Oweuy7fexNioEjpwW4sBQIFSto9t0C46scH3cNGrxj3A55KGC/YnlA0jfvupOqrNid8o
	K1W4zOeWiEwJJYmIh65VfudLweQIY3C2eFxmnCKFisLOkDSSsed6NU/z0yrckmIQyrHs
	/cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ib3823rivRtZ7ZElv+90UP/z5YWCo0gVj/6nUaXPOz8=;
	b=am8dR0+hnf/kJKFZXHCnpQCVVjvsRIITiiXdycI+6IrGZD8Sy/R2lmk9viL8vpvuUK
	OhQyp5PQrXYOf3VYrBhknMiJsq7KM/DGVYKbpqh3b4uwV58hqhwlhCpmZI0H5EgADr6a
	KB/uZQGh7pXTGReYYraPmJE7NZ8V9MoUQa973LalOfb++cR4TbLSiHxFGgkTOyNntXPa
	wJboMhxISPyAD+XuZw1DtbwXrw7VvKl/J9GBqJW/7LpuuMesGp4Q1eSACjSmjzgEpPCX
	enVJyWlrx39Q4tBiydtvsyV/DaMkesTbWjyHbJ92i+2+LBu5xJShRYUZ6+fpuhbSjIKd
	Ja8A==
X-Gm-Message-State: AElRT7EQrSFVN02p9YrOExQMY9yBIcCYEjoYgnzTG4bQ4Na2V2IbvHc7
	Z9vjtrzqZuiFZ9in6Fvoqcx8ivSfWnKwz/EudHA=
X-Google-Smtp-Source: AG47ELuRVlEYmqd2Xm08+Fdb6iYy+xyac95qJ1XqyyLPVM5xQcDU3AhmSVGxgSCOyZ3ihd3vqWRovcaqJbjnxeVp69c=
X-Received: by 10.176.3.23 with SMTP id 23mr5390029uat.7.1520054382700; Fri,
	02 Mar 2018 21:19:42 -0800 (PST)
MIME-Version: 1.0
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
	<CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
In-Reply-To: <CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 03 Mar 2018 05:19:32 +0000
Message-ID: <CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 05:19:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I usually would have said =E2=80=9Cthe copyright year changed, but the term=
s remain
the same=E2=80=9D, but I agree we need consistency. Tooling to make the lic=
ense
diff easy to generate is probably the key (and is in progress).

Thank you again, Derek, for all your efforts to keep meta-python up to date=
.

And thank you to Khem for taking the time to review and comment when few
others ever do.

On Fri, Mar 2, 2018 at 8:45 PM Derek Straka <derek@asterius.io> wrote:

> This is the exact same commit message I've used at least 10s of times
> without any negative feedback.  Saying the terms remain the same seems
> sufficient to me to acknowledge the fact I looked at the license and it w=
as
> reviewed as you stated.  I can start putting the diff in the commit if it
> adds value but let's start being consistent as a community in what we
> expect.
>
> Even as a maintainer of several layers in meta-openembedded I don't know
> what we as a community expect...
>
> On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote:
> > What more would you like in the commit message?  The license terms are
> the
> > same; the copyright moved to 2018.  Do we really need to put the result=
s
> of
> > the diff in the commit message?
> >
>
> Not strictly, but you can. In general a line or two about the reason
> is always a good thing.
> The commit message wasn't clear about it.
> This is essentially to let users as well as reviewers know that license
> changes
> were reviewed and a line in commit message is there for later to go back
> and see what changed
>
>
> >
> > On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
> >
> > On 3/2/18 6:06 AM, Derek Straka wrote:
> >> Update the license checksum and verify the terms remain the same
> >>
> >> Signed-off-by: Derek Straka <derek@asterius.io>
> >> ---
> >>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           |=
 6
> >> +++---
> >>  .../{python-sqlalchemy_1.1.15.bb =3D> python-sqlalchemy_1.1.17.bb}   =
 |
> 0
> >>  .../{python3-sqlalchemy_1.1.15.bb =3D> python3-sqlalchemy_1.1.17.bb} =
 |
> 0
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>  rename meta-python/recipes-devtools/python/{
> python-sqlalchemy_1.1.15.bb
> >> =3D> python-sqlalchemy_1.1.17.bb} (100%)
> >>  rename meta-python/recipes-devtools/python/{
> python3-sqlalchemy_1.1.15.bb
> >> =3D> python3-sqlalchemy_1.1.17.bb} (100%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >> index 2683a6a..0c191ae 100644
> >> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Python SQL toolkit and Object
> Relational
> >> Mapper that gives \
> >>  application developers the full power and flexibility of SQL"
> >>  HOMEPAGE =3D "http://www.sqlalchemy.org/"
> >>  LICENSE =3D "MIT"
> >> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D452f4b8adb0feba42e5be5f1fbfbf538"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Db1c412c9d8d1ce018f7a9374407c22bb"
> >>
> >
> > what changed here ?
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

