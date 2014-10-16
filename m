Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD77B60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 10:28:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9GASfsM015466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 03:28:41 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Thu, 16 Oct 2014 03:28:41 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v2] mtools: fix broken /usr/bin/lz
Thread-Index: AQHP6SvFPOxEUg14WUSomcf2kWmUU5wyhUKg
Date: Thu, 16 Oct 2014 10:28:40 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD5236A9@ALA-MBB.corp.ad.wrs.com>
References: <1413455209-12127-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1413455209-12127-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtools: fix broken /usr/bin/lz
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
X-List-Received-Date: Thu, 16 Oct 2014 10:28:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, this should be in oe-core, please ignore this.

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Thursday, October 16, 2014 6:27 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH v2] mtools: fix broken /usr/bin/lz
>=20
> From: Wenlin Kang <wenlin.kang@windriver.com>
>=20
> When build fs with mtools-3.9.9, has file /usr/bin/lz in rootfs, it is th=
e symlink to uz:
>=20
> root@qemu3:~# /usr/bin/lz
> -sh: /usr/bin/lz: No such file or directory $root@qemu3:~# ls -l /usr/bin=
/lz lrwxrwxrwx 1 root root 2 Jul
> 18 18:07 /usr/bin/lz -> uz root@qemu3:~# uz
> -sh: uz: command not found
>=20
> But the uz isn't actually exist, so the result is that lz is a broken sym=
link.
>=20
> The root cause is that uz hasn't been installed when install-scripts.
>=20
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../mtools/mtools/fix-broken-lz.patch              | 23 ++++++++++++++++=
++++++
>  meta/recipes-devtools/mtools/mtools_3.9.9.bb       |  4 +++-
>  2 files changed, 26 insertions(+), 1 deletion(-)  create mode 100644 met=
a/recipes-
> devtools/mtools/mtools/fix-broken-lz.patch
>=20
> diff --git a/meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch b/me=
ta/recipes-
> devtools/mtools/mtools/fix-broken-lz.patch
> new file mode 100644
> index 0000000..cb45491
> --- /dev/null
> +++ b/meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch
> @@ -0,0 +1,23 @@
> +Upstream-Status: Backport
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + Makefile.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 8f9305a..694e837 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -251,6 +251,7 @@ install-scripts: ${DESTDIR}$(bindir)/mtools
> + 	@$(top_srcdir)/mkinstalldirs ${DESTDIR}$(bindir)
> + 	@for j in $(SCRIPTS) ; do \
> + 		$(INSTALL_SCRIPT) $(srcdir)/scripts/$$j ${DESTDIR}$(bindir)/$$j ; \
> ++		$(INSTALL_PROGRAM) $(srcdir)/scripts/$$j ${DESTDIR}$(bindir)/$$j ; \
> + 		echo ${DESTDIR}$(bindir)/$$j ; \
> + 	done
> + 	rm -f ${DESTDIR}$(bindir)/lz
> +--
> +2.0.0
> +
> diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-
> devtools/mtools/mtools_3.9.9.bb
> index d995c8f..f6dd336 100644
> --- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> +++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> @@ -31,7 +31,9 @@ RRECOMMENDS_${PN} =3D "\  SRC_URI =3D
> "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
>  	file://mtools-makeinfo.patch \
>  	file://mtools.patch \
> -	file://no-x11.patch"
> +	file://no-x11.patch \
> +	file://fix-broken-lz.patch \
> +"
>=20
>  SRC_URI[md5sum] =3D "3e68b857b4e1f3a6521d1dfefbd30a36"
>  SRC_URI[sha256sum] =3D "af083a73425d664d4607ef6c6564fd9319a0e47ee7c10525=
9a45356cb834690e"
> --
> 2.0.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

