Return-Path: <coldnew.tw@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id D336860167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 13:41:16 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id 10so11217662lbg.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 05:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=X206RDO97isfC11dmTG9waMdbVjbEQP7KrmURArvdLQ=;
	b=O2Q2L++ce/gCNKs4HEB5hT2frKMp/Q+1vwdiomAwpPhHIxqDuh9FVNwnWOBm7Yi6wJ
	KEswfyPoLXaoR0lZAlIJ19vck6z8lYnJSEsvOoFQcim3YideFig32ljUJqUlUU4VaOeA
	mPz9bEMk00dskYohMSvGitUD+yvIYDmfjIpeF6Q7TPanT5MbrHrHF0IMRSzwKLBwBONV
	7dsgUID6ciNVGfOp9nJ7edZAVUXEy9m52MK4LQ2k+jc3hRcJhmRLcv85p3wvOzA80JU3
	8vYhrwcO9CV/bVzmUZYKCqMUoy/A4bDbXQNtJk44MvDiy0J/CMZMrAnaSkHpQ2nO379A
	DRmg==
MIME-Version: 1.0
X-Received: by 10.152.20.72 with SMTP id l8mr2519554lae.43.1415886076276; Thu,
	13 Nov 2014 05:41:16 -0800 (PST)
Received: by 10.25.6.202 with HTTP; Thu, 13 Nov 2014 05:41:16 -0800 (PST)
In-Reply-To: <CAFQ+DigkXjS0GLxi6Mk+C9VYUYsjx44QaiP4zrUR8xQ1oUM5CQ@mail.gmail.com>
References: <CAFQ+Digyv4Ks8iQOdcPGOKJsRYW1woW0RsC0YXwzNi6YL+=fVg@mail.gmail.com>
	<CAFQ+DigkXjS0GLxi6Mk+C9VYUYsjx44QaiP4zrUR8xQ1oUM5CQ@mail.gmail.com>
Date: Thu, 13 Nov 2014 21:41:16 +0800
Message-ID: <CAF6djU_J9zY_7dPTSnyV4Sq+0+fxy8fhB6XJ3GCg1X79mQWMyQ@mail.gmail.com>
From: =?UTF-8?B?5b2l55G+?= <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][daisy][BUG]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 13:41:17 -0000
Content-Type: text/plain; charset=UTF-8

As I remember, meta-qt5's QtMultimedia add a patch to make work on
gstreamer1.0 by default.

You can disable it by setting the PACKAGECONFIG in your bbappend. (please
look through qtmultimedia_xxx.bb)

If you use default setup, you need to install gstreamer1.0.

2014-11-13 19:47 GMT+08:00 Marco Cavallini <cavallini.koan@gmail.com>:

> Sorry there's a typo
> I mean 'DAISY'
>
> 2014-11-13 12:45 GMT+01:00 Marco Cavallini <cavallini.koan@gmail.com>:
> > Hello,
> > I am using meta-qt5 dora.
> > Everything looks ok except the multimedia extensions.
> > I found a note about a bug in Qt5.2.1
> >
> > Bug info:
> > console logs for any application trying to use audio features in
> qt5-multimedia:
> > defaultServiceProvider::requestService(): no service found for -
> > "org.qt-project.qt.mediaplayer"
> > Player error: The QMediaPlayer object does not have a valid service
> >
> > Link:
> > https://bugs.archlinux.org/task/40068
> >
> > Description:
> > It appears that libgstmediaplayer.so was accidently left out of the
> > release for 5.2.1-3.
> > his breaks any QT5 application that uses audio files.
> > See https://bbs.archlinux.org/viewtopic.php?pid=1408020#p1408020
> >
> > Anybody knows what is the required patch?
> >
> > TIA
> > --
> > Marco Cavallini
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

