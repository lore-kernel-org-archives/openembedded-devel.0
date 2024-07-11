Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F8FC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 10:15:40 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.8589.1720692936483886516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jul 2024 03:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id EAB139746;
	Thu, 11 Jul 2024 12:15:34 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.42.238]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sRqpq-0Dx5rU0; Thu, 11 Jul 2024 12:15:34 +0200
Date: Thu, 11 Jul 2024 12:16:40 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libgee: backport patches to fix
 incompatible pointer types
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <S7FGGS.W71Q3A1NFNMG1@t-online.de>
In-Reply-To: <17E0FAF3A54A1F10.24858@lists.openembedded.org>
References: <17E0FAF3A54A1F10.24858@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-d+34HRbwXBfWl8mm0KeI"
X-TOI-EXPURGATEID: 150726::1720692934-1EFFACAA-F5A402BF/0/0 CLEAN NORMAL
X-TOI-MSGID: 3bf46939-d43d-4f67-ba09-8e27c1c3fdfb
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 10:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111312

--=-d+34HRbwXBfWl8mm0KeI
Content-Type: text/plain; charset=us-ascii; format=flowed

This patch must be removed as it does not fully resolve the issue. 
Sorry for that. I thought I had tested enough, but I was wrong because
the CFLAGS line to disable the "incompatible-pointer-types" error is 
present twice in the recipe. One was added by:
<https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=f0c767407d033e3f39ceeccc2f7e03a1ca7a6443>
and the other by me

