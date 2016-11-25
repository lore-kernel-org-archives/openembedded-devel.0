Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C77EE607A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 06:07:51 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 98so2839666lfs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 22:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=NKu4Ys339EdYQLSkHpAYPSrPZoMDRh3QlzK1+GNY1UU=;
	b=P6G+UXjy6sApWGXuThCit57vT7MfqTxBNl5EUjTIZ/VrGoC/q9fW2TFi8TAaJfsCQ2
	GyXafjUWr2/gvn5bl8IuU1NUIFs8chGi6ejzCQi8jLfsamfeCihbkx5UMg9qnKNE/qmh
	2OcBqqpn2J1wH3EqOyrlHJmU0vP1ewDBT7JGdpShbh7YkB2zUzcjrEE1TGNRQV9wycmE
	2AWvstIll/hbMytvw6UbvxtIC4vUNKzuy2G8tRtGEfo1VHF/rXpsTQZR4btrhRVlSZSj
	eeCfVLicnugo1KuWmQlKuzlI2XwbcHHnA0GLxn75AiWiKcS77/qvpBAGINjfSjvReVgC
	dCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=NKu4Ys339EdYQLSkHpAYPSrPZoMDRh3QlzK1+GNY1UU=;
	b=Ap9afcplb72WEETzzvbcvYbesZRkvjc8a2zsQ7z9rHLxvtD9f0MA5f05YJPUOpA5SG
	5VMsq5Ile3f1MPj5vMB9S17HhtrYkcnVgkvTD94X7CNCTtTZmIglV1ZKgC9YPmiHzYdC
	XxqtefEm6ipBsiqzTRQ23J3gXDacE2lK/L/TiJnpJPZyRj2SrJPTt2gPqCktfBDfJ1oE
	EOrzhc6xYLFKr3wK+4r7CMsC6lp4ueNlslSBln1ppJ52rSJ4X0CJcHQLNOJRqe4SkQ0N
	vCWm8ES8DYec4e173ZDuK9d8VCAw5YRaz6WXABjW722F5EDb0djaWKQxEpZt6mJ/7nWz
	N8qw==
X-Gm-Message-State: AKaTC00mC08V+MI/ss1DuvA7hEcgCADiQxP/2gAP1K410U7uewH5mL08AonNcgi+W56hgpvpznZtFr1N17WGxw==
X-Received: by 10.25.167.20 with SMTP id q20mr2527959lfe.115.1480054071377;
	Thu, 24 Nov 2016 22:07:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.212.16 with HTTP; Thu, 24 Nov 2016 22:07:50 -0800 (PST)
In-Reply-To: <CA+chaQcSCsVDCfqPZn7p2vJrMrf0tCgBoiBDBLUm1rP3zWXoUg@mail.gmail.com>
References: <1479455334-21184-1-git-send-email-samuli.piippo@qt.io>
	<20161123152941.GC3265@jama> <20161123154346.GD3265@jama>
	<20161123185251.GG3265@jama> <20161123201431.GI3265@jama>
	<02f7b3e7-93d4-58ae-ebd8-f54fe5781ce1@gmail.com>
	<CA+chaQcSCsVDCfqPZn7p2vJrMrf0tCgBoiBDBLUm1rP3zWXoUg@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 25 Nov 2016 08:07:50 +0200
Message-ID: <CABXoSoWuDJnz_G7rz2xw7Vh+y4Ta8Ys358dx+b8qcpewAyYXJA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCHv2] Upgrade to Qt 5.8
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
X-List-Received-Date: Fri, 25 Nov 2016 06:07:53 -0000
Content-Type: text/plain; charset=UTF-8

Next update to latests sha1s on all modules will again break several
things, so that will take some time to sort out.
v3 meanwhile has the 3 fixes in place.

-samuli

