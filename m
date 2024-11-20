Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A41D711DB
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:34:16 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.22197.1732127651484013378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id BD9581058
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 19:34:09 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.173]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tDpWj-0GsJ5k0; Wed, 20 Nov 2024 19:34:09 +0100
Date: Wed, 20 Nov 2024 19:36:36 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] libsecret: add pam support depending on
 DISTRO_FEATURES
To: openembedded-devel@lists.openembedded.org
Message-Id: <0DI9NS.EG3RIXXDAHGL@t-online.de>
In-Reply-To: <1809C0D8968274B5.29057@lists.openembedded.org>
References: <1809C0D8968274B5.29057@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-OE6mxDXK/8D1krWIiGB/"
X-TOI-EXPURGATEID: 150726::1732127649-6D7F5C97-12AD63C6/0/0 CLEAN NORMAL
X-TOI-MSGID: 777c2308-991c-4db5-bf37-5a16085149a7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113934

--=-OE6mxDXK/8D1krWIiGB/
Content-Type: text/plain; charset=us-ascii; format=flowed

sorry, wrong list. Resent to oe-core

On Wed, Nov 20 2024 at 07:34:56 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> pam module has been ported from gnome-keyring to libsecret
> [<https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893>]
> 
> Add a PACKAGECONFIG for pam and enable it if pam is in
> DISTRO_FEATURES
> 
> Add a patch that disables the pam test, because it would require
> pam_wrapper recipe
> 
> [<https://gitlab.com/cwrap/pam_wrapper>]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libsecret/0001-pam-disable-tests.patch    | 71 
> +++++++++++++++++++
>  .../libsecret/libsecret_0.21.4.bb             |  3 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 
> meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
> 
> diff --git 
> a/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch 
> b/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
> new file mode 100644
> index 0000000000..28cf7c3651
> --- /dev/null
> +++ 
> b/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
> @@ -0,0 +1,71 @@
> +From a028d36dc7b8d0bc33e674d2a0427b171aef2d32 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Wed, 20 Nov 2024 16:30:07 +0100
> +Subject: [PATCH] pam/meson.build: disable tests
> +
> +Otherwise a recipe for pam_wrapper would be required:
> +<https://gitlab.com/cwrap/pam_wrapper>
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status Inappropriate [oe-specific]
> +---
> + pam/meson.build | 42 +++++++++++++++++++++---------------------
> + 1 file changed, 21 insertions(+), 21 deletions(-)
> +
> +diff --git a/pam/meson.build b/pam/meson.build
> +index 8413b58..06d41c4 100644
> +--- a/pam/meson.build
> ++++ b/pam/meson.build
> +@@ -19,27 +19,27 @@ pam_gnome_keyring = 
> shared_library('pam_gnome_keyring',
> + )
> +
> + # pam tests
> +-pam_wrapper = dependency('pam_wrapper', required: true)
> +-libpamtest = dependency('libpamtest', required: true)
> ++#pam_wrapper = dependency('pam_wrapper', required: true)
> ++#libpamtest = dependency('libpamtest', required: true)
> +
> +-subdir('servicedir')
> ++#subdir('servicedir')
> +
> +-test_bin = executable('pam_test',
> +-  sources: [
> +-    'test-pam.c',
> +-  ],
> +-  dependencies: [
> +-    libpamtest,
> +-    glib_deps,
> +-  ],
> +-)
> ++#test_bin = executable('pam_test',
> ++#  sources: [
> ++#    'test-pam.c',
> ++#  ],
> ++#  dependencies: [
> ++#    libpamtest,
> ++#    glib_deps,
> ++#  ],
> ++#)
> +
> +-test('pam-test',
> +-  test_bin,
> +-  env: {
> +-    'LD_PRELOAD': 'libpam_wrapper.so',
> +-    'PAM_WRAPPER': '1',
> +-    'PAM_WRAPPER_DEBUGLEVEL': '5',
> +-    'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + 
> '/servicedir',
> +-  },
> +-)
> ++#test('pam-test',
> ++#  test_bin,
> ++#  env: {
> ++#    'LD_PRELOAD': 'libpam_wrapper.so',
> ++#    'PAM_WRAPPER': '1',
> ++#    'PAM_WRAPPER_DEBUGLEVEL': '5',
> ++#    'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + 
> '/servicedir',
> ++#  },
> ++#)
> +--
> +2.47.0
> +
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb 
> b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
> index 88c3c73510..1bdd26d500 100644
> --- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
> @@ -13,11 +13,14 @@ inherit gnomebase gi-docgen vala 
> gobject-introspection manpages
> 
>  DEPENDS += "glib-2.0 libgcrypt gettext-native"
> 
> +SRC_URI += "file://0001-pam-disable-tests.patch" 
> <file://0001-pam-disable-tests.patch/>
>  SRC_URI[archive.sha256sum] = 
> "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c581301cd53912b20"
> 
>  GTKDOC_MESON_OPTION = 'gtk_doc'
> 
> +PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG[manpages] = 
> "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
> +PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
> 
>  # <http://errors.yoctoproject.org/Errors/Details/20228/>
>  ARM_INSTRUCTION_SET:armv4 = "arm"
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113933): 
> <https://lists.openembedded.org/g/openembedded-devel/message/113933>
> Mute This Topic: <https://lists.openembedded.org/mt/109689744/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-OE6mxDXK/8D1krWIiGB/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sorry, wrong list. Resent to oe-core</div></div><div id="geary-quote" dir="auto"><br>On Wed, Nov 20 2024 at 07:34:56 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">pam module has been ported from gnome-keyring to libsecret
[<a href="https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893">https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893</a>]

