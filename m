Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05D09600EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 07:46:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jan 2018 23:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,362,1511856000"; d="scan'208";a="21502729"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.145])
	([10.221.21.145])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2018 23:46:50 -0800
To: openembedded-devel@lists.openembedded.org
References: <1515664514-79764-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <6c308618-ce08-efaf-fa8a-7a329720ad79@intel.com>
Date: Mon, 15 Jan 2018 15:46:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515664514-79764-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH v2] nautilus: new add
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
X-List-Received-Date: Mon, 15 Jan 2018 07:46:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/2018 05:55 PM, zhengrq wrote:
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
> +LICENSE="GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=36cf660aea2b8beffba7945f44a7e748 \
> +                    file://COPYING.EXTENSIONS;md5=7579d6678402a1868631bf82c93ff0d4 \
> +                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
> +

These license files point to a GPLv2 license.

Thanks,
Anuj

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


