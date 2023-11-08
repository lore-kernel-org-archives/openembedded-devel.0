Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFA7C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 08:15:35 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.9192.1699431326513122354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 00:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 9C4C65BC9E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Nov 2023 09:15:24 +0100 (CET)
Received: from [192.168.178.62] ([84.163.33.167]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0dib-0V8NKS0; Wed, 8 Nov 2023 09:15:21 +0100
Date: Wed, 08 Nov 2023 09:15:50 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][RFC][PATCHv4] Adjust vala build according to
 changes in vala.bbclass
To: openembedded-devel@lists.openembedded.org
Message-Id: <EMPS3S.HNZVXOSMU48Y2@t-online.de>
In-Reply-To: <179597B45773DA5B.15940@lists.openembedded.org>
References: <179597B45773DA5B.15940@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-b4Driw4oNP38BrTwL4GX"
X-TOI-EXPURGATEID: 150726::1699431321-F37FDD75-8542C305/0/0 CLEAN NORMAL
X-TOI-MSGID: 0d6aedd1-b39a-4d05-825e-5c387fa1cad1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 08:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106469

--=-b4Driw4oNP38BrTwL4GX
Content-Type: text/plain; charset=us-ascii; format=flowed

fix build for babl and gegl

On Wed, Nov 8 2023 at 09:14:19 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb             | 1 +
>  meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb      | 3 +++
>  meta-gnome/recipes-gimp/babl/babl_0.1.106.bb                  | 1 +
>  meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb                   | 3 ++-
>  meta-gnome/recipes-gnome/gedit/gedit_46.1.bb                  | 2 +-
>  meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb                    | 2 +-
>  .../recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb | 1 +
>  meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb               | 2 ++
>  meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb    | 1 +
>  meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                   | 2 --
>  meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb      | 1 +
>  .../libcloudproviders/libcloudproviders_0.3.4.bb              | 1 +
>  meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb                      | 3 +++
>  meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb         | 4 
> +++-
>  14 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git 
> a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb 
> b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
> index f2aeb8878..fc1235109 100644
> --- 
> a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
> +++ 
> b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
> @@ -33,6 +33,7 @@ inherit gnomebase gsettings pkgconfig mime-xdg 
> gtk-icon-cache gobject-introspect
>  SRC_URI[archive.sha256sum] = 
> "cc63080eefa147a8472ab1a5ff087b97a27ab723a4ee005ed41e8c9dd7798e41"
> 
>  GIR_MESON_OPTION = ""
> +VALA_MESON_OPTION = ""
> 
>  FILES:${PN} += "${datadir}"
> 
> diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb 
> b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
> index 36eb8ca19..8737b6d7e 100644
> --- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
> +++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
> @@ -15,6 +15,9 @@ DEPENDS = " \
>  GNOMEBASEBUILDCLASS = "meson"
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>  GIR_MESON_OPTION = ""
> +VALA_MESON_OPTION = "with-vala"
> +VALA_MESON_ENABLE_FLAG ?= 'enabled'
> +VALA_MESON_DISABLE_FLAG ?= 'disabled'
> 
>  PACKAGECONFIG[pulseaudio] = 
> "-Dpulseaudio=enabled,-Dpulseaudio=disabled,pulseaudio"
>  PACKAGECONFIG[sasl] = "-Dsasl=enabled,-Dsasl=disabled,cyrus-sasl"
> diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb 
> b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
> index 5a5f4f5e7..5d656adb0 100644
> --- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
> +++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
>  GNOMEBASEBUILDCLASS = "meson"
> 
>  GIR_MESON_OPTION = "enable-gir"
> +VALA_MESON_OPTION = "enable-vapi"
> 
>  inherit setuptools3 gnomebase gobject-introspection vala
> 
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb 
> b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
> index 3a9478785..e123e1244 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
> @@ -18,8 +18,9 @@ DEPENDS:remove:toolchain-clang:riscv32  = "openmp"
>  DEPENDS:remove:toolchain-clang:powerpc  = "openmp"
> 
>  GNOMEBASEBUILDCLASS = "meson"
> +VALA_MESON_OPTION = ""
> 
> -inherit features_check gnomebase vala gobject-introspection
> +inherit features_check gnomebase gobject-introspection vala
> 
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> 
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb 
> b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> index 01d7a072a..0014b512a 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> @@ -19,7 +19,7 @@ DEPENDS = " \
>      tepl \
>  "
> 
> -inherit gnomebase gsettings itstool gnome-help gobject-introspection 
> gtk-doc vala gettext features_check mime-xdg gtk-icon-cache 
> python3targetconfig
> +inherit gnomebase gsettings itstool gnome-help gobject-introspection 
> gtk-doc gettext features_check mime-xdg gtk-icon-cache 
> python3targetconfig
> 
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb 
> b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
> index 0af9f5600..e91fa1bc6 100644
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
> @@ -6,7 +6,7 @@ GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = "mozjs-115 cairo"
> 
> -inherit gnomebase gsettings gobject-introspection vala gettext 
> features_check upstream-version-is-even pkgconfig
> +inherit gnomebase gsettings gobject-introspection gettext 
> features_check upstream-version-is-even pkgconfig
> 
>  SRC_URI[archive.sha256sum] = 
> "fbaa20e0917668830800f92951688f9fc08f01296affd5cdb4b35f750be27dc9"
>  SRC_URI += " \
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb 
> b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
> index cde2e1d3c..3482f76a5 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
> @@ -18,6 +18,7 @@ DEPENDS = " \
>  GIR_MESON_OPTION = 'disable-introspection'
>  GIR_MESON_ENABLE_FLAG = 'false'
>  GIR_MESON_DISABLE_FLAG = 'true'
> +VALA_MESON_OPTION = ''
> 
>  GNOMEBASEBUILDCLASS = "meson"
>  GTKIC_VERSION = '4'
> diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb 
> b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> index bdef603f0..d01067eb1 100644
> --- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> +++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> @@ -9,6 +9,8 @@ DEPENDS = " \
> 
>  GNOMEBASEBUILDCLASS = "meson"
> 
> +VALA_MESON_OPTION = "enable_vala"
> +
>  inherit gnomebase gettext gobject-introspection vala
> 
>  SRC_URI[archive.sha256sum] = 
> "ca2d039e1ebd148647017a7f548862350bc9af01986d39f10cfdc8e95f07881a"
> diff --git 
> a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb 
> b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
> index 81ae8317d..06353efab 100644
> --- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
> +++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
> @@ -15,6 +15,7 @@ SRC_URI += 
> "file://0001-Allow-building-gir-in-cross-environments.patch"
>  SRC_URI[archive.sha256sum] = 
> "366e866ff2a708b894cfea9475b8e8ff54cb3e2b477ea72a8ade0dabee5f48a4"
> 
>  GTKDOC_MESON_OPTION = "gtk_doc"
> +VALA_MESON_OPTION = "enable_vala"
> 
>  DEPENDS = " \
>      geocode-glib \
> diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb 
> b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> index 3a81a58f6..e46cbfc69 100644
> --- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> +++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> @@ -17,8 +17,6 @@ DEPENDS = " \
> 
>  inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
> 
> -EXTRA_OEMESON = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-Dvapi=true', '-Dvapi=false', d)}"
> -
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
>  PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb 
> b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
> index a0a41d7f8..426082bd5 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
> @@ -25,6 +25,7 @@ SRC_URI[archive.sha256sum] = 
> "0ad722f3d532c21d757cf488f942960679ea8f457925efa976
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>  GIR_MESON_OPTION = ""
> +VALA_MESON_OPTION = ""
> 
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("LICENSE_FLAGS_ACCEPTED", "commercial", 
> "ffmpeg", "", d)} \
> diff --git 
> a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb 
> b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
> index 36089238f..21fe4d119 100644
> --- 
> a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
> +++ 
> b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
> @@ -3,6 +3,7 @@ LICENSE="LGPL-3.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02" 
> <file://license;md5=e6a600fd5e1d9cbde2d983680233ad02/>
> 
>  GNOMEBASEBUILDCLASS = "meson"
> +VALA_MESON_OPTION ?= 'vapigen'
> 
>  DEPENDS = "glib-2.0"
> 
> diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb 
> b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
> index ba5660a5e..a5bb868bb 100644
> --- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
> +++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
> @@ -17,6 +17,8 @@ CFLAGS += "-D_GNU_SOURCE"
> 
>  GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
> +VALA_MESON_OPTION ?= ''
> +
>  inherit gnomebase gtk-icon-cache gi-docgen features_check 
> upstream-version-is-even vala gobject-introspection gettext mime 
> mime-xdg
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
> 
> @@ -39,6 +41,7 @@ PACKAGECONFIG[systemd] = 
> "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
>  FILES:${PN} += " \
>      ${datadir}/dbus-1 \
>      ${datadir}/gcr-3 \
> +    ${datadir}/vala \
>      ${systemd_user_unitdir}/gcr-ssh-agent.socket \
>      ${systemd_user_unitdir}/gcr-ssh-agent.service \
>  "
> diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb 
> b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
> index 16e0cf8f7..ca6f9ba3f 100644
> --- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
> +++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
> @@ -18,6 +18,9 @@ inherit meson pkgconfig gtk-doc 
> gobject-introspection vala
> 
>  DEPENDS = "glib-2.0 libsoup libxslt"
> 
> +VALA_MESON_OPTION = 'enable-vala'
> +VALA_MESON_ENABLE_FLAG = 'enabled'
> +VALA_MESON_DISABLE_FLAG = 'disabled'
>  GIR_MESON_OPTION = "enable-introspection"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> @@ -26,7 +29,6 @@ GTKDOC_MESON_OPTION = "enable-gtk-doc"
>  EXTRA_OEMESON += " \
>  	-Dwith-pci-ids-path=${datadir}/pci.ids \
>  	-Dwith-usb-ids-path=${datadir}/usb.ids \
> -	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-Denable-vala=enabled', '-Denable-vala=disabled', d)} \
>  "
> 
>  RDEPENDS:${PN} = "pciutils-ids usbids"
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106468): 
> <https://lists.openembedded.org/g/openembedded-devel/message/106468>
> Mute This Topic: <https://lists.openembedded.org/mt/102460127/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-b4Driw4oNP38BrTwL4GX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>fix build for babl and gegl</div></div><div id="geary-quote" dir="auto"><br>On Wed, Nov 8 2023 at 09:14:19 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb             | 1 +
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb      | 3 +++
 meta-gnome/recipes-gimp/babl/babl_0.1.106.bb                  | 1 +
 meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb                   | 3 ++-
 meta-gnome/recipes-gnome/gedit/gedit_46.1.bb                  | 2 +-
 meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb                    | 2 +-
 .../recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb | 1 +
 meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb               | 2 ++
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb    | 1 +
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                   | 2 --
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb      | 1 +
 .../libcloudproviders/libcloudproviders_0.3.4.bb              | 1 +
 meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb                      | 3 +++
 meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb         | 4 +++-
 14 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
