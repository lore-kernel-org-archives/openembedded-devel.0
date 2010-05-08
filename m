Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OAeBC-0006zs-Ay
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 09:10:31 +0200
Received: by gya1 with SMTP id 1so1016268gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Ub+Gxx2MK9R0pVBBeneAHOe+HpQZ182DK2CDHWevum0=;
	b=Q4SAWgkSBu0xxOJ2b6RwvETJrMcKGBWD/2iNa8v396SeH/PpmesdaRQuYD4a/0T9vb
	3b9yQvTm2/OMVBCoLHAXpJdsj+Qfv39agp399FibjfrfF3cd9wbG/QMrzRhp49BZ10dK
	2FqW9KLZOTim1jMt8YEpgLCDy2OVKjqJ9YRCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QTsBR0iDmCAmN6BW3+UEoUmjWVgKcn+kwyGde6gSdYr0WYndmdZDAUQ4u95TehNsJm
	fB7g8iZLnAyoyRjQnjMhz5lJ2FDjvd/Eu0iSiVIsXZRquuHcBV8yYR6YAjGPKHT/Ibwh
	y3cb0mH+oAlxF19PoW+UYqbZA4HsRsi231kCk=
MIME-Version: 1.0
Received: by 10.91.95.14 with SMTP id x14mr886322agl.1.1273302399542; Sat, 08 
	May 2010 00:06:39 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Sat, 8 May 2010 00:06:39 -0700 (PDT)
In-Reply-To: <1273249883.457.336.camel@trini-m4400>
References: <1273249883.457.336.camel@trini-m4400>
Date: Sat, 8 May 2010 09:06:39 +0200
Message-ID: <g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Sat, 08 May 2010 07:10:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/7 Tom Rini <tom_rini@mentor.com>:
> Hey all,
>
> With DISTRO=minimal and MACHINE=calamari, I see the following failure in
> gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
> http://pastebin.com/cjAStcLb and I confirmed this prior to the RP merge,
> so this is unrelated.

Which eglibc is that?
The issues I had seemed due to some catch22 situation that I cured; I
started a clean build yesterday before I left work & can tell the
results on monday.
My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
minimal also using 2.10 or is it at 2.11

I can also try to kick off a minimal build on monday

Frans


