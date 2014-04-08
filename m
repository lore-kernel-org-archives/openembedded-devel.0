Return-Path: <joe@deserted.net>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E281D65DC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 16:55:55 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id w7so1374885qcr.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 09:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=uM5hrL/ddx3m4tRxevR9reHjw0L/Q0lAcWg0wlo6NNM=;
	b=XeU0GH0Hx94Ye9xgeBktNmp9FYuqKIdEUKhLtodPLfTp92IaBMERbMLv5Bph8nQSte
	d+3M/FcWaSMa5smN4v86HWVqxsr6CpdvB3cqhe+CsSlhhC73Ss3G3fen3NaT+UVUrs1h
	VBFos5MZMMb003ah5efAWxO9ih81HDczYapvgEA/FDNSMahfkyiBKi3FR2r35xQ1r5rB
	FcJlf8f1k66BnCns6+ABWz+pROuELUtVYYObjHnujayf6ImA9yysgGVTphLEPh5e5vxg
	WLL0ozp0J9/wKHd+etyvDX/0NWhhToWQ1H9JYq2Sff5M2hLSG10ckVIp7CVo9n3lqIpX
	5m/Q==
X-Gm-Message-State: ALoCoQknGgn1jx7pwIKz7gaDavO0ChZ9JaFtbs7Zg1qNfu70HwqpHZf+WAgKyIZKAlSNgootlKEq
X-Received: by 10.224.63.138 with SMTP id b10mr5860604qai.79.1396976156023;
	Tue, 08 Apr 2014 09:55:56 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id d15sm5027935qae.23.2014.04.08.09.55.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 09:55:54 -0700 (PDT)
Date: Tue, 8 Apr 2014 12:55:51 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140408165549.GA3860@deserted.net>
References: <1396968844-5518-1-git-send-email-Christian.Ziethen@enea.com>
MIME-Version: 1.0
In-Reply-To: <1396968844-5518-1-git-send-email-Christian.Ziethen@enea.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH v2] dnsmasq: update to 2.68 to fix a bug with libvirt, DHCP and SO_REUSEPORT
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
X-List-Received-Date: Tue, 08 Apr 2014 16:55:56 -0000
X-Groupsio-MsgNum: 49101
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks, but some kind of follow up on Koen's other comment would be
good:

[Re: [oe] [meta-networking][PATCH] Incrementing dnsmasq version to address =
a bug with libvirt and DHCP.] On 14.04.08 (Tue 14:24) Koen Kooi wrote:

[...]
> And if would be nice if you can state what that bug was in the commit log.
[...]

In general on a package update to a newer version there's not a lot to
say (since nobody wants a copy of ChangeLog in a commit log, but if the
motivation for the update is a bug fix, a hint at the bug being fixed
would be a good comment to include.

-J.

[[oe] [meta-networking][PATCH v2] dnsmasq: update to 2.68 to fix a bug with=
 libvirt, DHCP and SO_REUSEPORT] On 14.04.08 (Tue 16:54) Christian Zieth=E9=
n wrote:

>=20
> Signed-off-by: Christian Zieth=E9n <Christian.Ziethen@enea.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb |    4 ----
>  meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb |    4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.=
bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.=
bb
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
> deleted file mode 100644
> index 2df3713..0000000
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require dnsmasq.inc
> -
> -SRC_URI[dnsmasq-2.63.md5sum] =3D "43e771997615ebcd8f6c6ffa60c3e40b"
> -SRC_URI[dnsmasq-2.63.sha256sum] =3D "fd86e3bcc6a63c76e35e4a20baa790e7bbb=
fc7b43845cae85ca8ffd024467710"
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> new file mode 100644
> index 0000000..b1bef7a
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> @@ -0,0 +1,4 @@
> +require dnsmasq.inc
> +
> +SRC_URI[dnsmasq-2.68.md5sum] =3D "6f8351ca0901f248efdb81532778d2ef"
> +SRC_URI[dnsmasq-2.68.sha256sum] =3D "402019d61f53f1ccc04cc6218719fd3b158=
ea3fca9a83ab55471f981a2097c2f"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNEKgUACgkQwFvcllog0XxXPgCfW/6r7/9+Vf0P9rgCvGTmTBfU
8VYAoJl4MD9Feu5nzOAhfQ12YLqjvhDc
=dBJ/
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
