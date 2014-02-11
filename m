Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id B87CB6E8E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:49:17 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id kq14so7079336pab.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Uv84lyazhqVih6p0hpLsm+0hmpMoMriu2UBceufqIwA=;
	b=BeWecbSfBp6c2DbtCHzq5KUVWWkfqKm9k+5IDFtD5uYJpTDA6vUxsKDLSSfxZ6P1ks
	zsZYaLecWp7mWfWxhhXL16o05guk99F9LAmj1UNeKlrOx7JTtIUrlMbKMUtsfzhyR/D8
	QfFM722F6g+MenpG22VrBc/I98553HBYhU+v2iem08HAXCpXbEy5S/kLBLyTxQAmQBcl
	kdNfnkWzukpDoAIwYqUglIDGu4BQpvzz8nsQBN7Dc4KeTEKQM/f392su1oA/bkDIm6AV
	5d/3z0fHeq2Xo9Sshe6cIU6mf+sZpR3JqD7uCIBLaj7JC8c0ppFB3TSDb5PARcbmfD+y
	F78g==
X-Received: by 10.66.241.73 with SMTP id wg9mr30211042pac.69.1392090558597;
	Mon, 10 Feb 2014 19:49:18 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ac5sm47697026pbc.37.2014.02.10.19.49.16 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 19:49:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1383840784-13159-1-git-send-email-eric@eukrea.com>
Date: Mon, 10 Feb 2014 19:49:14 -0800
Message-Id: <7A2E9B19-034A-4F79-9968-5DB361BA79A4@gmail.com>
References: <1383840784-13159-1-git-send-email-eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Cc: javier.viguera@digi.com, =?windows-1252?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Tue, 11 Feb 2014 03:49:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 7, 2013, at 8:13 AM, Eric B=E9nard <eric@eukrea.com> wrote:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
> meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb =
b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> index 8cfe58f..37c0791 100644
> --- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> @@ -9,7 +9,7 @@ PR =3D "r9"
>=20
> DEPENDS =3D "libpcre openssl mysql5 =
${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>=20
> -SRC_URI =3D =
"ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
> +SRC_URI =3D =
"http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2/${PV}/cherokee-${=
PV}.tar.gz \

wouldn=92t it be better to just update the recipe to 1.2.103(which is =
latest atm)

>            file://cherokee.init \
>            file://cherokee.service \
> "
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


