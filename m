Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4226FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:51:16 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id o138-v6so10079451vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Lo3WZAH3uV6nL6fv7vVgDFos0S10Ktvia8QjNB7Ni9Y=;
	b=EP4tQNgKoWz9osuWzesgLu1gUfcTlt3grbKGypQRQSswnjC7KqLvKuUnUNBRnY5YJ9
	zTfWUIZq3rSqXBiknyGSnhJZb4ysfRVAYjpr9x6cPQOIFvdDbFquHFMWF5x/9GEftwsV
	V8UrHZFLV+4oLAqpnksQYDC5jdtJx8ARyr9UgxgmqqdeYxB7y6bOXUxO6U4WKV89vHxx
	7T3EOnKnsRI8GG6wJjq31n2C3tmt9djvQqQxe9Qn+VmYQtWSc0mCHocsTINRWObBsrJF
	YA8nTWrLxnp53uUTHSTW5CruimUpfy7viYmVjNR8YXPURtRZaM2Ocarz07kYvThhwOCi
	Ii5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Lo3WZAH3uV6nL6fv7vVgDFos0S10Ktvia8QjNB7Ni9Y=;
	b=nY8XQ5/UqwZeICC9MTOkAYWaw9GZ/s7vSJ09nDPg7rgP+u+ar1UywTHYL4etKJJHpf
	N2OYNUYyecyGCQec+Wxv1bQpLsbNl/0cipBJeUkGwexw31oQSJR8/v2CrBtVAU3soOT1
	Fm2vNgGajV+0K7dRmh/uDKlqO8U29EgVtjstyLCeUC90KDep4vpJhoadHraOe8eT5dxZ
	uhyDxcdetVrcCUihyV4Y2YIJ1RsPXv4QpMomDVN/e0a9eAk9FXPMWTWdEVbo2RGVdzQu
	Bt5UsJBfqFsjy9YOQ8jWOA1j50PXayp/K8rI32wtUDlPk/unGZr3NoZcClRJ53/nuwYr
	uVfg==
X-Gm-Message-State: APt69E3i6NganZdRNK2wmiIV+PNSwkiWfTcwaXH//o7p8x8uisctqTRY
	4ivSUU6sSh4UzTZ/ZJhQN/XaRVLvZCPMwInYKTU=
X-Google-Smtp-Source: ADUXVKKg+Cw1RQSVKczZz6da79VgZhVNXvpOqlQviOkYR5qNilpO2BsnFoNaHx8EHRMCp4rzj3hwRs0LZ2XgQaCw5XE=
X-Received: by 2002:a1f:2c0d:: with SMTP id
	s13-v6mr7548158vks.106.1529344276848; 
	Mon, 18 Jun 2018 10:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
In-Reply-To: <CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 10:50:59 -0700
Message-ID: <CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 17:51:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark

It seems your distro is not inheriting it globally. Here I have
INHERIT_DISTRO ?=3D  "debian devshell sstate license remove-libtool"
On Mon, Jun 18, 2018 at 10:49 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Mon, Jun 18, 2018 at 1:15 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> > On Mon, Jun 18, 2018 at 1:07 PM, Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> >> On Monday, June 18, 2018 12:51:47 PM EDT Andreas M=C3=BCller wrote:
> >>> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
> >>>
> >>> <mark.asselstine@windriver.com> wrote:
> >>> > Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] w=
e
> >>> >
> >>> > are getting a QA Warnings/Erros for 'installed-vs-shipped':
> >>> >     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
> >>> >
> >>> >     Files/directories were installed but not shipped in any package=
:
> >>> >       /usr/lib64/xfce4/panel/plugins/liblauncher.la
> >>> >       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
> >>> >       ...
> >>> >
> >>> > From various OE documents the .la files should not be packaged in
> >>> > either the main recipe package or the -dev package unless required.=
 So
> >>> > inherit 'remove-libtool' to have all the .la files cleaned up as th=
ey
> >>> > don't appear to be necessary.
> >>> >
> >>> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >>> > ---
> >>> >
> >>> > This error is currently only seen on master-next since the xfce4-pa=
nel
> >>> > upgrade commit is yet to make it into master. As such this fix is o=
nly
> >>> > applicable to master-next.
> >>>
> >>> I think it was not the upgrade -> 4.13.3 commit but later commit / sa=
me
> >>> series
> >>>
> >>
> >> Sure, I can update the commit log and send a V2 but first let's sort o=
ut the
> >> remainder.
> >>
> >>> various classes recipes: Remove FILES entries for dbg/dev packages
> >>> ...
> >>> --- a/meta-xfce/classes/xfce.bbclass
> >>> +++ b/meta-xfce/classes/xfce.bbclass
> >>> @@ -12,11 +12,3 @@ DEPENDS +=3D "intltool-native"
> >>>
> >>>  FILES_${PN} +=3D "${datadir}/icons/* ${datadir}/applications/*
> >>> ${libdir}/xfce4/modules/*.so*"
> >>>  FILES_${PN}-doc +=3D "${datadir}/xfce4/doc"
> >>> -
> >>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*.la"
> >>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.la"
> >>> ...
> >>>
> >>> My builds have remove-libtool enabled so I did not see this QA
> >>> warning/error.
> >>>
> >>> Isn't remove-libtool enabled by default since pyro/2.3 - so that this
> >>> patch is obsolete (and all the other same kind coming later)?
> >>
> >> The documentation still indicates:
> >> ---
> >> <note>
> >>             The <filename>remove-libtool</filename> class is not enabl=
ed by
> >>             default.
> >> </note>
> >> ---
> >>
> >> So as far as I know this still needs to be handled recipe to recipe by
> >> inheriting the remove-libtool class in the affected recipes. I have do=
ne
> >> builds without manipulating the generated local.conf which seem to con=
firm
> >> this but I could be wrong. Add RP who might have some guidance.
> >>
> >> MarkA
> >
> > Just hit another one
> > ---
> > ERROR: gtk-xfce-engine-3.2.0-r0 do_package: QA Issue: gtk-xfce-engine:
> > Files/directories were installed but not shipped in any package:
> >  /usr/lib64/gtk-3.0/3.0.0/theming-engines/libxfce.la
> >  /usr/lib64/gtk-2.0/2.10.0/engines/libxfce.la
> > Please set FILES such that these items are packaged. Alternatively if
> > they are unneeded, avoid installing them or delete them within
> > do_install.
> > ---
> > Andreas, seeing as you didn't hit the 'installed-vs-shipped' QA issue
> > with thunar recipe I suspect the reason you didn't see this is not
> > related to remove-libtool but rather that you have disabled the
> > 'installed-vs-shipped' QA check itself.
>
> And xfce4-session now too. I found a reference from a few years back
> related to remove-libtool use on a per recipe basis
> (http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/10=
6323.html),
> so definitely some concerns being expressed using this on a per recipe
> basis. On the other hand this just seems like we are setting traps for
> ourselves. If we compare to another common class, rm_work, I can
> pretty much toggle rm_work on or off and recipes are expected to just
> work in either case. This is definitely not the case with
> remove-libtool which gives the impression of being optional but if not
> enabled and I do basic QA checks I will get failures, as is evident in
> my current build.
>
> MarkA
>
> >
> > MarkA
> >
> >
> >>
> >>>
> >>> Andreas
> >>
> >>
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

