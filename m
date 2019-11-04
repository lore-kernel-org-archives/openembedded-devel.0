Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD2E77F230
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 00:44:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA40ipDg003573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2019 16:44:53 -0800
Received: from [128.224.158.136] (128.224.158.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 3 Nov 2019 16:44:51 -0800
To: Adrian Bunk <bunk@stusta.de>, <openembedded-devel@lists.openembedded.org>
References: <20191028221629.24134-1-bunk@stusta.de>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <1134f258-9f35-d410-cb1d-6d6e6e28f638@windriver.com>
Date: Mon, 4 Nov 2019 08:39:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028221629.24134-1-bunk@stusta.de>
Subject: Re: [meta-xfce][PATCH] xfce-polkit: Upgrade 0.2 -> 0.3
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
X-List-Received-Date: Mon, 04 Nov 2019 00:44:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/10/29 上午6:16, Adrian Bunk wrote:
> Patch applied upstream removed.

Fine with me.

Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,
Kai


>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../files/0001-fix-Name-Comment-fields.patch  | 34 -------------------
>   ...{xfce-polkit_0.2.bb => xfce-polkit_0.3.bb} |  3 +-
>   2 files changed, 1 insertion(+), 36 deletions(-)
>   delete mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
>   rename meta-xfce/recipes-apps/xfce-polkit/{xfce-polkit_0.2.bb => xfce-polkit_0.3.bb} (77%)
>
> diff --git a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch b/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
> deleted file mode 100644
> index e872249d5..000000000
> --- a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From fb1f83c04dd5262897b09e60fa8b39090d0d4619 Mon Sep 17 00:00:00 2001
> -From: Rex Dieter <rdieter@math.unl.edu>
> -Date: Thu, 12 Nov 2015 13:53:03 -0600
> -Subject: [PATCH] fix Name/Comment fields
> -
> -Validate as a valid .desktop file per
> -http://standards.freedesktop.org/desktop-entry-spec/latest/
> -
> -See also issue #2
> -
> -Upstream-Status: Applied [1]
> -
> -[1] https://github.com/ncopa/xfce-polkit/commit/fb1f83c04dd5262897b09e60fa8b39090d0d4619
> ----
> - xfce-polkit.desktop.in | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/xfce-polkit.desktop.in b/xfce-polkit.desktop.in
> -index 8575896..dd9f09c 100644
> ---- a/xfce-polkit.desktop.in
> -+++ b/xfce-polkit.desktop.in
> -@@ -1,7 +1,7 @@
> - [Desktop Entry]
> - Type=Application
> --_Name=XFCE PolKit
> --_Comment=Policykit Authentication Agent
> -+Name=XFCE PolKit
> -+Comment=Policykit Authentication Agent
> - Exec=@xfce_polkit_libexecdir@/xfce-polkit
> - Icon=gtk-dialog-authentication
> - NotShowIn=GNOME;KDE;
> ---
> -2.14.3
> -
> diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> similarity index 77%
> rename from meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> rename to meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> index 62d8d6de9..3a396c0f7 100644
> --- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> +++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> @@ -9,7 +9,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
>   
>   SRC_URI = " \
>       git://github.com/ncopa/${BPN}.git \
> -    file://0001-fix-Name-Comment-fields.patch \
>   "
> -SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
> +SRCREV = "6d3282cc1734c305850d48f5bf4b4d94e88885e9"
>   S = "${WORKDIR}/git"


-- 
Kai Kang


