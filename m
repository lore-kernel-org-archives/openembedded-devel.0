Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RC7bb-0002R6-M3 for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 12:24:39 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RC7WA-0007Jd-JV for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 12:19:02 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 12:19:02 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 12:19:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 07 Oct 2011 12:18:43 +0200
Message-ID: <j6mjm3$31n$1@dough.gmane.org>
References: <1317937797-27434-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <1317937797-27434-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-xfce] ristretto: Add inital recipe for version 0.1.0
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
X-List-Received-Date: Fri, 07 Oct 2011 10:24:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-10-11 23:49, Andreas Müller schreef:
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- 
> .../recipes-apps/ristretto/ristretto_0.1.0.bb      |   17
> +++++++++++++++++ 1 files changed, 17 insertions(+), 0 deletions(-) 
> create mode 100644 meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb
> 
> diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb
> b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb new file mode
> 100644 index 0000000..0b9cca0 --- /dev/null +++
> b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb @@ -0,0 +1,17 @@ 
> +DESCRIPTION = "Image-viewer application" +HOMEPAGE =
> "http://goodies.xfce.org/projects/applications/ristretto" +SECTION =
> "x11/application" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +DEPENDS = "libexif
> gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo" + +PR = "r0"

Please drop that one. OE-core will be moving away from using PR, so adding
new ones isn't going to help, especially when r0 is the default value.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOjtIDMkyGM64RGpERAt58AJwKhhl4TTl+tvKW1UvV9G5fz3JeJwCfTXmm
ECz8IG29lL6n/mJ7uR82BC4=
=rLcA
-----END PGP SIGNATURE-----



