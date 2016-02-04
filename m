Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4B78B73190
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:04:40 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so11385456wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tUUkmmCeSFZgb1DSVHFJJtiCIBj458DZFnwZHMRz9Qk=;
	b=poiPqX1wDxXYJ2xdC3ja55AqLcwyi1AhujPiE+St93qo3RoLTjfoV54CMe2pQGbcgz
	8wUHCvUvhdW7URaUktZZj3BAxbmK/CriCfHBhhXH/tyI0KwNZrAhZlXDBics+ChK1iue
	1MJjb5CxzoCmrLdx6B7GOzdgd4T2zL0CxIqX1G+OHgI1+L1L7MNhDvvHcORLY5Mqpp5s
	IRIWasDiSUu27vIMBY1dBD6oxTIUBLLOgGtm2T73hO79kiEcZWM3lGU6FqBO8DclG7Cz
	RfsrgtxhiDK/DsKk+RI3p1tItDFEycAsOkl1EkViN0tPbcjbooLRcyeuIepl5p4jxuFj
	0uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=tUUkmmCeSFZgb1DSVHFJJtiCIBj458DZFnwZHMRz9Qk=;
	b=etpSA5r9xZGqEMkd39iACMSJDt+UeDpahwUfw+lvaGcIBhZVmjy4K51h+IDOnhLFj7
	ouGzkEkxaxKXzgc2VDP03NaDfMF4KF2ipRNsXy0ScQ8a3KvGvtlqxoGn0Diq9vKXfkYQ
	QLuLAMZVRCo2bDzZ/hTA1lAFNU+q2RHj7Q/lVQJzS7ObWvNK1sp4RYC3oggW3mgBgimS
	8acID55lXwpy3DQFbN3ET3/s8/s0gnmdYNn+1jumbyUGID5b7SHIZBR3YJ/Ci03wpGiV
	W2EfoPhETGydHvOTy4H2CDpwXHx2YYV3bYRLyYUPMLprA/u2WHAD5A+XLjbSsHCW0g+Y
	ywxw==
X-Gm-Message-State: AG10YORu2j3Zgs+vKpxTYF9bYT6WKbvEvqpPhI8FXrmJo5UFGR8QW4KojwaTx4Hu/nkaZg==
X-Received: by 10.195.12.45 with SMTP id en13mr8430770wjd.99.1454601881282;
	Thu, 04 Feb 2016 08:04:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb9sm11913865wjb.26.2016.02.04.08.04.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Feb 2016 08:04:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Feb 2016 17:07:59 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160204160759.GA2573@jama>
References: <1454598513-29263-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1454598513-29263-1-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] ntp: remove empty libexecdir to prevent potential QA issues
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
X-List-Received-Date: Thu, 04 Feb 2016 16:04:41 -0000
X-Groupsio-MsgNum: 59841
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 10:08:33AM -0500, Mark Asselstine wrote:
> Depending on the configuration used to build ntp it is possible to
> have an empty libexecdir. This can cause QA issues. Add a test at the
> end of install() to remove libexecdir if it is empty, thus avoiding
> the possibility of QA issues, regardless of configuration.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.8p4.bb
> index f9f900e..cb09e77 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> @@ -94,6 +94,9 @@ do_install_append() {
> =20
>      install -d ${D}${systemd_unitdir}/ntp-units.d
>      install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-unit=
s.d/60-ntpd.list
> +
> +    # Remove an empty libexecdir.
> +    [ ! "$(ls -A ${D}${libexecdir})" ] && rm -r ${D}${libexecdir}

Isn't this the same as:

rmdir --ignore-fail-on-non-empty ${D}${libexecdir}

?

>  }
> =20
>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlazd14ACgkQN1Ujt2V2gByQawCgo7z4jxKgbbpNZBSS01YQ6mGE
gm4AnA0uzJx8w/cOEBIqdjeeuSa00a8C
=AnzU
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
