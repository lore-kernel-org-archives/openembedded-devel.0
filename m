Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCE4C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:51:29 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.27104.1677599487035004463
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout05.t-online.de (Postfix) with SMTP id E61611A04D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Feb 2023 16:51:24 +0100 (CET)
Received: from [192.168.178.83] ([84.163.42.35]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pX2GC-42kx7o0; Tue, 28 Feb 2023 16:51:24 +0100
Date: Tue, 28 Feb 2023 16:51:18 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][meta-oe][PATCH] libdecor: update 1.1.0 -> 1.1.99
To: openembedded-devel@lists.openembedded.org
Message-Id: <I1SSQR.5VQYU8JGIPDO1@t-online.de>
In-Reply-To: <20230228154806.881483-1-f_l_k@t-online.de>
References: <20230228154806.881483-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Y+W0QSOKoDFR1V+6lWuu"
X-TOI-EXPURGATEID: 150726::1677599484-3BFF6A0B-9374C642/0/0 CLEAN NORMAL
X-TOI-MSGID: c58e514f-6762-405b-9458-97021fdaa98c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Feb 2023 15:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101310

--=-Y+W0QSOKoDFR1V+6lWuu
Content-Type: text/plain; charset=us-ascii; format=flowed

I flagged this RFC because this feature is not yet in the stable 
release. dlopen would load png_free into the global namespace, which 
can be problematic if incompatible statically linked libpng symbols are 
already loaded.
That's not a problem for me, so I disabled the check for that. But I'm 
not sure if this could be a blocker for meta-openembedded.

Am Di, 28. Feb 2023 um 16:48:06 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> libdecor is needed under wayland for compositors that require 
> client-side decoration (gnome/weston).
> Its consumers at the moment are at least libsdl2 and blender. 
> Upstream has added a plugin for gtk.
> This is quite a useful feature, since programs that use libdecor 
> don't fit well into gtk otherwise.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ....c-dont-skip-for-conflicting-symbols.patch | 31 
> +++++++++++++++++++
>  .../{libdecor_0.1.1.bb => libdecor_0.1.99.bb} | 23 ++++++++------
>  2 files changed, 44 insertions(+), 10 deletions(-)
>  create mode 100644 
> meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
>  rename meta-oe/recipes-graphics/libdecor/{libdecor_0.1.1.bb => 
> libdecor_0.1.99.bb} (52%)
> 
> diff --git 
> a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch 
> b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
> new file mode 100644
> index 000000000..c9d63c907
> --- /dev/null
> +++ 
> b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
> @@ -0,0 +1,31 @@
> +From fb6eb15b34b5b07a431bb4c3585341411a3e088f Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Tue, 28 Feb 2023 13:42:18 +0100
> +Subject: [PATCH] libdecor-gtk.c: dont skip for conflicting_symbols
> +
> +This is a hack that should be removed, once the underlying bug in 
> glibc was fixed and
> +libdecor was updated to use dlmopen() instead of dlopen()
> +
> +<https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/47>
> +<https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/44>
> +
> +---
> + src/plugins/gtk/libdecor-gtk.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/plugins/gtk/libdecor-gtk.c 
> b/src/plugins/gtk/libdecor-gtk.c
> +index 228161e..fd91afb 100644
> +--- a/src/plugins/gtk/libdecor-gtk.c
> ++++ b/src/plugins/gtk/libdecor-gtk.c
> +@@ -2606,7 +2606,7 @@ libdecor_plugin_description = {
> + 	.priorities = priorities,
> + 	.constructor = libdecor_plugin_new,
> + 	.conflicting_symbols = {
> +-		"png_free",
> ++		//"png_free",
> + 		NULL,
> + 	},
> + };
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb 
> b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
> similarity index 52%
> rename from meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
> rename to meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
> index 4e396d83e..ed0b05f41 100644
> --- a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
> +++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
> @@ -2,25 +2,28 @@ SUMMARY = "libdecor - A client-side decorations 
> library for Wayland clients"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=7ae2be7fb1637141840314b51970a9f7" 
> <file://license;md5=7ae2be7fb1637141840314b51970a9f7/>
> 
> -SRC_URI = 
> "git://gitlab.gnome.org/jadahl/libdecor.git;protocol=https;branch=master"
> +SRC_URI = " \
> +    
> git://gitlab.freedesktop.org/libdecor/libdecor.git;protocol=https;branch=master 
> \
> +    
> file://0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch 
> <file://0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch/> 
> \
> +"
> 
>  DEPENDS = " \
> -	cairo \
> -	pango \
> -	wayland \
> -	wayland-native \
> -	wayland-protocols \
> +    cairo \
> +    pango \
> +    wayland \
> +    wayland-native \
> +    wayland-protocols \
>  "
> 
>  S = "${WORKDIR}/git"
> -SRCREV = "e87dcfdaf83f332fa83b43c804fcf93c151ff0f5"
> +SRCREV = "a254d0c2ff0cbfcf0bbf14cc67cc403640880c01"
> 
> -PACKAGECONFIG ?= "dbus ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'gtk3 opengl', d)}"
> +PACKAGECONFIG ?= "dbus ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'gtk+3', d)}"
> 
>  PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
>  PACKAGECONFIG[demo] = "-Ddemo=true,-Ddemo=false,virtual/libegl 
> libxkbcommon"
> -PACKAGECONFIG[gtk3] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
> -PACKAGECONFIG[opengl] = ",,virtual/libgl"
> +PACKAGECONFIG[install_demo] = 
> "-Dinstall_demo=true,-Dinstall_demo=false"
> +PACKAGECONFIG[gtk+3] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
> 
>  inherit meson pkgconfig
> 
> --
> 2.34.1
> 


