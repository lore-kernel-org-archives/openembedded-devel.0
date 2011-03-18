Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q0iGA-0008LR-4s
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 23:35:06 +0100
Received: by iyb26 with SMTP id 26so4569073iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=+pjNfkxf2glx7BcBXx0Duv2dfEld54L16VRT9kTIlF8=;
	b=fh6LTL6XNfhP6RqtIaYX8/6y5aKhPQC/FvHRd7kljMLNoMcIbSva0+Qy0r/pSlxRuT
	JovzbOvxwYXYuSDx9lPnbrI0LAoH074ZwWpfpbkQENfOReLt3MiiiJxEnK1XCOMuFqPa
	fmOr4LxequDc/hrH59cCJnXIcyPCRWC9ojPGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QV/haRs3h/mzxipYiCDeYQO3B9BLXHEPOsJLHQbQUmpXUsXGER14Bp5+2o5RlI6JqQ
	Qt0qI+XJXweVSvpr/BwmLwbrNE82syb0W+1D+mgJgmkwAbXmfxQPsJ6huetzR9ZzZHYY
	gaq3qczgYvGg8C3JgdnqRbOg0hmcVL/9/gClI=
MIME-Version: 1.0
Received: by 10.231.177.193 with SMTP id bj1mr1408349ibb.145.1300487599849;
	Fri, 18 Mar 2011 15:33:19 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Fri, 18 Mar 2011 15:33:19 -0700 (PDT)
In-Reply-To: <1300484141.3026.6.camel@lenovo.internal.reciva.com>
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
	<AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
	<1300484141.3026.6.camel@lenovo.internal.reciva.com>
Date: Fri, 18 Mar 2011 23:33:19 +0100
Message-ID: <AANLkTi=JiJHOMU3vTBVeke460+K0iNUwU4wCnAsuC8OL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Fri, 18 Mar 2011 22:35:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/18 Phil Blundell <philb@gnu.org>:
> On Fri, 2011-03-18 at 21:33 +0100, Frans Meulenbroeks wrote:
>> 2011/3/18 Dr. Michael Lauer <mickey@vanille-media.de>:
>> > Salut,
>> >
>> > the blacklisting of packages as found in angstrom.bbclass
>> > is pretty helpful and would be beneficial to all kinds
>> > of distribution configurations in OE. Would there be
>> > a strong objection of renaming this to blacklist.bbclass?
>> >
>> > Copying, of course, is also a possibility, but
>> > in my opinion it would only be the second best choice.
>> >
>> > Cheers,
>> >
>> > :M:
>>
>> If blacklisting a certain package for all distro's is there then still
>> a need to keep those blacklisted packages ????
>
> The class that Mickey is talking about is just the mechanism to allow
> blacklisting. =A0It doesn't actually contain a list of blacklisted
> packages; I think that typically goes in DISTRO.conf for distros that
> use it.
>
> However, if we do want to rename it to something more global (which I
> agree seems like a good idea) then the contents would need a bit of
> tweaking since both the variables that it looks at, and the messages
> that it outputs, make reference to Angstrom specifically.
>

Ah ok, thanks for the explanation!

Frans


