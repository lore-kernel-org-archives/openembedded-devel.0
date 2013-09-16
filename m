Return-Path: <joe@deserted.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 74CAE6C80B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:44:21 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id f12so4139275wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=qFfI6rxrYPrPWJBiBIjdyukTGVq/2ifxAgZX6kTS64U=;
	b=RlkQKaE8kfMWLGP4BuJS7k19ApieL7O5OjW7n9iE5NGb4S63rjdRu5CD1gFfk1wS2t
	nEUvn7XHSe7lv4Y+gDbeRd9+htHAUQmVqF8JUNUhVllGRXpH2Ll2wIpIuB0z7fsbjK5R
	Thfw3JHzW0nUPZFFp/MdbimaZ0mhiJ1UxQ8iKJZcJQ7O4wMJR+wX3dRALan1bKN6W5+T
	p38Qzb+fXU0ZEd3gieCvO4avz14nDob1YyLMn8Wd8IHJMRdpfQkACCf+m43Ue5n3ZQJ4
	Z3FDmEFLNPh0REz88hWnp6NHa0c4n0TFdqT8+pE8eLbASM/LiH6/VqJk6y2n18dqI6zj
	J9AA==
X-Gm-Message-State: ALoCoQlwGeoKr7PMOFrE16v2u65RO9yxJ6fZ41/86G00XHuj/n3qKCWE31mGMVuoUio/2nbhRs24
X-Received: by 10.194.235.138 with SMTP id um10mr23956378wjc.30.1379357062798; 
	Mon, 16 Sep 2013 11:44:22 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id l9sm25592668wif.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 11:44:21 -0700 (PDT)
Date: Mon, 16 Sep 2013 14:44:18 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130916184416.GA13978@deserted.net>
References: <1379315195-18861-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1379315195-18861-1-git-send-email-schnitzeltony@googlemail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] ntp: disable automatic panic shutdown for ntpd
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
X-List-Received-Date: Mon, 16 Sep 2013 18:44:21 -0000
X-Groupsio-MsgNum: 46215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking] ntp: disable automatic panic shutdown for ntpd] On =
13.09.16 (Mon 09:06) Andreas M=FCller wrote:

> Taken from [1]:
>=20
> "However, if the difference between the client time and server time is gr=
eater
> than the panic threshold, which defaults to 1000 s, the daemon will send a
> message to the system log and shut down without setting the clock."
>=20
> On RTC-less or 'fresh' systems with unpredicatble inital date ntpd will s=
top
> with work undone (note: I did NOT find the message mentioned above - so it
> took long way to fix). This is a wide use case for using NTP in productio=
n:
> No need for initial datetime setup by some operator.
>=20
> [1] http://doc.ntp.org/4.1.1/debug.htm
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-support/ntp/ntp/ntpd.service           |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service b/meta-=
networking/recipes-support/ntp/ntp/ntpd.service
> index bd87b1e..eb9c030 100644
> --- a/meta-networking/recipes-support/ntp/ntp/ntpd.service
> +++ b/meta-networking/recipes-support/ntp/ntp/ntpd.service
> @@ -5,7 +5,7 @@ After=3Dnetwork.target
>  [Service]
>  Type=3Dforking
>  PIDFile=3D/run/ntpd.pid
> -ExecStart=3D/usr/bin/ntpd -p /run/ntpd.pid
> +ExecStart=3D/usr/bin/ntpd -p /run/ntpd.pid -g
> =20
>  [Install]
>  WantedBy=3Dmulti-user.target

Merged, thanks.

--=20
-Joe MacDonald.
:wq

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlI3UYAACgkQwFvcllog0XyDNgCeKPL+VB2ZeC1i+kRm1by5xB0s
5tQAni5aAjbfvHoES8tz2/f7TGtcnLn/
=5Q/i
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
