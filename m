Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ReuWx-0002e1-Gl
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Dec 2011 21:18:51 +0100
Received: by vcbf1 with SMTP id f1so7694889vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2011 12:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=f5cqlycRuEVwszo96P7DEBQVVHupI37nXM9DPBmu6UU=;
	b=m43aSlprv8Sa7h4I62IhYWwOj59w8VECDT5yDHSoahiFXWb3BlWMVFEieQLp21gvdy
	WBQ5400nzsVxPWWGnnt2NpKNgIuPXK+xBaBwttG9FdBPouWnNooIHisesF0qbBI3aHlY
	Ii10vSPQ3YSnf+ZMP0/7QU2veICsyHdZy6Ftk=
MIME-Version: 1.0
Received: by 10.52.65.129 with SMTP id x1mr12053645vds.11.1324843896803; Sun,
	25 Dec 2011 12:11:36 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Sun, 25 Dec 2011 12:11:36 -0800 (PST)
In-Reply-To: <20111223223753.GA20360@denix.org>
References: <4EF2F380.80704@celestialaudio.com>
	<20111223223753.GA20360@denix.org>
Date: Sun, 25 Dec 2011 21:11:36 +0100
Message-ID: <CACW_hTbZ=9HZNZGouQoWvLcc2WmDP4O+i+ooF98DYHWOXK79Jw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Sun, 25 Dec 2011 20:18:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/12/23 Denys Dmytriyenko <denis@denix.org>

> On Thu, Dec 22, 2011 at 01:08:16AM -0800, Jesse Lackey wrote:
> > I'm have exactly the same problem.  "git pull" says up to date.
> >
> > I'm continuing on by running "bitbake -k".  But things appear to be
> > indeed broken, by the presumably recent removal of
> > fakeroot_1.15.1.orig.tar.bz2 from the debian ftp site.
> >
> > Any assistance greatly appreciated.  I'm a total newbie with bitbake and
> OE.
> >
> > >I tried `git pull` but apparently everything is "Already up-to-date."
> Am I
> > >missing something else?
>
> Add this line to your local.conf:
>
> DEBIAN_MIRROR = "
> http://snapshot.debian.org/archive/debian/20111129T215729Z/pool"
>

Actually bumped into this today as well; I saw maintenance moved back to
1.14.6 or so.
Latest version is about 1.18.2.2.

Guess we should either move master back to 1.14.6, or maybe even move to a
newer version. or fix the url to point to the snapshot copy.

Frans

