Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 92B157F3D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 18:58:36 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b136so48560765iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Df2JFvF0AoG53omeile+ONO+y2W0nYSoScPZLqwJppw=;
	b=Ae/yyHPwwnuZQUjdQwCE/T3yUTKD4XiP+MyfCP/jkMGhEsZ1mZihQA/Az/IVyAEp8n
	jYr/93ic1ptZVZtY+8vEkKJ2ui+CD7D4ilpmHqlDZnqEJq7Ok0DVi0n4EdxK66YWizd+
	OX1dE+fv+3qVpSTsBueGMJlAZyNDEPM4fUa62safzJg2Zu07/pa8BHuzwS1dMe4zDmbS
	t5poMEXxicJ6C5RpAk6KSWCpvwfcy+o4McM3DjRHRA5ZxC8j7VDStfTFJ9MV3UCSy7c8
	w5+weVFXSwQx4DBQk9GJtiDEe8UpqyxSvV47Fh09QPYgTHaLhSZkzWSujeP6Jw9ZXREh
	/yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Df2JFvF0AoG53omeile+ONO+y2W0nYSoScPZLqwJppw=;
	b=rYDJwsqpM1BnvHIAY/Zuahzmdpld0bC7BguMwNpGTcEfm3wY9F4OdIBSkfvv1RyHm7
	8X7IZ4NvOe48OBKYNY9aH7kGobLJ9YNUIMbwO4y904alCUO6sMRPqz6OROULtmdOeGz3
	e6E9CZ8n+wKcQZU6jOh3ayO4W3hyhUJzl0gGIFBrGMKkDBGCjy1rwydP73wpzBsAs2L7
	t1o8ju6QdGuh18G1VDtc5ZtBkbf6u+eBcFB73VnnhRNtWZrHOxc6X4IbHgtp0ODkKSxb
	wq5YTrkNw48dJ9N20GfP98qnv4/jU+pbeqURXgeovuIPDzE8vDqO85hrDwlC0yBbCEjm
	rjOg==
X-Gm-Message-State: APjAAAV8lLIip4azFGWvRsvWMmx2zSB5ztB1Gp64Unik1I0GaEBaRhqS
	IsIsCQBqBHOO2ibtG/pUs9hRLKgZvZcPGOegZIoMZQ==
X-Google-Smtp-Source: APXvYqyJ1jx7jkbYqTFHIaodV6l078KjkB/b8WyJLanA2xCobPNV0znL4qgxQ5uwNlQQx/pdwNmUGHVSIU9Hp4CfTEw=
X-Received: by 2002:a92:9a54:: with SMTP id t81mr7941679ili.147.1571165917383; 
	Tue, 15 Oct 2019 11:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191014222047.22306-1-schnitzeltony@gmail.com>
	<20191015174854.GN16029@bill-the-cat>
In-Reply-To: <20191015174854.GN16029@bill-the-cat>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 15 Oct 2019 20:58:25 +0200
Message-ID: <CALbNGRSjsd2LJWKSKNOcC6cNiC+mZNA6EjpGi+u8UcdpDv3arQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] pipewire: initial add 0.2.7
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
X-List-Received-Date: Tue, 15 Oct 2019 18:58:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 7:48 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 15, 2019 at 12:20:46AM +0200, Andreas M=C3=BCller wrote:
>
> > Have 0.2.4 in meta-qt5-extra as dependency for liri-shell. Soon it gets=
 an
> > optional dependency for mutter so move latest to meta-oe.
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../pipewire/pipewire_git.bb                  | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> >
> > diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta=
-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > new file mode 100644
> > index 000000000..9b9b64205
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY =3D "Multimedia processing graphs"
> > +HOMEPAGE =3D "http://pipewire.org/"
> > +LICENSE =3D "LGPLv2.1"
> > +LIC_FILES_CHKSUM =3D " \
> > +    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> > +    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > +"
> > +
> > +inherit meson
> > +
> > +DEPENDS +=3D " \
> > +    dbus \
> > +    glib-2.0 \
> > +    alsa-lib \
> > +    v4l-utils \
> > +    gstreamer1.0 \
> > +    gstreamer1.0-plugins-base \
> > +"
> > +
> > +SRC_URI =3D "git://github.com/PipeWire/pipewire.git"
> > +PV =3D "0.2.7"
> > +SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> > +S =3D "${WORKDIR}/git"
> > +
> > +
> > +FILES_${PN} +=3D " \
> > +    ${systemd_user_unitdir} \
> > +    ${libdir}/pipewire-0.2 \
> > +    ${libdir}/spa \
> > +    ${libdir}/gstreamer-1.0 \
> > +"
>
> A few thoughts.  First, there's a lot of knobs that can be set, and it
> might be a good idea to take a look at the recipe in AGL:
> https://gerrit.automotivelinux.org/gerrit/gitweb?p=3DAGL/meta-agl-devel.g=
it;a=3Dtree;f=3Dmeta-pipewire/recipes-multimedia/pipewire;h=3D59d7d7bae1b0c=
072afbfe804857c0f7b4676766a;hb=3DHEAD
Sorry but I do not have the resources to test all these knobs.
Currently pipewire is yet another optional dependency for mutter on my
way to gnome-desktop (which is already a challenge). Once I got there
I can think of further 'optimizations'

Cheers

Andreas
>
> Second, it's worth keeping in mind for future updates that after v0.2.7
> the license changed to MIT (and yes, I know LIC_FILES_CHKSUM will catch
> this):
> https://github.com/PipeWire/pipewire/blob/master/LICENSE
>
> --
> Tom

