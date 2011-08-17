Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qtaiz-0006xJ-EC for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 09:39:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtaeX-0006A1-IZ for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 09:35:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 09:35:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 09:35:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 17 Aug 2011 09:30:29 +0200
Message-ID: <j2fqml$jor$4@dough.gmane.org>
References: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH 1/2] lightmediascanner: added recipe for v0.4.3
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
X-List-Received-Date: Wed, 17 Aug 2011 07:39:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-08-11 06:51, Pau Espin Pedrol schreef:
> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com> --- .../recipes-efl/e17/lightmediascanner_0.4.3.0.bb   |   29 ++++++++++++++++++++ 1 files changed, 29 insertions(+), 0 deletions(-) create mode 100644 meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb
> 
> diff --git a/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb b/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb new file mode 100644 index 0000000..dd0b283 --- /dev/null +++ b/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb @@ -0,0 +1,29 @@ +DESCRIPTION = "Lightweight media
> scanner meant to be used in not-so-powerful devices" +SECTION = "libs/multimedia" +AUTHOR = "Profusion"

Maybe profusion.mobi might be clearer

> +LICENSE = "LGPLv2.1+" +DEPENDS = "sqlite3 flac" +SRC_URI = "https://garage.maemo.org/frs/download.php/9439/lightmediascanner-${PV}.tar.bz2" + +PE = "1"

meta-efl is a fresh start, so PE can be dropped

> + +inherit autotools pkgconfig + +do_install_append() { +    install -d ${D}/${bindir}/ +    install -m 755 ${WORKDIR}/${PN}-${PV}/src/bin/.libs/test  ${D}/${bindir}/test-lms +} + + +LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"

Move that next to LICENSE

> +PACKAGES =+ "${PN}-test" + +FILES_${PN}-test = "${bindir}/test-lms" + +FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug" + +SRC_URI[md5sum] = "188ff5188cfa0f2504a42934c969cb77" +SRC_URI[sha256sum] = "bdbe76655ad212b936fb3cf6a9ca725e318ddeb57cd7d950d9c8409297d3b0da"

And move those next to SRC_URI
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOS24VMkyGM64RGpERAlquAJ97wZaWiNLYg41n3q3O9vGiqJ6qaQCfVO5+
h0YoTC9/SmvV07UKzu/qdLo=
=55Qv
-----END PGP SIGNATURE-----



