Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C45446E76C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:31:10 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so4818569eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+3nnvqpI1UFj134WiHsK3aEoIPL0eBU5R/7xJBlY3wM=;
	b=eOzPL2QIkKLLON75F2VJrssMwm3Xk8T12HerJ1+2DWMIzUBt7rNA3w40RkkGZt9ryV
	4kVlm6M0ZKfzDufSeWhnYvVwivny2JgJbjZsLtOuJjcylDV9z0qdnNP+eQYDqpQJqN87
	P+hqcGEAjVidkznjK67bq+9gZudukOWl5cL5LqLcd0CiQ6jgyxijDRpN/iLgBZTDiB06
	y47vybLq2vtIQ8Jjf6DCL50K02bWHdnPbdelQQoVBySkCyHUdRe5B/w5rqJ+3l6R9MQ6
	hgVcDEnrcPuddCSGf7ro1x9YHdPVa9oqCFw+4RT2Xl+no2YNE9CntvJwnLd1H1Bu7mnh
	YURw==
X-Received: by 10.14.4.67 with SMTP id 43mr994050eei.70.1390390271511;
	Wed, 22 Jan 2014 03:31:11 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w4sm26046049eef.20.2014.01.22.03.31.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 03:31:10 -0800 (PST)
Date: Wed, 22 Jan 2014 12:31:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140122113111.GS4100@jama>
References: <1390376858-17416-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1390376858-17416-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] ntp: fix perl path in scripts
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
X-List-Received-Date: Wed, 22 Jan 2014 11:31:11 -0000
X-Groupsio-MsgNum: 47853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aJ74fq0Y6SrIeKCM"
Content-Disposition: inline

--aJ74fq0Y6SrIeKCM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 03:47:38PM +0800, Kai Kang wrote:
> Scripts ntptrace and ntp-wait use /bin/perl directly that cause
> ntp-utils depends on /bin/perl but no package provides it. It should use
> '${USRBINPATH}/env perl'.

Next time please add [meta-networking] tag, but it's already in right
patchwork bundle so that you don't need to resend it.

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 9ea24e9..8ada604 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -54,6 +54,8 @@ do_install_append() {
>      sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}=
${bindir}/ntpdate-sync
>      sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd $=
{D}${bindir}/ntpdate-sync
>      sed -i 's!^PATH=3D.*!PATH=3D${base_sbindir}:${base_bindir}:${sbindir=
}:${bindir}!' ${D}${bindir}/ntpdate-sync
> +    sed -i '1s!/bin/perl!${USRBINPATH}/env perl!' ${D}${sbindir}/ntptrace
> +    sed -i '1s!/bin/perl!${USRBINPATH}/env perl!' ${D}${sbindir}/ntp-wait
> =20
>      install -d ${D}/${sysconfdir}/default
>      install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/=
ntpdate
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aJ74fq0Y6SrIeKCM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLfq/8ACgkQN1Ujt2V2gBxTZgCfXmTcuIzzxqH9J9kZjlxY49mH
d70An0NSAqnRPvjFBJ+QovlRDJJA5FyK
=yxGJ
-----END PGP SIGNATURE-----

--aJ74fq0Y6SrIeKCM--
