Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmLt-0002m0-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:54:15 +0100
Received: by mail-wi0-f174.google.com with SMTP id hj13so547845wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0+llIlv45tB1jCgo5aHtleE/1tTZzwhZsiPOjnP+l3Q=;
	b=ev1KILLgGUPXy5vTS34fMxgGM9p2zOjjmq+y+nAlk/MlGSUa79CC2GeM3nHME4FVZa
	4TcGE2DtkGxrFU/T68itPzwJJrU0xCuAWqceO2X9dJ+kN67L22QjJuZRz0Gj7LLFLUBG
	CQsWhwb1tlBu/xTzVmSSwWDHrT1VUp8ZnXEwPyP+2qVzM/CR4KJ1BcTGgy8zrJTUj8sA
	YVgEjvMQuWR/mo+swj5gVbauNY7h3eDQLmYmhNr2x1i6qm0x24NdBzdiatDB1oxRRNd3
	zmVwHFLHKRvzGPERUWh/w4o8z6M2JejYC7V2yDLg2u5jgijNcpB1XZCNEG7OqXZGaN9g
	FokA==
X-Received: by 10.180.84.131 with SMTP id z3mr8765823wiy.25.1359369515949;
	Mon, 28 Jan 2013 02:38:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cu7sm11461065wib.8.2013.01.28.02.38.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:38:35 -0800 (PST)
Date: Mon, 28 Jan 2013 11:38:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128103839.GQ16904@jama.palm1.palmone.com>
References: <1358866841-31063-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <1358866841-31063-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] [meta-systemd] dropbear: read configuration from /etc/default/dropbear
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
X-List-Received-Date: Mon, 28 Jan 2013 10:54:18 -0000
X-Groupsio-MsgNum: 42874
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7kD9y3RnPUgTZee0"
Content-Disposition: inline

--7kD9y3RnPUgTZee0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 04:00:41PM +0100, Enrico Scholz wrote:
> Patch allows to specify additional parameters (e.g. '-B') by reading
> /etc/default/dropbear as a systemd environment file.  It applies
> $DROPBEAR_EXTRA_ARGS which used already by the oe-core sysv initscript.

Applied, thanks

>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service | =
3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear=
@.service b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.s=
ervice
> index 4fba3f0..813788f 100644
> --- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.servi=
ce
> +++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.servi=
ce
> @@ -4,6 +4,7 @@ Requires=3Ddropbearkey.service
>  After=3Dsyslog.target dropbearkey.service
> =20
>  [Service]
> -ExecStart=3D-/usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_ke=
y -p 22
> +EnvironmentFile=3D-/etc/default/dropbear
> +ExecStart=3D-/usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_ke=
y -p 22 $DROPBEAR_EXTRA_ARGS
>  ExecReload=3D/bin/kill -HUP $MAINPID
>  StandardInput=3Dsocket
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7kD9y3RnPUgTZee0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVS8ACgkQN1Ujt2V2gBzicgCgl03N76Ktlrmzkukbi4d4D+T9
ng0AoJasEencA1wVoM7dxhDhrkxJn1TB
=PR2E
-----END PGP SIGNATURE-----

--7kD9y3RnPUgTZee0--
