Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D63BF71C70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 14:36:02 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 6so3447755wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c01tbkrZA07Az01JjrFFfXtL11qA0PPqPLgsqw5WnDg=;
	b=hfX6zhtQDqm9hjswA8vEnL7L1R544JyVDqCAMV2rgx7J3JThGcXQedDgVsHi8UbNyO
	DpC6XMvZOFmPyFOblzPyIhqOtDLb2ZUPwruBka62P2VqUeGweHPqQ1w4sKFtPZNKm3Pm
	hrweA1ogFdV8QOlg6zl9THdRK+I9HB36L8St2lUYm2s9SevNju7FLLZjxWNrG0q5j6am
	Ec2g8hdLsgHiodKhr7ZCs8ePVmgcqtke40wbEbz534Fn8MzetDBEvT4z1yg8AxoMXRYj
	GitM9R7svkMuH6+thW2mwovxeDQJuD8xj7538/mcLwzwHje7bPpfePd4ZpdT5juluUlZ
	Jx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c01tbkrZA07Az01JjrFFfXtL11qA0PPqPLgsqw5WnDg=;
	b=eFzAYnq3kYAUp2vY8gu9xy/mX1TKNGAHmh/QEMfJOS5trvNbNXvzd7KfQMwaqenwE8
	2GTN6b8dcIQ3MslKeIlOuoTO9vwrh6+8a7Mlo+MebSUhX75MF6Gig4mF8488lScCbl+t
	zPmEreQyVU6O0nFzhzHgV/AoVZiILPi1pjVBmNuNDdzF/4RK72efa6xnDPTZ5z+fvOmA
	SdB3uUtlV0bZ8NO5XN8aui2pLdPMeCOPDbQKEYdSwfeUS+b0XBsJVKIGLH2vCbk3a06j
	Q0qkCA4/xlZCV/J8lZVddJfqMHv7sHe9pBHCGq/HhveD+76EzMU2GFKDz3a+vJ2S3M/W
	28tw==
X-Gm-Message-State: AN3rC/4VWcMbWU7lUKdPtucuSFz9PvZrsV+xqHx8dIu+pfPFi7SE0zwC
	dIyxTa+UZMKZ/8vNRGP8K++68OodrA==
X-Received: by 10.223.136.75 with SMTP id e11mr1475909wre.14.1492698963865;
	Thu, 20 Apr 2017 07:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 20 Apr 2017 07:36:03 -0700 (PDT)
In-Reply-To: <20170420135735.25958-1-freesilicon@gmail.com>
References: <20170420135735.25958-1-freesilicon@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Apr 2017 16:36:03 +0200
Message-ID: <CA+chaQcHQvssOS6gjeTWfKF2o0h+6gvxxrDEEk-N2jh7AYJoCA@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] strongswan: Split plugins
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Apr 2017 14:36:04 -0000
Content-Type: text/plain; charset=UTF-8

I think currently the preferred way is only one -dev/-dbg/-staticdev
package per recipe.

Why not set RDEPENDS_${PN} based on plugins packaged in first do_split_packages
call?

Just my 2c - I'm not using strongswan and Joe has last word for
meta-networking.

On Thu, Apr 20, 2017 at 3:57 PM, David Vincent <freesilicon@gmail.com>
wrote:

