Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 126796BD6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 07:55:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WT59S-0004In-TC for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2014 08:55:02 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:55:02 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:55:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 27 Mar 2014 08:50:56 +0100
Message-ID: <lh0l8g$thv$2@ger.gmane.org>
References: <cover.1395846628.git.diego.ml@zoho.com>
	<35bf13dcc3038c29e62376de0b436d0c6664123f.1395846628.git.diego.ml@zoho.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <35bf13dcc3038c29e62376de0b436d0c6664123f.1395846628.git.diego.ml@zoho.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH 2/3] python-twisted: upgrade to version 13.2.0
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
X-List-Received-Date: Thu, 27 Mar 2014 07:55:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Diego Rondini schreef op 26-03-14 16:14:
> --- ...-twisted_10.2.0.bb => python-twisted_13.2.0.bb} |   16
> +++++----------- 1 file changed, 5 insertions(+), 11 deletions(-) rename
> meta-oe/recipes-devtools/python/{python-twisted_10.2.0.bb =>
> python-twisted_13.2.0.bb} (94%)
> 
> diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb similarity
> index 94% rename from
> meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb rename to
> meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb index
> d585bfa..00be867 100644 ---
> a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb +++
> b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb @@ -6,12 +6,12
> @@ SECTION = "console/network"
> 
> #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license,
> rather than LGPL. LICENSE = "MIT" -LIC_FILES_CHKSUM =
> "file://LICENSE;md5=c3159ad36d96a939fcd8f2c2c9b9d08a" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"

Please explain in the commit message what changed in the license

> PR = "r3"

Drop that

> 
> -SRC_URI =
> "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${PV}.tar.bz2 " 
> -SRC_URI[md5sum] = "73da62c793269eade8121da336b01ba5" -SRC_URI[sha256sum]
> = "562ed61c18aa72da99c23fb19c2c101d178995eb3a78ab3c09560a613e180c84" 
> +SRC_URI =
> "https://pypi.python.org/packages/source/T/Twisted/Twisted-${PV}.tar.bz2"
>
> 
+SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
> +SRC_URI[sha256sum] =
> "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
> 
> S = "${WORKDIR}/Twisted-${PV}"
> 
> @@ -26,7 +26,6 @@ PACKAGES += "\ ${PN}-zsh \ ${PN}-test \ ${PN}-protocols
> \ -    ${PN}-bin \ ${PN}-conch \ ${PN}-lore \ ${PN}-mail \ @@ -42,7 +41,6
> @@ PACKAGES += "\
> 
> RDEPENDS_${PN} = "python-core python-zopeinterface" RDEPENDS_${PN} += "\ 
> -    ${PN}-bin \ ${PN}-conch \ ${PN}-lore \ ${PN}-mail \ @@ -70,11 +68,7
> @@ FILES_${PN}-protocols = " \ FILES_${PN}-zsh = " \ 
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \ 
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \ -" - 
> -FILES_${PN}-bin = " \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/_c_urlarg.so \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/cBanana.so \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh
> \

And explain this change as well in the commit message

> "
> 
> FILES_${PN}-conch = " \
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTM9hfMkyGM64RGpERAtvMAKCX+AHtDV+3lSWc0rh5EIiYzr8I0ACgg+H1
I99rG1Qi6ugHYCQkb2OE4iA=
=ptIt
-----END PGP SIGNATURE-----


