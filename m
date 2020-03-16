Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB62606C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=5168; q=dns/txt; s=axis-central1;
	t=1584358887; x=1615894887;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=9eyUa4ZqSSEEA+QNeQrdK53LPs07SfTI0CL8LtBi6M0=;
	b=CeHrH7e+6cPqdZX/pJvqZ4Aj9Yc+KWiSg+1TWf/sXmjbymY8bjUIEQX9
	2pbkCUb292Ej+DeG/qA5rvzam7bjyRJM2MXbXDaXtxW4s5bHf/zpVxT0H
	xYIueMi7SieTdex9LI+O07734f32Tj/S/vRbkXgX0orOE2BUh8jqYj8+z
	tVOa0agMz6y4JCUPrxGoaweUzhGH7K2v1LXAvYJjani7zSeRcHkOqvZLR
	kijwP8W8u2hrIPgo/Nq/aVF6TueVDsVU9oLFC2gk7sbNiVp5ahCA1Mq+u
	SHiEeoYJ31DZmzR/CCDXRm469zaJMzq166apXGgEYtAcqgI5XCfsqYZLy w==;
IronPort-SDR: fSWNuxLHTHpbx5GCF5s0k4AFiPO6QI7saQhuZrEzVlM3ru1aLDWYUPI3oNJvYE05hEuoYR4pMl
	K5ovG1rg4ZQuafn+y+XX1LKA0t5SrIv3DXQRSoOp2/F8JHuAholVssKmbzZHyIY5KRxu/MMNVl
	7i7ZiPjBB1t8dlmn9CPMSffHlctqMQLe8Yb2TKYyZXrq1hI/GD5Y+hFZDPB6QJj70DjSZSobe3
	1s7FQ3RUXfjRISqZn9/ArtdBXOqDG2R5St3Z542G7w+lNWHqEgd5P4VP8y4ceG0G6NiKcr4qiX
	JXE=
X-IronPort-AV: E=Sophos;i="5.70,560,1574118000"; 
   d="scan'208";a="6537100"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, akuster808
	<akuster808@gmail.com>
Thread-Topic: [oe] [meta-filesystems][master][zeus][PATCHv2]
	ntfs-3g-ntfsprogs:	Make it support usrmerge properly
