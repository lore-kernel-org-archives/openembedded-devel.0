Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4C2C728C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 06:16:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ6Gbtg014861
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 22:16:37 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.42]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Thu, 18 Dec 2014 22:16:37 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>, "paul@paulbarker.me.uk" <paul@paulbarker.me.uk>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] vim: add recipe for vim-tiny
Thread-Index: AQHP+ZrtUUZsrbyQLkusTWEfoYvcQ5yWs2EA
Date: Fri, 19 Dec 2014 06:16:36 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAD2A5639D@ALA-MBB.corp.ad.wrs.com>
References: <1415262147-15816-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1415262147-15816-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.197]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] vim: add recipe for vim-tiny
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
X-List-Received-Date: Fri, 19 Dec 2014 06:16:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Thursday, November 06, 2014 4:22 PM
> To: openembedded-devel@lists.openembedded.org; Martin.Jansa@gmail.com;
> paul@paulbarker.me.uk; raj.khem@gmail.com
> Subject: [oe] [meta-oe][PATCH v2] vim: add recipe for vim-tiny
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - Add bb for vim-tiny based on vim.bb
> - Change PACKAGECONFIG and do_install for vim-tiny
> - Change BPN to vim in vim.bb so it works fine when required by vim-tiny
> - Add proper alternative links for vim and vim-tiny to avoid conflicts
> - Don't use do_install_append in vim.bb so it works fine when required by=
 vim-tiny
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb | 13 +++++++++++++
>  meta-oe/recipes-support/vim/vim_7.4.481.bb      | 20 +++++++++++++------=
-
>  2 files changed, 26 insertions(+), 7 deletions(-)  create mode 100644 me=
ta-oe/recipes-
> support/vim/vim-tiny_7.4.481.bb
>=20
> diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb b/meta-oe/re=
cipes-support/vim/vim-
> tiny_7.4.481.bb
> new file mode 100644
> index 0000000..bb8f2b7
> --- /dev/null
> +++ b/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
> @@ -0,0 +1,13 @@
> +require vim_${PV}.bb
> +
> +SUMMARY +=3D " (with tiny features)"
> +
> +PACKAGECONFIG +=3D "tiny"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny }
> +
> +ALTERNATIVE_PRIORITY =3D "90"
> +ALTERNATIVE_TARGET =3D "${bindir}/vim.tiny"
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes=
-
> support/vim/vim_7.4.481.bb
> index b85ff63..7490229 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> @@ -12,9 +12,9 @@ SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhtt=
ps;module=3Dvim \  "
>  SRCREV =3D "v7-4-481"
>=20
> -S =3D "${WORKDIR}/${BPN}/src"
> +S =3D "${WORKDIR}/vim/src"
>=20
> -VIMDIR =3D "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).=
split('.')[1]}"
> +VIMDIR =3D "vim${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).spl=
it('.')[1]}"
>=20
>  inherit autotools update-alternatives
>  inherit autotools-brokensep
> @@ -59,7 +59,9 @@ EXTRA_OECONF =3D " \
>      STRIP=3D/bin/true \
>  "
>=20
> -do_install_append() {
> +do_install() {
> +    autotools_do_install
> +
>      # Work around rpm picking up csh or awk or perl as a dep
>      chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>      chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> @@ -67,6 +69,9 @@ do_install_append() {
>=20
>      # Install example vimrc from runtime files
>      install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/=
vimrc
> +
> +    # we use --with-features=3Dbig as default
> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>  }
>=20
>  PARALLEL_MAKEINST =3D ""
> @@ -97,7 +102,8 @@ RDEPENDS_${PN} =3D "ncurses-terminfo-base"
>  # Recommend that runtime data is installed along with vim  RRECOMMENDS_$=
{PN} =3D "${PN}-syntax
> ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
>=20
> -ALTERNATIVE_${PN} =3D "vi"
> -ALTERNATIVE_TARGET[vi] =3D "${bindir}/${BPN}"
> -ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> -ALTERNATIVE_PRIORITY[vi] =3D "100"
> +ALTERNATIVE_${PN} =3D "vi vim"
> +ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
> +ALTERNATIVE_LINK_NAME[vi] =3D "${bindir}/vi"
> +ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
> +ALTERNATIVE_PRIORITY =3D "100"
> --
> 2.0.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

