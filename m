Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF5879980
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 06:06:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7G66mhN024499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Aug 2019 23:06:48 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 15 Aug 2019 23:06:47 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
	<20190815215605.19600-11-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c58bea78-1db2-ee2e-f26f-ec6c323018e3@windriver.com>
Date: Fri, 16 Aug 2019 14:06:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815215605.19600-11-schnitzeltony@gmail.com>
Subject: Re: [PATCH 10/13] parole: upgrade 1.0.2 -> 1.0.4
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
X-List-Received-Date: Fri, 16 Aug 2019 06:06:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/16 上午5:56, Andreas Müller wrote:
> Bufixe release

A typo here. Others are fine with me.

Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,
Kai



>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   .../parole/{parole_1.0.2.bb => parole_1.0.4.bb}       | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>   rename meta-xfce/recipes-multimedia/parole/{parole_1.0.2.bb => parole_1.0.4.bb} (72%)
>
> diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
> similarity index 72%
> rename from meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
> rename to meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
> index a286a5adb..68556a2ab 100644
> --- a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
> +++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
> @@ -1,15 +1,12 @@
>   DESCRIPTION = "Parole is a modern simple media player based on the GStreamer framework"
> -HOMEPAGE = "http://goodies.xfce.org/projects/applications/parole"
> +HOMEPAGE = "https://docs.xfce.org/apps/parole/start"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>   
>   inherit xfce-app gtk-doc mime
>   
>   DEPENDS += " \
> -    glib-2.0 \
>       dbus-glib \
> -    gtk+3 \
> -    \
>       xfce4-dev-tools-native \
>       libxfce4util \
>       libxfce4ui \
> @@ -19,8 +16,8 @@ DEPENDS += " \
>       taglib \
>   "
>   
> -SRC_URI[md5sum] = "cd22ab579470c5728db0aa6c0b9d4c7d"
> -SRC_URI[sha256sum] = "bff0fc846d0d7b8f435ac5514976f1cd1d82b62dbf1b7d470e253a5b439407da"
> +SRC_URI[md5sum] = "c23621eb44df292f828e86074d4e719d"
> +SRC_URI[sha256sum] = "e92b8ec369e53d921b47d2473c2e2a1e9e04d3c5d536d419abdff40e5e136dc1"
>   
>   RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
>   
> @@ -31,6 +28,6 @@ PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
>   PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
>   
>   FILES_${PN} += " \
> -    ${datadir}/appdata \
> +    ${datadir}/metainfo \
>       ${libdir}/parole-0/*.so \
>   "


-- 
Kai Kang


