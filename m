Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388F9CF9C64
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 18:22:20 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.1546.1726942936079885989
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 11:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout12.t-online.de (Postfix) with SMTP id 9A0891AEAA;
	Sat, 21 Sep 2024 20:22:14 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.36.251]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss4kH-0Flpui0; Sat, 21 Sep 2024 20:22:13 +0200
Date: Sat, 21 Sep 2024 20:23:59 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-terminal: update 3.50.1 ->
 3.54.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <ZRD6KS.CKZZTPZ0EYBQ3@t-online.de>
In-Reply-To: <17F75534D0C73699.21367@lists.openembedded.org>
References: <17F75534D0C73699.21367@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-p04dTE2WODLpc/JzG9F3"
X-TOI-EXPURGATEID: 150726::1726942933-30FEF5A0-83B1A501/0/0 CLEAN NORMAL
X-TOI-MSGID: 7be86d52-14cc-480c-ba02-3e8766d8550c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 18:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112437

--=-p04dTE2WODLpc/JzG9F3
Content-Type: text/plain; charset=us-ascii; format=flowed

A patch failed and had to be removed. I'm quite confused as to why this 
didn't happen in my regular build directory. Apologies for that. Other 
than that, I had no problems building gnome-terminal for musl. Unless 
there is some additional platform dependent issue, this should fix it

