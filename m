Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2296E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:00:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i138so214140wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l7hpav7VW3RCLbBYj4EhhWawG56XgxwbPXsExcJbsd0=;
	b=GIytMD6rEkkYPaWqq/NiKamqe46j36xkrffRU76sb5smC0jVq5bVmdetIwJcZ8Qjbu
	XwsUK5tdoWczonO0E3UuGxzHtU2omFjGSardwpp+JLYr5IPlkhHzfoXu8AEtEY8FMZTC
	wjKtehgdmlETINcAj/7TmaqgIRmbEjj3KgFQ44Ni8K2dNX3wC3MBECaDUru7H7XGM/sy
	Qx8VnCyVWpcjATh63ombBVPAL3/pEw+ITJIUb4J4WzK4o+DwR2naHCV7I+GptExivck4
	A6EqTcYUA/8OW0peTyFCQbYba1FT17HxkvOdH7W1KSCXxlRAPnStATejjP+8fEn6vpY1
	OVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l7hpav7VW3RCLbBYj4EhhWawG56XgxwbPXsExcJbsd0=;
	b=JooqL5Nj4DxNfJ2aYo4pXfV/mABWfFYh4p+jBQr98yGBamUonB0ODuiv4UqlY5HEYB
	m1YLvRZ8YLlqvxwU91l3Frwz98YiXjc/xNy7kGNQpJZlnkjOa66U9m8gyXHR00DMWb5b
	l8HH4+TRay2pWgvjGo93bZWwm6uTX3rCGIkyu4zFzh32wdnqhDjQXFTZhLccUReBsVyh
	lCmV/Z8XnS8fDI0ZX9xKWwHjOzhCxcFnJMqDzQZhQ8ICDzeDEDFAl69BH8gwW0DT2pyP
	CWbCOdtVGEfdzSGxyOOUBeKqKJxPsME6i0j6MIWXGk1zPnieWohyQxkXkPeyknpI3NmL
	cw4g==
X-Gm-Message-State: AEkoousIIM2V7urKLUn6QDryyitDRHkNTlBrsWL01+zpHUzZ5gTEyLftEIoo8LoxCOfBxw==
X-Received: by 10.28.69.203 with SMTP id l72mr201459wmi.51.1471536003385;
	Thu, 18 Aug 2016 09:00:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id g1sm2879105wjy.5.2016.08.18.09.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Aug 2016 09:00:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Aug 2016 18:00:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160818160002.ydacjrbdyknjmcwa@jama>
References: <1561177.QVzWruQ2fm@gyurco.localdomain>
MIME-Version: 1.0
In-Reply-To: <1561177.QVzWruQ2fm@gyurco.localdomain>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-webserver][PATCH]nginx: optimize systemd unit file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2016 16:00:04 -0000
X-Groupsio-MsgNum: 62715
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xhmfgtw3puva4jtd"
Content-Disposition: inline

--xhmfgtw3puva4jtd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 03:58:34PM +0200, Szombathelyi Gy=F6rgy wrote:
>     =20
>     - Call the nginx binary directly, no need to
>       wrap the SysV init file.
>     - Create /var/log/nginx with tmpfiles, like volatiles without systemd.
>     - Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)
>    =20
>     Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/met=
a-
> webserver/recipes-httpd/nginx/files/nginx.service
> index 9926a4b..ce99061 100644
> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> @@ -3,10 +3,9 @@ Description=3DNginx Server
>  After=3Dnetwork.target
>  [Service]
>  Type=3Dforking
> -PIDFile=3D@SYSCONFDIR@/nginx/run/nginx.pid
> -ExecStartPre=3D@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
> -ExecStart=3D@SYSCONFDIR@/init.d/nginx start
> -ExecStop=3D@SYSCONFDIR@/init.d/nginx stop
> +PIDFile=3D/run/nginx/nginx.pid
> +ExecStart=3D@SBINDIR@/nginx
> +ExecStop=3D@SBINDIR@/nginx -s stop
> +ExecReload=3D@SBINDIR@/nginx -s reload
>  [Install]
>  WantedBy=3Dmulti-user.target
> -
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/
> recipes-httpd/nginx/nginx.inc
> index fe51ca0..25ac7a4 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -75,6 +75,9 @@ do_install () {
>                 install -d ${D}${sysconfdir}/tmpfiles.d
>                 echo "d /run/${BPN} - - - -" \
>                      > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
> +                     >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +
>         fi
>         install -d ${D}${sysconfdir}/${BPN}
>         ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> @@ -90,6 +93,7 @@ do_install () {
>         install -d ${D}${sysconfdir}/nginx
>         install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/
> nginx.conf
>         sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/
> nginx.conf
> +       sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/
> nginx.conf
>         install -d ${D}${sysconfdir}/nginx/sites-enabled

Please fix your sender to stop wrapping long lines.

OE @ ~/meta-openembedded $ pwam 129537
2016-08-18 17:58:48
URL:https://patchwork.openembedded.org/patch/129537/mbox/ [3015] ->
"pw-am-129537.patch" [1]
Applying: nginx: optimize systemd unit file
fatal: corrupt patch at line 41
Patch failed at 0001 nginx: optimize systemd unit file
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


>         install -d ${D}${sysconfdir}/default/volatiles
> @@ -101,7 +105,7 @@ do_install () {
>              install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitd=
ir}/
> system/
>              sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>                      -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> -                    -e 's,@BASEBINDIR@,${base_bindir},g' \
> +                    -e 's,@SBINDIR@,${sbindir},g' \
>                      ${D}${systemd_unitdir}/system/nginx.service
>          fi
>  }
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xhmfgtw3puva4jtd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAle124EACgkQN1Ujt2V2gBwzrACgpMqh/225V9o21yfCCHsVxJFY
Zi0An2G9X8wWbMuNzDj5nA/3jkEyWEwg
=lsIl
-----END PGP SIGNATURE-----

--xhmfgtw3puva4jtd--
