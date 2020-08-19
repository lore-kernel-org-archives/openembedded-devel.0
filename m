Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.85221.1597829489713493411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 02:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dg86lxyP;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: jonatan.p@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e11so12127804ils.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pgObndMec0jHhFByFiVPhp7BvaNgEp+nQK9vQzMzufk=;
        b=dg86lxyPI7Ti6waoi1EqwwF+ESXgBCuP5nOZFGTbCrKtNP7j2mROf/Um3iEcCj4lxF
         bnF6mVAdT2BEWuFrDbSuKxLzfS2VBaJQgGvCuqtxdWwYPgaFxE+Aoe2qT2TVmUwCCOS0
         c4GKgonvGXcaQe+8/K8OZyCARjzx4CzC3HIFDMn1sJivUB4LcFwyCuHZWU7KYm9EhOSl
         TdlZ1jCLC0n9ZZyl7ozHUFcaXtQzil7NJSK38A6zcOxtANDD0rvfQwT1bjxralBbiMot
         wmfObwoiRlo19BHQ6bzzy7Qb/u4DsP96etswMFxC4us3g78th2ZNWjfxcjR5OXI2yySI
         4sGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pgObndMec0jHhFByFiVPhp7BvaNgEp+nQK9vQzMzufk=;
        b=oXF1AM2WWEpbC2xxBsJiCqymHrUWD2cArWMf2mHrfN1bUsb2TRYtp1FNPJsRhRCgAT
         tDms1CmSRoRvYs9aGyRpypYAlhrVxlzdxwMzWC9yOetBX4Rd2r0X9W+XhzuhDFogScw+
         2+j5n/mGxHTE04o4iH5PPuNOKYivDy51whlJiJmNO9Flk8s1Crbae1ZmR6w3to+Og099
         hPE/8QKmKEmQzKBi60phPPkxulPTllGXJNLKDdo2fqI86Jzm9vZzc0VeVosYMP/lWrQE
         2oF8JHSaD2Op7HZrlBvlJGYVzQ5rMYXb/QmsgBpYsq1EckFBvjzhPAhW8eQqU4V2aDvw
         kxUQ==
X-Gm-Message-State: AOAM532iR/hy2J857S0TzJ4AVabW1u6vZxwmdOfnfT8SoVkVHRdxfS/h
	BFSdcVoaMJzlk8OCg0UMD3ypKLCLpDivASzAGc0=
X-Google-Smtp-Source: ABdhPJzVSWNExwqVkNxfO7QhvkMC2PDn8aOfdyiE7jd0ZrhhpiH7f1FT8HA4Ylh25BbP0q3ctN0qceSkCGUr+5AVFVk=
X-Received: by 2002:a92:5a05:: with SMTP id o5mr20476491ilb.58.1597829488865;
 Wed, 19 Aug 2020 02:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <16285DBF18FAF8F7.27500@lists.openembedded.org>
In-Reply-To: <16285DBF18FAF8F7.27500@lists.openembedded.org>
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
Date: Wed, 19 Aug 2020 11:31:17 +0200
Message-ID: <CAKm+giMq=wbHhLn4WDM0xfnv4J2GJEQYfUzKts3vJukgBm2cYw@mail.gmail.com>
Subject: Re: [oe] [PATCH] openjdk-8: Convert do_unpack postfunc to _append
To: =?UTF-8?Q?Jonatan_P=C3=A5lsson?= <jonatan.p@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, richard.leitner@skidata.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

On Wed, Aug 5, 2020 at 2:05 PM Jonatan P=C3=A5lsson via
lists.openembedded.org <jonatan.p=3Dgmail.com@lists.openembedded.org>
wrote:
>
> archiver.bbclass will invoke do_unpack as a function (rather than a
> task) during do_unpack_and_patch. When invoked as a function, the
> postfuncs of do_unpack are not executed.
>
> Convert the postfuncs into an _append fragment on do_unpack instead.
>
> Fixes:
>
>     .. snip ..
>     No file to patch.  Skipping patch.
>     1 out of 1 hunk ignored
>     Patch 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch does not appl=
y (enforce with -f)
>     ERROR: Logfile of failure stored in: .. snip .. /build/tmp/work/x86_=
64-linux/openjdk-8-native/252-r0/temp/log.do_unpack_and_patch.220625
>     ERROR: Task (.. snip .. /sources/openembedded-core/meta-java/recipes=
-core/openjdk/openjdk-8-native_252.bb:do_unpack_and_patch) failed with exit=
 code '1'
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/op=
enjdk/openjdk-8-common.inc
> index c78bb2a..123e896 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -46,6 +46,13 @@ do_unpack_delete_X11_wrappers() {
>      find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.=
java' -delete
>  }
>
> +do_unpack_append() {
> +    bb.build.exec_func('do_unpack_extract_submodules', d)
> +
> +    if not bb.utils.filter('PACKAGECONFIG', 'x11', d):
> +        bb.build.exec_func('do_unpack_delete_X11_wrappers', d)
> +}
> +
>  def package_config_option_cleanup(d):
>      distro_x11 =3D bb.utils.contains('DISTRO_FEATURES', 'x11', True, Fa=
lse, d)
>      distro_alsa =3D bb.utils.contains('DISTRO_FEATURES', 'alsa', True, =
False, d)
> @@ -155,9 +162,6 @@ def jdk_configure_options(d):
>      options =3D package_config_option_cleanup(d)
>      return options[3]
>
> -do_unpack[postfuncs] +=3D "do_unpack_extract_submodules"
> -do_unpack[postfuncs] +=3D "${@bb.utils.contains('PACKAGECONFIG', 'x11',=
 '', 'do_unpack_delete_X11_wrappers', d)}"
> -
>  export DEBUG_BINARIES =3D "true"
>
>  ALTERNATIVE_PRIORITY =3D "50"
> --
> 2.26.1
>
>=20
