Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D4D206D36E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 22:31:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l9so24332918wrt.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 14:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g048FouOofIDvLQaQgSwiaI0sAakH+im4YnvbczVNSk=;
	b=MjmwH2o4OoRt8pgrUGRb4OhWY+ZQaCDknpiFP/VO9q78py/jNki/VzYpAio/OJJjAw
	+fCL9WboGyihQxb4IiCofLJcHOFy6U9TMTyKEiZKQiYqWUf+QHpX2q1AOYF632PrNVxJ
	Em7NteMXPm/4KUeJpfSAf5VMz1rgqhj7vH/zfugWaHpp2IYehXLhezXPxma5NSCNk9/p
	/1dT3Z43NEyMm3gEZrjzDqhQYGdOYvISQcWJhCDEB5UgRp5RzHrxQ8jBi6saf3+EcjS+
	4fhCDu19pdlAQt4tIjZ6gXV95SfxDS3LIar5QhfTF+6DAPz5oZfygBsfndbsuyJfN1wr
	Wrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g048FouOofIDvLQaQgSwiaI0sAakH+im4YnvbczVNSk=;
	b=kT5sBPtCnBTxDh1VIizshkxH6JL91qSH7tHcNQQW2DP4D2q9bHc0PxPxK2hAEQn53a
	DkH5zPlxxMuVMWCduhfC6ge1F3sr57P+jwcWlSGahNPARFr6Q/EO08nZwMaegc7RPpJ7
	YTOygp8LrQjK3KvU0j0Qh2UEZ8Tap2XrV1L/jCd8qfpaJoyEeQC/ki4fQNFD15y2jATi
	2XoOER5LlWKl9LGInZObfLzCmM5WjfSr+JIgJ7z4Ngso01SffKtkuGvW5dnMV3QA619R
	IlFUzSaC/UTZaWb77jSseXFmHtqUz3853h0XCFBSBhMLcfg9BC4VwIDLRrkEM0X9amRk
	Su9g==
X-Gm-Message-State: AA+aEWal0thDZtrdVd1O30mz1RYo2zPGrxE7J/o4RNsSnw6D7QAfSa6+
	IJKAUNXVsmwCz0h543rstzW4FwFhEHx+rfS2Rgk=
X-Google-Smtp-Source: AFSGD/Wzox9B0knauMmkjuspl/XlX2MDSyzJw3rPArGu3/w8DZ2fuyX7ks47Jm9exhJ5Q+SvJDjYissYO6AOX0gHgsw=
X-Received: by 2002:adf:f504:: with SMTP id q4mr30519673wro.321.1543357918439; 
	Tue, 27 Nov 2018 14:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20181123223022.30597-1-pbasista@gmail.com>
In-Reply-To: <20181123223022.30597-1-pbasista@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Nov 2018 23:31:46 +0100
Message-ID: <CA+chaQetQT7MbnrguBOhzANeL-w734KQRzWwcaL2+6oEwp-7zQ@mail.gmail.com>
To: pbasista@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v4] Add a working Tvheadend recipe
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
X-List-Received-Date: Tue, 27 Nov 2018 22:31:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What is supposed to provide libdvbcsa? It's not in any public layers
registered here:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dlibdv=
bcsa

Latest world build shows the same issue:

ERROR: Nothing PROVIDES 'libdvbcsa' (but
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/recipe=
s-dvb/tvheadend/
tvheadend_git.bb
DEPENDS on or otherwise requires it). Close matches:

On Fri, Nov 23, 2018 at 11:31 PM Peter Ba=C5=A1ista <pbasista@gmail.com> wr=
ote:

> The original one was previously removed
> by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
> as part of a clean-up of blacklisted recipes.
>
> Signed-off-by: Peter Ba=C5=A1ista <pbasista@gmail.com>
> ---
>  .../recipes-dvb/tvheadend/tvheadend_git.bb    | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.b=
b
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> new file mode 100644
> index 000000000..95cf10bf6
> --- /dev/null
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Tvheadend: TV streaming server and recorder"
> +HOMEPAGE =3D "https://tvheadend.org/"
> +
> +inherit autotools-brokensep gettext gitpkgv pkgconfig
> +
> +DEPENDS =3D "avahi cmake-native libdvbcsa libpcre2 openssl uriparser zli=
b"
> +
> +LICENSE =3D "GPLv3+"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D9cae5acac2e9ee2fc3aec01ac88ce5db"
> +
> +SRC_URI =3D "git://github.com/tvheadend/tvheadend.git"
> +
> +SRCREV =3D "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
> +PV =3D "4.3+git${SRCPV}"
> +PKGV =3D "4.3+git${GITPKGV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF +=3D "--arch=3D${TARGET_ARCH} \
> +                 --disable-hdhomerun_static \
> +                 --disable-ffmpeg_static \
> +                 --disable-libav \
> +                 "
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

