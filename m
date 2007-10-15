Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IhUW8-0004zt-7T
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 20:18:16 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9FIBkUx029728 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2007 20:11:47 +0200
Message-ID: <4713AD5F.3040807@student.utwente.nl>
Date: Mon, 15 Oct 2007 20:11:43 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200710151419.07302.openembedded@haerwu.biz>
	<1192464632.25543.58.camel@localhost.localdomain>
In-Reply-To: <1192464632.25543.58.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Mon, 15 Oct 2007 18:18:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

> Consider:
> 
> PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
> 
> and bitbake setting:
> 
> VRPROVIDER_xserver = "xserver-kdrive"
> 
> None of this fixes the existing problem of how to get
> "xserver-kdrive-fbdev" back and bitbake is always going to need help to
> work that one out...
> 
> 
> So perhaps we should just standardise the existing xserver behaviour
> into a dedicated namespace:
> 
> DEPENDS = "virtual/xserver"
> RDEPENDS_xyz = "${VIRTUAL-RUNTIME_xserver}"
> 
> and the machine.conf in this case would say
> 
> PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
> VIRTUAL-RUNTIME_xserver = "xserver-kdrive-fbdev"

We have the ${XSERVER} var for runtime selecting it:

amsdelta.conf:XSERVER = "xserver-kdrive-fbdev"
asus730.conf:XSERVER = "xserver-kdrive" <- wrong!
bd-neon.conf:XSERVER = "xserver-kdrive-fbdev"
c7x0.conf:XSERVER = "xserver-kdrive-imageon"
er0100.conf:XSERVER = "xserver-kdrive-fbdev"
htcuniversal.conf:XSERVER = "xserver-kdrive-fbdev"
hx4700.conf:XSERVER = "xserver-kdrive-w100"
magician.conf:XSERVER = "xserver-kdrive-fbdev"
netbook-pro.conf:XSERVER = "xserver-kdrive-epson"
netvista.conf:XSERVER = "xserver-kdrive-vesa"
nokia770.conf:XSERVER = "xserver-kdrive-xomap"
nokia800.conf:XSERVER = "xserver-kdrive-xomap"

gpe-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
gpephone-image-vm.bb:XSERVER ?= "xserver-kdrive-fbdev"
gpephone-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
maemo-image.bb:XSERVER ?= "xserver-kdrive-omap"
sectest-gpe-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
x11-gpe-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
x11-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
x11-office-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
x11-pimlico-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
xfce-image.bb:XSERVER ?= "xserver-kdrive-fbdev"
xfce-image.bb:X_RDEPENDS = "${XSERVER}"



regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHE61fMkyGM64RGpERAj+LAJ9D/X1UU1hdZXWCvIVskvpkIPXktgCgu5fF
rzbDzmZhE9w3Wm4L0Uad6IA=
=hBIx
-----END PGP SIGNATURE-----


