Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzFTa-00084Y-JI
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 23:06:41 +0200
Received: by gwb1 with SMTP id 1so1178739gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Zby4BBm56OpX206L4SKlxgHQpLuDW18SOGUvg3AaVR4=;
	b=e+PhrWJLCSTwexPeNGnX6neRW1bUGRJA4IohuDIIaVvOLCdvdXd1TUvm2M/JSacpVA
	RIy0gqbJKpeNByOOfSkjlA9h7fNIqdx05h1iAtRBjB4aTLw3r9/9N+qzAQ6EgqvIftcP
	Mi3z26gsp4Yr29wgk7obp1o7p1otcsVq+kRjs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Mcr22mPGVad9sF+2EgrKxLRjL+jpknBQsgO1bwyl2lQieEoZONon+WkwKLPBSMjf8v
	vEsmgfkLvdVZRi6dRTl5vhldn/z1io37bT/1CHmrJDaGP3zGAJd+IsUKMZjTrpAn01Wd
	W1/fSdjoC1I3I5oCMu3xzmFkmESV2mm+oUdCM=
MIME-Version: 1.0
Received: by 10.90.78.4 with SMTP id a4mr3279801agb.45.1285362390682; Fri, 24
	Sep 2010 14:06:30 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 24 Sep 2010 14:06:30 -0700 (PDT)
In-Reply-To: <4C9D1136.2070507@freyther.de>
References: <4C9D1136.2070507@freyther.de>
Date: Fri, 24 Sep 2010 23:06:30 +0200
Message-ID: <AANLkTikuhnp4XgiTR8F_FhsZ5Q=naANKRdk8OdX6vQUR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt and detecting iWMMXT
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
X-List-Received-Date: Fri, 24 Sep 2010 21:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/24 Holger Freyther <holger+oe@freyther.de>:
> Hi all,
>
> when building for XScale one could pass -iwmmxt to the configure script. Now
> how can a recipe find out if XScale systems are targeted? The closest thing I
> can think of is to look at PACKAGE_ARCH and see if xscale is in it.
>
> Is there a better way?

Is this something which is xscale specific
or is it armv5te specific ?
In the latter case I guess something like
EXTRA_OECONF_armv5te could be used

Frans


