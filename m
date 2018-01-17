Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBBD478555
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:24:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jan 2018 18:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,371,1511856000"; d="scan'208";a="166676317"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.145])
	([10.221.21.145])
	by orsmga004.jf.intel.com with ESMTP; 16 Jan 2018 18:24:15 -0800
To: openembedded-devel@lists.openembedded.org
References: <1515731012-91307-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <fbe27435-2fa2-002d-295a-ef9e90d26a7e@intel.com>
Date: Wed, 17 Jan 2018 10:24:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515731012-91307-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH v3] nautilus: new add
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
X-List-Received-Date: Wed, 17 Jan 2018 02:24:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/12/2018 12:23 PM, zhengrq wrote:
> Add a new recipe nautilus.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-gnome/nautilus/nautilus_3.18.5.bb      | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
> 
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
> new file mode 100644
> index 0000000..1119309
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "File manager for GNOME"
> +SECTION = "x11/gnome"
> +
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=36cf660aea2b8beffba7945f44a7e748 \
> +                    file://COPYING.EXTENSIONS;md5=7579d6678402a1868631bf82c93ff0d4 \
> +                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
> +
> +SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/nautilus/3.18/nautilus-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "0f578bda5655c0ce204befafca5803d7"
> +SRC_URI[sha256sum] = "60a927c0522b4cced9d8f62baed2ee5e2fd4305be4523eb5bc44805971a6cc15"
> +
> +DEPENDS = "gtk+3 gnome-desktop3 gsettings-desktop-schemas glib-2.0-native intltool-native pango"
> +
> +inherit distro_features_check autotools pkgconfig gobject-introspection
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +EXTRA_OECONF = " \
> +    --disable-gtk-doc \

As pointed out by others on both version of this patch, you can inherit
gtk-doc to handle this better.

Please also take a look at gnomebase.class that can handle some of the
things that are common to gnome recipes.

Thanks,
Anuj

> +    --disable-update-mimedb \
> +    --disable-nst-extension \
> +    --enable-tracker=no \
> +    --disable-schemas-compile \
> +    --enable-xmp=no \
> +    --enable-libexif=no \ 
> +"
> +
> +FILES_${PN} += "${datadir}/*"
> 


