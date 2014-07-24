Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 815FF707A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:08:20 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so2550053wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SEhKSPw0M2+M/bGzZG/8Ijsd8BhRP84SWF7pPmRNd+w=;
	b=q7dGyCJnk9zCxNm6tcQOqP4aI8wcmxJDVX1OBSY2KFvbTdeQ3xAuGOp0tV0g1mNK0a
	jRj4n1bFTnwgV7orIETX50zWp5JeWI5wmy2NmAaEN062vZOPMGVU6vUYn4Xe2d9hiqAm
	5AJM5w6T0RTycj1Yg04IiTlbKyK7X49VG98xPnKVIkdTZoiGZTV5jfSdi6nUU5+DG+Jc
	ILP8dSaMYbTYcELoDSGYRaQxv9YyQBuEvG1yjK14puMS6cFvVPjueTFgA5do7J0xCYKU
	ZpDReUGwdWQ2A1j4/cTtiuOSbHYPVH7h4zaiBKLGqUOVOSn6jN0s4+n/OVUx+7cY6Zfc
	yMeQ==
X-Received: by 10.194.191.162 with SMTP id gz2mr11562253wjc.89.1406203698488; 
	Thu, 24 Jul 2014 05:08:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm22256899wij.24.2014.07.24.05.08.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 05:08:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 14:08:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140724120834.GK2492@jama>
References: <53D0F38E.2040209@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <53D0F38E.2040209@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: git directory in WORKDIR question
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
X-List-Received-Date: Thu, 24 Jul 2014 12:08:24 -0000
X-Groupsio-MsgNum: 51232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8m/hfNLtAhX2NvnO"
Content-Disposition: inline

--8m/hfNLtAhX2NvnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 01:52:46PM +0200, Carlos Rafael Giani wrote:
> Hello,
>=20
> When I use a git:// URL in SRC_URI , that git repository is cloned over=
=20
> to the WORKDIR , and ends up in a directory called "git".
> In other words, the sources are at $WORKDIR/git .
>=20
> Can I instruct OE to use another name? Like, $WORKDIR/my_name instead of=
=20
> $WORKDIR/git ?

yes, destsuffix param in SRC_URI.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8m/hfNLtAhX2NvnO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQ90IACgkQN1Ujt2V2gBwe7gCfZLj5SeAfWzYAp2+wVIWd4oZ+
flcAn1bc7DDn7kBTqJqzpzF/2hFH2YFz
=tUxZ
-----END PGP SIGNATURE-----

--8m/hfNLtAhX2NvnO--
