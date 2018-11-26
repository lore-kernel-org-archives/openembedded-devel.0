Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id C6CFB6B3D1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=+4hJe40g9djE8gIhDaQYb33EAUK9sbYTKViT8BalzBA=; 
	b=N3W/k3CEoyRrgXl8ryxwjVxccI9iz/kyMDanPo/JxS/rSB/QgPgOlrb8d1Nopmk7Wg7HjGVXmFyPfQS5yGO05BA+2cqrigfqp28VnUfuDN0QCNe6xMo9o8pKx/oQX6xZl8s8IPGIBenEbTt3j/tjOOX9KZ/RzDYmK5swUzDruzPhgNMIHUWhzNA0RD320CHO6FMM/DDFPqh41O4QqG9zOddtdlp9WKj17jkXqo4QibBjTYmATIgS4prT4jpmiTcdkOreXzPcsE5LuQjCawqBAAFhfhTQnXLqNzNQv998SJXUmnJu7dpNgPVSlTK0RjTTzKZ6ajhN7Zfd1B9nOQsQ5w==;
Received: from 6.27.165.83.dynamic.reverse-mundo-r.com ([83.165.27.6]
	helo=[192.168.9.78]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1gRJTW-0006un-A8; Mon, 26 Nov 2018 17:11:06 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>
References: <cover.1541767729.git.psaavedra@igalia.com>
	<1fba7108a107251c7a300cd70decaebe642dbb5e.1541767729.git.psaavedra@igalia.com>
	<CAMKF1srY7H72yjacOg7m4YmsiYEft57zHwyqVLVEnYTU_ov-Kg@mail.gmail.com>
	<02227f789917fc833db31f190c896f9207c7f65b.camel@igalia.com>
Message-ID: <4023b776-e927-4457-ac70-269853598bdb@igalia.com>
Date: Mon, 26 Nov 2018 17:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <02227f789917fc833db31f190c896f9207c7f65b.camel@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH 2/6] ibus: add ibus recipe
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
X-List-Received-Date: Mon, 26 Nov 2018 16:11:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I can fix this problem with this patch:


diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb 
b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
index 579773d38..d42f87ae5 100644
--- a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
+++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
@@ -16,10 +16,10 @@ inherit autotools pkgconfig gettext 
gobject-introspection gtk-immodules-cache gt

  REQUIRED_DISTRO_FEATURES = "x11"

-DEPENDS = " anthy ibus gobject-introspection python-pygobject 
adwaita-icon-theme"
+DEPENDS = " anthy ibus gobject-introspection adwaita-icon-theme"
  RDEPENDS_${PN} += " ibus takao-fonts anthy libanthy0"

