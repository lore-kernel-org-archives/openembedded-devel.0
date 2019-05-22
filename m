Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 227357E3BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:47:29 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id i26so4622640qtr.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yKiRa2pgUoLrz5yyPbuT3Gt65Z2beIF5wSCeX+FyJrE=;
	b=tHzWA3fuAHE7WX4oC7yuFMN02a1dzP8shg+Jz7yBHrAgrraivsStcQjeSEbKq/U/hb
	JeL2WRizl1yhkubEQ0nczNUYmk/2gWMbSXTRbnQpRPcvlWhXKcH7YGBZGOC8Hy1eFoo1
	wD4uiRwzyw49Ol9VsSj9ByCOnq7YSfo4aTzPO24/5AyosEYWvRMasCWaE9TN8nLEw1GU
	bobup8J1yeMwp72XKtn+wcAnLcIWd7UzEhqUU65Z/z6EfFdR/Xa1PM+66heE/ZMue7nJ
	pYZahAqHmEChDkwc3FUgLMFfHgp22BcidBri4JN8JG/cjmcDRyA4l51BBdILibP35Xm6
	lrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yKiRa2pgUoLrz5yyPbuT3Gt65Z2beIF5wSCeX+FyJrE=;
	b=eufXp8tXwktpURPaL7y9FhLdw4vucXq4z4lN0Z2wPi7zbziR5nvlcbrS+2BoO+UAkS
	wYQsbx5BMf17tmdEzr5VfH1he6vv3Ep5wH7XHTvj1tFSdBI2uj3Pq9YGU5YlZSDaTOLc
	rZcc9tsCafknry7Q3oGAcEW3q4z9Q7Jedv02Jq6wNzWkNpuH5LN3T0KzAcaQp8OWkYv3
	N36HTrBfy/NYU9XuFubgYy1pwJPLuDMHsXFyHUrxPxbBRL581nipR/kX7QsGZGMihY3X
	AZItO1tPVJkv67tHEvnovwxBlvOhhsHwQVqdcMyqECUUcGjsCNFDtOcTW0usALTKknf2
	lThw==
X-Gm-Message-State: APjAAAUZXWQwGBVOlCQzIaYjQ5DN0pwIDZajOl0yiVzvjtV7OdrMIitG
	qtZHcQsYvc4bLURYbrG2W1Yz+EeSVcDJnZON1Uc=
X-Google-Smtp-Source: APXvYqx5DZuHBOorE7qDLhwBYMn1XTfAyk/OWf00NvEy/QUQkkgXeo3Duy1RTMj+6XtVvAIlG32ATLyxkb5gYVDMfgM=
X-Received: by 2002:a0c:be87:: with SMTP id n7mr36912117qvi.65.1558568849833; 
	Wed, 22 May 2019 16:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.6750B23534D@git.openembedded.org>
	<CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
	<CAMKF1sqMxN5ic=X8n5yVPct_8DmUCPDCoKxmy9kMVbvYdBQWGg@mail.gmail.com>
	<CALbNGRR97eVuCgmrn06eSB6BM3tGHhaNDzMnTtbLAGd+HQMdtQ@mail.gmail.com>
	<CAMKF1sq_N0buByYD9N3Xx4kox99yLmMdJX8N=8iLAM8TSbTS0Q@mail.gmail.com>
	<CALbNGRRzQHZhFJc=HAORCoVx7KaioZbkh+Tc-eBJK5-1sgriNA@mail.gmail.com>
In-Reply-To: <CALbNGRRzQHZhFJc=HAORCoVx7KaioZbkh+Tc-eBJK5-1sgriNA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 16:47:03 -0700
Message-ID: <CAMKF1soi0rGgE9OpsPmh-QQ8jXDy6FvwK48LyGLz9=Tw8NpXcg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 02/09: mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 23:47:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 4:44 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, May 22, 2019 at 11:34 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, May 22, 2019 at 2:29 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > On Wed, May 22, 2019 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Wed, May 22, 2019 at 12:06 PM Andreas M=C3=BCller <schnitzeltony=
@gmail.com> wrote:
> > > > >
> > > > > On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> > > > > >
> > > > > > This is an automated email from the git hooks/post-receive scri=
pt.
> > > > > >
> > > > > > khem pushed a commit to branch master-next
> > > > > > in repository meta-openembedded.
> > > > > >
> > > > > > commit 8587370567e7f2f398ae1efa77989b1110d15a77
> > > > > > Author: Khem Raj <raj.khem@gmail.com>
> > > > > > AuthorDate: Tue May 21 23:27:16 2019 -0700
> > > > > >
> > > > > >     mozjs: Upgrade to version 60.x
> > > > > >
> > > > > Haven't found this on mailing list so:
> > > > >
> > > > > I ve done similar here and I saw that
> > > > >
> > > > > * musl patch can go (tested)
> > > > > * polkit needs update - current version requires mozjs 52.x (shal=
l I
> > > > > send the patch I have already?)
> > > > >
> > > >
> > > > Please do. I am currently trying to upgrade polkit to 0.116 which
> > > > should work with
> > > > spidermonkey 60.x so if you have patches please send, I would be ha=
ppy
> > > > to give them a shot.
> > > >
> > > That might take till weekend: am sitting on 60+ patches not quite
> > > ready for the wild. So I have to rebase (and test).
> > >
> > > Ahh  - and after staring python2 crusade accidentally: If you give me
> > > a bit more time I would create a patch to move mozjs build to python3=
.
> > > Found a patch which is a good base to steel from.
> > >
> >
> > OK. I have it compiling and working on rpi3 and qemux86-64
> > see top 4 patches
> > https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dyoe/mut
> >
> > Let me know what you think
> >
> Seems you chose same way as I did: add necessary python dependencies.
> Now after recent discussion about python2 I don't like this way. E.g
> python-which has seen last release in 2010 [1] and does not build for
> python3.
>
> By looking into the python3 patch for mozjs [2] I found that mozjs
> ships the python scripts required (and I think much more). Seems we do
> not set it up properly so that it cannot find them.
>
> My target for mozjs is:
> Use the python-scripts found in mozjs 'third_party' folder, patch them
> for python3 and don't add python-native recipes.
>
> Suggestion:
> * If you are under pressure for this issue for other recipes: Take
> your patches - I can make those modifications on top later.
> * If there is no pressure just give me a bit of time
>
> And finally: Maybe we do same in parallel. To avoid double efforts: My
> WIP is at [3] As said it is not ready to send: Have not seen
> gnome-desktop yet and would like to add =C5=9Bome more as gdm / eog...
>

Not in hurry here
I will like to run CI on what we have today so we can see some other
unknown issues
Meanwhile if you can cook your changes on top if the series I sent
then we can tackle
it incrementally.

> Time for zzz
>
> Andreas
>
> [1] https://pypi.org/project/which/
> [2] https://code.foxkit.us/adelie/packages/blob/f2b5773da19ab397fbe64fd32=
dacc383cfe4cd77/user/mozjs/python3.patch
> [3] https://github.com/schnitzeltony/meta-openembedded/tree/work-2019-05

