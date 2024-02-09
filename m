Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EAAC48260
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 00:33:03 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.595.1707438774579253109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 16:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ezmOjHtb;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6e12b58a3beso157159a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 16:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707438774; x=1708043574; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpWFS3k2WQ7Go/wgiXwxQQLyDX+cVzG1FcKNXb6BZdw=;
        b=ezmOjHtbqKhhgqD48HdMuDi/Vs60GUbR6PWxVWmfMNeElP6T/M/Ad0FPjjs6uMYfkA
         VQLKwbTUqDg2wGsGkdMyNKSsyRi4fpS2A1uDzTFOGFti0H7MQ9oM6jvmog/O3ffAzBad
         z9AMEx4f/DXH8kLY0a7A78cfAdDcjc6259OI0SuHa+B65/U6qtQywE8aH+l6vci8t0f7
         FhAuWa0QWF85A7ivaaJejJ7kZ35J5dXJZDc5Ax296kNScp7ZPEfrezKCPY2EbeOpQgQq
         jcC2rKJEdzMCWlY/Tu2/PstjYUX5x1YH2s8RbV6CHy7R/ggb12bN0QumZkjElZ0dE89H
         3UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707438774; x=1708043574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpWFS3k2WQ7Go/wgiXwxQQLyDX+cVzG1FcKNXb6BZdw=;
        b=RxQ6neVfoBTPWB87F5qdJWBIku4REMWFdD/dj2iT2z/NSAbJpVCK7qum5JtM1YKxGd
         uZ6uXrIzZo+bmQdWOBicIITKPJ21gcUTO677OF/YyThHcY7UN43wFnr493kXaP9gOdze
         CeoBI5KKRIvwUXEpvuBDdfPV9dX29JMfKQXeuCvARJDV3aOnAi1BIi4E2hwlg5KgIPt7
         SRG2YVitlpHnorMtiM8IJKsn+nc+DLycZQskqOBWhGxEVjnMwDHbMSncHzOOopB1KTEJ
         SsbQ4Ppz49rsgBErnE7TtmDmG/9w0e0FC8UakKHYMqYXApN1P6NdTNjMU4iLvz7KGy03
         MZCw==
X-Forwarded-Encrypted: i=1; AJvYcCXN6d/KV5b+EERXm94PBge6jClgYeAKAoQzGgIzol0YDBSigN8axJrddRw5J/6mPMcDXkXmuk7Gsh8pHi32nInk6NkGfHdFPk1Dz/KOgji8ludj0RMB+jyKjw==
X-Gm-Message-State: AOJu0Yxt/9XwzOraJkoNqjfZ+oNVXbwJ24KuKcxX9cOQn0X7zdxB0Vib
	CEDXAr+bp9mQsqIx7zfSDWN3FdtupDufv0ga6MmMEECNFiil1AERQ1x+QwXy7oT+XtedH5+WHF6
	lANZR5D/+EhgPQ/TE/gyx8c3KCXc=
X-Google-Smtp-Source: AGHT+IEvUk+GaYf9rM4b9mlbaRpT20UrROa92tzhcHlGg/NMxad6W8/3rQ0oNp9x2SEdTMXxGwQc9gD38/oJgItLddE=
X-Received: by 2002:a05:6870:2248:b0:219:30b9:fc22 with SMTP id
 j8-20020a056870224800b0021930b9fc22mr66686oaf.25.1707438773640; Thu, 08 Feb
 2024 16:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20240208234026.3515183-1-martin.jansa@gmail.com>
In-Reply-To: <20240208234026.3515183-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Feb 2024 16:32:42 -0800
Message-ID: <CAMKF1srQJhHwbE6moSNH2_86Q+onLD8TwT55RhUdj=EunxxKJA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] xfstests: fix make install race condition
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Vyacheslav.Yurkov@bruker.com, openembedded-devel@lists.openembedded.org, 
	uvv.mail@gmail.com, wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="00000000000094271d0610e811ea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 00:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108675

--00000000000094271d0610e811ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for fixing this. It has been hitting my CI often enough but still
intermittently, these kind of issues are hard to deal with so extra kudos !

