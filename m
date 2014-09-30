Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 64DF86FC68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 00:29:45 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q59so2866655wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XXZgRaFlTXsb3taKgYIJng5XdOfZi1qt58DBD7F13d0=;
	b=w6MJVMyaYwd0P9FJRSkN2t3t6yahCeme7sx1qGRMbIbSk0EUKQKp73cPOdQ3cN82Qt
	a//Cy7vpdrnSLk8si/RAMKr1HaeCwOhqjgm6tIHUrv6Pe847h0r6r6NR75IzMM7BaNgp
	9BmNiSSl36DKU96l9c2AogXd6WiNfChV3oUVqElDMItN54a8kWeO+YjdS8gs0MTst1ss
	tO25+4nwRX5fLzc2coxZPLNG7CXX9LV3+9jZhJTbeXmJ2/kvJjRqxEq164yd5gZnxUbq
	GLPh9V1HIeJTOjXaVUxwN8at3QONrVvDXe8hWd8c/NXf0HU/9vMMR8GYxQnoblqtkLDO
	0/yQ==
X-Received: by 10.194.108.99 with SMTP id hj3mr47871520wjb.32.1412036985969;
	Mon, 29 Sep 2014 17:29:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eg8sm13300432wib.15.2014.09.29.17.29.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 17:29:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Sep 2014 02:30:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140930003037.GW25706@jama>
References: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] openldap: update version to 2.4.39
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
X-List-Received-Date: Tue, 30 Sep 2014 00:29:52 -0000
X-Groupsio-MsgNum: 52284
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SvF6CGw9fzJC4Rcx"
Content-Disposition: inline

--SvF6CGw9fzJC4Rcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 06:09:10AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changed:
>  * Move slapd from ${libexecdir} to ${sbin}:
>    Installing slapd under ${sbin} is more FHS and LSB compliance
>  * Manage init script by inheriting update-rc.d, than postinst
>  * Add status for initscript
>  * Rename the patch named with commit id to
>    gnutls-Avoid-use-of-deprecated-function.patch
>  * Add a patch for CVE-2013-4449
>  * Add a patch to use /dev/urandom for entropy
>  * Allow tls obtains random bits from /dev/urandom:
>    The URANDOM_DEVICE is undefined for cross-compiling, define it as
>    /dev/urandom to allow tls obtains random bits from /dev/urandom.
>  * Add PACKAGECONFIG for mdb, ndb, relay and sock
>  * Remove unsupported config for ldbm
>  * Add license file

Can you please resolve:
WARNING: QA Issue: openldap: Files/directories were installed but not
shipped
  /run [installed-vs-shipped]

--SvF6CGw9fzJC4Rcx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQp+a0ACgkQN1Ujt2V2gBz+BwCgkmkKJNaVE208lA5Y4SV6ktxg
A1EAoK9qYKs6By4At37QNZiJjrNVHKmp
=Jql+
-----END PGP SIGNATURE-----

--SvF6CGw9fzJC4Rcx--
