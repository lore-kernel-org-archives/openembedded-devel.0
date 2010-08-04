Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgaW5-0002wL-NH
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 11:44:06 +0200
Received: by bwz10 with SMTP id 10so2714133bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SG9/YdnxJBCpXjBoBVYHc22NEqr4MZv92XboF0zGWmY=;
	b=vVbslidSvfzpb8wRh2HTsmR4paacnY924m34djRzuFKQrRQRAN4deaRz31XIDO+M7/
	Kb87sax4H3z074JHVKw9htR5bRUix3nNonREcZKQ2wrRbez6Hz84Y40uVBwvs55xKhlM
	7qdEmEoCV4L9onyV/1eu8OS/jIs8MaUS2gR/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=s9uSmnuXf5gHcg6L5FDEhgsBvQ5irzq/KTCMFZHKnQDxkN3p9yrZkYsvdoWdQ2e7Hp
	6wJH0xMhj+O2KgCJ9wXZjE3v0tr/g27YT8DBWewWYE5wejAY66WKAH60TLcZGhnOu6u2
	OFv+0C6Lm6Nowvcsyzu6QUJu9HRGL9QW+4xTg=
MIME-Version: 1.0
Received: by 10.204.126.161 with SMTP id c33mr6123839bks.108.1280915043510; 
	Wed, 04 Aug 2010 02:44:03 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 4 Aug 2010 02:44:03 -0700 (PDT)
In-Reply-To: <i3bavs$8c4$2@dough.gmane.org>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org> <i3bavs$8c4$2@dough.gmane.org>
Date: Wed, 4 Aug 2010 11:44:03 +0200
Message-ID: <AANLkTikjZtqw5yCUzeXGZdhqyEg-qwTz-q3aRSd2zK89@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 09:44:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 04-08-10 02:19, Denys Dmytriyenko wrote:
> > On Tue, Aug 03, 2010 at 04:47:20PM -0500, Chase Maupin wrote:
> >> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
> >>   setting for a recipe.
> >> * This will allow recipes to work for entire families of
> >>   devices without having to maintain/update the compatible
> >>   devices as new devices are added into a family
> >>
> >> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> >
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
>
> Acked-by: Koen Kooi <k-kooi@ti.com>
>
> I have no problems with the patch as such, but would appreciate a patch for
the documentation that describes this variable.

Frans

>
>
>
> >
> > While SOC_FAMILY feature is relatively new on its own, it was designed
> and now
> > being extensively used with TI machines and corresponding recipes as an
> > effective override - e.g. covering many OMAP3-based machines with a
> single
> > VAR_omap3 = "VAL" expression.
> >
> >> ---
> >>  classes/base.bbclass |    4 +++-
> >>  1 files changed, 3 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/classes/base.bbclass b/classes/base.bbclass
> >> index 1847491..02c7875 100644
> >> --- a/classes/base.bbclass
> >> +++ b/classes/base.bbclass
> >> @@ -389,7 +389,9 @@ python () {
> >>              import re
> >>              this_machine = bb.data.getVar('MACHINE', d, 1)
> >>              if this_machine and not re.match(need_machine,
> this_machine):
> >> -                raise bb.parse.SkipPackage("incompatible with machine
> %s" % this_machine)
> >> +                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
> >> +                if this_soc_family and not re.match(need_machine,
> this_soc_family):
> >> +                    raise bb.parse.SkipPackage("incompatible with
> machine %s" % this_machine)
> >>
> >>          need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
> >>          if need_target:
> >> --
> >> 1.7.0.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

