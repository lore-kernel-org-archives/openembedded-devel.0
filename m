Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 663736A35B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 14:38:53 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VnUeA-0004Cq-LB for openembedded-devel@lists.openembedded.org;
	Mon, 02 Dec 2013 15:38:50 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2013 15:38:50 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2013 15:38:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 02 Dec 2013 15:38:44 +0100
Message-ID: <l7i615$91m$1@ger.gmane.org>
References: <1385993511-14838-1-git-send-email-s.mennetrier@innotis.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1385993511-14838-1-git-send-email-s.mennetrier@innotis.org>
X-Enigmail-Version: 1.6
Subject: Re: [meta-webserver][PATCH] Add nginx http webserver
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
X-List-Received-Date: Mon, 02 Dec 2013 14:38:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sébastien Mennetrier schreef op 02-12-13 15:11:
> From: Sébastien <s.mennetrier@innotis.org>
=
> +    install -d ${D}${sysconfdir}/init.d +    cat ${WORKDIR}/init | \ +
> sed -e 's,/usr/sbin/,${sbindir}/,g' \ +            -e
> 's,/etc/,${sysconfdir}/,g' > ${D}/${sysconfdir}/init.d/nginx +    chmod
> 755 ${D}/${sysconfdir}/init.d/nginx

I think using sed -i will be easier to understand, I haven't seen any pipe
based modifications in an OE recipe yet.


> + +    install -d ${D}${sysconfdir}/nginx +    cat ${WORKDIR}/nginx.conf
> | \ +        sed -e 's,/var/,${localstatedir}/,g' >
> ${D}/${sysconfdir}/nginx/nginx.conf +    chmod 644
> ${D}/${sysconfdir}/nginx/nginx.conf +    install -d
> ${D}${sysconfdir}/nginx/sites-enabled + +    install -d
> ${D}${sysconfdir}/default/volatiles +    cat
> ${WORKDIR}/nginx-volatile.conf | \ +        sed -e
> 's,/var/,${localstatedir}/,g' >
> ${D}${sysconfdir}/default/volatiles/99_nginx +    chmod 644
> ${D}${sysconfdir}/default/volatiles/99_nginx + +    rm -fr
> "${D}${localstatedir}/run" +} + +CONFFILES_${PN} =
> "${sysconfdir}/nginx/nginx.conf \ +
> ${sysconfdir}/nginx/fastcgi.conf\ +
> ${sysconfdir}/nginx/fastcgi_params \ +        ${sysconfdir}/nginx/koi-utf
> \ +        ${sysconfdir}/nginx/koi-win \ +
> ${sysconfdir}/nginx/mime.types \ +        ${sysconfdir}/nginx/scgi_params
> \ +        ${sysconfdir}/nginx/uwsgi_params \ +
> ${sysconfdir}/nginx/win-utf \ +        ${sysconfdir}/init.d/nginx \ +" + 
> +INITSCRIPT_NAME = "nginx" +INITSCRIPT_PARAMS = "defaults 92 20" + 
> +FILES_${PN} += "${localstatedir} \ +                /run \ +
> " + +USERADD_PACKAGES = "${PN}" +USERADD_PARAM_${PN} = " \ +    --system
> --no-create-home \ +    --home ${localstatedir}/www/localhost \ +
> --groups www-data \ +    --user-group www"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSnJt0MkyGM64RGpERAu5zAJ40O7GXBDLlkBdThmA1OBstF+mJ9ACgmmjs
HwVpGhfux7+iRWIOYfJgTbw=
=QBo2
-----END PGP SIGNATURE-----


