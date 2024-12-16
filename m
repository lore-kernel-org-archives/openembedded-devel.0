Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2D2E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 09:07:48 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.52534.1734340061002193052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 01:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id BAD0ABEA
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:07:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tN747-0Tnsep0; Mon, 16 Dec 2024 10:06:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] gjs: update 1.80.2 -> 1.82.1
Date: Mon, 16 Dec 2024 10:07:05 +0100
Message-ID: <20241216090705.1698-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216090705.1698-1-f_l_k@t-online.de>
References: <20241216090705.1698-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1734340019-99FF89DC-DDED092D/0/0 CLEAN NORMAL
X-TOI-MSGID: 77230e5b-8430-435c-8da5-36fea48d8960
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 09:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114325

- Refresh patches

Version 1.82.1
--------------

- Closed bugs and merge requests:

  * gnome-shell crash when switching user after upgrade from Fedora 40 to=
 Fedora
    41 [#647, !955, Philip Chimento]

Version 1.82.0
--------------

- Closed bugs and merge requests:

  * installed tests are failing because they can't load internal typelibs=
 from
    parent directory [#639, !953, Simon McVittie]
  * GIMarshalling test has 3 failures with 1.81.90 on i686 [#642, !954, P=
hilip
    Chimento]

Version 1.81.90
---------------

- Closed bugs and merge requests:

  * callbacks: fix sweeping check for incremental GC [!859, !950, Evan We=
lsh,
    Gary Li]
  * GJS doesn't handle query parameters in imports [#618, !944, Gary Li]
  * Integrate gobject-introspection-tests as submodule [!946, Philip Chim=
ento]
  * module: Include full module specifier in import.meta.url [!947, Phili=
p
    Chimento]
  * doap: Remove invalid maintainer entry [!948, Sophie Herold]
  * installed tests have the wrong libexecdir [#636, !949, Jeremy Bicha]
  * Inheriting final class crashes GJS [#640, !951, Gary Li]
  * Various maintenance [!952, Philip Chimento]

Version 1.81.2
--------------

- New JavaScript features! This version of GJS is based on SpiderMonkey 1=
28, an
  upgrade from the previous ESR (Extended Support Release) of SpiderMonke=
y 115.
  Here are the highlights of the new JavaScript features.
  For more information, look them up on MDN or devdocs.io.

  * New APIs
    + The new `Object.groupBy()` and `Map.groupBy()` static methods group=
 the
      elements of an iterable according to the return value of a key func=
tion.
    + The new `Promise.withResolvers()` static method returns a Promise a=
s well
      as its resolve and reject functions, shorthand for a common pattern=
 used
      when promisifying event-based APIs.
    + Strings have gained the `isWellFormed()` and `toWellFormed()` metho=
ds
      which help when interoperating with strings that may have unpaired
      Unicode surrogates. This usually does not come up in the GNOME plat=
form.
    + ArrayBuffers have gained the `transfer()` and `transferToFixedLengt=
h()`
      methods, which transfer ownership of a data buffer to a new ArrayBu=
ffer
      object, without copying it, and invalidating ("detaching") any exis=
ting
      references to the buffer. There is also a new property, `detached`,=
 which
      allows checking whether an ArrayBuffer is in the detached state.
    + The new `Intl.Segmenter` class allows splitting a string into graph=
emes,
      words, or sentences, in a locale-aware way.
    + `Intl.NumberFormat` has gained `formatRange()` and `formatRangeToPa=
rts()`
      methods, which allow formatting number ranges, like "3=E2=80=935".
    + `Intl.PluralRules` has gained a `selectRange()` method, which allow=
s
      selecting the proper plural form based on a range of numbers, like
      "30=E2=80=9350 feral hogs".

  * New behaviour
    + The `Intl.NumberFormat` and `Intl.PluralRules` constructors support=
 new
      options: `roundingIncrement`, `roundingMode`, `roundingPriority`, a=
nd
      `trailingZeroDisplay`.
    + The `Intl.NumberFormat` constructor also supports the new option
      `useGrouping`.

  * Backwards-incompatible changes
    + The behaviour of `Date.parse()` has been changed to be more consist=
ent
      with other JavaScript engines. (But don't use `Date.parse()`.)

- Closed bugs and merge requests:
  * Invalid search paths cause failed assertions when printing imports.gi
    [#629, !935, Gary Li]
  * SpiderMonkey 128 [#630, !936, !945, Philip Chimento]
  * Pretty-printing byte array in gjs-console throws a type conversion
    error [#434, !937, Gary Li]
  * js: Add gjs_debug_callable() debug function [!940, Philip Chimento]
  * build: Build Cairo from subproject if not found [!941, Philip
    Chimento]
  * Bump CI image to Fedora 40 [!942, Philip Chimento]
  * CI tools updates [!943, Philip Chimento]

Version 1.81.1
--------------

- Breaking change: When creating a GObject with the `new` operator, the
  constructor takes a single argument consisting of a property bag with
  GObject construct properties and their values.
  This was often confused with the `new` static method that may take
  arguments that are not interpreted as property bags.
  For example, Gio.FileIcon was one of the many affected APIs:

      new Gio.FileIcon({file: myFile})

  vs

      Gio.FileIcon.new(myFile)

  Confusion between the two often lead to bug reports when confusing
  these two and calling `new Gio.FileIcon(myFile)` - the constructor
  would look for a nonexistent `file` property on `myFile`, causing an
  improperly initialized object.

  This is now no longer allowed. The argument to `new Gio.FileIcon(...)`
  must be a plain JS object, not a GObject.

  It's possible that existing code legitimately used a GObject here. If
  your code does this and a quick migration is impractical, please get
  in touch and we will revert this change before 1.82.0 in favour of a
  longer deprecation period.

- The `get_data()`, `get_qdata()`, `set_data()`, `steal_data()`,
  `steal_qdata()`, `ref()`, `unref()`, `ref_sink()`, and
  `force_floating()` methods of GObject now throw if called.
  These methods never worked, but sometimes they would silently appear
  to succeed, then cause crashes or memory leaks later.

  If you were trying to use the `get_data()` family of methods, just set
  a JS property instead. If you were trying to modify the refcount of a
  GObject in JS, instead set the object as the value of a JS property on
  some other object.

- Closed bugs and merge requests:
  * doc: Document how to get a stack trace [!864, Sonny Piers]
  * TextDecoder should accept GBytes [#587, !903, Sriyansh Shivam]
  * Possible use-after-free with GLib.Regex.match/GLib.MatchInfo [#589,
    !920, Philip Chimento]
  * method `get_line` of `Pango.Layout` doesn't work. [#547, !921,
    Philip Chimento]
  * Block calls to g_object_get_data and friends [#423, !922, Philip
    Chimento]
  * Crash when calling Pango.Layout.get_pixel_size() with a badly
    init:ed Pango.Layout [#580, !923, Philip Chimento]
  * doc: avoid reference to Gio.UnixInputStream [!925, Andy Holmes]
  * Add a CI check for config.h, and some other useful checks [#447,
    !926, Philip Chimento]
  * Incorrect UnixOutputStream warning [#610, !928, Philip Chimento]
  * Various maintenance [!929, !931, Philip Chimento]
  * Docs: Various markdown fixes [!930, Frank Dana]
  * Some build fixes for the main (and gnome-46) branches for Visual
    Studio [!932, Chun-wei Fan]
  * GJS doesn't log undefined values [#621, !933, Gary Li]
  * property objects are printed as empty js objects [#622, !934, Gary
    Li]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...01-Support-cross-builds-a-bit-better.patch | 10 +++++-----
 ...ot-add-dir-installed-tests-when-inst.patch | 19 ++++++++++++-------
 .../gjs/{gjs_1.80.2.bb =3D> gjs_1.82.1.bb}      |  4 ++--
 3 files changed, 19 insertions(+), 14 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.80.2.bb =3D> gjs_1.82.1.bb} (=
90%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a=
-bit-better.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-b=
uilds-a-bit-better.patch
index 12b4b08c7e..c66d42da62 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-be=
tter.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-builds-a-bit-be=
tter.patch
@@ -1,4 +1,4 @@
-From 8a78a7996b01aba21377ceb7547da673fd30a391 Mon Sep 17 00:00:00 2001
+From 8e7a25b0171eb60c802168593355354dff7806f5 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Wed, 27 Oct 2021 20:18:47 +0200
 Subject: [PATCH] Support cross builds a bit better
@@ -17,10 +17,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index c9b26d6..3058e8c 100644
+index f3081fc..ac958d3 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -262,6 +262,7 @@ release builds of SpiderMonkey. Try configuring Spid=
erMonkey with
+@@ -252,6 +252,7 @@ release builds of SpiderMonkey. Try configuring Spid=
erMonkey with
  --disable-debug.''')
  endif
 =20
@@ -28,7 +28,7 @@ index c9b26d6..3058e8c 100644
  # Check if a minimal SpiderMonkey program compiles, links, and runs. If=
 not,
  # it's most likely the case that SpiderMonkey was configured incorrectl=
y, for
  # example by building mozglue as a shared library.
-@@ -292,6 +293,7 @@ elif minimal_program.returncode() !=3D 0
+@@ -282,6 +283,7 @@ elif minimal_program.returncode() !=3D 0
  failed to execute. Most likely you should build it with a different
  configuration.''' + recommended_configuration)
  endif
@@ -36,7 +36,7 @@ index c9b26d6..3058e8c 100644
 =20
  have_printf_alternative_int =3D cc.compiles('''
  #include <stdio.h>
-@@ -690,7 +692,7 @@ subdir('installed-tests')
+@@ -656,7 +658,7 @@ subdir('installed-tests')
 =20
  # Note: The test program in test/ needs to be ported
  #       to Windows before we can build it on Windows.
diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add=
-dir-installed-tests-when-inst.patch b/meta-gnome/recipes-gnome/gjs/gjs/0=
002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch
index e932f06d27..bca27c33d4 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-in=
stalled-tests-when-inst.patch
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-not-add-dir-in=
stalled-tests-when-inst.patch
@@ -1,12 +1,17 @@
-From 29221ae42e424c6100b8c313d2b61801430c872d Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller=3D20installed=3D5Ftests=3D=
20is=3D20false?=3D
- <schnitzeltony@gmail.com>
+From 6a70d3ac658988dda49d51ed8b46584b716a9c7c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Wed, 27 Oct 2021 20:04:02 +0200
 Subject: [PATCH] meson.build: Do not add dir installed-tests when
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller=3D20installed=3D5Ftests=3D=
20is=3D20false?=3D
+ <schnitzeltony@gmail.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
@@ -19,12 +24,12 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 3058e8c..06cf8da 100644
+index ac958d3..e773508 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -688,7 +688,9 @@ endif
-=20
- ### Tests and test setups #############################################=
#########
+@@ -654,7 +654,9 @@ gi_tests =3D subproject('gobject-introspection-tests=
',
+     default_options: ['werror=3Dfalse', 'cairo=3Dtrue',
+         'install_dir=3D@0@'.format(installed_tests_execdir)])
 =20
 -subdir('installed-tests')
 +if get_option('installed_tests')
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.80.2.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.82.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.80.2.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
index 1d781d078c..c4bccbe7b0 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.80.2.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
@@ -3,11 +3,11 @@ LICENSE =3D "MIT & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
=20
=20
-DEPENDS =3D "mozjs-115 cairo"
+DEPENDS =3D "mozjs-128 cairo"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check=
 upstream-version-is-even pkgconfig
=20
-SRC_URI[archive.sha256sum] =3D "135e39c5ac591096233e557cfe577d64093f5054=
411d47cb2e214bad7d4199bd"
+SRC_URI[archive.sha256sum] =3D "fb39aa5636576de0e5a1171f56a1a5825e2bd1a6=
9972fb120ba78bd109b5693c"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
--=20
2.47.1


