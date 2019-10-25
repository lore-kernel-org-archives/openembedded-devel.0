Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id B65097FB26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 18:00:03 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o49so4526157qta.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZQJy0aTJvB6ZBHGNpWXPtyFECNozANJ7BszQ8McfgHw=;
	b=EAQbA+V/z/ooA1R4pn5abNXZGaoRDJfX4TLxYt1wzVSA/as1uodI6e0PTV+iLQE/7p
	TQcE6rgH/IzrBX54GScifA2lXSYVFb8PcgTDzp67h2o102jmqzAZkdfRgha5SejO1aOY
	GmvwaH4vkFXQ8TYml8N11i1kCcPDQucLoKihRsDPbRvlwUPjgYllN9aCLybyGySxJCE9
	/Ao6YQwSRYM3hiYheJBwUJOhKI2qSJFwxuuA6CNOYNMA7qbCF4jeLkfr2ntyryjT7eSP
	lco6PXPFoh9wnSgOFtQJBQHF4HPrf2hZaldNbpIZ0gg4RzloD3uEW5ZK+qRE/emx3WMp
	hiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZQJy0aTJvB6ZBHGNpWXPtyFECNozANJ7BszQ8McfgHw=;
	b=LWTIu13m6BCSsE/2CGEyqnisu9vkxQNV9XfjriZTediufRaavPFMirxuGl5wF9b6iE
	lgAfkJjhUmLjxNPif3CP8hcWIB4MiZlYrTbqz4at9SUxW9nyqVizKj9/f4wCmpKhsdWT
	td4IAMBQ/6bsh5vIxeK/u3YTyeJNtE0dqpKt5Aij3iM7NxvqkpafhRFjTgN7IASU6cmP
	5Zr8yfeRC9tsgNxNXRP3Rk46xfkBLCMTa8q4VIjr63r8XT6oDXfakWVcdJwAN3pQ3FvN
	Ym8kfgvf08nCmFmhX7AOGusY8bhPpm3qfBktNDT9y1B5wrlw697KsSIHybQQyv8mUsQF
	8Lhg==
X-Gm-Message-State: APjAAAX3+IMx1K/ubIaMumaJ8Oi/xKMP33+J823CrXo02YTYsoi4wHYV
	llfHMbMkeEGPii/XzNnhRNm9Y7II7qYoUcpnL3Y=
X-Google-Smtp-Source: APXvYqzkUJQKj3Hl3CH4vzT5bvxCR/j2oNKDQ3+811JEEdCcaJ9u0ZzPh/ipqfDIXGyxYIHbIVKw5TgrSIr+OH6QHPA=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr4545414qvy.109.1572026403984; 
	Fri, 25 Oct 2019 11:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191009123218.19821-1-m.schwan@phytec.de>
	<84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
	<CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
	<CAMKF1sotEEJe9NwkD5+pht-MZW+WKAY+CKjyJ7h5miovyVZs1w@mail.gmail.com>
	<9254d78a3ffd70fbda4f7fe4e5a10e8058a413cf.camel@phytec.de>
	<CAMKF1srmNZGx=1G5B=rAaaNHJ=pWqwq=pT3art=Sv8XtFDS7=w@mail.gmail.com>
	<a567aa12-2dc6-b553-ee01-79b2cd8833e5@windriver.com>
In-Reply-To: <a567aa12-2dc6-b553-ee01-79b2cd8833e5@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 18:59:53 +0100
Message-ID: <CAMKF1spFDFdqd4TNeK2k3KT=qXQgoFA4nB0sfVA4jEgcMC-ZPg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python-waitress: Add recipes
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
X-List-Received-Date: Fri, 25 Oct 2019 18:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 6:46 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 10/25/19 5:08 AM, Khem Raj wrote:
> > On Fri, Oct 25, 2019 at 8:39 AM Martin Schwan <m.schwan@phytec.de>
> wrote:
> >
> >> Ah, thank you! I should have checked that before. I expected to get a
> >> notification email for merged or otherwise updated patches.
> >
> >
> > Usually patchwork should do that not sure if that=E2=80=99s working or =
not
>
> Do you mean the email with the subject:
>    [oe-commits] [meta-openembedded] 03/12: python-waitress: Add recipes
> send to:
>    openembedded-commits@lists.openembedded.org
>
> ?
>

Yes that=E2=80=99s what I meant

