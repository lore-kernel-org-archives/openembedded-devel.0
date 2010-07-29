Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OeMSb-0004Vv-B8
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 08:19:18 +0200
Received: by bwz10 with SMTP id 10so1736bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 23:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zdDUQjUBw+OmjDEtnMvEyEmEHy649/4qRLEzLme0v0w=;
	b=JjjdNGNVngpkBCaXPKeuTHHY3X4SIX8nhJOmJ8BT2FeJ8iHuezI8nugaVMCXUzjwAP
	VLrXl7uRpWInpnGYzpeDFWPnNzozd2AcoP9Yr+LfevTRulHKjkQOHg1P63oTZzhn4fqk
	Teb82uhzMD49goRmr0UWWTopyzof6c8pPapuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UYO8JfupF+qBYhbtkIwIqDPu7LULFQLgY541ZFGZ8lPUF4jm76fsPVhUj8BzbVQEzz
	CgE5Um0oSy5vVzWEdt8ni6i5EExCn5CORjDYosq5rPo6LcZrKuxxQC5K1DsOxmTDgewC
	hEqoI50fakKE/7tBscN1bpdc3A9lBCZ9UquMI=
MIME-Version: 1.0
Received: by 10.204.83.84 with SMTP id e20mr8366703bkl.214.1280384340014; Wed, 
	28 Jul 2010 23:19:00 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 28 Jul 2010 23:18:59 -0700 (PDT)
In-Reply-To: <20100728195943.GA29909@mx.loc>
References: <20100716213929.GI23169@mx.loc>
	<1280337265-25582-1-git-send-email-rep.dot.nop@gmail.com>
	<i2pokl$7iu$1@dough.gmane.org> <20100728173945.GD19135@mx.loc>
	<i2q0sv$5tc$1@dough.gmane.org> <20100728195943.GA29909@mx.loc>
Date: Thu, 29 Jul 2010 08:18:59 +0200
Message-ID: <AANLkTin6Xw9JKDvaG1-+qKNQjdzWSjPjQX92+7TEKjU0@mail.gmail.com>
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
Subject: Re: [PATCH][v3] gcc-cross: fix PV and make it compile
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
X-List-Received-Date: Thu, 29 Jul 2010 06:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/28 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

> On Wed, Jul 28, 2010 at 09:37:03PM +0200, Koen Kooi wrote:
> >-----BEGIN PGP SIGNED MESSAGE-----
> >Hash: SHA1
> >
> >
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021641.html
>
> this is rather ugly and counter intuitive for i'll have to change the
> PREFERRED_GCC_VERSION whenever someone decides to change that "4.6+svnr",
> but ok, i'll drop the PR hunk :(
> thanks,
>

Alternate suggestion: do it the way you want to do it and store the recipe
in a local overlay
You might also be able to use amend.inc.

Have fun! Frans

>
> >On 28-07-10 19:39, Bernhard Reutner-Fischer wrote:
> >> On Wed, Jul 28, 2010 at 07:16:05PM +0200, Koen Kooi wrote:
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> On 28-07-10 19:14, Bernhard Reutner-Fischer wrote:
> >>>
> >>>> -PV = "4.6+svnr${SRCPV}"
> >>>> +PR = "4.6+svnr${SRCPV}"
> >>>
> >>> NAK, PV = "4.6+svnr${SRCPV}" is the right thing to do
> >>
> >> ok what should i do then?
> >> I want to use the svn version of gcc regardless of it being called
> >> "1.2.3-svn" or "5.0.0-svn" so i put this into my local.conf:
> >>
> >> #PREFERRED_GCC_VERSION = "4.4.4"
> >> PREFERRED_GCC_VERSION = "svn"
> >>
> >> But that obviously doesn't work with a PV of "4.6+svnr${SRCPV}" like
> >> current git has.
> >> I made up that "svn" intuitively, with the following reasoning:
> >> i'm using the subversion version (_version_, hence PV)
> >> with an arbitrary revision as Package Release that will sort correctly
> >> iff a 4.6.0 release would be made.
> >>
> >> Now how am i supposed to pick "svn" if not by using "svn"?
> >>
> >> thanks for clarification,
> >
> >-----BEGIN PGP SIGNATURE-----
> >Version: GnuPG v1.4.5 (Darwin)
> >
> >iD8DBQFMUIbfMkyGM64RGpERAoPYAJ9rxqMp47aGQnPjE6R7GTIMx7CQpgCgmuIa
> >7su2ka+K0cQBaopKy11SRtk=
> >=1Jf8
> >-----END PGP SIGNATURE-----
> >
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

