Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9735C6D128
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 14:56:34 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id x13so21453186ief.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2013 06:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=yBDpX1NTquVZbkkYttlMA1J7cbR7OiZRr/1WfKRSRQ8=;
	b=hPGTg+1D0nijq2ZWpfDg8n8G9q2Y/Q/ODIA5+mDWEVHQql4stW3XCL+YtO9ovjitA1
	hsW6XqCzZZrVKTnly68KErPf/sYRQ/+gFZdtDEWy8xLeJKn3SJdC8HZlI1WArjN/m4i7
	uqZml85Wel5tnQ3fKTk32u4LzxXHZcdXG+eojCdiUWHaXlnPNy+F8v5zDJTFJJP/C5SI
	19zJdZU0gd7t3LURJN3RrYmOjkpD/zMJX9qwzml37iYAYflyJF85axpVOUw/7gbpU1KI
	3GBF24pNkSi7dPl4cXM/gHVqlbiuhp7GIece+S7M+bHPbuOQdG+BM2tEuquJ4sTM60WC
	bU/A==
MIME-Version: 1.0
X-Received: by 10.43.124.134 with SMTP id go6mr997836icc.84.1385996194395;
	Mon, 02 Dec 2013 06:56:34 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Mon, 2 Dec 2013 06:56:34 -0800 (PST)
In-Reply-To: <l7i615$91m$1@ger.gmane.org>
References: <1385993511-14838-1-git-send-email-s.mennetrier@innotis.org>
	<l7i615$91m$1@ger.gmane.org>
Date: Mon, 2 Dec 2013 15:56:34 +0100
X-Google-Sender-Auth: HItIKiOm-PSP02Hm3iny-cy-jJk
Message-ID: <CABgO3_PQBTfeogsTJjSs6u_04jP5FceqVvqkRjNnpZgiOt+OaQ@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCH] Add nginx http webserver
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
X-List-Received-Date: Mon, 02 Dec 2013 14:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/12/2 Koen Kooi <koen@dominion.thruhere.net>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> S=E9bastien Mennetrier schreef op 02-12-13 15:11:
> > From: S=E9bastien <s.mennetrier@innotis.org>
> =3D
> > +    install -d ${D}${sysconfdir}/init.d +    cat ${WORKDIR}/init | \ +
> > sed -e 's,/usr/sbin/,${sbindir}/,g' \ +            -e
> > 's,/etc/,${sysconfdir}/,g' > ${D}/${sysconfdir}/init.d/nginx +    chmod
> > 755 ${D}/${sysconfdir}/init.d/nginx
>
> I think using sed -i will be easier to understand, I haven't seen any pip=
e
> based modifications in an OE recipe yet.
>
> This method is used in apache2 recipe... But I can modify if it's
necessary.

>
> > + +    install -d ${D}${sysconfdir}/nginx +    cat ${WORKDIR}/nginx.con=
f
> > | \ +        sed -e 's,/var/,${localstatedir}/,g' >
> > ${D}/${sysconfdir}/nginx/nginx.conf +    chmod 644
> > ${D}/${sysconfdir}/nginx/nginx.conf +    install -d
> > ${D}${sysconfdir}/nginx/sites-enabled + +    install -d
> > ${D}${sysconfdir}/default/volatiles +    cat
> > ${WORKDIR}/nginx-volatile.conf | \ +        sed -e
> > 's,/var/,${localstatedir}/,g' >
> > ${D}${sysconfdir}/default/volatiles/99_nginx +    chmod 644
> > ${D}${sysconfdir}/default/volatiles/99_nginx + +    rm -fr
> > "${D}${localstatedir}/run" +} + +CONFFILES_${PN} =3D
> > "${sysconfdir}/nginx/nginx.conf \ +
> > ${sysconfdir}/nginx/fastcgi.conf\ +
> > ${sysconfdir}/nginx/fastcgi_params \ +        ${sysconfdir}/nginx/koi-u=
tf
> > \ +        ${sysconfdir}/nginx/koi-win \ +
> > ${sysconfdir}/nginx/mime.types \ +        ${sysconfdir}/nginx/scgi_para=
ms
> > \ +        ${sysconfdir}/nginx/uwsgi_params \ +
> > ${sysconfdir}/nginx/win-utf \ +        ${sysconfdir}/init.d/nginx \ +" =
+
> > +INITSCRIPT_NAME =3D "nginx" +INITSCRIPT_PARAMS =3D "defaults 92 20" +
> > +FILES_${PN} +=3D "${localstatedir} \ +                /run \ +
> > " + +USERADD_PACKAGES =3D "${PN}" +USERADD_PARAM_${PN} =3D " \ +    --s=
ystem
> > --no-create-home \ +    --home ${localstatedir}/www/localhost \ +
> > --groups www-data \ +    --user-group www"
> >
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFSnJt0MkyGM64RGpERAu5zAJ40O7GXBDLlkBdThmA1OBstF+mJ9ACgmmjs
> HwVpGhfux7+iRWIOYfJgTbw=3D
> =3DQBo2
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

