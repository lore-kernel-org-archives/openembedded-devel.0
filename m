Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 366D170016
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:53:30 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so32420420wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 05:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tCDsEgxCfn9KXYR6ZU7PbxgflnG/n0Dn6+3Ku56EULQ=;
	b=oX3jqOcrt+fsE1vS6K34q2ibXIB1em1Q7tUanHSkv6oSzZgM+DH7QEgu4XwYf/CKW6
	P4nLiPfw7w+p1fhNE1wAkom29TJRaPncoX1xCKrML7T0Iu3l1LEmaYwIp5hZHO4DHIxb
	69UMRBpu/bD2murPrdNIbLey6O9vZrlN2yLgYFQX8nWToqsP7Uei8KoD3htOost+Z0fu
	b9LU9Rbb051ZlAGYECxmYJLGQ5oi4lVpAwdMdZ/1Rf+HySmFkYT27/ig1oMQMNrGx4qk
	bjtngdE2VqvruidY9sUa3DnfWL27IpP3Em0YAPsymgme1nL5NRBNqzOl7lH5CFqjkJ9M
	NsSw==
X-Received: by 10.194.19.100 with SMTP id d4mr20212483wje.18.1449842011077;
	Fri, 11 Dec 2015 05:53:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jo6sm17065645wjb.48.2015.12.11.05.53.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 05:53:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Dec 2015 14:55:21 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151211135521.GB2248@jama>
References: <cover.1448012203.git.liezhi.yang@windriver.com>
	<b32062fe5fc0dc3c7124a9957693964fa99e7693.1448012203.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <b32062fe5fc0dc3c7124a9957693964fa99e7693.1448012203.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 5/7] ctdb: RDEPENDS on bash
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
X-List-Received-Date: Fri, 11 Dec 2015 13:53:31 -0000
X-Groupsio-MsgNum: 58973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline

--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 02:05:12AM -0800, Robert Yang wrote:
> Fixed:
> ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/=
bash, but no providers found in its RDEPENDS [file-rdeps]

There is patch for this from kergoth already.

>=20
> And really bashisms there:
> $ checkbashisms usr/bin/onnode
> possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/=
bin/onnode line 186 (<<< here string):
>         done <<<"$ctdb_status_output"
> possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/=
bin/onnode line 250 (<<< here string):
>     done <<<"$out"
> possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/=
bin/onnode line 284 (${parm/?/pat[/str]}):
>                 echo "${all_nodes//#DEAD/}"
> possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/=
bin/onnode line 337 (${parm/?/pat[/str]}):
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-ne=
tworking/recipes-support/ctdb/ctdb_2.5.1.bb
> index 3731efd..70bdfb1 100644
> --- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
> +++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
> @@ -27,6 +27,7 @@ inherit autotools-brokensep pkgconfig systemd
>  PARALLEL_MAKE =3D ""
> =20
>  DEPENDS +=3D "popt libtevent talloc"
> +RDEPENDS_${PN} +=3D "bash"
> =20
>  do_configure() {
>      oe_runconf
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZq1cgACgkQN1Ujt2V2gBxdawCfV7iZcxc6SpLvSyGT7xMJDtUa
4rMAoJzpbi/mGeEvDk5YSjUgfOd5qv1z
=Zbqu
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
