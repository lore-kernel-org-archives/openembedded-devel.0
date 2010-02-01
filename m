Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NbzYa-00052V-Qg
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 17:55:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 2D8642C817
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 16:49:33 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RUv809p5+a4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 16:49:29 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id A315F2C7D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 16:49:28 +0000 (UTC)
Message-ID: <4B6706E3.3030003@gmail.com>
Date: Mon, 01 Feb 2010 17:52:51 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1265018002.32037.22.camel@balakrishnan-desktop>
In-Reply-To: <1265018002.32037.22.camel@balakrishnan-desktop>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom - Touchscreen enable?
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
X-List-Received-Date: Mon, 01 Feb 2010 16:55:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

balakrishnan ha scritto, Il 01/02/2010 10:53:
> Hi,
>    I am building "stable/2009" angstrom-distro branch in open embedded.
> What is my problem is I am not able to enable 'touch screen'. I have
> added "touchscreen" value in MACHINE_FEATURES variable also.
> My configuration details is
>=20
> PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
> XSERVER =3D "xserver-xorg \
>            xf86-input-evdev \
>            xf86-input-mouse \
>            xf86-video-fbdev \
>            xf86-input-keyboard"
> MACHINE_FEATURES =3D "kernel26 usbgadget usbhost vfat alsa touchscreen"
>=20
> 1.How to enable touch screen in "xserver-xorg" configuration?.
> 2.If it enabled in "xserver-kdrive" only, then why?
> 3.tslib packages is not getting installed to rootfs?
>=20
> With Regards
> J.Balakrishnan
>=20


Hi,
I am currently working on xinput-calibrator integration into
OpenEmbedded (so consequently into Angstrom and KaeilOS)
http://www.angstrom-distribution.org/
http://www.kaeilos.com/ (mantained by me)

Both these two distributions uses xserver-xorg rather than the old
xserver-kdrive, so please try enabling xinput-calibrator in your image
recipe in order to include xinput-calibrator_0.5.0.bb

Please let me know how is it working on your side, posting here, in IRC
#oe or by private mail.

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com




