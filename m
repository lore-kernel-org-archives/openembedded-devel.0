Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id BDBFB6E766
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:45:03 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WSOqt-0003w3-Cb for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2014 11:45:03 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 11:45:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 11:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 25 Mar 2014 11:43:16 +0100
Message-ID: <lgrmjl$edf$1@ger.gmane.org>
References: <1395672589-29305-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <1395672589-29305-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] gnome-desktop3 : Updated to 3.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2014 10:45:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio Salvador schreef op 24-03-14 15:49:
> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> 
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> .../{gnome-desktop3_3.0.2.bb => gnome-desktop3_3.4.2.bb}             | 5
> +++-- 1 file changed, 3 insertions(+), 2 deletions(-) rename
> meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.0.2.bb =>
> gnome-desktop3_3.4.2.bb} (81%)
> 
> diff --git
> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb 
> similarity index 81% rename from
> meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb rename to
> meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb index
> 16f1c60..a99bb7a 100644 ---
> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb +++
> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb @@ -7,10
> +7,11 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ PR = "r2"

Please drop PR when updating to a new PV


> 
> BPN = "gnome-desktop" +GNOME_COMPRESS_TYPE ?= "xz"
> 
> inherit gnome pkgconfig -SRC_URI[archive.md5sum] =
> "e2fd9d545d4d7ff66525f10364ab671e" -SRC_URI[archive.sha256sum] =
> "0ac9b4a358c6d92d20283cf56a9817262ff3ce038013cbb5d98e4ab97aa2c9a3" 
> +SRC_URI[archive.md5sum] = "efd11d3841c34cc1709d0ea1d3f83cf1" 
> +SRC_URI[archive.sha256sum] =
> "7565e0a822132ea7b699cb8c64d42b57081ddefd0b5d911f4f4209be0c755952"
> 
> DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11
> gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification"
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTMV3EMkyGM64RGpERAjyAAJ9lye7RKJkXZo9gyZHK4YpZkjQlPQCgqn7E
Me5xfrYI4bIFi0U+7q9816s=
=Wo5K
-----END PGP SIGNATURE-----


