Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJMQ9-0004mD-M5 for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 12:43:17 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJMDQ-0004Fm-9t for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 12:30:08 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:30:08 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:30:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 12:20:16 +0200
Message-ID: <k4h3gv$n4q$2@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<f4fa3e7556b5456ed8f9e5450669ab108bd08325.1349107616.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <f4fa3e7556b5456ed8f9e5450669ab108bd08325.1349107616.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 3/6] modphp: add from OE-Classic
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
X-List-Received-Date: Wed, 03 Oct 2012 10:43:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-10-12 18:14, Paul Eggleton schreef:
> No modifications in this commit (apart from not copying some unneeded 
> files).
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
> .../recipes-php/modphp/files/70_mod_php5.conf      |   12 ++++ 
> .../recipes-php/modphp/files/configure.patch       |   11 ++++ 
> meta-webserver/recipes-php/modphp/modphp5.inc      |   66
> ++++++++++++++++++++ meta-webserver/recipes-php/modphp/modphp_5.1.6.bb  |
> 5 ++ 4 files changed, 94 insertions(+) create mode 100644
> meta-webserver/recipes-php/modphp/files/70_mod_php5.conf create mode
> 100644 meta-webserver/recipes-php/modphp/files/configure.patch create
> mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc create mode
> 100644 meta-webserver/recipes-php/modphp/modphp_5.1.6.bb

> +++ b/meta-webserver/recipes-php/modphp/modphp5.inc @@ -0,0 +1,66 @@ 
> +SECTION = "console/network" +DESCRIPTION = "A server-side, HTML-embedded
> scripting language. This package provides the apache php module." 
> +LICENSE = "PHP" +RDEPENDS_${PN} = "apache2"

That one goes below do_installed

> +DEPENDS = "apache2-native apache2 zlib" + +#SRC_URI =
> "http://de3.php.net/distributions/php-${PV}.tar.bz2 \

remove that one

> +SRC_URI = "http://museum.php.net/php5/php-${PV}.tar.bz2 \ +
> file://configure.patch \ +	  " + +S = "${WORKDIR}/php-${PV}" + +inherit
> autotools + +FILES_${PN} = "${libdir}/apache2 /etc"

$sysconfdir

> +FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"

and move below do_install

> + +CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED
> -I${STAGING_INCDIR_NATIVE}/apache2" + +EXTRA_OECONF =
> "--with-apxs2=${STAGING_BINDIR_NATIVE}/apxs \ +
> --without-mysql \ +		--enable-force-cgi-redirect \ +		--disable-cgi \ +
> --disable-cli \ +		--disable-pdo \ +		--without-pear \ +		--without-iconv
> \ +		--disable-ipv6 \ +		--disable-xml \ +		--disable-xmlreader \ +
> --disable-xmlwriter \ +		--disable-simplexml \ +		--disable-libxml \ +
> --disable-dom \ +                --with-zlib
> --with-zlib-dir=${STAGING_DIR}${layout_exec_prefix}/.. \ +
> --with-config-file-path=/etc/php/apache2-php5"

whitespace errors

> +#		--with-libxml-dir=${STAGING_DIR_NATIVE}${layout_exec_prefix} \

remove

> + +# to get postgres support, add it to the DEPENDS above +# and
> uncomment this line.  similar for mysql +#EXTRA_OECONF += "
> --with-pgsql=${STAGING_DIR_HOST}${layout_exec_prefix}"

That is a PACKAGECONFIG change

> + +acpaths = "" + +# +# override the autotools do_configure, which runs
> autoconf, +# which breaks everything... +# +do_configure() { +	export
> PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} +	oe_runconf 
> +} + +# +do_install  () { +	install -d ${D}/usr/lib/apache2/modules +
> install -d ${D}/etc/apache2/modules.d +	install -d
> ${D}/etc/php/apache2-php5 +	install -m 755  libs/libphp5.so
> ${D}/usr/lib/apache2/modules +	install -m 644
> ${FILESDIR}/70_mod_php5.conf ${D}/etc/apache2/modules.d +	cat
> ${S}/php.ini-dist | \ +		sed -e 's,extension_dir = \"\./\",extension_dir
> = \"/usr/lib/extensions\",' \ +		> ${D}/etc/php/apache2-php5/php.ini +} 
> diff --git a/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
> b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb new file mode 100644 
> index 0000000..a75a742 --- /dev/null +++
> b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb @@ -0,0 +1,5 @@ 
> +include modphp5.inc +PR ='r3'

Double quotes are preferred, but I'm tempted to just say "drop the PR entirely"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQbBFgMkyGM64RGpERAjzhAKCFrTB4bqQDEswgWaZVJbvNNnmL5ACcDNWE
idJglUy51wBG+1VggE9KRnM=
=rykS
-----END PGP SIGNATURE-----



