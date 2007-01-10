Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H4e7k-0003UT-Ga
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jan 2007 15:08:16 +0100
Received: by nf-out-0910.google.com with SMTP id l24so486710nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2007 06:06:26 -0800 (PST)
Received: by 10.49.20.15 with SMTP id x15mr1196454nfi.1168437986134;
	Wed, 10 Jan 2007 06:06:26 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id c1sm4009541nfe.2007.01.10.06.06.25;
	Wed, 10 Jan 2007 06:06:25 -0800 (PST)
Date: Wed, 10 Jan 2007 16:06:38 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1132961128.20070110160638@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200701092322.34825.openembedded@hrw.one.pl>
References: <200701081618.46665.openembedded@hrw.one.pl>
	<200701091430.38026.openembedded@hrw.one.pl>
	<eo13rb$pkn$1@sea.gmane.org>
	<200701092322.34825.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: Status of ARM machines in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2007 14:08:16 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Marcin,

Wednesday, January 10, 2007, 12:22:34 AM, you wrote:

> Dnia wtorek, 9 stycznia 2007 23:09, Rolf Leggewie napisa=B3:
>> > I did "angstrom-2007.1-oabi" build for collie, h3600, h3800, simpad,
>> > compulab-pxa270. Results:
>>
>> Do I see signs of collie being supported in angstrom?

> If collie will meet common rules then yes.=20

> Common rules:

> - 2.6 kernel
> - atleast 2 machine mentors in Angstrom

  Now, 2? Isn't that too steep? It's understood when 2 or more people
required to support some big software system, but what about machines?
Such requirement is simply not realistic for most of them. Of HH.org
machines, only hx4700 would qualify fully. Even for h2200 that would
be questionable, but thanks god, Koen has it, so assuming Matt Reimer
mentors it, it is safe.

  With such rules, there won't be Linux for PDA any time soon, only
Linux for Zauruses, Linux for iPaq hx4700, and other toy Linuxes.

  What's really required here is a point of view change. It would be
ludicrous to think that Debian would require two maintainers for each
motherboard model of each vendor. Debian simply doesn't deal with such
things as motherboards. It supports specific CPU architectures, that's
enough. And at the same time Linux distros for PDAs are obsessed over
PDA motherboards. There's even animism tendencies considering that
"machine" is something more than a tag given to some motherboard
implementation of the architecture, but also a bootloader spirit lives
there, and by conjuring it away one can beshrew rage of gods, etc.,
etc.

  So, stepping away from that towards architecture implementations as
such, I may offer myself as a mentor for all handhelds.org-maintained
machines. In 2.6 kernels, we have all the needed commonality and
generality (and work towards more) to treat all our machines
consistently. So, what's really required is someone to physically test
boot on a machine, and that's enough. Not boot means upstream (hh.org)
kernel problem, otherwise, it works (bugs are either common or due to
specific kernel bug also).



--=20
Best regards,
 Paul                            mailto:pmiscml@gmail.com



