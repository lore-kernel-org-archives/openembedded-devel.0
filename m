Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B07A7F821
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 06:08:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBG68f4u023689
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 22:08:41 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 15 Dec 2019 22:08:40 -0800
To: <changqing.li@windriver.com>, <openembedded-devel@lists.openembedded.org>
References: <1576476271-69830-1-git-send-email-changqing.li@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <a420201f-c4cd-429a-cc44-7ec2f8d18f02@windriver.com>
Date: Mon, 16 Dec 2019 14:07:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1576476271-69830-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [meta-xfce][PATCH] xfce4-kbdleds-plugin: remove this recipe
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
X-List-Received-Date: Mon, 16 Dec 2019 06:08:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/12/16 下午2:04, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> According to https://xfce.org/about/news,  xfce4-kbdleds-plugin has
> been dropped
>
> Acked-by: Kai Kang <kai.kang@windriver.com>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

Fine with me. Thanks.

Acked-by: Kai Kang <kai.kang@windriver.com>

Kai


> ---
>   .../kbdleds/xfce4-kbdleds-plugin_0.0.6.bb                 | 15 ---------------
>   .../packagegroups/packagegroup-xfce-extended.bb           |  1 -
>   2 files changed, 16 deletions(-)
>   delete mode 100644 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
>
> diff --git a/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
> deleted file mode 100644
> index caf5508..0000000
> --- a/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "XFCE panel plugin displaying status of keyboard LEDs"
> -DESCRIPTION = "This plugin shows the state of your keyboard LEDs: Caps, Scroll and Num Lock in Xfce panel"
> -HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-kbdleds-plugin"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = " \
> -    file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -    file://COPYING.LIB;md5=252890d9eee26aab7b432e8b8a616475 \
> -"
> -
> -inherit xfce-panel-plugin
> -
> -SRC_URI[md5sum] = "db6ad8e3502f3373f087ba2034141552"
> -SRC_URI[sha256sum] = "6d280ad7207bcb9cc87c279dc3ab9084fd93325e87f67858e8917729b50201cd"
> -
> -FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-kbdleds-plugin"
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> index 42f20c9..255d2b5 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> @@ -45,7 +45,6 @@ RRECOMMENDS_${PN} = " \
>       xfce4-notes-plugin \
>       xfce4-whiskermenu-plugin \
>       xfce4-mailwatch-plugin \
> -    xfce4-kbdleds-plugin \
>       xfce4-smartbookmark-plugin \
>       xfce4-hotcorner-plugin \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \


-- 
Kai Kang


