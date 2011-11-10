Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ROPzp-0000T3-Kz
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 09:28:29 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Thu, 10 Nov 2011 09:22:13 +0100
Date: Thu, 10 Nov 2011 09:22:12 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111110082212.GD3933@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1320866629-22073-1-git-send-email-Martin.Jansa@gmail.com>
	<20111110074449.GB3933@ad.chargestorm.se>
	<20111110075607.GH21022@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111110075607.GH21022@jama.jama.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH][meta-oe] systemd: add postrm u-a calls
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
X-List-Received-Date: Thu, 10 Nov 2011 08:28:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [111110 08:57]:
> On Thu, Nov 10, 2011 at 08:44:49AM +0100, Anders Darander wrote:
> > * Martin Jansa <martin.jansa@gmail.com> [111109 20:25]:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-core/systemd/systemd_git.bb |   11 +++++++++--
> > >  1 files changed, 9 insertions(+), 2 deletions(-)

> > > diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
> > > index 90862a3..d1d4306 100644
> > > --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> > > +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> > > @@ -14,7 +14,7 @@ inherit gitpkgv
> > >  # TODO:
> > >  # u-a for runlevel and telinit
> > > -# u-a prerm

> > Here on your todo list, it stated u-a for prerm, but you applied it to
> > the postrm. In this case, it probably doesn't really matter, but I'd
> > still guess that it would make more sense to remove the u-a before
> > removing the binaries. Although, I don't think it'll actually cause any
> > problems in this case.

> I did what u-a.bbclass usually do.. if you think it should be in prerm
> then it would be best to first fix in u-a.bbclass and then we can update
> the rest of metadata.

Yeah, like I said, is't likely not a real problem. There'll probably
just be a tiny window during which, in this case, e.g. reboot isn't
available, before u-a has been told to change the reboot link.

I'm currently just a little bit catious as I've recently stumbled upon
post-/prerm issues using rpm... (Although the ones I know of (busybox
updates, rsyslog removal) are either fixed or there has been patches
submitted).

I'll see if I ever get the time to look into it.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


