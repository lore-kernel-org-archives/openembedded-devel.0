Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE6497FA3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:43:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xAM0haRm007244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2019 16:43:36 -0800 (PST)
Received: from [128.224.158.176] (128.224.158.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 21 Nov 2019 16:43:35 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191120233806.31207-1-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <bd0da757-4ac9-1ec2-fc0e-c60a30575b05@windriver.com>
Date: Fri, 22 Nov 2019 08:43:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120233806.31207-1-schnitzeltony@gmail.com>
Subject: Re: [meta-xfce][PATCH 1/2] exo: upgrade 0.12.8 -> 0.12.9
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
X-List-Received-Date: Fri, 22 Nov 2019 00:43:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/11/21 上午7:38, Andreas Müller wrote:
> Release notes for 0.12.9
> ========================
> Bug Fixes:
> - Explicitly depend on gio-unix-2.0 (Xfce #15825)
> - Fix alignment of multi-line filenames when text beside icons (Xfce
> - Fix cursor missing in search popup widget (Xfce #16068)
> - Fix desktop item creation on symbolic link directories
> - Fix excess clickable area of multiline filenames (Xfce #16075)
> - Fix issues with displaying icon view contents (Xfce #14737)
> - Fix prelight deactivation (Xfce #11806)
> - Hide search widget when doing a fullscreen resize (Xfce #15106)
> - Make user-created launchers executable by default
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>


Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,
Kai


> ---
>   meta-xfce/recipes-xfce/exo/{exo_0.12.8.bb => exo_0.12.9.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-xfce/recipes-xfce/exo/{exo_0.12.8.bb => exo_0.12.9.bb} (88%)
>
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
> similarity index 88%
> rename from meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
> rename to meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
> index fdd50d435..a12520417 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
> @@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
>       file://reduce-build-to-exo-csource-only.patch \
>   "
>   
> -SRC_URI[md5sum] = "e618ce760a12ac7427a48a44c69f3d31"
> -SRC_URI[sha256sum] = "3400a2e64aa41ede25bedaca4909bde7ea4f8698d9598d1b80f02a40ac89fcde"
> +SRC_URI[md5sum] = "9730f9d270b4968a8bbebe73e6de934f"
> +SRC_URI[sha256sum] = "9ba0bf0fd59aeb1cd32ae3863e7a78222655eb15eb675ba08f3b3fb933b6fbfe"
>   
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG_class-target ??= "gtk"


-- 
Kai Kang


