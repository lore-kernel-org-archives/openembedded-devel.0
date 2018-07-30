Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 20AC16086F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 14:29:59 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id h20-v6so13965558wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MCix7B0Yk/NKortyVhXiDrzUk3XjT2kL93LNkJXqPUU=;
	b=m/clbGI3TjBDF9HDPMaQTk+KWOnZGE72E5sZynEjgTcWS1DA2bB8k+u5RBhRvqILE+
	ZCzKOyHByQOY9C9ATQ3YjBsnmSeY9sPub2PdQ5fokUqd9jj7XkTMKnGgosTYP0ckKKH0
	kLkRIOn34ADTXtre5FIYU98/BILpJTgKnrkPeVAQE3spxy1ckTX3UxwXXwADZ9bOeyXc
	tt+2poXLnIQR1Wu+BHsrIb4H9Ln8VL3A0Of9dCCGsosaaSvPN5EnkGElsvyw+Z0KUGcv
	BcAqMXuLiNxM0oRoOIhKqDtQ7DTquBO41VeQzH/BYYvcT29aCSYJD65mNt78c7bBaAlb
	AxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MCix7B0Yk/NKortyVhXiDrzUk3XjT2kL93LNkJXqPUU=;
	b=Pq+OE2YEm5oKMNW6xR2M/N5F4v/4nDQN9YhNkWJ/RY+KzP4oQlzrFM8lWqsFuv2ua0
	Rzkk/XDF948nMTA9JLN5nE8jGXOkOa4dMQg+gC0ZHjJKYysQtBryc5nZwpQv2h3KsUdv
	m/KjGSnE0qnWaO7610b74xPPNBQKDrTbhmNxEIlW58FEERAzjLnNefQa2TW4wSIbQclg
	H2OD0HZy1uY4ZJBHqQZJeov80/mH1A+9cBVYf1Fkvnrtvbty5rfgQ3G4rKyotg2igRC7
	ha+mBmvk4/2oeucWH3dQAcGPk55JJTSEAee6gnoBTP4m/B60vEG/74hv2bfuf8MTBZsG
	hxgg==
X-Gm-Message-State: AOUpUlH+VioYX/NsqBIpeCk8qYKhsbnx3RiWo+fOGW2YoACRTYQk/JFB
	FW1BIkkgTmWZxVEI+6RTrjxKM04F3ToGoTNSgak=
X-Google-Smtp-Source: AAOMgpeug3AJD3vR8tCIarFdmSYDuiUwlut3H6JDKHu/3sZyslfEaE4AbdDDdv26XsG1xCTxYF0Pye8ZZJPJeKbFXcA=
X-Received: by 2002:a1c:b484:: with SMTP id
	d126-v6mr15586669wmf.17.1532961000679; 
	Mon, 30 Jul 2018 07:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <1519987524-4045-1-git-send-email-mikko.gronoff@qt.io>
	<CA+chaQdsMvcCGbvZmp50eeOtuAm1LjTKwB=oQ7taMZuJn9j_tQ@mail.gmail.com>
	<CA+chaQd=R5R4u6RQcLi0B+xCPRxa-Y3K0ytKCMY5d-R=4dXACw@mail.gmail.com>
	<CABXoSoXGNM1JT6aNKGpmJtxHVnrgbXXUWGHqJGqJhxhu1-KLFQ@mail.gmail.com>
In-Reply-To: <CABXoSoXGNM1JT6aNKGpmJtxHVnrgbXXUWGHqJGqJhxhu1-KLFQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Jul 2018 16:29:48 +0200
Message-ID: <CA+chaQdvJ+HNOLoJs6Ot-xaUDgfRZp1RQ7+8mfXxtYTZKfChOQ@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Change default SRC_URI from github.com to code.qt.io
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
X-List-Received-Date: Mon, 30 Jul 2018 14:30:00 -0000
Content-Type: text/plain; charset="UTF-8"

No I wasn't using codereview.qt-project.org as QT_GIT before and even if I
did, then bitbake fetcher wouldn't be using
downloads/git2/code.qt.io.qt.qtbase.git directory to store it I think.


