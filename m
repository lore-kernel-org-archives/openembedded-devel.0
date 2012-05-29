Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SZOLf-0003s2-7e
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 17:28:39 +0200
Received: by wgbdr1 with SMTP id dr1so3646252wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2012 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TtoCByluxGt1ZJOYrxU9hMrde9swtJ6SyOvF49/rCj4=;
	b=HKGv8/UI0pkBzJn27wQkifSvyWmRbJTf9q4NWUukCHNsZPgyFtZQL2whltIZMWobPt
	eIUoguVT1nEDoLddcJGNdkgx7lxwjkzoYC7aKfGjgGwyTpeA46iyHtU96LtU+kHosD2/
	Z/SFE1bWgx0lQJ8F+f/+Q9heiJsMe6YXkfIfW4voTlYSeTj71DF6l4IlQtzZNRqippgj
	2T4bfzPtHGy26GtYyPy5YhaWo9Hqhkurj+6sRUlwudxn4hVzC3mLeiHAiBWEariDRS/G
	kgA6AyBelOKdjE1NRBpVLqDgsMIxLNcRNqipD3tUE6yrPHnfWRekzo1FzvKzhvgA1VlS
	Cv6w==
MIME-Version: 1.0
Received: by 10.216.193.162 with SMTP id k34mr7780164wen.54.1338304701901;
	Tue, 29 May 2012 08:18:21 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Tue, 29 May 2012 08:18:21 -0700 (PDT)
In-Reply-To: <1338304125-5922-1-git-send-email-s.stirtzel@googlemail.com>
References: <1338304125-5922-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 29 May 2012 17:18:21 +0200
Message-ID: <CAGiJk9e9KEVre-HFAWw9LGf5zC2p2r1pynYxkQ3xRLpe=Lo_0w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde] [RFC] [PATCH] qt4-x11-free_4.8.0.bbappend: Fix Plasma Active by adding undocumented configure flag (--reduce-exports)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 15:28:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/29 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> No more "Declarative scriptengine not found" errors
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
> =C2=A0recipes-misc-support/qt4-x11-free_4.8.0.bbappend | =C2=A0 =C2=A05 +=
+++-
> =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend b/recipes-m=
isc-support/qt4-x11-free_4.8.0.bbappend
> index 4895893..beeb49f 100644
> --- a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> +++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> @@ -1,3 +1,6 @@
> +QT_CONFIG_FLAGS_append =3D " --reduce-exports"
> +
> +# Build OpenGL/ES support if available
> =C2=A0QT_GLFLAGS_omap3 =3D "-opengl es2 "
> =C2=A0DEPENDS_append_omap3 =3D " libgles-omap3"
> =C2=A0DEPENDS_append_ti33x =3D " libgles-omap3"
> @@ -5,4 +8,4 @@ DEPENDS_append_ti33x =3D " libgles-omap3"
> =C2=A0# Needed by kdelibs
> =C2=A0QT_DISTRO_FLAGS =3D "-accessibility -sm"
>
> -PRINC :=3D "${@int(PRINC) + 2}"
> +PRINC :=3D "${@int(PRINC) + 3}"
> --
> 1.7.5.4
>

Hi,
just to let you know, Qt export visibility caused Plasma Active to fail.
This "undocumented" flag will enable KDE plugins to work again.

With this patch Plasma Active is working (to some extend).
It still has some flaws but I'm about to iron them out.

However this patch might impact other applications and I'm still
looking through my buildhistory diffs to see if anything behaves odd.
Until now I did not meet any misbehavior of other Qt applications, but
I'll double check to be sure.


After testing this will go to master with more descriptions / documentation=
.

--=20
Regards
Samuel


