Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 40942600EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 20:58:30 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id EF6BC4CA5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 22:58:31 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1502311573-14071-1-git-send-email-dv@pseudoterminal.org>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <b1028086-be63-069e-5a83-4e65321062c2@pseudoterminal.org>
Date: Wed, 9 Aug 2017 22:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502311573-14071-1-git-send-email-dv@pseudoterminal.org>
Subject: Re: [meta-qt5][PATCH] gstreamer1.0-plugins-bad: add qt5 packageconfig
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
X-List-Received-Date: Wed, 09 Aug 2017 20:58:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Note: This is only a draft, since there are two unanswered questions:

1) If the qt5 packageconfig is enabled, OpenGL (or GLES2) is needed. So 
if qt5 is added to the PACKAGECONFIG variable, then PACKAGECONFIG_GL 
would also have to be added to PACKAGECONFIG if no OpenGL/GLES 
packageconfig isn't already in the PACKAGECONFIG variable. I have no 
idea how do that. Perhaps in a python () { } function ?

2) I think it would make sense to add the qt5 packageconfig to the list 
of default packageconfigs here. The idea being that if you add meta-qt5, 
then gst-plugins-bad's QML plugin is automatically enabled. But I do not 
know how to append, since the PACKAGECONFIG is assigned with the "=??" 
operator ... but what would then the right operator for appending? 
_append ? += ? Isn't "_append" "stronger" than "=??" ?


On 2017-08-09 22:46, Carlos Rafael Giani wrote:
> This adds a new command line switch to the configure script to make sure
> moc, uic, rcc are searched in the right native sysroot path
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>   ...dd-cmdline-argument-for-setting-host-path.patch | 34 ++++++++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-bad_%.bbappend  |  6 ++++
>   2 files changed, 40 insertions(+)
>   create mode 100644 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch
>   create mode 100644 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
>
> diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch
> new file mode 100644
> index 0000000..ba51945
> --- /dev/null
> +++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch
> @@ -0,0 +1,34 @@
> +From 5c01d6effe44a8364c03194decfe82d1e4f2071e Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Wed, 9 Aug 2017 22:15:31 +0200
> +Subject: [PATCH] configure: Add cmdline argument for setting host path prefix
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + configure.ac | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9c789d0..4a2c8b6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2963,6 +2963,14 @@ AG_GST_CHECK_FEATURE(QT, [Qt elements], qt, [
> +   PKG_CHECK_MODULES(QT, Qt5Core Qt5Gui Qt5Qml Qt5Quick >= 5.4.0, [
> +       QT_PATH=`$PKG_CONFIG --variable=exec_prefix Qt5Core`
> +       QT_HOST_PATH=`$PKG_CONFIG --variable=host_bins Qt5Core`
> ++      AC_ARG_WITH([qt-target-path-prefix],
> ++        AS_HELP_STRING([--with-qt-target-path-prefix],[Qt target path prefix to use])
> ++      )
> ++      AC_ARG_WITH([qt-host-path-prefix],
> ++        AS_HELP_STRING([--with-qt-host-path-prefix],[Qt host path prefix to use]),
> ++        [AS_IF([test "x$with_qt_host_path_prefix" != "x"],
> ++               [QT_HOST_PATH="$with_qt_host_path_prefix/$QT_HOST_PATH"])]
> ++      )
> +       AC_PATH_PROGS(MOC, [moc-qt5 moc], moc, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
> +       AC_PATH_PROGS(RCC, [rcc-qt5 rcc], rcc, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
> +       AC_PATH_PROGS(UIC, [uic-qt5 uic], uic, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
> +--
> +2.7.4
> +
> diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
> new file mode 100644
> index 0000000..8ac7ba1
> --- /dev/null
> +++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
> @@ -0,0 +1,6 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://0001-configure-Add-cmdline-argument-for-setting-host-path.patch"
> +
> +# NOTE: the GStreamer Qt5 plugin needs OpenGL
> +PACKAGECONFIG[qt5] = '--enable-qt --with-qt-host-path-prefix="${RECIPE_SYSROOT_NATIVE}",--disable-qt,qtbase qtdeclarative qtbase-native'


