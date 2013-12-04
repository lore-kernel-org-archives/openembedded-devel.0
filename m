Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8A34C6DF48
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 08:25:08 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Vo7lY-0007eB-2Q for openembedded-devel@lists.openembedded.org;
	Wed, 04 Dec 2013 09:25:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:25:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:25:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 Dec 2013 09:24:39 +0100
Message-ID: <l7mopa$8gj$1@ger.gmane.org>
References: <1386142594-20793-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386142594-20793-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH V2] nginx: new recipe, updated from aging original in rpi layer (has not been scrubbed for any potential policy issues).
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
X-List-Received-Date: Wed, 04 Dec 2013 08:25:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 04-12-13 08:36:
> From: "stephen.arnold42" <stephen.arnold42@gmail.com>
> 
> Signed-off-by: stephen.arnold42 <stephen.arnold42@gmail.com> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb new file mode 100644 
> index 0000000..20e9ab5 --- /dev/null +++
> b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb @@ -0,0 +1,113 @@ 
> +SUMMARY = "HTTP and reverse proxy server" + +DESCRIPTION = "Nginx is a
> web server and a reverse proxy server for \ +HTTP, SMTP, POP3 and IMAP
> protocols, with a strong focus on high  \ +concurrency, performance and
> low memory usage." + +HOMEPAGE = "http://nginx.org/" +LICENSE =
> "BSD-2-Clause" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f" +SECTION = "net" + 
> +DEPENDS = "libpcre gzip openssl" + +SRC_URI = " \ +
> http://nginx.org/download/nginx-${PV}.tar.gz \ +	file://nginx-cross.patch
> \ +	file://nginx.conf \ +	file://nginx.init \

The conf and init file both have hardcoded references that break when
${prefix} is not /usr and ${localstatedir} is not /var. There was an nginx
recipe submitted earlier this week that did update those reference in
do_install, but that one lacked the USERADD, systemd and CONFFILES touches
in this patch. Can you have a look at combining all the good features into
one patch?

regards,

Koen

> +do_install () { +	oe_runmake 'DESTDIR=${D}' install +	rm -fr
> ${D}${localstatedir}/run ${D}/run +	install -d
> ${D}${sysconfdir}/default/volatiles +	echo "d root root 0755
> ${localstatedir}/run/${BPN} none" \ +	     >
> ${D}${sysconfdir}/default/volatiles/99_${BPN} +	if
> ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)};
> then +		install -d ${D}${sysconfdir}/tmpfiles.d +		echo "d /run/${BPN} -
> - - -" \ +		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf +	fi +
> install -d ${D}${sysconfdir}/${BPN} +	ln -snf ${localstatedir}/run/${BPN}
> ${D}${sysconfdir}/${BPN}/run +	install -d
> ${D}${localstatedir}/www/localhost +	mv ${D}/usr/html
> ${D}${localstatedir}/www/localhost/ +	chown www:www-data -R
> ${D}${localstatedir} + +	install -d ${D}${sysconfdir}/init.d +	install -d
> ${D}${sysconfdir}/nginx +	install -m 0755 ${WORKDIR}/nginx.init
> ${D}${sysconfdir}/init.d/nginx +	install -m 0644 ${WORKDIR}/nginx.conf
> ${D}${sysconfdir}/nginx/ + +	install -d
> ${D}${sysconfdir}/default/volatiles +	echo "d www www-data 0755
> ${localstatedir}/run/nginx none" \ +		>
> ${D}${sysconfdir}/default/volatiles/99_nginx +}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSnubHMkyGM64RGpERAuyiAKCWF6kexMwtL4jWoj+zpGKQXWvCRQCgjueb
Ix+WbciF6sUSj2NBdDL4pb0=
=iYwy
-----END PGP SIGNATURE-----


