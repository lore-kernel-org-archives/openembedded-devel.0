Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFCAC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:31:39 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.3823.1720639890927424826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 12:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZpLC+tK;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48fea9d06ceso86993137.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720639890; x=1721244690; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQzDdb4tMW4F0HlEnZWBc2f9Zh0pTIGzQUt+Fmf83hg=;
        b=iZpLC+tKGV0HvnSP5sKwOim7ATsgylzH3JzIm/u9EUsoUZN+6oFRxtr9c/KSys/VBC
         22dxn3DQ2DiM+zVzOkx7R4u/oQg5oH+60CbANX+e6ZLZaWLuLJ75TaJNo5l1F+LNUDnf
         mK7T6bPTsD6gKrjMs9eLaQdD9hdlO2X2NKWUV56II+Yfppu8GsOMvIRBJpLHkhkHVpGr
         PZP9dnhqDlQ0jwK3VFytVZ+NKu7hxRSHl2f1pMgwzDfKMRMJCvz960IAjs3cUmCFNd/m
         cQdbxNJUMctL9x4gVHH8KkOpEVwvJH9UT/X0MlVBfFzi+oMwKjXn88sFG/FKc+8WjQS5
         d8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720639890; x=1721244690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQzDdb4tMW4F0HlEnZWBc2f9Zh0pTIGzQUt+Fmf83hg=;
        b=hI/UkOOI7aVeNaWtArLiRszCqv3ksZUWFVr0I1aPIpECqIJaAtujFNYrymWIotu4dw
         fIiFCgJj3eVvBOL6CJsEnKUDgqAVrX6PmRUyWmllzEZpau/GB6fz8CYWiI5blQMI4JGQ
         eK05ImNZegRmNQsceKevXPUJrjMpv/bHaWe4gV948kpb3ZUENjEaArHjWFPUSHj1tFj2
         5I2938q35N3/B9GXqhImqrKWomuxjTv7vfwbMrsInWx24/LbaW+8WHwxl4sQs3/C7ZLa
         fJ6/aLKg5y3Q6gkVfzgASIkqBGi3O6StTFauY/Yc21vgo162COsrwUxCwKIGyqM9/Uye
         +/GQ==
X-Gm-Message-State: AOJu0YyEyrlsgKNMrRYwRUfoHJHnG1/wRYep6pCes0iyy3BFx7MpaGF3
	asujougTjOZMmqHybBAT4bCr0CEDtokDz9hAcrS82cYpuRo/4b/EXVKhyA/Cano2ieuq7hxZyvP
	UKtUvGFwBnO6oryqJZFuBXjaMf18=
X-Google-Smtp-Source: AGHT+IGhMmIqDurs/0qx6gBp0DvRtQwhP65wc9WJXqIWJCYlQtQIWjN7jz2ZyBB/E2VW7A/FxlKGSAX6cwJBf1ItVd0=
X-Received: by 2002:a67:f28c:0:b0:48f:2709:2cf3 with SMTP id
 ada2fe7eead31-4910bcc04bamr857939137.6.1720639889803; Wed, 10 Jul 2024
 12:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240710182545.2312308-1-f_l_k@t-online.de>
In-Reply-To: <20240710182545.2312308-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jul 2024 12:31:02 -0700
Message-ID: <CAMKF1sopdHV_w1C-0PS07X3DvDH+e6Wy8ZZHcwbLmydqWw8V5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgee: backport patches to fix
 incompatible pointer types
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111306

On Wed, Jul 10, 2024 at 11:24=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> This imports two upstream patches that fix vala so that it
> generates correct c code
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...be8987e5eb1390b23ac531c971b202c2ef77.patch | 69 +++++++++++++++++++
>  ...6627f4fc96938b6015e05849867c472160a8.patch | 54 +++++++++++++++
>  .../recipes-devtools/libgee/libgee_0.20.6.bb  | 40 ++---------
>  3 files changed, 127 insertions(+), 36 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb=
1390b23ac531c971b202c2ef77.patch
>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96=
938b6015e05849867c472160a8.patch
>
> diff --git a/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23=
ac531c971b202c2ef77.patch b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe89=
87e5eb1390b23ac531c971b202c2ef77.patch
> new file mode 100644
> index 000000000..017df4223
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c9=
71b202c2ef77.patch
> @@ -0,0 +1,69 @@
> +From 2f0bbe8987e5eb1390b23ac531c971b202c2ef77 Mon Sep 17 00:00:00 2001
> +From: Rico Tzschichholz <ricotz@ubuntu.com>
> +Date: Thu, 13 Apr 2023 23:43:03 +0200
> +Subject: [PATCH] Implementations of "G List.get()" should use non-nullab=
le
> + return as defined
> +
> +Upstream-Status: Backport

