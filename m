Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A866DC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 22:36:30 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.7965.1720650981298052250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 15:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout08.t-online.de (Postfix) with SMTP id 4BFBC17D53
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 00:35:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.88]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sRfu8-0oliqH0; Thu, 11 Jul 2024 00:35:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libgee: backport patches to fix incompatible pointer types
Date: Thu, 11 Jul 2024 00:36:25 +0200
Message-ID: <20240710223625.2670-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1720650917-63FFD3C7-819A0531/0/0 CLEAN NORMAL
X-TOI-MSGID: ccca2cc0-c910-4fa3-8d50-60d8945002cb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 22:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111309

This imports two upstream patches that fix vala so that it
generates correct c code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...be8987e5eb1390b23ac531c971b202c2ef77.patch | 69 +++++++++++++++++++
 ...6627f4fc96938b6015e05849867c472160a8.patch | 54 +++++++++++++++
 .../recipes-devtools/libgee/libgee_0.20.6.bb  | 40 ++---------
 3 files changed, 127 insertions(+), 36 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb=
1390b23ac531c971b202c2ef77.patch
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96=
938b6015e05849867c472160a8.patch

diff --git a/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23=
ac531c971b202c2ef77.patch b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe=
8987e5eb1390b23ac531c971b202c2ef77.patch
new file mode 100644
index 000000000..a506391d1
--- /dev/null
+++ b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c9=
71b202c2ef77.patch
@@ -0,0 +1,69 @@
+From 2f0bbe8987e5eb1390b23ac531c971b202c2ef77 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Thu, 13 Apr 2023 23:43:03 +0200
+Subject: [PATCH] Implementations of "G List.get()" should use non-nullab=
le
+ return as defined
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgee/-/commi=
t/2f0bbe8987e5eb1390b23ac531c971b202c2ef77]
+---
+ gee/abstractlist.vala       | 2 +-
+ gee/concurrentlist.vala     | 2 +-
+ gee/readonlylist.vala       | 2 +-
+ gee/unrolledlinkedlist.vala | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gee/abstractlist.vala b/gee/abstractlist.vala
+index eeff984..1e55114 100644
+--- a/gee/abstractlist.vala
++++ b/gee/abstractlist.vala
+@@ -39,7 +39,7 @@ public abstract class Gee.AbstractList<G> : Gee.Abstra=
ctCollection<G>, List<G> {
+ 	/**
+ 	 * {@inheritDoc}
+ 	 */
+-	public abstract new G? get (int index);
++	public abstract new G get (int index);
+=20
+ 	/**
+ 	 * {@inheritDoc}
+diff --git a/gee/concurrentlist.vala b/gee/concurrentlist.vala
+index 6e511f1..583f827 100644
+--- a/gee/concurrentlist.vala
++++ b/gee/concurrentlist.vala
+@@ -170,7 +170,7 @@ public class Gee.ConcurrentList<G> : AbstractList<G>=
 {
+ 	/**
+ 	 * {@inheritDoc}
+ 	 */
+-	public override G? get (int index) {
++	public override G get (int index) {
+ 		HazardPointer.Context ctx =3D new HazardPointer.Context ();
+ 		Utils.Misc.unused (ctx);
+ 		assert (index >=3D 0);
+diff --git a/gee/readonlylist.vala b/gee/readonlylist.vala
+index 8be3f27..c243d14 100644
+--- a/gee/readonlylist.vala
++++ b/gee/readonlylist.vala
+@@ -74,7 +74,7 @@ internal class Gee.ReadOnlyList<G> : Gee.ReadOnlyColle=
ction<G>, List<G> {
+ 	/**
+ 	 * {@inheritDoc}
+ 	 */
+-	public new G? get (int index) {
++	public new G get (int index) {
+ 		return ((Gee.List<G>) _collection).get (index);
+ 	}
+=20
+diff --git a/gee/unrolledlinkedlist.vala b/gee/unrolledlinkedlist.vala
+index e36f88f..234d24d 100644
+--- a/gee/unrolledlinkedlist.vala
++++ b/gee/unrolledlinkedlist.vala
+@@ -158,7 +158,7 @@ public class Gee.UnrolledLinkedList<G> : AbstractBid=
irList<G>, Queue<G>, Deque<G
+ 		return new Iterator<G> (this);
+ 	}
+=20
+-	public override G? get (int index) {
++	public override G get (int index) {
+ 		assert (index >=3D 0);
+ 		assert (index < this._size);
+=20
+--=20
+GitLab
+
diff --git a/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b601=
5e05849867c472160a8.patch b/meta-oe/recipes-devtools/libgee/libgee/b33a66=
27f4fc96938b6015e05849867c472160a8.patch
new file mode 100644
index 000000000..6b65ebd1c
--- /dev/null
+++ b/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849=
867c472160a8.patch
@@ -0,0 +1,54 @@
+From b33a6627f4fc96938b6015e05849867c472160a8 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Sat, 8 Apr 2023 22:39:35 +0200
+Subject: [PATCH] Add more missing generic type arguments
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgee/-/commi=
t/b33a6627f4fc96938b6015e05849867c472160a8]
+---
+ gee/hashmap.vala    | 2 +-
+ gee/hashset.vala    | 2 +-
+ gee/linkedlist.vala | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gee/hashmap.vala b/gee/hashmap.vala
+index a7bae9f..19e3980 100644
+--- a/gee/hashmap.vala
++++ b/gee/hashmap.vala
+@@ -253,7 +253,7 @@ public class Gee.HashMap<K,V> : Gee.AbstractMap<K,V>=
 {
+ 		for (int i =3D 0; i < _array_size; i++) {
+ 			Node<K,V> node =3D (owned) _nodes[i];
+ 			while (node !=3D null) {
+-				Node next =3D (owned) node.next;
++				Node<K,V> next =3D (owned) node.next;
+ 				node.key =3D null;
+ 				node.value =3D null;
+ 				node =3D (owned) next;
+diff --git a/gee/hashset.vala b/gee/hashset.vala
+index ef6d5a2..bf05519 100644
+--- a/gee/hashset.vala
++++ b/gee/hashset.vala
+@@ -210,7 +210,7 @@ public class Gee.HashSet<G> : AbstractSet<G> {
+ 		for (int i =3D 0; i < _array_size; i++) {
+ 			Node<G> node =3D (owned) _nodes[i];
+ 			while (node !=3D null) {
+-				Node next =3D (owned) node.next;
++				Node<G> next =3D (owned) node.next;
+ 				node.key =3D null;
+ 				node =3D (owned) next;
+ 			}
+diff --git a/gee/linkedlist.vala b/gee/linkedlist.vala
+index aff36b9..976977f 100644
+--- a/gee/linkedlist.vala
++++ b/gee/linkedlist.vala
+@@ -233,7 +233,7 @@ public class Gee.LinkedList<G> : AbstractBidirList<G=
>, Queue<G>, Deque<G> {
+ 				n.next.prev =3D n;
+ 				this._head =3D (owned)n;
+ 			} else {
+-				weak Node prev =3D this._head;
++				weak Node<G> prev =3D this._head;
+ 				for (int i =3D 0; i < index - 1; i++) {
+ 					prev =3D prev.next;
+ 				}
+--=20
+GitLab
+
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.20.6.bb
index 7e2781bcb..14e8e9908 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase vala gobject-introspection
=20
-CFLAGS +=3D "-Wno-incompatible-pointer-types"
-
 do_configure:prepend() {
     MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
     for i in ${MACROS}; do
@@ -20,39 +18,9 @@ do_configure:prepend() {
     done
 }
=20
+SRC_URI +=3D " \
+	file://2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch \
+	file://b33a6627f4fc96938b6015e05849867c472160a8.patch \
+"
 SRC_URI[archive.sha256sum] =3D "1bf834f5e10d60cc6124d74ed3c1dd38da646787=
fbf7872220b8b4068e476d4d"
=20
-# http://errors.yoctoproject.org/Errors/Details/766884/
-# libgee-0.20.6/gee/concurrentlist.c:1169:177: error: passing argument 4=
 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:1175:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2385:194: error: passing argument 4=
 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible p=
ointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2438:177: error: passing argument 4=
 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2460:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2469:177: error: passing argument 4=
 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2481:185: error: passing argument 4=
 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible p=
ointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2640:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2641:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2750:168: error: passing argument 4=
 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Win=
compatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:469:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:514:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:713:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:3635:185: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:4950:201: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5378:201: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5428:226: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5480:218: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5530:238: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible po=
inter type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5532:234: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5623:246: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible po=
inter type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5625:242: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7088:194: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible po=
inter type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7157:177: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7184:168: error: passing argument 4 =
of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7198:177: error: passing argument 4 =
of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Winc=
ompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7215:185: error: passing argument 4 =
of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible po=
inter type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hashmap.c:4089:30: error: assignment to 'gboolean (*=
)(GeeMapIterator *)' {aka 'int (*)(struct _GeeMapIterator *)'} from incom=
patible pointer type 'gboolean (*)(GeeHashMapNodeIterator *)' {aka 'int (=
*)(struct _GeeHashMapNodeIterator *)'} [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:430:134: error: passing argument 4 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type=
 [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:430:171: error: passing argument 5 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type=
 [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:434:134: error: passing argument 4 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type=
 [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:434:171: error: passing argument 5 o=
f 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type=
 [-Wincompatible-pointer-types]
-CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
--=20
2.45.1