index f2aeb8878..fc1235109 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
@@ -33,6 +33,7 @@ inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-introspect
 SRC_URI[archive.sha256sum] = "cc63080eefa147a8472ab1a5ff087b97a27ab723a4ee005ed41e8c9dd7798e41"
 
 GIR_MESON_OPTION = ""
+VALA_MESON_OPTION = ""
 
 FILES:${PN} += "${datadir}"
 
diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
index 36eb8ca19..8737b6d7e 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
@@ -15,6 +15,9 @@ DEPENDS = " \
 GNOMEBASEBUILDCLASS = "meson"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
+VALA_MESON_OPTION = "with-vala"
+VALA_MESON_ENABLE_FLAG ?= 'enabled'
+VALA_MESON_DISABLE_FLAG ?= 'disabled'
 
 PACKAGECONFIG[pulseaudio] = "-Dpulseaudio=enabled,-Dpulseaudio=disabled,pulseaudio"
 PACKAGECONFIG[sasl] = "-Dsasl=enabled,-Dsasl=disabled,cyrus-sasl"
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
index 5a5f4f5e7..5d656adb0 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 GNOMEBASEBUILDCLASS = "meson"
 
 GIR_MESON_OPTION = "enable-gir"
+VALA_MESON_OPTION = "enable-vapi"
 
 inherit setuptools3 gnomebase gobject-introspection vala
 
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
index 3a9478785..e123e1244 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
@@ -18,8 +18,9 @@ DEPENDS:remove:toolchain-clang:riscv32  = "openmp"
 DEPENDS:remove:toolchain-clang:powerpc  = "openmp"
 
 GNOMEBASEBUILDCLASS = "meson"
