Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 50DF37147B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 14:30:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Xuj2B-0007xX-Jw for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2014 15:30:03 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 15:30:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 15:30:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 29 Nov 2014 15:28:41 +0100
Message-ID: <m5cl6p$tor$3@ger.gmane.org>
References: <1417168385-1943-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1417168385-1943-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] ncftp : add new recipe
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
X-List-Received-Date: Sat, 29 Nov 2014 14:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Li xin schreef op 28-11-14 10:53:
> ncftp is a sophisticated console ftp client.
> 
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com> --- index
> 0000000..dd49478 --- /dev/null +++
> b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.0.bb @@ -0,0 +1,24 @@ 
> +DESCRIPTION = "A sophisticated console ftp client" +SECTION =
> "console/network" +PRIORITY = "optional"

Drop the PRIORITY field

> +LICENSE = "ClArtistic" +LIC_FILES_CHKSUM =
> "file://ncftp/cmds.c;beginline=3;endline=4;md5=9de76faeaedc4f908082e3f8142715f4"
>
> 
+
> +SRC_URI =
> "ftp://ftp.ncftp.com/ncftp/older_versions/ncftp-${PV}-src.tar.bz2 \ +
> file://acinclude.m4 \ +    file://Fix-errors-AR-Command-not-found.patch
> \ +    file://Fix-error-expected-before-PRINTF_LONG_LONG.patch" + 
> +inherit autotools-brokensep + +do_configure_prepend () { +    install -m
> 0644 ${WORKDIR}/acinclude.m4 acinclude.m4 +} +do_install () { +
> install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir} +    oe_runmake
> 'prefix=${D}${prefix}' 'BINDIR=${D}${bindir}' \ +
> 'SYSCONFDIR=${D}${sysconfdir}' 'mandir=${D}${mandir}' \ +        install 
> +} +SRC_URI[md5sum] = "384b7f01d725c89ccd30692628b3ac1b" 
> +SRC_URI[sha256sum] =
> "2ebc7b51af96cb0fa8b703c7cb995bfb46ccf5312e335270d0420e260544c376"


Move that next to SRC_URI

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUedgZMkyGM64RGpERAg7gAJ94TSEmtq4/a6Tw/yoanlUBOL8QTQCfTFjN
tqC6IQjBICeqCXKNAPYz6lo=
=Mwjq
-----END PGP SIGNATURE-----


