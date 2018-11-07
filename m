Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD1237600A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 21:30:22 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id t13-v6so7464263ybb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 13:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=L+n4jlyghaD1K01djbz8ny9h2XEXXRrSAnl19NXsMx0=;
	b=YbG7hDWbPcBkSbQaGmbyi8Q4+BHPceNU7sm6Y+O8PRA/UsadegGnat8n3Nh4nG0A0A
	MOp42UgLJ2dyd9f7ToEAQAfQkvIk253oAP0NP+41hprwlzn3N/T6mhgvzx4yeXV8oEwE
	s/HQpCovEfASc+zpJnHZSm8q0cVRBMrCIJjeffIT1x1kDKeINh1OKgDpCAUhWDhpvu98
	uYbMsCMnQYsbPVike2chW5TH3MCFKbHdLZsq8UB1KNsHyBbmU5A+XxtAgZ/3DqXUuIZ6
	1LxBPsEuFh7G5jaGgj8BsLnLkqchRxNgb14ov5tPvumIxuflVABFC6YGtNcdh7FSnAD7
	c9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=L+n4jlyghaD1K01djbz8ny9h2XEXXRrSAnl19NXsMx0=;
	b=DP3RscbS3gd+QeAjj+StNT6ZoT3keQ09L1R23Z9WLWjaxdCZC+1vRoP2RboFkeceK2
	OZU6lI66aCeRE5ounbuoWDkcN3mklqxQZPZKb4AbD8sHqstJMOyc6WIDtz8gSJ5OHlQZ
	7SKq6q5c1hk1Pkad0/tK+iXkXNcFju2JArHkbEuoKDUHgfMJ/EuDbiq71RNTlwKmA2wB
	o8BKH8v9Z4fJ4m+6TPzu90zjEkoNB+LO+7ctnQlZ1mxfBISzdKSRsq/4EcwiHKeqCqHR
	ykvU+h5nBDAencJ9cFddgnLQXcQCnlRTEB7G/xijBB9zPp5jeHAC6qyGJF8DxQAGLc34
	C/Hg==
X-Gm-Message-State: AGRZ1gLnkpU1t4SitqfOXKCZkp3AP8ww9PviU378fDBxkrNUNf56RYHq
	dyRc67w1zZa0Zlw0vMgWrLWdVDn0sgsoK5KDaS8vLweQ
X-Google-Smtp-Source: AJdET5f+8xj8hBOEm5dQTCU6prhyX01uVzM9xGrgxmzzlS1O+VtBFk3AOFSeWz7vQ+ZB1B/T695ATzjYz6oQJG6HFSc=
X-Received: by 2002:a25:b122:: with SMTP id
	g34-v6mr2060815ybj.486.1541626223612; 
	Wed, 07 Nov 2018 13:30:23 -0800 (PST)
MIME-Version: 1.0
References: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
	<CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
	<fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
	<20181107204412.GB1408@jama>
In-Reply-To: <20181107204412.GB1408@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 7 Nov 2018 22:30:10 +0100
Message-ID: <CALbNGRTO59qAVohXwe16mDyFfAeaETfZTOkMmZ3of4SGyxPipg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Nov 2018 21:30:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 7, 2018 at 9:44 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Nov 07, 2018 at 11:40:40AM -0800, akuster808 wrote:
> >
> > On 11/7/18 11:22 AM, Andreas M=C3=BCller wrote:
> > > On Wed, Nov 7, 2018 at 8:12 PM Armin Kuster <akuster808@gmail.com> wr=
ote:
> > >> fixes
> > >> ERROR: Required build target 'blueman' has no buildable providers.
> > >> Missing or unbuildable dependency chain was: ['blueman', 'thunar']
> > >>
> > >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > >> ---
> > >>  meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++=
--
> > >>  1 file changed, 3 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_gi=
t.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> > >> index 8eb99ed..06a11b7 100644
> > >> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> > >> +++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> > >> @@ -27,9 +27,10 @@ RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
> > >>  RDEPENDS_${PN} +=3D " \
> > >>      python3-dbus \
> > >>      packagegroup-tools-bluetooth \
> > >> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)=
} \
> > >>  "
> > >> -
> > >> -PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-=
sendto,,thunar"
> > >> +PACKAGECONGIG ??=3D ""
> > >> +PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-=
sendto,,"
> > >>
> > >>  FILES_${PN} +=3D " \
> > >>      ${datadir}/dbus-1 \
> > >> --
> > >> 2.7.4
> > >>
> > > This is not right: How shall this happen if meta-xfce is not in your
> > > layers - I suggest you run a cleansstate after changing layer
> > > configuration
> >
> >
> > I am running the yocto-check-layer.  Should this recipe really be in
> > meta-xfce? .. I am out of options on how to get this to pass. Maybe no
> > one cares if it ever does???
>
> Isn't the error shown only with your addition to RDEPENDS? Because
> without this patch the thunar dependency is enabled only when meta-xfce
> layer is included with:
>
> cat ./meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
> PACKAGECONFIG_append =3D " thunar"
>
> Why would blueman depend on thunar without meta-xfce?
> And with both meta-networking and meta-xfce included it will find thunar
> depdencency in meta-xfce.
>
> But with your change you're adding thunar dependency whenever x11 is in
> DISTRO_FEATURES with or without meta-xfce included which is clearly
> wrong and yocto-check-layer would be correct to complain.
>
My opinion as author and user of blueman recipe: The patch sent is
wrong. It breaks blueman's thunar-sendto-blueman.desktop in case
thunar is not in the image and I cannot see what's wrong with current
layout.

For me this is yet another example of wasting time for the sake of
yocto-layer-script.  Correct answer should have been: 'Go fix that
script' but that certainly would have caused further discussion. So I
agreed the suggestion to move blueman to meta-xfce. This makes holy
marketing script happy, matches my used-case and I can continue with
useful things.

Regards

Andreas