+VALA_MESON_OPTION = ""
 
-inherit features_check gnomebase vala gobject-introspection
+inherit features_check gnomebase gobject-introspection vala 
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
index 01d7a072a..0014b512a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     tepl \
 "
 
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check mime-xdg gtk-icon-cache python3targetconfig
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc gettext features_check mime-xdg gtk-icon-cache python3targetconfig
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
index 0af9f5600..e91fa1bc6 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
@@ -6,7 +6,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = "mozjs-115 cairo"
 
-inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
+inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
 SRC_URI[archive.sha256sum] = "fbaa20e0917668830800f92951688f9fc08f01296affd5cdb4b35f750be27dc9"
 SRC_URI += " \
diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
index cde2e1d3c..3482f76a5 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
@@ -18,6 +18,7 @@ DEPENDS = " \
 GIR_MESON_OPTION = 'disable-introspection'
 GIR_MESON_ENABLE_FLAG = 'false'
 GIR_MESON_DISABLE_FLAG = 'true'
+VALA_MESON_OPTION = ''
 
 GNOMEBASEBUILDCLASS = "meson"
 GTKIC_VERSION = '4'
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
index bdef603f0..d01067eb1 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
@@ -9,6 +9,8 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
+VALA_MESON_OPTION = "enable_vala"
+
 inherit gnomebase gettext gobject-introspection vala
 
 SRC_URI[archive.sha256sum] = "ca2d039e1ebd148647017a7f548862350bc9af01986d39f10cfdc8e95f07881a"
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
index 81ae8317d..06353efab 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://0001-Allow-building-gir-in-cross-environments.patch"
 SRC_URI[archive.sha256sum] = "366e866ff2a708b894cfea9475b8e8ff54cb3e2b477ea72a8ade0dabee5f48a4"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
