Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E0C0B601A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 15:49:32 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id z12so3659162wgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/8YHalLtlymp7Ol5mE9oSKLGlJ75p21NsjHU+QGqdO0=;
	b=0g9eCRt8hKfrJ3aWzFETPXqLIatJM9Hli+tFr0WHZ8pWindBSQHo43WDlkbCsHEiFP
	ZAGgP8C0Kc5XDB93xRrSXrEa4OsZ8IR/6TvCVi6fG4qLMhLcfvQgwjThi9DfgWEOVPs2
	iu+Ug/uWTvDQJWHrTkjyHTv5HoR0sPoBYGqMbOvMlaV1LnF6AXdfs9Gi6h14cQSxAQeQ
	TjFBi8JIYu1n4Tf5mKHpWLnhFwxHzj1YJaq0a7cebAguW1kt3MmrVjYyYruOMO7NLGSM
	aRZhy+imW6oWNmxbne8Vfn6bewNTIz4oS6eeDDUYGFvcM7GRWzosC6Fq61cXqoEYuuQT
	IU2A==
X-Received: by 10.180.90.237 with SMTP id bz13mr37770912wib.50.1414597773156; 
	Wed, 29 Oct 2014 08:49:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gp17sm5579654wjc.34.2014.10.29.08.49.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Oct 2014 08:49:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Oct 2014 16:49:37 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141029154937.GB15148@jama>
References: <1414336552-15191-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1414336552-15191-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] ddrescue: update to 1.19
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
X-List-Received-Date: Wed, 29 Oct 2014 15:49:41 -0000
X-Groupsio-MsgNum: 52672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2014 at 04:15:52PM +0100, Koen Kooi wrote:
> * License changed to GPLv2+
> * Although 'configure is present, it isn't autotools.
>=20
> Nota bene: this requires bitbake and oe-core support for tar.lz

Not sure if it's caused by incomplete bitbake and oe-core support for
tar.lz when I triggered that build, but it's strange how "silently" it
fails, but thinking a bit more about it, it's expected to happend with
the tar.lz just fetched into ${WORKDIR} without auto-unpack to create
expected ${S} :/.

NOTE: recipe ddrescue-1.19-r0: task do_populate_lic: Started
WARNING: Could not copy license file COPYING: [Errno 2] No such file or
directory:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/=
1.19-r0/ddrescue-1.19/COPYING'
WARNING: Could not copy license file main_common.cc: [Errno 2] No such
file or directory:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/=
1.19-r0/ddrescue-1.19/main_common.cc'
NOTE: recipe ddrescue-1.19-r0: task do_populate_lic: Succeeded

NOTE: Running task 20950 of 30030 (ID: 24086,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
ddrescue/ddrescue_1.19.bb,
do_configure)
NOTE: recipe ddrescue-1.19-r0: task do_configure: Started
ERROR: Function failed: do_configure (log file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/1=
=2E19-r0/temp/log.do_configure.10001)
ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/1=
=2E19-r0/temp/log.do_configure.10001
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
|
/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/1=
=2E19-r0/temp/run.do_configure.10001:
98:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/1=
=2E19-r0/temp/run.do_configure.10001:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/1=
=2E19-r0/ddrescue-1.19/configure:
not found
| WARNING: exit code 127 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/ddrescue/1=
=2E19-r0/temp/log.do_configure.10001)
NOTE: recipe ddrescue-1.19-r0: task do_configure: Failed
ERROR: Task 24086
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended=
/ddrescue/ddrescue_1.19.bb,
do_configure) failed with exit code '1'

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb | 18 ----------
>  meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb | 42 ++++++++++++++++=
++++++
>  2 files changed, 42 insertions(+), 18 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
>  create mode 100644 meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
>=20
> diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe=
/recipes-extended/ddrescue/ddrescue_1.16.bb
> deleted file mode 100644
> index a36c250..0000000
> --- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =3D "Data recovery tool"
> -DESCRIPTION =3D "GNU ddrescue is a data recovery tool. It copies data \
> -    from one file or block device (hard disc, cdrom, etc) to another, \
> -    trying hard to rescue data in case of read errors."
> -HOMEPAGE =3D "http://www.gnu.org/software/ddrescue/ddrescue.html"
> -SECTION =3D "console"
> -LICENSE =3D "GPLv3+"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949 \
> -                    file://main_common.cc;beginline=3D5;endline=3D16;md5=
=3Db5a59150a33658cc1ffc31b1a4ffb9f2"
> -
> -SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "57b67407e882c6418531d48a2f20d16b"
> -SRC_URI[sha256sum] =3D "76b3f2e5fb0306d24f2632c3e168cccb73dc0a348e3a7089=
cd9230748ff23de6"
> -
> -inherit autotools
> -
> -EXTRA_OECONF =3D "'CXX=3D${CXX}' 'CPPFLAGS=3D${CPPFLAGS}' 'CXXFLAGS=3D${=
CXXFLAGS}' 'LDFLAGS=3D${LDFLAGS}'"
> diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb b/meta-oe=
/recipes-extended/ddrescue/ddrescue_1.19.bb
> new file mode 100644
> index 0000000..a605249
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
> @@ -0,0 +1,42 @@
> +SUMMARY =3D "Data recovery tool"
> +DESCRIPTION =3D "GNU ddrescue is a data recovery tool. It copies data \
> +    from one file or block device (hard disc, cdrom, etc) to another, \
> +    trying hard to rescue data in case of read errors."
> +HOMEPAGE =3D "http://www.gnu.org/software/ddrescue/ddrescue.html"
> +SECTION =3D "console"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D76d6e300ffd8fb9d18bd9b136a9bb=
a13 \
> +                    file://main_common.cc;beginline=3D5;endline=3D16;md5=
=3D3ec288b2676528cd2b069364e313016f"
> +
> +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
> +SRC_URI[md5sum] =3D "ed6b5b82d74cbd925db2b829350e74b1"
> +SRC_URI[sha256sum] =3D "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a6=
2ca4eb140f4747b8"
> +
> +CONFIGUREOPTS =3D "\
> +    '--srcdir=3D${S}' \
> +    '--prefix=3D${prefix}' \
> +    '--exec-prefix=3D${exec_prefix}' \
> +    '--bindir=3D${bindir}' \
> +    '--datadir=3D${datadir}' \
> +    '--infodir=3D${infodir}' \
> +    '--sysconfdir=3D${sysconfdir}' \
> +    'CXX=3D${CXX}' \
> +    'CPPFLAGS=3D${CPPFLAGS}' \
> +    'CXXFLAGS=3D${CXXFLAGS}' \
> +    'LDFLAGS=3D${LDFLAGS}' \
> +"
> +EXTRA_OEMAKE =3D ""
> +
> +do_configure () {
> +    ${S}/configure ${CONFIGUREOPTS}
> +}
> +
> +do_install () {
> +    oe_runmake 'DESTDIR=3D${D}' install
> +    # Info dir listing isn't interesting at this point so remove it if i=
t exists.
> +    if [ -e "${D}${infodir}/dir" ]; then
> +        rm -f ${D}${infodir}/dir
> +    fi
> +}
> +
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRRDJEACgkQN1Ujt2V2gByeKQCfRs0IKhWLadP6WQoEDIffEMX2
SosAn2QLNe/r2xfguX2se7APAGdrrgOY
=CTxO
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
