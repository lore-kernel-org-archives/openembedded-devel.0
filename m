Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD6D786C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:59:55 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id o22so1699180vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a5wAa4/5Bs+6TAUSJaT7+gfg2Ij66hO8s9Myt3zDO5Q=;
	b=FLdzlVtzAgGi9DsFSRt8anrBtGMGfQ3htzXGVsIgfQR1UmNbnnQ6otoLGI0hCQHjly
	zO+Eu1+GTXMHRVoXl2fgwScQHxNftoInKjd7T+Od22vHPzgNgqUlN7kj7E8Eg4mG/u/A
	D2WHSNMt/owd+9yp80Ti26kauCQHPT5T9TAHxddPxe3GdABv/Dw3SbGh8c6AnASnlY9W
	fN442XmtqC7pnihrcBQthdrofU5pEqWwJbddbloI6pJAcjj+q1zuxTuUab9wzhMqwTg4
	7/zIqtjHO5picBBbkeTSv3Fk+XEH7Id424D3zE9eaH12LhrGdhcPg3AE/5+H8AzehFqM
	8gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a5wAa4/5Bs+6TAUSJaT7+gfg2Ij66hO8s9Myt3zDO5Q=;
	b=OGNZjlm79qqJVVJiZnSrOuxVnqF7vNFIxJg8wQQmNeemB2o4/QD7yglsKfsathjo/i
	KKdzg/dYCSP+fhRiMaVVdHULeTmZKiXjd+P1rrUOX6PoQs1AgWwUEl9uBDKYsDmp7e4X
	B+Sv0+oNULkxB+XBFzNAiF2J92YGHxqrY3hUKOyTUHVIohy6kC93CLCRc2envkdngHeN
	pfp5qitDItB+y94inat0boOXnmWRQK6rKlvHw+gfSgGhEfvs4OYIQlZpxWAgC15gI7dD
	qo89cRrt20F727+8u1JyhrwlFD3kT6u81bfKayjDp4Xipm3AEWNdprcltbybz/V2L+uJ
	MXWA==
X-Gm-Message-State: AHPjjUgrA5NgpLppotIKLUDzUffz9ETMqViRHwXRn6+8Cg0tNu0WMzdP
	hqjIo87peQt5Fzbq7WtHLrjgbnaliDAw8B4TAb8=
X-Google-Smtp-Source: AOwi7QD83vteGJ+/5A8CUJEp7GsoEyJ6cveSPHjCKYbSReTgp2tmYNKbpxttkeHOyxORoq3NZxvRYaKXbwZiicjzwPM=
X-Received: by 10.31.157.71 with SMTP id g68mr14609079vke.130.1505339997154;
	Wed, 13 Sep 2017 14:59:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 14:59:56 -0700 (PDT)
In-Reply-To: <CAGAhMBzZ_5k+r+8M6t_3i8QxJiahZitC+K4erMPWpXY7EtW_pQ@mail.gmail.com>
References: <20170912083614.5300-1-Martin.Jansa@gmail.com>
	<20170912083614.5300-3-Martin.Jansa@gmail.com>
	<CAGAhMBzZ_5k+r+8M6t_3i8QxJiahZitC+K4erMPWpXY7EtW_pQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 23:59:56 +0200
Message-ID: <CA+chaQeGnFA4q=w-TFxBYtOcCkGJXQma9LRCDuALH6XWYveLTg@mail.gmail.com>
To: Rob Woolley <rob.woolley@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 13 Sep 2017 21:59:56 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Rob,

please send v2 of this one:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114340.html

and I'll apply it instead of this removal.

On Wed, Sep 13, 2017 at 11:48 PM, Rob Woolley <rob.woolley@windriver.com>
wrote:

