Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7B062134
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 10:01:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m124so4610768wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xeSDGB74k4SVrco9PeLuvE2pZUqCkGBc1e8BbF4D1WI=;
	b=RJg8+Nb8q/an30camabLwsRXg1Tl5gpqd79ECHNyPSgzASC4GkOw9G3FLbTZw6BP8K
	WqBQuyio6HCkaFqkbvGzXNdYkeonojj73wGUbw5ATGi7GuVq/pjny/4B6upk29yrLW4G
	9LIVfzh/bB7IpnlGfD6MbwKNn1zIUEvEjmaNXfyGIMH2fVXURASVR4YACVFfmHrgacM5
	Wfq79R0FoB9OXYPcrK7hpan1x8NxCXSboUYFvDDbk6aO1RHI830/W/ThewRc+dW9Fria
	Ei+CJNhfvMyQnYVVIpI9fazgcrt3E8Evs6za36YutU7Le9BuxU//vkcRO2plZi4nZWLq
	Pw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xeSDGB74k4SVrco9PeLuvE2pZUqCkGBc1e8BbF4D1WI=;
	b=YcZWwxMY78VcWJ05ZueQv8a6oHC1W9UMLSNSfQt4bwDHzByuRa5Jw25l4aqU9qd74f
	4eZwG0//BlfNjcqQm0dfbSjX56NCu0p6b8kGm8ZtWGkHsbiYwBo6zw3zZSfHLzkYNeVp
	k+SaSvElU13lLTo+CKUy956MCjj0F/weq0v52h1vJrdlIBvipDAvVHDrBCb7nNX7qimM
	MxwtaHOMdK55nYh5AHMJbl1EnrPdRU7p5lgQMXMHW1VNWOIKF2YA/60ckxOxvTo1gA1J
	fo6mrGMl9Xt/cT3adYmovTDwoSnKbsYY8N7yWOetvJQbNroFfdNtJud9AsmI6WZVoiNF
	nYug==
X-Gm-Message-State: ALyK8tLOPbuDHYce8zLAPAycOuGeGsh27memHwXTrMCgZ6yVIg+oty1AjW7SS+HHhFYMNA==
X-Received: by 10.28.215.148 with SMTP id o142mr8813835wmg.72.1465984915155;
	Wed, 15 Jun 2016 03:01:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r129sm8798755wmr.20.2016.06.15.03.01.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Jun 2016 03:01:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Jun 2016 12:02:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160615100218.GA2569@jama>
References: <1465982612-45997-1-git-send-email-j.remmet@phytec.de>
MIME-Version: 1.0
In-Reply-To: <1465982612-45997-1-git-send-email-j.remmet@phytec.de>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH] rootfs-postcommands: generate /var/lib/systemd/clock
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
X-List-Received-Date: Wed, 15 Jun 2016 10:01:58 -0000
X-Groupsio-MsgNum: 61833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 11:23:32AM +0200, Jan Remmet wrote:
> systemd timesyncd check /var/lib/systemd/clock instead of
> /etc/timestamp.
> If this file is missing it defaults to TIME_EPOCH. It's set while
> configuring systemd.

Wrong ML, re-send to openembedded-core
>=20
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
> index db8b551..0c7b764 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -234,6 +234,12 @@ python write_image_manifest () {
>  # sane default time setting
>  rootfs_update_timestamp () {
>  	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
> +
> +	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", =
d)}; then
> +		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
> +		TS=3D$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
> +		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
> +	fi
>  }
> =20
>  # Prevent X from being started
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

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldhJ6kACgkQN1Ujt2V2gBxHvgCglTMYdI5Eiz2I5+G2lA2+hlhg
/ZgAn0cNROXm31yPtF8rD9+iWjl3K1f3
=H3YM
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
