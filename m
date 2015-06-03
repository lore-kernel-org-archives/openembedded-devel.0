Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 896C36AD0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 10:11:24 +0000 (UTC)
Received: by wibut5 with SMTP id ut5so97013373wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=kDER9D69MLDQEFUIQnmX/rg0iSNreG8YI8FYSnBkdBU=;
	b=umXIkfVd4FspEZbgUDZuyQ0bwBDNndGb1unb2D+uydZNrvRKznmVZSqkMvPb7OsiH3
	2EbFyu6lDrMuEhfzmlGOhlc6ygxARepw8gnCXJojhExg/hZxaFehbf7rz4X5HbDrun9k
	2YLF5ARnHJieKWfvuKVyACSuQKQqIk0cPQSKYGG0F5vCU4RgI0nII/IbwgtXLZff8uhL
	izk6YOse+d+TgAyowA5XxYzWAkWcrv+8Dt76qD6HK9UWtBO+5wDZZ7g8pZBqHvELSR1b
	m/2vp4zgYgDL2f5p7QQCkprHjSQXZVhtkKXeQi2/hwI+0zeBwtUrNBpPbrKZcin3EpGc
	wjPg==
X-Received: by 10.180.211.196 with SMTP id ne4mr28998267wic.23.1433326285093; 
	Wed, 03 Jun 2015 03:11:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id um5sm347091wjc.1.2015.06.03.03.11.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jun 2015 03:11:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Jun 2015 12:11:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150603101138.GA2380@jama>
References: <1433324376-3374-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1433324376-3374-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] php: add a vardeps for configure on sysconfdir
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
X-List-Received-Date: Wed, 03 Jun 2015 10:11:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2015 at 05:39:36PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> building php will fail when sstatus is used, since some hardcode paths

what's sstatus? did you mean sstate?

> in php-native will make the wrong path, and try to fix it like below:
>     do_install_append_virtclass-native() {
>            create_wrapper ${D}${bindir}/php \
>                PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/ \
>     }
> but php-native does not work for a 64bit target(qemuarm64) and if sstat is
> from a 32bit(qemuppc) on the host same machine.
>=20
> Consider no too much package depends on php-native, so add a vardeps for
> configure on sysconfdir to force php-native to build always.

Please improve the commit message, from this I'm still not sure what
this is supposed to fix.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php_5.5.24.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes=
-devtools/php/php_5.5.24.bb
> index 3e656af..9c0dd7f 100644
> --- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
> @@ -106,6 +106,8 @@ EXTRA_OEMAKE =3D "INSTALL_ROOT=3D${D}"
> =20
>  acpaths =3D ""
> =20
> +do_configure[vardeps] +=3D "${sysconfdir}"
> +
>  do_configure_prepend () {
>      rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
>      find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=3D.*!APXS=
_HTTPD=3D${STAGING_BINDIR_NATIVE}/httpd!'
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

