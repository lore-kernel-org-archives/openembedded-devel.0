Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lrr8w-0001am-Fj
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 12:06:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id CE21A1417186;
	Thu,  9 Apr 2009 12:04:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnQJHXzamO-B; Thu,  9 Apr 2009 12:04:15 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id A8D321416BA5;
	Thu,  9 Apr 2009 12:04:15 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <grijig$lqi$1@ger.gmane.org>
References: <1239207194-12212-1-git-send-email-vhdirk@gmail.com>
	<grijig$lqi$1@ger.gmane.org>
Date: Thu, 09 Apr 2009 12:02:48 +0200
Message-Id: <1239271368.15436.36.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] ccid: Update to version 1.3.10
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
X-List-Received-Date: Thu, 09 Apr 2009 10:06:03 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:

> > +DEPENDS =3D "libusb pcsc-lite"
> > +RDEPENDS =3D "pcsc-lite"
>=20
> > +EXTRA_OECONF =3D "--enable-udev"
>=20
> Shouldn't something like RRECOMMENDS_${PN} =3D "udev" be there as well?

Yes. But I think that the latest pcsc-lite itself has hotplug support
via udev or hal and hotplug should work without 85-pcscd_ccid.rules. At
least "opensc-tool -l" see the reader immediately. I have a reader, but
no supported card. I will be glad if you can confirm that in a real
application.

Another question is DEPENDS. Should it be libusb or libusb1? With libusb
you will not have interrupt transfers enabled. With libusb1 it should be
able to use interrupt transfers, but some people reported problems in
past. In the final 1.0 version it should be fixed.

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



