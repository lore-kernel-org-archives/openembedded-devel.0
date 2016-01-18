Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id F1D1A731A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 19:03:27 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id t15so61729307igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1OBb0YgLoDwhFR+NZ5aaeNSgfMFzcD2H9cnK8QrXSB8=;
	b=jEyY2J98OcMJojprgx0TH5aAjxI9qB49aDVwvhi5afUJYkJq3gQFznY3Jgmi+lLFBO
	BfIpGiX+m9BRsUQ5LxNhYCfXkqGXePLm4ba2BUSo+AABywgbcA50R785zCVPKlvqI/AZ
	xSdC95zJE2whu/HIJVhORHQXLLa3mzn6CW6576z6vX5+zrFLJuNVia2qvchncb/9jzST
	GtB8GsxQ3XxSnHQkybwjvRC+7uebNZMLc3AEM3OtnoiOuLOqb4TveJxztEdSt3C9h0h8
	IEwI98tdjriwc9LtEN245+4OZB7ERo9gqt68Vq/yQhfW3hoBDPJvLLmwEhjIwqPwoUfC
	mLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1OBb0YgLoDwhFR+NZ5aaeNSgfMFzcD2H9cnK8QrXSB8=;
	b=Ak+5sFjqVjnqJyaSP7qAt9rxNP6r3o6t3naU/j2uahp3V8+89DBv87xpMgixI1jsMW
	Jwci6HO5vBUc96Xxj7Kyc2McEfMgTJBtSwArqbE9us962Djan5dSQzZf54znNop3IIag
	+uCk9MLgB59bpJouH1QY3D1DWKa6I2cqBJnR1NAGozV+USNNKtSfpIvV+ymKoaZ/DdAu
	zQ2dcZlguj/k5PLshLkupVKOPjcvLYNAZEfnbFPd9mzRxpQ9LW/tZ8jFOTdxdYYi0HPx
	nP+7/tePLYwniv9TSDkrS7Gzv8yCMPY2vXp5YjXAQCa0D700xtyMjqtTTJYVA+U4y+EJ
	PecQ==
X-Gm-Message-State: AG10YOSCKiZEmFB0EX7bJu2zXEESLBG2vL2YoZApGb4tv527E9SdFZd00CerdetgNEVi/VmxOwx6P3OSJ1nEog==
MIME-Version: 1.0
X-Received: by 10.50.134.129 with SMTP id pk1mr12274774igb.11.1453143808569;
	Mon, 18 Jan 2016 11:03:28 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 18 Jan 2016 11:03:27 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 18 Jan 2016 11:03:27 -0800 (PST)
In-Reply-To: <20160118115733.GA2614@jama>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<20160104175200.GA5744@jama> <569CB4A5.1040602@windriver.com>
	<20160118115733.GA2614@jama>
Date: Mon, 18 Jan 2016 11:03:27 -0800
Message-ID: <CAMKF1sreE8wkS7xDXgq7LgysAqQ+a899-OXW6zqU62QFBzv+Rw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Mon, 18 Jan 2016 19:03:32 -0000
Content-Type: text/plain; charset=UTF-8

On Jan 18, 2016 3:56 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
> On Mon, Jan 18, 2016 at 05:47:17PM +0800, Robert Yang wrote:
> >
> >
> > On 01/05/2016 01:52 AM, Martin Jansa wrote:
> > > On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
> > >> When the host distro uses gold mariadb-native fails to build.
> > >>
> > >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > >> ---
> > >>   meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
> > >>   1 file changed, 3 insertions(+)
> > >>
> > >> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
b/meta-oe/recipes-support/mysql/mariadb.inc
> > >> index a6826c3..6a55476 100644
> > >> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> > >> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> > >> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
> > >>   # https://mariadb.atlassian.net/browse/MDEV-5982
> > >>   TARGET_CFLAGS += "-fuse-ld=bfd"
> > >>
> > >> +BUILD_CFLAGS += "-fuse-ld=bfd"
> > >> +BUILD_CXXFLAGS += "-fuse-ld=bfd"
> > >
> > > Unfortunately this breaks builds on older hosts with older gcc
> > >
> > > |   cc1: error: unrecognized command line option '-fuse-ld=bfd'
> > > http://errors.yoctoproject.org/Errors/Details/25859/
> > >
> > > Should we consider Ubuntu-12.04 insanely old?
> >
> > This patch has been merged, so we don't support Ubuntu 12.04 any more?
>
> Correct, I don't want to push back incompatible changes anymore, so I've
> upgraded my jenkins slaves and merge this change.

This is fine it would avoid support question if you could add this info to
README
>
> >
> > // Robert
> >
> > >
> > >> +
> > >>   EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
> > >>                    -DWITH_JEMALLOC=no \
> > >>                    -DWITHOUT_TOKUDB=TRUE \
> > >> --
> > >> 2.0.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