On Sat, Sep 21 2024 at 08:19:03 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - drop 0001-meson-add-option-to-set-dbus_interfacedir.patch
>   Issue has been fixed by 
> [<https://gitlab.gnome.org/GNOME/gnome-terminal/-/commit/c1657f9cd62a982722041e5968136c7ba57e51f7>]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-add-option-to-set-dbus_interfacedir.patch | 63 
> -------------------
>  ...nal_3.50.1.bb => gnome-terminal_3.54.0.bb} |  3 +-
>  2 files changed, 1 insertion(+), 65 deletions(-)
>  delete mode 100644 
> meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
>  rename 
> meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.50.1.bb => 
> gnome-terminal_3.54.0.bb} (91%)
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch 
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
> deleted file mode 100644
> index 9f8475bdd..000000000
> --- 
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 61668e1eb86a316d4ad9a6b9cacf8c8cc74a0c33 Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Sun, 7 Jan 2024 10:40:31 +0100
> -Subject: [PATCH] meson: add an option to set dbus_interface_dir
> -
> -Add an option that allows to set the dbus_interface_dir path 
> manually.
> -This will help to cross-compile gnome-terminal on host systems that
> -don't have gnome-shell installed.
> -
> -Upstream-Status: Submitted 
> [<https://gitlab.gnome.org/GNOME/gnome-terminal/-/issues/8046>]
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ----
> - meson_options.txt | 7 +++++++
> - src/meson.build   | 7 ++++++-
> - 2 files changed, 13 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index b555ab66..8fece058 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -13,6 +13,13 @@
> - # You should have received a copy of the GNU General Public License
> - # along with this programme.  If not, see 
> <<https://www.gnu.org/licenses/>>.
> -
> -+option(
> -+  'dbus_interface_dir',
> -+  type: 'string',
> -+  value: '',
> -+  description: 'directory for D-Bus session interface files 
> [$datadir/dbus-1/interfaces]',
> -+)
> -+
> - option(
> -   'dbg',
> -   type: 'boolean',
> -diff --git a/src/meson.build b/src/meson.build
> -index 27ecd893..420ad45c 100644
> ---- a/src/meson.build
> -+++ b/src/meson.build
> -@@ -185,6 +185,11 @@ server_sources = app_sources + 
> client_util_sources + debug_sources + dbus_source
> -
> - if get_option('search_provider')
> -
> -+  dbus_interface_dir = get_option('dbus_interface_dir')
> -+  if dbus_interface_dir == ''
> -+    dbus_interface_dir = gt_prefix / gt_dbusinterfacedir
> -+  endif
> -+
> -   server_sources += files(
> -     'terminal-search-provider.cc',
> -     'terminal-search-provider.hh',
> -@@ -192,7 +197,7 @@ if get_option('search_provider')
> -
> -   server_sources += gnome.gdbus_codegen(
> -     'terminal-search-provider-gdbus-generated',
> --    gt_prefix / gt_dbusinterfacedir / 
> 'org.gnome.ShellSearchProvider2.xml',
> -+    dbus_interface_dir / 'org.gnome.ShellSearchProvider2.xml',
> -     autocleanup: 'none',
> -     install_header: false,
> -     interface_prefix: 'org.gnome.Shell',
> ---
> -2.43.0
> -
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb 
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> similarity index 91%
> rename from 
> meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> rename to 
> meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> index 3bbfe9ece..226c86b47 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> @@ -22,9 +22,8 @@ DEPENDS = " \
>  SRC_URI = " \
>  
> 	git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=https;nobranch=1 
> \
>  	file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch 
> <file://0001-add-w_exitcode-macro-for-non-glibc-systems.patch/> \
> -	file://0001-meson-add-option-to-set-dbus_interfacedir.patch 
> <file://0001-meson-add-option-to-set-dbus_interfacedir.patch/> \
>  "
> -SRCREV = "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
> +SRCREV = "965cb9307713c618253918633416fcad86bcc5d2"
>  S = "${WORKDIR}/git"
> 
>  PACKAGECONFIG ?= ""
> --
> 2.46.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112436): 
> <https://lists.openembedded.org/g/openembedded-devel/message/112436>
> Mute This Topic: <https://lists.openembedded.org/mt/108579942/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-p04dTE2WODLpc/JzG9F3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>A patch failed and had to be removed. I'm quite confused as to why this didn't happen in my regular build directory. Apologies for that. Other than that, I had no problems building gnome-terminal for musl. Unless there is some additional platform dependent issue, this should fix it</div></div><div id="geary-quote" dir="auto"><br>On Sat, Sep 21 2024 at 08:19:03 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- drop 0001-meson-add-option-to-set-dbus_interfacedir.patch
  Issue has been fixed by [<a href="https://gitlab.gnome.org/GNOME/gnome-terminal/-/commit/c1657f9cd62a982722041e5968136c7ba57e51f7">https://gitlab.gnome.org/GNOME/gnome-terminal/-/commit/c1657f9cd62a982722041e5968136c7ba57e51f7</a>]

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...-add-option-to-set-dbus_interfacedir.patch | 63 -------------------
 ...nal_3.50.1.bb =&gt; gnome-terminal_3.54.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.50.1.bb =&gt; gnome-terminal_3.54.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
deleted file mode 100644
index 9f8475bdd..000000000
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfacedir.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 61668e1eb86a316d4ad9a6b9cacf8c8cc74a0c33 Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Sun, 7 Jan 2024 10:40:31 +0100
-Subject: [PATCH] meson: add an option to set dbus_interface_dir
-
-Add an option that allows to set the dbus_interface_dir path manually.
-This will help to cross-compile gnome-terminal on host systems that
-don't have gnome-shell installed.
-
-Upstream-Status: Submitted [<a href="https://gitlab.gnome.org/GNOME/gnome-terminal/-/issues/8046">https://gitlab.gnome.org/GNOME/gnome-terminal/-/issues/8046</a>]
-
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
----
- meson_options.txt | 7 +++++++
- src/meson.build   | 7 ++++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index b555ab66..8fece058 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -13,6 +13,13 @@
- # You should have received a copy of the GNU General Public License
- # along with this programme.  If not, see &lt;<a href="https://www.gnu.org/licenses/">https://www.gnu.org/licenses/</a>&gt;.
- 
-+option(
-+  'dbus_interface_dir',
-+  type: 'string',
-+  value: '',
-+  description: 'directory for D-Bus session interface files [$datadir/dbus-1/interfaces]',
-+)
-+
- option(
-   'dbg',
-   type: 'boolean',
-diff --git a/src/meson.build b/src/meson.build
-index 27ecd893..420ad45c 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -185,6 +185,11 @@ server_sources = app_sources + client_util_sources + debug_sources + dbus_source
- 
- if get_option('search_provider')
- 
-+  dbus_interface_dir = get_option('dbus_interface_dir')
-+  if dbus_interface_dir == ''
-+    dbus_interface_dir = gt_prefix / gt_dbusinterfacedir
-+  endif
-+
-   server_sources += files(
-     'terminal-search-provider.cc',
-     'terminal-search-provider.hh',
-@@ -192,7 +197,7 @@ if get_option('search_provider')
- 
-   server_sources += gnome.gdbus_codegen(
-     'terminal-search-provider-gdbus-generated',
--    gt_prefix / gt_dbusinterfacedir / 'org.gnome.ShellSearchProvider2.xml',
-+    dbus_interface_dir / 'org.gnome.ShellSearchProvider2.xml',
-     autocleanup: 'none',
-     install_header: false,
-     interface_prefix: 'org.gnome.Shell',
--- 
-2.43.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
index 3bbfe9ece..226c86b47 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -22,9 +22,8 @@ DEPENDS = " \
 SRC_URI = " \
 	git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=https;nobranch=1 \
 	<a href="file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch">file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch</a> \
-	<a href="file://0001-meson-add-option-to-set-dbus_interfacedir.patch">file://0001-meson-add-option-to-set-dbus_interfacedir.patch</a> \
 "
-SRCREV = "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
+SRCREV = "965cb9307713c618253918633416fcad86bcc5d2"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= ""
<div>-- 
</div>2.46.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112436): <a href="https://lists.openembedded.org/g/openembedded-devel/message/112436">https://lists.openembedded.org/g/openembedded-devel/message/112436</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/108579942/3618223">https://lists.openembedded.org/mt/108579942/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-p04dTE2WODLpc/JzG9F3--


