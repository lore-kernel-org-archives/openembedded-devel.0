Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CCDA606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 11:02:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so2424524wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mkApdfqtRzfpvEhG90NEE4zMxC7akuyDikjKRfnRDgU=;
	b=OuMxbhwULQZYUk7MdBSu/pb2FJVsXeFLMl+DQ5aKSfN6mT7ypiJ8Xawo1M30Ydqd3w
	A+8A4+47+Cp1p9f2/e019sdYT/yk5wh/GeJiZw0WbTBOOYkB2EoLyWf6A3LuJMME420G
	rrmwhOeshvay9Czelex0sqLao8FSSlFsErFbdNYuxCkf+SjqJ8hO97Ga7EZdF2Vnd+CA
	vq+j/y/Bs18fVtjtAtvi8F5USH2YWRW5fS8yghjL9JajXs41V+LiW+Hb4b2hzIxmY+7o
	r5QZ4NvYcMZ0itZoacrJ8nMCJ6nDE8qAogxp6UnYmdK2QjUK6kySm396jYHxo8216l3N
	JbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mkApdfqtRzfpvEhG90NEE4zMxC7akuyDikjKRfnRDgU=;
	b=bLvpqQA2rsMbLVGURA92knTsuzLbIQHawwVeC9YITB7mBIaVjnSH48spToXMMHSLH5
	+O+haNAuX9O0jlJkPYrBE6JnaDVNVoai+AwaCmzBbEdVsQ0WJDPf5w9JkkzuZYUibDph
	4bsUwx7ljSYg+6p/HpUgjA2UtVX7nP2T5aNYoel60fBqQNPXX4Q5QVa5ZSAfM2tyC5g0
	JajaZ8GPLTooziMlweOxHLTHJl0Qbn9VlJvxOii4CN3pXtIIjeZj9DJUlLp33Zk0qMqw
	puD53KVsS33BAvhoL3TabdsxjdZi6nW+Wngot5Jw3PvPnOOxiMo3BLr4UzPgAg4ZBain
	I5EQ==
X-Gm-Message-State: ALyK8tLmBskkE5Yx89CENazvmt2VDRIPoxMrDaAT50LH6AGfZ8ernFRxqgKSoALa/8ZEFQ==
X-Received: by 10.28.209.134 with SMTP id i128mr3207493wmg.97.1468926135306;
	Tue, 19 Jul 2016 04:02:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	g184sm21952473wme.15.2016.07.19.04.02.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Jul 2016 04:02:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jul 2016 13:02:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160719110218.x4vdli5imfnpx4vt@jama>
References: <1468831138-130047-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1468831138-130047-1-git-send-email-zhe.he@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] lmbench: Fix compilation error of gcc format-security
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
X-List-Received-Date: Tue, 19 Jul 2016 11:02:15 -0000
X-Groupsio-MsgNum: 62251
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i4qexvobqc5lcila"
Content-Disposition: inline

--i4qexvobqc5lcila
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2016 at 04:38:58AM -0400, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>=20
> oe-core "security_flags: turn potential string format security issues
> into an error" add "-Wformat -Wformat-security -Werror=3Dformat-security"
> to the default SECURITY_CFLAGS, which may cause lmbench compilation
> failure.
>=20
> This patch fixes lmbench's code.

Doesn't apply:

OE @ ~/meta-openembedded $ pwam 127413
2016-07-19 12:59:51 URL:https://patchwork.openembedded.org/patch/127413/mbo=
x/ [2842] -> "pw-am-127413.patch" [1]
Applying: lmbench: Fix compilation error of gcc format-security
=2Egit/rebase-apply/patch:28: space before tab in indent.
        sock =3D tcp_connect(server, prog, SOCKOPT_REUSE);
=2Egit/rebase-apply/patch:29: space before tab in indent.
        sprintf(buf, "GET /%s HTTP/1.0\r\n\r\n\n", file);
=2Egit/rebase-apply/patch:30: space before tab in indent.
        if (debug) {
=2Egit/rebase-apply/patch:33: space before tab in indent.
        }
=2Egit/rebase-apply/patch:34: space before tab in indent.
        write(sock, buf, strlen(buf));
error: patch failed: meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb:18
error: meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb: patch does not =
apply
Patch failed at 0001 lmbench: Fix compilation error of gcc format-security
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Last change was a month ago:
OE @ ~/meta-openembedded $ git show --pretty=3Dfuller -1 meta-oe/recipes-be=
nchmark/lmbench/lmbench_3.0-a9.bb
commit 4adec181e7303c0afd7fca08fec6ddc5532237a1
Author:     Roy Li <rongqing.li@windriver.com>
AuthorDate: Thu May 5 09:52:01 2016 +0800
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Tue May 10 20:18:30 2016 +0200

    lmbench: avoid gcc optimize-away multiplication


please rebase before sending.

>=20
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...ttp-Use-puts-instead-of-printf-to-avoid-f.patch | 26 ++++++++++++++++=
++++++
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Us=
e-puts-instead-of-printf-to-avoid-f.patch
>=20
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Use-puts-=
instead-of-printf-to-avoid-f.patch b/meta-oe/recipes-benchmark/lmbench/lmbe=
nch/lat_http-Use-puts-instead-of-printf-to-avoid-f.patch
> new file mode 100644
> index 0000000..8121e37
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Use-puts-instead=
-of-printf-to-avoid-f.patch
> @@ -0,0 +1,26 @@
> +[PATCH] lat_http: Use puts instead of printf to avoid gcc
> +format-security error
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + src/lat_http.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lat_http.c b/src/lat_http.c
> +index c630d59..42e64a1 100644
> +--- a/src/lat_http.c
> ++++ b/src/lat_http.c
> +@@ -27,7 +27,7 @@ http(char *server, char *file, int prog)
> + 	sock =3D tcp_connect(server, prog, SOCKOPT_REUSE);
> + 	sprintf(buf, "GET /%s HTTP/1.0\r\n\r\n\n", file);
> + 	if (debug) {
> +-		printf(buf);
> ++		puts(buf);
> + 	}
> + 	write(sock, buf, strlen(buf));
> + 	while ((n =3D read(sock, buf, XFERSIZE)) > 0) {
> +--=20
> +2.8.2
> +
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 24cd0b0..b5edaeb 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV=
}.tgz \
>             file://use-base_libdir-instead-of-hardcoded-lib.patch \
>             file://lmbench_result_html_report.patch \
>             file://fix-lmbench-memory-check-failure.patch \
> +           file://lat_http-Use-puts-instead-of-printf-to-avoid-f.patch \
>  "
>  SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
>  SRC_URI[sha256sum] =3D "cbd5777d15f44eab7666dcac418054c3c09df99826961a39=
7d9acf43d8a2a551"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i4qexvobqc5lcila
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleOCLoACgkQN1Ujt2V2gBx0KwCbBNvrG8LId8wd++vWhEWOhwvT
TvwAnihvztc8dit9osCUnsd8h84albbA
=WMAp
-----END PGP SIGNATURE-----

--i4qexvobqc5lcila--