A pointer to upstream location might be good to mention here as Backport [U=
RL]

> +---
> + gee/abstractlist.vala       | 2 +-
> + gee/concurrentlist.vala     | 2 +-
> + gee/readonlylist.vala       | 2 +-
> + gee/unrolledlinkedlist.vala | 2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/gee/abstractlist.vala b/gee/abstractlist.vala
> +index eeff984..1e55114 100644
> +--- a/gee/abstractlist.vala
> ++++ b/gee/abstractlist.vala
> +@@ -39,7 +39,7 @@ public abstract class Gee.AbstractList<G> : Gee.Abstra=
ctCollection<G>, List<G> {
> +       /**
> +        * {@inheritDoc}
> +        */
> +-      public abstract new G? get (int index);
> ++      public abstract new G get (int index);
> +
> +       /**
> +        * {@inheritDoc}
> +diff --git a/gee/concurrentlist.vala b/gee/concurrentlist.vala
> +index 6e511f1..583f827 100644
> +--- a/gee/concurrentlist.vala
> ++++ b/gee/concurrentlist.vala
> +@@ -170,7 +170,7 @@ public class Gee.ConcurrentList<G> : AbstractList<G>=
 {
> +       /**
> +        * {@inheritDoc}
> +        */
> +-      public override G? get (int index) {
> ++      public override G get (int index) {
> +               HazardPointer.Context ctx =3D new HazardPointer.Context (=
);
> +               Utils.Misc.unused (ctx);
> +               assert (index >=3D 0);
> +diff --git a/gee/readonlylist.vala b/gee/readonlylist.vala
> +index 8be3f27..c243d14 100644
> +--- a/gee/readonlylist.vala
> ++++ b/gee/readonlylist.vala
> +@@ -74,7 +74,7 @@ internal class Gee.ReadOnlyList<G> : Gee.ReadOnlyColle=
ction<G>, List<G> {
> +       /**
> +        * {@inheritDoc}
> +        */
> +-      public new G? get (int index) {
> ++      public new G get (int index) {
> +               return ((Gee.List<G>) _collection).get (index);
> +       }
> +
> +diff --git a/gee/unrolledlinkedlist.vala b/gee/unrolledlinkedlist.vala
> +index e36f88f..234d24d 100644
> +--- a/gee/unrolledlinkedlist.vala
> ++++ b/gee/unrolledlinkedlist.vala
> +@@ -158,7 +158,7 @@ public class Gee.UnrolledLinkedList<G> : AbstractBid=
irList<G>, Queue<G>, Deque<G
> +               return new Iterator<G> (this);
> +       }
> +
> +-      public override G? get (int index) {
> ++      public override G get (int index) {
> +               assert (index >=3D 0);
> +               assert (index < this._size);
> +
> +--
> +GitLab
> +
> diff --git a/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b601=
5e05849867c472160a8.patch b/meta-oe/recipes-devtools/libgee/libgee/b33a6627=
f4fc96938b6015e05849867c472160a8.patch
> new file mode 100644
> index 000000000..39d431d50
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849=
867c472160a8.patch
> @@ -0,0 +1,54 @@
> +From b33a6627f4fc96938b6015e05849867c472160a8 Mon Sep 17 00:00:00 2001
> +From: Rico Tzschichholz <ricotz@ubuntu.com>
> +Date: Sat, 8 Apr 2023 22:39:35 +0200
> +Subject: [PATCH] Add more missing generic type arguments
> +
> +Upstream-Status: Backport

same here

> +---
> + gee/hashmap.vala    | 2 +-
> + gee/hashset.vala    | 2 +-
> + gee/linkedlist.vala | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/gee/hashmap.vala b/gee/hashmap.vala
> +index a7bae9f..19e3980 100644
> +--- a/gee/hashmap.vala
> ++++ b/gee/hashmap.vala
> +@@ -253,7 +253,7 @@ public class Gee.HashMap<K,V> : Gee.AbstractMap<K,V>=
 {
> +               for (int i =3D 0; i < _array_size; i++) {
> +                       Node<K,V> node =3D (owned) _nodes[i];
> +                       while (node !=3D null) {
> +-                              Node next =3D (owned) node.next;
> ++                              Node<K,V> next =3D (owned) node.next;
> +                               node.key =3D null;
> +                               node.value =3D null;
> +                               node =3D (owned) next;
> +diff --git a/gee/hashset.vala b/gee/hashset.vala
> +index ef6d5a2..bf05519 100644
> +--- a/gee/hashset.vala
> ++++ b/gee/hashset.vala
> +@@ -210,7 +210,7 @@ public class Gee.HashSet<G> : AbstractSet<G> {
> +               for (int i =3D 0; i < _array_size; i++) {
> +                       Node<G> node =3D (owned) _nodes[i];
> +                       while (node !=3D null) {
> +-                              Node next =3D (owned) node.next;
> ++                              Node<G> next =3D (owned) node.next;
> +                               node.key =3D null;
> +                               node =3D (owned) next;
> +                       }
> +diff --git a/gee/linkedlist.vala b/gee/linkedlist.vala
> +index aff36b9..976977f 100644
> +--- a/gee/linkedlist.vala
> ++++ b/gee/linkedlist.vala
> +@@ -233,7 +233,7 @@ public class Gee.LinkedList<G> : AbstractBidirList<G=
>, Queue<G>, Deque<G> {
> +                               n.next.prev =3D n;
> +                               this._head =3D (owned)n;
> +                       } else {
> +-                              weak Node prev =3D this._head;
> ++                              weak Node<G> prev =3D this._head;
> +                               for (int i =3D 0; i < index - 1; i++) {
> +                                       prev =3D prev.next;
> +                               }
> +--
> +GitLab
> +
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.20.6.bb
> index 7e2781bcb..14e8e9908 100644
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> @@ -11,8 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
>  GNOMEBASEBUILDCLASS =3D "autotools"
>  inherit gnomebase vala gobject-introspection
>
> -CFLAGS +=3D "-Wno-incompatible-pointer-types"
> -
>  do_configure:prepend() {
>      MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
>      for i in ${MACROS}; do
> @@ -20,39 +18,9 @@ do_configure:prepend() {
>      done
>  }
>
> +SRC_URI +=3D " \
> +       file://2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch \
> +       file://b33a6627f4fc96938b6015e05849867c472160a8.patch \
> +"
>  SRC_URI[archive.sha256sum] =3D "1bf834f5e10d60cc6124d74ed3c1dd38da646787=
fbf7872220b8b4068e476d4d"
>
> -# http://errors.yoctoproject.org/Errors/Details/766884/
> -# libgee-0.20.6/gee/concurrentlist.c:1169:177: error: passing argument 4=
 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:1175:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2385:194: error: passing argument 4=
 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible poi=
nter type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2438:177: error: passing argument 4=
 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2460:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2469:177: error: passing argument 4=
 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2481:185: error: passing argument 4=
 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible poi=
nter type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2640:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2641:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2750:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winco=
mpatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:469:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:514:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:713:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:3635:185: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:4950:201: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5378:201: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5428:226: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5480:218: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5530:238: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible poin=
ter type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5532:234: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5623:246: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible poin=
ter type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5625:242: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7088:194: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible poin=
ter type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7157:177: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7184:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7198:177: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincom=
patible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7215:185: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible poin=
ter type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hashmap.c:4089:30: error: assignment to 'gboolean (*=
)(GeeMapIterator *)' {aka 'int (*)(struct _GeeMapIterator *)'} from incompa=
tible pointer type 'gboolean (*)(GeeHashMapNodeIterator *)' {aka 'int (*)(s=
truct _GeeHashMapNodeIterator *)'} [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:430:134: error: passing argument 4 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [=
-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:430:171: error: passing argument 5 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [=
-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:434:134: error: passing argument 4 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [=
-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:434:171: error: passing argument 5 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [=
-Wincompatible-pointer-types]
> -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111304): https://lists.openembedded.org/g/openembedde=
d-devel/message/111304
> Mute This Topic: https://lists.openembedded.org/mt/107148305/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

