Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TcwFB-0008QT-Mc
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:48:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Nov 2012 02:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,319,1352102400"; d="scan'208";a="224374073"
Received: from unknown (HELO helios.localnet) ([10.252.122.215])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2012 02:34:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 10:34:23 +0000
Message-ID: <5889530.MeT4QD1KUF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <1353885218-5623-1-git-send-email-eric@eukrea.com>
References: <1353885218-5623-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] ntp: fix checksum
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
X-List-Received-Date: Mon, 26 Nov 2012 10:48:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 26 November 2012 00:13:38 Eric B=E9nard wrote:
> commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recipe to=

> a newer version but didn't update the checksum so fetch is failing.
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb index f7c5b68..0=
fce5ce
> 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> @@ -8,8 +8,8 @@ SRC_URI =3D
> "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.=
g
> file://ntpdate \
>  "
>=20
> -SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
> -SRC_URI[sha256sum] =3D
> "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
> +SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
> +SRC_URI[sha256sum] =3D
> "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
>=20
>  EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"

Hmm, you're right - it did get missed. Strangely though if I do -c clea=
nall=20
ntp then build ntp again I don't get an error with the wrong checksum (=
with=20
danny) :/

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


