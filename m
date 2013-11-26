Return-Path: <joe@deserted.net>
Received: from mail-qe0-f52.google.com (mail-qe0-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2766DD48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 16:25:04 +0000 (UTC)
Received: by mail-qe0-f52.google.com with SMTP id ne12so5968602qeb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=o2W4nGN17j6j7qkvv/ol6KgT5NjFwXL13cQzxz9lGoM=;
	b=KLfYmg8a95MKWq/upzmDxffySOTGHye+JXYBueKa3X3vFqL6DmAcHC96DEd3pC1hpN
	1Fv2Y+tv5YC185T6qoo/9vLlhCAnRXP0PwftWFZ5lvdegZIYlPPdM+LAjnYvlf6clk2J
	6i9E6hxisgUEYZ0bRG9prtrMvAN/jjxpz5L54PPzFmBxBfcFZSKS8DgGTaCq3GjMEKIf
	b+YPG4ZcNKHMSEylCGlmq7kmCTl33tWDa8AkI2ANlOSftz83Q9qa64F4ex73EbJ0lVSK
	1Vxilte51Ldj0uY3AQnr09P9WCqO4JMeMEDo/0PlbUXmOqS/uRKQ6laq+kWqLqnX+GV/
	KGWQ==
X-Gm-Message-State: ALoCoQlIMEuLONc5XJSaUAjimFtitmaQsRbsfdOuGdUzb1pRodeRpbS9rKD1cRhfqeibqeH4BdyU
X-Received: by 10.224.62.4 with SMTP id v4mr51806239qah.41.1385483103926;
	Tue, 26 Nov 2013 08:25:03 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id o10sm86697849qaa.6.2013.11.26.08.25.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 08:25:03 -0800 (PST)
Date: Tue, 26 Nov 2013 11:25:00 -0500
From: Joe MacDonald <joe@deserted.net>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20131126162459.GF3939@deserted.net>
References: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
	<1384897838-11066-4-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1384897838-11066-4-git-send-email-mark.hatle@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 3/3] ntpd: make start-stop-daemon command available for ntpd
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
X-List-Received-Date: Tue, 26 Nov 2013 16:25:04 -0000
X-Groupsio-MsgNum: 47272
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dgjlcl3Tl+kb3YDk"
Content-Disposition: inline

--dgjlcl3Tl+kb3YDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also merged.  Thanks.
-J.

[[meta-networking][PATCH 3/3] ntpd: make start-stop-daemon command availabl=
e for ntpd] On 13.11.19 (Tue 15:50) Mark Hatle wrote:

> From: Qiang Chen <qiang.chen@windriver.com>
>=20
> If ntpd script is being called by a non-root user using sudo,
> it will fail as follows:
>=20
> /etc/init.d/ntpd restart
> Stopping ntpd: /etc/init.d/ntpd: line 29: start-stop-daemon:
> command not found
> done
> Starting ntpd: /etc/init.d/ntpd: line 24: start-stop-daemon:
> command not found
> done
>=20
> This is because /etc/init.d/ntpd calls start-stop-daemon which
> is in /sbin (not in the default path for non-root users)
>=20
> Explicitly configure the PATH to include /sbin.
>=20
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
>=20
> Reworked to set PATH instead of hardcode the location of start-stop-daemon
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntpd | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networ=
king/recipes-support/ntp/files/ntpd
> index ae50f13..53fa2d1 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpd
> +++ b/meta-networking/recipes-support/ntp/files/ntpd
> @@ -1,5 +1,7 @@
>  #! /bin/sh
>  #
> +PATH=3D/sbin:/bin:/usr/bin:/usr/sbin
> +
>  # ntpd	init.d script for ntpdc from ntp.isc.org
>  test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
>  # rcS contains TICKADJ
--=20
-Joe MacDonald.
:wq

--dgjlcl3Tl+kb3YDk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUy1sACgkQwFvcllog0XxbtgCaA7vaqhraWWWt2gqp9OzfwvhH
aWYAnjo5l7vQKV5xdsVC470AJB0Ka+4o
=+G6H
-----END PGP SIGNATURE-----

--dgjlcl3Tl+kb3YDk--
