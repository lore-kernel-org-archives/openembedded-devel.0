Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE0F75D7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:43:48 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so340512787wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oAmfsFlgqnvX4XkL4rTRNxiFsBg0FQqjgLv+eoSmP2Q=;
	b=ona6odjybpALiE3uVLCu1oCENXocS60IWHBzDeojet6KLT+bTN2VI43DCRPf+gQmTz
	vKj6KgaXmQHD75RToq+rkBKouEhpSI56SEYczPuqMQt4HjZAeuLqCxyQzEA1JYdZ6WLf
	jbmCxtblsAvtUqlvT0h7P55H7nDEuTNk+K2iraUdaWQOzKsC0bIeQ1TRtzjYlLaD2udr
	dKKLokFOwqtEI4E84TiVK3PZF3YJ5Q2cIMJkMFdElNfm+HGq1v4PLz4gvmatsAc4noXO
	/8AekfQv92LlU5Z7sZ2jDmcJ22Vs+jKeD3F9zp5W7DfBnNd6umBzlOyq3TXUO9BL1jhe
	tGrg==
X-Received: by 10.194.172.130 with SMTP id bc2mr19552566wjc.85.1436352228001; 
	Wed, 08 Jul 2015 03:43:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id qq1sm2800539wjc.0.2015.07.08.03.43.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 03:43:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Jul 2015 12:43:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150708104356.GE2398@jama>
References: <1436325674-22267-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1436325674-22267-1-git-send-email-jian.liu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] ypbind-mt: set path of ypdomainname in ypbind script
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
X-List-Received-Date: Wed, 08 Jul 2015 10:43:51 -0000
X-Groupsio-MsgNum: 56189
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline

--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 11:21:14AM +0800, Jian Liu wrote:
> The script ypbind will cause error if using ypdomainname command
> provided by busybox. So add RDEPENDCY on yp-tools and change
> the path of ypdomainname.

Missing meta-networking/ prefix

> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  recipes-support/nis/files/ypbind-yocto.init | 11 ++++++-----
>  recipes-support/nis/ypbind-mt_1.36.bb       |  1 +
>  2 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-support/nis/files/ypbind-yocto.init b/recipes-suppor=
t/nis/files/ypbind-yocto.init
> index da533a1..f97a3e1 100644
> --- a/recipes-support/nis/files/ypbind-yocto.init
> +++ b/recipes-support/nis/files/ypbind-yocto.init
> @@ -26,6 +26,7 @@
> =20
>  YPBIND_BIN=3D/usr/sbin/ypbind
>  pidfile=3D/var/run/ypbind.pid
> +YPDOMAINNAME_bin=3D/usr/bin/ypdomainname
> =20
>  [ -f /etc/default/ypbind ] && . /etc/default/ypbind
> =20
> @@ -34,14 +35,14 @@ case "$1" in
>  	echo -n "Starting ypbind"
>  	## If the domainname is not set, skip starting of ypbind
>  	## and return with "program not configured"
> -        /bin/ypdomainname &> /dev/null
> -        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
> +        $YPDOMAINNAME_bin &> /dev/null
> +        if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
>             if [ -f /etc/defaultdomain ]; then
>               XDOMAINNAME=3D`cat /etc/defaultdomain`
> -             /bin/ypdomainname "$XDOMAINNAME"
> +             $YPDOMAINNAME_bin "$XDOMAINNAME"
>  	   fi
> -           /bin/ypdomainname &> /dev/null
> -           if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
> +           $YPDOMAINNAME_bin &> /dev/null
> +           if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
>  	     # Tell the user this has skipped
>  	     echo -n " . . . . . . . . . . No domainname set"
>               # service is not configured
> diff --git a/recipes-support/nis/ypbind-mt_1.36.bb b/recipes-support/nis/=
ypbind-mt_1.36.bb
> index 35ef16a..4fdef9f 100644
> --- a/recipes-support/nis/ypbind-mt_1.36.bb
> +++ b/recipes-support/nis/ypbind-mt_1.36.bb
> @@ -50,3 +50,4 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "ypbind.service"
> +RDEPENDS_${PN} +=3D "yp-tools"
> --=20
> 1.8.5.2.233.g932f7e4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWc/usACgkQN1Ujt2V2gBzILgCfYUPnqW0oBrAllEY8F70DRcT/
x2MAnA6AyHeEcAflniiEEuEhnYhL5BJx
=GOQa
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
