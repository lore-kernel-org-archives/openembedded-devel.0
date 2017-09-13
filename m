Return-Path: <rob.woolleywr@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBB47869B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:48:21 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id v109so3048907wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SYaljj7tygYd38Kc4OJH6+w1lBm3dcrrY//q6LCvXts=;
	b=Xfldvfx/J2I1dHEKrLZTbLWylBtk927zrcrO8lJmhYeEj/vDB6UnKBw1fi0l3y3G5X
	v7WLhI1VXYTL5QLR7KzaCu/sVYuRrfRh2WQHsnsLA5xtZpjF3tw4CgIQBHajyW8NZbeM
	e33UfzxKdJgsxDduaQLJmMLHbF/Eh5g6GENtUscYD74nO3OTi2REy2Un3oMDHBDBN7nP
	lPx4MAM6KITLKf936AaG8GTQEWc5WD4+ZUc22GPAqL227YPc84/Gug0Qqdt9qo8uCETb
	P6ZZocsJq4qdANFv35/ETIbt95F36kNnh2AH1XQtadeRuTxhucBfJkZBW7vQEM8E8ZqE
	EAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SYaljj7tygYd38Kc4OJH6+w1lBm3dcrrY//q6LCvXts=;
	b=NoU05oZ985QGjn912XuwSz+HvZ8eg1Z4+nKTv7rh6++9CEKAopi8NNxCGdDDApHvy/
	3ZHbnFeymy5juUcQOvjEoV38vQEtCQaJLIiNXFLeRtnrsToB5TqVgSbacUEr1umyOSlA
	6rrlWbc7XeewWsX7DOkVk0fNXQbJld2temXpZuCc9+R/RRXDR+GkXaLa3mG8ueSlkY1/
	QviKeSEjCb29lcMtPpZkL/UJSeTRZiH22G/7JWtjYOAsCt+38JJPtXf+B+TUDBtVPK5B
	xmXBd/H/ayEy/R282OebMHCfpB0HNWGKmsV3/2EKBmzetl5IIjP9KXsVnCfCWJdGYlIT
	2isg==
X-Gm-Message-State: AHPjjUjsxgxQTtMjO88ZMMMnIWjGkfGvJZJzRF90+37pNFN4Apmdv8Q0
	QUzhsaahty6by94OGKFc7aWit58v5JjYjvWD+08=
X-Google-Smtp-Source: ADKCNb5I+EWyA5V2PS6Nc69hvhdl2nlcadEfVEsZyVOu6DkD9TaKfOUA1qUr3mKl51xJUvVwnSR0cZJ3485gDImR5s8=
X-Received: by 10.223.139.81 with SMTP id v17mr15803262wra.226.1505339302814; 
	Wed, 13 Sep 2017 14:48:22 -0700 (PDT)
MIME-Version: 1.0
Sender: rob.woolleywr@gmail.com
Received: by 10.28.54.170 with HTTP; Wed, 13 Sep 2017 14:48:22 -0700 (PDT)
In-Reply-To: <20170912083614.5300-3-Martin.Jansa@gmail.com>
References: <20170912083614.5300-1-Martin.Jansa@gmail.com>
	<20170912083614.5300-3-Martin.Jansa@gmail.com>
From: Rob Woolley <rob.woolley@windriver.com>
Date: Wed, 13 Sep 2017 17:48:22 -0400
X-Google-Sender-Auth: b-I-WUEvv3w1EAXyye6mjmJska8
Message-ID: <CAGAhMBzZ_5k+r+8M6t_3i8QxJiahZitC+K4erMPWpXY7EtW_pQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/3] gnome-keyring: delete blacklisted
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
X-List-Received-Date: Wed, 13 Sep 2017 21:48:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

I just started looking into this today.

Adding libgmodule to the gnome-keyring recipe should resolve the problem
you're seeing: LDFLAGS += "-lgmodule-2.0"

How would you like me to send a patch should I merge it with Jason's
previous patch or make a new patch in the series?

Regards,
Rob

