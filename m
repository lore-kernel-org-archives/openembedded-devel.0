Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RFh77-0004EY-Uj for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 08:55:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RFh1U-0005r7-LO for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 08:50:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:50:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:50:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Oct 2011 08:46:56 +0200
Message-ID: <j7gj10$e07$2@dough.gmane.org>
References: <1318809068-16742-1-git-send-email-schnitzeltony@gmx.de>
	<1318809068-16742-2-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1318809068-16742-2-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-gnome 2/2] nautilus: cleanup package directories
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
X-List-Received-Date: Mon, 17 Oct 2011 06:55:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-10-11 01:51, Andreas Müller schreef:
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- 
> .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |    3 +-- 1 files
> changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
> b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb index
> f34cbbe..e076ca1 100644 ---
> a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb +++
> b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb @@ -33,8 +33,7 @@
> do_configure() { }
> 
> RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-networking" 
> -FILES_${PN} += "${datadir}/icons  /usr/libexec/ " -FILES_${PN}-dbg +=
> "/usr/libexec/.debug" +FILES_${PN} += "${datadir}/icons"

So nautilus stopped installing helpers in /usr/libexec?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOm89gMkyGM64RGpERAqvtAJ9AgQwxHX1QcHvGvgYRlIaQUImjMQCfYg5F
q/yL8Vd5Edz7lVmNXYLcG7A=
=PknH
-----END PGP SIGNATURE-----



