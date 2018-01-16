Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8FB77629
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 01:24:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0G1OIGA010896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 15 Jan 2018 17:24:18 -0800
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 15 Jan 2018 17:24:17 -0800
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1515664514-79764-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <d08ec2a9-7de1-307f-5884-58845ef2a64d@windriver.com>
Date: Tue, 16 Jan 2018 09:22:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515664514-79764-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Originating-IP: [128.224.162.134]
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
X-List-Received-Date: Tue, 16 Jan 2018 01:24:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年01月11日 17:55, zhengrq 写道:
> Add a new recipe nautilus.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   .../recipes-gnome/nautilus/nautilus_3.18.5.bb      | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
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
You could inherit gtk-doc to handle this.

//Yi

> +    --disable-update-mimedb \
> +    --disable-nst-extension \
> +    --enable-tracker=no \
> +    --disable-schemas-compile \
> +    --enable-xmp=no \
> +    --enable-libexif=no \
> +"
> +
> +FILES_${PN} += "${datadir}/*"


