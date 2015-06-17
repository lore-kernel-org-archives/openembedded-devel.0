Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 43012758F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 20:36:16 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so3403864wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y7EYwvRrYh5Il3wwunkziPhS6YQsTmQpYD58eszRRz0=;
	b=jYM2zcOueynSYtX9zMyqihcap9xpq9eRF7xsYWt4jKosEXUOAp8Cw8mNfXF9YZ9X2y
	ZeaKkyLm8LiGF04GS95nlqv45tmFyVUSjy/o4SxGVDe45ME3BeBPK0Lf4iTyMCAns0yY
	rSqpevpwqNMl92aCLKcSa+v9KPdYr56yuNTJ/iHBFEWzaueZMVMa17dSpKm4a/L7mG5G
	9cB+6+u43ajcsaqojLVN1U1Ja4lskPDAgVuVWRHokL/wqJdh6dmAhF/Ej2aC92th5xID
	MXv61klWcjTRJhyjQph1UzSbDh9PEFtOCN5NLjHIa5l9ea2egIrm2x01JE5jCfBi/cCc
	Lwjg==
X-Received: by 10.180.108.142 with SMTP id hk14mr21095168wib.5.1434573377590; 
	Wed, 17 Jun 2015 13:36:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm9487860wif.3.2015.06.17.13.36.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 13:36:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Jun 2015 22:36:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150617203632.GA2390@jama>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
	<1434527353-47017-8-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434527353-47017-8-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 7/7] samba: upgrade to 4.1.12
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
X-List-Received-Date: Wed, 17 Jun 2015 20:36:19 -0000
X-Groupsio-MsgNum: 55955
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2015 at 03:49:13PM +0800, Bian Naimeng wrote:
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>=20
> git send-email will catch error as below
>  fatal: 0002-samba-upgrade-to-4.1.12.patch: 965: patch contains a line lo=
nger than 998 characters
>=20
> So, please get patch from
> https://github.com/bendaaron/meta-oe-dev/commit/47678ed346a1ce347a64705c7=
6df09d4fa537b0e

I've cherry-picked first 6 patches from here, but this last one fails to
apply, because you're removing samba 3.6.24, but in master we have 3.6.25
since this commit merged more than month ago:

commit 9ac5713b2fcb5ce03693edd40636d8fce3e014d0
Author:     Roy Li <rongqing.li@windriver.com>
AuthorDate: Wed Apr 29 17:25:02 2015 +0800
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon May 11 10:27:28 2015 +0200

    samba: upgrade to 3.6.25

Also this patch only removes 3.6.24, but doesn't add 4.1.12.

Please rebase to latest master and fix the last commit.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWB2k8ACgkQN1Ujt2V2gBzZ/ACgkPgaKhzdbMyEoYFW0c0JZ2zo
LJUAoLdFfOIF5VxsMt7bOYLzdfcobofp
=YJxf
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
