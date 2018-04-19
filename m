Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C99560107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:50:00 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id q13-v6so12781997wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f91AZlBcQGQu3xF0LEbekI+sjATl4v5SG4/H2JdeqyY=;
	b=Elgbl93wB3xsf12fDDw5bXVH8Yle8XhMQRjqcT4vz6iI9thDh8cSy1Xfa+qKOiUzYd
	D0hE3YblcsSB0FRDgHg9L6y7ga8qAyt5YvhK3Wx6vmbcxKq4heKx7zU6ukyGmIcOHt4V
	3mOW9voAdt9DMawoFIT987yQLYdKXev46GvPPJr3F7fYZ7rG/dS4DgXinOdMusQr58Dj
	LBr3+FHQoizS6cBtPf0UYvAqHzFHlbdhSn9EKoH59YGlowL5b+6R5k00IIMjrrDjZkJF
	+xYjrn/xf6J+fNLXlrkw1FsSsMclbOAjaZY0xLDBsgy4LyHQqmswZr1/QEN/QuclivfN
	X2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f91AZlBcQGQu3xF0LEbekI+sjATl4v5SG4/H2JdeqyY=;
	b=LioDtcafhv0U+1fjNj86WCJ/FZK5W2FCrip/4DLsNmDOc/qauUTe0q4572iF7wwcFD
	sFLwUrWv5oy+nZGfKTX/VZ9/3E3jYUNeEVQ7jKJdazJy/+ukRLoX2aqKcvK9G/J6/J3E
	Zk9rmi980Yo0mw5gA/SS5vnZu3TCbIArHiCsEmqeriIMFpiU7DwKkgt+/rJvAgOkRbxs
	Y/HhRwfIZ0uZEWlTD6LkHbNHw57fPZeZsbHNdom3TirPw8Eho40EhF/9ebEA+tyWLA/p
	O1R0SHUQ5WueyPls4U1EOm6POXwYb6qp/mUD4hHssWQ7vZeV8HIlvyBZL4HgB8Hc8Oc8
	ZTBQ==
X-Gm-Message-State: ALQs6tD0TTCcd3AGZtwqY3m7mHDa7ml5zWjEMuL5RAQXwT7wldJR8CVy
	fczzn2aQHhVxuiKu3SFtKATcePCPXCH5GQPXG7k=
X-Google-Smtp-Source: AIpwx4/px5jWja8uHXx8tJR8cdk82ZYkin9oXf4ke084j2KB7943wcDe+O74q6ch8eA2mHvkK1uuCPG3naLAU8Acjps=
X-Received: by 2002:adf:9546:: with SMTP id
	64-v6mr4327109wrs.223.1524135000820; 
	Thu, 19 Apr 2018 03:50:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Thu, 19 Apr 2018 03:49:59 -0700 (PDT)
In-Reply-To: <CABXoSoUT2EOb1Wzr4CofVBTGwuwAqPwpvKHqajQ97S0+pjUChg@mail.gmail.com>
References: <20180418100454.3171-1-samuli.piippo@qt.io>
	<CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
	<CABXoSoX1_kbuDQX4UPHfcU7wEJTHvPxbLkD_kBkgXOoasjVLNg@mail.gmail.com>
	<CA+chaQdBh6hBdcVcK6EpSb9A+jyvWZJxEAwTj_vXJx76gMsL0Q@mail.gmail.com>
	<CABXoSoUT2EOb1Wzr4CofVBTGwuwAqPwpvKHqajQ97S0+pjUChg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Apr 2018 12:49:59 +0200
Message-ID: <CA+chaQf2-+XFBHtF5cx5_mCxjMj_EFqKDSSSFnuGfUkX_ArzSA@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][rocko][PATCH] qtbase: use mysql_config from correct path
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
X-List-Received-Date: Thu, 19 Apr 2018 10:50:00 -0000
Content-Type: text/plain; charset="UTF-8"

How does RSS influence this? I think you're still talking about HOSTTOOLS
not RSS.

On Thu, Apr 19, 2018 at 12:09 PM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> Works with master as well; this is really needed with morty and older
> OE releases, where recipe-sysroot is not used.
> I was using different branches myself, hence the mix up.
>
> On 19 April 2018 at 09:01, Martin Jansa <martin.jansa@gmail.com> wrote:
> > RSS is used since pyro release, but you probably meant HOSTTOOLS which
> are
> > used since rocko, but then it wouldn't be needed in rocko, only in older.
> >
> > Please test it with master, if it works there I'll apply it to all
> branches,
> > because people tend to use different branch of meta-qt5 with different OE
> > releases.
> >
> > On Thu, Apr 19, 2018 at 7:46 AM, Samuli Piippo <samuli.piippo@gmail.com>
> > wrote:
> >>
> >> only needed on rocko and older. With recipe-sysroot it works correctly.
> >>
> >> On 19 April 2018 at 08:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > Is it needed in sumo and master branches as well? If yes, then it
> should
> >> > be
> >> > applied there first.
> >> >
> >> > On Wed, Apr 18, 2018 at 12:04 PM, Samuli Piippo <samuli.piippo@qt.io>
> >> > wrote:
> >> >
> >> >> mysql_config from host sysroot is found first which gives wrong paths
> >> >> for cross-compilation. Use it from crosscompile path instead.
> >> >>
> >> >> Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
> >> >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> >> >> ---
> >> >>  recipes-qt/qt5/qtbase_git.bb | 2 +-
> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/recipes-qt/qt5/qtbase_git.bb
> >> >> b/recipes-qt/qt5/qtbase_git.bb
> >> >> index 0e3a8ac..db6280f 100644
> >> >> --- a/recipes-qt/qt5/qtbase_git.bb
> >> >> +++ b/recipes-qt/qt5/qtbase_git.bb
> >> >> @@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
> >> >>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
> >> >>  PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb
> >> >> xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
> >> >>  PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
> >> >> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
> >> >> +PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config
> >> >> ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
> >> >>  PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
> >> >>  PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
> >> >>  PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
> >> >> --
> >> >> 2.17.0
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >>
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>

