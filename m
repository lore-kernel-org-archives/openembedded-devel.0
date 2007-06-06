Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <oe@hentges.net>) id 1HvuGM-0004Ht-NW
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 14:05:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id B2EE53081F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2007 14:02:55 +0200 (CEST)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27258-02 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jun 2007 14:02:52 +0200 (CEST)
Received: from mhcln04.hentges.priv (xdsl-213-196-242-127.netcologne.de
	[213.196.242.127]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 685BA3081EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2007 14:02:52 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200706061330.37489.openembedded@hrw.one.pl>
References: <E1HvlNq-0004pN-I1@linuxtogo.org>
	<1709000488.20070606140338@gmail.com>
	<466697F2.6020303@dominion.kabel.utwente.nl>
	<200706061330.37489.openembedded@hrw.one.pl>
Date: Wed, 06 Jun 2007 14:02:51 +0200
Message-Id: <1181131371.4914.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: [oe-commits] org.oe.dev usb-gadget-mode: Add usb-gadget	mode: An initscript to load the configured USB gadget module on boot
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
X-List-Received-Date: Wed, 06 Jun 2007 12:05:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 06.06.2007, 13:30 +0200 schrieb Marcin Juszkiewicz:
> Dnia =C5=9Broda, 6 czerwca 2007, Koen Kooi napisa=C5=82:
> > > Hello coredump2,
>=20
> > >> usb-gadget-mode: Add usb-gadget mode: An initscript to load the
> > >> configured USB gadget module on boot
>=20
> > What about using o-hands usbinit[1]?
>=20
> I had same idea when saw that commit. OpenedHand usbinit is in use on f=
ew=20
> machines and do that work done properly. But it supports only 2.6=20
> machines which use g-ether kernel module.

This package was previously unknown to me :\

The idea behind usb-gadget-mode was that - eventually -  the user can
select the "mode" via a shiny GUI app and does not need to mess
w/ /etc/modutils manually.

If usbinit matches that description I'll happily remove gadget-mode.

With >4600 .bb files one can lose the overview easily, thanks for the
headsup ;)
--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice





