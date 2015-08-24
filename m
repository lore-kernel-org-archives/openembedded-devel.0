Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8614F76B2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:28:45 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so70649231wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1deUap6copVTSJ3r7xvQtBxjGxj+MHqCQpgvBDVln5s=;
	b=SMcxRndwRsgxGLzLrUskn9qIuSxeBRYfyz+ILktKbg/D6k6K2dyy9QT/rqi97Y4cFV
	BCW0P2EJaf3Jpz+i93tE1udZdTIMPu0AVnZH2g2Wg58KTZrp8d6bujLbgChzKagmDdnT
	xifoiGAKLyjUh8Hkngdoyz4Q3TqVTq/F1QvztWzzA2QxJiJCA6i2byVWdDND+e6QG1Aw
	P8dL49gtbHRphpHqAEJ5o/9DU/k7AqiAUf9KuDFZX4VGdhP+OTx3kfrSJCbp2qhGqryu
	w7OUHc4PhP82zRNk103RLWpNTs3UM7abrzQvttFOFtMPtyow/81LAH0w33dPPXiXhd/n
	l/9g==
X-Received: by 10.180.96.164 with SMTP id dt4mr30232743wib.53.1440419325094;
	Mon, 24 Aug 2015 05:28:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vl1sm23043481wjc.0.2015.08.24.05.28.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:28:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Aug 2015 14:28:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150824122848.GB2446@jama>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
	<1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
	<30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 1/5] waf-samba: add new class
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
X-List-Received-Date: Mon, 24 Aug 2015 12:28:45 -0000
X-Groupsio-MsgNum: 56940
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2015 at 01:11:03AM +0000, Bian, Naimeng wrote:
> > -----Original Message-----
> > From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > Sent: Thursday, August 20, 2015 11:59 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Bian, Naimeng; Koen Kooi
> > Subject: [meta-oe][PATCH 1/5] waf-samba: add new class
> >=20
> > From: Bian Naimeng <biannm@cn.fujitsu.com>

I've merged Bian's implementation, because it was passing jenkins builds
now, can one of you please send rebased version of these patches?

> >=20
> > waf-samba is a build system used by samba related software
> >=20
> > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >  meta-oe/classes/waf-samba.bbclass | 51
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 meta-oe/classes/waf-samba.bbclass
> >=20
> > diff --git a/meta-oe/classes/waf-samba.bbclass
> > b/meta-oe/classes/waf-samba.bbclass
> > new file mode 100644
> > index 0000000..b8e010a
> > --- /dev/null
> > +++ b/meta-oe/classes/waf-samba.bbclass
> > @@ -0,0 +1,51 @@
> > +# waf is a build system which is used by samba related project.
> > +# Obtain details from https://wiki.samba.org/index.php/Waf
> > +#
> > +inherit qemu pythonnative
> > +
> > +DEPENDS +=3D "qemu-native libxslt-native docbook-xsl-stylesheets-native
> > python"
> > +
> > +CONFIGUREOPTS =3D " --prefix=3D${prefix} \
> > +                  --bindir=3D${bindir} \
> > +                  --sbindir=3D${sbindir} \
> > +                  --libexecdir=3D${libexecdir} \
> > +                  --datadir=3D${datadir} \
> > +                  --sysconfdir=3D${sysconfdir} \
> > +                  --sharedstatedir=3D${sharedstatedir} \
> > +                  --localstatedir=3D${localstatedir} \
> > +                  --libdir=3D${libdir} \
> > +                  --includedir=3D${includedir} \
> > +                  --oldincludedir=3D${oldincludedir} \
> > +                  --infodir=3D${infodir} \
> > +                  --mandir=3D${mandir} \
> > +                "
> > +
> > +do_configure() {
> > +    qemu_binary=3D"${@qemu_target_binary(d)}"
> > +    if [ ${qemu_binary} =3D=3D "qemu-allarch" ]; then
> > +        qemu_binary=3D"qemuwrapper"
> > +    fi
> > +
> > +    libdir_qemu=3D"${STAGING_DIR_HOST}/${libdir}"
> > +    base_libdir_qemu=3D"${STAGING_DIR_HOST}/${base_libdir}"
> > +    oldest_kernel_qemu=3D${OLDEST_KERNEL}
> > +
> > +    CROSS_EXEC=3D"${qemu_binary} \
> > +                -r ${oldest_kernel_qemu} \
> > +                -L ${STAGING_DIR_HOST} \
> > +                -E LD_LIBRARY_PATH=3D${libdir_qemu}:${base_libdir_qemu=
}"
> > +
> > +    export BUILD_SYS=3D${BUILD_SYS}
> > +    export HOST_SYS=3D${HOST_SYS}
> > +    export BUILD_ARCH=3D${BUILD_ARCH}
> > +    export HOST_ARCH=3D${HOST_ARCH}
> > +    export STAGING_LIBDIR=3D${STAGING_LIBDIR}
> > +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> > +    export PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> > +
> > +    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile
> > --cross-execute=3D"${CROSS_EXEC}"
> > --cross-answers=3D${B}/cross-answers-${TARGET_ARCH}.txt
>=20
> Thanks for your update.
>=20
> Would you tell me why both --cross-execute and --cross-answer are require=
d.
> If the --cross-answers is not be required, IMO, we do not need support it.
> Because it will be not an easy job to maintain cross-answers-${TARGET_ARC=
H}.txt for
> each waf-samba.bbclass based recipe.
>=20
> Thanks
>  Bian
>=20
> > +}
> > +
> > +do_install() {
> > +    oe_runmake install DESTDIR=3D${D}
> > +}
> > --
> > 2.0.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXbDgAACgkQN1Ujt2V2gBwEyACgpJsuMZZmRv6nFsP6WHZem/Jm
LsYAoLL4maysoOZawL+1HlE3eDBigkhY
=HYXj
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
