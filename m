Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 997616AE9E;
	Mon, 15 Jul 2013 09:03:11 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so2936645vbg.30
	for <multiple recipients>; Mon, 15 Jul 2013 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cEo4LDEcMgufQZWwBhJogZlAYzqYzLqTQHLwtbQ+IUc=;
	b=PlLLFlKGFUdCxjxTDVEG9wJhH65X+HYjYz+8OIHfNpnHy7ohyXA6nV9IBtf8m7rBgm
	MwkYapTGfojGP4SiTV2WwJ4DlIv0JSwqng54fOp8QaiB+hmGeYcH4jOLt9KCwECxFs85
	P12tB9To8BBlWCx+BsKlQvuph2P4c12GPEs7pwX5syWj41OvLGfXsSqwFR6S0aiy6QWB
	jVa16VST009y0CR1y2lPEt3hpfZTEYtQm21yKUUBzrhrdIKxU5iAlDLVmN7tUkFyzEdp
	cdDXZLhnzNMSQaOXMPyGJJ8Twdqm10+sh9T0qQMK/osj+7jo8a6I+9H1z20QSVLBqyh3
	CgUA==
MIME-Version: 1.0
X-Received: by 10.52.94.45 with SMTP id cz13mr24244307vdb.9.1373878991358;
	Mon, 15 Jul 2013 02:03:11 -0700 (PDT)
Received: by 10.52.236.136 with HTTP; Mon, 15 Jul 2013 02:03:11 -0700 (PDT)
In-Reply-To: <20130708083024.252B2502D7@opal>
References: <20130708083024.252B2502D7@opal>
Date: Mon, 15 Jul 2013 11:03:11 +0200
Message-ID: <CALbNGRT+FYkwWQzvaSUo0zarUx7MyNEJWjWs17M0cP2z6iYgBw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : qt-creator: add new recipe for version 2.7.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2013 09:03:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 8, 2013 at 10:30 AM,  <git@git.openembedded.org> wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 4d2b8ed90614a21d8d7d7c38d013c0c74d9ffffc
> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=4d2b8ed90614a21d8d7d7c38d013c0c74d9ffffc
>
> Author: Jonathan Liu <net147@gmail.com>
> Date:   Sat Jul  6 02:46:58 2013 +0000
>
> qt-creator: add new recipe for version 2.7.2
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ---
>
>  meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb |   30 +++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
> new file mode 100644
> index 0000000..2948d81
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "Lightweight, cross-platform integrated development environment"
> +
> +HOMEPAGE = "http://qt-project.org/"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b528 \
> +                    file://LICENSE.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
> +SECTION = "qt/app"
> +
> +SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.7/${PV}/${BP}-src.tar.gz"
> +SRC_URI[md5sum] = "7f1c10740784d3edf2347c27be21fd1a"
> +SRC_URI[sha256sum] = "5df913faa43a5fbf44fb1f25faaf6d258134b8f9e6b8ef8a21277136dec9e189"
> +
> +S = "${WORKDIR}/${BP}-src"
> +
> +inherit qt4x11
> +
> +do_install() {
> +       oe_runmake INSTALL_ROOT=${D}${prefix} install
> +       oe_runmake INSTALL_ROOT=${D}${prefix} install_docs
> +       rm -f ${D}${libdir}/qtcreator/lib*.so
> +}
> +
> +FILES_${PN} += "${datadir}/icons \
> +                ${datadir}/qtcreator \
> +                ${libdir}/qtcreator/*"
> +FILES_${PN}-dbg += "${datadir}/qtcreator/*/*/*/*/.debug \
> +                    ${libdir}/qtcreator/.debug \
> +                    ${libdir}/qtcreator/*/*/.debug"
> +RRECOMMENDS_${PN} += "packagegroup-core-buildessential \
> +                      packagegroup-qt-toolchain-target"
>
I get

Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| NOTE: using qmake spec in
/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/share/qt4/mkspecs/linux-gnueabi-oe-g++,
using profiles ''
| Project MESSAGE: Cannot build Qt Creator with Qt version .
| Project ERROR: Use at least Qt 4.8.0.
| ERROR: Error calling
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/qmake2
on qtcreator.pro
| ERROR: Function failed: do_configure (see
/home/andreas/tmp/oe-core-eglibc/work/cortexa8hf-vfp-neon-angstrom-linux-gnueabi/qt-creator/2.7.2-r0/temp/log.do_configure.29576
for further information)

Is it possible that iti is caused by checking host's qt version (this is 4.7.4)?

Andreas

