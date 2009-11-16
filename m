Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NA0tA-0005rQ-DV
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:41:03 +0100
Received: by bwz9 with SMTP id 9so5278727bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=re/OErN0yEaLV1MowOJOWJR6UKfXHZA0Jpz5K3Z2zsw=;
	b=rdemk5nAbGUG5/62eZFC8RIYKWucCVHawRxcO1OGwfIroaenjISwxWehK44fvQtll/
	S4UlsqDR5vBklY+tqwQaMsJrUIN2N09Os1qAbx7Io0fEBQSgk7M2DeGLqrj3LxZN0S33
	itx3Nk4MK8LxKEXAM7Pn3x8Dw8y08VJ41v6FU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=APGtuFwWsMjO3lJz9893Wme1Pw7lyMdzf0NkgqVTbZ/HWNPOZqfENi9TWYecCTuVS8
	pWHGK4QOuBIbezEbEmZq/XRkErb7JkJhVyZRQ35EfN0sxAp6D3+8JvsE9Xr7IKZYOVee
	HX7H64XFnjrMVD3Bslu0mLVC85LTbKEofmvlU=
Received: by 10.204.10.8 with SMTP id n8mr3564514bkn.48.1258375174365;
	Mon, 16 Nov 2009 04:39:34 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2022436fxm.0.2009.11.16.04.39.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Nov 2009 04:39:33 -0800 (PST)
Date: Mon, 16 Nov 2009 13:39:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091116123934.GB23383@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org> <20091116115115.GA23383@jama>
	<hdrg03$g1p$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hdrg03$g1p$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 12:41:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2009 at 01:19:15PM +0100, Koen Kooi wrote:
> On 16-11-09 12:51, Martin Jansa wrote:
> >On Mon, Nov 16, 2009 at 11:59:10AM +0100, Koen Kooi wrote:
> >>On 16-11-09 11:49, Richard Purdie wrote:
> >>>On Mon, 2009-11-16 at 11:37 +0100, Koen Kooi wrote:
> >>>>So basically every recipe that is using SRCPV in PV or PR is unsuitable
> >>>>to be put in online feeds. That should be enough to stop the SRCPV merge
> >>>>into .dev.
> >>>
> >>>How is this different to the current situation though?
> >>
> >>In the current situation (actually, last weeks situation) SRCPV was
> >>never used.
> >>
> >>>If SRCREV is locked down you will get 1 as the local build revision back
> >>>and it will not change and will be the same for everyone.
> >>
> >>>If its not locked down, all bets are off but they always have been - no
> >>>change.
> >>
> >>Ah, that was the bit of info I was missing. But if SRCREV is locked
> >>down (as it should!) what's the point of putting SRCPV in PV or PR?
> >>It seems to make things worse if you update a locked SRCREV, since
> >>SRCPV will remain '1'.
> >>
> >>regards,
> >>
> >>Koen
> >
> >Hi,
> >
> >I'm not sure if this is 100% right but it behaves like this here:
> >
> >with AUTOREV used
> 
> Which angstrom tries to avoid at great lenghts and any OE recipe
> fetched from an scm will by default and policy have a locked down
> rev available.
> A user (or distro) has to explicitly enable AUTOREV for recipes.

Sure, but AUTOREV is still usefull for recipes which are ie distro
specific (ie shr telephony stack) which is still developing pretty fast
and no one would like to see SRCREV bumps twice a day just because
developers are still fixing bugs in that package and users want bleeding
edge version for their distribution.

But once development slows down, would be nice to easily switch to fixed
SRCREV with upgradeable PV.

> >as SRCREV you get ${SRCREV} in format
> >gitrNNNN+hash
> >where NNNN is localcount incremented on buildhost every time you build
> >that recipe AND hash is changed
> >if you have fixed SRCREV then without SRCPV you get just gitrHash which
> >can be<  gitrNNNN+hash or>  gitrNNNN+hash depending on actual hash value.
> >That's why you cannot switch between SRCREV and SRCPV without PE bump.
> 
> I'm extremely allergic to PE bumps, because it means we screwed up big time.
> 
> >If there is SRCPV in PV and you're using fixed SRCREV than you don't
> >need to bump PR in cases like this
> >./xorg-proto/calibrateproto_git.bb:PV = "0.0+${PR}+gitr${SRCPV}"
> >because +gitr${SRCPV} will create non-decreasing sequence as localcount
> >will be incremented every time you bump fixed SRCREV for that recipe AND
> >build it.
> 
> So, how do I say
> 
> PREFERRED_VERSION_calibrateproto = 0.0+r1+gitr483843874931943189393
> # (4838... is what's in sane-srcrevs.inc)

This is imho wrong by design as you need to update SRCREV in sane-srcrevs 
or recipe then bump PR and then check if there is
PREFERRED_VERSION_calibrateproto for any distribution even outside OE
repo, because otherwise preferred version won't exist anymore and maybe 
even lower version will be picked (ie if there is DEFAULT_PREFERENCE = "-1" 
in that git recipe)?

That's why I proposed wildcard character to PREFERRED_VERSION before in 
http://patchwork.openembedded.org/patch/1057/

BTW: what about using something like this
PV = "0.0+git"
PR = "${INC_PR}.1+gitr${SRCPV}"

would be easy to set PREFERRED_VERSION to constant string "0.0+git"

> with SRCPV? It seems I would loose the ability to do that 'globally'
> since SRCPV is tied to a buildhost.
> 
> >You're right that there can be inconsistency between builders if one ie
> >you're changing fixed srcrev every day and rebuild it on that buildhost
> >and othere buildhost is rebuilding that package once a month.
> >
> >If all your builders are building all your targets every day and you're
> >not changing fixed SRCREV more then once a day, you need to sync
> >bb_persist_data.sqlite3 only for new builder or after some failures
> >(which I know is quite error-prone :().
> 
> So SRCPV makes things worse than the current situation.

switching AUTOREV <-> fixed SRCREV is not possible at all now, you even
need PE bump when switching, which is IMHO worse.

> >This inconsistency can be fixed imho only by sharing
> >tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3 between hosts
> >(better using some online database access for getting localcounts)
> >
> >sqlite3 ../tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3
> >"select * from BB_URI_LOCALCOUNT where key like '%kernel.git-linux-openmoko-shr-drm-devel_count';"
> >git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-drm-devel_count|5
> 
> So it seems that using SRCPV in PV and PR shouldn't be allowed till
> there is *good* way to share the 'localcount' to all builders.

I like RP's idea about dropping localcount for distros never using
AUTOREV. Only change for you then would be gitr0+Hash instead gitrHash
which isn't that bad, is it?

> regards,

regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