On Thu, Jul 11 2024 at 12:36:25 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> This imports two upstream patches that fix vala so that it
> generates correct c code
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...be8987e5eb1390b23ac531c971b202c2ef77.patch | 69 
> +++++++++++++++++++
>  ...6627f4fc96938b6015e05849867c472160a8.patch | 54 +++++++++++++++
>  .../recipes-devtools/libgee/libgee_0.20.6.bb  | 40 ++---------
>  3 files changed, 127 insertions(+), 36 deletions(-)
>  create mode 100644 
> meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch
>  create mode 100644 
> meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch
> 
> diff --git 
> a/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch 
> b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch
> new file mode 100644
> index 000000000..a506391d1
> --- /dev/null
> +++ 
> b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch
> @@ -0,0 +1,69 @@
> +From 2f0bbe8987e5eb1390b23ac531c971b202c2ef77 Mon Sep 17 00:00:00 
> 2001
> +From: Rico Tzschichholz <ricotz@ubuntu.com 
> <mailto:ricotz@ubuntu.com>>
> +Date: Thu, 13 Apr 2023 23:43:03 +0200
> +Subject: [PATCH] Implementations of "G List.get()" should use 
> non-nullable
> + return as defined
> +
> +Upstream-Status: Backport 
> [<https://gitlab.gnome.org/GNOME/libgee/-/commit/2f0bbe8987e5eb1390b23ac531c971b202c2ef77>]
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
> +@@ -39,7 +39,7 @@ public abstract class Gee.AbstractList<G> : 
> Gee.AbstractCollection<G>, List<G> {
> + 	/**
> + 	 * {@inheritDoc}
> + 	 */
> +-	public abstract new G? get (int index);
> ++	public abstract new G get (int index);
> +
> + 	/**
> + 	 * {@inheritDoc}
> +diff --git a/gee/concurrentlist.vala b/gee/concurrentlist.vala
> +index 6e511f1..583f827 100644
> +--- a/gee/concurrentlist.vala
> ++++ b/gee/concurrentlist.vala
> +@@ -170,7 +170,7 @@ public class Gee.ConcurrentList<G> : 
> AbstractList<G> {
> + 	/**
> + 	 * {@inheritDoc}
> + 	 */
> +-	public override G? get (int index) {
> ++	public override G get (int index) {
> + 		HazardPointer.Context ctx = new HazardPointer.Context ();
> + 		Utils.Misc.unused (ctx);
> + 		assert (index >= 0);
> +diff --git a/gee/readonlylist.vala b/gee/readonlylist.vala
> +index 8be3f27..c243d14 100644
> +--- a/gee/readonlylist.vala
> ++++ b/gee/readonlylist.vala
> +@@ -74,7 +74,7 @@ internal class Gee.ReadOnlyList<G> : 
> Gee.ReadOnlyCollection<G>, List<G> {
> + 	/**
> + 	 * {@inheritDoc}
> + 	 */
> +-	public new G? get (int index) {
> ++	public new G get (int index) {
> + 		return ((Gee.List<G>) _collection).get (index);
> + 	}
> +
> +diff --git a/gee/unrolledlinkedlist.vala 
> b/gee/unrolledlinkedlist.vala
> +index e36f88f..234d24d 100644
> +--- a/gee/unrolledlinkedlist.vala
> ++++ b/gee/unrolledlinkedlist.vala
> +@@ -158,7 +158,7 @@ public class Gee.UnrolledLinkedList<G> : 
> AbstractBidirList<G>, Queue<G>, Deque<G
> + 		return new Iterator<G> (this);
> + 	}
> +
> +-	public override G? get (int index) {
> ++	public override G get (int index) {
> + 		assert (index >= 0);
> + 		assert (index < this._size);
> +
> +--
> +GitLab
> +
> diff --git 
> a/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch 
> b/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch
> new file mode 100644
> index 000000000..6b65ebd1c
> --- /dev/null
> +++ 
> b/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch
> @@ -0,0 +1,54 @@
> +From b33a6627f4fc96938b6015e05849867c472160a8 Mon Sep 17 00:00:00 
> 2001
> +From: Rico Tzschichholz <ricotz@ubuntu.com 
> <mailto:ricotz@ubuntu.com>>
> +Date: Sat, 8 Apr 2023 22:39:35 +0200
> +Subject: [PATCH] Add more missing generic type arguments
> +
> +Upstream-Status: Backport 
> [<https://gitlab.gnome.org/GNOME/libgee/-/commit/b33a6627f4fc96938b6015e05849867c472160a8>]
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
> +@@ -253,7 +253,7 @@ public class Gee.HashMap<K,V> : 
> Gee.AbstractMap<K,V> {
> + 		for (int i = 0; i < _array_size; i++) {
> + 			Node<K,V> node = (owned) _nodes[i];
> + 			while (node != null) {
> +-				Node next = (owned) node.next;
> ++				Node<K,V> next = (owned) node.next;
> + 				node.key = null;
> + 				node.value = null;
> + 				node = (owned) next;
> +diff --git a/gee/hashset.vala b/gee/hashset.vala
> +index ef6d5a2..bf05519 100644
> +--- a/gee/hashset.vala
> ++++ b/gee/hashset.vala
> +@@ -210,7 +210,7 @@ public class Gee.HashSet<G> : AbstractSet<G> {
> + 		for (int i = 0; i < _array_size; i++) {
> + 			Node<G> node = (owned) _nodes[i];
> + 			while (node != null) {
> +-				Node next = (owned) node.next;
> ++				Node<G> next = (owned) node.next;
> + 				node.key = null;
> + 				node = (owned) next;
> + 			}
> +diff --git a/gee/linkedlist.vala b/gee/linkedlist.vala
> +index aff36b9..976977f 100644
> +--- a/gee/linkedlist.vala
> ++++ b/gee/linkedlist.vala
> +@@ -233,7 +233,7 @@ public class Gee.LinkedList<G> : 
> AbstractBidirList<G>, Queue<G>, Deque<G> {
> + 				n.next.prev = n;
> + 				this._head = (owned)n;
> + 			} else {
> +-				weak Node prev = this._head;
> ++				weak Node<G> prev = this._head;
> + 				for (int i = 0; i < index - 1; i++) {
> + 					prev = prev.next;
> + 				}
> +--
> +GitLab
> +
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb 
> b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> index 7e2781bcb..14e8e9908 100644
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> @@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  GNOMEBASEBUILDCLASS = "autotools"
>  inherit gnomebase vala gobject-introspection
> 
> -CFLAGS += "-Wno-incompatible-pointer-types"
> -
>  do_configure:prepend() {
>      MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 
> ltversion.m4"
>      for i in ${MACROS}; do
> @@ -20,39 +18,9 @@ do_configure:prepend() {
>      done
>  }
> 
> +SRC_URI += " \
> +	file://2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch 
> <file://2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch/> \
> +	file://b33a6627f4fc96938b6015e05849867c472160a8.patch 
> <file://b33a6627f4fc96938b6015e05849867c472160a8.patch/> \
> +"
>  SRC_URI[archive.sha256sum] = 
> "1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d"
> 
> -# <http://errors.yoctoproject.org/Errors/Details/766884/>
> -# libgee-0.20.6/gee/concurrentlist.c:1169:177: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:1175:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2385:194: error: passing 
> argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from 
> incompatible pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2438:177: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2460:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2469:177: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2481:185: error: passing 
> argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from 
> incompatible pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2640:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2641:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:2750:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:469:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:514:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentlist.c:713:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:3635:185: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:4950:201: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5378:201: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5428:226: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5480:218: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5530:238: error: passing 
> argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from 
> incompatible pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5532:234: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5623:246: error: passing 
> argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from 
> incompatible pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:5625:242: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7088:194: error: passing 
> argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from 
> incompatible pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7157:177: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7184:168: error: passing 
> argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7198:177: error: passing 
> argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/concurrentset.c:7215:185: error: passing 
> argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from 
> incompatible pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hashmap.c:4089:30: error: assignment to 
> 'gboolean (*)(GeeMapIterator *)' {aka 'int (*)(struct _GeeMapIterator 
> *)'} from incompatible pointer type 'gboolean 
> (*)(GeeHashMapNodeIterator *)' {aka 'int (*)(struct 
> _GeeHashMapNodeIterator *)'} [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:430:134: error: passing argument 
> 4 of 'gee_hazard_pointer_release_policy_swap' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:430:171: error: passing argument 
> 5 of 'gee_hazard_pointer_release_policy_swap' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:434:134: error: passing argument 
> 4 of 'gee_hazard_pointer_release_policy_swap' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -# libgee-0.20.6/gee/hazardpointer.c:434:171: error: passing argument 
> 5 of 'gee_hazard_pointer_release_policy_swap' from incompatible 
> pointer type [-Wincompatible-pointer-types]
> -CFLAGS += "-Wno-error=incompatible-pointer-types"
> --
> 2.45.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111309): 
> <https://lists.openembedded.org/g/openembedded-devel/message/111309>
> Mute This Topic: <https://lists.openembedded.org/mt/107152863/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-d+34HRbwXBfWl8mm0KeI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This patch must be removed as it does not fully resolve the issue. Sorry for that. I thought I had tested enough, but I was wrong because&nbsp;</div><div>the CFLAGS line to disable the "incompatible-pointer-types" error is present twice in the recipe. One was added by:</div><div><a href="https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=f0c767407d033e3f39ceeccc2f7e03a1ca7a6443">https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=f0c767407d033e3f39ceeccc2f7e03a1ca7a6443</a></div><div>and the other by me</div></div><div id="geary-quote" dir="auto"><br>On Thu, Jul 11 2024 at 12:36:25 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This imports two upstream patches that fix vala so that it
generates correct c code

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...be8987e5eb1390b23ac531c971b202c2ef77.patch | 69 +++++++++++++++++++
 ...6627f4fc96938b6015e05849867c472160a8.patch | 54 +++++++++++++++
 .../recipes-devtools/libgee/libgee_0.20.6.bb  | 40 ++---------
 3 files changed, 127 insertions(+), 36 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch

diff --git a/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch
new file mode 100644
index 000000000..a506391d1
--- /dev/null
+++ b/meta-oe/recipes-devtools/libgee/libgee/2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch
@@ -0,0 +1,69 @@
+From 2f0bbe8987e5eb1390b23ac531c971b202c2ef77 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz &lt;<a href="mailto:ricotz@ubuntu.com">ricotz@ubuntu.com</a>&gt;
+Date: Thu, 13 Apr 2023 23:43:03 +0200
+Subject: [PATCH] Implementations of "G List.get()" should use non-nullable
+ return as defined
+
+Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/libgee/-/commit/2f0bbe8987e5eb1390b23ac531c971b202c2ef77">https://gitlab.gnome.org/GNOME/libgee/-/commit/2f0bbe8987e5eb1390b23ac531c971b202c2ef77</a>]
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
+@@ -39,7 +39,7 @@ public abstract class Gee.AbstractList&lt;G&gt; : Gee.AbstractCollection&lt;G&gt;, List&lt;G&gt; {
+ 	/**
+ 	 * {@inheritDoc}
+ 	 */
+-	public abstract new G? get (int index);
++	public abstract new G get (int index);
+ 
+ 	/**
+ 	 * {@inheritDoc}
+diff --git a/gee/concurrentlist.vala b/gee/concurrentlist.vala
+index 6e511f1..583f827 100644
+--- a/gee/concurrentlist.vala
++++ b/gee/concurrentlist.vala
+@@ -170,7 +170,7 @@ public class Gee.ConcurrentList&lt;G&gt; : AbstractList&lt;G&gt; {
+ 	/**
+ 	 * {@inheritDoc}
+ 	 */
+-	public override G? get (int index) {
++	public override G get (int index) {
+ 		HazardPointer.Context ctx = new HazardPointer.Context ();
+ 		Utils.Misc.unused (ctx);
+ 		assert (index &gt;= 0);
+diff --git a/gee/readonlylist.vala b/gee/readonlylist.vala
+index 8be3f27..c243d14 100644
+--- a/gee/readonlylist.vala
++++ b/gee/readonlylist.vala
+@@ -74,7 +74,7 @@ internal class Gee.ReadOnlyList&lt;G&gt; : Gee.ReadOnlyCollection&lt;G&gt;, List&lt;G&gt; {
+ 	/**
+ 	 * {@inheritDoc}
+ 	 */
+-	public new G? get (int index) {
++	public new G get (int index) {
+ 		return ((Gee.List&lt;G&gt;) _collection).get (index);
+ 	}
+ 
+diff --git a/gee/unrolledlinkedlist.vala b/gee/unrolledlinkedlist.vala
+index e36f88f..234d24d 100644
+--- a/gee/unrolledlinkedlist.vala
++++ b/gee/unrolledlinkedlist.vala
+@@ -158,7 +158,7 @@ public class Gee.UnrolledLinkedList&lt;G&gt; : AbstractBidirList&lt;G&gt;, Queue&lt;G&gt;, Deque&lt;G
+ 		return new Iterator&lt;G&gt; (this);
+ 	}
+ 
+-	public override G? get (int index) {
++	public override G get (int index) {
+ 		assert (index &gt;= 0);
+ 		assert (index &lt; this._size);
+ 
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch b/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch
new file mode 100644
index 000000000..6b65ebd1c
--- /dev/null
+++ b/meta-oe/recipes-devtools/libgee/libgee/b33a6627f4fc96938b6015e05849867c472160a8.patch
@@ -0,0 +1,54 @@
+From b33a6627f4fc96938b6015e05849867c472160a8 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz &lt;<a href="mailto:ricotz@ubuntu.com">ricotz@ubuntu.com</a>&gt;
+Date: Sat, 8 Apr 2023 22:39:35 +0200
+Subject: [PATCH] Add more missing generic type arguments
+
+Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/libgee/-/commit/b33a6627f4fc96938b6015e05849867c472160a8">https://gitlab.gnome.org/GNOME/libgee/-/commit/b33a6627f4fc96938b6015e05849867c472160a8</a>]
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
+@@ -253,7 +253,7 @@ public class Gee.HashMap&lt;K,V&gt; : Gee.AbstractMap&lt;K,V&gt; {
+ 		for (int i = 0; i &lt; _array_size; i++) {
+ 			Node&lt;K,V&gt; node = (owned) _nodes[i];
+ 			while (node != null) {
+-				Node next = (owned) node.next;
++				Node&lt;K,V&gt; next = (owned) node.next;
+ 				node.key = null;
+ 				node.value = null;
+ 				node = (owned) next;
+diff --git a/gee/hashset.vala b/gee/hashset.vala
+index ef6d5a2..bf05519 100644
+--- a/gee/hashset.vala
++++ b/gee/hashset.vala
+@@ -210,7 +210,7 @@ public class Gee.HashSet&lt;G&gt; : AbstractSet&lt;G&gt; {
+ 		for (int i = 0; i &lt; _array_size; i++) {
+ 			Node&lt;G&gt; node = (owned) _nodes[i];
+ 			while (node != null) {
+-				Node next = (owned) node.next;
++				Node&lt;G&gt; next = (owned) node.next;
+ 				node.key = null;
+ 				node = (owned) next;
+ 			}
+diff --git a/gee/linkedlist.vala b/gee/linkedlist.vala
+index aff36b9..976977f 100644
+--- a/gee/linkedlist.vala
++++ b/gee/linkedlist.vala
+@@ -233,7 +233,7 @@ public class Gee.LinkedList&lt;G&gt; : AbstractBidirList&lt;G&gt;, Queue&lt;G&gt;, Deque&lt;G&gt; {
+ 				n.next.prev = n;
+ 				this._head = (owned)n;
+ 			} else {
+-				weak Node prev = this._head;
++				weak Node&lt;G&gt; prev = this._head;
+ 				for (int i = 0; i &lt; index - 1; i++) {
+ 					prev = prev.next;
+ 				}
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
index 7e2781bcb..14e8e9908 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase vala gobject-introspection
 
-CFLAGS += "-Wno-incompatible-pointer-types"
-
 do_configure:prepend() {
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
     for i in ${MACROS}; do
@@ -20,39 +18,9 @@ do_configure:prepend() {
     done
 }
 
+SRC_URI += " \
+	<a href="file://2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch">file://2f0bbe8987e5eb1390b23ac531c971b202c2ef77.patch</a> \
+	<a href="file://b33a6627f4fc96938b6015e05849867c472160a8.patch">file://b33a6627f4fc96938b6015e05849867c472160a8.patch</a> \
+"
 SRC_URI[archive.sha256sum] = "1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d"
 
-# <a href="http://errors.yoctoproject.org/Errors/Details/766884/">http://errors.yoctoproject.org/Errors/Details/766884/</a>
-# libgee-0.20.6/gee/concurrentlist.c:1169:177: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:1175:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2385:194: error: passing argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2438:177: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2460:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2469:177: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2481:185: error: passing argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2640:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2641:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:2750:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:469:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:514:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentlist.c:713:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:3635:185: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:4950:201: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5378:201: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5428:226: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5480:218: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5530:238: error: passing argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5532:234: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5623:246: error: passing argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:5625:242: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7088:194: error: passing argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7157:177: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7184:168: error: passing argument 4 of 'gee_hazard_pointer_set_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7198:177: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/concurrentset.c:7215:185: error: passing argument 4 of 'gee_hazard_pointer_compare_and_exchange_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hashmap.c:4089:30: error: assignment to 'gboolean (*)(GeeMapIterator *)' {aka 'int (*)(struct _GeeMapIterator *)'} from incompatible pointer type 'gboolean (*)(GeeHashMapNodeIterator *)' {aka 'int (*)(struct _GeeHashMapNodeIterator *)'} [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:430:134: error: passing argument 4 of 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:430:171: error: passing argument 5 of 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:434:134: error: passing argument 4 of 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [-Wincompatible-pointer-types]
-# libgee-0.20.6/gee/hazardpointer.c:434:171: error: passing argument 5 of 'gee_hazard_pointer_release_policy_swap' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
<div>-- 
</div>2.45.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111309): <a href="https://lists.openembedded.org/g/openembedded-devel/message/111309">https://lists.openembedded.org/g/openembedded-devel/message/111309</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/107152863/3618223">https://lists.openembedded.org/mt/107152863/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-d+34HRbwXBfWl8mm0KeI--


