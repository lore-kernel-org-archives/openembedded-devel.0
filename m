Return-Path: <joe@deserted.net>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1810A6E74B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2014 01:25:21 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id lx4so3789247iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 17:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GNeVNKRs83JS/3ouknHRvQDb7gaINyblF1kBKkvcu1U=;
	b=gQGYutkn5JjppLI9d4GwfAEls0y5gWESUZ1lFazkZi6Y/wNzqVBni7+yxTczdoJnM+
	bMIeLFf3OXO6do+WGC7nOQ1+J/7xJXFN5PPN+jmTkcw5iqKiaSzdEMWLPtMIwL9LamvZ
	KVi9QWYfvof26d00/X2VkZQV7+N2mBPOdbbp0nhAEswCN51GC/y8k406R20nJO/RdzDU
	IbZQbscpbhwp7GqZjC+sUTvUdX3jjBFtYTOCXHrOQZRu1It2mRBu5o9easpFBwwTOFUD
	c9nFhgdhu48wubJfMiWtBPJFr11xyz+ZbRjT3zojqFTYQIwk01EX/aB5VNCm4dkYGAxN
	nZSg==
X-Gm-Message-State: ALoCoQlOzcJiZ7jdTBa/ttCstuB6c+KgnLzFPC6oIUK7LRM3bwoPzocP6KNeUVyfaG46lA6uDApi
X-Received: by 10.42.250.132 with SMTP id mo4mr8690050icb.34.1392427521705;
	Fri, 14 Feb 2014 17:25:21 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	kb5sm8972019igb.1.2014.02.14.17.25.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Feb 2014 17:25:21 -0800 (PST)
Date: Fri, 14 Feb 2014 20:25:18 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140215012516.GO23405@deserted.net>
References: <1391178346-11804-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1391178346-11804-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] libnetfilter-log: add newrecipe for version 1.0.1
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
X-List-Received-Date: Sat, 15 Feb 2014 01:25:21 -0000
X-Groupsio-MsgNum: 48155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N5iGxCIPT7YMRg16"
Content-Disposition: inline

--N5iGxCIPT7YMRg16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] libnetfilter-log: add newrecipe for version =
1.0.1] On 14.01.31 (Fri 15:25) Matthieu Crapet wrote:

> This library is usefull for userspace netfilter log messages
> (c.f. iptables and -j NFLOG target).
>=20
> libnetfilter-conntrack, libnetfilter-cttimeout, libnetfilter-cthelper and
> libnetfilter-queue are already available since december of 2012.
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  .../recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb  | 14=20
> ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644=20
> meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
>=20
> diff --git=20
> a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb=
=20
> b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> new file mode 100644
> index 0000000..81909b8
> --- /dev/null
> +++=20
> b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Netfilter logging library"
> +DESCRIPTION =3D "Userspace library providing a programming interface (AP=
I)=20
> to the Linux kernel netfilter log message (NFLOG)"
> +HOMEPAGE =3D=20
> "http://www.netfilter.org/projects/libnetfilter_log/index.html"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> +DEPENDS =3D "libnfnetlink"
> +
> +SRC_URI =3D=20
> "http://www.netfilter.org/projects/libnetfilter_log/files/libnetfilter_lo=
g-${PV}.tar.bz2;name=3Dtar"
> +SRC_URI[tar.md5sum] =3D "2a4bb0654ae675a52d2e8d1c06090b94"
> +SRC_URI[tar.sha256sum] =3D=20
> "74e0fe75753dba3ac114531b5e73240452c789a3f3adccf5c51217da1d933b21"
> +
> +S =3D "${WORKDIR}/libnetfilter_log-${PV}"
> +
> +inherit autotools pkgconfig
--=20
-Joe MacDonald.
:wq

--N5iGxCIPT7YMRg16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL+wfwACgkQwFvcllog0XymKgCfeaznhfGAmqwaIiuKJzlYg0Dr
Ac8AoI4L+xXdnee8/gAeXOx/dS8mM/Zu
=D/oF
-----END PGP SIGNATURE-----

--N5iGxCIPT7YMRg16--
