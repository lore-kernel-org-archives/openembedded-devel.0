Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZoAG-0001yN-Pf
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 18:53:38 +0200
Received: by bwz10 with SMTP id 10so1512584bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6i9UWwiF6x4yn6f1Dg+XRoNISK5MDYQnCgoC3kCLXS8=;
	b=Ew4kmVJ+My6Sfn0Ng4SAigEZfW1HaVUMqlgFHSP6zSkejFMngma3PmfaPAGzNwNKmz
	TmOjyCehSo4XbgQbUhvetCuzXx+7u2vONCR/WCOsTTiFEJu1WrXdZptQDV2oZ1LRd6BR
	ZUjKPtdZfJ1Rp3Gwg18jadNPfdH84vcfO9cOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UCDTbn1YKKO3EYByn6AnpCU+bYGpGsih3PaNcV40gZtkHmipfAAwTEDVTrquRdpQov
	0kpiiSxaYAJHuS2EaInKYD+qubAoQcXyRTO1WljAcivgDpxsrHeHUIgHWW+NMX115kHb
	mxi1EC4RwR8t6J0hcIv+X8/BYDOxoLvujsUBc=
MIME-Version: 1.0
Received: by 10.204.81.130 with SMTP id x2mr1107850bkk.210.1279299209126; Fri, 
	16 Jul 2010 09:53:29 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 16 Jul 2010 09:53:29 -0700 (PDT)
In-Reply-To: <1279297456.10837.1942.camel@rex>
References: <1279290319.10837.1747.camel@rex> <4C407EE5.6050802@cbnco.com>
	<1279297456.10837.1942.camel@rex>
Date: Fri, 16 Jul 2010 18:53:29 +0200
Message-ID: <AANLkTikr86Xy4gg7cgLFnKEIbGEyOCFbauzMSzMZxtG3@mail.gmail.com>
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
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Fri, 16 Jul 2010 16:53:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/16 Richard Purdie <rpurdie@rpsys.net>

> On Fri, 2010-07-16 at 11:46 -0400, Michael Smith wrote:
> > Richard Purdie wrote:
> > > The idea is that if bitbake finds any X.bbappend files, when it loads
> > > X.bb, it will also include these files after it parses the base .bb
> file
> > > (but before finalise and the anonymous methods run). This means that
> > > the .bbappend file can poke around and do whatever it might want to the
> > > recipe to customise it.
> >
> > Does this do anything different than amendrecipes.bbclass?
>
> Several people have mentioned the amend bbclass. This implements
> something very similar in quite a different way as part of the bitbake
> tool itself. There are advantages and disadvantages to doing this.
>
> The features I liked about the bbappend approach was the small amount of
> code change required to bitbake compared to the functionality it offers
> and also the overhead of the bbappend code is minimal.
>
> I also feel the bbappend format is slightly easier for users to
> comprehend but that is subjective.
>
> A downside is that the .bbappend applies to specific versions, not all
> versions as amend.bbclass can be setup. There are ways that could be
> changed.
>
> The amend class has a greater degree of flexibility in that you can make
> changes to the class and it could be argued not changing the core is an
> advantage too.
>
> Cheers,
>
> Richard,

Looks like a fine idea to me (although I must say I was unaware of the amend
class, so I cannot really compare).

An alternative I was thinking of was to have a mechanism in an overlayed
recipe that would allow you to include whatever version was in a lower
priority overlay, but your prososal looks also quite sound.

+1

Frans

