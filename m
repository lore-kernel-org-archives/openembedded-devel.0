Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id B840A6011A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 04:01:46 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id t4-v6so9597774vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Jul 2018 21:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PdmZYjDq2e3GuIVsypu2c/7KnHAoAAwrkgtTnEMIAOg=;
	b=fXTEvCjEHv0t8HAlUpgil/uh4y8Qbs5R/ZsDMDXHewvv+MWE1ZCyq0TaGGK7wvuikQ
	5EXWzimPIGUZeCXpnQ16sUccEgFbLo0XqEqpt7GZippAMqDzNkzp9snRP0zIX1Z6aMPJ
	RyQ7Wi1sJm0WmZPwiPxlN3ruCHvb0+Y6TtSba1dNARtriII4fOjgrXXrOHfaVUFML0ZJ
	Mliql5oiMxkmyjErY231WbPwoNJAM/GGpI50YFr8ZEdgEkZyjEdSDXNMqf+inMZ1kfpV
	C8kHROMKgWEzU0AFiVAJw4z4qoYohDlzamABDXZdxRL2LC5Uc5tZcs0I+pP5wKsBkm2n
	xKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PdmZYjDq2e3GuIVsypu2c/7KnHAoAAwrkgtTnEMIAOg=;
	b=LpFWWWu9Fra/rzA0jd7uTtfUXD3At2ptU7IHWVjATE06jFZsAqECxEvQz1lIhZ3JkP
	Fij/zckRntpxIGgm32+ZIYEQBEJPLi2ESuxKImrfSQdKb4KPGkic1nc+lHkgw75x/oVg
	8dZHicD+taJNWTi7alLhdvZB2+ByVTFnWYbY3d7v723YlGE9JMejuubZd1HIqIOsW+bm
	muhFkimirQSjbsCQvMMRb+nFc3yR7Ps5zmDQtSLU84zraVk3n/gjt86q+MdQQWYuxCt5
	cQ6yKBp5qnyZ4sHPaJJD1JJXCMkeCaX5BfVyDz7EoVU11O/qjL73fNxn20w8zjWIloUu
	PzTQ==
X-Gm-Message-State: APt69E3ldlHeA+pH0EEPr3mOi/8u9EjEdzpQLqr1Cu/WLdga+GdYGmxN
	MN03mY9TdikCVQHVaDQgQlAuX7SlzrGdbVDp+Oc=
X-Google-Smtp-Source: AAOMgpcNlj9seBWVoFtcE/A2o6QIDCm1sS9yjTB+6VWqARXzVZ6kv1f2gLm8mMs+HmB/p7bjtkFUX5okeoejNcI7CAA=
X-Received: by 2002:a1f:7c4:: with SMTP id
	187-v6mr10606210vkh.60.1531108907276; 
	Sun, 08 Jul 2018 21:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180705065408.103714-1-mingli.yu@windriver.com>
	<CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
	<5B3F34E5.70101@windriver.com>
	<CAMKF1sqa49UG0+Una67_ES6jE-ZphxcqcwHDur80mAcz6oZPUw@mail.gmail.com>
	<5B42C73E.6070009@windriver.com>
In-Reply-To: <5B42C73E.6070009@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jul 2018 21:01:36 -0700
Message-ID: <CAMKF1sp83jHPG+vsPJfRftB3EF0djzNZfM-YZyUUUvbqt_-n5w@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Mon, 09 Jul 2018 04:01:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 8, 2018 at 7:29 PM Yu, Mingli <mingli.yu@windriver.com> wrote:

>
>
> On 2018=E5=B9=B407=E6=9C=8806=E6=97=A5 23:01, Khem Raj wrote:
> > On Fri, Jul 6, 2018 at 2:27 AM Yu, Mingli <mingli.yu@windriver.com>
> wrote:
> >>
> >>
> >>
> >> On 2018=E5=B9=B407=E6=9C=8806=E6=97=A5 00:00, Khem Raj wrote:
> >>> On Wed, Jul 4, 2018 at 11:54 PM <mingli.yu@windriver.com> wrote:
> >>>>
> >>>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>>
> >>>> Update LIC_FILES_CHKSUM as the file iozone.c
> >>>> used for LIC_FILES_CHKSUM updated
> >>>>
> >>>
> >>> Please describe what has changed that is causing the checksums to
> >>> change.
> >>
> >> The source file iozone.c changed has causing the checksum change. I ha=
ve
> >> already mention it in the commit message.
> >
> > Commit message does not say what changed,  We already know something
> > has changed thats causing the checksum change but here we usually
> > document what changed specifically, purpose is to let users know of
> > any
> > change in licensing requirements that they need to be aware of
>
> Thanks Khem!
>
> I will try to list the changes in V2 but actually the file iozone.c used
> for checksum is source file. It has so much code changes unlike some
> packages use COPYRIGHT file or README.md file for checksum.
>

Ok that=E2=80=99s probably not ideal then. It would be better to just use t=
he
needed lines from checksum


> Thanks,
>
> >
> >>
> >> Thanks,
> >>
> >>>
> >>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>>> ---
> >>>>    .../iozone3/{iozone3_465.bb =3D> iozone3_482.bb}              | 6
> +++---
> >>>>    1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>    rename meta-oe/recipes-benchmark/iozone3/{iozone3_465.bb =3D>
> iozone3_482.bb} (95%)
> >>>>
> >>>> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> >>>> similarity index 95%
> >>>> rename from meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> >>>> rename to meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> >>>> index 191b93425..09306e044 100644
> >>>> --- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> >>>> +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> >>>> @@ -4,14 +4,14 @@ AUTHOR =3D "Don Capps <don.capps2@verizon.net>,
> William D. Norcott <wnorcott@us.or
> >>>>    SECTION =3D "console/tests"
> >>>>    LICENSE =3D "iozone3"
> >>>>    LIC_FILES_CHKSUM =3D
> "file://iozone.c;beginline=3D37;endline=3D48;md5=3D7331260091868dcad0f9ed=
ea735b5f4b
> \
> >>>> -
> file://iozone.c;beginline=3D260;endline=3D266;md5=3D77f9ee51e45b57a7e7519=
c4fa0b4f00b
> \
> >>>> +
> file://iozone.c;beginline=3D260;endline=3D266;md5=3D0aa488fd139eac078be6e=
ca86e1435e8
> \
> >>>>    "
> >>>>    SRC_URI =3D "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
> >>>>        file://parallelism.patch \
> >>>>        file://copyright.txt \
> >>>>    "
> >>>> -SRC_URI[md5sum] =3D "c924e5e46fb1cf8145f420e8e57eb954"
> >>>> -SRC_URI[sha256sum] =3D
> "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41d811368e55bd4e6a293"
> >>>> +SRC_URI[md5sum] =3D "31ca1d3d28bc375c20a2808217cf212c"
> >>>> +SRC_URI[sha256sum] =3D
> "2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30"
> >>>>
> >>>>    UPSTREAM_CHECK_REGEX =3D "iozone3_(?P<pver>\d+).tar"
> >>>>
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >
>

