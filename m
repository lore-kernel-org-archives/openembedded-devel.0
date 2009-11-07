Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6qgP-0000BP-Hh
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 20:10:48 +0100
Received: by bwz9 with SMTP id 9so2116908bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=Jo4qZSzqNzvpCJCtij1eLpmjwquP4nAhf84vNvGkBiw=;
	b=YLIQcd1hfaGGtqpDmQFpYWODY2sSvPOy7VGaKtC0k/U7w1WNhyhjEEOi7JnO3ve+D/
	lMwu97oLH64+E2SIioZV0+kDAkJdNU14I6ew2cQ8pgegscsIMYztwISfzhle1D2frMv1
	pcNI4nAnmYqeV8o0PtDMRotFm/rJ6KQR9YQtY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=LJ4x1qydWN7H86Re7v0fsc0VQRqO55jmzmAYqN2vLF/lee4BQAtxj8mFynJ+JdWfSx
	q7tH5nv+5ae7zLx+iAJfrpYcD8izSuvdKTlEdgUMIo4L7Udbc8N/r+nljnwOuNodvsFE
	4K047ve7lQjEPBG+rVdvYM615bJDvATZcJSJA=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.160.131 with SMTP id c3mr37481hbd.82.1257620475437; Sat, 
	07 Nov 2009 11:01:15 -0800 (PST)
In-Reply-To: <ac9c93b10911071000p51baba8fi8f4935f962eb8810@mail.gmail.com>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<4AF574B5.2010802@mwester.net> <hd4108$sbn$2@ger.gmane.org>
	<be7a9f3d0911070838x34e5cce8je93bc39aeb8fb3aa@mail.gmail.com>
	<ac9c93b10911071000p51baba8fi8f4935f962eb8810@mail.gmail.com>
Date: Sat, 7 Nov 2009 17:01:15 -0200
X-Google-Sender-Auth: e2a84e69116e71eb
Message-ID: <be7a9f3d0911071101h322dfa5dte24ef89c0b214b98@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 19:10:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sat, Nov 7, 2009 at 4:00 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>>> d) rename the tarball slighty and mirror in on a known good server (e.g.
>>> angstrom sourcemirror) and have OE use that.
>>
>> IMO (d) is the safest and the right thing to do; this avoids more core
>> to be written and avoids also we use changed versions without
>> noticing.
>
> Ok, I'll leave it to someone with better access so e.g. the
> sourcemirror to change things.
> BTW I've exchanged an email with the author of twig. He stated that
> the version on CPAN (3.22) is the official version and that the
> version we use is the current development version and subject to
> change.
> He proposed to move the 3.33 version to CPAN (which I encouraged).
> Guess we should then move to the cpan version which is the fixed one.

Even better; I fully agree with it.

If he can do it, it would avoid problems to us.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


