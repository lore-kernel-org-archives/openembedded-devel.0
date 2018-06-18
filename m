Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 42C78751F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:58:14 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x4-v6so10071106vkx.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=A2pnIEXCIvkPc2LoJAgyo4+YTZ8/nZVWSOm4OMAvyfg=;
	b=YflSHPqJgTgbG3jkJcBLbc2otN9PRfh9kebqzxCo1ksDwwc3LxRK16h7TK9ZYwtqUV
	vgohpY3kWuJvKD5ETnKRc033KIpKqM38wkxuPnMi/TKPsDfA+ApZYgojjeOs88e3dM5p
	JeDtdnjflv8Ve2QRNX5/q0bZ1i3zk1kCrBR+BY6XVeEctQkxLeOh06jfq5qZE1b4c9KZ
	F1h4ZTDGB9G6WbeECGuL2TOFIEeOZFbtP5lgk3IUh70z4GIUPLpfvWeYYrvzOXxtOF1D
	SE9BBPdjALmKW1j05u37r259orTysUuWRB9uhjzdhxB6sDhzHQOFg1xr83FBYJDEUAhf
	2w1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=A2pnIEXCIvkPc2LoJAgyo4+YTZ8/nZVWSOm4OMAvyfg=;
	b=iqA5Vgr2sLU6QXHIhFl6Eg+IXeN38/ZSWIKiS/Z/PmXGNrwp/O/94WAgZZCFACG8FP
	A6/9nnDdhdb48jESOR4YvnUo9zkScgzc1f+gUvOwUoBdpGr30QGsc5UKjbMUmpXOz2tj
	BuPrZBHX2CKopYpAoV5Wq73w7uWCtKLHFgyd+ndaoEOqizSknmY100agwkj3A19LvoB2
	D8OL5z+cROTuJL+GPzK1ztM2oEFoqYkLHOo/LgCuRwkR/OsN0s88vOz/zQdN0jWVsPfy
	n97TXrBTjRcsnz5UBOOV7woUBXT9eNBL2ehHQHGpUQs+024LzbAIg82Ma0bl1y0g9ANp
	AQIg==
X-Gm-Message-State: APt69E2tqtpwkQivFNPb7CGGJr8JAMmBDceqAxLPw4hV1lz+EgeS/h52
	2jxNlsclrWcLpfLBRv/dGOlgZxcXfF/hRdjBeLjJ7A==
X-Google-Smtp-Source: ADUXVKLKprHBX35/dw0pfnfMA5VKOgabw/ezq/HQrEtFVi2GWfuV7nckbLOdRWNiZ+YVc63eS5C8VtyAUGlCi18aAWo=
X-Received: by 2002:a1f:7c4:: with SMTP id 187-v6mr7613872vkh.60.1529344694925;
	Mon, 18 Jun 2018 10:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
	<c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
In-Reply-To: <c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 10:57:57 -0700
Message-ID: <CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 18 Jun 2018 17:58:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.com> wrot=
e:
>
> On 6/18/18 12:50 PM, Khem Raj wrote:
> > Hi Mark
> >
> > It seems your distro is not inheriting it globally. Here I have
> > INHERIT_DISTRO ?=3D  "debian devshell sstate license remove-libtool"
>
> So is remove-libtool a recipe or a distro option?
>
> I'm asking because doing this half-way is causing a lot of confusion.
>
> If it's a distro option, then the recipes should work without it being se=
t.  If
> it's a recipe option, then the recipes that need it should use it.
>
> Right now it doesn't seem to be working with these recipes because they d=
on't
> package the .la files UNLESS it's enabled.  So the fix is either to packa=
ge them
> (by default) or inherit the remove-libtool.
>

since we make it as part of meta/conf/distro/defaultsetup.conf
its a default policy,  its perfectly fine for a distro to disregard that
however, then you fall into a non-default case. I am willing to accept
per recipe patches but I would recommend to consider it as a distro
feature for your distro.

