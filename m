Return-Path: <yann.dirson@blade-group.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id E45B174775
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 19:48:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x4so26035039otg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j8RbEx/VFB+wGHHn0JRIEWLjdijgMoWJ17IzQPU8yUc=;
	b=VX5JUPLX1kHJZxfFa2m/zdSek4oc/oh2F2XKyR5CKkd7nrx7D+7TWBdXfs9aj8UkFI
	yS00tb6ZnF3LInRMKFFemaETIgvjsyMxnzKelLN0raq9HYqJqZR5LxMlEWRehf6o1pnF
	xjKML8pX9nx+uT+jZ//fESZfebiKTWLvHhz44hXUJJd+fDZ6cBuNH16RdxTMIkckME7y
	73Wq+/+gJrLPejwgIlXwxUic0NW/MXpNdzS9OkLz1tiy9gI42v3wb/IK4NyScG2W/4HV
	UQ9J+5oUpRoOw4My9x7mmSqDvXYk/JwgX9SvPi56mWo+l0Y80+I7dghPePwH/uU1m5Lk
	aRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j8RbEx/VFB+wGHHn0JRIEWLjdijgMoWJ17IzQPU8yUc=;
	b=FxvxzEiJ15t2NDVrmNWhVtaEa4HlRIPno4e0bbfV9yKTfJjsMygnm6et/7/rivUjs3
	k5WOi9KoKVpGZyvj68c6LkaKcd7nbvDV+J1s0TtNLGkn2GStA1rGPR5WY+QMT+QH9CUp
	AF0ViVoEv0n3Btk4WKUxvJDPwDeuD5lAF837K8kMr1xXRsJkitb5c0omsdX+V8A6zATP
	YVq4Jw8Rmrrwyd0IGqvKPNYxjlNE5Pa4dWt9Yz3z68gcW/d5LsJ4FA11PF7UwH8osHTl
	M4U9szi0X31Pq9N5UtW9/TF8pOduZXM0R2rasbxKfp26T8/zhSC5xwW1jYfPtSsARe6U
	ZdhQ==
X-Gm-Message-State: ABuFfojEeMticngJUravOIBjwwf2enwuQSH2H//POQJ3KnnDRSA4626s
	DlVC7fDHyRdNSCmsoix8Oc7Qf1nzL7hfbexTB60TmQ==
X-Google-Smtp-Source: ACcGV60wZAY4CSi586KnH+sUZ/HJZ4AbXYpV0iuT0m/c2wF/o1bkYM3EzizgeOOqJ6CqVlkr70ATr9nhyNVPExTqepU=
X-Received: by 2002:a9d:550f:: with SMTP id l15mr13495647oth.83.1539805734699; 
	Wed, 17 Oct 2018 12:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20181017154048.17231-1-yann@blade-group.com>
	<CAMKF1soXq9u9GQMw4iemYLW5V9NpMLRQq1LABOGazJ3uTHBODA@mail.gmail.com>
In-Reply-To: <CAMKF1soXq9u9GQMw4iemYLW5V9NpMLRQq1LABOGazJ3uTHBODA@mail.gmail.com>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 21:48:42 +0200
Message-ID: <CA+4=imYo4UusPgA203DmQ=FaJUeidvsoYcUv7Vo=vqqq1UrtEw@mail.gmail.com>
To: raj.khem@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yann Dirson <yann@blade-group.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 19:48:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right.

This is being discussed following v1 of the patch which I had sent to
-core, to which I had send the patch by mistake at first.

Le mer. 17 oct. 2018 =C3=A0 20:39, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> On Wed, Oct 17, 2018 at 8:41 AM <yann.dirson@blade-group.com> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Otherwise the build fails with:
> >
> >   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
> >   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
> >
> > This restores some truth in the "Otherwise install nothing" comment in
> the recipe.
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > index 0ede5e57b..e81516fef 100644
> > --- a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > +++ b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
> >          '', d)} \
> >  "
> >
> > +RDEPENDS_ =3D ""
> > +
>
> this does not look right to me.
>
> >  # Install bluez4 tools or bluez5 tools depending on what is specified
> in the distro.
> >  # Otherwise install nothing.
> >  RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


--=20
Yann Dirson <yann@blade-group.com>
Blade -- 38 rue du Sentier, 75002 Paris

