Return-Path: <joe@deserted.net>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7416C76F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:53:31 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id 1so3974266qee.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 09:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=WHO9jXszOQsk1NfS70mI49QILAZPiKI2pIX4+i1Y3BA=;
	b=cqmn7LKS4fCbEs7Bi/TdkhMVD3PZP8jKRHGG90mcr77+fOMVN4Wqrcfqdfk/jcbijW
	2Iu/5t2ku+aDNKqG4ug9Np9Ic3jcrEbSN+sRZgudEtS2Ou6KfPxt3o3x+G5C9u1Zh+ZF
	1WVE0EkzhXKGAJrMAZwi9QZALotUyw3YRatiDpIoKexPjKXdwUWF3KOv9vkRA4mtz5GU
	cua7HLzb9ujSUGgzl3LsQDevYEU9/eDv2EbLny/1EcJ9e87f6nzevGLMEAWoQ/Y6TnYD
	/MxfwDPJJYamUVmohKQjeL8AXNB3QTSfRNBrY5fKsIQhsS6hjxc7foZCl9JdGgR3O43v
	nVjQ==
X-Gm-Message-State: ALoCoQl4GNwqe0Hjpavov27frIPlsT6nt7sMISsBjOOmeeM88KOvocImQpz1tOJ6lpNniWEL5MMt
X-Received: by 10.224.62.4 with SMTP id v4mr52589999qah.41.1385488410470;
	Tue, 26 Nov 2013 09:53:30 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id o10sm87507224qaa.6.2013.11.26.09.53.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 09:53:29 -0800 (PST)
Date: Tue, 26 Nov 2013 12:53:27 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131126175325.GI3939@deserted.net>
References: <1383887325-8280-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383887325-8280-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] ntp: fix 60-ntpd.list path
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
X-List-Received-Date: Tue, 26 Nov 2013 17:53:31 -0000
X-Groupsio-MsgNum: 47273
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pe+tqlI1iYzVj1X/"
Content-Disposition: inline

--pe+tqlI1iYzVj1X/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Almost forgot about this one.  Also merged earlier today.  Thanks.

-J.

[[oe] [PATCH meta-networking] ntp: fix 60-ntpd.list path] On 13.11.08 (Fri =
13:08) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> 60-ntpd.list should be installed into the same path as ntp systemd service
> file, like Fedora core; Orignal path refers
> http://www.freedesktop.org/wiki/Software/systemd/timedated/, but where
> systemd_unitdir is assumed as /usr/lib/systemd, not /lib/systemd
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 65d90de..9ea24e9 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -67,9 +67,8 @@ do_install_append() {
>      install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/syste=
m/
>      install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/syste=
m/
> =20
> -    # see http://www.freedesktop.org/wiki/Software/systemd/timedated/
> -    install -d ${D}${libdir}/systemd/ntp-units.d
> -    install -m 0644 ${WORKDIR}/ntpd.list ${D}${libdir}/systemd/ntp-units=
=2Ed/60-ntpd.list
> +    install -d ${D}${systemd_unitdir}/ntp-units.d
> +    install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-unit=
s.d/60-ntpd.list
>  }
> =20
>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
--=20
-Joe MacDonald.
:wq

--pe+tqlI1iYzVj1X/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKU4BUACgkQwFvcllog0XzPcgCfcL6BGSpMLHf5upOEMfHkEr3t
b7UAoIzm96DXyz9ylwGVE/jLSpa04jvt
=CLYe
-----END PGP SIGNATURE-----

--pe+tqlI1iYzVj1X/--