Add a PACKAGECONFIG for pam and enable it if pam is in
DISTRO_FEATURES

Add a patch that disables the pam test, because it would require
pam_wrapper recipe

[<a href="https://gitlab.com/cwrap/pam_wrapper">https://gitlab.com/cwrap/pam_wrapper</a>]

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../libsecret/0001-pam-disable-tests.patch    | 71 +++++++++++++++++++
 .../libsecret/libsecret_0.21.4.bb             |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
new file mode 100644
index 0000000000..28cf7c3651
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
@@ -0,0 +1,71 @@
+From a028d36dc7b8d0bc33e674d2a0427b171aef2d32 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Wed, 20 Nov 2024 16:30:07 +0100
+Subject: [PATCH] pam/meson.build: disable tests
+
+Otherwise a recipe for pam_wrapper would be required:
+<a href="https://gitlab.com/cwrap/pam_wrapper">https://gitlab.com/cwrap/pam_wrapper</a>
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+Upstream-Status Inappropriate [oe-specific]
+---
+ pam/meson.build | 42 +++++++++++++++++++++---------------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/pam/meson.build b/pam/meson.build
+index 8413b58..06d41c4 100644
+--- a/pam/meson.build
++++ b/pam/meson.build
+@@ -19,27 +19,27 @@ pam_gnome_keyring = shared_library('pam_gnome_keyring',
+ )
+ 
+ # pam tests
+-pam_wrapper = dependency('pam_wrapper', required: true)
+-libpamtest = dependency('libpamtest', required: true)
++#pam_wrapper = dependency('pam_wrapper', required: true)
++#libpamtest = dependency('libpamtest', required: true)
+ 
+-subdir('servicedir')
++#subdir('servicedir')
+ 
+-test_bin = executable('pam_test',
+-  sources: [
+-    'test-pam.c',
+-  ],
+-  dependencies: [
+-    libpamtest,
+-    glib_deps,
+-  ],
+-)
++#test_bin = executable('pam_test',
++#  sources: [
++#    'test-pam.c',
++#  ],
++#  dependencies: [
++#    libpamtest,
++#    glib_deps,
++#  ],
++#)
+ 
+-test('pam-test',
+-  test_bin,
+-  env: {
+-    'LD_PRELOAD': 'libpam_wrapper.so',
+-    'PAM_WRAPPER': '1',
+-    'PAM_WRAPPER_DEBUGLEVEL': '5',
+-    'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + '/servicedir',
+-  },
+-)
++#test('pam-test',
++#  test_bin,
++#  env: {
++#    'LD_PRELOAD': 'libpam_wrapper.so',
++#    'PAM_WRAPPER': '1',
++#    'PAM_WRAPPER_DEBUGLEVEL': '5',
++#    'PAM_WRAPPER_SERVICE_DIR': meson.current_build_dir() + '/servicedir',
++#  },
++#)
+-- 
+2.47.0
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
index 88c3c73510..1bdd26d500 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
@@ -13,11 +13,14 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
+SRC_URI += "<a href="file://0001-pam-disable-tests.patch" "="">file://0001-pam-disable-tests.patch"</a>
 SRC_URI[archive.sha256sum] = "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c581301cd53912b20"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
+PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[manpages] = "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
+PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 
 # <a href="http://errors.yoctoproject.org/Errors/Details/20228/">http://errors.yoctoproject.org/Errors/Details/20228/</a>
 ARM_INSTRUCTION_SET:armv4 = "arm"
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#113933): <a href="https://lists.openembedded.org/g/openembedded-devel/message/113933">https://lists.openembedded.org/g/openembedded-devel/message/113933</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109689744/3618223">https://lists.openembedded.org/mt/109689744/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-OE6mxDXK/8D1krWIiGB/--