-DEPENDS_append_class-target = " intltool-native python-pygobject-native 
qemu-native"
+DEPENDS_append_class-target = " intltool-native qemu-native"

  do_configure_prepend() {
      export PYTHON=python2
diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb 
b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
index 598629344..85ef8489e 100644
--- a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
+++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
@@ -12,8 +12,8 @@ inherit autotools pkgconfig gettext 
gtk-immodules-cache gobject-introspection gt

  REQUIRED_DISTRO_FEATURES = "x11"

-DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify 
python-pygobject python3-pygobject adwaita-icon-theme librsvg"
-DEPENDS_append_class-target = " intltool-native python3-pygobject-native"
+DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf libnotify 
python3-pygobject adwaita-icon-theme librsvg"
+DEPENDS_append_class-target = " intltool-native"
  RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"

  PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"



but unfortunately I find out unexpected obstacle with the dconf 
postinstall script. I filled a issue where I describe the issue:

   https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040


On 13/11/18 10:11, psaavedra wrote:
> It seems python3 is provided by to packages
>
>    conflicts between attempted installs of python-pygobject-3.28.3-
> r0.core2_64 and python3-pygobject-3.28.3-r0.core2_64
>
>
> I'll investigate about this.
>
> On Fri, 2018-11-09 at 17:11 -0800, Khem Raj wrote:
>> This is failing
>> http://errors.yoctoproject.org/Errors/Details/199681/
>>
>> It seems its including both py3 and py2 version of pygobject and
>> there
>> are conflicting files in these two
>> I am adding Changqing touched this recipe last time so looking for
>> some more info on that.
>> On Fri, Nov 9, 2018 at 5:15 AM Pablo Saavedra <psaavedra@igalia.com>
>> wrote:
>>> Intelligent Input Bus for Linux/Unix
>>> https://github.com/ibus/ibus/wiki
>>>
>>> Collision with: https://patchwork.openembedded.org/patch/155947/
>>> ---
>>>   meta-oe/recipes-support/ibus/ibus_1.5.19.bb | 97
>>> +++++++++++++++++++++++++++++
>>>   1 file changed, 97 insertions(+)
>>>   create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
>>>
>>> diff --git a/meta-oe/recipes-support/ibus/ibus_1.5.19.bb b/meta-
>>> oe/recipes-support/ibus/ibus_1.5.19.bb
>>> new file mode 100644
>>> index 000000000..598629344
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/ibus/ibus_1.5.19.bb
>>> @@ -0,0 +1,97 @@
>>> +DESCRIPTION = "A multilingual user input method library"
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>> +SECTION = "inputmethods"
>>> +
>>> +SRC_URI = "
>>> https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz
>>>   \
>>> +          "
>>> +SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
>>> +SRC_URI[sha256sum] =
>>> "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
>>> +
>>> +inherit autotools pkgconfig gettext gtk-immodules-cache gobject-
>>> introspection gtk-doc gtk-icon-cache gsettings
>>> +
>>> +REQUIRED_DISTRO_FEATURES = "x11"
>>> +
>>> +DEPENDS = " intltool dbus-glib python3-dbus iso-codes dconf
>>> libnotify python-pygobject python3-pygobject adwaita-icon-theme
>>> librsvg"
>>> +DEPENDS_append_class-target = " intltool-native python3-pygobject-
>>> native"
>>> +RDEPENDS_${PN} += " iso-codes adwaita-icon-theme librsvg-gtk"
>>> +
>>> +PACKAGECONFIG[gtk+] = ",--disable-gtk2,gtk+,gtk+"
>>> +PACKAGECONFIG[gtk+3] = ",--disable-gtk3,gtk+3,gtk+3"
>>> +PACKAGECONFIG[wayland] = "--enable-wayland,,wayland,wayland"
>>> +
>>> +PACKAGECONFIG ?= "gtk+ gtk+3"
>>> +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES',
>>> 'wayland', 'wayland', '', d)}"
>>> +
>>> +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG',
>>> 'gtk+', 'ibus-gtk2.0', '', d)}"
>>> +GTKIMMODULES_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG',
>>> 'gtk+3', 'ibus-gtk3', '', d)}"
>>> +
>>> +EXTRA_OECONF += " \
>>> +    --disable-emoji-dict \
>>> +    --disable-unicode-dict \
>>> +"
>>> +
>>> +BBCLASSEXTEND = "native pythonnative"
>> pythonnative does not belong here. It should probably be in inherit
>> and it should be
>> python3native since below the recipe seems to set PYTHON=python3
>>
>>> +
>>> +FILES_${PN} += " \
>>> +    ${sysconfdir}/dconf/profile \
>>> +    ${sysconfdir}/dconf/db/ibus.d/00-upstream-settings \
>>> +    ${sysconfdir}/dconf/profile/ibus \
>>> +    ${libdir}/libibus-1.0.so.5.0.518 \
>>> +    ${libdir}/libibus-1.0.so.5 \
>>> +    ${libdir}/gtk-?.?/*/immodules/im-ibus.so \
>>> +    ${bindir}/ibus \
>>> +    ${bindir}/ibus-setup \
>>> +    ${bindir}/ibus-daemon \
>>> +    ${datadir}/ibus/engine \
>>> +    ${datadir}/ibus/component \
>>> +    ${datadir}/ibus/setup \
>>> +    ${datadir}/ibus/component/gtkpanel.xml \
>>> +    ${datadir}/ibus/component/simple.xml \
>>> +    ${datadir}/ibus/component/dconf.xml \
>>> +    ${datadir}/ibus/setup/emojilang.py \
>>> +    ${datadir}/ibus/setup/main.py \
>>> +    ${datadir}/ibus/setup/enginecombobox.py \
>>> +    ${datadir}/ibus/setup/setup.ui \
>>> +    ${datadir}/ibus/setup/enginedialog.py \
>>> +    ${datadir}/ibus/setup/i18n.py \
>>> +    ${datadir}/ibus/setup/engineabout.py \
>>> +    ${datadir}/ibus/setup/icon.py \
>>> +    ${datadir}/ibus/setup/keyboardshortcut.py \
>>> +    ${datadir}/ibus/setup/enginetreeview.py \
>>> +    ${datadir}/ibus/keymaps/jp \
>>> +    ${datadir}/ibus/keymaps/kr \
>>> +    ${datadir}/ibus/keymaps/common \
>>> +    ${datadir}/ibus/keymaps/modifiers \
>>> +    ${datadir}/ibus/keymaps/us \
>>> +    ${datadir}/ibus/keymaps/in \
>>> +    ${datadir}/applications/ibus-setup.desktop \
>>> +    ${datadir}/dbus-1/services/org.freedesktop.IBus.service \
>>> +    ${datadir}/dbus-1/services/org.freedesktop.portal.IBus.service
>>> \
>>> +    ${datadir}/vala/vapi/ibus-1.0.vapi \
>>> +    ${datadir}/vala/vapi/ibus-1.0.deps \
>>> +    ${libexecdir}/ibus-engine-simple \
>>> +    ${libexecdir}/ibus-portal \
>>> +    ${libexecdir}/ibus-dconf \
>>> +    ${libexecdir}/ibus-x11 \
>>> +    ${libexecdir}/ibus-ui-gtk3 \
>>> +    ${datadir}/GConf/gsettings/ibus.convert \
>>> +    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.gschema.xml \
>>> +    ${datadir}/bash-completion/* \
>>> +    ${datadir}/icons/* \
>>> +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py \
>>> +    ${libdir}/python?.?/????-packages/gi/overrides/IBus.py? \
>>> +"
>> may be we can just package directories and avoid this long list.
>>
>>> +
>>> +do_configure_prepend() {
>>> +    export PYTHON=python3
>>> +}
>>> +
>>> +do_install_append() {
>>> +  # Fix the installation path of the GObject Inspection overrides
>>> for Python3
>>> +  python_version=$(python3 -c 'import sys; print("%s.%s" %
>>> (sys.version_info.major, sys.version_info.minor))')
>>> +  mkdir -p ${D}/usr/lib/python${python_version}/site-
>>> packages/gi/overrides
>>> +  mv
>>> ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-
>>> packages/gi/overrides/IBus.py
>>> ${D}/usr/lib/python${python_version}/site-packages/gi/overrides/
>> why do we need to move files from native sysroot in here ? arent they
>> available in build area or staging
>> area for build ?
>>
>>> +  rm -rf
>>> ${D}/${RECIPE_SYSROOT_NATIVE}/usr/lib/python${python_version}/site-
>>> packages/gi/overrides
>>> +  find ${D} -type d -empty -delete
>> dealing with native sysroot and deleting files does not look right
>> here.
>>
>>> +}
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

-- 
Pablo Saavedra Rodiño
psaavedra@igalia.com | Mail
+34 630 566 474      | Phone


