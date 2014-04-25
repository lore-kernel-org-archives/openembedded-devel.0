Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id B68F965D13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:22:37 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so3233127iec.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=M2zH/3JxIK3o6yaWYStCC0qsdtpvf9iL10ATR0JSOvE=;
	b=GF/xm15E6pREzmy5RGsA06EBt2lyXML9b/8G/H7HyFuVI0unE3u94awUbnnIGA8KNo
	/XMoAucmlTXyljzqO7QLxYUBApTvsJTh2/zRuJqsDdKdjmm3ZMugK6oOES2H692QgFVZ
	G2EGgFaE6OdCVAssnvfMHCPx0CBbqZIEsIAmBc5QeHFsVUKSx6plamCUicBgjPvUqBIj
	JMcFPsrv43x3XnLX22pqOw+5r4ZJqEG0zX8e8UYztmr8MvyoTbC3o5fU8ORI3gsSzaSn
	N8DKhJ4uLeUsNWG7NQhYiU5RO0GBbO0Ez4SwzqFukxEBIFB3/I6YncLvlORBfPpnW6Yi
	a2/A==
X-Gm-Message-State: ALoCoQmgYIGu4pOVc83FIfCpAVYLQvCpQwq6ByIWBtVvru4hJWeMHXLuOcjrLeSZjtWrfaAJllGu
X-Received: by 10.50.119.132 with SMTP id ku4mr2010655igb.35.1398388958485;
	Thu, 24 Apr 2014 18:22:38 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	kw1sm3810438igb.4.2014.04.24.18.22.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:22:37 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:22:35 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425012232.GK10115@deserted.net>
References: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH 0/4] Fix some errors and CVE issue
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
X-List-Received-Date: Fri, 25 Apr 2014 01:22:38 -0000
X-Groupsio-MsgNum: 49476
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opg8F0UgoHELSI+9"
Content-Disposition: inline

--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged the batch, thanks Kai.

-J.

[[oe] [meta-networking][PATCH 0/4] Fix some errors and CVE issue] On 14.04.=
21 (Mon 14:24) Kai Kang wrote:

> Kai Kang (3):
>   quagga: fix CVE-2013-6051
>   quagga: fix QA warning
>   ndisc6: allow the package can be empty
>=20
> Wenzong Fan (1):
>   radvd.init: fix path to radvd.conf sample
>=20
>  .../recipes-daemons/radvd/files/radvd.init         |  2 +-
>  .../quagga/files/quagga-fix-CVE-2013-6051.patch    | 29 ++++++++++++++++=
++++++
>  .../recipes-protocols/quagga/quagga.inc            |  2 ++
>  .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |  2 ++
>  4 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga=
-fix-CVE-2013-6051.patch
>=20
> --=20
> 1.8.4
>=20
--=20
-Joe MacDonald.
:wq

--opg8F0UgoHELSI+9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZuNgACgkQwFvcllog0XwFFACfWHybHbPPfUDfzGMpQZowJyKE
ziQAoLmZvZcBeapbrVOOO/rGO2lzFGId
=ziTy
-----END PGP SIGNATURE-----

--opg8F0UgoHELSI+9--
