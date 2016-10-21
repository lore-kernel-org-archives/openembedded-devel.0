Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA4EA71A96
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 16:41:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d128so337998wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=07gqD+2n4Gh1YqFbS8SpHMxePp1YH3udb4saHxW5fyA=;
	b=XEw4PebV33JTBTo5YU4QDsifTfSGQ7uVzI3/KVPwWDVOd1+kxC9KKrBzVXnzUdyc4+
	kLbzK3GE838mgpKj9upQwkyb/yO28ygjLo6EaOU2913rE4loXGdckyOHwnMGWgE4PHYU
	6vnv5gXbusZNcIb8GFgia1MFlUwQ2AJKhk2UrHXWDptkcvtn1utYtiERGTrdk2B0/B8r
	VENrEUxGC/n/Mtdd4lsasXTxgcOjk0Be0lodvo03knV5Hipkzm+PPiEQJ4HFEUX6qdMv
	HVTh1ieJ0S9rf7dPc03jn1bv7Sj7R0DRXiWdJGI8FlKkj1BGyXslMjicOrHP0XW71Yv9
	A6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=07gqD+2n4Gh1YqFbS8SpHMxePp1YH3udb4saHxW5fyA=;
	b=UaX+52urovwHwySzYzt4hot/3ImK7m7NS/33MauxbuBvKW639pL7AiWhX3il32opCC
	+rQIWA/pKEwQoKo6Hes367KWXNvxJMZ9OpfavkNVN93cHPWaKnle+nq/FrLhZSoxSLvM
	E/euCcUj0uQni3xqXFIuB5O+sMz+F3AnzZdC8CEhLW8gm2pHfaMVTHKQQN5acYNSzK/i
	sVSvHug9jmPs8r3F7DKLqGVEveuN111ty3Ur0gyDwH2jzoHfn5b469Ap3fPnl97S7tRk
	IKvcltf9lytskYsWwmBHOS9tCG/GZ8WKbur6j0Io4uZf6BsxEup3jcbePAkUGZwiJrB9
	5wLQ==
X-Gm-Message-State: AA6/9RkWxNHUMLU8HBGqT/Gzi107mNkplgMbcey+731OYFs0CJrDuqk/HSINupXyKR6X3w==
X-Received: by 10.28.168.87 with SMTP id r84mr3820016wme.19.1477068067267;
	Fri, 21 Oct 2016 09:41:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id w1sm3716872wje.36.2016.10.21.09.41.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Oct 2016 09:41:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Oct 2016 18:41:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161021164106.GA2899@jama>
References: <1477037954-141118-1-git-send-email-dengke.du@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1477037954-141118-1-git-send-email-dengke.du@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [PATCH] gd: Security Advisory CVE-2016-7568
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
X-List-Received-Date: Fri, 21 Oct 2016 16:41:08 -0000
X-Groupsio-MsgNum: 63556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2016 at 04:19:14PM +0800, Dengke Du wrote:
> Backport patch to fix CVE-2016-7568 from gd upstream:
>=20
> 	https://github.com/libgd/libgd/commit/2806adfdc27a94d333199345394d7c3029=
52b95f
>=20

Doesn't apply, always rebase on latest master before sending (gd was
last updated months ago).

OE @ ~/meta-openembedded $ pwam 133109
2016-10-21 18:39:13 URL:https://patchwork.openembedded.org/patch/133109/mbo=
x/ [2947] -> "pw-am-133109.patch" [1]
Applying: gd: Security Advisory CVE-2016-7568
=2Egit/rebase-apply/patch:37: space before tab in indent.
                quality =3D 80;
=2Egit/rebase-apply/patch:38: space before tab in indent.
        }
=2Egit/rebase-apply/patch:39: trailing whitespace.
=20
=2Egit/rebase-apply/patch:48: space before tab in indent.
        argb =3D (uint8_t *)gdMalloc(gdImageSX(im) * 4 * gdImageSY(im));
