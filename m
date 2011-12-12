Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ra6NH-0005W5-HO for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 14:56:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ra6Gc-0006Y6-2m for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 14:50:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 14:50:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 14:50:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 12 Dec 2011 14:47:11 +0100
Message-ID: <jc50l0$phq$2@dough.gmane.org>
References: <1323680575-31596-1-git-send-email-Bernhard.Guillon@hale.at>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1323680575-31596-1-git-send-email-Bernhard.Guillon@hale.at>
X-Enigmail-Version: 1.3.3
Subject: Re: [[meta-oe][PATCH]] libgtkstylus_0.5.bb: add missing LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 12 Dec 2011 13:56:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-12-11 10:02, Bernhard Guillon schreef:
> 
> Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at> --- 
> .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    3 ++- 1 files
> changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
> b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb index
> f614048..9c9fc2d 100644 ---
> a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb +++
> b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb @@ -2,7 +2,8
> @@ DESCRIPTION = "GTK plugin for stylus based systems" SECTION = "libs" 
> DEPENDS = "gtk+" LICENSE = "LGPL"

That's not a valid license, please change that to something with a version,
e.g. LGPLv2.1.

And for v2 please use the git-send-email command from the README, that will
avoid the double brackets.

regards,

Koen

> -PR = "r2" +LIC_FILES_CHKSUM =
> "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
>
> 
+PR = "r3"
> 
> inherit autotools
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7mBd8ACgkQMkyGM64RGpGFhQCeOMGvBPW36wgrqWgKxyryBtvN
HkIAnje3LzuJ0gCB9ilA/F4m6QUme7Jp
=wMTd
-----END PGP SIGNATURE-----



