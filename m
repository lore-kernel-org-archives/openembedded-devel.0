Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0015CC4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 06:32:13 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.91695.1671863532735135263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Dec 2022 22:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 03D3F2851
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 07:32:11 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.233]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p8y4m-0C69Q00; Sat, 24 Dec 2022 07:32:08 +0100
Date: Sat, 24 Dec 2022 07:32:03 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv3] appstream: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <F5UDNR.C15HGL7QXRS13@t-online.de>
In-Reply-To: <20221224063027.30255-1-f_l_k@t-online.de>
References: <20221224063027.30255-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8I2478Y91ixBqCU9S+pH"
X-TOI-EXPURGATEID: 150726::1671863529-69DEC991-3A6AA1DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 08a28ac0-8a6e-4b80-9633-aa8eb1d6129e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 06:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100205

--=-8I2478Y91ixBqCU9S+pH
Content-Type: text/plain; charset=us-ascii; format=flowed

switched to use appstream-native instead of expecting to have 
appstreamcli installed on the host machine

Am Sa, 24. Dez 2022 um 07:30:27 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../appstream/0001-fix-crosscompile.patch     | 43 ++++++++++++++++++
>  .../appstream/appstream_0.15.5.bb             | 45 
> +++++++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 
> meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
>  create mode 100644 
> meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> 
> diff --git 
> a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch 
> b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> new file mode 100644
> index 000000000..fe8dcff91
> --- /dev/null
> +++ 
> b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> @@ -0,0 +1,43 @@
> +From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 12 Dec 2022 15:42:42 +0100
> +Subject: [PATCH] fix crosscompile
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + data/meson.build  | 2 +-
> + meson.build       | 2 +-
> + tools/meson.build | 9 +++++++++
> + 3 files changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index aea0cb25..1a085fc9 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
> + metainfo_with_relinfo = custom_target('gen-output',
> +     input : ['../NEWS', 
> 'org.freedesktop.appstream.cli.metainfo.xml'],
> +     output : 
> ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainfo.xml'],
> +-    command : [ascli_exe, 'news-to-metainfo', '--limit=6', 
> '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> ++    command : ['appstreamcli', 'news-to-metainfo', '--limit=6', 
> '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> + )
> +
> + metainfo_i18n = i18n.itstool_join(
> +diff --git a/meson.build b/meson.build
> +index fd0e3373..2f273ada 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -124,7 +124,7 @@ if get_option ('gir')
> +     dependency('gobject-introspection-1.0', version: '>=1.56')
> + endif
> +
> +-stemmer_inc_dirs = include_directories(['/usr/include'])
> ++stemmer_inc_dirs = include_directories([''])
> + if get_option('stemming')
> +     stemmer_lib = cc.find_library('stemmer', required: true)
> +     if not cc.has_header('libstemmer.h')
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb 
> b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> new file mode 100644
> index 000000000..80f487852
> --- /dev/null
> +++ b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> @@ -0,0 +1,45 @@
> +SUMMARY = "AppStream is a collaborative effort for making 
> machine-readable software metadata easily available."
> +HOMEPAGE = "<https://github.com/ximion/appstream>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da" 
> <file://copying;md5=435ed639f84d4585d93824e7da3d85da/>
> +
> +DEPENDS = " \
> +    appstream-native \
> +    curl-native \
> +    curl \
> +    docbook-xml-dtd4-native \
> +    gperf-native \
> +    glib-2.0 \
> +    glib-2.0-native \
> +    libyaml \
> +    libstemmer \
> +    libxml2 \
> +    libxmlb \
> +    libxslt-native \
> +    itstool-native \
> +    docbook-xsl-stylesheets-native \
> +    python3-pygments-native \
> +"
> +
> +inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
> +
> +GIR_MESON_OPTION = ""
> +
> +SRC_URI = 
> "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz 
> <https://www.freedesktop.org/software/appstream/releases/AppStream-$%7BPV%7D.tar.xz>"
> +SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch" 
> <file://0001-fix-crosscompile.patch/>
> +SRC_URI[sha256sum] = 
> "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc55e70a25500e04c2"
> +
> +S = "${WORKDIR}/AppStream-${PV}"
> +
> +FILES:${PN} += "${datadir}"
> +
> +EXTRA_OEMESON:class-target += 
> "--cross-file=${WORKDIR}/meson-${PN}.cross"
> +
> +do_write_config:append:class-target() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +appstreamcli = '${STAGING_BINDIR_NATIVE}/appstreamcli'
> +EOF
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.34.1
> 


--=-8I2478Y91ixBqCU9S+pH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>switched to use appstream-native instead of expecting to have appstreamcli installed on the host machine</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 24. Dez 2022 um 07:30:27 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../appstream/0001-fix-crosscompile.patch     | 43 ++++++++++++++++++
 .../appstream/appstream_0.15.5.bb             | 45 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream_0.15.5.bb

diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
new file mode 100644
index 000000000..fe8dcff91
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
@@ -0,0 +1,43 @@
+From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 12 Dec 2022 15:42:42 +0100
+Subject: [PATCH] fix crosscompile
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ data/meson.build  | 2 +-
+ meson.build       | 2 +-
+ tools/meson.build | 9 +++++++++
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index aea0cb25..1a085fc9 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
+ metainfo_with_relinfo = custom_target('gen-output',
+     input : ['../NEWS', 'org.freedesktop.appstream.cli.metainfo.xml'],
+     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainfo.xml'],
+-    command : [ascli_exe, 'news-to-metainfo', '--limit=6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
++    command : ['appstreamcli', 'news-to-metainfo', '--limit=6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
+ )
+ 
+ metainfo_i18n = i18n.itstool_join(
+diff --git a/meson.build b/meson.build
+index fd0e3373..2f273ada 100644
+--- a/meson.build
++++ b/meson.build
+@@ -124,7 +124,7 @@ if get_option ('gir')
+     dependency('gobject-introspection-1.0', version: '&gt;=1.56')
+ endif
+ 
+-stemmer_inc_dirs = include_directories(['/usr/include'])
++stemmer_inc_dirs = include_directories([''])
+ if get_option('stemming')
+     stemmer_lib = cc.find_library('stemmer', required: true)
+     if not cc.has_header('libstemmer.h')
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
new file mode 100644
index 000000000..80f487852
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
@@ -0,0 +1,45 @@
+SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
+HOMEPAGE = "<a href="https://github.com/ximion/appstream">https://github.com/ximion/appstream</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=435ed639f84d4585d93824e7da3d85da" "="">file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"</a>
+
+DEPENDS = " \
+    appstream-native \
+    curl-native \
+    curl \
+    docbook-xml-dtd4-native \
+    gperf-native \
+    glib-2.0 \
+    glib-2.0-native \
+    libyaml \
+    libstemmer \
+    libxml2 \
+    libxmlb \
+    libxslt-native \
+    itstool-native \
+    docbook-xsl-stylesheets-native \
+    python3-pygments-native \
+"
+
+inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
+
+GIR_MESON_OPTION = ""
+
+SRC_URI = "<a href="https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz">https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz</a>"
+SRC_URI:append:class-target = " <a href="file://0001-fix-crosscompile.patch" "="">file://0001-fix-crosscompile.patch"</a>
+SRC_URI[sha256sum] = "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc55e70a25500e04c2"
+
+S = "${WORKDIR}/AppStream-${PV}"
+
+FILES:${PN} += "${datadir}"
+
+EXTRA_OEMESON:class-target += "--cross-file=${WORKDIR}/meson-${PN}.cross"
+
+do_write_config:append:class-target() {
+    cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
+[binaries]
+appstreamcli = '${STAGING_BINDIR_NATIVE}/appstreamcli'
+EOF
+}
+
+BBCLASSEXTEND = "native"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-8I2478Y91ixBqCU9S+pH--


