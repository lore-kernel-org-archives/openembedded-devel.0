Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NKJbk-0003DR-09
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 23:41:39 +0100
Received: by fxm4 with SMTP id 4so3765834fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 14:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PLTuI50rggEDbEXwnwv0Je8TIaWi6N1Oh57CdcTyipA=;
	b=aFC6XZRc10/OJsbCG1y7pgpGw5WNAU2StVkExyf1a63mw+5yVHm3VMQJAs8NVmVaIi
	LdNU6CtBO5XLJGiMnrk3nQQ8aUt1yUtFrPLhXXLoMHflREH9HRoFRSCLsr2eHWuka/tM
	TGqNTzkMNetpjCHy8VHaIwL+M5vnG1xKQNRtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cYmHoeYdcV66ldCw7kHWknlkzz/UIlTyIrpXeRSf/QVYyci/AL/17BBJhRZ5pBxDj0
	7gD5qz1pOxX6Klnd5oY9P5y5yzuWGOPdP5PbmhG8JQZhmLZBverGSvrkpwOQx3RyTDV/
	6v7MAvpT0UgMAdWVV/ZJPeYSeVmFxibVdrojw=
Received: by 10.223.57.66 with SMTP id b2mr6541773fah.33.1260830390445;
	Mon, 14 Dec 2009 14:39:50 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1732667fxm.15.2009.12.14.14.39.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 14:39:49 -0800 (PST)
Date: Mon, 14 Dec 2009 23:39:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091214223937.GR3601@jama>
References: <alpine.LFD.2.00.0912140512120.21693@localhost>
	<20091214102214.GM3601@jama>
	<alpine.LFD.2.00.0912141041310.29685@localhost>
	<4B26A6F0.6040706@balister.org>
MIME-Version: 1.0
In-Reply-To: <4B26A6F0.6040706@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: test build just finished, three failed package builds
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
X-List-Received-Date: Mon, 14 Dec 2009 22:41:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 14, 2009 at 03:58:24PM -0500, Philip Balister wrote:
> On 12/14/2009 10:42 AM, Robert P. J. Day wrote:
> >On Mon, 14 Dec 2009, Martin Jansa wrote:
> >
> >>On Mon, Dec 14, 2009 at 05:13:32AM -0500, Robert P. J. Day wrote:
> >>>
> >>>   just this minute, my latest build attempt for beagle demo image off
> >>>of dev branch produced:
> >>>
> >>>ERROR: '/home/rpjday/oe/openembedded/recipes/mesa/mesa-dri_7.0.3.bb' failed
> >>We probably need those patches from DJWillis
> >>http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=e6f17d1cc03bdd90c575b7e2bd482932e53ba9c0
> >>http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=60b64bead81643e5c97c29abc4574c66398b3ebb
> >>http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=f8b4d26e7cfe06bfc8474df50035b886045a0324
> >>http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=de272c2db0e37b72bfa55268a2e383c906ee0680
> >>http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=63144b3bb0e035d3f8109fb907bb018694f2a9f0
> >>
> >>Or I can set PREFERRED_PROVIDER_virtual/libgl to "mesa" instead of
> >>"mesa-dri" in compatibility_providers.conf or maybe it should be set on
> >>distro/machine level.
> >
> >   if someone pushes some patches for the current build fails on
> >fedora, mention that here and i'll be happy to pull and retest the dev
> >branch.
> 
> I've cherry-picked these from openpandora. If it builds, or at least
> gets past mesa stuff, I'll push.
> 
> Philip

And I've pushed change of default virtual/libgl provider in
compatibility-providers.conf from mesa-dri to mesa.

Hopefully this way it would be less painfull for machine maintainers to
pick right mesa provider for their device.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


