Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E82216FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:29:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w207so3718875wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PEhby4jn+AE/RQCusJfoCatvxDKAdwNyS6fSrHGxycM=;
	b=JE5IQfYlCFD0FQpMwetr+s2pGb/ofVg41errqGriUripBssJtzByffUBeljntymWKS
	6hP7hN5dowmq7jkDWdyeqMI5WrBmHjPq1knmF849JnvkWUVQ3V9q9+ShaDfCQRBfKJ2g
	baehM995giKDPv5a6qyx4gwFkCSKi6sbcDdLq76R/S6qCH12B0Q3d5ae5qOsCtS2cxHn
	50aHSO/fxYin4fLQYo16aA8VZ19ASfpU+fsuOqgkI4z94AHLDax1Nb9q0y4GjOeZS3RC
	elXov1OodAVBaNmjaUwtehZYJABLEX/v2Onc3pOHWYZuGEZqqlUK8Pc7ObDWFIOXUf8E
	LGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PEhby4jn+AE/RQCusJfoCatvxDKAdwNyS6fSrHGxycM=;
	b=SPBWdsU0VPfBEMWILihvg1cXnsrXux3Xr3K/YQqtT94zW8iZ4UHQutzsWDKMeos9CQ
	YKR2CXBxr3VL7Vc205aZMteiMoi8+wJTLDBGXTcZMts/PJkIfN/ekt23ggfy+Um9A2mC
	svSwQzweLSBguVwWIxjCFs/6cRh/6hr+0AohMEOOTfnFRFjGUcmyKUi8E83oBNp5C9o/
	VZt2XgypSidyuRGB6UlDKwUhpo72sk6S14OrYoSm/XXMAvK2BERGKBjxdJReKfVSzc2l
	fGKpoaJ7cEiOlg1crAjyB01eXw3M9QOALgYw7Z+oQCcZtLDxZ3Ldzjz9Jm7WTXNuHBnj
	LSgg==
X-Gm-Message-State: AE9vXwPHDFXzNXrBA/Ha2kpiaoT3vcT2nuCuaaoo28+hnea2ga24oy2S4eHrcNkYuonWTw==
X-Received: by 10.28.25.71 with SMTP id 68mr10525447wmz.91.1472653776650;
	Wed, 31 Aug 2016 07:29:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	q139sm23999106wmb.18.2016.08.31.07.29.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 07:29:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 16:29:36 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160831142936.qstloalaqbvqgeat@jama>
References: <cover.1472628235.git.hongxu.jia@windriver.com>
	<482840c22cd42b3821dfc1cb96aab39cdadcef4b.1472628235.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <482840c22cd42b3821dfc1cb96aab39cdadcef4b.1472628235.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] thin-provisioning-tools: add version 0.6.3
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
X-List-Received-Date: Wed, 31 Aug 2016 14:29:37 -0000
X-Groupsio-MsgNum: 62899
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ma4nmdflcwyrljjp"
Content-Disposition: inline

--ma4nmdflcwyrljjp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 03:26:14AM -0400, Hongxu Jia wrote:
> It is required by lvm2, since lvm2 could find modprobe correctly
> ------
> |lvm lvchange -a y --config  devices { preferred_names=3D["^/dev/mapper/",
> "^/dev/md/", "^/dev/sd"] }  wrl/pool00
> |/usr/sbin/thin_check: execvp failed: No such file or directory
> | Check of pool wrl/pool00 failed (status:2). Manual repair required!
> ------
>=20
> The thin-provisioning-tools provides /usr/sbin/thin_check.
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc              |  2 +-
>  ...01-do-not-strip-pdata_tools-at-do_install.patch | 33 ++++++++++++++++=
++++++
>  .../thin-provisioning-tools_0.6.3.bb               | 18 ++++++++++++
>  3 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files=
/0001-do-not-strip-pdata_tools-at-do_install.patch
>  create mode 100755 meta-oe/recipes-support/thin-provisioning-tools/thin-=
provisioning-tools_0.6.3.bb
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index e452f11..e2feeb3 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -66,6 +66,6 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>  FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_libdir}/udev"
>  FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
> =20
> -RDEPENDS_${PN} =3D "bash"
> +RDEPENDS_${PN} =3D "bash thin-provisioning-tools"
> =20
>  CONFFILES_${PN} +=3D "${sysconfdir}/lvm/lvm.conf"
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-d=
o-not-strip-pdata_tools-at-do_install.patch b/meta-oe/recipes-support/thin-=
provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
> new file mode 100644
> index 0000000..b4cdda1
> --- /dev/null
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-s=
trip-pdata_tools-at-do_install.patch
> @@ -0,0 +1,33 @@
> +From e8be402e20cbdfbd8192a171ac9904d9362103bf Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 31 Aug 2016 01:35:40 -0400
> +Subject: [PATCH] do not strip pdata_tools at do_install
> +
> +It caused QA Issue:
> +--------------
> +|ERROR: QA Issue: File '/usr/sbin/pdata_tools' from thin-provisioning-to=
ols
> +was already stripped, this will prevent future debugging! [already-strip=
ped]
> +--------------
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Makefile.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 4264191..ac22042 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -189,7 +189,6 @@ distclean: clean
> + install: bin/pdata_tools
> + 	$(INSTALL_DIR) $(BINDIR)
> + 	$(INSTALL_PROGRAM) bin/pdata_tools $(BINDIR)
> +-	$(STRIP) $(BINDIR)/pdata_tools
> + 	ln -s -f pdata_tools $(BINDIR)/cache_check
> + 	ln -s -f pdata_tools $(BINDIR)/cache_dump
> + 	ln -s -f pdata_tools $(BINDIR)/cache_metadata_size
> +--=20
> +2.8.1
> +
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisi=
oning-tools_0.6.3.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin=
-provisioning-tools_0.6.3.bb
> new file mode 100755
> index 0000000..c2ba95c
> --- /dev/null
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-t=
ools_0.6.3.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "A suite of tools for manipulating the metadata of the dm-th=
in device-mapper target."

This looks too long for SUMMARY.

> +HOMEPAGE =3D "https://github.com/jthornber/thin-provisioning-tools"
> +LICENSE =3D "GPLv3"
> +SECTION =3D "devel"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +S =3D "${WORKDIR}/git"
> +
> +SRC_URI =3D "git://github.com/jthornber/thin-provisioning-tools \
> +           file://0001-do-not-strip-pdata_tools-at-do_install.patch \
> +          "

Closing quote should be first character (without indentation).

> +
> +SRCREV =3D "49bfc12e9c7956c1ac134b24afbe1a6a602ce7d5"
> +
> +DEPENDS +=3D "expat libaio boost"
> +
> +inherit autotools
> +B =3D "${S}"

Why not autotools-brokensep?
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ma4nmdflcwyrljjp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfG6c8ACgkQN1Ujt2V2gBwriQCeN5SGSa8OUp1D5V/aq+nG+Kjk
6D4An1AP5HiwI23rnouIQbhs8MjT7TeU
=pb+2
-----END PGP SIGNATURE-----

--ma4nmdflcwyrljjp--
