Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E427D78350
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:05:16 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w12so4112784pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=1p6mJ7nrNKMNFYx0i3KVhribi08TrQC61HFwyEYSZaw=;
	b=qY0t8kWHXe7pNGad1g/Y6OT+UyNwRssJ2hQh8P8wVFJnaNPLnwgYL9w18CeDfGtBlq
	3Ng27cxmUFcPqYhSVth3VPhsVLFDR0M6hJsWkYToNRiAFxr0NfRvJhOlKnP9y4J2UxfQ
	o+8AVZO7aMG2c7fc9NVywKctWU1dD5GiT2ORur/ulO3etF4YEVd7ll6mL69s3LYdGjFZ
	lALAGeJUc6CXZWk2sqSzvpAFH6AOVSto8QaFe2eRtbbvVIUQRcnOcpg7AVZojdSsUu/k
	NPzv1plgXtEi4H6RlB4JXoj2wkuAxzmG3EYXE1XhH1+Nkvu9Bl5Gh//baaDLLFM8RYPA
	vJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=1p6mJ7nrNKMNFYx0i3KVhribi08TrQC61HFwyEYSZaw=;
	b=XCE2dXvhEwMCyVjqJHGgHLFcRALq/ILYTnNzMIf2k4rZp9zKOQZWgLfzAhvJOfo/NT
	bIqgUEMpExM+bsx2FYyoHBHKlc/3l1HAKiipNVvgkEL6qgdT/2pOCH7oM39ZNNbYoAqG
	kK8imcEawJfUu1Ff7R80xV8DV4Hlek4OAaDSjYk/4rFNIHYaufJxwRUTvd5qVrDVYiFN
	jHOoZ5mOfugBtwU2r1WRn8ChYR6mgJ59gxIC06h3wXFc4ucqglmWHdppCE+HR7JoCRhs
	63RdyfBx59qCzpEVYLJoSO4fW5sKSyPmOj7h2u1VZVfUW6rbUxz3u55VyQjAleTasLHN
	o/dA==
X-Gm-Message-State: AKS2vOw/oSrXCgfwIDJ/ptApJ0XTli9O50VHhzYfGZFVxCQsZyiu5DVO
	1HyhkrLlX9mMC9VtuM4=
X-Received: by 10.84.241.11 with SMTP id a11mr10779691pll.160.1497593117662;
	Thu, 15 Jun 2017 23:05:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:745f:c6ab:d92d:5f3f?
	([2601:646:8882:b8c:745f:c6ab:d92d:5f3f])
	by smtp.gmail.com with ESMTPSA id c4sm2113476pfg.31.2017.06.15.23.05.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jun 2017 23:05:16 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1497547325-11931-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <29537335-e4c4-3467-7225-3f5e7f470d8d@gmail.com>
Date: Thu, 15 Jun 2017 23:05:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <1497547325-11931-1-git-send-email-jslater@windriver.com>
Subject: Re: [meta-networking][PATCH 1/1] iscsi-initiator-utils: do not regenerate prom_lex.c
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
X-List-Received-Date: Fri, 16 Jun 2017 06:05:17 -0000
X-Groupsio-MsgNum: 67180
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="sMhshb99cim9HmtfnD3Wr6ewATpvDWQjc"

--sMhshb99cim9HmtfnD3Wr6ewATpvDWQjc
Content-Type: multipart/mixed; boundary="jgcEmNPiBdlpeJW9FBuxQOgFCPuMS9iTi";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <29537335-e4c4-3467-7225-3f5e7f470d8d@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/1] iscsi-initiator-utils: do not
 regenerate prom_lex.c
References: <1497547325-11931-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1497547325-11931-1-git-send-email-jslater@windriver.com>

--jgcEmNPiBdlpeJW9FBuxQOgFCPuMS9iTi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/15/17 10:22 AM, Joe Slater wrote:
> prom_lex.c is provided in source.  If we try to remake
> it from prom_lex.l, we will not find "lex" since it is
> not in recipe-sysroot-native.  If we do manage to provide
> lex, the new source will not compile.


what is diff between new and old src
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb            =
  | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscs=
i-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-init=
iator-utils/iscsi-initiator-utils_2.0.874.bb
> index 72a17b0..16ac199 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initi=
ator-utils_2.0.874.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initi=
ator-utils_2.0.874.bb
> @@ -58,6 +58,8 @@ do_configure () {
>  }
> =20
>  do_compile () {
> +    # Make sure we DO NOT regenerate prom_lex.c.
> +    mv ${S}/utils/fwparam_ibft/prom_lex.l ${S}/utils/fwparam_ibft/prom=
_lex.l.unused
>      oe_runmake -C ${S} ${EXTRA_OEMAKE} user
>  }
> =20
>=20



--jgcEmNPiBdlpeJW9FBuxQOgFCPuMS9iTi--

--sMhshb99cim9HmtfnD3Wr6ewATpvDWQjc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllDdRoACgkQuwUzVZGdMxRKaQCfb8BZ4/hRmSw+P4HYvsR64+Lu
zo8An0FisOpBIKAp698peZkS+Xjktg9h
=nkQH
-----END PGP SIGNATURE-----

--sMhshb99cim9HmtfnD3Wr6ewATpvDWQjc--
