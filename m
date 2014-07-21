Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A64A7020E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 17:01:50 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so6730456wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/lDThq5ua4CvwepA6If9ZZ2ozd/g7BHL9v5FP1TWSh0=;
	b=mSSGXJ/RSSmsoEtxThqxgiVMJ+AcvoP12XSO7a3WRaGUBeeXYJZ5n8LTd5L3MXps+Z
	eV5DF0EfegsARh5mfQSqL2HBIiXw8/DpQwA3CcqEU2o/rFAoLPCJdmfOYjQZAEf0sTRn
	d51H0LxABQ831r/cLDHPybppe9CC67cYoA1FwRskD2LFVOv+BCiS23kJTHg3iyC/fCcO
	BEvbSpyRaVia02oEXbnUZdBG7csgO/KopkeHBdVLjqWlroVoVPUgyujwezl0tvnxOPt1
	/kqf4z+K+l0K/TGM43e8aeZMo1TBwLJ5nGgaVEvF9KRvsyDXNAY49NzMctH/ZfP3SxZH
	/PzA==
X-Received: by 10.180.38.51 with SMTP id d19mr6258896wik.10.1405962110560;
	Mon, 21 Jul 2014 10:01:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g8sm43854110wib.18.2014.07.21.10.01.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 10:01:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Jul 2014 19:02:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721170203.GK22875@jama>
References: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
	<1405957930-15362-4-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <1405957930-15362-4-git-send-email-ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 4/4] syslog-ng: Improved initscript VERBOSE handling.
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
X-List-Received-Date: Mon, 21 Jul 2014 17:02:03 -0000
X-Groupsio-MsgNum: 51153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
Content-Disposition: inline

--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 10:52:10AM -0500, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>=20
> The messages echoed when starting and stopping syslog-ng are currently
> printed regardless of the setting of VERBOSE.  Adjust the initscript so
> they're only printed when VERBOSE is enabled.

Can you please try to integrate fixes sent by RP?

Or add it as last commit in your series.

> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta-oe/recipes-support/syslog-ng/files/initscript | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe=
/recipes-support/syslog-ng/files/initscript
> index b95e8ad..014997b 100644
> --- a/meta-oe/recipes-support/syslog-ng/files/initscript
> +++ b/meta-oe/recipes-support/syslog-ng/files/initscript
> @@ -11,14 +11,14 @@ test -x "$syslog_ng" || exit 0
> =20
>  case "$1" in
>    start)
> -    echo -n "Starting syslog-ng:"
> +    [ "${VERBOSE}" !=3D "no" ] && echo -n "Starting syslog-ng:"
>      start-stop-daemon --start --quiet --exec $syslog_ng
> -    echo "."
> +    [ "${VERBOSE}" !=3D "no" ] && echo "."
>      ;;
>    stop)
> -    echo -n "Stopping syslog-ng:"
> +    [ "${VERBOSE}" !=3D "no" ] && echo -n "Stopping syslog-ng:"
>      start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> -    echo "."
> +    [ "${VERBOSE}" !=3D "no" ] && echo "."
>      ;;
>    reload|force-reload)
>      start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
> --=20
> 2.0.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPNR4sACgkQN1Ujt2V2gByyDwCgtEFVtebJxD5myOwFJa3j7GGY
wIUAoKjbKXIlW8rw70HBXPpuXEpg/tlA
=Ucpo
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--
