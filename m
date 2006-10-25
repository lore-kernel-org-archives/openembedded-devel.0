Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Gcciz-0001nG-Ca
	for openembedded-devel@openembedded.org; Wed, 25 Oct 2006 08:58:53 +0200
Received: (qmail 940 invoked by uid 813007); 25 Oct 2006 06:58:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 25 Oct 2006 06:58:44 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2006 08:59:18 +0200
User-Agent: KMail/1.9.5
References: <453EAEE0.8020704@dominion.kabel.utwente.nl>
In-Reply-To: <453EAEE0.8020704@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200610250859.19316.openembedded@hrw.one.pl>
Subject: Re: Report of QA issues with 'bitbake angstrom-image'
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
X-List-Received-Date: Wed, 25 Oct 2006 06:58:53 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 25 pa=BCdziernika 2006 02:25, Koen Kooi napisa=B3:

> I decided to use insane.bbclass to hunt down spurious .debug/ entries
> in .debug packages, but insane.bbclass is so cool that I want to share
> the full list with you:
>
> http://ewi546.ewi.utwente.nl/tmp/QA-issues.txt

nice list

> I suspect we can ignore the .so warning for modules (gnumeric-plugins,
> abiword-plugins) and debug packages, but that still leave a fair deal
> of packages to investigate.

We also need to change insane.bbclass to print PN/PV on each line as many=20
packages are renamed by debian.bbclass. Not duplicating info would be=20
also usefull.

> Do we want to have bugs files against the offending packages, or are we
> going to work trough this list the next few weeks?

Metabug + bugraport per recipe sounds good to me.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                     Zwi=EAd=B3e r=F3=BFe te=BF k=B3uj=B1...




