Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1RqRk6-0001iU-3J; Thu, 26 Jan 2012 17:00:06 +0100
Received: by vcbfk26 with SMTP id fk26so487830vcb.6
	for <multiple recipients>; Thu, 26 Jan 2012 07:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YlTGwhyXJ64cdfcvJYMF1hYA0R8RGw0H3xA6qDYRRzU=;
	b=ejsGSpZQ4K3oC+IR3HIk4ns5GQ/Z7sULS9GE/ViaV3yAyhYBmnWZGK5tnRO/lh8s2v
	Lr0KhZsCCkJUEtCkdbvMp8u5NBiZZwwGEw4riGgLUEdPeUCgbN3zUlaKCkBxBlTfA1IM
	QEEas6Qj29T0/SYxm5BxYt5NNTRpaHNneMV8A=
MIME-Version: 1.0
Received: by 10.220.154.135 with SMTP id o7mr1492759vcw.2.1327589745742; Thu,
	26 Jan 2012 06:55:45 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Thu, 26 Jan 2012 06:55:45 -0800 (PST)
Date: Thu, 26 Jan 2012 15:55:45 +0100
Message-ID: <CACW_hTYUec2LiZCzA42DP1o8G59QK7awNCcFi4VD2t5q3zYYvw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: DEFAULT_PREFERENCE = -1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 16:00:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Triggered by the discussion on oe devel on splitting meta-oe I decided to
do some quick greps on who uses DEFAULT_PREFERENCE in oe-core and meta-oe.

Below are the results.
My questions:
- are recipes with D_P = -1 good enough to enter oe core and/or meta oe.
- is it desirable to have a D_P -1 in an inc file (as happens in
mesa-dri.inc)

Best regards, Frans.

PS: I found the -2 ones especially odd. This seems only useful if there is
someone else already with a -1, which might make the recipe even more
questionable.

frans@frans-desktop:~/workspace$ grep -r DEFAULT_PREFERENCE
openembedded-core
openembedded-core/meta/recipes-core/uclibc/uclibc_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-kernel/oprofile/oprofile_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-connectivity/gypsy/gypsy_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-qt/qt4/qt4-native_4.8.0.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/mutter/mutter_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/xcb/libxcb_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/xcb/xcb-proto_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/clutter/cogl_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/clutter/clutter_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/mesa/mesa-dri_git.bb:DEFAULT_PREFERENCE
= "-2"
openembedded-core/meta/recipes-graphics/mesa/mesa-dri.inc:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/mesa/qemugl_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-graphics/mesa/mesa-xlib_git.bb:DEFAULT_PREFERENCE
= "-2"
openembedded-core/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-devtools/qemu/qemu_git.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-devtools/subversion/subversion_1.7.2.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb:DEFAULT_PREFERENCE
= "-1"
openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:DEFAULT_PREFERENCE
= "-1"
frans@frans-desktop:~/workspace$ grep -r DEFAULT_PREFERENCE
meta-openembedded/
meta-openembedded/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-efl/recipes-efl/efl/eet_svn.bb:DEFAULT_PREFERENCE =
"-1"
meta-openembedded/meta-efl/recipes-efl/efl/eina_svn.bb:DEFAULT_PREFERENCE =
"-1"
meta-openembedded/meta-efl/recipes-efl/efl/edbus_svn.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-efl/recipes-efl/efl/efreet_svn.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-efl/recipes-efl/efl/edje_svn.bb:DEFAULT_PREFERENCE =
"-1"
meta-openembedded/meta-efl/recipes-efl/efl/embryo_svn.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-efl/recipes-efl/efl/eeze_svn.bb:DEFAULT_PREFERENCE =
"-1"
meta-openembedded/meta-efl/recipes-efl/efl/evas_svn.bb:DEFAULT_PREFERENCE =
"-1"
meta-openembedded/meta-efl/recipes-efl/efl/eio_svn.bb:DEFAULT_PREFERENCE =
"-1"
meta-openembedded/meta-efl/recipes-efl/efl/ecore_svn.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-oe/recipes-graphics/tslib/tslib_git.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.8.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/contrib/oe-stylize.py:    'DEFAULT_PREFERENCE',
meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:DEFAULT_PREFERENCE
= "-1"
meta-openembedded/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb:DEFAULT_PREFERENCE
= "-1"