> Hi Martin,
>
> I just started looking into this today.
>
> Adding libgmodule to the gnome-keyring recipe should resolve the problem
> you're seeing: LDFLAGS += "-lgmodule-2.0"
>
> How would you like me to send a patch should I merge it with Jason's
> previous patch or make a new patch in the series?
>
> Regards,
> Rob
>
> On Tue, Sep 12, 2017 at 4:36 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> * there was some work on it recently, but still contains QA issues and no
>>   reply in 2 weeks:
>>   http://lists.openembedded.org/pipermail/openembedded-devel/2
>> 017-August/114415.html
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  .../gnome-keyring/gnome-keyring/egg-asn1x.patch    | 55
>> ----------------------
>>  .../gnome-keyring/gnome-keyring_2.32.1.bb          | 45
>> ------------------
>>  2 files changed, 100 deletions(-)
>>  delete mode 100644 meta-gnome/recipes-gnome/gnome
>> -keyring/gnome-keyring/egg-asn1x.patch
>>  delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/
>> gnome-keyring_2.32.1.bb
>>
>> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
>> b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
>> deleted file mode 100644
>> index ad8a40ccf..000000000
>> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-a
>> sn1x.patch
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -Fixed build error with gcc 4.8
>> -
>> -Errors like below
>> -
>> -egg-asn1x.c: In function 'anode_encode_build':
>> -egg-asn1x.c:1280:7: warning: variable 'type' set but not used
>> [-Wunused-but-set-variable]
>> -egg-asn1x.c: In function 'traverse_and_prepare':
>> -egg-asn1x.c:3354:3: warning: passing argument 1 of 'egg_asn1x_create'
>> from incompatible pointer type [enabled by default]
>> -In file included from egg-asn1x.c:50:0:
>> -egg-asn1x.h:38:8: note: expected 'const struct static_struct_asn *' but
>> argument is of type 'const struct asn1_static_node *'
>> -egg-asn1x.c: At top level:
>> -egg-asn1x.c:3509:1: error: conflicting types for 'egg_asn1x_create'
>> -In file included from egg-asn1x.c:50:0:
>> -egg-asn1x.h:38:8: note: previous declaration of 'egg_asn1x_create' was
>> here
>> -egg-asn1x.c:3572:1: error: conflicting types for 'egg_asn1x_create_quark'
>> -In file included from egg-asn1x.c:50:0:
>> -egg-asn1x.h:41:8: note: previous declaration of 'egg_asn1x_create_quark'
>> was here
>> -egg-asn1x.c:3579:1: error: conflicting types for
>> 'egg_asn1x_create_and_decode'
>> -In file included from egg-asn1x.c:50:0:
>> -egg-asn1x.h:44:8: note: previous declaration of
>> 'egg_asn1x_create_and_decode' was here
>> -make[4]: *** [libegg_la-egg-asn1x.lo] Error 1
>> -
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> -Upstream-Status: Pending
>> -Index: gnome-keyring-2.32.1/egg/egg-asn1x.h
>> -===================================================================
>> ---- gnome-keyring-2.32.1.orig/egg/egg-asn1x.h  2010-10-18
>> 19:11:38.000000000 -0700
>> -+++ gnome-keyring-2.32.1/egg/egg-asn1x.h       2013-06-11
>> 15:15:00.675399263 -0700
>> -@@ -25,6 +25,7 @@
>> - #define EGG_ASN1X_H_
>> -
>> - #include <glib.h>
>> -+#include <libtasn1.h>
>> -
>> - #ifndef HAVE_EGG_ALLOCATOR
>> - typedef void* (*EggAllocator) (void* p, gsize);
>> -@@ -35,13 +36,13 @@
>> -
>> - struct static_struct_asn;
>> -
>> --GNode*              egg_asn1x_create                 (const struct
>> static_struct_asn *defs,
>> -+GNode*              egg_asn1x_create                 (const
>> ASN1_ARRAY_TYPE *defs,
>> -                                                       const gchar
>> *type);
>> -
>> --GNode*              egg_asn1x_create_quark           (const struct
>> static_struct_asn *defs,
>> -+GNode*              egg_asn1x_create_quark           (const
>> ASN1_ARRAY_TYPE *defs,
>> -                                                       GQuark type);
>> -
>> --GNode*              egg_asn1x_create_and_decode      (const struct
>> static_struct_asn *defs,
>> -+GNode*              egg_asn1x_create_and_decode      (const
>> ASN1_ARRAY_TYPE *defs,
>> -                                                       const gchar *type,
>> -                                                       gconstpointer
>> data,
>> -                                                       gsize n_data);
>> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.
>> 1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
>> deleted file mode 100644
>> index 4ac75cbef..000000000
>> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -SUMMARY = "Password and keyring managing daemon"
>> -HOMEPAGE = "http://www.gnome.org/"
>> -BUGTRACKER = "https://bugzilla.gnome.org/"
>> -
>> -LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
>> \
>> -                    file://gcr/gcr.h;endline=22;md
>> 5=a272df1e633e27ecf35e74fb5576250e \
>> -                    file://egg/egg-dbus.h;endline=
>> 25;md5=eb6f531af37165dc53420c073d774e61 \
>> -                    file://gp11/gp11.h;endline=24;
>> md5=bd8c7a8a21d6c28d40536d96a35e3469 \
>> -                    file://pkcs11/pkcs11i.h;endlin
>> e=24;md5=e72cfbb718389b76a4dae838d1c1f439"
>> -
>> -SECTION = "x11/gnome"
>> -
>> -PR = "r12"
>> -
>> -inherit autotools gnome gtk-doc pkgconfig gsettings
>> -
>> -SRC_URI += "file://egg-asn1x.patch"
>> -
>> -DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf
>> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}
>> intltool-native"
>> -RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
>> -
>> -EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
>> '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam',
>> d)}"
>> -
>> -SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
>> -SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8
>> d6a1b44287f1e9e595b3594df46bf7f18f9"
>> -GNOME_COMPRESS_TYPE="bz2"
>> -
>> -FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
>> -                ${base_libdir}/security/*${SOLIBSDEV} \
>> -               "
>> -
>> -FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
>> -                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
>> -                    ${libdir}/${BPN}/standalone/*.la \
>> -                    ${base_libdir}/security/*.la \
>> -                   "
>> -
>> -INSANE_SKIP_${PN}-dev += "dev-elf"
>> -
>> -FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
>> -                    ${libdir}/${BPN}/devel/.debug/ \
>> -                    ${base_libdir}/security/.debug/"
>> -
>> -PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from
>> oe-core - the recipe will be removed on 2017-09-01 unless the issue is
>> fixed"
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

