Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBD36FF69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:45:43 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l124so10450061wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=q+8yL+R7JVbgIiiJSm7SQUSpX4CHtuRpJNr5n8o7JnY=;
	b=LBDVb2OT5NOULozCSvs7wmP4WuAL5l8epNZpv46oBydZEH0wdBbE3Q+co0uzINxabe
	SYeawk5EP2v2NAzx+SvjmSc0hghHqoTSthgiwF8R7hNpKKPXi2M1ZCVRgzE4SOuP17Y9
	1aAP0PmeKz6OhwIhUcyu7QLYcuI5qGa5SOtaAYsURM+QZlcBulgW5Tc3GxTzuRQ1mrIy
	J+UDVU2JPqGseykeU/MN9S6j7oafDK/Bf9CUiFzX9qfjFg2DwPLuFagUQ/NbioR/1N4R
	lhGEryeBIIajD752P5X4QD38RSAYT5W+lTDOf0J2LGA5nM+Ogr+1+XvL1icAfuyj7mhp
	sXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=q+8yL+R7JVbgIiiJSm7SQUSpX4CHtuRpJNr5n8o7JnY=;
	b=fP4iZjF6V2F0DP4JSeUdx6vQxgydsOi6P+bPIO3rbKbF8CiItCOKzTk4ivj5BrmfYY
	FJdCvRu6tRRvPpEcIOvzKTcGPcwgRvSrKSiyhCUvpMsvwUPKdsSVYuzXGSbXF0Zk1cQN
	Up8pEUZTJsaVnDGaqbLT0LmV+9PB+SOMPuBnzrJFT5lFvAksslkLJzsI6FvI1kJRC18Z
	0Xps/v+ItQCgKvI+CKMBdIxxubMJA/n64RQZ7HDWnpzi+W8QMI8Ajq86L/jue+xBmVn0
	mIOlKvlRh8yCNx91g6thuLpYIFQmxX1F0Tf19qEG8qdS0cKHvLYBuVYFzRyjFRZJej6K
	m9cw==
X-Gm-Message-State: AD7BkJInN6IV09sjMBtxW8+cELjHV4knNcPJFX9r9inu9EI2LIGYj4mOCo7nZQURlxnfTQ==
X-Received: by 10.28.136.19 with SMTP id k19mr12465489wmd.11.1458251143755;
	Thu, 17 Mar 2016 14:45:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 8sm32113661wmk.13.2016.03.17.14.45.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:45:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 22:49:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160317214927.GK2553@jama>
References: <20160309195049.GJ2542@jama>
MIME-Version: 1.0
In-Reply-To: <20160309195049.GJ2542@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com
Subject: Re: python-cryptography failing to build since openssl upgrade
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
X-List-Received-Date: Thu, 17 Mar 2016 21:45:43 -0000
X-Groupsio-MsgNum: 60556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline

--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 08:50:49PM +0100, Martin Jansa wrote:
> Do we really need to use that version script for openssl?
>=20
> Here is another failure:
> http://errors.yoctoproject.org/Errors/Details/54984/
>=20
> in our local builds we use couple prebuild binaries from 3rdparty, which
> now aren't compatible with openssl ABI (possibly because of
> version-script update:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/1184=
33.html
> )

Still failing:
http://errors.yoctoproject.org/Errors/Details/56595/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbrJmYACgkQN1Ujt2V2gBzHGgCcDciCq2jGw5I0a6YywxrLWcwK
U34AoLmXrkszcxOGob6r5yEbUTY/7xzI
=6SiR
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--