On Tue, Sep 12, 2017 at 4:36 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * there was some work on it recently, but still contains QA issues and no
>   reply in 2 weeks:
>   http://lists.openembedded.org/pipermail/openembedded-devel/2
> 017-August/114415.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gnome-keyring/gnome-keyring/egg-asn1x.patch    | 55
> ----------------------
>  .../gnome-keyring/gnome-keyring_2.32.1.bb          | 45
> ------------------
>  2 files changed, 100 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gnome
> -keyring/gnome-keyring/egg-asn1x.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/
> gnome-keyring_2.32.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
> b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
> deleted file mode 100644
> index ad8a40ccf..000000000
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Fixed build error with gcc 4.8
> -
> -Errors like below
> -
> -egg-asn1x.c: In function 'anode_encode_build':
> -egg-asn1x.c:1280:7: warning: variable 'type' set but not used
> [-Wunused-but-set-variable]
> -egg-asn1x.c: In function 'traverse_and_prepare':
> -egg-asn1x.c:3354:3: warning: passing argument 1 of 'egg_asn1x_create'
> from incompatible pointer type [enabled by default]
> -In file included from egg-asn1x.c:50:0:
> -egg-asn1x.h:38:8: note: expected 'const struct static_struct_asn *' but
> argument is of type 'const struct asn1_static_node *'
> -egg-asn1x.c: At top level:
> -egg-asn1x.c:3509:1: error: conflicting types for 'egg_asn1x_create'
> -In file included from egg-asn1x.c:50:0:
> -egg-asn1x.h:38:8: note: previous declaration of 'egg_asn1x_create' was
> here
> -egg-asn1x.c:3572:1: error: conflicting types for 'egg_asn1x_create_quark'
> -In file included from egg-asn1x.c:50:0:
> -egg-asn1x.h:41:8: note: previous declaration of 'egg_asn1x_create_quark'
> was here
> -egg-asn1x.c:3579:1: error: conflicting types for
> 'egg_asn1x_create_and_decode'
> -In file included from egg-asn1x.c:50:0:
> -egg-asn1x.h:44:8: note: previous declaration of
> 'egg_asn1x_create_and_decode' was here
> -make[4]: *** [libegg_la-egg-asn1x.lo] Error 1
> -
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: gnome-keyring-2.32.1/egg/egg-asn1x.h
> -===================================================================
> ---- gnome-keyring-2.32.1.orig/egg/egg-asn1x.h  2010-10-18
> 19:11:38.000000000 -0700
> -+++ gnome-keyring-2.32.1/egg/egg-asn1x.h       2013-06-11
> 15:15:00.675399263 -0700
> -@@ -25,6 +25,7 @@
> - #define EGG_ASN1X_H_
> -
> - #include <glib.h>
> -+#include <libtasn1.h>
> -
> - #ifndef HAVE_EGG_ALLOCATOR
> - typedef void* (*EggAllocator) (void* p, gsize);
> -@@ -35,13 +36,13 @@
> -
> - struct static_struct_asn;
> -
> --GNode*              egg_asn1x_create                 (const struct
> static_struct_asn *defs,
> -+GNode*              egg_asn1x_create                 (const
> ASN1_ARRAY_TYPE *defs,
> -                                                       const gchar *type);
> -
> --GNode*              egg_asn1x_create_quark           (const struct
> static_struct_asn *defs,
> -+GNode*              egg_asn1x_create_quark           (const
> ASN1_ARRAY_TYPE *defs,
> -                                                       GQuark type);
> -
> --GNode*              egg_asn1x_create_and_decode      (const struct
> static_struct_asn *defs,
> -+GNode*              egg_asn1x_create_and_decode      (const
> ASN1_ARRAY_TYPE *defs,
> -                                                       const gchar *type,
> -                                                       gconstpointer data,
> -                                                       gsize n_data);
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.
> 1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> deleted file mode 100644
> index 4ac75cbef..000000000
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -SUMMARY = "Password and keyring managing daemon"
> -HOMEPAGE = "http://www.gnome.org/"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://gcr/gcr.h;endline=22;md
> 5=a272df1e633e27ecf35e74fb5576250e \
> -                    file://egg/egg-dbus.h;endline=
> 25;md5=eb6f531af37165dc53420c073d774e61 \
> -                    file://gp11/gp11.h;endline=24;
> md5=bd8c7a8a21d6c28d40536d96a35e3469 \
> -                    file://pkcs11/pkcs11i.h;endlin
> e=24;md5=e72cfbb718389b76a4dae838d1c1f439"
> -
> -SECTION = "x11/gnome"
> -
> -PR = "r12"
> -
> -inherit autotools gnome gtk-doc pkgconfig gsettings
> -
> -SRC_URI += "file://egg-asn1x.patch"
> -
> -DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}
> intltool-native"
> -RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
> -
> -EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam',
> d)}"
> -
> -SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
> -SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8
> d6a1b44287f1e9e595b3594df46bf7f18f9"
> -GNOME_COMPRESS_TYPE="bz2"
> -
> -FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
> -                ${base_libdir}/security/*${SOLIBSDEV} \
> -               "
> -
> -FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
> -                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
> -                    ${libdir}/${BPN}/standalone/*.la \
> -                    ${base_libdir}/security/*.la \
> -                   "
> -
> -INSANE_SKIP_${PN}-dev += "dev-elf"
> -
> -FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
> -                    ${libdir}/${BPN}/devel/.debug/ \
> -                    ${base_libdir}/security/.debug/"
> -
> -PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from
> oe-core - the recipe will be removed on 2017-09-01 unless the issue is
> fixed"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

