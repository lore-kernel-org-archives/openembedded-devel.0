Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OK53h-0005kU-Ra
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 09:41:47 +0200
Received: by fxm9 with SMTP id 9so1598220fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=aUSPA5SgUiZ7OuCaB1CLSXcQB4JAMG+7q/msv1OZGYQ=;
	b=DBZSRj9dBh8ZT5GQvXCxALaB8Tu+G4esu02NRyy0e4d+q6axTxra1i1pKHByBewf5p
	V0XI1xqIZRAA+x968biIPIsHtk4R/9IXlwX3RcU9OE0/k+tABRkpOu1JkGql/5Zj4qus
	fUa589o75WoffRRHIGdVZfJXuxR6D5hrdqhH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IBg7E6KgQ04ZM09OMrM116qmM5VaYXfZ90Kw5NWHdVhXfKy31byIhA6AkyW3SSRC9n
	Gzg7SeNfAGxVQYKKbbphdK/txgI93H8z2d1nk6gkeD+O4dA3oWpYFkEaUzmg0a2122/j
	yyri6eJUoEi1kQ9+EuscTEnSCzYpiKepm3Avw=
Received: by 10.223.67.144 with SMTP id r16mr9736248fai.102.1275550649603;
	Thu, 03 Jun 2010 00:37:29 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm56203157faf.3.2010.06.03.00.37.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 00:37:29 -0700 (PDT)
Date: Thu, 3 Jun 2010 09:37:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100603073717.GK16035@jama>
References: <201006022351.38129.pieterg@gmx.com> <20100603043505.GJ16035@jama>
	<201006030915.57362.pieterg@gmx.com>
MIME-Version: 1.0
In-Reply-To: <201006030915.57362.pieterg@gmx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Thu, 03 Jun 2010 07:41:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 03, 2010 at 09:15:56AM +0200, pieterg wrote:
> On Thursday 03 June 2010 06:35:05 Martin Jansa wrote:
> > On Wed, Jun 02, 2010 at 11:51:37PM +0200, pieterg wrote:
> > > I have only a handful of (git) packages for which I need to use
> > > AUTOREV, but when I define
> > >
> > > BB_GIT_CLONE_FOR_SRCREV = "1"
> > > BB_LOCALCOUNT_OVERRIDE = ""
> > >
> > > the sideeffect is that hundreds of other packages (which I don't need)
> > > are suddenly having their repositories cloned as well, when their bb
> > > files are parsed. Even though these packages are not using AUTOREV,
> > > they have fixed SRCREV's (either in their bb files, or in my distro).
> > >
> > > This is obviously taking a long time, consuming a lot of diskspace,
> > > generating error messages for invalid git urls, and eventually bitbake
> > > will fail because it encountered 'parsing errors' because of those
> > > invalid git urls.
> >
> > If you use bitbake-1.10 it will do it just once for git revision (it
> > will cache the result of "git list-rev | wc -l" which is used by
> > BB_GIT_CLONE_FOR_SRCREV.
> 
> Probably, but I don't get that far, bitbake quits at the end, with several 
> parsing errors (problems with git repositories which I have no control 
> over, and which I don't even want anything to do with)

I'm aware of this problem and was discussed in that thread half a year
ago, pity that you didn't join the discussion back then :/. But FYI all
recipes with SRCPV builds OK here (without BB_GIT_CLONE_FOR_SRCREV but
git servers are accessible for me).

> > > I guess this is because all of these packages are using ${SRCPV} in
> > > their PV, instead of ${SRCREV} (probably in order to find the correct
> > > LOCALCOUNT for the gitrev).
> > >
> > > But argueing that people who don't use BB_GIT_CLONE_FOR_SRCREV will not
> > > get these LOCALCOUNT's in their PV anyway, and people that do use
> > > BB_GIT_CLONE_FOR_SRCREV will use SRCREV = ${AUTOREV} for the packages
> > > which they want to be automatically updated, so SRCREV would equal
> > > SRCPV, wouldn't it make sense to just use ${SRCREV} instead of ${SRCPV}
> > > in PV?
> >
> > No they won't be the same. They will have the same format
> > git${LOCALCOUNT}+${HASH} as when AUTOREV+SRCREV is used.
> 
> My point is that I don't think they have to be the same.
> There are two sorts of people, those with BB_GIT_CLONE_FOR_SRCREV, and those 
> without.
> (or in my case, this is controlled by the distro, an 'unstable', 
> or 'release').
> As long as the versioning is consistent for each group of people (or in my 
> case, each distro), I don't need the versioning to stay consistent when 
> toggling BB_GIT_CLONE_FOR_SRCREV.

What about toggling AUTOREV and fixed revision? Which is imho more
common change (ie when development gets slower and there is stable
version in git and you don't need/want it AUTOREV). That's exacly the
case when SRCPV is really handy. 

The other is when you change SRCREV in recipe without updating PV. Then
SRCPV will give you newer PV which will upgrade resulting package on
target.

Regarads,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


