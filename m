Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D6C4E75446
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 12:19:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n5-v6so6465438wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0fiufNGwXfIBYNxBVU48rairedf1Ri8majBDKkK9gFc=;
	b=uLvh+OPyJpFbSmDs2WC2yYr8NCg8O+YUIRnZ47tw+ccsOWYXnODU2S6LRP/TLCJCAX
	6Ygw7s2cxAZJjLp4XWLACpeyncm84tdieCN0spbzycyk/GwbGhYD7ctsngmGe7dnwH6Y
	lrq9g29K7/ticVC+5huuUD/OPxAmYP3dudiP5q11O/HpM2alQ8KYS3Q/tM0U6R0i00yx
	vCa2WT59vD1LMb6MkNbGUyFaDYFF3TpCN8qOxE7G6B/+9MDEt2V1Kb3kteVGR99l2Jh3
	Yp+SnTFoCVxGkTeyQFFqDDY+MA6+OiSxkCMF17Aumv7dDpNedd/c1DSvPDjTR+5/SdYr
	qIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0fiufNGwXfIBYNxBVU48rairedf1Ri8majBDKkK9gFc=;
	b=MThCodIWyzV0hDcZHWhTKlGv5spQ+tKF8nRqDyQ5+E7KsZer+jPvl7mnglVu4gSz0f
	EIE0NEg4Ky7VKa4GKVhUPtDjUlPLIdFNSO3LmbjREyKxe7igKa2OhUXFyFiroHtrsGPu
	AiGS6AVb7KsqP2Fh/LdJ6VR1Wzihao7DftlcYlk6UsOyfqkHuPb1gd0QsBPGaNrRjEcj
	FM41naohvivupF/wGaWfeMhkn+O1CF3GdbIwmZOzz3QPkgB/mYI2meRz5sW/c/bK19bl
	5ZXDCFIxLx3+du8ehbkCKrJWMMKdU05Wwzi3UwJE32+SzGlRltBra0pwO7tV5zHg5C3Z
	ts/A==
X-Gm-Message-State: APt69E30MwmshuQxz+pNlB11BClQ2hgvFeXF937kmxFIhdD4RoMu0AiN
	QhSz3ALcTURGFaWUT9gqyAE=
X-Google-Smtp-Source: ADUXVKL9vslUSX4VDSg4sVJDR8i733hEJesrjl5qwTk+H2Dlonvx5Mi9+Lq2IJKOi6qJT25fD+Kp8A==
X-Received: by 2002:a1c:5c93:: with SMTP id
	q141-v6mr1517488wmb.77.1529497165386; 
	Wed, 20 Jun 2018 05:19:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a203-v6sm2921474wme.46.2018.06.20.05.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jun 2018 05:19:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jun 2018 14:19:27 +0200
To: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <20180620121927.GB3257@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
	<CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 20 Jun 2018 12:19:25 -0000
X-Groupsio-MsgNum: 72958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 02:57:39PM +0300, Samuli Piippo wrote:
> On 20 June 2018 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> > 3) we cannot use nobranch=3D1, because that breaks AUTOREV
>=20
> How does it break AUTOREV?
> We are using nobranch=3D1 when testing non-released Qt versions and
> haven't seen issues with it.

And are you using AUTOREV? How is it supposed to know which branch to
track?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWypGTwAKCRA3VSO3ZXaA
HOvoAKCYcGqLdCzsdctiOMYd2IAavUX/YwCfaUtvYvN7o94W90AB4acuWM955Zc=
=BPvx
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
