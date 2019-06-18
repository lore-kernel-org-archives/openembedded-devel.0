Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA6C6BC7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:01:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k20so27588519ios.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gIZ+l6Ql/Fe3CbMcu+oqa+glYw/sg9TiVIoGSmdLkmU=;
	b=eOAGmReI/bKTLdCr9rGRbXQTplA9iY9cc2Rl66Ysdl7hWvVioetonuY7pQJCVTOzZe
	bSh3Ax6iDpleJXT1MweIUOF3qkXx67B0TybNAD+lalrsiLh37MVRbsnd86LQh941GPAI
	EWQMBbMkyCjH1d3a0qdoDHtkgO02WJzoGmmg7+Bns5UjDWtajbeCmtqNoFyiqav8+9ID
	Se6wj3eF0y0pVLIuZQuQmvIHz6kCcQVcf4+eiqRoZjZ/Oi08pDJ+W+18rY1WdlffVBe6
	vP8uencT7ho3A0l8VBJFuNKBu2z8NCCs8Fh+yFAk8+URuyqpq/y4xgVlwY+6Kszbwo33
	Pu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gIZ+l6Ql/Fe3CbMcu+oqa+glYw/sg9TiVIoGSmdLkmU=;
	b=FoNmo2lmQWun+dyG5C7+mSD/3STDhbPgJXgGb2drLf+UAJ8oiI/kAWgxaY3hHCx95K
	ORddlsBewvHN6thtvykq6QV1sI/waLFq7BKplg5hK/pJ95VZGZi5N3kJBRcLNGofwpyj
	4AOMhi70hj2K93DeK6hrrw2Roa1SzaJtX/eXICAyip+UBMbPFboUCtTwc2x8TLh76BTS
	2738otyd0LpXayrCVXSzBiskPWOW3rsEBADtElYgDVSp8VMyz4sPuJmL/EzQUKc0EdMj
	VjqRJqgGkdaDIliH7qtnlG32zO28m24otoC5DRkKTwEYTWt4yXntRmuxUDfLh43T7C4x
	qsKA==
X-Gm-Message-State: APjAAAWu3VCTs0hkETLyhTPuYQacWacYRoyHwy7FVPESZuxUj7V3tPeF
	4Qcp55f1cXXi3preCMhvGmf36sy4aZnplai0DkfHOTe6
X-Google-Smtp-Source: APXvYqxrrZ4v+ZJbsLbuK2CHnI4Y5frOu19oPeLSRKcxfTt5mX89Af6Oku8nec5XkCV3QxzdGQDDbvWx2+PnVXHo9ic=
X-Received: by 2002:a5d:9d42:: with SMTP id k2mr3496872iok.45.1560844878030;
	Tue, 18 Jun 2019 01:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190316144936.4768-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190316144936.4768-1-open.source@oleksandr-kravchuk.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 18 Jun 2019 10:01:06 +0200
Message-ID: <CAB2nKc9OS+c5MYdCbjjTTNcg0Qh-nrEXZ-T+cZ36Wy_O0qUBtg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openconnect: update to 8.02
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
X-List-Received-Date: Tue, 18 Jun 2019 08:01:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

After this update I have some difficulties to populate my download
pre-mirror with bitbake runall=3Dfetch universe, warrior branch.

I can't access infradead.org in my company but it seems yocto mirrors does
not contain following revision, this command fails:
git -c core.fsyncobjectfiles=3D0 branch --contains
6487ee8763e1b6345718684909aca970befbc49d --list master

For now, I just ignore the error as I don't use openconnect, anyone have
same issue with it?

Best regards,
Vincent

Le sam. 16 mars 2019 =C3=A0 15:50, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> a =C3=A9crit :

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../openconnect/openconnect_git.bb                 | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/openconnect/
> openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/
> openconnect_git.bb
> index c944144e2..050a2833c 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -2,7 +2,11 @@ SUMMARY =3D "Open client for Cisco AnyConnect VPN"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING.LGPL;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>
> +SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
> +SRCREV =3D "6487ee8763e1b6345718684909aca970befbc49d"
> +
>  DEPENDS =3D "vpnc libxml2 krb5 gettext-native"
> +RDEPENDS_${PN} =3D "bash python"
>
>  PACKAGECONFIG ??=3D "gnutls lz4 libproxy"
>
> @@ -14,10 +18,7 @@ PACKAGECONFIG[libproxy]  =3D
> "--with-libproxy,--without-libproxy,libproxy,"
>  # not config defaults
>  PACKAGECONFIG[pcsc-lite] =3D
> "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
>
> -PV =3D "7.08"
> -
> -SRCREV =3D "9697bea0e50952cab57063238b43a7099e498cbb"
> -SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
> +PV =3D "8.02"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -25,3 +26,8 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF +=3D
> "--with-vpnc-script=3D${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
>                   --disable-static"
> +
> +do_configure_append() {
> +    # script has /usr/bin/python2 path hardcoded
> +    sed -i -e 's=3Dpython2\.*=3Dpython=3Dg' ${S}/trojans/tncc-wrapper.py
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

