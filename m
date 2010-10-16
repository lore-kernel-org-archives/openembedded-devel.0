Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P766y-0004Wt-OK
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 14:44:03 +0200
Received: by iwn2 with SMTP id 2so1983120iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=WiugCvnVVTkBmJdg6F1VJ/GS5u8qtLBN5nlDKD9zKro=;
	b=RpvMsFBojT2LjzFp6towI6gFJRbfPJH//0jX3JY5vPa9tqPAoOHzaz1UyZ8BQ5eRX3
	OZw9O4rcEH9I+DhJKOfZpkJ3wxLQCPlCeD+AV1bmU1n1tSobL1cR3z0lJ+J1ulDqqZxJ
	RW8wtTVyk9cglF98LFugiJ7hx+7262guu3GiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qAtmBEktYMOWQk7Muwbf37SAPIfgFrbgfBz0am+VuokxtoBj1P1X40skbNNLFEgXiO
	2L/cLWpu8C2BJ3eH+sZ5yUB7BjMD0iaDktGE6+6a1p2Hw4yieAJQkNTkakHvqGXL86m7
	0q5nHtASiAWbFgjFgrPA38tN8NPK4DG/eWMtE=
MIME-Version: 1.0
Received: by 10.42.176.199 with SMTP id bf7mr1645796icb.184.1287232973873;
	Sat, 16 Oct 2010 05:42:53 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 05:42:53 -0700 (PDT)
In-Reply-To: <1287232455.3980.60.camel@mattotaupa>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287232455.3980.60.camel@mattotaupa>
Date: Sat, 16 Oct 2010 14:42:53 +0200
Message-ID: <AANLkTi=CG0J+fiKHULTD2gf=uOAY+86sOwnZSNQae-RR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 12:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/16 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Samstag, den 16.10.2010, 13:56 +0200 schrieb Frans Meulenbroeks:
>
> Typo in commit summary. s/gnutols/gnutls/

ah ok, will fix. Thanks for spotting this.

>
> I have not kept up with recent changes. But why is that patch not needed
> anymore and why can the `libtool-m4-macros` be removed?
>

Well the problem I got was this:

| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[6]: *** [close-hook.lo] Error 63
| make[6]: *** Waiting for unfinished jobs....
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[6]: *** [sockets.lo] Error 63
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[6]: *** [asnprintf.lo] Error 63
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[6]: *** [c-ctype.lo] Error 63

I understood that the m4 macros will be regenerated and the patch is
not needed any more.
As said before this was the advice I got in irc to fix this.
I've used http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=eb059202723cefaebe1242e4d1ec2a00c35d3d94
as guidance, authored the patch, this made gnutls build fine.
As a 2nd verification I'm currently build an image that requires
several pacakges using gnutls, but it'll take a few hrs before this is
finished.


