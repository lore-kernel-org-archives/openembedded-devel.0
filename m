Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nzkwv-0003yr-Mm
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 08:10:46 +0200
Received: by fg-out-1718.google.com with SMTP id 19so692584fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0XsRtnd4EAeFajGXNBge2jZDugb51MzK08F+aMKepqs=;
	b=wDGWyjHfcTyWk5Cj4OvTa6LS9nyROqinybw0W6n/1SOTjN4QrZ0DmKsCupDsMMnKTI
	HE0hkegapea7qwfeZFg6II957gtnQinDEkeLNbKEdGOCQ1g1MiEskk1jIzr4no/T30iI
	ZNl2y11tEobQg5f/VYfXHqUF1Ya1w8P8eV0KQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lX/Uyh6m0kCR0NC7Ll9aUANu5T8+sA/EnfeZP+VO2Va2pvqFtnSP/8o2sICBhYUmkv
	b7cmAqNhqUjt0Nn00+DWRj5yffxVbb7vsctMiF4i8mxJOLSSeY/AjyZJFcuIrWG/ZpCf
	NRsZMTH+6eB1/u1LKZdNrfCvN27pI1vQR4rFk=
Received: by 10.87.1.12 with SMTP id d12mr444625fgi.78.1270706845180;
	Wed, 07 Apr 2010 23:07:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm10088759fxm.0.2010.04.07.23.07.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Apr 2010 23:07:24 -0700 (PDT)
Date: Thu, 8 Apr 2010 08:07:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408060727.GB3269@jama>
References: <4BBB3C39.5070002@mwester.net>
	<q2mb6ebd0a51004060826wb048ffa2ge1fbcfb1892a9bac@mail.gmail.com>
	<4BBD4860.8070306@mwester.net> <20100408041801.GA3269@jama>
	<4BBD6763.9060409@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4BBD6763.9060409@mwester.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRCREV defined too late -how to fix?
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
X-List-Received-Date: Thu, 08 Apr 2010 06:10:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2010 at 12:19:31AM -0500, Mike Westerhof wrote:
> This is the exact line from
> openembedded/conf/distro/include/preferred-slugos-versions.inc, actually.

Ah sorry, that I missed that (grep for SRCREV_pn).

> It doesn't matter if I remove the similar line from my local.conf; it
> still fails because SRCREV is not defined when the line is evaluated.
> Any user building any IXP4xx kernel in OE will be greeted with the
> aforementioned messages, even if they have an empty local.conf.

I don't think so, the only problem is when you have to define
PREFERRED_VERSION_linux-ixp4xx (without SRCREV-pn-linux-ixp4xx
definition).

To be honest SRCREV in linux-ixp4xx.inc is really strange, I put it
there as it's as close to previous state as possible (same SRCREV is
share between all versions of linux-ixp4xx recipe). I would expect
different SRCREV of patchset for different module=${KERNEL_RELEASE} (I
think it's harder to test all KERNEL_RELEASEs when you need to bump
patchset SRCREV for latest RELEASE or unnecesarry kernel upgrades for
users of older KERNEL_RELEASE when someone bumped patches only to get
more patches for latest RELEASE without any change in their old version.

> > Have you tried
> > 
> > SRCREV_pn-linux-ixp4xx = "4833"
> > PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV_pn-linux-ixp4xx}"
> > 
> > in your local.conf?
> 
> So basically, you are suggesting that we leave the SRCREV in the
> package, but I should define it along with the preferred kernel in one
> of the SlugOS distro config files -- in other words, it's reverting your
> changes specifically for SlugOS and the ixp4xx kernel.

I really don't mind moving SRCREV_pn-linux-ixp4xx to SlugOS config if
it's easier for you. Or you can as well increase DEFAULT_PREFERENCE in
that 2.6.27.8 recipe for slugos or all and drop
PREFERRED_VERSION_linux-ixp4xx from config.

> I'm fine with that; I like the old behavior far better than the
> (mis)behavior I observe with the new model.  I'll try that and if it
> works, I can commit that change.
> 
> >>>> That's not really a "recent" kernel, of course -- my local.conf file has a
> >>>> more recent one that I've not yet committed.  The point is that the way it
> >>>> *USED* to work, one could use the normal means to set both PREFERRED_VERSION
> >>>> and SRCREV.  With the recent commit, we can't do that anymore.
> >>>>
> >>>> Apparently SRCREV isn't defined soon enough with this new structure, so we
> >>>> get the messages about svnr1 not being available.  And, of course, one
> >>>> cannot override the preferred version anymore due to the use of "=" instead
> >>>> of "=?" for the assignment.  (At the very least, when all the SRCREVs were
> >>>> moved into the recipes, shouldn't the weak assignments have been preserved?)
> > 
> > Yes you can override it with _pn-something in local.conf (as ie
> > fso-autorev.conf, shr-autorev.conf), SRCREV_pn-abc = "123" is preferred
> > over SRCREV = "12" in abc_svn.bb. Doesn't matter if there was weak or
> > normal assignment in recipe.
> > 
> > The point for not-weak assignement is because some time ago, RP said,
> > that would be better to define SRCREV = None ie in bitbake.conf to get
> > better error message than those "svnr1". Using weak SRCREV in recipes
> > wouldn't be possible.
> > 
> >>>> At any rate, I wish to remove the bogus messages about svnr1, and I want to
> >>>> restore the behavior that would allow me to provide the SRCREV in my
> >>>> local.conf.  What is the correct way to do this with the new "world order"
> >>>> as it relates to SRCREVs?   To what config file do I move that
> >>>> SRCREV="1089"?  Who would I anger if I just put it back to the way it was?
> > 
> > Please try solution suggested above first.
> 
> But if understand your proposed solution, it is just putting it back to
> the way it was for SlugOS.  (It'll still be broken for Angstrom and
> other distros that build IXP4xx kernels, though).

I don't see PREFERRED_VERSION_linux-ixp4xx in Angstrom configs so I
think that only those who has PREFERRED_VERSION_linux-ixp4xx in
local.conf needs to define preferred SRCREV there as well.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


