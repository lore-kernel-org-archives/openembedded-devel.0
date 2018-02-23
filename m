Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2399778815
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 06:54:31 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id w63so1908197ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 22:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nMQC6iMjx/3RBF2/7zKP+OmFALcS2QjfA+dJw5PZl+0=;
	b=pDrX+XuyAcel4hpEW+vHrXEQMOOJtgOgWZ0HPa5G3bOSF/W++NpSfRh+wxpNS8H8xu
	8JSqc2aZClsbfWTXJYGeVTBT9FKBzuH4t1bTqNpcbKaT3mG/Efv9kLM5MsLx/FhWvzSJ
	9A9dW38JNbxeo5jG3SiJmVDK0WqviKTkWMVIFJFjm57ZyYONoiyV+gsyAhYF/V/nr+/n
	yNK50H7ykp5My7siwNpupdnyYwDgZQjm2adMjw0zepjXs54t44yVCziLjJHGijE+IMWC
	1M8Sq1ZqfYU4JG1/DUt5Vw+vkHkrPNe15W1YQV7vz15Hh5M7ngrSa2rT7y4o0PqIZUFx
	h/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nMQC6iMjx/3RBF2/7zKP+OmFALcS2QjfA+dJw5PZl+0=;
	b=eNof0XwKVryIGbTRHoNQXb+Y2Xh3cu3LTdYlsidwt94Rm4C6t1V74SOx72YVCRfxM0
	OLT1SwOHQUoThMSlFsLgnG4jskvy4rOn+oJplcTEtRAqrtnxHzuSaZI2lYJL6jzrpbl2
	vyKOB63O0Sm24thrfI1FbPOzFeFlwAQX01qXHNeCIiz4y2vdsELqgFDH/XzCoCvTkN+2
	Rr5uV0Bh4Asr5JxfVvDomfxN+scGc49UAbfLFQ8WgxxlRtfgMGS+nxeJqr0+4x05az9G
	6c1PYplCRdEwy426PyFFztBztBvzzgyf6rHqiweLlyQwzibtoOwExqaExAdG7VW1U7G2
	1xwg==
X-Gm-Message-State: APf1xPAYvnvoOJcRQgLmLwVGh8/PViIVM73/Q/z3fQNiVZvRNbAwDgil
	olFL1eF2TBHeIqQmTil0QCvFOPPpMgUA8exduGY=
X-Google-Smtp-Source: AH8x226tNgKQsmC2X4udIHBhyiTvD+s3/An47/BO1peOl1F9PbTtVC/dNHv/BIiE5qRZjn1tHkG4QI8EMoYAyXXzdAk=
X-Received: by 10.36.163.193 with SMTP id p184mr1289731ite.9.1519368873261;
	Thu, 22 Feb 2018 22:54:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.166.68 with HTTP; Thu, 22 Feb 2018 22:54:32 -0800 (PST)
In-Reply-To: <CA+chaQfhzr_yoorzLy8RJ_tRH16yby=G4hgPWUTuf3r=zO+K1w@mail.gmail.com>
References: <20180222170221.1887-1-Martin.Jansa@gmail.com>
	<CABXoSoWp7E1DdcreEo1o0E9U_Hv5B15dzsSagFJTYQHH7XzvmQ@mail.gmail.com>
	<CA+chaQfhzr_yoorzLy8RJ_tRH16yby=G4hgPWUTuf3r=zO+K1w@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 23 Feb 2018 08:54:32 +0200
Message-ID: <CABXoSoUZMv+HBRn0MpJhqTQo2=xsauQzBFH_+F-FC_Tdv17EiA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 23 Feb 2018 06:54:32 -0000
Content-Type: text/plain; charset="UTF-8"

What I don't understand is that why are we checking if SRCREV is found
from the branch.
Full git repo is always fetched and if the SHA1 is valid, it will be
found, regardless of from which branch it is accessible at the time.

