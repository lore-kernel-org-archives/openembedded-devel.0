Return-Path: <sveinse@seldal.com>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Aug 2017 19:27:04 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF84719AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 19:27:04 +0000 (UTC)
Received: from 156.92-221-160.customer.lyse.net ([92.221.160.156]:56290
	helo=[10.5.5.194]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <sveinse@seldal.com>) id 1dfA4a-0001qj-SM
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Aug 2017 21:21:48 +0200
From: Svein Seldal <sveinse@seldal.com>
To: openembedded-devel@lists.openembedded.org
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
	<1502153954-2796-7-git-send-email-mickey.happygolucky@gmail.com>
Message-ID: <56add783-540c-e01d-d504-97e757a258dc@seldal.com>
Date: Tue, 8 Aug 2017 21:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502153954-2796-7-git-send-email-mickey.happygolucky@gmail.com>
Subject: Re: [PATCH 6/6] uim: Fixed a problem that an immodule.cache is not updated appropriately when uim-gtk2.0 or uim-gtk3 was installed.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Aug 2017 19:27:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

FYI, We've had some problems building uim and anthy in our image, and we 
had to apply the patch below.

Noteable changes are:
   - Change SRC_URI, the uim.googlecode.com URL gives us a 404
   - Add PACKAGECONFIG to be able to control better which features and 
DEPENDS to include. Notibly x11, gtk3, anthy and libedit are selectable.

This patch is no way perfect and complete, but it solved the dependency 
issue we were having with anthy. Especially since we are using uim 
without x11 or gtk3. Use this as inspiration at your discression.

Best regards,
Svein Seldal


diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb 
b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index ed846b9..78da142 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD-3-Clause & LGPLv2+"
  LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
  SECTION = "inputmethods"

-SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2"
+SRC_URI = 
"https://github.com/uim/uim/releases/download/${BP}/${BP}.tar.bz2 \
+          "

  SRC_URI_append_class-target = " file://uim-module-manager.patch \
      file://0001-fix-bug-for-cross-compile.patch \
@@ -13,11 +14,7 @@ SRC_URI_append_class-target = " 
file://uim-module-manager.patch \
  SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
  SRC_URI[sha256sum] = 
"7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"

-DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
-DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native takao-fonts"
-
-RDEPENDS_uim = "libuim0 libedit"
-RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
+DEPENDS = "fontconfig glib-2.0 ncurses intltool-native uim-native"

  LEAD_SONAME = "libuim.so.1"

@@ -30,9 +27,20 @@ EXTRA_OECONF += "--disable-emacs \
      --without-canna \
      --without-mana \
      --without-eb \
+
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xft gtk3', '', d)} \
+    libedit \
+    anthy \
+"
+PACKAGECONFIG_class-native ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xft', '', d)} \
  "

-CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"
+PACKAGECONFIG[x11]     = ",,libxft libxt"
+PACKAGECONFIG[gtk3]    = ",--without-gtk2 --with-gtk3=no,gtk+ gtk+3"
+PACKAGECONFIG[anthy]   = 
"--with-anthy-utf8,--without-anthy,anthy,takao-fonts"
+PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"

  #Because m4 file's find maxdepth=2, so copy the m4 files of the deep 
depth.
  do_configure_prepend () {
@@ -43,6 +51,9 @@ do_install_append() {
      rm -rf ${D}/${datadir}/applications
  }

+# UIM fails with a race when installing with multiple
+PARALLEL_MAKEINST = ""
+
  PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep 
uim-common uim-anthy libuim0 libuim-dev"

  FILES_${PN} = "${bindir}/uim-help \



On 08. aug. 2017 02:59, Yusuke Mitsuki wrote:
> pkg_postinst_uim-gtk2.0 is not worked. Plus, uim-gtk3 is not supported.
> oe-core has gtk-immodule-cache class for update the immodule.cache.
> Modified to use the this class instead of pkg_post_uim-gtk2.0 and added support to uim-gtk3.
> 
> Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
> ---
>   meta-oe/recipes-support/uim/uim_1.8.6.bb | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> index 3d6425c..6b04f6e 100644
> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> @@ -21,7 +21,8 @@ RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0 glibc-utils glibc-gconv-euc-jp
>   
>   LEAD_SONAME = "libuim.so.1"
>   
> -inherit autotools pkgconfig gettext qemu
> +inherit autotools pkgconfig gettext qemu gtk-immodules-cache
> +GTKIMMODULES_PACKAGES = "uim-gtk2.0 uim-gtk3"
>   
>   EXTRA_OECONF += "--disable-emacs \
>       --without-scim \
> @@ -120,10 +121,6 @@ pkg_prerm_uim-anthy() {
>       fi
>   }
>   
> -pkg_postinst_uim-gtk2.0() {
> -    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> -}
> -
>   pkg_postinst_uim-skk() {
>       if test -n "$D"; then
>           ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
> 

