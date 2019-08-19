Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0527E721
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 01:40:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7J1eUqx009382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Aug 2019 18:40:30 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 18 Aug 2019 18:40:29 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
	<20190818223316.19772-9-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <96cad61a-5a33-88c5-4115-b0c5e78530d4@windriver.com>
Date: Mon, 19 Aug 2019 09:40:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818223316.19772-9-schnitzeltony@gmail.com>
Subject: Re: [meta-xfce][PATCH 08/10] xfce4-fsguard-plugin: upgrade 1.1.0 -> 1.1.1
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
X-List-Received-Date: Mon, 19 Aug 2019 01:40:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/19 上午6:33, Andreas Müller wrote:
> Announcement says it is a translation-updates-only-release but it seems they
> changed licence either.

It seems it intend to be BSD licence but see as GPLv3 wrongly by 
autotools before and fixed in this release.
See 
https://git.xfce.org/panel-plugins/xfce4-fsguard-plugin/commit/COPYING?id=7e437c26fcfe82f0a54656655c1e879570c632ed

Regards,
Kai


>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...d-plugin_1.1.0.bb => xfce4-fsguard-plugin_1.1.1.bb} | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.0.bb => xfce4-fsguard-plugin_1.1.1.bb} (33%)
>
> diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
> similarity index 33%
> rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
> rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
> index 8b924ac75..183d521af 100644
> --- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
> +++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
> @@ -1,9 +1,9 @@
>   DESCRIPTION = "The FSGuard panel plugin checks free space on a chosen mount point frequently and displays a message when a limit is reached"
> -HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin?&#recet_releases"
> -LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
>   
>   inherit xfce-panel-plugin
>   
> -SRC_URI[md5sum] = "c9fcc1ff37f38e6ed518eca3b9887aa8"
> -SRC_URI[sha256sum] = "6b038322b49d29625219e6a54497085b8f834b9c1fd15282ce286a6529d7c445"
> +SRC_URI[md5sum] = "d1e1fda4e80c36741643b1d9eca5c5c1"
> +SRC_URI[sha256sum] = "d6d05d0a90a68453d65cdceec5ca7eeaef864393ab62eef532a7ba58f374d516"


-- 
Kai Kang


