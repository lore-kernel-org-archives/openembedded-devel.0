Return-Path: <clopez@igalia.com>
X-Greylist: delayed 2136 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 May 2018 05:14:16 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 30C927198F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 05:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=gi2ZbTiSSizm14ow8pSaMMuG16ZWfJaWMTn+b/Y474E=; 
	b=fQS+W5mUDwZeGuNSYi4tNdr5k8SeAKG8EMxHOfFB1Wna8HS6draXrH+wpGekpUNMcJWyP7VuMlzC0O7ofvnN3xW7MbGvzGP+PtzKUx1o2seKvOsdhWHXPx22FS2sWjRnKlrnH+dHvsqRwjWpLZBU6dnN7p1KuKHt+aJFBv8DLkGzBVaYwrFhWCmhjtIfeucjr36CCqQ0d6256iHDZueveWUpB3Yppo5wYvFnaVrpdsF5AsItjR7yBjEd62EwOUDj/uA0Cv0dP4Hum6F3N9bCP1yF/EDHZTooNJf49tgKTc7y1cyqSfe/UjVQCIXnqwedPLyHaoTml/Ph6ex2cWC8nA==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1fJXA8-0004NO-Ud; Fri, 18 May 2018 06:38:41 +0200
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20180512030758.31409-1-raj.khem@gmail.com>
	<20180512030758.31409-5-raj.khem@gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
Date: Fri, 18 May 2018 06:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180512030758.31409-5-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Fri, 18 May 2018 05:14:17 -0000
X-Groupsio-MsgNum: 72246
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="6yxoFVuyKwrXtIinaY55MK57N2XjRa9Xz"

--6yxoFVuyKwrXtIinaY55MK57N2XjRa9Xz
Content-Type: multipart/mixed; boundary="ggAlw2eKb89PGofqMj05dmjLIWHdW5eFj";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-ID: <8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
Subject: Re: [oe] [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when
 compiling host binaries
References: <20180512030758.31409-1-raj.khem@gmail.com>
 <20180512030758.31409-5-raj.khem@gmail.com>
In-Reply-To: <20180512030758.31409-5-raj.khem@gmail.com>

--ggAlw2eKb89PGofqMj05dmjLIWHdW5eFj
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12/05/18 05:07, Khem Raj wrote:
> BUILD_LDFLAGS add --dynamic-linker to point to uninative but
> some binaries in luajit are for 32bit build host, so even if
> your host has the needed runtime, it will fail to execute because
> uninative ldso doesn't know about multilib
>=20
> we get cyptic errors like
>=20
> | make[1]: execvp: host/minilua: Accessing a corrupted shared library
> | make[1]: *** [Makefile:610: host/buildvm_arch.h] Error 127
>=20
> Switch to using git for SRC_URI, master is pointing to latest
> 2.0 stable, it gets us all the patches done since last 2.0.5 relases
> in 2017
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20

I think HOST_LDFLAGS should remain for the native class.

Otherwise building luajit-native might fail.

I suggest adding something like this:

EXTRA_OEMAKE_remove_class-target =3D "'HOST_LDFLAGS=3D${BUILD_LDFLAGS}'"


--ggAlw2eKb89PGofqMj05dmjLIWHdW5eFj--

--6yxoFVuyKwrXtIinaY55MK57N2XjRa9Xz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlr+WMcACgkQllCJzmuV
+IL7BA//ckkIeD8Zk856ptzoDDa1vPldCF8Gfmq6h2zDsrMPsbGJQJyJKEM1clqT
mpr+wX5+oWYSKMFLsAbUk/gZ8S2q9MYYvx3219grKpbgnsgddA/d1WOTS4Xi9pXW
TKXU9UbEf7MtIumBPQAEBxaaQfvNdoOquYcqEwmjSiBG27MPAtPwFSF7QY10T+C1
tA16HtbDEk0CYWwakx+xQfq0H0WyTNUMHlfrgpN5lqU6jgc/5UwxLb7CGHctwW9h
w5gjlQ+mKrj5cqfrB0gd5W00OtkvN26Sq4riZcepURjWH6oCGzQeO2NnTcdGzScL
WUeSAAhZxFkWirKyio8HfexKaJp1+7EOgh76Z1RgKCrdVeYppIkLASq4P5DQwuhp
G2UQSfPspdc0+qkIu5KLIJNeLR6k1zj42im4robdkNEAsfEOcs0+W3lqm29+C1vL
b6vSvmQcJFvaHUGx7qrpoKoboRbJkV4MqDyIuRpBPGXir9qB4FekaO2UPZ8JoMMl
JrbFkBmsJuyIhwWrLI7Zf1lWeH9mbwAKTN4cJt6hoWg3QrNCCAuA2viGh6V7wPvX
LaJ/DSTGV34/iSPIUTeODmsmKoX0XvtJK3ToZLqWrZMpHoiFGWYh+92K0xxpZQnJ
1dVPobvdReJIVYN+jBELGjvjm9xKtrP9fh7TXoYzmwXBJr24/7c=
=8b0w
-----END PGP SIGNATURE-----

--6yxoFVuyKwrXtIinaY55MK57N2XjRa9Xz--
