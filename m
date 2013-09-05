Return-Path: <joe@deserted.net>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2B54B6C6B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:14:24 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so905063eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=tpHqBd4lpD3iYdNlIRo4EDX0pTpgeCTK8WMzRA8Wo/E=;
	b=Oa7NKYMmT/f6uu1pnBTJPVAuqzj7LLWNXCbGbGFRNPC43dlMjhZ+3IOsOGkHe9iOPO
	mJvUi8/s2Sexjl5mkh3MR4vkijLG2R3u625LLKPuba9ApefN1M5EAPOndDXOcNP1oynv
	K+4xikowGUgoUQTFoOfucvHSJE3Y3cUUaq91jwiFUdRZwGN2wTLI6mUag06fw2PXgzwL
	koa0IMDF63fWE6dxrLkJhKQ2kJK/7nFH4bMUoSK4gwQfnSD+utA0I4PLzd/tUXVqC+t8
	tC+MLzXbOhklSJfmk/3TtQ/NbwxuN/5c3v/ODUm+NzZ5BOInR3ZqmiZEpKL6+MdLYf29
	bUbA==
X-Gm-Message-State: ALoCoQnZCEAfgItVzrwk2GQ8wzNNa95tkja9bcUru9VjGb4RAC+zEhucumo7wWcKFcazEr9bMgpP
X-Received: by 10.14.183.2 with SMTP id p2mr13440475eem.44.1378386865297;
	Thu, 05 Sep 2013 06:14:25 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id a6sm48590859eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:14:24 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:14:20 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905131418.GK5086@deserted.net>
References: <1378191510-31214-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1378191510-31214-1-git-send-email-schnitzeltony@googlemail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] ntp: enable systemd-timedated control for ntp.service
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
X-List-Received-Date: Thu, 05 Sep 2013 13:14:24 -0000
X-Groupsio-MsgNum: 46101
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LHvWgpbS7VDUdu2f"
Content-Disposition: inline

--LHvWgpbS7VDUdu2f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking] ntp: enable systemd-timedated control for ntp.servi=
ce] On 13.09.03 (Tue 08:58) Andreas M=FCller wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc       |    5 +++++
>  meta-networking/recipes-support/ntp/ntp/ntpd.list |    1 +
>  2 files changed, 6 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-support/ntp/ntp/ntpd.list
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 79e7401..ebfa222 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -22,6 +22,7 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
>             file://ntpd.service \
>             file://sntp.service \
>             file://sntp \
> +           file://ntpd.list \
>  "
> =20
>  inherit autotools update-rc.d systemd
> @@ -63,6 +64,10 @@ do_install_append() {
>      install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/sy=
stem/
>      install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/syste=
m/
>      install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/syste=
m/
> +
> +    # see http://www.freedesktop.org/wiki/Software/systemd/timedated/
> +    install -d ${D}${libdir}/systemd/ntp-units.d
> +    install -m 0644 ${WORKDIR}/ntpd.list ${D}${libdir}/systemd/ntp-units=
=2Ed/60-ntpd.list
>  }
> =20
>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.list b/meta-net=
working/recipes-support/ntp/ntp/ntpd.list
> new file mode 100644
> index 0000000..d1fe6b7
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/ntp/ntpd.list
> @@ -0,0 +1 @@
> +ntpd.service
--=20
-Joe MacDonald.
:wq

--LHvWgpbS7VDUdu2f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIog6oACgkQwFvcllog0XzFVgCfbUjxtN1nIU6m1mHkFI0eWss6
oZ8AoIJ9C36vYZPOUA6W0lBoWmzgCAAD
=t8Xh
-----END PGP SIGNATURE-----

--LHvWgpbS7VDUdu2f--
