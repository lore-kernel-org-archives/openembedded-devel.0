Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFAYU-0000my-UX
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 22:46:52 +0100
Received: by mail-ee0-f52.google.com with SMTP id b15so2273720eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kPXJh21EGySz3CMyDaP2mN5fW6qKed0U+tk06S3mlUM=;
	b=hDLbYnHdoNDnlPHHDSNkNymyXn3c+KSdB7CF7z7Uv7H8oVHbQzZ31uRRM161szpEJC
	Jq/XqJb4FstjuMw121Km711Oj0QZacbRqjgfkRh6d9Z/Vyh5NdC7ebJUfplqApIRFXm+
	XZlf3bW7cIPCqeuMh6QpRFgbYzn2AvwiilUVDYB3vSRwzW0o41iSjzLwr4UM6dRiMQ7l
	V7DNUyQuitBwCuz/tWCr/mdTiCPFhZ+eXPsgaHZPezo3NB0J0wf0UodebC9m4HeTzzgj
	gXlEQsNpPKM/WGGEqN9YKq0PKwbNIwNZMbiSeGEcAmsY/eLYdTcPlIFMsUq3wKCoEXG9
	xhaA==
X-Received: by 10.14.193.134 with SMTP id k6mr40635752een.37.1363037412623;
	Mon, 11 Mar 2013 14:30:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q5sm25867559eeo.17.2013.03.11.14.30.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 14:30:11 -0700 (PDT)
Date: Mon, 11 Mar 2013 22:30:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130311213020.GB9724@jama.dyndns-home.com>
References: <1362994782-12371-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362994782-12371-1-git-send-email-wenzong.fan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: wfan@windriver.com
Subject: Re: [PATCH] meta-selinux: Add LAYERVERSION and LAYERDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 21:46:56 -0000
X-Groupsio-MsgNum: 43495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 05:39:42PM +0800, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Add LAYERVERSION and LAYERDEPENDS to layer.conf

meta-selinux patches don't belong to this ML, please mark them as "Not
applicable" on patchwork.

> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  conf/layer.conf |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/conf/layer.conf b/conf/layer.conf
> index ca0aefa..ca1bb46 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -9,3 +9,8 @@ BBFILE_COLLECTIONS +=3D "selinux"
>  BBFILE_PATTERN_selinux :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_selinux =3D "5"
> =20
> +# This should only be incremented on significant changes that will
> +# cause compatibility issues with other layers
> +LAYERVERSION_selinux =3D "1"
> +
> +LAYERDEPENDS_selinux =3D "core"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE+TOwACgkQN1Ujt2V2gBz4LQCguhVVey2Qf8nz7e7WIa7Ecr/b
oNAAnRDRKb43181jmU26u+lCmnWfZc/t
=0skw
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
