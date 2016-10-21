Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5DF71DA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 17:12:40 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e6so59867512pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4Z9OfHJ71ELopPBiUNCu9drX+yOYMPmR8dVIRlc1cp8=;
	b=FTsRdNC828BuIrovC8sLGGN80Ll300RfVv/P68Ul7W7cs3eTx32rKF5G+MuCLvTGVn
	5q4aj2pTnTcWoabYKcKqSbN5DVMQ+T3ZXY3SFgcNmXSqt8Ks0Q/wqXUaqH7OaEuoUWJZ
	4QPMl7pgrBvP660pBFf7I/tJe9deWHhSSWfPoJGJqH0DIUCabHQq0gqWBYn6kyz+cmRa
	PjieAVBvWq7XwesAY/4rcafp8++nU+R+XmY1Kceo7y2pYnZf9u9ftvQLSK+BnvKPjhvr
	LMf6880aXE++jnqQJMWZIZDAus80A+fk90YW22CVuqzayN/FnzB2OSqThhcX/TnpTkiQ
	EWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4Z9OfHJ71ELopPBiUNCu9drX+yOYMPmR8dVIRlc1cp8=;
	b=ITOCnuzxcYpzxZdmnE+CrlAs57nMJyKKYDOfbcavjhnjWt3agntGLm++QEEPiz1u/e
	2AJQOkpsyZiCCkVT21tdy9nFhxZvb2Q9uA+MztmhZE5TB2LMmgSdXZgPR3dicDZyIsNl
	/fD3CUJpGNe3iOkOZvtXYxZ6PuR8tvGa2dsRIl6JPpmlP5lAmHE7+3Ntfjd7UEKXR8BV
	WHMjI5WjilskZJJhF7pDHY45o/Q3KqDSqDx7eadng+hclIPIn59xDBIDaIpjRh1EYKm2
	mDUv18xd7gHt+vyoYcLY0utbXEzTRLAdy6uvQqdHP8FtpAl3/AwCTwPnNKs247PZXQLd
	zJiw==
X-Gm-Message-State: ABUngvflTrFGgKMo/Kld+nMs//RPY38mSku29RiVdGeG5rZh2PqoH349wZ04rjbrFxRklg==
X-Received: by 10.98.21.138 with SMTP id 132mr3441607pfv.38.1477069961881;
	Fri, 21 Oct 2016 10:12:41 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o75sm6555915pfi.25.2016.10.21.10.12.41
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Oct 2016 10:12:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1477033819-18461-1-git-send-email-koen.kooi@linaro.org>
Date: Fri, 21 Oct 2016 10:12:40 -0700
Message-Id: <99A3A30C-D999-4428-94F6-68F81B3CA3CE@gmail.com>
References: <1477033819-18461-1-git-send-email-koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] android-tools: fix native build
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
X-List-Received-Date: Fri, 21 Oct 2016 17:12:40 -0000
X-Groupsio-MsgNum: 63560
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9345B367-5498-464F-B3FF-D6C668B16C0B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9345B367-5498-464F-B3FF-D6C668B16C0B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 21, 2016, at 12:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>=20
> +# Find libbsd headers during native builds
> +CC_append_class-native =3D " -I${STAGING_INCDIR}"
> +CC_append_class-nativesdk =3D " -I${STAGING_INCDIR}"
> +

is CC the only option to be tweaked ? can it be done via CFLAGS or =
BUILD_CFLAGS
and BUILDSDK_CFLAGS

--Apple-Mail=_9345B367-5498-464F-B3FF-D6C668B16C0B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgKTIgACgkQuwUzVZGdMxRwsQCePiLwmtEMaDepVul/8+vqJMq8
xEMAn20ZW2GR7GjYk4SrvGDVJ82iu/Xr
=V3Xs
-----END PGP SIGNATURE-----

--Apple-Mail=_9345B367-5498-464F-B3FF-D6C668B16C0B--
