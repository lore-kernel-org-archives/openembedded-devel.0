Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 39914737E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 15:58:29 +0000 (UTC)
Received: by widex7 with SMTP id ex7so1211785wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2kAeQ7lbiDB34pGZULTvhkI7XbqNFvMqnVs5WhSlgcQ=;
	b=mjiaui6fk9py5LFAeWJka2ZVmcSDb5dEAVOa65FK9F0VS6qwBhaIuNYDgUgz/jfbCB
	/SieGaxVXosTRN4EHwh9ljciOyhSx1w7z26CLnXsiSGCilZE6l/tAaIecTM7GKUr//80
	cnd6J7LWR7Z/DZicreEB7hPTkp2U9xaAqrRfzjmOxLavJTLYI0vtipkoJTWgyIR0Sxhq
	rjNs44GWVBXhhjAPoJ1w35VbG7ji2GuTkeJYpQZNsJOEI4nsF3A1Jg/17QgixUcxkite
	AS8h98OSouhJ6BWyU7hEArin+R3b18lkVO8k4kbDS6EQX8zfxKjWl1E5ubsX9HkJY/lu
	B/GA==
X-Received: by 10.180.211.45 with SMTP id mz13mr7850861wic.20.1425052710420;
	Fri, 27 Feb 2015 07:58:30 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dm6sm3354639wib.22.2015.02.27.07.58.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 07:58:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 16:58:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227155848.GO2309@jama>
References: <4018372.oWEBFrtGCE@fridolin> <20150227144201.GN2309@jama>
	<1924700.0Y3Fg92bfb@fridolin>
MIME-Version: 1.0
In-Reply-To: <1924700.0Y3Fg92bfb@fridolin>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] recipes: upgrade from 5.4.0 to 5.4.1
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
X-List-Received-Date: Fri, 27 Feb 2015 15:58:32 -0000
X-Groupsio-MsgNum: 54539
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DITGHUV3p5DjDsXt"
Content-Disposition: inline

--DITGHUV3p5DjDsXt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 04:14:19PM +0100, Stephan Binner wrote:
> On Friday 27 February 2015 15:42:01 Martin Jansa wrote:
>=20
> > I've fixed these issues in separate commit in meta-qt5/master-next and
>=20
> Thanks.
>=20
> > - please confirm that you agree with SOB line.
>=20
> Sure I do. :-)
>=20
> Today I noticed that qtwebengine doesn't compile if qtbase is not built w=
ith
> "accessibility" (which I usually have defined via some qtbase*.bbappend).
>=20
> The situation was the same with 5.4.0 - not sure if it's worth the effort
> to patch qtwebengine to be able to compile without accessibility though.

It's the same with qtwebkit, I'll just mention qtwebengine in
qtbase.inc.

Thanks for letting me know.

>=20
> Regards,
> Stephan
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DITGHUV3p5DjDsXt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwlDgACgkQN1Ujt2V2gByRngCfbiaDheYM0EjFUVMtD/vnBvCZ
RaQAmgJj+kfkr6wj31RLjgnjtIc5JynW
=dBKJ
-----END PGP SIGNATURE-----

--DITGHUV3p5DjDsXt--