> --Mark
>
> > On Mon, Jun 18, 2018 at 10:49 AM Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> >>
> >> On Mon, Jun 18, 2018 at 1:15 PM, Mark Asselstine
> >> <mark.asselstine@windriver.com> wrote:
> >>> On Mon, Jun 18, 2018 at 1:07 PM, Mark Asselstine
> >>> <mark.asselstine@windriver.com> wrote:
> >>>> On Monday, June 18, 2018 12:51:47 PM EDT Andreas M=C3=BCller wrote:
> >>>>> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
> >>>>>
> >>>>> <mark.asselstine@windriver.com> wrote:
> >>>>>> Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] =
we
> >>>>>>
> >>>>>> are getting a QA Warnings/Erros for 'installed-vs-shipped':
> >>>>>>     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel=
:
> >>>>>>
> >>>>>>     Files/directories were installed but not shipped in any packag=
e:
> >>>>>>       /usr/lib64/xfce4/panel/plugins/liblauncher.la
> >>>>>>       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
> >>>>>>       ...
> >>>>>>
> >>>>>> From various OE documents the .la files should not be packaged in
> >>>>>> either the main recipe package or the -dev package unless required=
. So
> >>>>>> inherit 'remove-libtool' to have all the .la files cleaned up as t=
hey
> >>>>>> don't appear to be necessary.
> >>>>>>
> >>>>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >>>>>> ---
> >>>>>>
> >>>>>> This error is currently only seen on master-next since the xfce4-p=
anel
> >>>>>> upgrade commit is yet to make it into master. As such this fix is =
only
> >>>>>> applicable to master-next.
> >>>>>
> >>>>> I think it was not the upgrade -> 4.13.3 commit but later commit / =
same
> >>>>> series
> >>>>>
> >>>>
> >>>> Sure, I can update the commit log and send a V2 but first let's sort=
 out the
> >>>> remainder.
> >>>>
> >>>>> various classes recipes: Remove FILES entries for dbg/dev packages
> >>>>> ...
> >>>>> --- a/meta-xfce/classes/xfce.bbclass
> >>>>> +++ b/meta-xfce/classes/xfce.bbclass
> >>>>> @@ -12,11 +12,3 @@ DEPENDS +=3D "intltool-native"
> >>>>>
> >>>>>  FILES_${PN} +=3D "${datadir}/icons/* ${datadir}/applications/*
> >>>>> ${libdir}/xfce4/modules/*.so*"
> >>>>>  FILES_${PN}-doc +=3D "${datadir}/xfce4/doc"
> >>>>> -
> >>>>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*.la"
> >>>>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.la"
> >>>>> ...
> >>>>>
> >>>>> My builds have remove-libtool enabled so I did not see this QA
> >>>>> warning/error.
> >>>>>
> >>>>> Isn't remove-libtool enabled by default since pyro/2.3 - so that th=
is
> >>>>> patch is obsolete (and all the other same kind coming later)?
> >>>>
> >>>> The documentation still indicates:
> >>>> ---
> >>>> <note>
> >>>>             The <filename>remove-libtool</filename> class is not ena=
bled by
> >>>>             default.
> >>>> </note>
> >>>> ---
> >>>>
> >>>> So as far as I know this still needs to be handled recipe to recipe =
by
> >>>> inheriting the remove-libtool class in the affected recipes. I have =
done
> >>>> builds without manipulating the generated local.conf which seem to c=
onfirm
> >>>> this but I could be wrong. Add RP who might have some guidance.
> >>>>
> >>>> MarkA
> >>>
> >>> Just hit another one
> >>> ---
> >>> ERROR: gtk-xfce-engine-3.2.0-r0 do_package: QA Issue: gtk-xfce-engine=
:
> >>> Files/directories were installed but not shipped in any package:
> >>>  /usr/lib64/gtk-3.0/3.0.0/theming-engines/libxfce.la
> >>>  /usr/lib64/gtk-2.0/2.10.0/engines/libxfce.la
> >>> Please set FILES such that these items are packaged. Alternatively if
> >>> they are unneeded, avoid installing them or delete them within
> >>> do_install.
> >>> ---
> >>> Andreas, seeing as you didn't hit the 'installed-vs-shipped' QA issue
> >>> with thunar recipe I suspect the reason you didn't see this is not
> >>> related to remove-libtool but rather that you have disabled the
> >>> 'installed-vs-shipped' QA check itself.
> >>
> >> And xfce4-session now too. I found a reference from a few years back
> >> related to remove-libtool use on a per recipe basis
> >> (http://lists.openembedded.org/pipermail/openembedded-devel/2016-March=
/106323.html),
> >> so definitely some concerns being expressed using this on a per recipe
> >> basis. On the other hand this just seems like we are setting traps for
> >> ourselves. If we compare to another common class, rm_work, I can
> >> pretty much toggle rm_work on or off and recipes are expected to just
> >> work in either case. This is definitely not the case with
> >> remove-libtool which gives the impression of being optional but if not
> >> enabled and I do basic QA checks I will get failures, as is evident in
> >> my current build.
> >>
> >> MarkA
> >>
> >>>
> >>> MarkA
> >>>
> >>>
> >>>>
> >>>>>
> >>>>> Andreas
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

