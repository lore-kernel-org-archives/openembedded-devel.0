Return-Path: <matt.hoosier@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 79E01784E5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 12:55:52 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id x35so4766243uax.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=mLuBiyJW8k+PI3dgkjsegWmo6puY9P89CeZ7Wcb5ntc=;
	b=aV8Cis8sL885P8aEj/wTYixcxdB7/n0WErXesLhcK62IBqsp4l3ugEgiTQVbuGfdAc
	DOIHxFyWMUPmDipQHvPukI2signtuq2FLKlX4f+DaIbEVFsHmmBVw5XRv1hDg3+8Fv63
	MC/17m2riVS6LP2JGL5DNYPSeDYAmtdIiPYbqhMUNAmyV30E5S8qBv7S1RBU7gMSglWI
	kxzd6rKPLxXG4s578f3UnTcPQHTjM2j2lve3n7lAJc6XvhRHdN0YKuoNxjJP1PlSyRvQ
	VW3tmDI/nwTb0qRyOLj1LogeaozuRazg5bCeNkbGD1s6RNU3rc/PQbhJSUPIzmlbmV5p
	0iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=mLuBiyJW8k+PI3dgkjsegWmo6puY9P89CeZ7Wcb5ntc=;
	b=LbpZvrs6t+wnEwYl7aCaheGQp4NWdgBrzV2KMX96JjZmOtUUbSWDZkcx6GqKGRyywJ
	+ma/Nsm+Ga/nEtu2GTQrnDGsbA24KtXMK86ZRakPw0t7FPhPTBbZm1As6V/JvwvzPEhv
	cU6Pis/tRldvsX0M4/MFS8F9V7tEYYsf8UWHz9PIpI6w7JqFEbVgCrP2GrqScDLk0AzQ
	rP1NOD/2PCc65ahPRAIQk9V62rqbmphIUtJperoQYrRZfLtuOA1WBmmPH4Jc9mWRcLuf
	6QoV2AfQ3VSoOVY3sUNe8GLMiaUGR5evyDAWxOrFASlDqUtc6nvp3inUPs/Zx+SumUCI
	ZiWA==
X-Gm-Message-State: AHYfb5jVHHmUvXIk0K3EYlsM4NBK667KkOZnnvev0vrPFFwj9Ysnqn27
	Smy/YBVAQ3dkZaYxqVPQ91GVXgbNw2qQ
X-Received: by 10.159.33.232 with SMTP id 95mr7275291uac.1.1503147353233; Sat,
	19 Aug 2017 05:55:53 -0700 (PDT)
MIME-Version: 1.0
Sender: matt.hoosier@gmail.com
Received: by 10.176.1.169 with HTTP; Sat, 19 Aug 2017 05:55:12 -0700 (PDT)
In-Reply-To: <20170817122733.5027-1-matt.hoosier@gmail.com>
References: <20170817122733.5027-1-matt.hoosier@gmail.com>
From: Matt Hoosier <matt.hoosier@garmin.com>
Date: Sat, 19 Aug 2017 07:55:12 -0500
X-Google-Sender-Auth: _94Ws_0tztpqOQRaV3hNJCpyds8
Message-ID: <CAJgxT3_Qy3DmcGznf3SdRXfis3qBxXSHPYMrLqdW6r+Tjy0ftQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase: fix Krogoth build regression from efa8aaf
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
X-List-Received-Date: Sat, 19 Aug 2017 12:55:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2017 at 7:27 AM, Matt Hoosier <matt.hoosier@gmail.com> wrot=
e:
>
> From: Matt Hoosier <matt.hoosier@garmin.com>
>
> With
>
>     commit efa8aaf82e580a7d32eaaab48eb92d436f2e222a
>     Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>     Date:   Thu Feb  9 00:26:09 2017
>
>     qmake5_base.bbclass: set qt.conf by environment variable again
>
> we stopped pointing ${OE_QMAKE_QTCONF_PATH} at a valid file and
> instead directed it to a path which was intended not to exist.
>
> The motivation was to permit qtbase/qtbase-native/nativesdk-qtbase
> to build again after Qt 5.8 started paying attention to the
> contents of this file.
>
> The change as done in efa8aaf works well enough for Morty and
> subsequent releases' copies of Bitbake, but fails on earlier
> releases because they lack the following change:
>
>     commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
>     Author: Ross Burton <ross.burton@intel.com>
>     Date: 2016-07-14 13:56:22
>
>     bitbake: build: don't use $B as the default cwd for functions
>
> The result is that when we build with Krogoth or prior, the body
> of do_generate_qt_config_file() runs with a cwd of ${B}, which was
> _not_ the intent of efa8aaf. Because the working directory is ${B},
> ${OE_QMAKE_QTCONF_PATH} is written in there too. do_configure() --
> whose cwd is by design also ${B} -- then finds the file 'foodummy',
> and the build breaks for the reasons outlined in efa8aaf.
>
> This change simply shifts the implementation tactics to suppress
> the creation of ${OE_QMAKE_QTCONF_PATH} during qtbase rather than rely
> on unspecified behavior about the cwd of do_generate_qt_config_file().
>
> (cherry picked from commit a17ff281aa8d99f770b0a049cb798235005fb93e
> at https://codereview.qt-project.org/yocto/meta-qt5.)
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
>  recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
>  recipes-qt/qt5/qtbase_git.bb           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index f2ff5f7..ffbb917 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -94,7 +94,7 @@ OE_QMAKE_PATH_HOST_LIBS =3D "${libdir}"
>
>  # for qtbase configuration we need default settings
>  # since we cannot set empty set filename to a not existent file
> -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
> +deltask generate_qt_config_file
>
>  do_configure() {
>      ${S}/configure -v \
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index 98cbecc..0884a19 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -79,7 +79,7 @@ PACKAGECONFIG_CONFARGS =3D " \
>
>  # for qtbase configuration we need default settings
>  # since we cannot set empty set filename to a not existent file
> -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
> +deltask generate_qt_config_file
>
>  do_configure_prepend() {
>      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device=
-extra.pri: No such file or directory"
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 5cfbcfa..a2e8917 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -137,7 +137,7 @@ QT_CONFIG_FLAGS +=3D " \
>
>  # for qtbase configuration we need default settings
>  # since we cannot set empty set filename to a not existent file
> -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
> +deltask generate_qt_config_file
>
>  do_configure() {
>      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device=
-extra.pri: No such file or directory" during configuration
> --
> 2.12.0
>

Any comments?

