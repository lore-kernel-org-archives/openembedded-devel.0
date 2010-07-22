Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1Obq3P-0008TK-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 09:18:56 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id F2AFF1414B; Thu, 22 Jul 2010 09:18:39 +0200 (CEST)
Date: Thu, 22 Jul 2010 09:18:39 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100722071839.GA17760@zlo.nu>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
	<1279721232-24744-2-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1279721232-24744-2-git-send-email-heinold@inf.fu-berlin.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: Re: [PATCH 01/21] ant: backport from openembedded-dev
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
X-List-Received-Date: Thu, 22 Jul 2010 07:18:56 -0000
X-Groupsio-MsgNum: 21282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2010 at 04:06:52PM +0200, heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <h.heinold@tarent.de>
>=20
> ---
>  conf/checksums.ini              |    4 ++
>  recipes/ant/ant-native_1.7.1.bb |   64 +++++++++++++++++++++++++++++++++=
++++++
>  recipes/ant/files/ant           |   10 ++++++
>  3 files changed, 78 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ant/ant-native_1.7.1.bb
>  create mode 100755 recipes/ant/files/ant
>=20
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 909ade7..2c18f2e 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1622,6 +1622,10 @@ sha256=3D4dc49a7260ef90a6dc6611b7e96b9f047d5075897=
36d4a2ad6efbe3edfc6fba6
>  md5=3D2a44ff60456cf67bb83771cfcedb8e33
>  sha256=3D1a2fceea38f04e6fea0c0cb8ad7312dc948004af4d9308b5e630d299d89dfb38
> =20
> +[http://archive.apache.org/dist/ant/source/apache-ant-1.7.1-src.tar.gz]=
=20
> +md5=3D2a44ff60456cf67bb83771cfcedb8e33=20
> +sha256=3D1a2fceea38f04e6fea0c0cb8ad7312dc948004af4d9308b5e630d299d89dfb38
> +
>  [http://archive.apache.org/dist/logging/log4j/1.2.15/apache-log4j-1.2.15=
=2Etar.gz]
>  md5=3D10f04abe4d68d5a89e8eb167e4e45e1a
>  sha256=3Df5d9f6aa78b9156ae2de2a32d0f26507d2e73db4993d501db2e79f0bd803ab31

[snip]

I may be wrong, but per
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019112.h=
tml
I have always thought that checksums.ini was to be removed and that new
checksums are to be added to the .bb files.

Apart from that, nice job on the patchset. ;-)

Marc

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkxH8M8ACgkQezjnobFOgrFcDwCeJx/VC6R8dndGfYTCP5E9mgxg
+tUAniZ8ySkAjh7LDV8wQsG7vdrSxYqC
=7bkj
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