On 22 February 2018 at 19:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why do they disappear? Or why aren't they included in 5.x branches at the
> time of the release so that we can use just 5.x without the SRCREVs being
> only on 5.x.x branches?
>
> On Thu, Feb 22, 2018 at 6:27 PM, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>>
>> Note that the Qt release branches (5.x.x) will usually disappear right
>> after the release, which will break the build without nobranch=1
>>
>> On 22 February 2018 at 19:02, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > * sneaked in with:
>> >   commit 333949a8239dfa7788b35f1059614733e11a6a25
>> >   Author: Samuli Piippo <samuli.piippo@qt.io>
>> >   Date:   Thu Jan 26 16:54:50 2017 +0200
>> >
>> >     Upgrade to Qt 5.8
>> > * use 5.10.1 branch by defaut and fix QT_MODULE_BRANCH
>> >   in qtknx, qtmqtt, qtwebkit-examples, qtwebkit which don't
>> >   have 5.10.1 branch at all
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  recipes-qt/qt5/qt5-git.inc              | 6 +++---
>> >  recipes-qt/qt5/qtknx_git.bb             | 2 ++
>> >  recipes-qt/qt5/qtmqtt_git.bb            | 2 ++
>> >  recipes-qt/qt5/qtwebkit-examples_git.bb | 2 ++
>> >  recipes-qt/qt5/qtwebkit_git.bb          | 2 ++
>> >  5 files changed, 11 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>> > index 7ee0643..beba913 100644
>> > --- a/recipes-qt/qt5/qt5-git.inc
>> > +++ b/recipes-qt/qt5/qt5-git.inc
>> > @@ -1,9 +1,9 @@
>> >  # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
>> > -# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
>> > +# Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
>> >
>> >  QT_MODULE ?= "${BPN}"
>> > -QT_MODULE_BRANCH ?= "5.10"
>> > -QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
>> > +QT_MODULE_BRANCH ?= "5.10.1"
>> > +QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
>> >
>> >  # each module needs to define valid SRCREV
>> >  SRC_URI = " \
>> > diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
>> > index 5e01e3c..fa981ab 100644
>> > --- a/recipes-qt/qt5/qtknx_git.bb
>> > +++ b/recipes-qt/qt5/qtknx_git.bb
>> > @@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
>> >
>> >  DEPENDS += "qtbase"
>> >
>> > +QT_MODULE_BRANCH = "5.10"
>> > +
>> >  SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
>> > diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
>> > index b705f7c..90c255d 100644
>> > --- a/recipes-qt/qt5/qtmqtt_git.bb
>> > +++ b/recipes-qt/qt5/qtmqtt_git.bb
>> > @@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
>> >
>> >  DEPENDS += "qtbase"
>> >
>> > +QT_MODULE_BRANCH = "5.10"
>> > +
>> >  SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
>> > diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb
>> > b/recipes-qt/qt5/qtwebkit-examples_git.bb
>> > index 3e3e4a0..114fab7 100644
>> > --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
>> > +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
>> > @@ -17,4 +17,6 @@ DEPENDS += "qtwebkit qtxmlpatterns"
>> >  RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
>> >  RDEPENDS_${PN}-examples +=
>> > "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates',
>> > '', d)}"
>> >
>> > +QT_MODULE_BRANCH = "5.9"
>> > +
>> >  SRCREV = "a24c780b60d7d8bc00c4a48042cf7f32db777d55"
>> > diff --git a/recipes-qt/qt5/qtwebkit_git.bb
>> > b/recipes-qt/qt5/qtwebkit_git.bb
>> > index 5dee6a4..b23d4d6 100644
>> > --- a/recipes-qt/qt5/qtwebkit_git.bb
>> > +++ b/recipes-qt/qt5/qtwebkit_git.bb
>> > @@ -87,4 +87,6 @@ PACKAGES_remove = "${PN}-examples-dev
>> > ${PN}-examples-staticdev ${PN}-examples-db
>> >  RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586',
>> > 'i386').replace('i686', 'i386') }"
>> >  export
>> > RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
>> >
>> > +QT_MODULE_BRANCH = "5.9"
>> > +
>> >  SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
>> > --
>> > 2.15.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

