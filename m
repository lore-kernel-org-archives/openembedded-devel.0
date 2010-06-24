Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORizE-0005x6-TF for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:48:17 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORiui-0001dz-MB for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:40:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:40:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:40:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 24 Jun 2010 11:31:04 +0200
Message-ID: <hvv8ko$skd$4@dough.gmane.org>
References: <1277370374-4677-1-git-send-email-thomas.elste@imms.de>
	<1277370374-4677-2-git-send-email-thomas.elste@imms.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1277370374-4677-2-git-send-email-thomas.elste@imms.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qwt: Add version 5.2.1
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
X-List-Received-Date: Thu, 24 Jun 2010 09:48:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-06-10 11:06, Thomas Elste wrote:
> Add recipe for current version of Qwt. This new version uses qt4-classes
> instead of palmtop. Different bb-files for Qt and Qt-Embedded
> variant are provided. Qwt examples are also build. They get deployed in
> extra packages.

Looks good enough to me, we can solve any other issues after it has been
committed.

Acked-by: Koen Kooi <koen@openembedded.org>

> 
> Signed-off-by: Thomas Elste <thomas.elste@imms.de>
> ---
>  recipes/qwt/qwt-e_5.2.1.bb |   10 ++++++++++
>  recipes/qwt/qwt.inc        |   35 +++++++++++++++++++++++++++++++++++
>  recipes/qwt/qwt_5.2.1.bb   |   10 ++++++++++
>  3 files changed, 55 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/qwt/qwt-e_5.2.1.bb
>  create mode 100644 recipes/qwt/qwt.inc
>  create mode 100644 recipes/qwt/qwt_5.2.1.bb
> 
> diff --git a/recipes/qwt/qwt-e_5.2.1.bb b/recipes/qwt/qwt-e_5.2.1.bb
> new file mode 100644
> index 0000000..95bb31f
> --- /dev/null
> +++ b/recipes/qwt/qwt-e_5.2.1.bb
> @@ -0,0 +1,10 @@
> +QWT_VARIANT = "E"
> +inherit qt4e
> +require qwt.inc
> +RDEPENDS_${PN}-examples += "qt4-embedded-fonts"
> +
> +PR = "${INC_PR}.1"
> +
> +SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
> +
> diff --git a/recipes/qwt/qwt.inc b/recipes/qwt/qwt.inc
> new file mode 100644
> index 0000000..09ceb56
> --- /dev/null
> +++ b/recipes/qwt/qwt.inc
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "Qt Widget Extension for Technical Applications"
> +HOMEPAGE = "http://qwt.sourceforge.net/"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "GPL"
> +INC_PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2"
> +
> +S = "${WORKDIR}/qwt-${PV}"
> +
> +EXTRA_OEMAKE = "${PARALLEL_MAKE}"
> +
> +do_configure_prepend() {
> +        # set install and doc path, set lib suffix, enable examples
> +        sed -i \
> +                -e 's/\(INSTALLBASE *= \)\/usr.*/\1\/usr/' \
> +                -e 's/\(doc.path.*\/\).*/\1share\/doc\/qwt-${PV}/' \
> +                -e 's/\(RELEASE_SUFFIX *=\).*/\1 ${QWT_VARIANT}/' \
> +                -e 's/#CONFIG     += QwtExamples/CONFIG += QwtExamples/' \
> +                qwtconfig.pri
> +}
> +
> +do_install() {
> +        oe_runmake install INSTALL_ROOT=${D}
> +        rm ${D}${libdir}/libqwt${QWT_VARIANT}.so
> +        install -d ${D}${bindir}/qwt${QWT_VARIANT}-examples
> +        install examples/bin${QWT_VARIANT}/* ${D}${bindir}/qwt${QWT_VARIANT}-examples
> +}
> +
> +PACKAGES =+ "${PN}-examples ${PN}-examples-dbg"
> +FILES_${PN} = "${libdir}/*"
> +FILES_${PN}-examples = "${bindir}/qwt${QWT_VARIANT}-examples/*"
> +FILES_${PN}-examples-dbg = "${bindir}/qwt${QWT_VARIANT}-examples"
> +
> diff --git a/recipes/qwt/qwt_5.2.1.bb b/recipes/qwt/qwt_5.2.1.bb
> new file mode 100644
> index 0000000..4f59d16
> --- /dev/null
> +++ b/recipes/qwt/qwt_5.2.1.bb
> @@ -0,0 +1,10 @@
> +QWT_VARIANT = 
> +inherit qt4x11
> +require qwt.inc
> +RDEPENDS_${PN}-examples += "qt4-fonts"
> +
> +PR = "${INC_PR}.1"
> +
> +SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIyXXMkyGM64RGpERAtYMAJ4897qIqzvaMZ4jBLbBZKqV/myZdQCgg/K/
AbTO4SXKR8rBfLj5NQ4SIPw=
=Ebu/
-----END PGP SIGNATURE-----



