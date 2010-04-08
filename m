Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NzjF5-0005ME-IP
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 06:21:24 +0200
Received: by fxm20 with SMTP id 20so1598576fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 21:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=52Z5QlnGEJQ/OKYiLcCqkLcN68h4MrcX0VhlCzv5mjY=;
	b=C7E55lmfjGPMlhcOsVblvPxuwhz0FE02e3I3rBYeiGhXQ7gwK5Ni+4p+n7omiUZXBv
	sWfW/LZPg0PI3uptFqzzReLVol+9q+aE1OgPZyEJ/o9lAZfOGBLjj1fQrZ1QzrFkPX07
	P3+hziJVWywCM9rLyIo6pjeBQZSDf/lum7LKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=p0oXqO7vsIt/97ppE61iE22rN4nBmxF49xj0IVEz8/fdTiGkufc4LcwV2XNZn5aNij
	JbsdtdMCJpGmD9YOFBn4hesvkO9GGFYKrJzx7EIx2ka89dtdhP3dWiK6YhoiqcJ+Gixp
	lhMIF5qI5qHKHb9FU8OE2bc15O2LgnC8eL07Q=
Received: by 10.223.45.83 with SMTP id d19mr3089147faf.65.1270700280835;
	Wed, 07 Apr 2010 21:18:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm9985414fxm.1.2010.04.07.21.17.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Apr 2010 21:18:00 -0700 (PDT)
Date: Thu, 8 Apr 2010 06:18:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408041801.GA3269@jama>
References: <4BBB3C39.5070002@mwester.net>
	<q2mb6ebd0a51004060826wb048ffa2ge1fbcfb1892a9bac@mail.gmail.com>
	<4BBD4860.8070306@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4BBD4860.8070306@mwester.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
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
X-List-Received-Date: Thu, 08 Apr 2010 04:21:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 07, 2010 at 10:07:12PM -0500, Mike Westerhof wrote:
> Chris Larson wrote:
> > On Tue, Apr 6, 2010 at 6:50 AM, Mike Westerhof <mike@mwester.net> wrote:
> > 
> >> After a recent commit that rearranged where (and how) SRCREVs are defined,
> >> building results in:
> >>
> >> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
> >> item kernel)
> >> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
> >> item kernel-module-ext2)
> >> NOTE: preferred version 2.6.27.8+svnr1 of linux-ixp4xx not available (for
> >> item kernel-module-jbd)
> >> (etc.)
> >>
> >> Note the bogus "svnr1" on the end -- I think this has happened because
> >> someone changed OE to define SRCREVs in each package.  So now, deep in
> >> recipes/linux/linux-ixp4xx.inc, we find:

Hi, that was me, sorry for inconvenience, but we should be able to
resolve it..

> >> SRCREV = "1089"
> >>
> >> I think that's wrong.
> >>
> >> It *does* (sort of) work -- it actually results in that SRCREV (1089) being
> >> built, despite the messages (above) telling you that it can't find the
> >> PREFERRED_VERSION with SRCREV == 1.
> >>
> >> But what that line does is not really what we (the ixp4xx kernel
> >> maintainers) had in mind.
> >>
> >> The idea is that the SRCREV, along with the kernel version, would be
> >> defined as a preferred version, like this line which is in
> >> machine/include/ixp4xx.inc:
> >>
> >> PREFERRED_VERSION_linux-ixp4xx ?= "2.6.24.7+svnr${SRCREV}"
> >>
> >> Of course, SlugOS overrides that because that distro prefers a more recent
> >> kerrnel:
> >>
> >> PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV}"

This is exact line from your local.conf? Where did you define that newer
SRCREV for this PV?. I've grepped whole tree for
defined SRCREV_pn-something and changed that (see OPKG_SRCREV also
defined in SlugOS conf).

Have you tried

SRCREV_pn-linux-ixp4xx = "4833"
PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV_pn-linux-ixp4xx}"

in your local.conf?

> >> That's not really a "recent" kernel, of course -- my local.conf file has a
> >> more recent one that I've not yet committed.  The point is that the way it
> >> *USED* to work, one could use the normal means to set both PREFERRED_VERSION
> >> and SRCREV.  With the recent commit, we can't do that anymore.
> >>
> >> Apparently SRCREV isn't defined soon enough with this new structure, so we
> >> get the messages about svnr1 not being available.  And, of course, one
> >> cannot override the preferred version anymore due to the use of "=" instead
> >> of "=?" for the assignment.  (At the very least, when all the SRCREVs were
> >> moved into the recipes, shouldn't the weak assignments have been preserved?)

Yes you can override it with _pn-something in local.conf (as ie
fso-autorev.conf, shr-autorev.conf), SRCREV_pn-abc = "123" is preferred
over SRCREV = "12" in abc_svn.bb. Doesn't matter if there was weak or
normal assignment in recipe.

The point for not-weak assignement is because some time ago, RP said,
that would be better to define SRCREV = None ie in bitbake.conf to get
better error message than those "svnr1". Using weak SRCREV in recipes
wouldn't be possible.

> >> At any rate, I wish to remove the bogus messages about svnr1, and I want to
> >> restore the behavior that would allow me to provide the SRCREV in my
> >> local.conf.  What is the correct way to do this with the new "world order"
> >> as it relates to SRCREVs?   To what config file do I move that
> >> SRCREV="1089"?  Who would I anger if I just put it back to the way it was?

Please try solution suggested above first.

> >>From what RP was saying on IRC the other day, you can utilize "%" in version
> > preferences for versions that include srcrev, as a marker.  2.6.27.8+svnr%.
> >  I haven't looked at that code, though, so I may be completely out in left
> > field here :)
> 
> NOTE: preferred version 2.6.27.8+svnr% of linux-ixp4xx not available
> (for item kernel)
> NOTE: preferred version 2.6.27.8+svnr% of linux-ixp4xx not available
> (for item kernel-module-ext2)
> NOTE: preferred version 2.6.27.8+svnr% of linux-ixp4xx not available
> (for item kernel-module-jbd)
> 
> :(  Does this %-sign feature perhaps require a new bitbake version?

Yes this needs bitbake master.

Regards,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


