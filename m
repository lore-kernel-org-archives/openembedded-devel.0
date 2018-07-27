Return-Path: <williamdelacre@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id BC93078C97
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:04:47 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id r18-v6so3661487ual.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hkHVQWUXdVx2466lYRaSHGeJnax4fTbKts3uamf4AhM=;
	b=M+PrUjMC0Sv+WVOk2B4CyXyf0yqNJQ0AhnVScz8ifirhs/f3TjUTTEH7vgd+Mfq0sV
	kZhFhkeVaXdedPp+ZslNenpxxeHgYi37fk+pY3TeseeLKa2whvNJS23hsB1LOlJxrtan
	N00Q3AuYK/ihplVl1aFhH13mZkLtVzY8g1HGXq1utm9UOlAXDmGjUd4GLQ48byzXvp6s
	rN8OckpeDs1czClN9gfd3HIIo8nu1L5WCmMrvwC9jXeqIu2faIh2tsjrKqppifJ7sPdJ
	GD8n59KDKN/PrOWabIpXUSbMRx78tLx3kPigSaIiW2iRAX/eyHCh2fh0BSbmIZ8/oGKL
	rm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hkHVQWUXdVx2466lYRaSHGeJnax4fTbKts3uamf4AhM=;
	b=WxTcT9yH/bMskGqOekZ8gGX4mvBbXkPyS6xo5AwKlm0J4sDzel/QVJ7vA5dainhRTA
	FNHwqARZhclYgMb4ZCk1jgUF73GgZ3A90VGDp32VwzJLcKYB+Dfcc1yavAWh5z37KPNm
	FSud+2Tt5DSIwtx4D5sC/OhPkg5bHjPgJ4TXjKdVOGt5shMk9hhCoR6S/vHGf3cd2yNo
	rPYNn65xAujf2mq2RF1cIgA2SsyGf56UWKxUZL3a+MMYE2aoWqTEnBcAS2JFXeRD1BbP
	ZGI/sqvvVG61Je2fc0YGS1f1lewsk/4tmQH/mfETr8WUr5Rbyb9kjGyQkfnQ4EoDNAXu
	uowg==
X-Gm-Message-State: AOUpUlGsljFRzz0s2MXbWkjV4asT2tdxt1o7+A2h/X5U9tFnrMruumNA
	KZoKzrHjnLjB0+7YH8OFQzM9swnDKFmbmEshHe9IYA==
X-Google-Smtp-Source: AAOMgpeBh6fYupC4Ew/zXQDQGKIv+ax1t/SMYuyvnxy1qgU4QkS3TFBGm/mejJua3KXCpsDyABOui8rGJ0X6yyi5BBQ=
X-Received: by 2002:ab0:66d4:: with SMTP id
	d20-v6mr4927643uaq.112.1532707488611; 
	Fri, 27 Jul 2018 09:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovEKX5w=1ObAgOw71UteCmh74Qf9KQ44_L4NbmLniwX4Jyg@mail.gmail.com>
	<CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
In-Reply-To: <CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
From: William Delacre <williamdelacre@gmail.com>
Date: Fri, 27 Jul 2018 18:04:37 +0200
Message-ID: <CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
To: mark.asselstine@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 Jul 2018 16:04:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for the answer, it worked perfectly !

There is just one point I don=E2=80=99t really understand : why do we need =
to add a
dependency to =E2=80=98python-incremental-NATIVE=E2=80=99 ?

What would happen if I just add to the python-twisted recipe :

DEPENDS +=3D =E2=80=9C${PYTHON_PN}-incremental=E2=80=9C

William

Le ven. 27 juil. 2018 =C3=A0 17:03, Mark Asselstine <
mark.asselstine@windriver.com> a =C3=A9crit :

> On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> > On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> > <williamdelacre@gmail.com> wrote:
> >> Hi ! :-)
> >>
> >> I=E2=80=99m facing issues when trying to run =E2=80=98bitbake python-t=
wisted=E2=80=99
> (do_compile
> >> error)
> >>
> >> Log says :
> >> =E2=80=9CDownload error on https://pypi.python.org/simple/incremental/=
: [Errno
> -3]
> >> Temporary failure in name resolution
>
> With the additional info you sent me along with a second look at the
> error I can fairly confidently say I know what the issue is.
>
> Python, like some other languages (ruby, go...) will attempt to
> download dependencies/requirements if they are not present. This is
> done "outside" of the bitbake system and thus will ignore
> BB_NO_NETWORK and is generally a bad thing. It isn't quite host
> contamination but it is very similar. What we do with our python
> recipes in bitbake is review a python package's source setup.py,
> requirements.txt...files in order to determine what other python
> packages are needed, add them as RDEPENDS or similar in order to avoid
> the python attempting to complete a download such as this.
>
> In this case python-twisted 'requires' python-incremental but the
> Rocko version of the python-twisted recipe lacks the needed assignment
> to ensure this is available in the recipe sysroot and thus the
> attempted download.
>
> Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
> [python-twisted: avoid downloading build dependencies] to Rocko and
> you will be good to go. You should also follow up this thread with a
> request to have this commit put onto Rocko to avoid others hitting the
> same issue.
>
> Mark
>
> >>
> >> ............
> >>
> >> distutils.errors.DistutilsError : Could not find suitable distribution
> for
> >> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=80=9D
> >>
> >> First of all I=E2=80=99m not connected to internet, so I=E2=80=99ve pr=
e-downloaded all
> the
> >> required packages (twisted-17.9.0.tar.bz2 & incremental-17.5.0.tar.gz
> are
> >> present in my build/downloads folder)
> >>
> >> It=E2=80=99s the first time I have some =E2=80=9Cdownloading issues=E2=
=80=9D and I=E2=80=99m stuck on it
> >> for a few hours now..
> >>
> >> Any tips for me ?
> >
> > Check all aspects of what you have manually downloaded and populated
> > in your downloads. My guess is that a checksum or some other detail
> > isn't matching and it is rejecting what you have and thus attempting
> > to re-download the file.
> >
> > Mark
> >
> >>
> >> Thanks in advance !
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