On Thu, Nov 24, 2016 at 12:47 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Please send v3 with all 3 fixes.
>
> On Thu, Nov 24, 2016 at 9:23 AM, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>
> > On 23.11.2016 22:14, Martin Jansa wrote:
> >
> >> On Wed, Nov 23, 2016 at 07:52:51PM +0100, Martin Jansa wrote:
> >>
> >>> On Wed, Nov 23, 2016 at 04:43:46PM +0100, Martin Jansa wrote:
> >>>
> >>>> On Wed, Nov 23, 2016 at 04:29:41PM +0100, Martin Jansa wrote:
> >>>>
> >>>>> On Fri, Nov 18, 2016 at 09:48:54AM +0200, Samuli Piippo wrote:
> >>>>>
> >>>>>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> >>>>>> the contents of an environment value when qmake is run instead of
> when
> >>>>>> Makefile is processed. All OE_QMAKE_xxx variables need to be
> exported
> >>>>>> for qmake to find them. configure's setBootstrapVariable function
> >>>>>> needs
> >>>>>> to change $$(..) to normal $(...) operator to work with qmake's
> >>>>>> Makefile.
> >>>>>>
> >>>>>> qt.conf generation for qtbase recipes is not needed, as configure
> will
> >>>>>> generate its own version based on configure arguments. Skip running
> >>>>>> qmake, since configure is now automatically invoked when it's run in
> >>>>>> qtbase's root folder.
> >>>>>>
> >>>>>> Update PACKAGECONFIGs for qtbase to match current configure options.
> >>>>>>
> >>>>>> Merge the two qtwayland recipes to one that supports all three
> targets
> >>>>>> (target, native, nativesdk) without need for additional patch.
> >>>>>>
> >>>>>> Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> >>>>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> >>>>>> ---
> >>>>>>
> >>>>> ...
> >>>>
> >>>>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> >>>>>> index e1e25ba..a1dd16a 100644
> >>>>>> --- a/recipes-qt/qt5/qt5-git.inc
> >>>>>> +++ b/recipes-qt/qt5/qt5-git.inc
> >>>>>> @@ -2,7 +2,7 @@
> >>>>>>  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
> >>>>>>
> >>>>>>  QT_MODULE ?= "${BPN}"
> >>>>>> -QT_MODULE_BRANCH ?= "5.7"
> >>>>>> +QT_MODULE_BRANCH ?= "5.8"
> >>>>>>  QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
> >>>>>>
> >>>>>>  # each module needs to define valid SRCREV
> >>>>>> @@ -12,4 +12,4 @@ SRC_URI = " \
> >>>>>>
> >>>>>>  S = "${WORKDIR}/git"
> >>>>>>
> >>>>>> -PV = "5.7.0+git${SRCPV}"
> >>>>>> +PV = "5.8.0+git${SRCPV}"
> >>>>>>
> >>>>>
> >>>>> This version is wrong as 5.8.0 wasn't released yet (was it?), so this
> >>>>> PV
> >>>>> shouldn't sort higher then 5.8.0 release.
> >>>>>
> >>>>> I'll change it to:
> >>>>> 5.7.99+5.8.0-beta+git${SRCPV}
> >>>>> like I did in previous releases.
> >>>>>
> >>>>
> > Yes, it's still in beta stage.
> >
> >
> >>>> There is also some issue with qtwayland and qtenginio reported in:
> >>>> http://lists.openembedded.org/pipermail/openembedded-devel/2
> >>>> 016-November/110021.html
> >>>>
> >>>> I'm trying to reproduce it with only oe-core+meta-qt5, because the
> >>>> qtwayland
> >>>> one might be caused by bbappend in meta-luneui, but qtenginio might be
> >>>> easier to reproduce.
> >>>>
> >>>
> > Enginio examples are broken, as there are new checks in Qt 5.8.
> > Enginio is deprecated and won't be receiving much attention any more, but
> > build can be fixed easily with:
> > EXTRA_QMAKEVARS_PRE += "CONFIG+=install_ok"
> >
> >
> >
> >>> Local build confirmed that qtwayland issue was caused by that bbappend,
> >>> but qtenginio error is still there and I've also noticed that with:
> >>>
> >>> PACKAGECONFIG_append_pn-qtbase = " icu gl accessibility directfb
> >>> examples kms"
> >>> PACKAGECONFIG_remove_pn-qtbase = "gl"
> >>>
> >>> qtbase.do_compile fails with:
> >>> http://errors.yoctoproject.org/Errors/Details/107134/
> >>> and this configuration was working with 5.7 version, is directfb
> >>> unsupported now in 5.8 or does it just need some tweaks in qtbase
> >>> PACKAGECONFIGs?
> >>>
> >>
> >> directfb_egl was introduced to qtConfig in:
> >>
> >> commit 60985aa42b37217fb4c01ed85bbf6f14410c3491
> >> Author: Lars Knoll <lars.knoll@qt.io>
> >> Date:   Fri Aug 5 13:35:39 2016 +0200
> >>
> >>     Use qtConfig throughout in qtbase
> >>
> >> ...
> >>
> >> index d4977bf..de0344f 100644
> >> --- a/src/plugins/platforms/directfb/directfb.pro
> >> +++ b/src/plugins/platforms/directfb/directfb.pro
> >> @@ -24,7 +24,7 @@ HEADERS = qdirectfbintegration.h \
> >>      qdirectfbeglhooks.h
> >>
> >>  # ### port the GL context
> >> -contains(QT_CONFIG, directfb_egl) {
> >> +qtConfig(directfb_egl) {
> >>      HEADERS += qdirectfb_egl.h
> >>      SOURCES += qdirectfb_egl.cpp
> >>      DEFINES += DIRECTFB_GL_EGL
> >>
> >>
> >> But there is no directfb_egl in src/gui/configure.json
> >>
> >>
> > I'm not sure what's the actual status of DirectFB within Qt is, but it's
> > not actively developed or tested at all, and it's currently broken as you
> > found out.
> > I created bug for Qt for this: https://bugreports.qt.io/
> browse/QTBUG-57306
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

