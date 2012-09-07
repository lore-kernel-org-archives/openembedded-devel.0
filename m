Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1T9xy7-0005tE-0f
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 14:47:31 +0200
Received: by pbcwy7 with SMTP id wy7so4313367pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2012 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vJCFSkNP26Je4qwqlLGZTckJlWVPM2NTRAA67teeUDo=;
	b=MuS5OBNN0sWUxiOwuYwfwH06iSBHEisjjrXiJGNz/jV+mu613DzPhKLl0XyDo9eZYb
	5PcjCZi9VBcaRPxWgNi4VyJCR8Uzvbswng0Gz6Gz9kIw8rOdi5gCPm0qY2I9W/bIXPiY
	BFRgt9uHMLz3JGflfLHbavDrGoZ0ZQjSKizcF3+e9zHk4TbCTWn01z5o5LZ5duwBozGe
	88KdcFGW0aWUqPIe8pjnQYxDl5qJpXDFxxxh/U7k9vvo6UvdSF3c7tU6u/Msx0ASIp//
	mLqxD8tp03CIwhq3l09svpJMG0cGKWqyKqveAkWmE9rieSLapa4XGeOpbIfjLXYiqVoP
	V01A==
MIME-Version: 1.0
Received: by 10.68.218.166 with SMTP id ph6mr9657732pbc.132.1347021304740;
	Fri, 07 Sep 2012 05:35:04 -0700 (PDT)
Received: by 10.68.14.201 with HTTP; Fri, 7 Sep 2012 05:35:04 -0700 (PDT)
In-Reply-To: <96FA1660-A208-41E4-806A-B0C80C9D1D11@gmail.com>
References: <CACW_hTYFeqSYx5R9rgf9vV0GG-iTcnjKx+czrVXX=rUTx2z_xw@mail.gmail.com>
	<96FA1660-A208-41E4-806A-B0C80C9D1D11@gmail.com>
Date: Fri, 7 Sep 2012 14:35:04 +0200
Message-ID: <CACW_hTa-2VzonFFthdE279_kYPz9mz7P3=f+ZBmT1HPBufXeow@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: oe classic: eglibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 12:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/9/7 Khem Raj <raj.khem@gmail.com>

>
>
> -Khem
>
> On Sep 7, 2012, at 4:27 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
> > Not sure if anyone is still interested in oe classic, but while
> rebuilding
> > some sw using oe classic I noticed the eglibc recipes did not build any
> > more as upstream changed things in the repo.
>
> Probably your IT blocked Svn
>

Hm. This used to work.
I figured eglibc changed things (see also the addition of /svn after
www.eglibc.org

dived a little bit deeper into it.
oldest oe-core version I could find is
http://cgit.openembedded.org/openembedded-core/diff/meta/recipes-core/eglibc/eglibc_2.12.bb?id=29d6678fd546377459ef75cf54abeef5b969b5cf
this one is from aug 2010.
it  already uses proto=http:

The latest classic version is
http://cgit.openembedded.org/openembedded/tree/recipes/eglibc/eglibc_2.12.bb
this one is form may 2010 and uses proto=svn:

no idea why/how this is changed.
anyway the proto=http works for me so if someone encounters this problem
maybe google will present this solution/alternative.

Best regards, Frans


>
> > I've locally fixed this by changing SRC_URI from
> > SRC_URI = "svn://
> svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
> > into
> > SRC_URI = "svn://
> > www.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \
> >
> > builds and tests fine. If anyone is tempted, feel free to author a patch.
> >
> > Frans
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://l.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