+VALA_MESON_OPTION = "enable_vala"
 
 DEPENDS = " \
     geocode-glib \
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index 3a81a58f6..e46cbfc69 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -17,8 +17,6 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
 
-EXTRA_OEMESON = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
-
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
index a0a41d7f8..426082bd5 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
@@ -25,6 +25,7 @@ SRC_URI[archive.sha256sum] = "0ad722f3d532c21d757cf488f942960679ea8f457925efa976
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
+VALA_MESON_OPTION = ""
 
 PACKAGECONFIG ??= " \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("LICENSE_FLAGS_ACCEPTED", "commercial", "ffmpeg", "", d)} \
diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
index 36089238f..21fe4d119 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
@@ -3,6 +3,7 @@ LICENSE="LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02" "="">file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"</a>
 
 GNOMEBASEBUILDCLASS = "meson"
+VALA_MESON_OPTION ?= 'vapigen'
 
 DEPENDS = "glib-2.0"
 
diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
index ba5660a5e..a5bb868bb 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
@@ -17,6 +17,8 @@ CFLAGS += "-D_GNU_SOURCE"
 
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
+VALA_MESON_OPTION ?= ''
+
 inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P&lt;pver&gt;3.(?!9\d+)\d+(\.\d+)+)\.tar"
 
@@ -39,6 +41,7 @@ PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
+    ${datadir}/vala \
     ${systemd_user_unitdir}/gcr-ssh-agent.socket \
     ${systemd_user_unitdir}/gcr-ssh-agent.service \
 "
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
index 16e0cf8f7..ca6f9ba3f 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
@@ -18,6 +18,9 @@ inherit meson pkgconfig gtk-doc gobject-introspection vala
 
 DEPENDS = "glib-2.0 libsoup libxslt"
 
+VALA_MESON_OPTION = 'enable-vala'
+VALA_MESON_ENABLE_FLAG = 'enabled'
+VALA_MESON_DISABLE_FLAG = 'disabled'
 GIR_MESON_OPTION = "enable-introspection"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
@@ -26,7 +29,6 @@ GTKDOC_MESON_OPTION = "enable-gtk-doc"
 EXTRA_OEMESON += " \
 	-Dwith-pci-ids-path=${datadir}/pci.ids \
 	-Dwith-usb-ids-path=${datadir}/usb.ids \
-	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-Denable-vala=enabled', '-Denable-vala=disabled', d)} \
 "
 
 RDEPENDS:${PN} = "pciutils-ids usbids"
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106468): <a href="https://lists.openembedded.org/g/openembedded-devel/message/106468">https://lists.openembedded.org/g/openembedded-devel/message/106468</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102460127/3618223">https://lists.openembedded.org/mt/102460127/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-b4Driw4oNP38BrTwL4GX--


