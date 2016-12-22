Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A58E6774E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 05:53:31 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b1so18847368pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 21:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=QUuPC3Sv1Wh3KKKiDoPeh6/54Rj+Ia2dszxEkPSzAvM=;
	b=hoNpIUfdhMWcJr9bfk9f4ImLFUtu4PWw1FF0Uy93n4XXEAkTG3X50XpTgznN0gv1aN
	3HMODLX7MXabbOLIazzvxdOXqALyd9ui+/9XgGVSb2hh/lfyClLSE4UXBJU8ju4vKpgO
	ozvKqp8Fx/fw6NKxr8555V0mZiPFXpT+SoIDkY1uf5vDQlkH7tKh+iCL4DqxrMGUTPo2
	vCjRL0eocmvViMBH6D/RGVj7AZivVCF0IrSg5cUZYaAkPFFHUGFHfkDybf8n9PZnAFaD
	hz4PT48LO6C8UxtiOmjELoa0SHa3okY9ebZsWDnSg/6aworlYDlgV7tbvSCsSKD7pWQX
	+HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=QUuPC3Sv1Wh3KKKiDoPeh6/54Rj+Ia2dszxEkPSzAvM=;
	b=QzWsqt0SHWqAAnFkpFJKRvxk8RYwN4eb5RoJAxpAj02Kj8xybpfQRK6Cmj8tkYzVCi
	3QoZ1wpOED7JfsvxPyFfTh+Uud56c5BGTVW7UZgmmQWD/pHP7JkJ6N/5v0UPNiUVtgSh
	GbDVVgIhD7a8axmgCP+m0KBSkkIAGjTIqGkdEV0E4AKqYRtxSesltABSGjpWhTgX751X
	fEX+n8+eHU13oh148lKFfhHQs1QuAiIncpNHwBUn6zouaDJTyClLhCa2uZJ9b4O1jG9u
	3lEYr8rdrMPYlVfyBMy6cvqDd0ewazLpkWkX9MkLG0wXylCsk9sUVCeJ2mou9q1VmybL
	wsWw==
X-Gm-Message-State: AIkVDXJieCs0Ao4+uoMeMcjYYc5nZ5/+q3CWy9Du9EZI7LzayG1D756MfDBWAYEbPB6Xug==
X-Received: by 10.99.164.9 with SMTP id c9mr14173605pgf.141.1482386012308;
	Wed, 21 Dec 2016 21:53:32 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5557:8c89:3c84:75f1?
	([2601:646:8882:b8c:5557:8c89:3c84:75f1])
	by smtp.gmail.com with ESMTPSA id
	s2sm50953527pfi.10.2016.12.21.21.53.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Dec 2016 21:53:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Wed, 21 Dec 2016 21:53:30 -0800
References: <1482309754-1281-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1482309754-1281-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Message-Id: <FB7117A4-E946-4B3B-B6ED-0657F79BF136@gmail.com>
X-Mailer: Apple Mail (2.3259)
Subject: Re: [meta-networking] [PATCH] opensaf: 5.0.0 -> 5.1.0
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
X-List-Received-Date: Thu, 22 Dec 2016 05:53:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 21, 2016, at 12:42 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> =
wrote:
>=20
> 1)Upgrade opensaf from 5.0.0 to 5.1.0.
> 2)Modify meta_oe_security_flags.inc to fix error:
>  /
>  | collect2: error: ld returned 1 exit status
>  | Makefile:542: recipe for target 'librda.la' failed
>  | make[6]: *** [librda.la] Error 1
>  \
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
> .../recipes-daemons/opensaf/{opensaf_5.0.0.bb =3D> opensaf_5.1.0.bb}   =
 | 4 ++--
> meta-oe/conf/distro/include/meta_oe_security_flags.inc                =
| 1 +
> 2 files changed, 3 insertions(+), 2 deletions(-)
> rename meta-networking/recipes-daemons/opensaf/{opensaf_5.0.0.bb =3D> =
opensaf_5.1.0.bb} (94%)
>=20
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb =
b/meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
> similarity index 94%
> rename from meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
> rename to meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
> index 6ceb225..be903a0 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.1.0.bb
> @@ -21,8 +21,8 @@ SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
>            file://0001-plmcd-error-fix.patch \
>            "
>=20
> -SRC_URI[md5sum] =3D "94cd1a4c0406e6a45bb04c003f8690e7"
> -SRC_URI[sha256sum] =3D =
"4b4188a0f3d0ed1ed0e3d77de27c45e2c96b437401de08e7df2ed9ecd54bb999"
> +SRC_URI[md5sum] =3D "821391311c73bc2f2dc5a7d867f732e0"
> +SRC_URI[sha256sum] =3D =
"f687c883a0d50517c33cb445d9177a9e2b07f5bb077bcc0235ffc0fc99af5cb6"
>=20
> inherit autotools useradd systemd pkgconfig
>=20
> diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc =
b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> index 815fb16..01ee4d4 100644
> --- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> +++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
> @@ -25,3 +25,4 @@ SECURITY_CFLAGS_pn-libvdpau =3D =
"${SECURITY_NO_PIE_CFLAGS}"
> #| make[1]: *** [Makefile:675: libluajit.so] Error 1
> SECURITY_CFLAGS_pn-luajit =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> +SECURITY_CFLAGS_pn-opensaf =3D "${SECURITY_NO_PIE_CFLAGS}=E2=80=9D

I was wondering if it would make sense to move tweaking SECURITY_FLAGS =
in the recipe proper
for all the exceptions that we manage in the conf metadata=20

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


