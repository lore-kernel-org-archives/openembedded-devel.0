Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EFCAE6FCE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 12:42:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2014 05:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,547,1406617200"; d="scan'208";a="601582319"
Received: from tlankage-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.71])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2014 05:42:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Sep 2014 13:41:59 +0100
Message-ID: <1614913.ETddqcUbxW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <541AD1C0.8000008@pr.hu>
References: <541AD1C0.8000008@pr.hu>
MIME-Version: 1.0
Cc: Christian Betz <cbetz@sicom.com>, angstrom-distro-devel@linuxtogo.org
Subject: Re: SSL crypto broken in Daisy?
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
X-List-Received-Date: Thu, 18 Sep 2014 12:42:15 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Zolt=E1n,

On Thursday 18 September 2014 14:36:16 Boszormenyi Zoltan wrote:
> I have built systemd-gnome-image from Daisy-based Angstr=F6m using
> instructions from
>=20
> http://wp.angstrom-distribution.org/?page_id=3D53
>=20
> The set of layers include "meta-intel" and I use the "genericx86" CPU=
.
>=20
> The image I have has curl installed and whenever I want to use an htt=
ps://
> URL from the internal LAN it fails with:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> curl: (35) gnutls_handshake() failed: Handshake failed
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The same happens with and without option "-k" (or "--insecure") to cu=
rl.
>=20
> The webserver's cert is not actually right, as I get this when I use =
curl
> from Fedora 19, 20 or 21Alpha:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> curl: (60) Peer's Certificate issuer is not recognized.
> More details here: http://curl.haxx.se/docs/sslcerts.html
>=20
> curl performs SSL certificate verification by default, using a "bundl=
e"
>  of Certificate Authority (CA) public keys (CA certs). If the default=

>  bundle file isn't adequate, you can specify an alternate file
>  using the --cacert option.
> If this HTTPS server uses a certificate signed by a CA represented in=

>  the bundle, the certificate verification probably failed due to a
>  problem with the certificate (it might be expired, or the name might=

>  not match the domain name in the URL).
> If you'd like to turn off curl's verification of the certificate, use=

>  the -k (or --insecure) option.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> But using "curl -k" with the same URL from the *Fedora client* fetche=
s the
> data properly.
>=20
> Is this problem already known in Daisy or Daisy-based Angstr=F6m?

Hmm, this sounds like it might be related to the following bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6708

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

