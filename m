Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiOdp-0003jo-2m for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 11:27:35 +0200
Received: from f053041140.adsl.alicedsl.de ([78.53.41.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiOdh-0008Jn-NV for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 09:27:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E17@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E17@deimsg40.de.net.world>
Date: Mon, 09 Aug 2010 11:27:22 +0200
Message-ID: <1281346042.3767.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling (resent)
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
X-List-Received-Date: Mon, 09 Aug 2010 09:27:35 -0000
X-Groupsio-MsgNum: 21979
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-58qSTZ5Biw+0Y6+il9+l"

--=-58qSTZ5Biw+0Y6+il9+l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Wolfgang,


thank you for your effort. If the subject line is that long, please put
[RESENT] after [PATCH] so that the tools can strip it automatically.

Am Montag, den 09.08.2010, 10:12 +0200 schrieb Hauser, Wolfgang (external):
> busybox: fix defconfig/.config usage; add inetd, telnetd package; add
> inetd support for ftpd, telnetd, httpd
>=20
> *Use ${S}/.config instead of ${WORKINGDIR}/defconfig for installing
> confguration dependend parts.
> *This applies the changes done by DISTRO_FEATURES processing.
> *Added configuration dependend packages for inetd, telnetd, httpd which
> enable inetd based daemon starting or standalone starting.
> *Enable starting of ftpd by inetd.

as pointed out in another post by someone, the commit policy require a
Signed-off-by: Name <address> line [1].

> ---
>  recipes/busybox/busybox.inc           |  220
> ++++++++++++++++++++++++++++++---

It looks like your MUA mangled the patch. You should turn off automatic
line wrapping, use `git-send-email` or attach the patches.

[=E2=80=A6]

Please send a second revision marked as [PATCH v2] and remember to
update the patch queue [2].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Patchwork

--=-58qSTZ5Biw+0Y6+il9+l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxfyfUACgkQPX1aK2wOHVh1/gCdG12/8Z8aiJoGgbFeq/JQHAU9
sdAAnjhc/sRjkwmSVn5bch/eJvlNtUza
=X00q
-----END PGP SIGNATURE-----

--=-58qSTZ5Biw+0Y6+il9+l--
