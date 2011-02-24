Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PsWSc-0002Yo-Vg
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 09:22:07 +0100
Received: by iwn10 with SMTP id 10so174046iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 00:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=lMlw3NfI+Db9RulpYWp3fRsp/AcQEPhzW05AYdqBI+g=;
	b=A/pnJE4FtZqGoUcbNL/UC6mAiULY59452EdxKHiZIStsVSOhizIcOq3rsmUmfJtLZQ
	0OGaFU2fahSxl58JJN16MAF7qdWakZWMbJr8d1V99csULmn+4r7YPFtrn6gyis33/c5Y
	AouCC+8KHKWpmgLoKcS5vBtCdyvOKx8okVxEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=A6QhS3luC8WmvnfQHJB1FYi9EqKkvbfhJVEqPAEgICiHNuAt/DvhX7Ir2aHgjaV/jT
	ikcDpNm9Z6+QfKNmlVyDlaVnvXnZ7vnbRavyfdTCPQoMiwamLBnk1w6z0JW/Ajhx0EUi
	Olo72SBoVtHjJ0nTbcd+TEpacjaCuLJtG4uq0=
MIME-Version: 1.0
Received: by 10.231.10.200 with SMTP id q8mr942385ibq.122.1298535642789; Thu,
	24 Feb 2011 00:20:42 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Thu, 24 Feb 2011 00:20:42 -0800 (PST)
In-Reply-To: <1298490534.26736.52.camel@rex>
References: <1298490534.26736.52.camel@rex>
Date: Thu, 24 Feb 2011 09:20:42 +0100
Message-ID: <AANLkTim-WprzRfvaYnFMjoR4=19hj96qp3NioMjY0Axi@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE TSC Meeting 2011/02/21 Minutes
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
X-List-Received-Date: Thu, 24 Feb 2011 08:22:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear Richard,

Thanks for the minutes.

Below are a few suggestions/questions.

2011/2/23 Richard Purdie <richard.purdie@linuxfoundation.org>:
[...]
>
> It was agreed to use a pull model for oecore with RP taking the top of
> the pull tree role. For meta-oe, there was a lot of argument for
> starting to use a pull model there too in an effort to also improve
> quality, but, the TSC recognised this might be the cause of friction. It
> was agreed to trial this for meta-oe whilst it becomes established and
> to actively solicit member feedback on how this works out. It should be
> stressed this is just a trial at this point.

This raises a few questions and remarks:
- I think we should try to come to some guidelines/suggestions/help on
how to handle this from a developer viewpoint.
This might e.g. be some additions to the git phrasebook, but I can
imagine we also want to do (or refer to) some starter docs on how to
set up a git, and some tips and tricks on how to work with it in a way
that is convenient for the puller. E.g. "how to be a good oe-core git
provider".
(btw I am quite a n00b when it comes to git, so I am definitely not
volunteering to write this section as i do not feel capable to do so).
- What about reviews? OE now has an ack/nack review policy (at least
for toolchain related parts)
- who will take the pull master role for meta-oe
- what about patches submitted to the mailing list? Do we expect the
pull master to pick them up?  Or will the yocto people deal with
mailed patches (for oe-core that is)?
Or another scenario?

[...]

Best regards, Frnas.


