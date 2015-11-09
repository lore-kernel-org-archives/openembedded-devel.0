Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CED7677101
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:51:23 +0000 (UTC)
Received: by wmec201 with SMTP id c201so72178110wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QTM/j9AV/ggrmEE3S9UK5eGRHqxWonOJLDyMpaw08EI=;
	b=Gm1IbOIGTR3U0FJN+oJyUAS4PZGkq8GuDLSKDtO8C3h3ko6xZv0j6A0Dg650CTctJl
	z+JIgDi3GU6sku8o4E2494PSdPPTYuvBxZUIRZBn8/a96NivzPVFLJz2IjQuooVfTE4n
	QYGrjaqbI+leaMdwmkFBB+F4ai/gPdq/X8V4qg18l/BxbqnkaMAxRo1B+6H49vTEmPq4
	93aXT4OyH6Uq6IiVHMtIlMMwl1yDJoJfzJ6OYOXq0lbdO1yelnFnbFFNos+8uUgS0cpr
	uFrM0Wjc7foqY7wLytLl8LN5PTLCuRQ5xiQrBv0FDha9tVoVTD/R7TGYuR2ooXQMqNDW
	oTXg==
X-Received: by 10.28.138.148 with SMTP id m142mr26326728wmd.2.1447066283421;
	Mon, 09 Nov 2015 02:51:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l131sm13612535wmd.14.2015.11.09.02.51.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 02:51:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 Nov 2015 11:51:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151109105127.GB2569@jama>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-browser][PATCH v2 0/5] chromium/cef3: fix gcc build errors
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
X-List-Received-Date: Mon, 09 Nov 2015 10:51:28 -0000
X-Groupsio-MsgNum: 58418
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 07, 2015 at 01:20:24PM +0100, Max Krummenacher wrote:
> v2:
> Review Zoltan Kuscsik:
> - prefer #pragma silencing of error over code refactoring
> - add link to upstream discussion
>=20
> Review Martin Jansa:
> - port fixes to cef3 also
>=20
> Max Krummenacher (5):
>   chromium: fix gcc5 compile issues
>   cef3_280796.bb: change indent to 4 spaces
>   cef3: fix gcc5 compile issues
>   cef3: fix build of x86-64
>   cef3: fix build with gcc 4.9.4

Fixed both issues for qemux86 as well as qemux86-64.

They built in "bitbake world" probably for first time since they were
introduced, Thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Lets get this merged before jethro branch is created.

>  ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 ++++++++++++++++=
++++
>  ...-image_util.cc-disable-warning-from-gcc-5.patch | 40 ++++++++++++++++=
++++
>  ...-test.h-disable-warning-unused-definition.patch | 43 ++++++++++++++++=
++++++
>  ...ithmetic.h-put-parentheses-to-silence-war.patch | 39 ++++++++++++++++=
++++
>  recipes-browser/chromium/cef3_280796.bb            | 33 ++++++++++++-----
>  ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 ++++++++++++++++=
++++
>  ...-image_util.cc-disable-warning-from-gcc-5.patch | 40 ++++++++++++++++=
++++
>  recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
>  8 files changed, 266 insertions(+), 10 deletions(-)
>  create mode 100644 recipes-browser/chromium/cef3/0001-bignum.cc-disable-=
warning-from-gcc-5.patch
>  create mode 100644 recipes-browser/chromium/cef3/0002-image_util.cc-disa=
ble-warning-from-gcc-5.patch
>  create mode 100644 recipes-browser/chromium/cef3/0003-gtest-typed-test.h=
-disable-warning-unused-definition.patch
>  create mode 100644 recipes-browser/chromium/cef3/0004-SaturatedArithmeti=
c.h-put-parentheses-to-silence-war.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-bi=
gnum.cc-disable-warning-from-gcc-5.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-im=
age_util.cc-disable-warning-from-gcc-5.patch
>=20
> --=20
> 1.8.4.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZAen4ACgkQN1Ujt2V2gBzGnwCdHU+M0K9zzoUOqNDO5LUmqd4U
Ll4An1tm7qgkIGkbmg7WYqdaTPb2L7dU
=wxLQ
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
