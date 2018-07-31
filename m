Return-Path: <williamdelacre@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 399A378DB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 22:34:39 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id o11-v6so11404425uak.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 15:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=drPKPjR7B2v7RI0/UjnV/hqqQDAVk47ulcAJwY1ud+g=;
	b=sCGGky4RDEuYLfHmablnY0RGOc5OlReyDSsxQ8vf0u9+QEDlfFgdOoqwgaU2/lTmWu
	yVNUY0mxO6WhW7zFHs2BGmrpmYzuQO/kNp6c6sQDJMkV3l29uomIpdthpvzBFPg9Pcba
	0UZrlLMydCTEmMAKaB0h7eH1TOG+9eZoNM5hqE5aU4EgM9x/zmXAangGW4HPgesEn4Fr
	eprGnQcvzFpGjB1bAARxaV4INH3NWb2bSbdj793br88nlaxPLbTDQA8z7OamPaw5t4qW
	OJZFroF5J/YTb2BxoM8EKxwprDZQJhyxzKBxrOmWVtMi+0rLJaLKjm90BLs7vUWICIWZ
	jFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=drPKPjR7B2v7RI0/UjnV/hqqQDAVk47ulcAJwY1ud+g=;
	b=i9HNDY68RkXKKrtvfAMBlclN+q0GNBF3Xlrb/FDlybL8gETgqTrXlL9ZMImA9uWBSC
	hNjU+YFU3qfLyPkdsOkpgOOeD7Lv6VGxGqQ53LUF/1ce+zapdp4y9pPiaTEzbtqyz5w0
	x2zYVdPVvbYxdFCGkTyIuoWOCM6f6i6EfPNKYUEMkLiUupsgGvsFbN7k7NAf+STG/dCC
	HpJpUdijQ4HROfUa6fPcd/hcQIE1WMJF1x35/sHHMciYwUri3ygPf5Knt55CNYVj3hJN
	M9HbtVi5no3vHqiDdQS57NQ5c7wRbGlLkpnTUeOlHQQOQ58f6xFwYPX3myYG8+PFWOFI
	EjbQ==
X-Gm-Message-State: AOUpUlGW1Lq44VILAc04xMPaaeNVwvKQDcwGYUiw/Midnd1chxsWzcCs
	Nq1Yw20pmzFvN5dae7ydfOsjfUt2fG21aW8aaFI=
X-Google-Smtp-Source: AAOMgpdR4qK3f8HDq6ZcEt3VZLQzJeBP8WoX/Re4EBbjMw7V2y3rnIeoisNWfp6vwnySGx7rh+sUIhO5E+4dNcJ+C78=
X-Received: by 2002:ab0:1861:: with SMTP id
	j33-v6mr16645270uag.119.1533076480993; 
	Tue, 31 Jul 2018 15:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<20180727164420.GM20696@vctlabs.com>
	<CAOnRZEK6f6dJtHcxrOTZN1CE_w=4=VHRKkArM76=KtJY69EK0w@mail.gmail.com>
	<2158826.FCmzKMqH1E@yow-masselst-lx1>
	<20180731184637.GJ20696@vctlabs.com>
In-Reply-To: <20180731184637.GJ20696@vctlabs.com>
From: William Delacre <williamdelacre@gmail.com>
Date: Wed, 1 Aug 2018 00:34:29 +0200
Message-ID: <CAOnRZEJqNV1anum=7X0_8oDDxF3jdBrYyiL0zE+92eX2gyQ3TA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>,
	"S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: (No subject)
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
X-List-Received-Date: Tue, 31 Jul 2018 22:34:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 31 juil. 2018 =C3=A0 20:42, S. Lockwood-Childs <sjl@vctlabs.com> a
=C3=A9crit :

> On Tue, Jul 31, 2018 at 10:30:02AM -0400, Mark Asselstine wrote:
> > On Tuesday, July 31, 2018 7:54:22 AM EDT William Delacre wrote:
> > > Le ven. 27 juil. 2018 =C3=A0 18:40, S. Lockwood-Childs <sjl@vctlabs.c=
om> a
> > >
> > > =C3=A9crit :
> > > > It depends on the role of the particular dependency:
> > > >
> > > > * tool you need to run during build             <-- native dependen=
cy
> > > > * library you need to link against during build <-- target dependen=
cy
> > >
> > > Thanks for the precision :-)
> > >
> > > My question may seem a bit stupid but how do you know which is which =
?
> > > Let=E2=80=99s say I want to write a recipe to install any specific so=
ftware on
> my
> > > target, how do I choose the dependencies ?
> > > I have to refer to the software Makefile/CMakeList ?
> >
> > It is not always easy to see via code inspection. I would suggest keep =
a
> > second build for a different arch than your build host, possibly ARM.
> Start by
> > using the non-native DEPENDS and only if there is an issue with the ARM
> build
> > look at using -native for a DEPENDS.
> >
> > To be honest I haven't had to worry about this too much as it is rare t=
o
> run
> > into issues.
>
> Yes target build dependencies are more common, so this approach of
> defaulting
> to target rather than native does make sense.
>
> My other advice is to start out by reviewing the build instructions in th=
e
> README / INSTALL docs for the software package; if that package requires
> some
> non-standard external build tool ("non-standard" meaning other than
> autotools / make etc) that would need to be listed as native dependency,
> that tool really should be mentioned in the build instructions.
>
> --SJLC


This is exactly what I needed to know ! Thanks you all a lot !

>
>

