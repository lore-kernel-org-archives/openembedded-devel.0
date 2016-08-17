Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC18065CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:19:45 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id cf3so234164pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 16:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=zUB0lcjps/KBqSNN298m3vD1XS11MLcmca4c4wJq/fk=;
	b=el6enOVzXaUn05FOrsXXfz4cvPusph93Kw7MHLuSefmRpX8+JwK/NjfMRQc1G1wbLO
	wvHCAJamIrcEdaSXMQ2gtBCkligy+g23i6d3DobHUOyw9M+HuGsgScTgqjMNoUb60JQ+
	87HLW1aoI0fRpRyvyz9ZsIkNHWWKvMC2kDiUKW9b9DktIqHQOIIswAUIZkjiXaSOa4GS
	h2flcPnbMGtpN+OLANTsW7iYrR+ucS5UWkKMaKGd6b3/+nYN2vqnwNk6e4B63LkIV872
	pvzp+gNzbViPw1l5G+se56NtDYHXZul/3AvjMXa9Q/TQl4VrH/+ixPHkeukwlbowYGhX
	oKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=zUB0lcjps/KBqSNN298m3vD1XS11MLcmca4c4wJq/fk=;
	b=kBMK7fyLAINPnRlfZZIY53sqTI+a8wmF8n913Tak1fb4dgnRfDMtMpmJ2uigWXkCNT
	9W8S3TwAZe14rssNOaxosh/Uvw0hxNG7a7V7TMl35c/A0Mae9c8ORIyNZj3oSQk9bH0B
	s8GcYwUHNBsFFmykbdmwHHtuPRWRxpfkClETHYsMezxYV4557u/vpAu3iLnNwsF3hsx3
	BWEgNHZYH2XQSrwjqNyaHgd4AdnRXrKWw7S/UMjIHhoaY0UkEZuiD91sJFss2Wu7Lvup
	2y4f0z7KyBqNy5huwdlFIE7NNwC1nsvjLu5kPqEui/KjgbHVIWcGAL80AhJR//CMkP+Q
	Xnkw==
X-Gm-Message-State: AEkoouu/tRJVvGHtzy6KKfzFaR8I+V8slZ+O5nkhiMk89L4IYTYlBmPA5ulYpampITJcZA==
X-Received: by 10.66.131.17 with SMTP id oi17mr9955047pab.88.1471475986058;
	Wed, 17 Aug 2016 16:19:46 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:2492:fc83:25ad:6583?
	([2601:647:4c00:3edf:2492:fc83:25ad:6583])
	by smtp.gmail.com with ESMTPSA id
	uc1sm1193726pac.24.2016.08.17.16.19.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 16:19:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471465334-32622-1-git-send-email-jslater@windriver.com>
Date: Wed, 17 Aug 2016 16:19:41 -0700
Message-Id: <69F4079B-660E-417C-827B-8D7458865C6E@gmail.com>
References: <1471465334-32622-1-git-send-email-jslater@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-networking][PATCH 1/1] yp-tools: fix compile errors
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
X-List-Received-Date: Wed, 17 Aug 2016 23:19:46 -0000
X-Groupsio-MsgNum: 62692
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F7A23C05-C684-4570-A4BF-B269F9F8DE6F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F7A23C05-C684-4570-A4BF-B269F9F8DE6F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 17, 2016, at 1:22 PM, Joe Slater <jslater@windriver.com> wrote:
>=20
> Fix two fatal warnings.  The cast error only
> occurs for some architectures.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
> .../nis/yp-tools/alignment-cheat.patch             |   58 =
++++++++++++++++++++
> .../recipes-support/nis/yp-tools_3.3.bb            |    3 +-
> 2 files changed, 59 insertions(+), 2 deletions(-)
> create mode 100644 =
meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
>=20
> diff --git =
a/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch =
b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
> new file mode 100644
> index 0000000..856e42e
> --- /dev/null
> +++ =
b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
> @@ -0,0 +1,58 @@
> +yp-tools: avoid fatal cast warning
> +
> +The way casting is done, we will get a fatal alignment warning on =
some
> +architectures.  This patch cheats our way around this.
> +

