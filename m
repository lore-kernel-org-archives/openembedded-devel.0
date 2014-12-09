Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 53A2A71016
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:18:37 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so1146409wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IxAouKJWOOfrd/pHlIM9x5USC/HZkzv6l2fLNfMTBGI=;
	b=w3lxCrBxSzNIuRVkHUU4kMMj/2pl5wkyRf6LiIM3Z8VHWmO2ftwWp8ez5dxHdsD/9f
	aIyGUHc61YnCdRY1w6KVJWMTxtFf3WWEJp3VCCygaR0hXJy9+glNCa471rS9mEtOrvq8
	Qhzeb/N9Gu/pdLgpbos0NrBJ3F5IHcum9sQDHmqyGsBv/rn3hNkl0WdX8HjjeOj5GM/X
	/HZ+HQDEM2TAHcjFBPtCxoIKZhjg8VS2tbgmlnRAxfDqOj/rP6l1uZ9dRXNLxH/feSc8
	jfXdPImI8c/auZ3cU5l1K8jagOPkqtfERVEhiJ2zn6ZahwH/aR2YSfG/avKkdt8zFcaS
	w+rQ==
X-Received: by 10.180.90.206 with SMTP id by14mr3002122wib.67.1418120317684;
	Tue, 09 Dec 2014 02:18:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl11sm1090411wjc.40.2014.12.09.02.18.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:18:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:18:37 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209101837.GC2470@jama>
References: <1417425246-30891-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417425246-30891-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] logwatch: Add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 10:18:40 -0000
X-Groupsio-MsgNum: 53230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline

--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2014 at 05:14:06PM +0800, Qian Lei wrote:
> Logwatch is a customizable, pluggable log-monitoring system. It will go
> through your logs for a given period of time and make a report in the are=
as
> that you wish with the detail that you wish. Easy to use - works right ou=
t of
> the package on many systems.

Causes new QA warning:

logwatch-7.4.1: logwatch requires /usr/bin/perl, but no providers in its
RDEPENDS [file-rdeps]

>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../recipes-extended/logwatch/logwatch_7.4.1.bb    | 57 ++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
>=20
> diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb b/meta-o=
e/recipes-extended/logwatch/logwatch_7.4.1.bb
> new file mode 100644
> index 0000000..ee35efe
> --- /dev/null
> +++ b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
> @@ -0,0 +1,57 @@
> +SUMMARY =3D "A log file analysis program"
> +DESCRIPTION =3D "\
> +Logwatch is a customizable, pluggable log-monitoring system. It will go \
> +through your logs for a given period of time and make a report in the ar=
eas \
> +that you wish with the detail that you wish. Easy to use - works right o=
ut of \
> +the package on many systems.\
> +"
> +SECTION =3D "devel"
> +HOMEPAGE =3D "http://www.logwatch.org/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df2566bb12b16d2d80d90ebc533261=
aa7"
> +
> +SRC_URI =3D "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.=
tar.gz"
> +SRC_URI[md5sum] =3D "a0c3d8721f877bdcd4a9089eb1b4691b"
> +SRC_URI[sha256sum] =3D "35ec31f9fe981aaa727b144ab3ff2eb655997d8ccabaf665=
86458f5dfc3a56eb"
> +
> +do_install() {
> +    install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
> +    install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/logfiles
> +    install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/services
> +    install -m 0755 -d ${D}${localstatedir}/cache/logwatch
> +    mv conf/ ${D}${datadir}/logwatch/default.conf
> +    mv scripts/ ${D}${datadir}/logwatch/scripts
> +    mv lib ${D}${datadir}/logwatch/lib
> +
> +    install -m 0755 -d ${D}${mandir}/man1
> +    install -m 0755 -d ${D}${mandir}/man5
> +    install -m 0755 -d ${D}${mandir}/man8
> +    install -m 0644 amavis-logwatch.1 ${D}${mandir}/man1
> +    install -m 0644 postfix-logwatch.1 ${D}${mandir}/man1
> +    install -m 0644 ignore.conf.5 ${D}${mandir}/man5
> +    install -m 0644 override.conf.5 ${D}${mandir}/man5
> +    install -m 0644 logwatch.conf.5 ${D}${mandir}/man5
> +    install -m 0644 logwatch.8 ${D}${mandir}/man8
> +
> +    install -m 0755 -d ${D}${sysconfdir}/cron.daily
> +    install -m 0755 -d ${D}${sbindir}
> +    ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sysconfdir=
}/cron.daily/0logwatch
> +    ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sbindir}/l=
ogwatch
> +    cat > ${D}${sysconfdir}/cron.daily/0logwatch <<EOF
> +    DailyReport=3D\`grep -e "^[[:space:]]*DailyReport[[:space:]]*=3D[[:s=
pace:]]*" /usr/share/logwatch/default.conf/logwatch.conf | head -n1 | sed -=
e "s|^\s*DailyReport\s*=3D\s*||"\`
> +    if [ "\$DailyReport" !=3D "No" ] && [ "\$DailyReport" !=3D "no" ]
> +    then
> +            logwatch
> +    fi
> +EOF
> +    chmod 755 ${D}${sysconfdir}/cron.daily/0logwatch
> +
> +    install -m 0755 -d ${D}${sysconfdir}/logwatch/conf/logfiles
> +    install -m 0755 -d ${D}${sysconfdir}/logwatch/conf/services
> +    touch ${D}${sysconfdir}/logwatch/conf/logwatch.conf
> +    touch ${D}${sysconfdir}/logwatch/conf/ignore.conf
> +    touch ${D}${sysconfdir}/logwatch/conf/override.conf
> +    echo "# Local configuration options go here (defaults are in /usr/sh=
are/logwatch/default.conf/logwatch.conf)" > ${D}${sysconfdir}/logwatch/conf=
/logwatch.conf
> +    echo "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM R=
EPORT OUTPUT #####" > ${D}${sysconfdir}/logwatch/conf/ignore.conf
> +    echo "# Configuration overrides for specific logfiles/services may b=
e placed here." > ${D}${sysconfdir}/logwatch/conf/override.conf
> +}
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGzH0ACgkQN1Ujt2V2gBwq7QCfcJ/Lo3mru/wq/ikczd7GgF+x
LOMAniwiaY/VfKr+eVuzmS76zJpq+vg6
=qJtI
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
