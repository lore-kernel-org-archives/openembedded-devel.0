Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0E1C78262
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 17:59:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t74so20107wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=obQSs5BLmi7X+Iu1oAMTW3ztmcENx4Okft9UeDcY/tA=;
	b=uqeaHHb071GY6sNz/4mQAPIBpQyRGokXWCXHr6ILMFcijVUWl4tj+bAxo7lF/+4Vsm
	EflttjeBpwPmaR3ejZSYudpnWb4mtE0LXiLh1izdKsGjf3IQgkPyYbmlRwsGBIMNKISc
	7OmV7c1amZzkoST07iCWqNBdkNdUpMVvTftUd8yqCmVaPf0yRlFeaoD8sH9dl906RUGc
	WhpsaVSRhA/1Ju3Lt4dp/AXzVdBPnO8j2eLUFhuZ59XMy386gHY5lWHbGxe8H/lM7bHR
	hxxZJeNyR/vN7IzHGkR8R4SSJQOyb76/asYyTYu4lLEWe5EuyDKrn3FCOWgjhceWRcUK
	WTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=obQSs5BLmi7X+Iu1oAMTW3ztmcENx4Okft9UeDcY/tA=;
	b=GZmc5GnQZ0BqKjWVZxoIsdpGj1Xrf3eQAoLr5VLZbR3NDVWDfiYO5yevGMKWLMGC9+
	DLaLgBGxNQSxHAFKkvX8evPk3/MXa7P7bgRimgcD48YNWVBEkg6viI+SBMUre1MxriRb
	usjAZmKldzYN0mhWafFTWZg6/M3p0F2pbDhhedcgvC/GYSUjXm3LixzB0MGVka9brwQW
	FfAvbflVsI4mPqRDXpzuVIWvAK/aJUh/ymIJhy2DB9i7I2h2PFzjOCpF2hU7RGxSWPRd
	kwwLYtCQuDyBxTdTlD7vhlf6bia9d83ixmj6r2RpJA9ETs/Bv7Fd2CmdtkoEGutE37lA
	UW1w==
X-Gm-Message-State: APf1xPA+lOEutpyy4pF295bJbn8jJmx3rgyTajRWSH0i6y8Fhm8FZxRK
	0WtxEDV0/HaPLQcIJv5snSocpT1jhJ9AnYrXNGg=
X-Google-Smtp-Source: AG47ELtUGh9uNbeE2XyLzWYsAzOWCUTPQ2gwPqm+9I+Lte3LNwh5ueovWEU5wc+veyYDo73leiwwUeTOWIea4TQka8g=
X-Received: by 10.28.166.206 with SMTP id p197mr9084wme.81.1519322357688; Thu,
	22 Feb 2018 09:59:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 22 Feb 2018 09:59:17 -0800 (PST)
In-Reply-To: <CABXoSoWp7E1DdcreEo1o0E9U_Hv5B15dzsSagFJTYQHH7XzvmQ@mail.gmail.com>
References: <20180222170221.1887-1-Martin.Jansa@gmail.com>
	<CABXoSoWp7E1DdcreEo1o0E9U_Hv5B15dzsSagFJTYQHH7XzvmQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Feb 2018 18:59:17 +0100
Message-ID: <CA+chaQfhzr_yoorzLy8RJ_tRH16yby=G4hgPWUTuf3r=zO+K1w@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCHv2] qt5-git.inc: drop nobranch=1
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
X-List-Received-Date: Thu, 22 Feb 2018 17:59:17 -0000
Content-Type: text/plain; charset="UTF-8"

Why do they disappear? Or why aren't they included in 5.x branches at the
time of the release so that we can use just 5.x without the SRCREVs being
only on 5.x.x branches?

On Thu, Feb 22, 2018 at 6:27 PM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> Note that the Qt release branches (5.x.x) will usually disappear right
> after the release, which will break the build without nobranch=1
>
> On 22 February 2018 at 19:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * sneaked in with:
> >   commit 333949a8239dfa7788b35f1059614733e11a6a25
> >   Author: Samuli Piippo <samuli.piippo@qt.io>
> >   Date:   Thu Jan 26 16:54:50 2017 +0200
> >
> >     Upgrade to Qt 5.8
> > * use 5.10.1 branch by defaut and fix QT_MODULE_BRANCH
> >   in qtknx, qtmqtt, qtwebkit-examples, qtwebkit which don't
> >   have 5.10.1 branch at all
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-qt/qt5/qt5-git.inc              | 6 +++---
> >  recipes-qt/qt5/qtknx_git.bb             | 2 ++
> >  recipes-qt/qt5/qtmqtt_git.bb            | 2 ++
> >  recipes-qt/qt5/qtwebkit-examples_git.bb | 2 ++
> >  recipes-qt/qt5/qtwebkit_git.bb          | 2 ++
> >  5 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > index 7ee0643..beba913 100644
> > --- a/recipes-qt/qt5/qt5-git.inc
> > +++ b/recipes-qt/qt5/qt5-git.inc
> > @@ -1,9 +1,9 @@
> >  # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
> > -# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
> > +# Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
> >
> >  QT_MODULE ?= "${BPN}"
> > -QT_MODULE_BRANCH ?= "5.10"
> > -QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
> > +QT_MODULE_BRANCH ?= "5.10.1"
> > +QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
> >
> >  # each module needs to define valid SRCREV
> >  SRC_URI = " \
> > diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
> > index 5e01e3c..fa981ab 100644
> > --- a/recipes-qt/qt5/qtknx_git.bb
> > +++ b/recipes-qt/qt5/qtknx_git.bb
> > @@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > +QT_MODULE_BRANCH = "5.10"
> > +
> >  SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
> > diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
> > index b705f7c..90c255d 100644
> > --- a/recipes-qt/qt5/qtmqtt_git.bb
> > +++ b/recipes-qt/qt5/qtmqtt_git.bb
> > @@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > +QT_MODULE_BRANCH = "5.10"
> > +
> >  SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
> > diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/
> qtwebkit-examples_git.bb
> > index 3e3e4a0..114fab7 100644
> > --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> > +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> > @@ -17,4 +17,6 @@ DEPENDS += "qtwebkit qtxmlpatterns"
> >  RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
> >  RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL',
> 'openssl', 'ca-certificates', '', d)}"
> >
> > +QT_MODULE_BRANCH = "5.9"
> > +
> >  SRCREV = "a24c780b60d7d8bc00c4a48042cf7f32db777d55"
> > diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/
> qtwebkit_git.bb
> > index 5dee6a4..b23d4d6 100644
> > --- a/recipes-qt/qt5/qtwebkit_git.bb
> > +++ b/recipes-qt/qt5/qtwebkit_git.bb
> > @@ -87,4 +87,6 @@ PACKAGES_remove = "${PN}-examples-dev
> ${PN}-examples-staticdev ${PN}-examples-db
> >  RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586',
> 'i386').replace('i686', 'i386') }"
> >  export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_
> LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
> >
> > +QT_MODULE_BRANCH = "5.9"
> > +
> >  SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
> > --
> > 2.15.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

