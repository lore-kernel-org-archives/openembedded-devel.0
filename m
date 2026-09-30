Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FEFCA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:34:13 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13567.1790775244213189561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 06:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Qr38ME8p;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id CE420E57B
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 15:34:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.219]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBuRT-2mOHyr0; Wed, 30 Sep 2026 15:33:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] ibus: backport fix for a use-after-free of the preedit attributes
Date: Wed, 30 Sep 2026 15:33:42 +0200
Message-ID: <20260930133342.1571493-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790775231-E1FF882F-39905466/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a03b4b8-3e31-4dc5-a823-42000f8488ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790775241; i=f_l_k@t-online.de;
	bh=wwrhQxc8Rdhoe6yIg4H/2Y6PFXPHAmIYP934mF2x+IU=;
	h=From:To:Subject:Date;
	b=Qr38ME8pQwUiweaRO00VQ+GKU3YcIqII0ktpkhce3RDrfDPRFWhJuQbUMULtQkmXk
	 eFWtfVb2Po1ePLcMOuCh0tCIAroLjy0NTO1L8nyvjSWbCsrDfxyXGqo8yav1z95SM6
	 dnveFqE7gPl0poivnFGBij8dg6ZKyqAm8H7bbxctJp+N68173mb1WbFgd/LuQ6q010
	 hXgNBUIlmFwU4I6bBqFDwVJv1PWRM+PuXh+9CASgGLzyMVPj5d1E60W5TRUhcDY7aP
	 HLJsQ2mXUs1eAKN0zcKq239cmsX4k6Eye53rLySVqRzwXTYbpddVt9F1bLM5Cy0E1I
	 OPqCsSjTrVJGg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 13:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130523

ibus_input_context_convert_text() replaced the attribute list of an
IBusText with a new, floating list without sinking it. gjs sinks the
floating reference when gnome-shell calls get_attributes(), so gjs and
the IBusText end up sharing a single reference, and whichever releases
it second unrefs a freed object. gnome-shell crashes with SIGSEGV in
ibus_text_destroy(), typically while typing with dead keys, which ends
the session.

The same crash is reported in Debian:
https://bugs.debian.org/1146664

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-support/ibus/ibus.inc      |   2 +
 ...Text-own-an-updated-IBusAttrList-ref.patch |  99 +++++++++++++++
 ...usAttrList-leak-when-converting-text.patch | 120 ++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-make-an=
-IBusText-own-an-updated-IBusAttrList-ref.patch
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBu=
sAttrList-leak-when-converting-text.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus.inc
index d9d8b70861..d53c5e63d5 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -12,6 +12,8 @@ DEPENDS =3D "unicode-ucd libx11-native"
 SRC_URI =3D " \
     git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
${PV} \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
+    file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.pat=
ch \
+    file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch \
 "
 SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
