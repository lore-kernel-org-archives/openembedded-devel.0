Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881EECE7A8B
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 21:26:05 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.48737.1695590762643046662
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 14:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=guFcfIOP;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1d598ba1b74so3255391fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695590762; x=1696195562; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIlHV0xuleMavPyDh66nOX4DmccQYv07DKqIuosLrTM=;
        b=guFcfIOPNBf8gA54JN7y8aoKWaIo5eFLy5aCPBVZ5mqNSOkYR02P+3QS7D6FAPQKwO
         +PHjU6mUsl7Vla5pcCPk7+iLmBysATyp4TCKUE3Z+EVyLfGiqIMunqzs9iOyrgi3my61
         w0UyP5CoL2NDC5F6Brk9c+YJ9hsJH6Gfn/W89k3iio5h4MP3qtd9m4BoiLoiREUGwNGK
         9LvqFYlgBZKTmhmXxNJv9JuV522LG9nVcwqlF+Buj3z7JGBW7TQnCo/SfTUQAQM2/5j3
         TLSahtNV6oSehsp/PcmpO9UYk0R8Y8rWbFyaMRZtObfxQLNba3RbOYaEkBxv/OPpDOlI
         erCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695590762; x=1696195562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIlHV0xuleMavPyDh66nOX4DmccQYv07DKqIuosLrTM=;
        b=RVFnx638xyYOsHKQjbIO4SwvX46SHZQLZPOWMc1OWCQFSBRO4Wjcrh7N+rwagSjyXc
         2IHbAmSdp3rrD/0eSSoMO+FKKPbYjr94px3ami7+COTTFAklTghj8kth0tLzYNm4fb+y
         2NwE94xsDtiMUr8iHWJkXlwTwF+4fDxp6Vr6+4+DvGA1T7C3Am61+gLPTdaKRYDv5xjK
         eFA8kVdLPwEWfqIdmh7pd3VE/vYi50G1GIDZKV8J21Vli1vvhu3Py62+Zk5ewrjjWVq8
         ETa6CYFkTOb0HB0OoFmqDPWzBK6fmn1me8lYYaKnR4pao3RdTU8KZ1awIp1FP5pOekHw
         saGA==
X-Gm-Message-State: AOJu0YxemudbPi9b8wvFI/zEerCqNcklpbVHTqgb7e5utT2M7uDlBccq
	O6uxoOIghhCHogh3TgzfHn6WAA6Q2ePux0nc9Ks=
X-Google-Smtp-Source: AGHT+IFKtPkzgRBnKtiFNFGvPuIyq9ka7w/g/ZjPV/PPcoM2BcfSF8JNIwySpLsKvhEEiTBwPMYv8/1HxFbehTQRsdE=
X-Received: by 2002:a05:6870:a412:b0:1bf:51f2:94bd with SMTP id
 m18-20020a056870a41200b001bf51f294bdmr7342263oal.18.1695590761727; Sun, 24
 Sep 2023 14:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230924204711.3073-1-f_l_k@t-online.de> <20230924204711.3073-2-f_l_k@t-online.de>
In-Reply-To: <20230924204711.3073-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Sep 2023 14:25:50 -0700
Message-ID: <CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] udisks2: Upgrade 2.9.4 -> 2.10.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000098c6e0606217d48"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105112

--000000000000098c6e0606217d48
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 24, 2023 at 1:47 PM Markus Volk <f_l_k@t-online.de> wrote:

> - add a patch to fix reproducibility issues
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...1-Makefile.am-Dont-include-buildpath.patch | 47 +++++++++++++++++++
>  .../{udisks2_2.9.4.bb => udisks2_2.10.1.bb}   |  8 +++-
>  2 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-include-buildpath.patch
>  rename meta-oe/recipes-support/udisks/{udisks2_2.9.4.bb =>
> udisks2_2.10.1.bb} (86%)
>
> diff --git
> a/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-include-buildpath.patch
> b/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-include-buildpath.patch
> new file mode 100644
> index 000000000..5d9a31c42
> --- /dev/null
> +++
> b/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-include-buildpath.patch
> @@ -0,0 +1,47 @@
> +From b1b58f122a3e05b5689358fdd3203ba110cca567 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sun, 24 Sep 2023 22:20:42 +0200
> +Subject: [PATCH] Reproducibility fix
> +
> +This fixes:
> +WARNING: udisks2-2.10.1-r0 do_package_qa: QA Issue: File
> /usr/lib/udisks2/modules/libudisks2_btrfs.so in package udisks2 contains
> reference to TMPDIR
> +File /usr/lib/udisks2/modules/libudisks2_lvm2.so in package udisks2
> contains reference to TMPDIR
> +File /usr/libexec/udisks2/udisksd in package udisks2 contains reference
> to TMPDIR [buildpaths]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + modules/lvm2/Makefile.am | 2 +-
> + src/Makefile.am          | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/lvm2/Makefile.am b/modules/lvm2/Makefile.am
> +index 67b8aa6b3..e4ae462e7 100644
> +--- a/modules/lvm2/Makefile.am
> ++++ b/modules/lvm2/Makefile.am
> +@@ -16,7 +16,7 @@ CPPFLAGS =
>                        \
> +       -DLVM_HELPER_DIR=\""$(prefix)/lib/udisks2/"\"
>     \
> +       -D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT
>     \
> +       -DUDISKS_COMPILATION
>      \
> +-      -DBUILD_DIR=\"$(abs_top_builddir)/\"
>      \
> ++      -DBUILD_DIR=\"\"


