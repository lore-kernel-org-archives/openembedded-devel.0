Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF78753E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 08:14:37 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id p7-v6so3113081itf.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qbxgCjWAAXa54Wno6+/GBCryoTp5LUkrGWrTOk+YkGA=;
	b=ZqsR1khtUXwJznBXyKgjS+k68jlCRi3m8yLHs57puFHSdOHQes1sZO0vcwQVvjpnHh
	PwHGVtcR/c2PGiDhd7mA5uMnC3kxTgho5dRMIflEvWs1KF0ZClFkpFWQkLYTCWakBxtW
	9UZlKsQ0WaKLf+4vNJFaTUuS+L+pClcccxKmxF+Bttd4meDnlWKZOAUrM174TMOWajmM
	71josqe6YkGRZnTE2midqFbeUX8EzJY+md5gtw6N19oH3hPwr3SC46RuNOtJUzdgWY1j
	TPDJKOXqTIplemBDjtqIE8LdCjJ3jVBZaEMP9MyvtkjZ413CFxpq2YjerkWP5WpU/EZk
	qvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qbxgCjWAAXa54Wno6+/GBCryoTp5LUkrGWrTOk+YkGA=;
	b=lcrhOHxzvxSmPKBfEs76SypXivJ7nYgmh92/RPf3KyknRxw5/jERWlqsyxWvRsvl+l
	JKmuSSZwsnM1+oDcz6lo+SWkVNWRKorZ0RDJ8hTLa1GPtYajaiJFB/NBz9QqMIc2ZAQ3
	iNUj9eN133oVJuofl/opmNmFG41kfu2oRpM00Lr+lBTUwcE12BCenDWAld2N+xlrDwEp
	vb6MUnNi8154v04CzlAn1D2FNtqOb1NYF+QbLqooI+RYYhRuBQNP20V9T+vZhgrT2fw1
	eKB5mF0QzVmnbHrhQcIIJDOC3Evt0P+c1TKFhQOMrmD5py8Ma8Hz/od7TysdxiwWcCg3
	mcAw==
X-Gm-Message-State: AOUpUlEa52UqddKqk1/9sA1y0TXiJtXn5qNBa8eDcACI+cx/Jw9IVDSD
	1MXZ/Rm/A0vGdtLJkGHcdv6sAA3c9iBDaERGjDU=
X-Google-Smtp-Source: AAOMgpdrxmLerTD8g3wPT8hOB4nV2Y1oCG/RTSBfOixM7W8fKSF9OK16enNvFHKbXfq0kkN794Kvri0jfLEruxaFFwA=
X-Received: by 2002:a24:d0cd:: with SMTP id
	m196-v6mr2248767itg.9.1533024878191; 
	Tue, 31 Jul 2018 01:14:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:c6c2:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 01:14:37
	-0700 (PDT)
In-Reply-To: <CA+chaQdvJ+HNOLoJs6Ot-xaUDgfRZp1RQ7+8mfXxtYTZKfChOQ@mail.gmail.com>
References: <1519987524-4045-1-git-send-email-mikko.gronoff@qt.io>
	<CA+chaQdsMvcCGbvZmp50eeOtuAm1LjTKwB=oQ7taMZuJn9j_tQ@mail.gmail.com>
	<CA+chaQd=R5R4u6RQcLi0B+xCPRxa-Y3K0ytKCMY5d-R=4dXACw@mail.gmail.com>
	<CABXoSoXGNM1JT6aNKGpmJtxHVnrgbXXUWGHqJGqJhxhu1-KLFQ@mail.gmail.com>
	<CA+chaQdvJ+HNOLoJs6Ot-xaUDgfRZp1RQ7+8mfXxtYTZKfChOQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 31 Jul 2018 11:14:37 +0300
Message-ID: <CABXoSoWuaUtnVPT+kQodoWrfma_f9M6Zyu8XcqN8yUQpU_4FNQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 31 Jul 2018 08:14:37 -0000
Content-Type: text/plain; charset="UTF-8"

That's true, of course.