--=-Y+W0QSOKoDFR1V+6lWuu
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>I flagged this RFC because this feature is not yet in the stable release. dlopen would load png_free into the global namespace, which can be problematic if incompatible statically linked libpng symbols are already loaded.</div><div>That's not a problem for me, so I disabled the check for that. But I'm not sure if this could be a blocker for meta-openembedded.</div></div></div><div id="geary-quote" dir="auto"><br>Am Di, 28. Feb 2023 um 16:48:06 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libdecor is needed under wayland for compositors that require client-side decoration (gnome/weston).
Its consumers at the moment are at least libsdl2 and blender. Upstream has added a plugin for gtk.
This is quite a useful feature, since programs that use libdecor don't fit well into gtk otherwise.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ....c-dont-skip-for-conflicting-symbols.patch | 31 +++++++++++++++++++
 .../{libdecor_0.1.1.bb =&gt; libdecor_0.1.99.bb} | 23 ++++++++------
 2 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.1.1.bb =&gt; libdecor_0.1.99.bb} (52%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
new file mode 100644
index 000000000..c9d63c907
--- /dev/null
+++ b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
@@ -0,0 +1,31 @@
+From fb6eb15b34b5b07a431bb4c3585341411a3e088f Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Tue, 28 Feb 2023 13:42:18 +0100
+Subject: [PATCH] libdecor-gtk.c: dont skip for conflicting_symbols
+
+This is a hack that should be removed, once the underlying bug in glibc was fixed and
+libdecor was updated to use dlmopen() instead of dlopen()
+
+<a href="https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/47">https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/47</a>
+<a href="https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/44">https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/44</a>
+
+---
+ src/plugins/gtk/libdecor-gtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/gtk/libdecor-gtk.c b/src/plugins/gtk/libdecor-gtk.c
+index 228161e..fd91afb 100644
+--- a/src/plugins/gtk/libdecor-gtk.c
++++ b/src/plugins/gtk/libdecor-gtk.c
+@@ -2606,7 +2606,7 @@ libdecor_plugin_description = {
+ 	.priorities = priorities,
+ 	.constructor = libdecor_plugin_new,
+ 	.conflicting_symbols = {
+-		"png_free",
++		//"png_free",
+ 		NULL,
+ 	},
+ };
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
similarity index 52%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
index 4e396d83e..ed0b05f41 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
@@ -2,25 +2,28 @@ SUMMARY = "libdecor - A client-side decorations library for Wayland clients"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=7ae2be7fb1637141840314b51970a9f7" "="">file://LICENSE;md5=7ae2be7fb1637141840314b51970a9f7"</a>
 
-SRC_URI = "git://gitlab.gnome.org/jadahl/libdecor.git;protocol=https;branch=master"
+SRC_URI = " \
+    git://gitlab.freedesktop.org/libdecor/libdecor.git;protocol=https;branch=master \
+    <a href="file://0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch">file://0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch</a> \
+"
 
 DEPENDS = " \
-	cairo \
-	pango \
-	wayland \
-	wayland-native \
-	wayland-protocols \
+    cairo \
+    pango \
+    wayland \
+    wayland-native \
+    wayland-protocols \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "e87dcfdaf83f332fa83b43c804fcf93c151ff0f5"
+SRCREV = "a254d0c2ff0cbfcf0bbf14cc67cc403640880c01"
 
-PACKAGECONFIG ?= "dbus <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'gtk3 opengl', d)}"
+PACKAGECONFIG ?= "dbus <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'gtk+3', d)}"
 
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
 PACKAGECONFIG[demo] = "-Ddemo=true,-Ddemo=false,virtual/libegl libxkbcommon"
-PACKAGECONFIG[gtk3] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
-PACKAGECONFIG[opengl] = ",,virtual/libgl"
+PACKAGECONFIG[install_demo] = "-Dinstall_demo=true,-Dinstall_demo=false"
+PACKAGECONFIG[gtk+3] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
 
 inherit meson pkgconfig
 
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-Y+W0QSOKoDFR1V+6lWuu--