On Mon, Jul 30, 2018 at 12:23 PM Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> Have you been using codereview.qt-project.org as the QT_GIT previously?
> refs/changes/* are gerrit and CI specific refs and are never be
> mirrored to github or code.qt.io
>
> -samuli
>
> On 28 July 2018 at 03:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> > In the end it took 60 hours for qtbase, 10 hours for qtdeclarative..
> >
> > On Fri, Jul 27, 2018 at 9:21 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> >> One disadvantage of this is that fetching from code.qt.io seems to be
> >> significantly slower than from github.com.
> >>
> >> One extreme case is just running in one of my old build dirs, where the
> >> checkout from code.qt.io wasn't updated on premirror for quite long
> time
> >> and now the do_fetch of qtbase is already running for 43 hours..
> >>
> >> Most of the time it's removing various refs from gerrit reviews:
> >> $ tail
> >>
> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
> >>  x [deleted]         (none)     -> refs/changes/83/75483/6
> >>  x [deleted]         (none)     -> refs/changes/83/75783/1
> >>  x [deleted]         (none)     -> refs/changes/83/75783/2
> >>  x [deleted]         (none)     -> refs/changes/83/75783/3
> >>  x [deleted]         (none)     -> refs/changes/83/75783/4
> >>  x [deleted]         (none)     -> refs/changes/83/75783/5
> >>  x [deleted]         (none)     -> refs/changes/83/75783/6
> >>  x [deleted]         (none)     -> refs/changes/83/7583/1
> >>  x [deleted]         (none)     -> refs/changes/83/76183/1
> >>  x [deleted]         (none)     -> refs/changes/83/76183/2
> >>
> >> and there is a lot of them:
> >> $ grep -c deleted
> >>
> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
> >> 81174
> >>
> >> $ grep -c deleted.*refs/changes
> >>
> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
> >> 63253
> >>
> >> $ grep -c deleted.*refs/builds
> >>
> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
> >> 17921
> >>
> >> Yes it might be faster to delete the archive from premirror and do clone
> >> from scratch, but other developers wouldn't know what to do with local
> >> downloads directory.
> >>
> >> On Fri, Mar 2, 2018 at 5:19 PM Mikko Gronoff <mikko.gronoff@qt.io>
> wrote:
> >>
> >>> There have been issues in the past with github qt mirror being out of
> >>> sync with code.qt.io for certain module repos. Right now there's been
> a
> >>> several days long break in update cycle for seemingly all the qt
> >>> modules where content has not been pushed to the github mirror. Change
> >>> the default SRC_URI to the more reliable code.qt.io.
> >>>
> >>> Change-Id: Ic7d3b9a82ef0ae502e99a8516ef78ca09250fd1e
> >>> Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
> >>> Reviewed-by: Samuli Piippo <samuli.piippo@qt.io>
> >>> ---
> >>>  conf/layer.conf                              | 4 ++--
> >>>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 3 ++-
> >>>  2 files changed, 4 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/conf/layer.conf b/conf/layer.conf
> >>> index 7751ce2..f540710 100644
> >>> --- a/conf/layer.conf
> >>> +++ b/conf/layer.conf
> >>> @@ -33,7 +33,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
> >>>
> >>>  IMAGE_FEATURES[validitems] += "qtcreator-debug"
> >>>
> >>> -QT_GIT ?= "git://github.com/qt"
> >>> -QT_LABS_GIT ?= "git://github.com/qt-labs"
> >>> +QT_GIT_PROJECT ?= "qt"
> >>> +QT_GIT ?= "git://code.qt.io/${QT_GIT_PROJECT}
> <http://code.qt.io/$%7BQT_GIT_PROJECT%7D>
> >>> <http://code.qt.io/$%7BQT_GIT_PROJECT%7D>"
> >>>  QT_GIT_PROTOCOL ?= "git"
> >>>  QT_EDITION ?= "opensource"
> >>> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> >>> b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> >>> index dfbe4ae..36d57f1 100644
> >>> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> >>> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> >>> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =
> >>> "file://qml/QtDemo/main.qml;endline=39;md5=7d80863906a4bc8ffc
> >>>  DEPENDS = "qtdeclarative qtxmlpatterns qtgraphicaleffects qtsvg
> >>> qtmultimedia"
> >>>
> >>>  SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
> >>> -SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
> >>> +QT_GIT_PROJECT = "qt-labs"
> >>> +SRC_URI = "${QT_GIT}/qt5-everywhere-demo"
> >>>
> >>>  S = "${WORKDIR}/git/QtDemo"
> >>>
> >>> --
> >>> 2.7.4
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