=20
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusTe=
xt-own-an-updated-IBusAttrList-ref.patch b/meta-gnome/recipes-support/ibu=
s/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
new file mode 100644
index 0000000000..b255e889b9
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-=
an-updated-IBusAttrList-ref.patch
@@ -0,0 +1,99 @@
+From b69a9906acba1111bcb39c654fc885a079fd31f9 Mon Sep 17 00:00:00 2001
+From: Tianhao Chai <cth451@gmail.com>
+Date: Wed, 27 May 2026 13:11:28 +0900
+Subject: [PATCH 1/2] src: make an IBusText own an updated IBusAttrList
+ reference
+
+For all usages of IBusAttrList, the list is an owned reference within a
+IBusText struct. `ibus_panel_convert_text()` and
+`ibus_input_context_convert_text()` violate the invarient by assigning a
+**floating** IBusAttrList reference to anIBusText without sinking it.
+
+When GJS attempts to create a JS representation of an existing GObject,
+it unconditionally sinks the incoming reference.[1] For a non-floating
+reference this up-refs the object.
+
+For this floating IBusAttrLit, `g_object_ref_sink` converts it to a
+strong reference in-place leaving ref-count at 1. At this point the
+`IBusAttrList` is referenced by both the enclosing `IBusText` and the
+newly created GJS wrapper. When one of them is ref-downed the object
+is recycled, leaving the other reference dangling.
+
+To fix this we just need to maintain the list as a non-floating ref.
+We already have a `ibus_text_set_attributes()` that does the intended
+ref sinking, so just use that instead of manually assigning pointers.
+
+[1]: https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e131a92992c=
2509507aa6152aa/gi/object.cpp#L3597
+
+Closes: #2889
+
+Upstream-Status: Backport [https://github.com/ibus/ibus/commit/5bbe88a19=
36246185a65f76e58cc85871401e59a]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/ibusinputcontext.c | 12 ++++--------
+ src/ibuspanelservice.c | 12 ++++--------
+ 2 files changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
+index 68d12fb..bdfd166 100644
+--- a/src/ibusinputcontext.c
++++ b/src/ibusinputcontext.c
+@@ -569,10 +569,8 @@ ibus_input_context_convert_text (IBusInputContext *=
context,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs) {
+-            g_object_unref (text->attrs);
+-            text->attrs =3D new_attrs;
+-        }
++        if (new_attrs)
++            ibus_text_set_attributes (text, new_attrs);
+         break;
+     case IBUS_PREEDIT_FORMAT_HINT:
+         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs, =
&error);
+@@ -581,10 +579,8 @@ ibus_input_context_convert_text (IBusInputContext *=
context,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs) {
+-            g_object_unref (text->attrs);
+-            text->attrs =3D new_attrs;
+-        }
++        if (new_attrs)
++            ibus_text_set_attributes (text, new_attrs);
+         break;
+     default:
+         g_assert_not_reached ();
+diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c
+index 1622982..f50cea1 100644
+--- a/src/ibuspanelservice.c
++++ b/src/ibuspanelservice.c
+@@ -1203,10 +1203,8 @@ ibus_panel_convert_text (IBusPanelService *panel,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs) {
+-            g_object_unref (text->attrs);
+-            text->attrs =3D new_attrs;
+-        }
++        if (new_attrs)
++            ibus_text_set_attributes (text, new_attrs);
+         break;
+     case IBUS_PREEDIT_FORMAT_HINT:
+         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs, =
&error);
+@@ -1215,10 +1213,8 @@ ibus_panel_convert_text (IBusPanelService *panel,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs) {
+-            g_object_unref (text->attrs);
+-            text->attrs =3D new_attrs;
+-        }
++        if (new_attrs)
++            ibus_text_set_attributes (text, new_attrs);
+         break;
+     default:
+         g_assert_not_reached ();
+--=20
+2.55.0
+
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrLi=
st-leak-when-converting-text.patch b/meta-gnome/recipes-support/ibus/ibus=
/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
new file mode 100644
index 0000000000..d714febcef
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak=
-when-converting-text.patch
@@ -0,0 +1,120 @@
+From a9c89af52127b6c718395e6cd8439e8c92c471b1 Mon Sep 17 00:00:00 2001
+From: Sebastian Keller <skeller@gnome.org>
+Date: Thu, 27 Aug 2026 21:07:58 +0200
+Subject: [PATCH 2/2] src: Fix IBusAttrList leak when converting text
+
+After 5bbe88a1 the attribute list set on the text was getting leaked
+when the list passed to `ibus_attr_list_copy_format_to_*()` had a length
+of 0. In that case the list is already non-floating before the copy
+function adds a ref and returns it. This then is passed to
+`ibus_text_set_attributes()` which calls `g_object_ref_sink()`. Since
+the list is not floating, this adds another ref that would not be added
+in the length > 0 case. This surplus ref is causing the list to be
+leaked.
+
+To fix this leak we need to unref the list after calling
+`ibus_text_set_attributes()`.
+
+However in the length > 0 case the new list returned by
+`ibus_attr_list_copy_format_to_*()` is floating, so this would drop the
+refcount to 0. To avoid this we need to ensure that if the list is float=
ing the
+floating ref is sunk before calling `ibus_text_set_attributes()`, so the
+call to `g_object_ref_sink()` in there adds a ref, such that we can
+safely unref this after the call to `ibus_text_set_attributes()`.
+
+This also keeps the guarantee that the list is not floating anymore
+after converting text to not regress the issue fixed by 5bbe88a1.
+
+Fixes: https://github.com/ibus/ibus/commit/5bbe88a1
+Closes: https://github.com/ibus/ibus/issues/2941
+
+Upstream-Status: Backport [https://github.com/ibus/ibus/commit/1a331e695=
d84fc6bae8f2d11c52d4776df49647b]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/ibusinputcontext.c | 20 ++++++++++++++++++--
+ src/ibuspanelservice.c | 20 ++++++++++++++++++--
+ 2 files changed, 36 insertions(+), 4 deletions(-)
+
+diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
+index bdfd166..d0e162f 100644
+--- a/src/ibusinputcontext.c
++++ b/src/ibusinputcontext.c
+@@ -569,8 +569,16 @@ ibus_input_context_convert_text (IBusInputContext *=
context,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs)
++        if (new_attrs) {
++#if GLIB_CHECK_VERSION (2, 70, 0)
++            g_object_take_ref (new_attrs);
++#else
++            if (g_object_is_floating (new_attrs)
++                g_object_ref_sink (new_attrs);
++#endif
+             ibus_text_set_attributes (text, new_attrs);
++            g_object_unref (new_attrs);
++        }
+         break;
+     case IBUS_PREEDIT_FORMAT_HINT:
+         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs, =
&error);
+@@ -579,8 +587,16 @@ ibus_input_context_convert_text (IBusInputContext *=
context,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs)
++        if (new_attrs) {
++#if GLIB_CHECK_VERSION (2, 70, 0)
++            g_object_take_ref (new_attrs);
++#else
++            if (g_object_is_floating (new_attrs)
++                g_object_ref_sink (new_attrs);
++#endif
+             ibus_text_set_attributes (text, new_attrs);
++            g_object_unref (new_attrs);
++        }
+         break;
+     default:
+         g_assert_not_reached ();
+diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c
+index f50cea1..3d59a21 100644
+--- a/src/ibuspanelservice.c
++++ b/src/ibuspanelservice.c
+@@ -1203,8 +1203,16 @@ ibus_panel_convert_text (IBusPanelService *panel,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs)
++        if (new_attrs) {
++#if GLIB_CHECK_VERSION (2, 70, 0)
++            g_object_take_ref (new_attrs);
++#else
++            if (g_object_is_floating (new_attrs)
++                g_object_ref_sink (new_attrs);
++#endif
+             ibus_text_set_attributes (text, new_attrs);
++            g_object_unref (new_attrs);
++        }
+         break;
+     case IBUS_PREEDIT_FORMAT_HINT:
+         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs, =
&error);
+@@ -1213,8 +1221,16 @@ ibus_panel_convert_text (IBusPanelService *panel,
+                        text->text, error->message);
+             g_error_free (error);
+         }
+-        if (new_attrs)
++        if (new_attrs) {
++#if GLIB_CHECK_VERSION (2, 70, 0)
++            g_object_take_ref (new_attrs);
++#else
++            if (g_object_is_floating (new_attrs)
++                g_object_ref_sink (new_attrs);
++#endif
+             ibus_text_set_attributes (text, new_attrs);
++            g_object_unref (new_attrs);
++        }
+         break;
+     default:
+         g_assert_not_reached ();
+--=20
+2.55.0
+
--=20
2.55.0


