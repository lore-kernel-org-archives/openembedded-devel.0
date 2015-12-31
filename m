Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C18BC6057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 13:52:52 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so93703515wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 05:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2rvgqzr5MltSdAyzd7rx3ubntpc/KLmCsizn+vUCljg=;
	b=h/ImuzrWnNFFMa9ssoVjX3k6Ny5pXYZ9L1f53h+Qu0Vu6ul+qa3koQtl7UH5h8Tqts
	hmWeJ9b3Nv0kRnlJtmJ/nwPY1RTncICYFj71PMb1iRoHQHN02Duh2EjNsb/svHa+pMln
	X2kQWh2hfWufJzOAOUg6tNUFI/7CUwUK9xbB8ZAu0Zfiiw2yO8324vJKXHKz9X3NdKju
	EpigiuGSScYGrKa18C7oc6XTJuzoFh5kvP22eT/NTV5sp0V/i+VVSPKBQWpz3JYiIsK+
	cJjhNSBkDa2QooYg6FjCTjZ4WB9hgjmF1GF7JspnHYEN7pNjk73bAUP0ZRsSAs9ZKYDO
	ReKQ==
X-Received: by 10.194.79.201 with SMTP id l9mr84779443wjx.151.1451569972732;
	Thu, 31 Dec 2015 05:52:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m16sm61922449wmb.13.2015.12.31.05.52.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Dec 2015 05:52:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 31 Dec 2015 14:56:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151231135644.GA2255@jama>
References: <cover.1450888554.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1450888554.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH v2 00/54] Jentrho-next pull request
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
X-List-Received-Date: Thu, 31 Dec 2015 13:52:56 -0000
X-Groupsio-MsgNum: 59255
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 08:39:59AM -0800, Armin Kuster wrote:
> Please consider these changes for Jethro-next
>=20
> I dropped the netmap changes but add more.
>=20
>   mcelog: remove bashism and create ptest subpackage

mcelog is completely broken in jethro, because mcelog-inject is missing
there, I'll add:

commit 906cb0dcf0d40893849b5bd76189b119e9a6c7dc
Author: Kai Kang <kai.kang@windriver.com>
Date:   Fri Dec 4 15:09:15 2015 +0800

    mce-inject: add recipe
   =20
    Add recipe of mce-inject which is required to run mcelog ptest
cases.

to this patchset.

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaFKVIACgkQN1Ujt2V2gBxfcACgrQ2YRLQekONzr2x1JSQHeVqc
Y4MAn30p2V2X0H110z4kKFj/m03nzqtv
=nPYB
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