How does this end up in shared object perhaps that needs to be looked at as
such specifying build dir in a makefile should be fine I guess

>                                              \
> +       $(POLKIT_GOBJECT_1_CFLAGS)
>      \
> +       $(GLIB_CFLAGS)
>      \
> +       $(GIO_CFLAGS)
>     \
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 5a174d1ab..0da3a497b 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -20,7 +20,7 @@ CPPFLAGS =
>                        \
> +       -DUDISKS_MODULE_DIR=\"$(libdir)/udisks2/modules\"
>     \
> +       -D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT
>     \
> +       -DUDISKS_COMPILATION
>      \
> +-      -DBUILD_DIR=\"$(abs_top_builddir)/\"
>      \
> ++      -DBUILD_DIR=\"\"
>       \
> +       $(POLKIT_GOBJECT_1_CFLAGS)
>      \
> +       $(GUDEV_CFLAGS)
>     \
> +       $(GLIB_CFLAGS)
>      \
> +--
> +2.42.0
> +
> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
> b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
> similarity index 86%
> rename from meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
> rename to meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
> index 203006371..cb1cbe670 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
> @@ -17,8 +17,11 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES',
> 'systemd', d)}"
>
>  RDEPENDS:${PN} = "acl"
>
> -SRC_URI = "git://
> github.com/storaged-project/udisks.git;branch=2.9.x-branch;protocol=https"
> -SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
> +SRC_URI = " \
> +       git://
> github.com/storaged-project/udisks.git;branch=2.10.x-branch;protocol=https
> \
> +       file://0001-Makefile.am-Dont-include-buildpath.patch \
> +"
> +SRCREV = "18c9faf089e306ad6f3f51f5cb887a6b9aa08350"
>  S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "udisks"
> @@ -45,6 +48,7 @@ FILES:${PN} += " \
>      ${datadir}/dbus-1/ \
>      ${datadir}/polkit-1 \
>      ${datadir}/bash-completion \
> +    ${datadir}/zsh \
>      ${libdir}/polkit-1/extensions/*.so \
>      ${nonarch_base_libdir}/udev/* \
>      ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105110):
> https://lists.openembedded.org/g/openembedded-devel/message/105110
> Mute This Topic: https://lists.openembedded.org/mt/101562778/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000098c6e0606217d48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 24, 2023 at 1:47 PM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">- add a patch to fix reproducibility issues<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...1-Makefile.am-Dont-include-buildpath.patch | 47 ++++++++++++++++++=
+<br>
=C2=A0.../{<a href=3D"http://udisks2_2.9.4.bb" rel=3D"noreferrer" target=3D=
"_blank">udisks2_2.9.4.bb</a> =3D&gt; <a href=3D"http://udisks2_2.10.1.bb" =
rel=3D"noreferrer" target=3D"_blank">udisks2_2.10.1.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 8 +++-<br>
=C2=A02 files changed, 53 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-Makefi=
le.am-Dont-include-buildpath.patch<br>
=C2=A0rename meta-oe/recipes-support/udisks/{<a href=3D"http://udisks2_2.9.=
4.bb" rel=3D"noreferrer" target=3D"_blank">udisks2_2.9.4.bb</a> =3D&gt; <a =
href=3D"http://udisks2_2.10.1.bb" rel=3D"noreferrer" target=3D"_blank">udis=
ks2_2.10.1.bb</a>} (86%)<br>
<br>
diff --git a/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-i=
nclude-buildpath.patch b/meta-oe/recipes-support/udisks/udisks2/0001-Makefi=
le.am-Dont-include-buildpath.patch<br>
new file mode 100644<br>
index 000000000..5d9a31c42<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-include-=
buildpath.patch<br>
@@ -0,0 +1,47 @@<br>
+From b1b58f122a3e05b5689358fdd3203ba110cca567 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Sun, 24 Sep 2023 22:20:42 +0200<br>
+Subject: [PATCH] Reproducibility fix<br>
+<br>
+This fixes:<br>
+WARNING: udisks2-2.10.1-r0 do_package_qa: QA Issue: File /usr/lib/udisks2/=
modules/libudisks2_btrfs.so in package udisks2 contains reference to TMPDIR=
<br>
+File /usr/lib/udisks2/modules/libudisks2_lvm2.so in package udisks2 contai=
ns reference to TMPDIR<br>
+File /usr/libexec/udisks2/udisksd in package udisks2 contains reference to=
 TMPDIR [buildpaths]<br>
+<br>
+Upstream-Status: Inappropriate [oe-specific]<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+---<br>
+ modules/lvm2/Makefile.am | 2 +-<br>
+ src/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/modules/lvm2/Makefile.am b/modules/lvm2/Makefile.am<br>
+index 67b8aa6b3..e4ae462e7 100644<br>
+--- a/modules/lvm2/Makefile.am<br>
++++ b/modules/lvm2/Makefile.am<br>
+@@ -16,7 +16,7 @@ CPPFLAGS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DLVM_HELPER_DIR=3D\&quot;&quot;$(prefix)/lib/u=
disks2/&quot;\&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DUDISKS_COMPILATION=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 -DBUILD_DIR=3D\&quot;$(abs_top_builddir)/\&quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 -DBUILD_DIR=3D\&quot;\&quot;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">How d=
oes this end up in shared object perhaps that needs to be looked at as such=
 specifying build dir in a makefile should be fine I guess=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex" dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(POLKIT_GOBJECT_1_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GLIB_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GIO_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
+diff --git a/src/Makefile.am b/src/Makefile.am<br>
+index 5a174d1ab..0da3a497b 100644<br>
+--- a/src/Makefile.am<br>
++++ b/src/Makefile.am<br>
+@@ -20,7 +20,7 @@ CPPFLAGS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DUDISKS_MODULE_DIR=3D\&quot;$(libdir)/udisks2/=
modules\&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DUDISKS_COMPILATION=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 -DBUILD_DIR=3D\&quot;$(abs_top_builddir)/\&quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 -DBUILD_DIR=3D\&quot;\&quot;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(POLKIT_GOBJECT_1_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GUDEV_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(GLIB_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-- <br>
+2.42.0<br>
+<br>
diff --git a/meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.9.4=
.bb" rel=3D"noreferrer" target=3D"_blank">udisks2_2.9.4.bb</a> b/meta-oe/re=
cipes-support/udisks/<a href=3D"http://udisks2_2.10.1.bb" rel=3D"noreferrer=
" target=3D"_blank">udisks2_2.10.1.bb</a><br>
similarity index 86%<br>
rename from meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.9.4.=
bb" rel=3D"noreferrer" target=3D"_blank">udisks2_2.9.4.bb</a><br>
rename to meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.10.1.b=
b" rel=3D"noreferrer" target=3D"_blank">udisks2_2.10.1.bb</a><br>
index 203006371..cb1cbe670 100644<br>
--- a/meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.9.4.bb" re=
l=3D"noreferrer" target=3D"_blank">udisks2_2.9.4.bb</a><br>
+++ b/meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.10.1.bb" r=
el=3D"noreferrer" target=3D"_blank">udisks2_2.10.1.bb</a><br>
@@ -17,8 +17,11 @@ DEPENDS +=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;systemd&#39;, d)}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;acl&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/storaged-project/udis=
ks.git;branch=3D2.9.x-branch;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/storaged-project/udisks.git;branch=3D2.9.x-branch;proto=
col=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;001c486e6d099ed33e2de4f5c73c03e3ee180f81&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/storaged-pro=
ject/udisks.git;branch=3D2.10.x-branch;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/storaged-project/udisks.git;branch=3D2.10.x-b=
ranch;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-Dont-include-buildpath.=
patch \<br>
+&quot;<br>
+SRCREV =3D &quot;18c9faf089e306ad6f3f51f5cb887a6b9aa08350&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;udisks&quot;<br>
@@ -45,6 +48,7 @@ FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/ \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/polkit-1 \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/bash-completion \<br>
+=C2=A0 =C2=A0 ${datadir}/zsh \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/polkit-1/extensions/*.so \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_base_libdir}/udev/* \<br>
=C2=A0 =C2=A0 =C2=A0${exec_prefix}${nonarch_base_libdir}/udisks2/* \<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105110): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105110" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105110</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101562778/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101562778/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000098c6e0606217d48--

