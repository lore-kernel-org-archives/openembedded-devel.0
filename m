Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B23C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 12:11:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.48320.1744632710928711562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 05:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vp9IEORx;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so45476595e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744632709; x=1745237509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHHMEK9VBQfS4GqLqK+oFIfuaEPODtvZl0NAJBgTdhw=;
        b=Vp9IEORx7EgjbZXodZKTtxDzY0Vzp30UDa+4nhZMyIqxKeE735ZPw5xyNlikkMQ77t
         OOOReJmNGsEmDQGle0a5RakVKdxzSU6U4I1rBbmPNaHYdvvbrmx0ytneXfrgShM6+J4z
         sBYKabYthpktOvIP+c4cfFmCZU08unE3htyd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632709; x=1745237509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHHMEK9VBQfS4GqLqK+oFIfuaEPODtvZl0NAJBgTdhw=;
        b=l2smRTFOqabpRFEI2AWhitFP1mjQHr7O2mfYOqCBTbZpj0JVTFQIzXEHYlgNoGdBcQ
         HbV4FpodRnunOGENCHtN1cxBK0Zd6P8DZLNngHIEyujZeJ9cfNEGEG9lYQtSO3jCmq/I
         7jt9MFkQfEZ00aDRfvbExg9U55yELPQ9OVEcXw+45wRKyUqzIRJq1+2cMRvoYFaV0pBb
         wkDZJouEs3LhyVEMF0H+VNKWIfEBlHGjf3a6Fwhxn6yFXihsShfIz3p6/G1X1syL9nSL
         oJh5HHGwPBS/tY7tYRmCc2rEtpXkFHhzxMuN/VBI92mGyE0lIXggC0j7Er4zQz35cs5p
         AzSA==
X-Gm-Message-State: AOJu0Yx/RxkIl+IvDq7HsM4FQNmaKKUuF4+eZopzOLKe2LD0fE8xLLCk
	ypj1CC02c8nYkWcAo5sgUwQh79pgUJ2AvzLIZOitXyKKzUJ+TkeFVyWFEU2iRJhSwJOyXRqC89o
	5Z3nNQGS/XCT9nzV7c/HZ+f3tN+CpWFwP2EBHHQ==
X-Gm-Gg: ASbGnctjyoM7o5Gxx1h1zq111X3Xjcb7vSmvIRLY55NHeAN8KhbVMglkytkUbQ3OdvO
	K2xDPh1mn0pEhxlAqR0MTxnlKZLvOCEtMlt6lKOzPnAL3NDGPsIiv5ppft6aTx045V0ttoEmDDp
	i7I36ElawJOUQGp+ONrTghk1l6
X-Google-Smtp-Source: AGHT+IEoQ1XUHe0ehldNkxdwYuh0jg98PU0wB4p+8yRGsFRB+ePsgGtR15iMWDEeCqo8LCT+DwpniiPxw46UZcGgEzo=
X-Received: by 2002:a05:6000:18ac:b0:39a:e71d:ee34 with SMTP id
 ffacd0b85a97d-39eaaed21c8mr8099836f8f.37.1744632708994; Mon, 14 Apr 2025
 05:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250414115836.13712-1-kelefa.sane@smile.fr>
In-Reply-To: <20250414115836.13712-1-kelefa.sane@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 14 Apr 2025 14:11:23 +0200
X-Gm-Features: ATxdqUEtXmKjWn80Z16mUaLP81uM0oClDpXrARmPhmer02azXYwQ_rB4-S78JvU
Message-ID: <CAMSfU+6Fyw+5AGbTeyAopOtCFz4e51V3XDbTTFuNCbnU4wadGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] multipath-tool: Fix reproducibility issue
 on libdmmp docs/man pages
To: kelefa.sane@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 12:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116852

