Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVnXL-0003XT-4h
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 16:57:03 +0100
Received: by yie16 with SMTP id 16so893049yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 07:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3l7UYR/eOz2iHgvcPryhyCn9d7f12F9arsS1moPXHp8=;
	b=u2RYPXXHdFxe/Wz+x9Poc3EzGzW3SPS9OfwawlB+Ne+xEcPm3+m6ERCPXqE/5dMfua
	/PKX57y8e1oE2ewu++XN3iUruBf8hVEzhb0QkCoEp31T7aHbfaC6eI/Rqjl3Gs8lulIK
	c59Jwt81YJZbkIyzR4q8ibxAaTXn0PSg5xuKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=K1bPg2sl8Jx9aQdU205CJg/lspV8CPT3+wVt+I2HzKHCl30t39e3Od2O13TKX87sZy
	mIROS1pq6YgB5lJWBBWV6wPycIbfTb9REQnBkHxhXR7YZ85iqlNsLA7T7XA2B/1VPinh
	RfT0bja3GCmVUC4LllyNjEtWQa70jCPPqahqo=
Received: by 10.90.10.21 with SMTP id 21mr10288096agj.112.1293119813577; Thu,
	23 Dec 2010 07:56:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 23 Dec 2010 07:56:33 -0800 (PST)
In-Reply-To: <1293091850-26441-1-git-send-email-Martin.Jansa@gmail.com>
References: <1293091850-26441-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2010 07:56:33 -0800
Message-ID: <AANLkTikREzR0KCObpS8qTCmE9168y60pJRcBxBRmF7TD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] dbus: upgrade 1.4.0 to 1.4.1 and make it new default CVE-2010-4352
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Dec 2010 15:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2010 at 12:10 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/distro/include/preferred-shr-versions.inc | =C2=A0 =C2=A02 --
> =C2=A0recipes/dbus/dbus_1.4.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 18 ------------------
> =C2=A0recipes/dbus/dbus_1.4.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 15 +++++++++++++++
> =C2=A03 files changed, 15 insertions(+), 20 deletions(-)
> =C2=A0delete mode 100644 recipes/dbus/dbus_1.4.0.bb
> =C2=A0create mode 100644 recipes/dbus/dbus_1.4.1.bb
>
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index 1c336b3..6a96798 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -1,7 +1,5 @@
> =C2=A0# Upgraded
> =C2=A0# use newer version then preferred by default
> -PREFERRED_VERSION_dbus =3D "1.4.0"
> -PREFERRED_VERSION_dbus-native =3D "1.4.0"
> =C2=A0PREFERRED_VERSION_libmikmod =3D "3.2.0-beta2"
> =C2=A0PREFERRED_VERSION_strace =3D "4.5.15"
> =C2=A0PREFERRED_VERSION_emacs-x11 =3D "23.1"
> diff --git a/recipes/dbus/dbus_1.4.0.bb b/recipes/dbus/dbus_1.4.0.bb
> deleted file mode 100644
> index 2c4943b..0000000
> --- a/recipes/dbus/dbus_1.4.0.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -include dbus.inc
> -PR =3D "${INC_PR}.0"
> -
> -BBCLASSEXTEND =3D "native"
> -
> -SRC_URI =3D "\
> - =C2=A0http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> - =C2=A0\
> - =C2=A0file://tmpdir.patch \
> - =C2=A0file://add-configurable-reply-timeouts.patch \
> - =C2=A0file://dbus-1.init \
> -"
> -
> -# This needs more testing before pushing as default dbus
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRC_URI[md5sum] =3D "f59618b18d2fb2bd1fce9e1c5a2a3282"
> -SRC_URI[sha256sum] =3D "c96d2f86d40e158e2bf405925a0a42cce0533a8466098e2f=
2238aa1614926652"
> diff --git a/recipes/dbus/dbus_1.4.1.bb b/recipes/dbus/dbus_1.4.1.bb
> new file mode 100644
> index 0000000..5dec10e
> --- /dev/null
> +++ b/recipes/dbus/dbus_1.4.1.bb
> @@ -0,0 +1,15 @@
> +include dbus.inc
> +PR =3D "${INC_PR}.0"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI =3D "\
> + =C2=A0http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> + =C2=A0\
> + =C2=A0file://tmpdir.patch \
> + =C2=A0file://add-configurable-reply-timeouts.patch \
> + =C2=A0file://dbus-1.init \
> +"
> +
> +SRC_URI[md5sum] =3D "99cb057700c0455fb68f8d57902f77ac"
> +SRC_URI[sha256sum] =3D "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7=
189963f3593983bd"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