Looking at my own download/git2/ folder I can see that some of the
code.qt.io repos have refs/changes/* in them, but not all.
None of repos in code.qt.io currently have them anymore, my guess is
that at some point in time the mirroring pushed erroneously all refs
to code.qt.io instead just heads and tags.


On 30 July 2018 at 17:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> No I wasn't using codereview.qt-project.org as QT_GIT before and even if I
> did, then bitbake fetcher wouldn't be using
> downloads/git2/code.qt.io.qt.qtbase.git directory to store it I think.
>
>
> On Mon, Jul 30, 2018 at 12:23 PM Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>>
>> Have you been using codereview.qt-project.org as the QT_GIT previously?
>> refs/changes/* are gerrit and CI specific refs and are never be
>> mirrored to github or code.qt.io
>>
>> -samuli
>>
>> On 28 July 2018 at 03:03, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > In the end it took 60 hours for qtbase, 10 hours for qtdeclarative..
>> >
>> > On Fri, Jul 27, 2018 at 9:21 AM Martin Jansa <martin.jansa@gmail.com>
>> > wrote:
>> >
>> >> One disadvantage of this is that fetching from code.qt.io seems to be
>> >> significantly slower than from github.com.
>> >>
>> >> One extreme case is just running in one of my old build dirs, where the
>> >> checkout from code.qt.io wasn't updated on premirror for quite long
>> >> time
>> >> and now the do_fetch of qtbase is already running for 43 hours..
>> >>
>> >> Most of the time it's removing various refs from gerrit reviews:
>> >> $ tail
>> >>
>> >> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> >>  x [deleted]         (none)     -> refs/changes/83/75483/6
>> >>  x [deleted]         (none)     -> refs/changes/83/75783/1
>> >>  x [deleted]         (none)     -> refs/changes/83/75783/2
>> >>  x [deleted]         (none)     -> refs/changes/83/75783/3
>> >>  x [deleted]         (none)     -> refs/changes/83/75783/4
>> >>  x [deleted]         (none)     -> refs/changes/83/75783/5
>> >>  x [deleted]         (none)     -> refs/changes/83/75783/6
>> >>  x [deleted]         (none)     -> refs/changes/83/7583/1
>> >>  x [deleted]         (none)     -> refs/changes/83/76183/1
>> >>  x [deleted]         (none)     -> refs/changes/83/76183/2
>> >>
>> >> and there is a lot of them:
>> >> $ grep -c deleted
>> >>
>> >> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> >> 81174
>> >>
>> >> $ grep -c deleted.*refs/changes
>> >>
>> >> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> >> 63253
>> >>
>> >> $ grep -c deleted.*refs/builds
>> >>
>> >> work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
>> >> 17921
>> >>
>> >> Yes it might be faster to delete the archive from premirror and do
>> >> clone
>> >> from scratch, but other developers wouldn't know what to do with local
>> >> downloads directory.
>> >>
>> >> On Fri, Mar 2, 2018 at 5:19 PM Mikko Gronoff <mikko.gronoff@qt.io>
>> >> wrote:
>> >>
>> >>> There have been issues in the past with github qt mirror being out of
>> >>> sync with code.qt.io for certain module repos. Right now there's been
>> >>> a
>> >>> several days long break in update cycle for seemingly all the qt
>> >>> modules where content has not been pushed to the github mirror. Change
>> >>> the default SRC_URI to the more reliable code.qt.io.
>> >>>
>> >>> Change-Id: Ic7d3b9a82ef0ae502e99a8516ef78ca09250fd1e
>> >>> Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
>> >>> Reviewed-by: Samuli Piippo <samuli.piippo@qt.io>
>> >>> ---
>> >>>  conf/layer.conf                              | 4 ++--
>> >>>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 3 ++-
>> >>>  2 files changed, 4 insertions(+), 3 deletions(-)
>> >>>
>> >>> diff --git a/conf/layer.conf b/conf/layer.conf
>> >>> index 7751ce2..f540710 100644
>> >>> --- a/conf/layer.conf
>> >>> +++ b/conf/layer.conf
>> >>> @@ -33,7 +33,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>> >>>
>> >>>  IMAGE_FEATURES[validitems] += "qtcreator-debug"
>> >>>
>> >>> -QT_GIT ?= "git://github.com/qt"
>> >>> -QT_LABS_GIT ?= "git://github.com/qt-labs"
>> >>> +QT_GIT_PROJECT ?= "qt"
>> >>> +QT_GIT ?= "git://code.qt.io/${QT_GIT_PROJECT}
>> >>> <http://code.qt.io/$%7BQT_GIT_PROJECT%7D>"
>> >>>  QT_GIT_PROTOCOL ?= "git"
>> >>>  QT_EDITION ?= "opensource"
>> >>> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> >>> b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> >>> index dfbe4ae..36d57f1 100644
>> >>> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> >>> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> >>> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =
>> >>> "file://qml/QtDemo/main.qml;endline=39;md5=7d80863906a4bc8ffc
>> >>>  DEPENDS = "qtdeclarative qtxmlpatterns qtgraphicaleffects qtsvg
>> >>> qtmultimedia"
>> >>>
>> >>>  SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
>> >>> -SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
>> >>> +QT_GIT_PROJECT = "qt-labs"
>> >>> +SRC_URI = "${QT_GIT}/qt5-everywhere-demo"
>> >>>
>> >>>  S = "${WORKDIR}/git/QtDemo"
>> >>>
>> >>> --
>> >>> 2.7.4
>> >>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>
>> >>
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

