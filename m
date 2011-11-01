Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RL9HX-0007T1-38 for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:01:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RL9Bc-0006sY-Pd for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 08:55:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 08:55:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 08:55:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 01 Nov 2011 08:52:48 +0100
Message-ID: <j8o8gg$4gv$1@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<c5be2d9dea4e1914eb73f39af1517d457ef92f3a.1319884094.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <c5be2d9dea4e1914eb73f39af1517d457ef92f3a.1319884094.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl][meta-oe 10/12] task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be able to select different -common and init providers
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
X-List-Received-Date: Tue, 01 Nov 2011 08:01:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-10-11 12:29, Martin Jansa schreef:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

[..]

> -# Some machines don't set a *runtime* provider for X, so default to
> Xfbdev here -# virtual/xserver won't work, since the kdrive recipes will
> build multiple xserver packages -XSERVER ?= "xserver-xorg" 
> -XSERVER_COMMON ?= "xserver-common" - -PACKAGE_ARCH = "${MACHINE_ARCH}" 
> +# xserver-common, x11-common +VIRTUAL-RUNTIME_xserver-common ?=
> "xserver-common"
> 
> -RDEPENDS_${PN}-server = "\ -  ${XSERVER} \ -" +# elsa,
> xserver-nodm-init +VIRTUAL-RUNTIME_graphical_init_manager ?=
> "xserver-nodm-init"
> 
> RDEPENDS_${PN}-utils = "\ -  ${XSERVER_COMMON} \ -  xserver-nodm-init \ +
> ${VIRTUAL-RUNTIME_xserver-common} \ +
> ${VIRTUAL-RUNTIME_graphical_init_manager} \ xauth \ xhost \ xset \

Can someone explain what the VIRTUAL-RUNTIME_* buys us? I'd be much happier
if you split this into two or more tasks. Experience has shown that people
just don't get that they need to change all the PRs in the tasks when
updating magic vars like VIRTUAL-RUNTIME_* :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOr6VQMkyGM64RGpERAoTBAJ4snZdShYhS0QEyaHpncSZpPIhEfgCfeAdY
VofJBNR2/s1J11C9Evy3lDE=
=EOIR
-----END PGP SIGNATURE-----