Le lun. 14 avr. 2025 =C3=A0 13:58, kelefa.sane via lists.openembedded.org
<kelefa.sane=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :
>
> From: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
>
> Reproducibility test reveal different timestamp values in docs/man
> pages. The root cause is due to the makefile target rule which update
> the timestamp not always beeing executed, depending on the order, the
> target (dmmp_strerror.3) and prerequisite (libdmmp.h) are written on the
> disk during the clone of the repo.
>
> Update recipe to set the KBUILD_BUILD_TIMESTAMP to reproducible
> timestamp (SOURCE_DATE_EPOCH).
>
> Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> ---
>  ...ile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch | 29 +++++++++++++
>  ...-Add-target-docs-man-dmmp_strerror.3.patch | 41 +++++++++++++++++++
>  .../multipath-tools/multipath-tools_0.11.1.bb |  3 ++
>  3 files changed, 73 insertions(+)
>  create mode 100644 meta-oe/recipes-support/multipath-tools/files/0013-li=
bdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
>  create mode 100644 meta-oe/recipes-support/multipath-tools/files/0014-li=
bdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
>
> diff --git a/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-M=
akefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch b/meta-oe/recipes-support/mu=
ltipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.=
patch
> new file mode 100644
> index 000000000..4cca7decb
> --- /dev/null
> +++ b/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile=
-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
> @@ -0,0 +1,29 @@
> +From bcb052a8dadbd0a837986b1e15924b469fc59edc Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D <kelefa=
.sane@smile.fr>
> +Date: Thu, 3 Apr 2025 10:08:49 +0200
> +Subject: [PATCH] libdmmp/Makefile: Fix KBUILD_BUILD_TIMESTAMP usage
> +
> +Add missing $ (Makefile need to escape '$' as '$$')
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/dm-devel/20250404122=
902.2750036-1-sofiane.hamam@smile.fr/]
> +
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> +Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
> +---
> + libdmmp/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libdmmp/Makefile b/libdmmp/Makefile
> +index 172ba045..7e0e2509 100644
> +--- a/libdmmp/Makefile
> ++++ b/libdmmp/Makefile
> +@@ -74,7 +74,7 @@ doc: docs/man/dmmp_strerror.3
> + docs/man/dmmp_strerror.3:     $(HEADERS)
> +       $(Q)TEMPFILE=3D$(shell mktemp); \
> +       cat $^ | perl docs/doc-preclean.pl >$$TEMPFILE; \
> +-      [ "$KBUILD_BUILD_TIMESTAMP" ] || \
> ++      [ "$$KBUILD_BUILD_TIMESTAMP" ] || \
> +           KBUILD_BUILD_TIMESTAMP=3D`git log -n1 --pretty=3D%cd --date=
=3Diso -- $^`; \
> +       export KBUILD_BUILD_TIMESTAMP; \
> +       LC_ALL=3DC \
> diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-M=
akefile-Add-target-docs-man-dmmp_strerror.3.patch b/meta-oe/recipes-support=
/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strer=
ror.3.patch
> new file mode 100644
> index 000000000..aad46c229
> --- /dev/null
> +++ b/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile=
-Add-target-docs-man-dmmp_strerror.3.patch
> @@ -0,0 +1,41 @@
> +From 6e231d887c20b2139db75e6dc6c20107273aaacd Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D <kelefa=
.sane@smile.fr>
> +Date: Thu, 3 Apr 2025 10:25:30 +0200
> +Subject: [PATCH] libdmmp/Makefile: Add target docs/man/dmmp_strerror.3 t=
o
> + .PHONY list
> +
> +When cloning git repos, depending on the order of written to the disk, t=
arget
> +docs/man/dmmp_strerror.3 is more recent that the prerequisite
> +libdmmp/libdmmp.h this leads to a non reproducible behavior:
> +Sometimes, the timestamps are updated in the man pages, sometimes not.
> +
> +Upstream-Status: Denied
> +
> +https://lore.kernel.org/dm-devel/72355f1d0984647e91f8c50f1c2295071af49e3=
3.camel@suse.com/
> +The patch has been rejected by upstream, who will update the timestamps =
of the
> +manpages with a new commit.
> +In order to be reproducible without having a random result, forcing the =
target
> +rebuild by adding it to .PHONY is the more acceptable solution, the alte=
rnative
> +would have been to use the make -B option which consider all target has
> +obsolete and rebuild them all, which is less efficient.
> +
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> +Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
> +---
> + libdmmp/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libdmmp/Makefile b/libdmmp/Makefile
> +index 7e0e2509..187bcb8c 100644
> +--- a/libdmmp/Makefile
> ++++ b/libdmmp/Makefile
> +@@ -20,7 +20,7 @@ CFLAGS +=3D $(LIB_CFLAGS) -fvisibility=3Dhidden
> + LIBDEPS +=3D $(shell $(PKG_CONFIG) --libs json-c) -L$(mpathcmddir) -lmp=
athcmd -lpthread
> +
> + all: $(LIBS) doc
> +-.PHONY:       doc clean install uninstall check speed_test dep_clean
> ++.PHONY:       doc clean install uninstall check speed_test dep_clean do=
cs/man/dmmp_strerror.3
> +
> + $(LIBS): $(OBJS)
> +       $(Q)$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=3D$@ -o $@ $(OBJ=
S) $(LIBDEPS)
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11=
.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> index 3037d0da8..3443175d2 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> @@ -45,6 +45,8 @@ SRC_URI =3D "git://github.com/opensvc/multipath-tools.g=
it;protocol=3Dhttps;branch=3Dst
>             file://0011-fix-bug-of-do_compile-and-do_install.patch \
>             file://0012-add-explicit-dependency-on-libraries.patch \
>             file://0001-libmpathutils-uxsock.c-Include-string.h-for-memcp=
y.patch \
> +           file://0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage=
.patch \
> +           file://0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerro=
r.3.patch \
>             "
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ec28527f3d544b51ceb0e1907d0b=
f3f"
> @@ -83,6 +85,7 @@ EXTRA_OEMAKE =3D 'MULTIPATH_VERSION=3D${PV} DESTDIR=3D$=
{D} syslibdir=3D${base_libdir} \
>                  modulesloaddir=3D${sysconfdir}/modules-load.d \
>                  tmpfilesdir=3D${sysconfdir}/tmpfiles.d \
>                  ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYST=
EMD=3D216", "", d)} \
> +                KBUILD_BUILD_TIMESTAMP=3D"$(date -u -d "@$SOURCE_DATE_EP=
OCH" +"%Y-%m-%d %H:%M:%S +0000")" \
>                 '
>
>  do_install() {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116851): https://lists.openembedded.org/g/openembedde=
d-devel/message/116851
> Mute This Topic: https://lists.openembedded.org/mt/112255387/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

