Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 37C2E73306
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 12:08:51 +0000 (UTC)
Received: by wgez8 with SMTP id z8so67111561wge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=rJCFjm4+oa6dj3MB3HkbBYAZCCO7Mb9GszUslhN3CVY=;
	b=COdRRN2jMqtpTntdGF0mU05zP1WfCkzBZgK+rk7NWCxSyLPWuvNT0b4bolsII+DegF
	OLrpq8fAD6e2rX2o/TE3d7xMWL4KUFfGKwtfCk6mq+U+cDhWcPZjaDSPcSozB2rP1Xe/
	j8EC7eQPUpIt6FbulYJRR/MUTiaHnWtVT+UCo1vYDBjefkQU1QQ2bCACsbc0w+ba2wbO
	9cy3d6psxl8JiFI3UHg1Ipx80WteSDWM6/PydHllHcujeog5Lj6+H+uqXyclCIVZcCTp
	hrdojDHiKtZKt1AxsF7W6Wa4zYjvcZuyWw34N6EKgN+pqFOVjYWUZ1jBNILJ7PMLflf3
	xRHA==
X-Received: by 10.180.11.200 with SMTP id s8mr10747823wib.17.1434370132534;
	Mon, 15 Jun 2015 05:08:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id q4sm18660481wja.24.2015.06.15.05.08.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jun 2015 05:08:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Jun 2015 14:08:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150615120855.GA2398@jama>
References: <1433925884-25750-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1433925884-25750-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] php: fix native php when it is from sstate
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
X-List-Received-Date: Mon, 15 Jun 2015 12:08:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2015 at 04:44:44PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> the native php is used to install the target pear, and native php
> has hard-code path, so make wrapper to override the hard-code path
>=20
> the configuration format of pear.conf for native php is like:
> "type:path length:path", path will be replaced when populate sysroot
> setscene, but the path length is not changed, and make php unable to
> work, add a task to SSTATEPOSTINSTFUNCS to fix the path length

Use "class-native" instead of deprecated "virtclass-native".

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php_5.5.24.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes=
-devtools/php/php_5.5.24.bb
> index 3e656af..ced3904 100644
> --- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
> @@ -245,3 +245,21 @@ MODPHP_OLDPACKAGE =3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'apache2', 'modphp',
>  RPROVIDES_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
>  RREPLACES_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
>  RCONFLICTS_${PN}-modphp =3D "${MODPHP_OLDPACKAGE}"
> +
> +do_install_append_virtclass-native() {
> +    create_wrapper ${D}${bindir}/php \
> +        PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
> +}
> +
> +SSTATEPOSTINSTFUNCS_append_virtclass-native +=3D " php_sstate_postinst"
> +
> +php_sstate_postinst() {
> +    if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" ]
> +    then
> +        head -n1 ${sysconfdir}/pear.conf > ${sysconfdir}/pear.tmp.conf
> +        for p in `tail -n1  ${sysconfdir}/pear.conf | sed -s 's/;/ /g'`;=
 do
> +            echo $p | awk -F: 'BEGIN {OFS =3D ":"; ORS =3D ";"}{if(NF=3D=
=3D3){print $1, length($3)-2*match($3, /^"/), $3} else {print $0}}';
> +        done >> ${sysconfdir}/pear.tmp.conf
> +        mv -f ${sysconfdir}/pear.tmp.conf ${sysconfdir}/pear.conf
> +    fi
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

