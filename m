Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id F00727466F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 08:03:29 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id m13so8315726wrj.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iObd05Djf0/o9LFCOBeNeW42wLvFy96b6XtLuGzGtj0=;
	b=K7ktIpD01f7NPQg02qs55zkS2xZCzkmkA4xkVw4PiHybDnvCJsGtAQ06ApcOd/EnsO
	t9HbD6Fhqxl9ZQ+z0hYn1kI3tpqA6Xjr8F4INg0bOthEFaL50TF+ohGfkAsVTC5UrKp8
	xH1jX+c2iaz2unLP7HQtvIekxtpZgZCbdgbzcs5a+D7eaAI6RzWQvL5UCzBL1hkKvHs6
	V1mRpHJ4ZOPbTw9PV18GCyfeauR4ZQrDYLcmciB+vaWQl6XyjXIUGBJKzWwNyB7tFlWX
	BCxU5DcK2uXLEIPReYktYWakMqU0L/+CtzeTHSyDVN/t0Oh89wKYQHPFg5YHd/ZWnis+
	yTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iObd05Djf0/o9LFCOBeNeW42wLvFy96b6XtLuGzGtj0=;
	b=N+Lcrqr1MKhtKGdF9TBeuO4BHo7MdJnsshbtKOnz7aH8QuhwUJrDqYgNWlCILDODtx
	dUrS3qyupQC9oWGco0RrtkKT30T8BS3e5DHLLVYI1rKvgh/0JSZsVfSwDtqF3xZkhPSn
	Fqgo3kNjFIQkrkx17ArcyoGnWI2cvZdCf/mIFD2EyyPxprmIwtex2La8mQ6NEz59daKo
	d801L3bkSJt6A4A1TsWRMkJBF3+qsw8fAxiPyxziNvloWko6OTZBwWtX4lTRvX/xcNkF
	BTvLXTsVAKI+8JqTFyNf/4Pg2DxeOVWveF+5EMx/RY/gl0raS2ZBvPn1z7M5K/VSBxMk
	EwjQ==
X-Gm-Message-State: AElRT7G8JPjTI0ZT87/RG42MyPClcxC1CdHlORO8KcHhD6ocgrzvdy5U
	1aqD6dD/ECDGUkWYWFk5nkNPEg==
X-Google-Smtp-Source: AIpwx49Iblu0ba95K2w3xr8eJ7aMXfo3c+vOR7ibZKuaOhEHWOpYWr5/DB4sYJ9rbVrCfwKE3TBqqg==
X-Received: by 10.223.189.11 with SMTP id j11mr27296890wrh.49.1523261010554;
	Mon, 09 Apr 2018 01:03:30 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q14sm10917044wre.10.2018.04.09.01.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 01:03:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 Apr 2018 10:03:50 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180409080350.GA1348@jama>
References: <34fa43b4-67f5-5de1-effb-0caa473061d6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <34fa43b4-67f5-5de1-effb-0caa473061d6@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-03-19
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
X-List-Received-Date: Mon, 09 Apr 2018 08:03:30 -0000
X-Groupsio-MsgNum: 71736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2018 at 01:29:30PM -0700, akuster808 wrote:
> =3D=3D Failed tasks 2018-03-19 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.44 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20180321_040648.log
>=20
> =3D=3D=3D common (7) =3D=3D=3D
=2E..
>     * openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.15.bb:do_=
compile

This is caused by:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148894=
=2Ehtml

jenkins jobs config needs to be updated in:
https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#L279

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWsseZQAKCRA3VSO3ZXaA
HBqoAJ0V8HQ++P6BFUory0Azj6+P07AIsACeJ5pM13a4lyaGqWzIn2+aqAFrzJo=
=5MDJ
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
