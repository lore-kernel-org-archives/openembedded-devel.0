Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh2mC-0000uK-Pq
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 15:18:07 +0100
Received: by wa-out-1112.google.com with SMTP id n7so1102322wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=D3oJnFoioFSaX8fr1kUITgaAPNTSeFz3zb6p2rat9mk=;
	b=nNwWjy+DfWr1SZF4AAOtC0spOiUgjHpQbrsN7uVhvW58o4GPp9mD6j836vHJw7a7NE
	jA0Jg2/Wl0M3k3OcNR/t0ADkqqc8DcqPXsYMZSoSKUNM9BgOZ4aPuuZ9y+kf2XbPDO8x
	f83fvymMToVVLhMzk32WhG/LcOeccIa6IZh/o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=gDIrdyPJeW8xWlaruQf4GCWCBfFWyh7HPXRDRhF6kU2/Sfy9+OcLSdp55yHrxeyK9+
	Th2B3JhQC7dkzz1WfoKp2slWfVo+su10bvfpxdntPJ3fEFeWOsanWWe+thEZZ2Hp3hW3
	2ojty89mTs7WVfSR21rqpDc4eaXc9lt/G658w=
Received: by 10.114.177.1 with SMTP id z1mr4106394wae.68.1236671970772;
	Tue, 10 Mar 2009 00:59:30 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id l28sm4828595waf.65.2009.03.10.00.59.30
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Mar 2009 00:59:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2009 00:59:29 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-8-generic; KDE/4.2.1; x86_64; ; )
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-20-git-send-email-openembedded@haerwu.biz>
In-Reply-To: <1236182004-4523-20-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200903100059.29623.raj.khem@gmail.com>
Cc: Marcin Juszkiewicz <openembedded@haerwu.biz>,
	Ross Burton <ross@openedhand.com>
Subject: Re: [PATCH 19/70] yum-native: add depends on libxml2-native (from Poky)
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
X-List-Received-Date: Tue, 10 Mar 2009 14:18:20 -0000
X-Groupsio-MsgNum: 8322
Content-Type: multipart/signed; boundary="nextPart10146770.AJppQNqvFm";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart10146770.AJppQNqvFm
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 04 March 2009 07:52:34 Marcin Juszkiewicz wrote:
> From: Ross Burton <ross@openedhand.com>
>
> git-svn-id: https://svn.o-hand.com/repos/poky@5118
> 311d38ba-8fff-0310-9ca6-ca027cbcb966 ---
>  packages/yum/yum-native_3.2.18.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/packages/yum/yum-native_3.2.18.bb
> b/packages/yum/yum-native_3.2.18.bb index 03e54d5..fcb5680 100644
> --- a/packages/yum/yum-native_3.2.18.bb
> +++ b/packages/yum/yum-native_3.2.18.bb
> @@ -3,9 +3,9 @@ HOMEPAGE =3D "http://linux.duke.edu/projects/yum/"
>  SRC_URI =3D
> "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
> file://hacks.patch;patch=3D1 \
>             file://paths.patch;patch=3D1"
> -PR =3D "r2"
> +PR =3D "r3"
>
> -DEPENDS =3D "rpm-native python-native python-iniparse-native
> python-urlgrabber-native yum-metadata-parser-native" +DEPENDS =3D "rpm-na=
tive
> python-native python-iniparse-native python-urlgrabber-native
> yum-metadata-parser-native libxml2-native"
>
>  S =3D "${WORKDIR}/yum-${PV}"

OK

=2D-=20
Khem Raj

--nextPart10146770.AJppQNqvFm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm2HeEACgkQHnJKy6V6em6qNgCgm5oNiv/P674CXpGAcniKG3Te
kTkAnRzvEwCbgla0kgC0Dg3aTZCTVF9g
=zT7j
-----END PGP SIGNATURE-----

--nextPart10146770.AJppQNqvFm--