> strongSwan offers a plugin mechanism therefore it should not be
> mandatory to install all of them when installing the package. Each
> plugin is now a self-contained package with the library and its
> configuration.
>
> To remain compatible with the current configuration, a default set of
> plugins has been selected as RDEPENDS of the main package. This default
> list is based on the default strongSwan list minus some plugins enabled
> via PACKAGECONFIG
> (see https://wiki.strongswan.org/projects/strongswan/PluginList).
>
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  .../recipes-support/strongswan/strongswan_5.5.1.bb | 101
> ++++++++++++++++++---
>  1 file changed, 88 insertions(+), 13 deletions(-)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_
> 5.5.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
> index f9e7ae3c1..d63214ba4 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
> @@ -24,17 +24,17 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', '--with-syst
>  PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
>          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
>  "
> -PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,"
> +PACKAGECONFIG[aesni] = "--enable-aesni,--disable-
> aesni,,${PN}-plugin-aesni"
>  PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
> -PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
> -PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,"
> -PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
> -PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
> -PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"
> +PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,
> curl,${PN}-plugin-curl"
> +PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
> +PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,
> openldap,${PN}-plugin-ldap"
> +PACKAGECONFIG[mysql] = "--enable-mysql,--disable-
> mysql,mysql5,${PN}-plugin-mysql"
> +PACKAGECONFIG[openssl] = "--enable-openssl,--disable-
> openssl,openssl,${PN}-plugin-openssl"
>  PACKAGECONFIG[scep] = "--enable-scepclient,--disable-scepclient,"
> -PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
> -PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
> -PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,"
> +PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,
> libsoup-2.4,${PN}-plugin-soup"
> +PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-
> sqlite,sqlite3,${PN}-plugin-sqlite"
> +PACKAGECONFIG[stroke] = "--enable-stroke,--disable-
> stroke,,${PN}-plugin-stroke"
>  PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
>
>  # requires swanctl
> @@ -44,10 +44,85 @@ inherit autotools systemd pkgconfig
>
>  RRECOMMENDS_${PN} = "kernel-module-ipsec"
>
> -FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}
> ${libdir}/ipsec/plugins/*.so"
> -FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug
> ${libexecdir}/ipsec/.debug"
> -FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV}
> ${libdir}/ipsec/*.la ${libdir}/ipsec/plugins/*.la"
> -FILES_${PN}-staticdev += "${libdir}/ipsec/*.a ${libdir}/ipsec/plugins/*.a"
> +FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
> +FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug
> ${libexecdir}/ipsec/.debug"
> +FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV}
> ${libdir}/ipsec/*.la"
> +FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
> +
> +CONFFILES_${PN} = "${sysconfdir}/*.conf ${sysconfdir}/ipsec.d/*.conf
> ${sysconfdir}/strongswan.d/*.conf"
> +
> +PACKAGES += "${PN}-plugins"
> +ALLOW_EMPTY_${PN}-plugins = "1"
> +
> +PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
> +NOAUTOPACKAGEDEBUG = "1"
> +
> +python split_strongswan_plugins () {
> +    sysconfdir = d.expand('${sysconfdir}/strongswan.d/charon')
> +    libdir = d.expand('${libdir}/ipsec/plugins')
> +    dbglibdir = os.path.join(libdir, '.debug')
> +
> +    def add_plugin_conf(f, pkg, file_regex, output_pattern, modulename):
> +        dvar = d.getVar('PKGD', True)
> +        oldfiles = d.getVar('CONFFILES_' + pkg, True)
> +        newfile = '/' + os.path.relpath(f, dvar)
> +
> +        if not oldfiles:
> +            d.setVar('CONFFILES_' + pkg, newfile)
> +        else:
> +            d.setVar('CONFFILES_' + pkg, oldfiles + " " + newfile)
> +
> +    split_packages = do_split_packages(d, libdir,
> 'libstrongswan-(.*)\.so', '${PN}-plugin-%s', 'strongSwan %s plugin',
> prepend=True)
> +    do_split_packages(d, sysconfdir, '(.*)\.conf', '${PN}-plugin-%s',
> 'strongSwan %s plugin', prepend=True, hook=add_plugin_conf)
> +
> +    split_dbg_packages = do_split_packages(d, dbglibdir,
> 'libstrongswan-(.*)\.so', '${PN}-plugin-%s-dbg', 'strongSwan %s plugin -
> Debugging files', prepend=True, extra_depends='${PN}-dbg')
> +    split_dev_packages = do_split_packages(d, libdir,
> 'libstrongswan-(.*)\.la', '${PN}-plugin-%s-dev', 'strongSwan %s plugin -
> Development files', prepend=True, extra_depends='${PN}-dev')
> +    split_staticdev_packages = do_split_packages(d, libdir,
> 'libstrongswan-(.*)\.a', '${PN}-plugin-%s-staticdev', 'strongSwan %s plugin
> - Development files (Static Libraries)', prepend=True, extra_depends='${PN}-
> staticdev')
> +
> +    if split_packages:
> +        pn = d.getVar('PN', True)
> +        d.setVar('RRECOMMENDS_' + pn + '-plugins', '
> '.join(split_packages))
> +        d.appendVar('RRECOMMENDS_' + pn + '-dbg', ' ' + '
> '.join(split_dbg_packages))
> +        d.appendVar('RRECOMMENDS_' + pn + '-dev', ' ' + '
> '.join(split_dev_packages))
> +        d.appendVar('RRECOMMENDS_' + pn + '-staticdev', ' ' + '
> '.join(split_staticdev_packages))
> +}
> +
> +PACKAGESPLITFUNCS_prepend = "split_strongswan_plugins "
> +
> +# Install some default plugins based on default strongSwan ./configure
> options
> +# See https://wiki.strongswan.org/projects/strongswan/wiki/Pluginlist
> +RDEPENDS_${PN} += "\
> +    ${PN}-plugin-aes \
> +    ${PN}-plugin-attr \
> +    ${PN}-plugin-cmac \
> +    ${PN}-plugin-constraints \
> +    ${PN}-plugin-des \
> +    ${PN}-plugin-dnskey \
> +    ${PN}-plugin-hmac \
> +    ${PN}-plugin-kernel-netlink \
> +    ${PN}-plugin-md5 \
> +    ${PN}-plugin-nonce \
> +    ${PN}-plugin-pem \
> +    ${PN}-plugin-pgp \
> +    ${PN}-plugin-pkcs1 \
> +    ${PN}-plugin-pkcs7 \
> +    ${PN}-plugin-pkcs8 \
> +    ${PN}-plugin-pkcs12 \
> +    ${PN}-plugin-pubkey \
> +    ${PN}-plugin-random \
> +    ${PN}-plugin-rc2 \
> +    ${PN}-plugin-resolve \
> +    ${PN}-plugin-revocation \
> +    ${PN}-plugin-sha1 \
> +    ${PN}-plugin-sha2 \
> +    ${PN}-plugin-socket-default \
> +    ${PN}-plugin-sshkey \
> +    ${PN}-plugin-updown \
> +    ${PN}-plugin-vici \
> +    ${PN}-plugin-x509 \
> +    ${PN}-plugin-xauth-generic \
> +    ${PN}-plugin-xcbc \
> +    "
>
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

