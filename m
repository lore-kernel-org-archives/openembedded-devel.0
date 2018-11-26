Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9DE46D13D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:44:00 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n21so18528579qtl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f092x+cWN6I4LplhGG3O9tbYhZyLIcwXbD3QnCSay6A=;
	b=YrdGylRYDYTYTuBSaXvpAe37iB6uWW5Ru2m52BG7q+epTS2EXFaymAHBNyhXi4v6Sq
	9H0xCeByK5xEthosU6cTKNMC1yfBBRHKdVkMVKz42O++/YyVnfQQDhHp7hYjiOobDHr/
	ZvklTG7wHWudCf3QR7ZcKdZr5j96yXEZiRvyIGGpHQ/KNVxDY4hsdCeNlI3h8AC6n/9T
	3/sMoMQEY7D6OLXH387eVZgW8W5gjUJI6Gs4qXtKQeswTlVJrFCcP97SzuP/D0tRtW9E
	FnNYO5wVePmS2c4ultbBnXMVRHTC0Fgg7b1gJCSdgALFF3q1T8kZZFtZDyWNfcoLsTn9
	8qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f092x+cWN6I4LplhGG3O9tbYhZyLIcwXbD3QnCSay6A=;
	b=bdRK+LwyP04iUHayej4K9iOF+KlqJ8zNVKHMd+w6Zr1d/UJAF1Kafkr+EESxKcwTjW
	agx37SZCvr630TBunWUA3ypXPGs1rDJ8f9qntz4EqsVlZPxkYMf81Evzk6ZEPyE7ePi7
	okkhf1hYVQL2QtOymjjk68PWcg4AV7Do+/ZVsOSZ8x6GQzSvOeAFA4x1LIXSGYWh9V6E
	d8tw5muRCmE22Gwiy4CIWaEU/ftOt4RBmCcLbPqfDFFn2HdNOS9ipT8t47xpiO4iDKdA
	kTfSRKAx1Sz2GAJb8wd3bSb39Tzrf65I4BQDcMIe/8gsvzcLV8bJcLBbjizONWEgCEUO
	kBCQ==
X-Gm-Message-State: AA+aEWZrKAC4qo82LynUpfUqFU5dQFKjwDCrqz3xsQnHQ1Q5fe9FKZfu
	c3A98CR+VA87WEMpIf5McR9byk3oD5CHnhfwETw=
X-Google-Smtp-Source: AFSGD/XC1pm2+NB9p7tIdNB7w///Y/r3SbKHrom4N653t1QivrS2jYyzHiyUu+DBiUoHGH+O/BoREtlt4nctsDpbsTE=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr26431199qtn.254.1543254241561;
	Mon, 26 Nov 2018 09:44:01 -0800 (PST)
MIME-Version: 1.0
References: <1542560899-8877-1-git-send-email-akuster808@gmail.com>
	<f5a22ef9-2b91-3dab-38b0-a29ad7451c70@geanix.com>
In-Reply-To: <f5a22ef9-2b91-3dab-38b0-a29ad7451c70@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 09:43:34 -0800
Message-ID: <CAMKF1so5vQQUggN2XPDGSoY-MBthcUiWpzRsEKiC9YCTwpvqvA@mail.gmail.com>
To: martin@geanix.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ndctl: fix compile issue
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
X-List-Received-Date: Mon, 26 Nov 2018 17:44:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 1:17 AM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> Hi Armin,
>
> On 18/11/2018 18.08, Armin Kuster wrote:
> > | No package 'systemd' found
> > | configure: error: systemd support requested but pkg-config unable to =
query systemd package
> >
> > add PACKCONFIG to disable systemd
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >   meta-oe/recipes-core/ndctl/ndctl_git.bb | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-=
core/ndctl/ndctl_git.bb
> > index b20915f..048f166 100644
> > --- a/meta-oe/recipes-core/ndctl/ndctl_git.bb
> > +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> > @@ -21,6 +21,9 @@ S =3D "${WORKDIR}/git"
> >
> >   EXTRA_OECONF +=3D "--enable-test --enable-destructive --disable-docs"
> >
> > +PACKAGECONFIG ??=3D ""
>
> Can you make the default PACKAGECONFIG include systemd if it is in
> distrofeatures?

This is needed. See

http://errors.yoctoproject.org/Errors/Details/202222/

>
> PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
>
> // Martin
>
> > +PACKAGECONFIG[systemd] =3D "--with-systemd-unit-dir=3D${systemd_system=
_unitdir}, --without-systemd-unit-dir,"
> > +
> >   do_configure_prepend() {
> >       ${S}/autogen.sh
> >   }
> >
>
> --
> Kind regards,
> Martin Hundeb=C3=B8ll
> Embedded Linux Consultant
>
> +45 61 65 54 61
> martin@geanix.com
>
> Geanix IVS
> https://geanix.com
> DK39600706
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

