Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A417E7AD6C
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 19:38:03 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.142883.1766691479244809190
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 11:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id 380EF38057
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 20:37:57 +0100 (CET)
Received: from [192.168.178.36] ([79.219.239.223]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vYr9l-3Thlbs0; Thu, 25 Dec 2025 20:37:53 +0100
Date: Thu, 25 Dec 2025 20:37:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] gnome-software: fix build with
 flatpak 1.17.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <0VBU7T.HHPVMFA20K6W@t-online.de>
In-Reply-To: <18848C657046DE30.1614991@lists.openembedded.org>
References: <18848C657046DE30.1614991@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ozzgN2ppyGO9uydUfji2"
X-TOI-EXPURGATEID: 150726::1766691473-537D6CAB-EE7EE109/0/0 CLEAN NORMAL
X-TOI-MSGID: d6e7d46b-5d5e-4d58-b762-df04dc8c5dfa
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 19:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122935

--=-ozzgN2ppyGO9uydUfji2
Content-Type: text/plain; charset=us-ascii; format=flowed

I marked the patch as inappropriate because I think upstream may need 
guards to support older Flatpak versions.

On Thu, Dec 25 2025 at 20:34:30 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> fixes:
> ../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not 
> get pkg-config variable and no default provided for 
> <PkgConfigDependency flatpak: True ['>= 1.14.1']>
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-look-for-flatpak-http_backend-varia.patch | 56 
> +++++++++++++++++++
>  .../gnome-software/gnome-software_49.1.bb     |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch 
> b/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch
> new file mode 100644
> index 0000000000..2296b7acd2
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch
> @@ -0,0 +1,56 @@
> +From 4588a3d34f574619c6f3a4290d53e2ac063ab56a Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Thu, 25 Dec 2025 20:04:49 +0100
> +Subject: [PATCH] meson.build: dont look for flatpak http_backend 
> variable
> +
> +flatpak 1.17.1 release dropped libsoup2 support:
> +[<https://github.com/flatpak/flatpak/blob/c324778b0720cb2d01c217fdc70358e232c38b4d/NEWS#L20>]
> +
> +* Drop libsoup2 support in favor of libcurl. The `http_backend` 
> build option has
> +  been dropped as well. (#6395)
> +
> +gnome-software still searches for the http_backend variable and 
> fails:
> + ../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not 
> get pkg-config variable and no default provided for 
> <PkgConfigDependency flatpak: True ['>= 1.14.1']>
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Inappropriate
> +---
> + meson.build | 20 +-------------------
> + 1 file changed, 1 insertion(+), 19 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3704e2abc..7e0496a22 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -212,26 +212,8 @@ if get_option('fwupd')
> + endif
> +
> + if get_option('flatpak')
> +-  flatpak = dependency('flatpak', version : '>= 1.14.1')
> ++  flatpak = dependency('flatpak', version : '>= 1.17.1')
> +   ostree = dependency('ostree-1')
> +-
> +-  flatpak_httpbackend = flatpak.get_variable('httpbackend')
> +-  if flatpak_httpbackend == 'soup'
> +-    flatpak_soupapiversion = flatpak.get_variable('soupapiversion', 
> default_value: '2')
> +-    if flatpak_soupapiversion.version_compare('< 3')
> +-      error('''Flatpak library has been built with 'libsoup2' http 
> backend, which conflicts with 'libsoup3' used by gnome-software.
> +-
> +-You can either:
> +-
> +-1. Build gnome-software without flatpak support (with 
> -Dflatpak=false) or
> +-2. Rebuild flatpak library with http backend other than 
> 'libsoup2'.''')
> +-    else
> +-      flatpak_summary = '@0@ (@1@)'.format(flatpak_httpbackend, 
> flatpak_soupapiversion)
> +-    endif
> +-  else
> +-    flatpak_summary = flatpak_httpbackend
> +-  endif
> +-  summary('Flatpak http backend', '@0@'.format(flatpak_summary), 
> section : 'Misc')
> + endif
> +
> + if get_option('malcontent')
> +--
> +2.52.0
> +
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb 
> b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
> index 14ea91359e..9c441f5b2f 100644
> --- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
> @@ -28,6 +28,7 @@ RDEPENDS:${PN} = "iso-codes"
> 
>  EXTRA_OEMESON += "-Dtests=false"
> 
> +SRC_URI += 
> "file://0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch" 
> <file://0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch/>
>  SRC_URI[archive.sha256sum] = 
> "49dfeca77928801756d0c5386c1d20454ca077600a5d1ed66ec46ee33a32c66d"
> 
>  PACKAGECONFIG ?= "flatpak"
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122933): 
> <https://lists.openembedded.org/g/openembedded-devel/message/122933>
> Mute This Topic: <https://lists.openembedded.org/mt/116943559/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ozzgN2ppyGO9uydUfji2
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I marked the patch as inappropriate because I think upstream may need guards to support older Flatpak versions.</div></div><div id="geary-quote" dir="auto"><br>On Thu, Dec 25 2025 at 20:34:30 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">fixes:
../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not get pkg-config variable and no default provided for &lt;PkgConfigDependency flatpak: True ['&gt;= 1.14.1']&gt;

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...-look-for-flatpak-http_backend-varia.patch | 56 +++++++++++++++++++
 .../gnome-software/gnome-software_49.1.bb     |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch b/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch
new file mode 100644
index 0000000000..2296b7acd2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch
@@ -0,0 +1,56 @@
+From 4588a3d34f574619c6f3a4290d53e2ac063ab56a Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Thu, 25 Dec 2025 20:04:49 +0100
+Subject: [PATCH] meson.build: dont look for flatpak http_backend variable
+
+flatpak 1.17.1 release dropped libsoup2 support:
+[<a href="https://github.com/flatpak/flatpak/blob/c324778b0720cb2d01c217fdc70358e232c38b4d/NEWS#L20">https://github.com/flatpak/flatpak/blob/c324778b0720cb2d01c217fdc70358e232c38b4d/NEWS#L20</a>]
+
+* Drop libsoup2 support in favor of libcurl. The `http_backend` build option has
+  been dropped as well. (#6395)
+
+gnome-software still searches for the http_backend variable and fails:
+ ../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not get pkg-config variable and no default provided for &lt;PkgConfigDependency flatpak: True ['&gt;= 1.14.1']&gt;
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+Upstream-Status: Inappropriate
+---
+ meson.build | 20 +-------------------
+ 1 file changed, 1 insertion(+), 19 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 3704e2abc..7e0496a22 100644
+--- a/meson.build
++++ b/meson.build
+@@ -212,26 +212,8 @@ if get_option('fwupd')
+ endif
+ 
+ if get_option('flatpak')
+-  flatpak = dependency('flatpak', version : '&gt;= 1.14.1')
++  flatpak = dependency('flatpak', version : '&gt;= 1.17.1')
+   ostree = dependency('ostree-1')
+-
+-  flatpak_httpbackend = flatpak.get_variable('httpbackend')
+-  if flatpak_httpbackend == 'soup'
+-    flatpak_soupapiversion = flatpak.get_variable('soupapiversion', default_value: '2')
+-    if flatpak_soupapiversion.version_compare('&lt; 3')
+-      error('''Flatpak library has been built with 'libsoup2' http backend, which conflicts with 'libsoup3' used by gnome-software.
+-
+-You can either:
+-
+-1. Build gnome-software without flatpak support (with -Dflatpak=false) or
+-2. Rebuild flatpak library with http backend other than 'libsoup2'.''')
+-    else
+-      flatpak_summary = '@0@ (@1@)'.format(flatpak_httpbackend, flatpak_soupapiversion)
+-    endif
+-  else
+-    flatpak_summary = flatpak_httpbackend
+-  endif
+-  summary('Flatpak http backend', '@0@'.format(flatpak_summary), section : 'Misc')
+ endif
+ 
+ if get_option('malcontent')
+-- 
+2.52.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
index 14ea91359e..9c441f5b2f 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
@@ -28,6 +28,7 @@ RDEPENDS:${PN} = "iso-codes"
 
 EXTRA_OEMESON += "-Dtests=false"
 
+SRC_URI += "<a href="file://0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch" "="">file://0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch"</a>
 SRC_URI[archive.sha256sum] = "49dfeca77928801756d0c5386c1d20454ca077600a5d1ed66ec46ee33a32c66d"
 
 PACKAGECONFIG ?= "flatpak"
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#122933): <a href="https://lists.openembedded.org/g/openembedded-devel/message/122933">https://lists.openembedded.org/g/openembedded-devel/message/122933</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/116943559/3618223">https://lists.openembedded.org/mt/116943559/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ozzgN2ppyGO9uydUfji2--