These changes look fine, however you should run it by the upstream.

> +We also eliminate an unused constant which causes a fatal warning.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +
> +
> +--- a/lib/do_ypcall.c
> ++++ b/lib/do_ypcall.c
> +@@ -44,7 +44,9 @@ struct dom_binding
> + typedef struct dom_binding dom_binding;
> +
> + static const struct timeval RPCTIMEOUT =3D {25, 0};
> ++#if 0
> + static const struct timeval UDPTIMEOUT =3D {5, 0};
> ++#endif

perhaps its better to remove the unused code instead of making =
preprocessor
work even more.

> + static int const MAXTRIES =3D 2;
> + static pthread_mutex_t ypbindlist_lock =3D =
PTHREAD_MUTEX_INITIALIZER;
> + static dom_binding *ypbindlist =3D NULL;
> +@@ -381,7 +383,7 @@ __ypclnt_call (u_long prog, xdrproc_t xa
> +
> + int
> + do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
> +-	   caddr_t req, xdrproc_t xres, caddr_t resp)
> ++	   caddr_t req, xdrproc_t xres, void *resp)
> + {
> +   dom_binding *ydb;
> +   int status;
> +@@ -450,9 +452,9 @@ do_ypcall (const char *domain, u_long pr
> + /* Like do_ypcall, but translate the status value if necessary.  */
> + int
> + do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
> +-	      caddr_t req, xdrproc_t xres, caddr_t resp)
> ++	      caddr_t req, xdrproc_t xres, void *resp)
> + {
> +-  int status =3D do_ypcall (domain, prog, xargs, req, xres, resp);
> ++  int status =3D do_ypcall (domain, prog, xargs, req, xres, (void *) =
resp);

resp is already a void pointer why is this typecast needed ?

> +   if (status =3D=3D YPERR_SUCCESS)
> +     /* We cast to ypresp_val although the pointer could also be of
> +        type ypresp_key_val or ypresp_master or ypresp_order or
> +--- a/lib/internal.h
> ++++ b/lib/internal.h
> +@@ -17,8 +17,8 @@
> + #define _INTERNAL_H_
> +
> + extern int do_ypcall (const char *domain, u_long prog, xdrproc_t =
xargs,
> +-		      caddr_t req, xdrproc_t xres, caddr_t resp);
> ++		      caddr_t req, xdrproc_t xres, void *resp);
> + extern int do_ypcall_tr (const char *domain, u_long prog, xdrproc_t =
xargs,
> +-			 caddr_t req, xdrproc_t xres, caddr_t resp);
> ++			 caddr_t req, xdrproc_t xres, void *resp);
> + extern int yp_maplist (const char *, struct ypmaplist **);
> + #endif
> diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb =
b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> index b89f0b8..69217fa 100644
> --- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> @@ -11,11 +11,10 @@ ypwhich, yppasswd, domainname, nisdomainname \
> and ypdomainname. \
> "
>=20
> -PNBLACKLIST[yp-tools] ?=3D "BROKEN: fails to build for qemuarm."
> -
> SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 =
\
>            file://domainname.service \
>            =
file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch=
 \
> +           file://alignment-cheat.patch \
> "
> SRC_URI[md5sum] =3D "acebeecc11a73fb8097503670344834c"
> SRC_URI[sha256sum] =3D =
"812be817df3d4c25813552be336c6c6ad5aedaf65611b81af3ad9f98fb3c2e50"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_F7A23C05-C684-4570-A4BF-B269F9F8DE6F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle08REACgkQuwUzVZGdMxRNrACfbhrnbri6NklGRk3l0MvTBiRS
Qe0An3v9CBjNydcT68zR8NPVzpy2H+FN
=OMDz
-----END PGP SIGNATURE-----

--Apple-Mail=_F7A23C05-C684-4570-A4BF-B269F9F8DE6F--
