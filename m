Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 42C6465E2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:00:29 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so3363218wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6oSbgQ1tSN1QJa7TXwqlqlSCBIMRyLChMK9zzSBL6AY=;
	b=PQLiP7vuQpGVHWiuoIUsSUeURL2Ba2xIWBcQXP7d+f/PMcaB2puSQUGyKE9iVEe/sM
	rWrz17JrZ3JpmOqYUOokTrZVsbcLEob000SOOXgrP39ZfaYMK+o520crUDo5hj2aDSDM
	5zrmENqNhS3sWybeOgHk+A7MC5o0J7YBbwlcE//PmXz5B8hnBgi5wvLHf/rVBMLY+fFK
	xcaOZuQG27SHkpf9qAWkmpcjmU7MGZYmF98VbR1Qpr+zkBHd20YcnJ/daN+dZkOHF9T0
	mBGghCrodOnq+FKvz6dIJ/P9fFwb1pXlPsu+9eDmvZL2GsLcsebaL4f4lLsM83QctYZ8
	04zA==
X-Received: by 10.194.205.132 with SMTP id lg4mr16077638wjc.80.1406232030481; 
	Thu, 24 Jul 2014 13:00:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a13sm18601715wjs.12.2014.07.24.13.00.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 13:00:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 22:00:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140724200018.GN2492@jama>
References: <53D1291D.2080903@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <53D1291D.2080903@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: mplayer blacklisted?
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
X-List-Received-Date: Thu, 24 Jul 2014 20:00:32 -0000
X-Groupsio-MsgNum: 51238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U5J2I87mWnf1KeOw"
Content-Disposition: inline

--U5J2I87mWnf1KeOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 09:41:17AM -0600, Gary Thomas wrote:
> I see that the latest mplayer2 recipe is blacklisted:
>    PNBLACKLIST[mplayer2] =3D "Requires newer libav which has negative D_P"
>=20
> What does this mean (I don't know what 'negative D_P' is)?

D_P =3D DEFAULT_PREFERENCE

> What needs to be done to make mplayer2 buildable again?

set P_V (PREFERRED_VERSION) for libav and set empty PNBLACKLIST[mplayer2]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U5J2I87mWnf1KeOw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPRZe8ACgkQN1Ujt2V2gBwanwCfX/mdPpXgCD0Ig2oRP0urwu4Z
0moAoLU+8PL2RC1HyqydDOZM87n1gEU+
=yZcU
-----END PGP SIGNATURE-----

--U5J2I87mWnf1KeOw--
