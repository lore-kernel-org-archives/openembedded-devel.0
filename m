Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id A09386066A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 14:34:06 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so818161eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8iEBINvMWLSTvsOBiMgoBCOIyhmiNZ2FOj71Izh6V3o=;
	b=jH6e81Dmd/QRb1/ZWi9UwQMTg/BkQ6Tb1hV18Z9D0aB3Urz5PcpRMw/zRsiDceUA4l
	uv5gUS7yayyMafXC7ejAdLntQyhlDrHkkeTjsQuFkjaAaqJ7MqH7mshCxNLjFFSQ7VZM
	8k5kcK7pMAUdNI5KPKyB/wfiUBgxxuDaVsPr3MiDoF0eCZRD0CRKVlZcf687ZSXMxUh6
	ErQiCAG3H3UoKzkuZ2DJ5lp9jTPLcnmZsTXf9csQ/GbwEuRI7h2bkxZ6peZ8E29doKQ8
	aB/+0wK5qbkaSf02OxYCAw6XDH7fq3wqlrdJiU2eNtV0MN+JlnynLfZ/H7/TKXh+8kNi
	UgQw==
X-Received: by 10.14.203.67 with SMTP id e43mr9630696eeo.132.1375540446545;
	Sat, 03 Aug 2013 07:34:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x3sm19199968eeu.1.2013.08.03.07.34.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 07:34:05 -0700 (PDT)
Date: Sat, 3 Aug 2013 16:34:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130803143444.GZ3280@jama>
References: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
	<1375535352-23015-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1375535352-23015-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH 3/4] efl: drop .inc and _svn.bb files for libs included in efl.git
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
X-List-Received-Date: Sat, 03 Aug 2013 14:34:07 -0000
X-Groupsio-MsgNum: 45565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huLXOlJ1ghGp/P5+"
Content-Disposition: inline

--huLXOlJ1ghGp/P5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 03, 2013 at 03:09:11PM +0200, Martin Jansa wrote:
> * in preparation for merged source dir in efl.git I don't plan to support=
 newer SRCREVs from subversion
> * drop INC_PR and fold lib.inc into the recipe
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/efl/ecore.inc                 | 114 --------
>  ...75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch | 287 +++++++++++++++=
++++++

This file doesn't belong here, fixed in jansa/in-test branch.

All 4 patches need a bit more testing in runtime, you can consider them
as RFC.

Cheers,

--huLXOlJ1ghGp/P5+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH9FQQACgkQN1Ujt2V2gBzyngCgpmWkRHVoVuE+feRo2EavAej2
J38AnR7KxbucuQhrSUnpdRVQxcJ07Hug
=B8XT
-----END PGP SIGNATURE-----

--huLXOlJ1ghGp/P5+--
