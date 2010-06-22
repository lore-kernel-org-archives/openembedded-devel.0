Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR4Wm-0002gc-44 for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:32:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR4SM-00053S-QS for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:28:06 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 16:28:06 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 16:28:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 22 Jun 2010 16:27:55 +0200
Message-ID: <hvqh9b$hqo$1@dough.gmane.org>
References: <1277204396-12287-1-git-send-email-thomas.elste@imms.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1277204396-12287-1-git-send-email-thomas.elste@imms.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 22 Jun 2010 14:32:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-06-10 12:59, Thomas Elste wrote:
> Add recipe for current version of Qwt. This new version uses qt4-classes
> instead of palmtop. Different bb-files for Qt and Qt-Embedded
> variant are provided. Qwt examples are also build. They get deployed in
> extra packages.

Could you make the -e and regular variants parallel installable? The
demos could be put in ${D}${bindir}/qwt-examples${QWT_VARIANT} for example.

regards,

Koen


> 
> Signed-off-by: Thomas Elste <thomas.elste@imms.de>
> ---
>  recipes/qwt/qwt-e_5.2.1.bb |    8 ++++++++
>  recipes/qwt/qwt.inc        |   33 +++++++++++++++++++++++++++++++++
>  recipes/qwt/qwt_5.2.1.bb   |    8 ++++++++
>  3 files changed, 49 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/qwt/qwt-e_5.2.1.bb
>  create mode 100644 recipes/qwt/qwt.inc
>  create mode 100644 recipes/qwt/qwt_5.2.1.bb
> 
> diff --git a/recipes/qwt/qwt-e_5.2.1.bb b/recipes/qwt/qwt-e_5.2.1.bb
> new file mode 100644
> index 0000000..09b31ed
> --- /dev/null
> +++ b/recipes/qwt/qwt-e_5.2.1.bb
> @@ -0,0 +1,8 @@
> +QWT_VARIANT = "e"
> +require qwt.inc
> +
> +PR = "${INC_PR}.1"
> +
> +SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
> +
> diff --git a/recipes/qwt/qwt.inc b/recipes/qwt/qwt.inc
> new file mode 100644
> index 0000000..6a9f9e0
> --- /dev/null
> +++ b/recipes/qwt/qwt.inc
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "Qt Widget Extension for Technical Applications"
> +HOMEPAGE = "http://qwt.sourceforge.net/"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "GPL"
> +INC_PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2"
> +
> +inherit qt4${QWT_VARIANT}
> +
> +EXTRA_OEMAKE = "${PARALLEL_MAKE}"
> +
> +do_configure_prepend() {
> +        # set install path and doc path, enable examples
> +        sed -i \
> +                -e 's/\(INSTALLBASE *= \)\/usr.*/\1\/usr/' \
> +                -e 's/\(doc.path.*\/\).*/\1share\/doc\/qwt-${PV}/' \
> +                -e 's/#CONFIG     += QwtExamples/CONFIG += QwtExamples/' \
> +                qwtconfig.pri
> +}
> +
> +do_install() {
> +        oe_runmake install INSTALL_ROOT=${D}
> +        install -d ${D}${bindir}/qwt-examples
> +        install examples/bin/* ${D}${bindir}/qwt-examples
> +}
> +
> +PACKAGES =+ "${PN}-examples ${PN}-examples-dbg"
> +FILES_${PN} = "${libdir}/*"
> +FILES_${PN}-examples = "${bindir}/qwt-examples/*"
> +FILES_${PN}-examples-dbg = "${bindir}/qwt-examples"
> +
> diff --git a/recipes/qwt/qwt_5.2.1.bb b/recipes/qwt/qwt_5.2.1.bb
> new file mode 100644
> index 0000000..a1142f0
> --- /dev/null
> +++ b/recipes/qwt/qwt_5.2.1.bb
> @@ -0,0 +1,8 @@
> +QWT_VARIANT = "x11"
> +require qwt.inc
> +
> +PR = "${INC_PR}.1"
> +
> +SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIMhrMkyGM64RGpERAmX+AJ9xH0uFz2QAA4afR1pTrfcJCVC1CACfQLYm
PFUyc+Uul7EcHZ8sS99hj6E=
=SRqv
-----END PGP SIGNATURE-----



