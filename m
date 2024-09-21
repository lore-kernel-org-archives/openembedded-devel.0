Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809C0CF9C5B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 16:24:55 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.12390.1726935892290922469
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 09:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 9385530436;
	Sat, 21 Sep 2024 18:24:49 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.36.251]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss2uc-2RjQAa0; Sat, 21 Sep 2024 18:24:46 +0200
Date: Sat, 21 Sep 2024 18:26:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] evolution-data-server: update
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <AC86KS.33DT96U8HTVF3@t-online.de>
In-Reply-To: <17F74EDF351E2892.17652@lists.openembedded.org>
References: <17F74EDF351E2892.17652@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tEAVRnlRB6k9iQTAAO94"
X-TOI-EXPURGATEID: 150726::1726935886-27FFD47E-C40A999A/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b1ac7d2-3844-429f-8403-9c9d7e3a088e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 16:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112435

--=-tEAVRnlRB6k9iQTAAO94
Content-Type: text/plain; charset=us-ascii; format=flowed

Removes some unneeded entries from EXTRA_OECMAKE. No need to add them. 
The  issue is fixed by patch

On Sat, Sep 21 2024 at 06:23:24 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - Add cairo dependency
> - Allow to work with gtk3
> - Add patch to avoid pulling in a found
>   google-id. It fails and would probably also
>   break reproducibility
> - inherit mime-xdg
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ---
>  .../evolution-data-server.bb                  | 11 +++---
>  .../evolution-data-server.inc                 |  4 +-
>  ...txt-dont-create-automatic-google-log.patch | 39 
> +++++++++++++++++++
>  3 files changed, 47 insertions(+), 7 deletions(-)
>  create mode 100644 
> meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch
> 
> diff --git 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> index fc1925314..384484e0d 100644
> --- 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> +++ 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> @@ -1,12 +1,12 @@
>  require ${BPN}.inc
> 
>  DEPENDS = " \
> -    ${BPN}-native gperf-native \
> -    glib-2.0 json-glib gtk4 libxml2 icu \
> -    dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
> +    ${BPN}-native cairo gperf-native \
> +    glib-2.0 json-glib gtk+3 gtk4 libxml2 icu \
> +    dbus db virtual/libiconv zlib libsoup nspr libical nss libsecret 
> \
>  "
> 
> -inherit pkgconfig gsettings gobject-introspection features_check 
> gtk-doc gettext perlnative vala
> +inherit pkgconfig gsettings gobject-introspection mime-xdg 
> features_check gtk-doc gettext perlnative vala
> 
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES = "opengl"
> @@ -17,6 +17,7 @@ SRC_URI += " \
>      
> file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch 
> <file://0002-cmakelists.txt-remove-check_c_source_runs-check.patch/> \
>      
> file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch 
> <file://0003-contact-replace-the-novell-sample-contact-with-somet.patch/> 
> \
>      file://0004-call-native-helpers.patch 
> <file://0004-call-native-helpers.patch/> \
> +    
> file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch 
> <file://0001-data-cmakelists.txt-dont-create-automatic-google-log.patch/> 
> \
>      file://iconv-detect.h <file://iconv-detect.h/> \
>  "
> 
> @@ -42,7 +43,7 @@ EXTRA_OECMAKE:append:class-target = " 
> -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scan
>  PACKAGECONFIG ?= "goa oauth"
> 
>  PACKAGECONFIG[canberra] = 
> "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
> -PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK4=ON 
> -DENABLE_OAUTH2_WEBKITGTK=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF 
> -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
> +PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK4=ON 
> -DENABLE_OAUTH2_WEBKITGTK=ON,-DENABLE_OAUTH2_WEBKITGTK4=OFF 
> -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
>  PACKAGECONFIG[goa]    = 
> "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
>  PACKAGECONFIG[kerberos]    = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
>  # BROKEN: due missing pkg-config in openldap eds' cmake finds 
> host-libs when
> diff --git 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> index 33190c461..340c63998 100644
> --- 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> +++ 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> @@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
>  GNOMEBASEBUILDCLASS = "cmake"
>  inherit gnomebase upstream-version-is-even
> 
> -SRC_URI[archive.sha256sum] = 
> "91f4ffc38a1b8d2fe8939834449ac541c0bff4a39b444edc2a9529344a28e98a"
> -PV = "3.50.1"
> +SRC_URI[archive.sha256sum] = 
> "a54b47b977a97030f738a412f4f5d5b2efbef5e0ebe8929b7cce00ac54681084"
> +PV = "3.54.0"
> diff --git 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch
> new file mode 100644
> index 000000000..d23eb8b6e
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch
> @@ -0,0 +1,39 @@
> +From 9b949bd47ed9e5596a9d37c60aa947def9c41db9 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Sun, 15 Sep 2024 22:31:49 +0200
> +Subject: [PATCH] data/CMakeLists.txt: dont create automatic google 
> login
> +
> +Inappropriate for cross-compiling
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +---
> + data/CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/data/CMakeLists.txt b/data/CMakeLists.txt
> +index 8fa642909..bb1b0c4da 100644
> +--- a/data/CMakeLists.txt
> ++++ b/data/CMakeLists.txt
> +@@ -29,7 +29,7 @@ add_icon_cache_files("${SHARE_INSTALL_PREFIX}" 
> alarm_notify_icon)
> + # ********************************
> +
> + set(OAUTH2_SCHEMES "x-scheme-handler/eds-oauth2;")
> +-if(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
> ++if(0)
> + 	set(CMAKE_REQUIRED_DEFINITIONS ${DATA_SERVER_CFLAGS})
> + 	set(CMAKE_REQUIRED_INCLUDES ${CMAKE_BINARY_DIR} 
> ${DATA_SERVER_INCLUDE_DIRS})
> + 	set(CMAKE_REQUIRED_LIBRARIES ${DATA_SERVER_LDFLAGS})
> +@@ -50,7 +50,7 @@ if(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
> + 		set(OAUTH2_SCHEMES 
> "x-scheme-handler/${_google_oauth2_scheme};${OAUTH2_SCHEMES}")
> + 	endif(NOT _google_oauth2_scheme STREQUAL "")
> + 	unset(_google_oauth2_scheme)
> +-endif(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
> ++endif(0)
> +
> + 
> configure_file(org.gnome.evolution-data-server.OAuth2-handler.desktop.in
> + 	org.gnome.evolution-data-server.OAuth2-handler.desktop.in
> +--
> +2.46.0
> +
> --
> 2.46.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112434): 
> <https://lists.openembedded.org/g/openembedded-devel/message/112434>
> Mute This Topic: <https://lists.openembedded.org/mt/108578006/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-tEAVRnlRB6k9iQTAAO94
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Removes some unneeded entries from EXTRA_OECMAKE. No need to add them. The &nbsp;issue is fixed by patch</div></div><div id="geary-quote" dir="auto"><br>On Sat, Sep 21 2024 at 06:23:24 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Add cairo dependency
- Allow to work with gtk3
- Add patch to avoid pulling in a found
  google-id. It fails and would probably also
  break reproducibility
- inherit mime-xdg

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
---
 .../evolution-data-server.bb                  | 11 +++---
 .../evolution-data-server.inc                 |  4 +-
 ...txt-dont-create-automatic-google-log.patch | 39 +++++++++++++++++++
 3 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index fc1925314..384484e0d 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -1,12 +1,12 @@
 require ${BPN}.inc
 
 DEPENDS = " \
-    ${BPN}-native gperf-native \
-    glib-2.0 json-glib gtk4 libxml2 icu \
-    dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
+    ${BPN}-native cairo gperf-native \
+    glib-2.0 json-glib gtk+3 gtk4 libxml2 icu \
+    dbus db virtual/libiconv zlib libsoup nspr libical nss libsecret \
 "
 
-inherit pkgconfig gsettings gobject-introspection features_check gtk-doc gettext perlnative vala
+inherit pkgconfig gsettings gobject-introspection mime-xdg features_check gtk-doc gettext perlnative vala
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
@@ -17,6 +17,7 @@ SRC_URI += " \
     <a href="file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch">file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch</a> \
     <a href="file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch">file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch</a> \
     <a href="file://0004-call-native-helpers.patch">file://0004-call-native-helpers.patch</a> \
+    <a href="file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch">file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch</a> \
     <a href="file://iconv-detect.h">file://iconv-detect.h</a> \
 "
 
@@ -42,7 +43,7 @@ EXTRA_OECMAKE:append:class-target = " -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scan
 PACKAGECONFIG ?= "goa oauth"
 
 PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
-PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK4=ON -DENABLE_OAUTH2_WEBKITGTK=OFF,-DENABLE_OAUTH2_WEBKITGTK4=OFF -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
+PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2_WEBKITGTK4=ON -DENABLE_OAUTH2_WEBKITGTK=ON,-DENABLE_OAUTH2_WEBKITGTK4=OFF -DENABLE_OAUTH2_WEBKITGTK=OFF,webkitgtk json-glib"
 PACKAGECONFIG[goa]    = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
 PACKAGECONFIG[kerberos]    = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs when
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 33190c461..340c63998 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "91f4ffc38a1b8d2fe8939834449ac541c0bff4a39b444edc2a9529344a28e98a"
-PV = "3.50.1"
+SRC_URI[archive.sha256sum] = "a54b47b977a97030f738a412f4f5d5b2efbef5e0ebe8929b7cce00ac54681084"
+PV = "3.54.0"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch
new file mode 100644
index 000000000..d23eb8b6e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch
@@ -0,0 +1,39 @@
+From 9b949bd47ed9e5596a9d37c60aa947def9c41db9 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Sun, 15 Sep 2024 22:31:49 +0200
+Subject: [PATCH] data/CMakeLists.txt: dont create automatic google login
+
+Inappropriate for cross-compiling
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+---
+ data/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/data/CMakeLists.txt b/data/CMakeLists.txt
+index 8fa642909..bb1b0c4da 100644
+--- a/data/CMakeLists.txt
++++ b/data/CMakeLists.txt
+@@ -29,7 +29,7 @@ add_icon_cache_files("${SHARE_INSTALL_PREFIX}" alarm_notify_icon)
+ # ********************************
+ 
+ set(OAUTH2_SCHEMES "x-scheme-handler/eds-oauth2;")
+-if(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
++if(0)
+ 	set(CMAKE_REQUIRED_DEFINITIONS ${DATA_SERVER_CFLAGS})
+ 	set(CMAKE_REQUIRED_INCLUDES ${CMAKE_BINARY_DIR} ${DATA_SERVER_INCLUDE_DIRS})
+ 	set(CMAKE_REQUIRED_LIBRARIES ${DATA_SERVER_LDFLAGS})
+@@ -50,7 +50,7 @@ if(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
+ 		set(OAUTH2_SCHEMES "x-scheme-handler/${_google_oauth2_scheme};${OAUTH2_SCHEMES}")
+ 	endif(NOT _google_oauth2_scheme STREQUAL "")
+ 	unset(_google_oauth2_scheme)
+-endif(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
++endif(0)
+ 
+ configure_file(org.gnome.evolution-data-server.OAuth2-handler.desktop.in
+ 	org.gnome.evolution-data-server.OAuth2-handler.desktop.in
+-- 
+2.46.0
+
<div>-- 
</div>2.46.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112434): <a href="https://lists.openembedded.org/g/openembedded-devel/message/112434">https://lists.openembedded.org/g/openembedded-devel/message/112434</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/108578006/3618223">https://lists.openembedded.org/mt/108578006/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-tEAVRnlRB6k9iQTAAO94--


