Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D68E36FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 07:51:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so35833599wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=V7mXMs60PrMjk78e6p7xfW3/OXn4Z5xQuawbdgW7U1E=;
	b=rcngEqXo845DuSrMoQbcutGdOl/zXYXTxed7zjAhpO7n+RElpMRoGpdx2qQ+shvSd4
	s7k1Wq9VcLNCLtsWAT06HtfbSARGMRtmEOvdlDUWLLqPanmU3we743/w7NL15NzutbTj
	9JjijaKQ3TBLJjxl+RjH3ZcmYDY2YfnCQWQfMK4L0aluRqyuZwg8RU+NMcbwp4eb9ln5
	jukbHfg4LpOLDIiNiR/Y6xxblja8Nj74pwCdeBMF0xs/x1Uf7QalVF/LMp2rL+ukHOcF
	QCeWghCB4M791xMiqKWQ49cY9tQ1NwCQ3Wv4huXX3g/+eryAB1sCNxhmjaHYTKpBFZMT
	MaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=V7mXMs60PrMjk78e6p7xfW3/OXn4Z5xQuawbdgW7U1E=;
	b=f299o2rXpv6nb6EvL/49l8w3JfCrEu8U5WgNYlkqmAd3Y4hINKptRRxqUmK9bmvXoU
	tLmjZYx5ORw7SzMEYlwt6X6aF3kH88Z0HoMeT33WE1klSV1q/s9rF3eJ8OsUEP7fk06b
	ENdIrmgi42VKURse0+5fJBzgONaFs+wOXrMhPnjoHFxIvaIdTuKQJWdhsmysHl9azKOc
	wZ5PYtrvmw6VvB2s8RgbvhTEhwdrYL3E6QQmgIFTqG/XizOIxUotBYVy6BkvSRa+a68U
	4M87C8QTx21yEsvvwGgx+X3iwjP8g0cvVMBQFLF+Fr2P+C2rIgLuB3TaI1Zzs4Q4y1mb
	fp7w==
X-Gm-Message-State: AODbwcCX6P8+sFWLnVJ6MS7HXhILro7dx4Yw3OL5LdDca053vte5fGIb
	1JoWj7HHIc181g==
X-Received: by 10.223.146.225 with SMTP id 88mr6349772wrn.51.1494921088420;
	Tue, 16 May 2017 00:51:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	137sm1510502wmi.19.2017.05.16.00.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 May 2017 00:51:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 May 2017 09:52:16 +0200
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Message-ID: <20170516075216.GA3088@jama>
References: <1494494868-44138-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1494494868-44138-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] opencv: Make opencv-ts create share library intead of static
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
X-List-Received-Date: Tue, 16 May 2017 07:51:28 -0000
X-Groupsio-MsgNum: 66748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2017 at 05:27:48PM +0800, Huang Qiyu wrote:
> Refer to other distro,make opencv-ts create share library intead of stati=
c.
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  ...-ts-create-share-library-intead-of-static.patch | 26 +++++++++++++
>  .../opencv/0001-To-fix-errors-as-following.patch   | 43 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/opencv/opencv_3.1.bb       |  2 +


opencv_3.1.bb was removed from master some 4 months ago:

commit 75da410e4ec734930ff024041ac9f56cee9f7b8d
Author:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
AuthorDate: Thu Dec 29 14:35:08 2016 +0100
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Tue Jan 10 13:12:55 2017 +0100

    opencv: Update to version 3.2

Test your changes in _recent_ master before sending them!

Regards,

>  3 files changed, 71 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Make-openc=
v-ts-create-share-library-intead-of-static.patch
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-To-fix-err=
ors-as-following.patch
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-cr=
eate-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/=
opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
> new file mode 100644
> index 0000000..05ec41f
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-sh=
are-library-intead-of-static.patch
> @@ -0,0 +1,26 @@
> +From 49d1f7c40a5d097f23671318045ac54bc07846cf Mon Sep 17 00:00:00 2001
> +From: Bian Naimeng <biannm@cn.fujitsu.com>
> +Date: Wed, 19 Apr 2017 03:11:37 +0900
> +Subject: [PATCH] Make opencv-ts create share library intead of static.
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + modules/ts/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
> +index bb56da2..7bb4ce9 100644
> +--- a/modules/ts/CMakeLists.txt
> ++++ b/modules/ts/CMakeLists.txt
> +@@ -4,7 +4,7 @@ if(IOS)
> +   ocv_module_disable(ts)
> + endif()
> +=20
> +-set(OPENCV_MODULE_TYPE STATIC)
> ++#set(OPENCV_MODULE_TYPE STATIC)
> + set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
> +=20
> + ocv_warnings_disable(CMAKE_CXX_FLAGS -Wundef)
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-=
following.patch b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-=
as-following.patch
> new file mode 100644
> index 0000000..40c4ad5
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-followi=
ng.patch
> @@ -0,0 +1,43 @@
> +From 7eb2f7ea2fd1ede1d0ee0fafb660c8a62ac88127 Mon Sep 17 00:00:00 2001
> +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> +Date: Thu, 11 May 2017 16:13:45 +0900
> +Subject: [PATCH] To fix errors as following:
> +
> +"test_main.cpp:45: undefined reference to `parseCustomOptions(int, char*=
*)'"
> +"test_superres.cpp:270: undefined reference to `checkIppStatus()'"
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + modules/ts/include/opencv2/ts.hpp        | 2 +-
> + modules/ts/include/opencv2/ts/ts_ext.hpp | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/open=
cv2/ts.hpp
> +index e809f6b..d181e24 100644
> +--- a/modules/ts/include/opencv2/ts.hpp
> ++++ b/modules/ts/include/opencv2/ts.hpp
> +@@ -567,7 +567,7 @@ void dumpOpenCLDevice();
> + #define TEST_DUMP_OCL_INFO
> + #endif
> +=20
> +-void parseCustomOptions(int argc, char **argv);
> ++CV_EXPORTS void parseCustomOptions(int argc, char **argv);
> +=20
> + #define CV_TEST_MAIN(resourcesubdir, ...) \
> + int main(int argc, char **argv) \
> +diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/inclu=
de/opencv2/ts/ts_ext.hpp
> +index 08039ba..8e72372 100644
> +--- a/modules/ts/include/opencv2/ts/ts_ext.hpp
> ++++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
> +@@ -8,7 +8,7 @@
> + #ifndef __OPENCV_TS_EXT_HPP__
> + #define __OPENCV_TS_EXT_HPP__
> +=20
> +-void checkIppStatus();
> ++CV_EXPORTS void checkIppStatus();
> +=20
> + #undef TEST
> + #define TEST(test_case_name, test_name) \
> +--=20
> +2.7.4
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index 1bbb965..52d44ba 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -24,6 +24,8 @@ SRC_URI =3D "git://github.com/Itseez/opencv.git;name=3D=
opencv \
>      file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
>      file://fixgcc60.patch \
>      file://fixpkgconfig.patch \
> +    file://0001-Make-opencv-ts-create-share-library-intead-of-static.pat=
ch \
> +    file://0001-To-fix-errors-as-following.patch \
>  "
> =20
>  PV =3D "3.1+git${SRCPV}"
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRqvrgAKCRA3VSO3ZXaA
HPUXAJ4r0n9Wf6d0za6BmDuPQETmFCi7QgCfaPmP9zJmMdt3nKNc9/EBuN8gVSA=
=7TpH
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
