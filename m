Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id D506E78D07
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:30:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 00:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,431,1526367600"; d="scan'208";a="76318017"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.171])
	([10.221.21.171])
	by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2018 00:30:53 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
References: <cover.1533107855.git.hongxu.jia@windriver.com>
	<b21e882250b5c5ec59e6c7613b472a60266ad845.1533107855.git.hongxu.jia@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ba1c6a51-5eb8-dc14-bf58-4e3530ad880e@intel.com>
Date: Wed, 1 Aug 2018 15:30:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b21e882250b5c5ec59e6c7613b472a60266ad845.1533107855.git.hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/16] dconf 0.18.0 -> 0.28.0
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
X-List-Received-Date: Wed, 01 Aug 2018 07:30:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2018 03:21 PM, Hongxu Jia wrote:
> - Remove dconf-editor
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 36 --------------------------
>  meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb | 23 ++++++++++++++++
>  2 files changed, 23 insertions(+), 36 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
> 
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
> deleted file mode 100644
> index e24bde4..0000000
> --- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY = "configuation database system"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> -
> -SECTION = "x11/gnome"
> -
> -inherit gnomebase gsettings
> -SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
> -SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
> -GNOME_COMPRESS_TYPE = "xz"
> -
> -DEPENDS = "dbus glib-2.0 libxml2 intltool-native"
> -
> -inherit vala gtk-doc distro_features_check
> -
> -PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "editor", "", d)}"
> -
> -#note: editor will be removed in version 0.23.1
> -PACKAGECONFIG[editor] = "--enable-editor,--disable-editor,gtk+3"
> -
> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains("PACKAGECONFIG", "editor", "x11", "", d)}"
> -
> -EXTRA_OECONF += "--disable-man"
> -
> -PACKAGES =+ "${@bb.utils.contains("DISTRO_FEATURES", "x11", "dconf-editor", "", d)}"
> -
> -FILES_${PN} += " \
> -    ${datadir}/dbus-1 \
> -    ${libdir}/gio/modules/*.so \
> -    ${datadir}/bash-completion \
> -"
> -FILES_dconf-editor = " \
> -    ${bindir}/dconf-editor \
> -    ${datadir}/icons \
> -"
> -FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
> new file mode 100644
> index 0000000..856494c
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "configuation database system"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +SECTION = "x11/gnome"
> +
> +inherit gnomebase gsettings
> +SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
> +SRC_URI[archive.sha256sum] = "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
> +GNOME_COMPRESS_TYPE = "xz"
> +
> +DEPENDS = "dbus glib-2.0 intltool-native"
> +
> +inherit vala meson
> +
> +EXTRA_OECONF += "--disable-man"

This won't have any affect if this is using meson. You can also just set
GNOMEBASEBUILDCLASS=meson and skip inheriting meson here.

> +
> +FILES_${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${libdir}/gio/modules/*.so \
> +    ${datadir}/bash-completion \

bash-completion.bbclass should be inherited instead ...

> +"
> +FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
> 