=2Egit/rebase-apply/patch:49: space before tab in indent.
        if (!argb) {
error: patch failed: meta-oe/recipes-support/gd/gd_2.2.3.bb:15
error: meta-oe/recipes-support/gd/gd_2.2.3.bb: patch does not apply
Patch failed at 0001 gd: Security Advisory CVE-2016-7568
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
OE @ ~/meta-openembedded $ patch -p1 < pw-am-133109.patch=20
patching file meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-gd=
ImageWebpCtx.patch
patching file meta-oe/recipes-support/gd/gd_2.2.3.bb
Hunk #1 FAILED at 15.
1 out of 1 hunk FAILED -- saving rejects to file meta-oe/recipes-support/gd=
/gd_2.2.3.bb.rej
OE @ ~/meta-openembedded $ cat meta-oe/recipes-support/gd/gd_2.2.3.bb.rej
--- meta-oe/recipes-support/gd/gd_2.2.3.bb
+++ meta-oe/recipes-support/gd/gd_2.2.3.bb
@@ -15,6 +15,7 @@ DEPENDS =3D "freetype libpng jpeg zlib tiff"
 SRC_URI =3D "git://github.com/libgd/libgd.git;branch=3DGD-2.2 \
            file://fix-gcc-unused-functions.patch \
            file://disable-jpeg_read-test.patch \
+           file://0001-Fix-integer-overflow-in-gdImageWebpCtx.patch \
           "
=20
 SRCREV =3D "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
OE @ ~/meta-openembedded $ git log meta-oe/recipes-support/gd/gd_2.2.3.bb
commit 289217bbc3c5c53f486ab5615a6d6196e3c12cf2
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Thu Aug 18 18:53:48 2016 +0200

    meta-oe: fix indentation
   =20
    * remove tabs which sneaked in since last cleanup
    * meta-oe layers are using consistent indentation with 4 spaces, see
      http://www.openembedded.org/wiki/Styleguide
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  ...01-Fix-integer-overflow-in-gdImageWebpCtx.patch | 41 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/gd/gd_2.2.3.bb             |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gd/gd/0001-Fix-integer-overfl=
ow-in-gdImageWebpCtx.patch
>=20
> diff --git a/meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-g=
dImageWebpCtx.patch b/meta-oe/recipes-support/gd/gd/0001-Fix-integer-overfl=
ow-in-gdImageWebpCtx.patch
> new file mode 100644
> index 0000000..9967e23
> --- /dev/null
> +++ b/meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-gdImageW=
ebpCtx.patch
> @@ -0,0 +1,41 @@
> +From 2806adfdc27a94d333199345394d7c302952b95f Mon Sep 17 00:00:00 2001
> +From: trylab <trylab@users.noreply.github.com>
> +Date: Tue, 6 Sep 2016 18:35:32 +0800
> +Subject: [PATCH] Fix integer overflow in gdImageWebpCtx
> +
> +Integer overflow can be happened in expression gdImageSX(im) * 4 *
> +gdImageSY(im). It could lead to heap buffer overflow in the following
> +code. This issue has been reported to the PHP Bug Tracking System. The
> +proof-of-concept file will be supplied some days later. This issue was
> +discovered by Ke Liu of Tencent's Xuanwu LAB.
> +
> +Upstream-Status: Backport
> +
> +CVE-2016-7568
> +
> +---
> + src/gd_webp.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/gd_webp.c b/src/gd_webp.c
> +index 8eb4dee..9886399 100644
> +--- a/src/gd_webp.c
> ++++ b/src/gd_webp.c
> +@@ -199,6 +199,14 @@ BGD_DECLARE(void) gdImageWebpCtx (gdImagePtr im, gd=
IOCtx * outfile, int quality)
> + 		quality =3D 80;
> + 	}
> +=20
> ++	if (overflow2(gdImageSX(im), 4)) {
> ++		return;
> ++	}
> ++
> ++	if (overflow2(gdImageSX(im) * 4, gdImageSY(im))) {
> ++		return;
> ++	}
> ++
> + 	argb =3D (uint8_t *)gdMalloc(gdImageSX(im) * 4 * gdImageSY(im));
> + 	if (!argb) {
> + 		return;
> +--=20
> +2.9.3
> +
> diff --git a/meta-oe/recipes-support/gd/gd_2.2.3.bb b/meta-oe/recipes-sup=
port/gd/gd_2.2.3.bb
> index 9655e9c..f7d4f44 100644
> --- a/meta-oe/recipes-support/gd/gd_2.2.3.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
> @@ -15,6 +15,7 @@ DEPENDS =3D "freetype libpng jpeg zlib tiff"
>  SRC_URI =3D "git://github.com/libgd/libgd.git;branch=3DGD-2.2 \
>             file://fix-gcc-unused-functions.patch \
>             file://disable-jpeg_read-test.patch \
> +           file://0001-Fix-integer-overflow-in-gdImageWebpCtx.patch \
>            "
> =20
>  SRCREV =3D "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgKRSEACgkQN1Ujt2V2gBy/UACeJtMj5j519HFoqN+RcTn7wULi
5IYAnRMktQ4ESD/l7sFlr2FryY0Vl6U5
=1Sir
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