Thread-Index: AQHV41XSouo1kkz4oUOwlsP9ShfwSahLSFYw
Date: Mon, 16 Mar 2020 11:41:25 +0000
Message-ID: <983c5eff211c4fdf904ac586bc84ed36@XBOX03.axis.com>
References: <20200214164252.2607-1-pkj@axis.com>
In-Reply-To: <20200214164252.2607-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meta-filesystems][master][zeus][PATCHv2] ntfs-3g-ntfsprogs:	Make it support usrmerge properly
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
X-List-Received-Date: Mon, 16 Mar 2020 11:41:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 14 februari 2020 17:43
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-filesystems][master][zeus][PATCHv2] ntfs-3g-ntfsprogs=
:
> Make it support usrmerge properly
>=20
> An attempt to solve the problem that some files are installed to /sbin
> even though the usrmerge distro feature is enabled was made in commit
> 97c0af59 ("ntfs-3g-ntfsprogs: support usrmerge"). However, it merely
> just removed the problematic files, which meant that the package was
> rendered unusable.
>=20
> Solve the problem properly by moving all files that are installed in
> /sbin to ${base_sbindir} instead.
>=20
> Also clear up a cryptic comment.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> PATCHv2: Correct [meta-oe] to [meta-filesystems] in the subject.
>=20
>  .../0001-Make-build-support-usrmerge.patch    | 43 -------------------
>  .../ntfs-3g-ntfsprogs_2017.3.23.bb            | 15 +++++--
>  2 files changed, 11 insertions(+), 47 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-
> ntfsprogs/files/0001-Make-build-support-usrmerge.patch
>=20
> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-
> ntfsprogs/files/0001-Make-build-support-usrmerge.patch b/meta-
> filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-
> support-usrmerge.patch
> deleted file mode 100644
> index fce10b999..000000000
> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-
> Make-build-support-usrmerge.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 33f678bf74367aab8ddc2858a9f7797455ea9b9f Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 29 Aug 2019 10:21:58 +0800
> -Subject: [PATCH] Make build support usrmerge
> -
> -Upstream-Status: Inappropriate[oe-specific]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - ntfsprogs/Makefile.am | 2 --
> - src/Makefile.am       | 3 ---
> - 2 files changed, 5 deletions(-)
> -
> -diff --git a/ntfsprogs/Makefile.am b/ntfsprogs/Makefile.am
> -index f4f9d1b..1f6a673 100644
> ---- a/ntfsprogs/Makefile.am
> -+++ b/ntfsprogs/Makefile.am
> -@@ -165,8 +165,6 @@ extras:	libs $(EXTRA_PROGRAMS)
> -
> - if ENABLE_MOUNT_HELPER
> - install-exec-hook:
> --	$(INSTALL) -d $(DESTDIR)/sbin
> --	$(LN_S) -f $(sbindir)/mkntfs $(DESTDIR)/sbin/mkfs.ntfs
> -
> - install-data-hook:
> - 	$(INSTALL) -d $(DESTDIR)$(man8dir)
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 8d98408..d0a6a45 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -66,9 +66,6 @@ endif
> -
> - if ENABLE_MOUNT_HELPER
> - install-exec-local:	install-rootbinPROGRAMS
> --	$(MKDIR_P) "$(DESTDIR)/sbin"
> --	$(LN_S) -f "$(rootbindir)/ntfs-3g" "$(DESTDIR)/sbin/mount.ntfs-3g"
> --	$(LN_S) -f "$(rootbindir)/lowntfs-3g" "$(DESTDIR)/sbin/mount.lowntfs-3=
g"
> -
> - install-data-local:	install-man8
> - 	$(LN_S) -f ntfs-3g.8 "$(DESTDIR)$(man8dir)/mount.ntfs-3g.8"
> ---
> -2.7.4
> -
> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
> index 1559bfd3f..6f5cb6cee 100644
> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2017.3.23.bb
> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2017.3.23.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>=20
>  SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
>             file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-h=
ost.patch \
> -
> ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-Make-build=
-support-usrmerge.patch','',d)} \
>  "
>  S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
>  SRC_URI[md5sum] =3D "d97474ae1954f772c6d2fa386a6f462c"
> @@ -35,10 +34,18 @@ FILES_ntfsprogs =3D "${base_sbindir}/* ${bindir}/* ${=
sbindir}/*"
>  FILES_libntfs-3g =3D "${libdir}/*${SOLIBS}"
>=20
>  do_install_append() {
> -    # Standard mount will execute the program /sbin/mount.TYPE
> -    # when called. Add the symbolic to let mount could find ntfs.
> -    ln -sf mount.ntfs-3g ${D}/${base_sbindir}/mount.ntfs
> +    # Standard mount will execute the program /sbin/mount.TYPE when call=
ed.
> +    # Add a symbolic link to let mount find ntfs.
> +    ln -sf mount.ntfs-3g ${D}${base_sbindir}/mount.ntfs
>      rmdir ${D}${libdir}/ntfs-3g
> +
> +    # Handle when usrmerge is in effect. Some files are installed to /sb=
in
> +    # regardless of the value of ${base_sbindir}.
> +    if [ "${base_sbindir}" !=3D /sbin ] && [ -d ${D}/sbin ]; then
> +        mkdir -p ${D}${base_sbindir}
> +        mv ${D}/sbin/* ${D}${base_sbindir}
> +        rmdir ${D}/sbin
> +    fi
>  }
>=20
>  # Satisfy the -dev runtime dependency
> --
> 2.21.1

Please backport this to Zeus now that it has been accepted to master.

//Peter