On Thu, Feb 8, 2024 at 3:40=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> * sometimes make install was failing with:
>   cp: cannot stat 'group.list': No such file or directory
>   and bunch of non-fatal messages:
>   mv: failed to preserve ownership for 'group.list': Invalid argument
>
> * this was when tools/mkgroupfile did
>   mv -f "$new_groups" "$groupfile"
>   overwritting the group.list file while install-sh was already
>   copying it to output
>
> * in the end easily reproducible by
>   1) removing tests/*/group.list before each make install
>   2) adding some sleep in mkgroupfile before the mv call
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...ake-sure-group.list-DIRT-exists-befo.patch | 239 ++++++++++++++++++
>  .../xfstests/xfstests_2024.01.14.bb           |  10 +-
>  2 files changed, 242 insertions(+), 7 deletions(-)
>  create mode 100644
> meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make=
-sure-group.list-DIRT-exists-befo.patch
>
> diff --git
> a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-ma=
ke-sure-group.list-DIRT-exists-befo.patch
> b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-ma=
ke-sure-group.list-DIRT-exists-befo.patch
> new file mode 100644
> index 0000000000..5e8bf0c606
> --- /dev/null
> +++
> b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-ma=
ke-sure-group.list-DIRT-exists-befo.patch
> @@ -0,0 +1,239 @@
> +From b30d5690d7245aa8bd5ca2896e629e62ec97afda Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@gmail.com>
> +Date: Thu, 8 Feb 2024 23:01:36 +0100
> +Subject: [PATCH] tests/*/Makefile: make sure group.list DIRT exists befo=
re
> + install
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* sometimes make install was failing with:
> +  cp: cannot stat 'group.list': No such file or directory
> +  and bunch of non-fatal messages:
> +  mv: failed to preserve ownership for 'group.list': Invalid argument
> +
> +* this was when tools/mkgroupfile did
> +  mv -f "$new_groups" "$groupfile"
> +  overwritting the group.list file while install-sh was already
> +  copying it to output
> +
> +* in the end easily reproducible by
> +  1) removing tests/*/group.list before each make install
> +  2) adding some sleep in mkgroupfile before the mv call
> +
> +Upstream-Status: Submitted [
> https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jansa@gmai=
l.com/
> ]
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + tests/btrfs/Makefile    | 2 +-
> + tests/ceph/Makefile     | 2 +-
> + tests/cifs/Makefile     | 2 +-
> + tests/ext4/Makefile     | 2 +-
> + tests/f2fs/Makefile     | 2 +-
> + tests/generic/Makefile  | 2 +-
> + tests/nfs/Makefile      | 2 +-
> + tests/ocfs2/Makefile    | 2 +-
> + tests/overlay/Makefile  | 2 +-
> + tests/perf/Makefile     | 2 +-
> + tests/selftest/Makefile | 2 +-
> + tests/shared/Makefile   | 2 +-
> + tests/tmpfs/Makefile    | 2 +-
> + tests/udf/Makefile      | 2 +-
> + tests/xfs/Makefile      | 2 +-
> + 15 files changed, 15 insertions(+), 15 deletions(-)
> +
> +diff --git a/tests/btrfs/Makefile b/tests/btrfs/Makefile
> +index 1b72a1a1..6d9995b4 100644
> +--- a/tests/btrfs/Makefile
> ++++ b/tests/btrfs/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/ceph/Makefile b/tests/ceph/Makefile
> +index 2761e1e9..5f24d518 100644
> +--- a/tests/ceph/Makefile
> ++++ b/tests/ceph/Makefile
> +@@ -12,7 +12,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/cifs/Makefile b/tests/cifs/Makefile
> +index 62c48935..0b89a01d 100644
> +--- a/tests/cifs/Makefile
> ++++ b/tests/cifs/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/ext4/Makefile b/tests/ext4/Makefile
> +index a2a0d561..296e3850 100644
> +--- a/tests/ext4/Makefile
> ++++ b/tests/ext4/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/f2fs/Makefile b/tests/f2fs/Makefile
> +index 9d1ed3c6..0a90b465 100644
> +--- a/tests/f2fs/Makefile
> ++++ b/tests/f2fs/Makefile
> +@@ -15,7 +15,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/generic/Makefile b/tests/generic/Makefile
> +index b464b22b..d6ed3e55 100644
> +--- a/tests/generic/Makefile
> ++++ b/tests/generic/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/nfs/Makefile b/tests/nfs/Makefile
> +index 128d2a3a..51590b5c 100644
> +--- a/tests/nfs/Makefile
> ++++ b/tests/nfs/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/ocfs2/Makefile b/tests/ocfs2/Makefile
> +index 260ad31b..17e01bf3 100644
> +--- a/tests/ocfs2/Makefile
> ++++ b/tests/ocfs2/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/overlay/Makefile b/tests/overlay/Makefile
> +index 2785b94d..c71e78d6 100644
> +--- a/tests/overlay/Makefile
> ++++ b/tests/overlay/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/perf/Makefile b/tests/perf/Makefile
> +index 0c74ba39..d72c04d9 100644
> +--- a/tests/perf/Makefile
> ++++ b/tests/perf/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/selftest/Makefile b/tests/selftest/Makefile
> +index 3ddfca37..cabc35a9 100644
> +--- a/tests/selftest/Makefile
> ++++ b/tests/selftest/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/shared/Makefile b/tests/shared/Makefile
> +index f3128714..2e6aa718 100644
> +--- a/tests/shared/Makefile
> ++++ b/tests/shared/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/tmpfs/Makefile b/tests/tmpfs/Makefile
> +index 46544313..46b62dad 100644
> +--- a/tests/tmpfs/Makefile
> ++++ b/tests/tmpfs/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/udf/Makefile b/tests/udf/Makefile
> +index ed4434f0..feda69a6 100644
> +--- a/tests/udf/Makefile
> ++++ b/tests/udf/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> +diff --git a/tests/xfs/Makefile b/tests/xfs/Makefile
> +index 5f413e67..6bfafdb1 100644
> +--- a/tests/xfs/Makefile
> ++++ b/tests/xfs/Makefile
> +@@ -14,7 +14,7 @@ default: $(DIRT)
> +
> + include $(BUILDRULES)
> +
> +-install:
> ++install: default
> +       $(INSTALL) -m 755 -d $(TARGET_DIR)
> +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
> +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
> diff --git a/meta-filesystems/recipes-utils/xfstests/
> xfstests_2024.01.14.bb b/meta-filesystems/recipes-utils/xfstests/
> xfstests_2024.01.14.bb
> index 711637a70d..5ff1914569 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
> @@ -7,8 +7,9 @@ SRCREV_FORMAT =3D "xfstests_unionmount"
>
>  SRC_URI =3D "git://
> git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=3Dmaster;name=3Dxfs=
tests
> \
>             git://
> github.com/amir73il/unionmount-testsuite.git;branch=3Dmaster;protocol=3Dh=
ttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite
> \
> -
>  file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
>
> file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
> +
>  file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
> +
>  file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch \
>             "
>
>  SRCREV_xfstests =3D "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
> @@ -51,12 +52,7 @@ do_configure:prepend() {
>      cp -a ${S}/include/install-sh .
>  }
>
> -# Not sure if this is needed, but with old install-sh it was sometimes
> failing with:
> -# cp: cannot stat 'group.list': No such file or directory
> -# http://errors.yoctoproject.org/Errors/Details/752404/
> -# PARALLEL_MAKEINST =3D "-j1"
> -
> -do_install:prepend() {
> +do_install() {
>      # otherwise install-sh duplicates DESTDIR prefix
>      export DIST_ROOT=3D"/" DIST_MANIFEST=3D"" DESTDIR=3D"${D}"
>      oe_runmake install
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108674):
> https://lists.openembedded.org/g/openembedded-devel/message/108674
> Mute This Topic: https://lists.openembedded.org/mt/104250063/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000094271d0610e811ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for fixing this. It has been hitting my CI often e=
nough but still intermittently, these kind of issues are hard to deal with =
so extra kudos !</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 8, 2024 at 3:40=E2=80=AFPM Martin Jansa &l=
t;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">* sometimes make install was=
 failing with:<br>
=C2=A0 cp: cannot stat &#39;group.list&#39;: No such file or directory<br>
=C2=A0 and bunch of non-fatal messages:<br>
=C2=A0 mv: failed to preserve ownership for &#39;group.list&#39;: Invalid a=
rgument<br>
<br>
* this was when tools/mkgroupfile did<br>
=C2=A0 mv -f &quot;$new_groups&quot; &quot;$groupfile&quot;<br>
=C2=A0 overwritting the group.list file while install-sh was already<br>
=C2=A0 copying it to output<br>
<br>
* in the end easily reproducible by<br>
=C2=A0 1) removing tests/*/group.list before each make install<br>
=C2=A0 2) adding some sleep in mkgroupfile before the mv call<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ake-sure-group.list-DIRT-exists-befo.patch | 239 +++++++++++++++++=
+<br>
=C2=A0.../xfstests/<a href=3D"http://xfstests_2024.01.14.bb" rel=3D"norefer=
rer" target=3D"_blank">xfstests_2024.01.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A02 files changed, 242 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0=
003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch<br>
<br>
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Ma=
kefile-make-sure-group.list-DIRT-exists-befo.patch b/meta-filesystems/recip=
es-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-ex=
ists-befo.patch<br>
new file mode 100644<br>
index 0000000000..5e8bf0c606<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-=
make-sure-group.list-DIRT-exists-befo.patch<br>
@@ -0,0 +1,239 @@<br>
+From b30d5690d7245aa8bd5ca2896e629e62ec97afda Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D=
"_blank">martin.jansa@gmail.com</a>&gt;<br>
+Date: Thu, 8 Feb 2024 23:01:36 +0100<br>
+Subject: [PATCH] tests/*/Makefile: make sure group.list DIRT exists before=
<br>
+ install<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* sometimes make install was failing with:<br>
+=C2=A0 cp: cannot stat &#39;group.list&#39;: No such file or directory<br>
+=C2=A0 and bunch of non-fatal messages:<br>
+=C2=A0 mv: failed to preserve ownership for &#39;group.list&#39;: Invalid =
argument<br>
+<br>
+* this was when tools/mkgroupfile did<br>
+=C2=A0 mv -f &quot;$new_groups&quot; &quot;$groupfile&quot;<br>
+=C2=A0 overwritting the group.list file while install-sh was already<br>
+=C2=A0 copying it to output<br>
+<br>
+* in the end easily reproducible by<br>
+=C2=A0 1) removing tests/*/group.list before each make install<br>
+=C2=A0 2) adding some sleep in mkgroupfile before the mv call<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://lore.kernel.org/fstests/202=
40208225241.644701-1-martin.jansa@gmail.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jans=
a@gmail.com/</a>]<br>
+<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
+---<br>
+ tests/btrfs/Makefile=C2=A0 =C2=A0 | 2 +-<br>
+ tests/ceph/Makefile=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ tests/cifs/Makefile=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ tests/ext4/Makefile=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ tests/f2fs/Makefile=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ tests/generic/Makefile=C2=A0 | 2 +-<br>
+ tests/nfs/Makefile=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tests/ocfs2/Makefile=C2=A0 =C2=A0 | 2 +-<br>
+ tests/overlay/Makefile=C2=A0 | 2 +-<br>
+ tests/perf/Makefile=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ tests/selftest/Makefile | 2 +-<br>
+ tests/shared/Makefile=C2=A0 =C2=A0| 2 +-<br>
+ tests/tmpfs/Makefile=C2=A0 =C2=A0 | 2 +-<br>
+ tests/udf/Makefile=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tests/xfs/Makefile=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 15 files changed, 15 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/tests/btrfs/Makefile b/tests/btrfs/Makefile<br>
+index 1b72a1a1..6d9995b4 100644<br>
+--- a/tests/btrfs/Makefile<br>
++++ b/tests/btrfs/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/ceph/Makefile b/tests/ceph/Makefile<br>
+index 2761e1e9..5f24d518 100644<br>
+--- a/tests/ceph/Makefile<br>
++++ b/tests/ceph/Makefile<br>
+@@ -12,7 +12,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/cifs/Makefile b/tests/cifs/Makefile<br>
+index 62c48935..0b89a01d 100644<br>
+--- a/tests/cifs/Makefile<br>
++++ b/tests/cifs/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/ext4/Makefile b/tests/ext4/Makefile<br>
+index a2a0d561..296e3850 100644<br>
+--- a/tests/ext4/Makefile<br>
++++ b/tests/ext4/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/f2fs/Makefile b/tests/f2fs/Makefile<br>
+index 9d1ed3c6..0a90b465 100644<br>
+--- a/tests/f2fs/Makefile<br>
++++ b/tests/f2fs/Makefile<br>
+@@ -15,7 +15,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/generic/Makefile b/tests/generic/Makefile<br>
+index b464b22b..d6ed3e55 100644<br>
+--- a/tests/generic/Makefile<br>
++++ b/tests/generic/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/nfs/Makefile b/tests/nfs/Makefile<br>
+index 128d2a3a..51590b5c 100644<br>
+--- a/tests/nfs/Makefile<br>
++++ b/tests/nfs/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/ocfs2/Makefile b/tests/ocfs2/Makefile<br>
+index 260ad31b..17e01bf3 100644<br>
+--- a/tests/ocfs2/Makefile<br>
++++ b/tests/ocfs2/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/overlay/Makefile b/tests/overlay/Makefile<br>
+index 2785b94d..c71e78d6 100644<br>
+--- a/tests/overlay/Makefile<br>
++++ b/tests/overlay/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/perf/Makefile b/tests/perf/Makefile<br>
+index 0c74ba39..d72c04d9 100644<br>
+--- a/tests/perf/Makefile<br>
++++ b/tests/perf/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/selftest/Makefile b/tests/selftest/Makefile<br>
+index 3ddfca37..cabc35a9 100644<br>
+--- a/tests/selftest/Makefile<br>
++++ b/tests/selftest/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/shared/Makefile b/tests/shared/Makefile<br>
+index f3128714..2e6aa718 100644<br>
+--- a/tests/shared/Makefile<br>
++++ b/tests/shared/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/tmpfs/Makefile b/tests/tmpfs/Makefile<br>
+index 46544313..46b62dad 100644<br>
+--- a/tests/tmpfs/Makefile<br>
++++ b/tests/tmpfs/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/udf/Makefile b/tests/udf/Makefile<br>
+index ed4434f0..feda69a6 100644<br>
+--- a/tests/udf/Makefile<br>
++++ b/tests/udf/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
+diff --git a/tests/xfs/Makefile b/tests/xfs/Makefile<br>
+index 5f413e67..6bfafdb1 100644<br>
+--- a/tests/xfs/Makefile<br>
++++ b/tests/xfs/Makefile<br>
+@@ -14,7 +14,7 @@ default: $(DIRT)<br>
+ <br>
+ include $(BUILDRULES)<br>
+ <br>
+-install:<br>
++install: default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 -d $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
diff --git a/meta-filesystems/recipes-utils/xfstests/<a href=3D"http://xfst=
ests_2024.01.14.bb" rel=3D"noreferrer" target=3D"_blank">xfstests_2024.01.1=
4.bb</a> b/meta-filesystems/recipes-utils/xfstests/<a href=3D"http://xfstes=
ts_2024.01.14.bb" rel=3D"noreferrer" target=3D"_blank">xfstests_2024.01.14.=
bb</a><br>
index 711637a70d..5ff1914569 100644<br>
--- a/meta-filesystems/recipes-utils/xfstests/<a href=3D"http://xfstests_20=
24.01.14.bb" rel=3D"noreferrer" target=3D"_blank">xfstests_2024.01.14.bb</a=
><br>
+++ b/meta-filesystems/recipes-utils/xfstests/<a href=3D"http://xfstests_20=
24.01.14.bb" rel=3D"noreferrer" target=3D"_blank">xfstests_2024.01.14.bb</a=
><br>
@@ -7,8 +7,9 @@ SRCREV_FORMAT =3D &quot;xfstests_unionmount&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/fs/x=
fs/xfstests-dev.git;branch=3Dmaster;name=3Dxfstests" rel=3D"noreferrer" tar=
get=3D"_blank">git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=3Dmast=
er;name=3Dxfstests</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/amir73il/unionmount-testsuite.git;branch=3Dmaster;protocol=3Dhttps;name=
=3Dunionmount;destsuffix=3Dunionmount-testsuite" rel=3D"noreferrer" target=
=3D"_blank">github.com/amir73il/unionmount-testsuite.git;branch=3Dmaster;pr=
otocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite</a> \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Drop-detached_mounts_=
propagation-and-remove-sys-moun.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-missing-FTW_-macr=
os-when-not-available-in-libc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Drop-detached_mounts_=
propagation-and-remove-sys-moun.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-Makefile-make-s=
ure-group.list-DIRT-exists-befo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRCREV_xfstests =3D &quot;c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70&qu=
ot;<br>
@@ -51,12 +52,7 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0cp -a ${S}/include/install-sh .<br>
=C2=A0}<br>
<br>
-# Not sure if this is needed, but with old install-sh it was sometimes fai=
ling with:<br>
-# cp: cannot stat &#39;group.list&#39;: No such file or directory<br>
-# <a href=3D"http://errors.yoctoproject.org/Errors/Details/752404/" rel=3D=
"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Detail=
s/752404/</a><br>
-# PARALLEL_MAKEINST =3D &quot;-j1&quot;<br>
-<br>
-do_install:prepend() {<br>
+do_install() {<br>
=C2=A0 =C2=A0 =C2=A0# otherwise install-sh duplicates DESTDIR prefix<br>
=C2=A0 =C2=A0 =C2=A0export DIST_ROOT=3D&quot;/&quot; DIST_MANIFEST=3D&quot;=
&quot; DESTDIR=3D&quot;${D}&quot;<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake install<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108674): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108674" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108674</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104250063/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104250063/1997914</a><br>
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

--00000000000094271d0610e811ea--

