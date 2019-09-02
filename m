Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 000927F36C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 02:17:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x822H5G6001625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Sep 2019 19:17:16 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 1 Sep 2019 19:16:55 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190830101427.14200-1-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <09091b50-b2fd-4f65-469a-fc797b2c2540@windriver.com>
Date: Mon, 2 Sep 2019 10:15:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830101427.14200-1-schnitzeltony@gmail.com>
Subject: Re: [mexta-xfce][PATCH 1/3] imsettings: upgrade 1.7.3 -> 1.8.1 and rework recipe
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
X-List-Received-Date: Mon, 02 Sep 2019 02:17:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/30 下午6:14, Andreas Müller wrote:
> It is more or less a recipe rewrite:
>
> * stylize recipe
> * Use gtk3 instead of gtk
> * Drop gconf backend - we should get rid of orphaned gconf
> * Add PACKAGECONFIGs for 'xim' and 'xfce' - xfce is set by default
> * Drop intltool-native from depends - they moved to gettext
> * Remove entries from FILES - gobject-introspection.bbclass takes care
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...msettings_1.7.3.bb => imsettings_1.8.1.bb} | 22 ++++++++++---------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>   rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.3.bb => imsettings_1.8.1.bb} (64%)
>
> diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
> similarity index 64%
> rename from meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
> rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
> index 8f622bf6f..36cd7ad72 100644
> --- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
> +++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
> @@ -7,25 +7,27 @@ This package contains the core DBus services and some utilities."
>   HOMEPAGE = "http://code.google.com/p/imsettings/"
>   SECTION = "Applications/System"
>   
> -inherit autotools gtk-doc gobject-introspection distro_features_check
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>   
> -REQUIRED_DISTRO_FEATURES = "x11"
> +inherit autotools gtk-doc gobject-introspection gettext distro_features_check
>   
> -SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
> -           "
> +DEPENDS = "gtk+3 libnotify dbus-glib"

It seems it transited to gdbus a long time ago but we didn't update 
accordingly in imsettings recipe.

https://bitbucket.org/tagoh/imsettings/commits/ef1c6a125455fea998bcc1a26fc546f9e14a16cd

commit ef1c6a125455fea998bcc1a26fc546f9e14a16cd
Author: Akira TAGOH <akira@tagoh.org>
Date:   Wed Dec 22 19:59:40 2010 +0900

     GDBus transition and revising a lot of code.


Regards,
Kai



>   
> -SRC_URI[md5sum] = "c6c65a2b2654fe9dfe9ab2e8b80c079a"
> -SRC_URI[sha256sum] = "196d3a74cef254ff812c32682d1818d740e36a68b976fef9e99748d23a71a71a"
> +REQUIRED_DISTRO_FEATURES = "x11"
>   
> -LICENSE = "LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "c04341a008d8c60e1532f033f4020f44"
> +SRC_URI[sha256sum] = "ebf578299a10c6a1fea9047be6577df6d2b6470d3cc9d40f8a6589a3c13c4c8b"
>   
>   EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
>                   --disable-static \
>                  "
>   
> -DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf intltool-native"
> +PACKAGECONFIG ??= "xfce"
> +PACKAGECONFIG[xfce] = ",,xfconf"
> +PACKAGECONFIG[xim] = ",,libgxim"
>   
>   RDEPENDS_${PN} += "bash"
>   
> -FILES_${PN} += "${datadir}/dbus-1/* ${datadir}/gir-1.0/* ${libdir}/girepository-1.0/*"
> +FILES_${PN} += "${datadir}/dbus-1/*"


-- 
Kai Kang


