Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O6JSz-00087g-Ro
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 10:14:58 +0200
Received: from [192.168.1.2] (e180137063.adsl.alicedsl.de [85.180.137.63])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 74D6C584185
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 10:15:54 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hr3c9d$rg6$1@dough.gmane.org>
References: <hr25nh$nft$1@dough.gmane.org>
	<1272234950.19634.30.camel@andromeda>  <hr3c9d$rg6$1@dough.gmane.org>
Organization: Vanille-Media
Date: Mon, 26 Apr 2010 10:11:38 +0200
Message-ID: <1272269498.19634.35.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: a38e7ff2810e55455c7ff7b01d4882344b420e18 breaks build and packaged-staging, among other things
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
X-List-Received-Date: Mon, 26 Apr 2010 08:14:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Montag, den 26.04.2010, 08:36 +0200 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 26-04-10 00:35, Michael 'Mickey' Lauer wrote:
> > Am Sonntag, den 25.04.2010, 21:38 +0200 schrieb Koen Kooi:
> >> bitbake something-depending-on-vala-stuf
> >>
> >> is now broken because bitbake will run
> >> something-depending-on-vala-stuf.do_configure and compile after
> >> vala-stuff.do_populate_staging and the vapi files will NOT be there.
> > 
> > Can you give a concrete example that breaks? I'm using quite a
> > substantial amount of Vala e.g. in task-fso2-compliance and it builds
> > from scratch without any problems.
> > 
> >> The other problem is that the packaged-staging packages won't contain
> >> the vapi files, so rebuilding staging it broken as well.
> > 
> > Ok, since the patch was made to get rid of all the 'legacy staging'
> > warnings, would do_install_append() instead of do_stage_vapi() fix that?
> 
> No, since you can't poke outside ${D} in do_install. I think the best
> solution is to have the vala compiler look in the arch dir it's
> compiling *for* instead of the host one (STAGING_DIR instead of
> STAGING_DIR_NATIVE).

I agree that would be the best way, but it's not an option for now.

> Think of vapi files as m4 macros and you'll see why the current and
> previous situation are completely wrong.

True, but sometimes we have to work around upstream things in the build
utilitiy. Oh well, I don't mind the legacy staging warnings - so if no
one has any other idea, I'll revert it back to the legacy staging later
today.

-- 
:M:



