Received: from bsmtp3.bon.at ([213.33.87.17] helo=lbmfmo03.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QEfnB-00055Q-2K for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 12:46:53 +0200
Received: from bsmtp.bon.at (unknown [192.168.181.105])
	by lbmfmo03.bon.at (Postfix) with ESMTP id 142151212EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 12:44:22 +0200 (CEST)
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 62F5F2C4008
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 12:44:15 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 12:44:13 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<1303307478.3979.60.camel@mattotaupa>
	<1303308175.3979.62.camel@mattotaupa>
In-Reply-To: <1303308175.3979.62.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104261244.14236.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH 1/2] orc_0.4.13: set `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Tue, 26 Apr 2011 10:46:53 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch 20 April 2011, 16:02:55 schrieb Paul Menzel:
> Date: Tue, 19 Apr 2011 10:38:34 +0200
>=20
> Task compile of `schroedinger_1.0.9` fails with Orc 0.4.13 the same way a=
s with Orc 0.4.12 with the following error message [1][2].
>=20
> 	[=E2=80=A6]
> 	schroorc.c: In function '_backup_orc_add2_rshift_add_s16_22_op':
> 	schroorc.c:93:3: error: 'int16_t' undeclared (first use in this function)
> 	schroorc.c:93:3: note: each undeclared identifier is reported only once =
for each function it appears in
> 	[=E2=80=A6]
>=20
> Therefore we disable the default preference of Orc 0.4.13 for the time be=
ing until the problems get resolved.
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/03=
2110.html
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/03=
1966.html
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/orc/orc_0.4.13.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/orc/orc_0.4.13.bb b/recipes/orc/orc_0.4.13.bb
> index 107dea6..adfe693 100644
> --- a/recipes/orc/orc_0.4.13.bb
> +++ b/recipes/orc/orc_0.4.13.bb
> @@ -1,4 +1,6 @@
>  require orc.inc
> =20
> +DEFAULT_PREFERENCE =3D "-1"
> +
>  SRC_URI[orc.md5sum] =3D "f6d0aed003f67c91933c22d9e5f1696a"
>  SRC_URI[orc.sha256sum] =3D "0fb8952ff688fe4b6f3b68cad49d4fb3cdfd28643b43=
410170601cc1f1e49601"
>=20

Acked-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>