>
>
> I don't recall ever getting a notification sent to my personal
> email address.
>
> Martin,
> If you want to subscribe to that list:
>    https://www.openembedded.org/wiki/Mailing_lists
>
> ../Randy
>
> >
> >>
> >>
> >> On Fri, 2019-10-25 at 00:00 +0100, Khem Raj wrote:
> >>> Now I see that its already in master see
> >>>
> >>>
> >>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Daaeb37656349d=
b7f8562bf0ac1c11685f20a5212
> >>>
> >>> On Thu, Oct 24, 2019 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>> Hi Martin
> >>>>
> >>>> Thanks for following up on this usually patches appear on
> >> patchwork.openembedded.org and I pick it up from there it seems either
> I
> >> missed it or it did not appear on patchwork
> >>>>
> >>>> If it=E2=80=99s not staged in master-next and there is no response t=
o it then
> >> it went missing I am traveling these days so a bit sporadic on
> responses I
> >> will check it next time I am near computer and stage it if all is ok
> >>>>
> >>>> Thanks for your contribution
> >>>>
> >>>> On Thu, Oct 24, 2019 at 12:38 PM Martin Schwan <m.schwan@phytec.de>
> >> wrote:
> >>>>> Hi,
> >>>>>
> >>>>> just wanted to kindly ask if anyone had time reviewing this patch?
> >> This
> >>>>> is my first patch for this project, maybe I am missing something. I=
s
> >>>>> there anything that stops this from being merged?
> >>>>>
> >>>>> On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
> >>>>>> Waitress is a pure-Python WSGI server.
> >>>>>>
> >>>>>> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>>   - Fixed missing "K" in "LIC_FILES_CHKSUM"
> >>>>>> ---
> >>>>>>   .../recipes-devtools/python/python-waitress.inc        | 10
> >> ++++++++++
> >>>>>>   .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
> >>>>>>   .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
> >>>>>>   3 files changed, 14 insertions(+)
> >>>>>>   create mode 100644
> >> meta-python/recipes-devtools/python/python-waitress.inc
> >>>>>>   create mode 100644 meta-python/recipes-devtools/python/
> >> python-waitress_1.3.1.bb
> >>>>>>   create mode 100644 meta-python/recipes-devtools/python/
> >> python3-waitress_1.3.1.bb
> >>>>>>
> >>>>>> diff --git
> >> a/meta-python/recipes-devtools/python/python-waitress.inc
> >> b/meta-python/recipes-devtools/python/python-waitress.inc
> >>>>>> new file mode 100644
> >>>>>> index 000000000..732c31dbd
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta-python/recipes-devtools/python/python-waitress.inc
> >>>>>> @@ -0,0 +1,10 @@
> >>>>>> +SUMMARY =3D "A WSGI server for Python"
> >>>>>> +DESCRIPTION =3D "Waitress is meant to be a production-quality
> >> pure-Python WSGI \
> >>>>>> +    server with very acceptable performance."
> >>>>>> +HOMEPAGE =3D "https://github.com/Pylons/waitress"
> >>>>>> +SECTION =3D "devel/python"
> >>>>>> +LICENSE =3D "ZPL-2.1"
> >>>>>> +LIC_FILES_CHKSUM =3D
> >> "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27a6966b2"
> >>>>>> +
> >>>>>> +SRC_URI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
> >>>>>> +SRC_URI[sha256sum] =3D
> >> "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> >>>>>> diff --git a/meta-python/recipes-devtools/python/
> >> python-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
> >> python-waitress_1.3.1.bb
> >>>>>> new file mode 100644
> >>>>>> index 000000000..26a628ea0
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
> >>>>>> @@ -0,0 +1,2 @@
> >>>>>> +inherit setuptools pypi
> >>>>>> +require python-waitress.inc
> >>>>>> diff --git a/meta-python/recipes-devtools/python/
> >> python3-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
> >> python3-waitress_1.3.1.bb
> >>>>>> new file mode 100644
> >>>>>> index 000000000..83c8b66d8
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta-python/recipes-devtools/python/
> >> python3-waitress_1.3.1.bb
> >>>>>> @@ -0,0 +1,2 @@
> >>>>>> +inherit setuptools3 pypi
> >>>>>> +require python-waitress.inc
> >>>>>> --
> >>>>>> 2.23.0
> >>>>>>
> >>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-devel mailing list
> >>>>> Openembedded-devel@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

