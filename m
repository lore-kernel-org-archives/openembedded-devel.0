Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 57BB165DCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:14:24 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2993693eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0s6g4CNAjnOFje/3YZRXrEY/npesogzUmcrBRR6+it0=;
	b=JBEO0Pis4a4tiCoXHOeMF03z5HsSJnvdbcnS2SdKlokVVxOTU7FuBNJF9zTTK0nxj9
	/Txsr5qJ5/REWvTUhx3DNLmsy0RusWMfr/ECjlHLhSSljevmgpg2NJpHt9MhGI8PiwGZ
	zJZu7drtue+A+q3NAJRg5h1/t6XsGvJt1iEjq1GRjwrbZjv5KjYyVCSbFBQelB+jeAtu
	lH/hTwszU9OJwI62GpifZ7/m4m20nkfrK7dKv2s79tJo6ytVnNhKeaC6JUQiW1NHFgxz
	1hlwwQE69xgjjhQZ/w2MIpfHKLLByUu4EPSAU+1igis1JP9ABCxqOgF7CJAEPkoTc10g
	qaXA==
X-Received: by 10.14.211.133 with SMTP id w5mr4156475eeo.5.1398003264745;
	Sun, 20 Apr 2014 07:14:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q41sm94940480eez.7.2014.04.20.07.14.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:14:23 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:14:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420141428.GP2486@jama>
References: <1396361866-16682-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1396361866-16682-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [meta-oe][PATCH] rsyslog: remove unsupported option from initscript
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
X-List-Received-Date: Sun, 20 Apr 2014 14:14:24 -0000
X-Groupsio-MsgNum: 49353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="orrA+Dc/uYZgnQka"
Content-Disposition: inline

--orrA+Dc/uYZgnQka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 03:17:46PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jmitchell@cbnl.com>
>=20
> > starting rsyslogd ... rsyslogd: error: option -c
> > is no longer supported - ignored

Merged, thanks!

>=20
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog/initscript | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript b/meta-o=
e/recipes-extended/rsyslog/rsyslog/initscript
> index 8dee684..d011e8f 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> @@ -9,7 +9,7 @@ PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
>  NAME=3Drsyslog
>  RSYSLOGD=3Drsyslogd
>  RSYSLOGD_BIN=3D/usr/sbin/rsyslogd
> -RSYSLOGD_OPTIONS=3D"-c5"
> +RSYSLOGD_OPTIONS=3D""
>  RSYSLOGD_PIDFILE=3D/var/run/rsyslogd.pid
>  SCRIPTNAME=3D/etc/init.d/$NAME
>  # Exit if the package is not installed
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--orrA+Dc/uYZgnQka
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT1kQACgkQN1Ujt2V2gBznFQCZAfpxkl93lGbKJ1mJwSMwtueQ
o8sAn1nZ23F9C63uDFEKHly2xkGf23s6
=ajKo
-----END PGP SIGNATURE-----

--orrA+Dc/uYZgnQka--
